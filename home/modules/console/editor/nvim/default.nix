{ config, lib, inputs, pkgs, ... }:

let
  inherit (config.colorscheme) palette;
  cfg = config.ooknet.console.editor.nvim;
in
  
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./settings.nix
    ./keymapping.nix
    ./plugins
  ];
  
  config = lib.mkIf cfg.enable {
    programs.neovim = {
      viAlias = true;
      vimAlias = true;  
    };

    programs.nixvim = {
      enable = true;
      plugins = {
        which-key = {
          enable = true;
          keyLabels = {
            " " = "<space>";
          };
        };
      };  

      colorschemes.base16 = {
        enable = true;
        colorscheme = config.colorscheme.slug;
        customColorScheme = {
          base00 = "#${palette.base00}";
          base01 = "#${palette.base01}";
          base02 = "#${palette.base02}";
          base03 = "#${palette.base03}";
          base04 = "#${palette.base04}";
          base05 = "#${palette.base05}";
          base06 = "#${palette.base06}";
          base07 = "#${palette.base07}";
          base08 = "#${palette.base08}";
          base09 = "#${palette.base09}";
          base0A = "#${palette.base0A}";
          base0B = "#${palette.base0B}";
          base0C = "#${palette.base0C}";
          base0D = "#${palette.base0D}";
          base0E = "#${palette.base0E}";
          base0F = "#${palette.base0F}";
        };
      };
    };
  };
}
