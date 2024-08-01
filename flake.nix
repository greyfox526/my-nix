{
  description = "NixOS configuration";

  inputs = {
    nixpkgs = {
     #url = "github:nixos/nixpkgs/nixos-24.05";
     url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
     url = "github:nix-community/home-manager";
     inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nixpkgs-stable = {
    url = "github:nixos/nixpkgs/nixos-24.05";
    };
/*
    nixvim = {
     url = "github:nix-community/nixvim";
     inputs.nixpkgs.follows = "nixpkgs";
    };
*/
  };
  outputs = inputs@{ nixpkgs, home-manager, nixpkgs-stable, ...}: {
    
    nixosConfigurations = {
      tail = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          pkgs-stable = import nixpkgs-stable {
           system = system;
            config.allowUnfree = false;
            };
          };
        modules = [
          ./configuration.nix
          #inputs.nixvim.homeManagerModules.nixvim
          inputs.home-manager.nixosModules.default
          {
            
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.greyfox = import ./modules/home.nix;
/*
            extraSpecialArgs = {
              inherit pkgs-stable
              };*/
           
          }
        ];
      };
    };
  };
}
