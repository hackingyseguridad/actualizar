#!/bin/sh
echo 
echo "Descargar certificados del SO Linux Debian actuales e intalarlos"
echo "ultima version de certificados para Debian "
echo "http://ftp.debian.org/debian/pool/main/c/ca-certificates/?C=M;O=D"
echo 

wget https://security.debian.org/debian-security/pool/main/c/ca-certificates/ca-certificates_20200601~deb9u2_all.deb

sudo dpkg -i ca-certificates_20200601~deb9u2_all.deb
