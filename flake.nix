{
  description = "A clean, modular NixOS system configuration flake";

   inputs = {
     # Using unstable by default; switch to a specific channel like "nixos-24.05" if preferred
     nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
   };

   outputs = { self, nixpkgs, ... }@inputs: {
     nixosConfigurations = {
	   nixos-vault = nixpkgs.lib.nixosSystem {
	     system = "x86_64-linux";
	     specialArgs = { inherit inputs; }; 
         modules = [ ./configuration.nix 
         {
             #nixpkgs.config.allowUnfree = true;
         }
         ];
	  };
	};
  };
}
