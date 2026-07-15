{
  description = "A clean, modular NixOS system configuration flake";

   inputs = {
     nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
     millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
   };

   outputs = { self, nixpkgs, ... }@inputs: {
     nixosConfigurations = {
	   nixos-vault = nixpkgs.lib.nixosSystem {
	     system = "x86_64-linux";
	     specialArgs = { inherit inputs; }; 
         modules = [ 
         ./configuration.nix 
         ./nvidia.nix
         ./gaming.nix
         #./docker.nix
         {
           nixpkgs.overlays = [ inputs.millennium.overlays.default ];
           #nixpkgs.config.allowUnfree = true;
         }
         ];
	  };
	};
  };
}
