{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    crossPkgs = import nixpkgs { system = "x86_64-linux"; crossSystem = pkgs.lib.systems.examples.aarch64-android; };
  in {
    packages.x86_64-linux.default = crossPkgs.llvmPackages_latest.compiler-rt;
  };
}
