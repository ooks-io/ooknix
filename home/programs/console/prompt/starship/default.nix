{ config, lib, ... }:

let
  cfg = config.programs.console.prompt.starship;
in

{
  config = lib.mkIf cfg.enable {
    programs.starship = {
      enable = true;
      settings = {
        format =
          let
            git = "$git_branch$git_commit$git_state$git_status";
            cloud = "$aws$gcloud$openstack";
          in
          ''
            ($nix_shell)$directory(${git})(- ${cloud})$jobs$character
          '';

        fill = {
          symbol = " ";
          disabled = false;
        };

        # Core
        username = {
          format = "[$user]($style)";
          show_always = true;
        };
        hostname = {
          format = "[@$hostname]($style) ";
          ssh_only = false;
          style = "bold green";
        };
        shlvl = {
          format = "[$shlvl]($style) ";
          style = "bold cyan";
          threshold = 2;
          repeat = true;
          disabled = false;
        };
        cmd_duration = {
          format = "took [$duration]($style) ";
        };

        directory = {
          format = "[$path]($style)( [$read_only]($read_only_style)) ";
        };
        nix_shell = {
          format = "[($name \\(develop\\) <- )$symbol]($style) ";
          impure_msg = "";
          symbol = " ";
          style = "bold red";
        };

        character = {
          error_symbol = "[](bold red)";
          success_symbol = "[](bold green)";
          vimcmd_symbol = "[](bold yellow)";
          vimcmd_visual_symbol = "[](bold cyan)";
          vimcmd_replace_symbol = "[](bold purple)";
          vimcmd_replace_one_symbol = "[](bold purple)";
        };

        time = {
          format = "\\\[[$time]($style)\\\]";
          disabled = false;
        };

        # Cloud
        gcloud = {
          format = "on [$symbol$active(/$project)(\\($region\\))]($style)";
        };
        aws = {
          format = "on [$symbol$profile(\\($region\\))]($style)";
        };

        # Icon changes only \/
        aws.symbol = "  ";
        conda.symbol = " ";
        dart.symbol = " ";
        directory.read_only = " ";
        docker_context.symbol = " ";
        elixir.symbol = " ";
        elm.symbol = " ";
        gcloud.symbol = " ";
        git_branch.symbol = " ";
        golang.symbol = " ";
        hg_branch.symbol = " ";
        java.symbol = " ";
        julia.symbol = " ";
        memory_usage.symbol = "󰍛 ";
        nim.symbol = "󰆥 ";
        nodejs.symbol = " ";
        package.symbol = "󰏗 ";
        perl.symbol = " ";
        php.symbol = " ";
        python.symbol = " ";
        ruby.symbol = " ";
        rust.symbol = " ";
        scala.symbol = " ";
        shlvl.symbol = "";
        swift.symbol = "󰛥 ";
        terraform.symbol = "󱁢";
      };
    };
  };
}
