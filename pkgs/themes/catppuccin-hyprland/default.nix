{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "catppuccin-hyprland";
  version = "1.2";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "hyprland";
    rev = "v${version}";
    hash = "sha256-07B5QmQmsUKYf38oWU3+2C6KO4JvinuTwmW1Pfk8CT8=";
  };

  meta = with lib; {
    description = "Soothing pastel theme for Hyprland";
    homepage = "https://github.com/catppuccin/hyprland";
    license = licenses.mit;
    maintainers = with maintainers; [ ryan4yin ];
    mainProgram = "hyprland";
    platforms = platforms.all;
  };
}
