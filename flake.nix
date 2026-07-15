{
  description = "A clean, modular NixOS system configuration flake";

   inputs = {
     nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
     arion.url = "github:hercules-ci/arion";
     arion.inputs.nixpkgs.follows = "nixpkgs";
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
         ./docker.nix
         {
           #nixpkgs.config.allowUnfree = true;
         }
         ];
	  };
	};
  };
}
