{config, lib, pkgs, ...}:

{

  imports = [
#  	./docker-compose.nix
  ];
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    daemon.settings = {
   	  data-root = "/docker";
  	  userland-proxy = false;
	};
  };
  
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 1337 ];
  users.users.cig0073.extraGroups = [ "docker" ];
	
}
