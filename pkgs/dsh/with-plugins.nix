{
  lib,
  stdenv,
  runCommandLocal,
  writeShellApplication,
  dsh,
  plugins,
}:
let
  pluginPatches = map (
    plugin:
    plugin.passthru.pluginPatch
      or (throw "dsh.withPlugins: ${plugin.name} does not expose passthru.pluginPatch")
  ) plugins;

  patch = runCommandLocal "dsh-with-plugins.cordis.patch.yml" { } (
    if pluginPatches == [ ] then "touch $out" else "cat ${lib.escapeShellArgs pluginPatches} > $out"
  );

  wrapper = writeShellApplication {
    name = "dsh";
    text = ''
      if [ "''${1:-}" = "plugin" ]; then
        exec ${lib.getExe dsh} "$@"
      fi
      exec ${lib.getExe dsh} --patch ${patch} "$@"
    '';
  };
in
stdenv.mkDerivation {
  pname = "${dsh.pname}-with-plugins";
  inherit (dsh) version;

  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin
    ln -s ${lib.getExe wrapper} $out/bin/dsh
  '';

  passthru = {
    inherit patch plugins;
  };

  meta = dsh.meta // {
    mainProgram = "dsh";
  };
}
