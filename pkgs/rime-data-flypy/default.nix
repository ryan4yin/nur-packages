{
  lib,
  stdenvNoCC,
}:
stdenvNoCC.mkDerivation {
  pname = "rime-data-flypy";
  version = "unstable-2025-10-18";

  # Vendored snapshot of the 小鹤音形 (flypy) 鼠须管 data from flypy.com's
  # official package. The personal user dictionary (flypy_user.txt) is
  # intentionally not shipped here; it lives in the consuming configuration.
  src = ./.;

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share
    cp -r share/rime-data $out/share/rime-data
    runHook postInstall
  '';

  meta = {
    description = "小鹤音形 (flypy) Rime schema data for fcitx5-rime and Squirrel";
    homepage = "https://flypy.com/";
    platforms = lib.platforms.all;
  };
}
