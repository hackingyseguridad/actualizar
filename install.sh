#!/bin/sh
# Actualizador de paguetes para Debian
# Se instalara para ejecutarse y actualizar de forma automatica al inicio
cp actualizar.sh /etc/init.d/
cd /etc/init.d
chmod 777 actualizar
update-rc.d actualizar defaults
