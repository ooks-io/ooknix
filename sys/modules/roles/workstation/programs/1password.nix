{ lib, config, ... }:

let
  inherit (lib) mkIf;
  host = config.ooknet.host;
in

{
  config = mkIf (host.type != "phone") {
    programs = {
      _1password.enable = true;
      _1password-gui = {
        enable = true;
        polkitPolicyOwners = [ "${host.admin.name}" ];
      };
    };
  };
}