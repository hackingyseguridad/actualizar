#!/bin/sh
# actualizador de paguetes para Debian
# actualizar.sh Programado en shell
# boton derecho para dar permisos del ejecucion o desde consola teclemaos: chmod 777 actualizar.sh
# se ejecuta en consola ./actualizar.sh
# Para ejecutar en el arranque de linux copiar a initd.d y actualizar el incio
# cp actualizar.sh /etc/init.d
# cd /etc/init.d
# chmod 777 actualizar.sh
# update-rc.d actualizar.sh defaults
# Antonio Taboada
# 3 Sept 2016

dpkg --configure -a
apt-get clean
apt-get update
apt-get upgrade --fix-missing -y
apt-get dist-upgrade -y
apt-get autoremove -y
