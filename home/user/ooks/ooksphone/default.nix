{ pkgs, config, ... }:


{
  imports = [
    ../../../profile
  ];
  
  theme.phone.enable = true;

  ooknet = {
    console = {
      editor.helix.enable = true;
      shell.fish.enable = true;
      prompt.starship.enable = true;
      multiplexer.zellij.enable = true;
      utility = {
        tools.enable = true;
      };
    };
    config.nix.enable = true;
  };
  home.packages = with pkgs; [
    pfetch
    lazygit
    openssh
    htop
  ];
  programs = {
    ssh = {
      enable = true;
      matchBlocks = {
        "ooksdesk" = {
          hostname = "192.168.1.201";
          user = "ooks";
          identityFile = "~/.ssh/id_ed25519";
          forwardAgent = true;
        };
      };
    };
    git = {
      enable = true;
      package = pkgs.gitAndTools.gitFull;
      userName = "ooks-io";
      userEmail = "ooks@protonmail.com";
      ignores = [ ".direnv" "result" ];
      lfs.enable = true;
    };
  };

  home.shellAliases = {
    nrs = "nix-on-droid switch --flake $FLAKE";
  };

  home.sessionVariables = {
    TZ = "Pacific/Auckland";
    FLAKE = "$HOME/.config/ooknet";
  };

  home.stateVersion = "23.11";
}

