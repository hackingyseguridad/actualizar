#!/bin/sh
# actualizador de paguetes para Debian
# actualizar.sh Programado en shell
# boton derecho para dar permisos del ejecucion o desde consola teclemaos: chmod 777 actualizar.sh
# se ejecuta en consola ./actualizar.sh
# Antonio Taboada
# 3 Sept 2016

apt-get clean
apt-get update
apt-get upgrade --fix-missing -y
apt-get dist-upgrade -y
apt-get autoremove -y
