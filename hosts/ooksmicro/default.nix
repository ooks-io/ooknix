{ pkgs, lib, ... }:

let
	inherit (lib) mkDefault;
in

{
	imports = [
		./hardware-configuration.nix
	];


	ooknet.host = {
		name = "ooksmicro";
		type = "micro";
		role = "workstation";
		profiles = [ "console-tools" ];
		admin = {
			name = "ooks";
			shell = "fish";
			homeManager = true;
		};
		networking = {
			tailscale = {
				enable = true;
				client = true;
				autoconnect = true;
			};
		};
		hardware = {
			cpu.type = "intel";
			gpu.type = "intel";
			features = [
				"bluetooth"
				"backlight"
				"battery"
				"ssd"
				"audio"
				"video"
			];
		  monitors = [{
		    name = "DSI-1";
		    width = 720;
		    height = 1280;
		    workspace = "1";
		    primary = true;
		    transform = 3;
		  }];
			battery = {
				powersave = {
					minFreq = 500;
					maxFreq = 800;
				};
				performance = {
					minFreq = 1200;
					maxFreq = 2400;
				};
			};
		};
	};

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  };

	system.stateVersion = mkDefault "23.11";
}
