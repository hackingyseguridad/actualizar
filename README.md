### actualizar

<img style="float:left" alt="actualizar SO Linux Debian" src="https://github.com/hackingyseguridad/actualizar/blob/master/actualizar.png">

### Scripts:

actualizar          # Actualización completa

actualiza           # Actualización en segundo plano

actualizahora       # Sincronizar hora

apagar              # Apagar el sistema

#

Actualizador desde repositorio de paquetes en distribuciones basadas en Debian Linux

### instalacion

git clone https://github.com/hackingyseguridad/actualizar

cd actualizar

sh instalar.sh

actualizar

### Ejecutar sin descargar git

cd /tmp

sudo wget https://raw.githubusercontent.com/hackingyseguridad/actualizar/master/actualizar -q -O - | bash

### Características

- Actualización completa y segura del sistema (update + full-upgrade + dist-upgrade)
- Corrección automática de dependencias rotas
- Limpieza profunda de paquetes huérfanos y caché
- Sincronización automática de hora y zona horaria (Europe/Madrid)
- Scripts auxiliares útiles (actualización rápida, DNS, apagado, etc.)
- Instalación como comandos del sistema (`/sbin/`)
- Compatible con **Debian, Ubuntu, Kali Linux, Parrot OS**, etc.

#
http://www.hackingyseguridad.com/
#


