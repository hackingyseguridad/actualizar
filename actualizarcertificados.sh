#!/bin/sh
echo 
echo "Descargar certificados del SO Linux Debian actuales e intalarlos"
echo "ultima version de certificados para Debian "
echo "http://ftp.debian.org/debian/pool/main/c/ca-certificates/?C=M;O=D"
echo 

# instala nuevas claves PGP Abril 2025

cd /tmp/
sudo wget https://archive.kali.org/archive-keyring.gpg -O /usr/share/keyrings/kali-archive-keyring.gpg
gpg --no-default-keyring --keyring /usr/share/keyrings/kali-archive-keyring.gpg -k

# instala certificados !!

wget https://security.debian.org/debian-security/pool/main/c/ca-certificates/ca-certificates_20200601~deb9u2_all.deb
sudo dpkg -i ca-certificates_20200601~deb9u2_all.deb

# Instala certt CA

apt-get install ca-certificates

update-ca-certificates

