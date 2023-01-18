#!/bin/sh
echo 
echo descargar certificados actuales a intalarlos
echo "ultima version de certificados para Debian "
echo "http://ftp.debian.org/debian/pool/main/c/ca-certificates/?C=M;O=D"
echo 

wget https://security.debian.org/debian-security/pool/main/c/ca-certificates/ca-certificates_20200601~deb9u2_all.deb

sudo dpkg -i ca-certificates_20200601~deb9u2_all.deb
