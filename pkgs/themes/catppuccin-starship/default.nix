{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-starship";
  version = "unstable-2023-07-13";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "starship";
    rev = "5629d2356f62a9f2f8efad3ff37476c19969bd4f";
    hash = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
  };

  meta = with lib; {
    description = "Soothing pastel theme for Starship";
    homepage = "https://github.com/catppuccin/starship";
    license = licenses.mit;
    maintainers = with maintainers; [ ryan4yin ];
    mainProgram = "starship";
    platforms = platforms.all;
  };
}
