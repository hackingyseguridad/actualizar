#!/bin/sh
# Actualizador de paguetes para distrubuciones basadas en Debian 
# Se instalara en la carperta /sbin/ para poder ser invocado y ejecutardo como un comando de Linux
echo
echo "(c) hackingyseguridad.com 2022"
echo
echo "Instalando ..."
echo
echo "Estableciendo hora"
timedatectl set-timezone Europe/Madrid
timedatectl set-local-rtc 1
timedatectl
echo
echo "Copiando ficheros ..."
chmod 777 actualizar
cp actualizar /sbin/
chmod 777 actualiza
cp actualiza /sbin/
echo
echo "Instalado !!!"
echo
