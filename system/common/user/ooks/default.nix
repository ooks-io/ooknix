{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.users.ooks = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
    "wheel"
    "video"
    "audio"
    ] ++ ifTheyExist [
    "git"
    "network"
    "libvirtd"
    "deluge"
    ];

  packages = [ pkgs.home-manager ];
  };

  home-manager.users.ooks = import ../../../../home/user/ooks/${config.networking.hostName};

  services.geoclue2.enable = true;
  security.pam.services = { swaylock = { }; };

}
