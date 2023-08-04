{ pkgs, ... }: {
  imports = [
    ./bat.nix
    ./git.nix
    ./bash.nix
    ./fish.nix
    ./pfetch.nix
    ./starship.nix
    ./joshuto
  ];
  home.packages = with pkgs; [
    bc # Calculator
    ncdu # disk util
    exa # ls
    fd # find
    ripgrep # Better grep
    httpie # Better curl
    diffsitter # Better diff
    jq # JSON pretty printer and manipulator
    lazygit
    comma # Install and run with ","
    btop
    tldr
  ];

  programs = {
    fzf.enable = true;
  };
}
