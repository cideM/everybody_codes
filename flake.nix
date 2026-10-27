{
  description = "Janet flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?rev=36fcc808a13782146ab0549ad52c27551af5c49f";
    flake-utils.url = "github:numtide/flake-utils";
    spork = {
      url = "github:janet-lang/spork";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    spork,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };

        # Build spork with Janet's own bundle system (the jpm successor).
        # Installs modules + natives to $out/lib/janet and the janet-format,
        # janet-netrepl and janet-pm scripts to $out/lib/janet/bin.
        sporkPkg = pkgs.stdenv.mkDerivation {
          pname = "spork";
          version = spork.shortRev or "dirty";
          src = spork;
          nativeBuildInputs = [pkgs.janet];
          dontConfigure = true;

          buildPhase = ''
            runHook preBuild

            # spork's C toolchain looks for <prefix>/include/janet.h, but
            # nixpkgs installs the header as include/janet/janet.h.
            mkdir -p janet-prefix/include
            ln -s ${pkgs.janet}/include/janet/janet.h janet-prefix/include/janet.h
            ln -s ${pkgs.janet}/lib janet-prefix/lib
            export JANET_PREFIX=$PWD/janet-prefix

            export JANET_PATH=$out/lib/janet
            mkdir -p $JANET_PATH
            janet -e '(bundle/install ".")'

            runHook postBuild
          '';

          installPhase = ''
            runHook preInstall
            ln -s $out/lib/janet/bin $out/bin
            runHook postInstall
          '';
        };
      in {
        packages.spork = sporkPkg;

        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            coreutils
            jq
            alejandra
            tokei
            janet
            jpm
            sporkPkg
          ];

          # Makes `(import spork/...)` work in plain `janet`, like `jpm -l` did.
          JANET_PATH = "${sporkPkg}/lib/janet";
        };
      }
    );
}
