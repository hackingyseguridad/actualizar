#!/bin/sh
# actualizador de paguetes para Debian
# actualizar.sh Programado en shell
# boton derecho para dar permisos del ejecucion 
# se ejecuta en consola ./actualizar.sh
# Antonio Taboada
# 3 Sept 2016

apt-get clean
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get autoremove
