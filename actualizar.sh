#!/bin/sh
# Actualizador online de paguetes para distribuciones basadas en Debian
# Antonio Taboada 2023 - hackingyseguridad.com
cd /tmp/
chmod 777 actualizar
wget https://raw.githubusercontent.com/hackingyseguridad/actualizar/master/actualizar -q -O - | bash
