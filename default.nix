{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "nix-beautify";

  src = ./.;

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/js
    cp $src/nix-beautify.js $out/js
    cat > $out/bin/nix-beautify << EOF
    #!/usr/bin/env bash
    ${pkgs.nodejs}/bin/node $out/js/nix-beautify.js
    EOF
    chmod u+x $out/bin/nix-beautify
  '';
}
