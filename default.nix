{ stdenv, cmake, lib, fetchFromGitHub }:
stdenv.mkDerivation {
  name = "ini2json";
  version = "1.0.0";
  src = ./.;
  nativeBuildInputs = [cmake];
  configurePhase = ''
    mkdir build;
    cd build;
    cmake ../ -DCMAKE_INSTALL_PREFIX=$out
  '';  
  meta.license = lib.licenses.gpl3;
}

