{ lib
, stdenv
, fetchFromGitHub
, chez-racket
, akku
}:

stdenv.mkDerivation rec {
  pname = "scheme-langserver";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "ufo5260987423";
    repo = "scheme-langserver";
    rev = version;
    hash = "sha256-SDtVW4ZhHhLBY9qiYEfsW8oaKdPpsYK3M3Ht0u6BZr8=";
  };
  # Dependencies that should only exist in the build environment.
  nativeBuildInputs = [ chez-racket akku ];
  # Dependencies that should exist both in the build and target environments.
  buildInputs = [ chez-racket ];
  installPhase = ''
    runHook preInstall
    mkdir -p $out

    akku install
    bash .akku/env
    compile-chez-program run.ss
    mv run $out/scheme-langserver

    runHook postInstall
  '';

  meta = with lib; {
    description = "Scheme language server";
    homepage = "https://github.com/ufo5260987423/scheme-langserver";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "scheme-langserver";
    platforms = platforms.all;
  };
}
