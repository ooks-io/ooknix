{ config, pkgs, inputs, lib, ... }:

let
  inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) gtkThemeFromScheme;
  cfg = config.homeModules.desktop.themeSettings;
in
{
  config = lib.mkIf cfg.enable (rec {
    gtk = {
      enable = true;
      font = {
        name = config.fontProfiles.regular.family;
        size = 12;
      };
      theme = {
        name = config.colorscheme.slug;
        package = gtkThemeFromScheme { scheme = config.colorscheme; };
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
    };

    services.xsettingsd = {
      enable = true;
      settings = {
        "Net/ThemeName" = gtk.theme.name;
        "Net/IconThemeName" = gtk.iconTheme.name;
      };
    };

    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  });
}