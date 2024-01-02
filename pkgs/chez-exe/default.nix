{ lib
, stdenv
, fetchFromGitHub
, chez-racket
, clang
}:

stdenv.mkDerivation rec {
  pname = "chez-exe";
  version = "unstable-2021-01-17";

  src = fetchFromGitHub {
    owner = "gwatt";
    repo = "chez-exe";
    rev = "937629ad6cdcec698f0b25d996bb9b01a3b7cce7";
    hash = "sha256-6UBrmXw6GJRvBE1MyAGzSbmlumNHSaKcX6vHgfpv1vo=";
  };

  # Dependencies that should only exist in the build environment.
  nativeBuildInputs = [ chez-racket ];
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
    description = "Chez Scheme self hosting executable";
    homepage = "https://github.com/gwatt/chez-exe";
    license = licenses.bsd0;
    maintainers = with maintainers; [ ];
    mainProgram = "chez-exe";
    platforms = platforms.all;
  };
}
