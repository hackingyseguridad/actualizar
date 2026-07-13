# actualizar

**Conjunto de scripts para actualizar, mantener y administrar de forma rápida distribuciones Linux basadas en Debian** (Debian, Ubuntu, Kali Linux, Parrot OS, etc.).

Automatiza tareas repetitivas de mantenimiento: sincronización horaria, actualización completa del sistema (`update` + `full-upgrade` + `dist-upgrade`), limpieza de paquetes huérfanos, corrección de dependencias rotas, renovación de certificados/claves y apagado del equipo — todo mediante comandos cortos instalables como binarios del sistema.

[![actualizar SO Linux Debian](https://github.com/hackingyseguridad/actualizar/raw/master/actualizar.png)](https://github.com/hackingyseguridad/actualizar/blob/master/actualizar.png)

[![Licencia](https://img.shields.io/badge/licencia-GPL--3.0-blue.svg)](LICENSE)
[![Shell](https://img.shields.io/badge/lenguaje-Shell-89e051.svg)](https://github.com/hackingyseguridad/actualizar/search?l=shell)
[![Plataforma](https://img.shields.io/badge/plataforma-Debian%20%7C%20Ubuntu%20%7C%20Kali%20%7C%20Parrot-orange.svg)]()

---

## Tabla de contenidos

- [Características](#características)
- [Tabla resumen de scripts](#tabla-resumen-de-scripts)
- [Requisitos](#requisitos)
- [Instalación](#instalación)
  - [Opción 1 · Clonando el repositorio](#opción-1--clonando-el-repositorio)
  - [Opción 2 · Ejecución directa sin git](#opción-2--ejecución-directa-sin-git)
- [Uso](#uso)
- [Detalle de cada script](#detalle-de-cada-script)
- [Preguntas frecuentes](#preguntas-frecuentes)
- [Aviso de seguridad](#aviso-de-seguridad)
- [Licencia](#licencia)
- [Autor y enlaces](#autor-y-enlaces)

---

## Características

| Característica | Descripción |
|---|---|
| 🔄 Actualización completa | Ejecuta `update`, `full-upgrade --fix-missing` y `dist-upgrade` en un único paso |
| 🛠️ Corrección de dependencias | Repara paquetes rotos con `dpkg --configure -a` y `apt -f install` |
| 🧹 Limpieza profunda | Elimina paquetes huérfanos y cachés con `autoremove` y `autoclean` |
| 🕒 Sincronización horaria | Ajusta zona horaria (`Europe/Madrid`) y sincroniza la hora vía NTP |
| 🌐 DNS personalizado | Configura resolvers DNS manuales y bloquea su sobrescritura |
| 🔐 Certificados y claves | Actualiza certificados CA y claves PGP/GPG de los repositorios |
| ⚡ Comandos del sistema | Se instala en `/sbin/` para invocarse como cualquier otro comando Linux |
| 💻 Compatibilidad | Debian, Ubuntu, Kali Linux, Parrot OS y derivados basados en `apt` |

---

## Tabla resumen de scripts

| Script | Se instala en `/sbin/` | Requiere `sudo`/root | Qué hace | Uso típico |
|---|:---:|:---:|---|---|
| **`actualizar`** | ✅ | ✅ | Actualización completa del sistema en 10 pasos: sincroniza la hora, repara dpkg, hace `update`, `full-upgrade`, `dist-upgrade`, `autoremove`, `autoclean` y reinstala dependencias pendientes | `actualizar` |
| **`actualiza`** | ✅ | ✅ | Lanza `actualizar` en segundo plano con `nohup` desde `/tmp`, para no bloquear la terminal | `actualiza` |
| **`actualizahora`** | ✅ | ✅ | Ajusta la zona horaria a `Europe/Madrid` e instala/sincroniza la hora vía `ntpdate` contra varios servidores NTP | `actualizahora` |
| **`apagar`** | ✅ | ✅ | Apaga el equipo inmediatamente (`shutdown now`) | `apagar` |
| **`apaga`** | ❌ | ✅ | Variante mínima que ejecuta `poweroff` directamente | `sh apaga` |
| **`resolv.sh`** | ❌ | ✅ | Sobrescribe `/etc/resolv.conf` con servidores DNS personalizados y lo bloquea con `chattr +i` para evitar que otros procesos lo modifiquen | `sudo sh resolv.sh` |
| **`actualizarcertificados.sh`** | ❌ | ✅ | Descarga e instala certificados CA actualizados y la clave del repositorio de Kali (`kali-archive-keyring.gpg`) | `sudo sh actualizarcertificados.sh` |
| **`actualizar.sh`** | ❌ | ✅ | Copia del script `actualizar` en formato `.sh`, pensada para ejecutarse directamente con `sh` sin necesidad de darle permisos de ejecución previos | `sh actualizar.sh` |
| **`instalar.sh`** | — | ✅ | Instalador: ajusta la zona horaria y copia `actualizar`, `actualiza`, `actualizahora` y `apagar` a `/sbin/` con permisos de ejecución | `sh instalar.sh` |
| **`sources.list`** | — | — | Plantilla de repositorios `apt` de referencia para distribuciones Debian | Copiar a `/etc/apt/sources.list` (revisar antes de aplicar) |

> ⚠️ El instalador (`instalar.sh`) solo copia a `/sbin/` los cuatro scripts principales (`actualizar`, `actualiza`, `actualizahora`, `apagar`). Los scripts `apaga`, `resolv.sh`, `actualizarcertificados.sh` y `actualizar.sh` deben ejecutarse manualmente desde el repositorio clonado.

---

## Requisitos

- Distribución basada en Debian (Debian, Ubuntu, Kali Linux, Parrot OS, etc.) con `apt`/`dpkg`.
- Permisos de administrador (`sudo` o usuario `root`).
- Paquetes `ntpdate` y `ca-certificates` (se instalan automáticamente si faltan).
- Acceso a Internet para descargar paquetes, certificados y claves.

---

## Instalación

### Opción 1 · Clonando el repositorio

```bash
git clone https://github.com/hackingyseguridad/actualizar
cd actualizar
sh instalar.sh
actualizar
```

`instalar.sh` establece la zona horaria y copia `actualizar`, `actualiza`, `actualizahora` y `apagar` en `/sbin/`, quedando disponibles como comandos del sistema.

### Opción 2 · Ejecución directa sin git

Para lanzar una actualización puntual sin clonar el repositorio:

```bash
cd /tmp
sudo wget https://raw.githubusercontent.com/hackingyseguridad/actualizar/master/actualizar -q -O - | bash
```

> ⚠️ Este método ejecuta el script directamente desde Internet mediante una tubería (`pipe`) hacia `bash`. Revisa siempre el contenido del script antes de ejecutarlo con privilegios de root — ver [Aviso de seguridad](#aviso-de-seguridad).

---

## Uso

Una vez instalado, los comandos quedan disponibles desde cualquier ruta:

```bash
actualizar        # Actualización completa del sistema (10 pasos)
actualiza          # Igual que 'actualizar' pero en segundo plano
actualizahora      # Sincroniza únicamente fecha, hora y zona horaria
apagar             # Apaga el equipo
```

Scripts auxiliares (ejecutar desde la carpeta del repositorio clonado):

```bash
sudo sh resolv.sh                    # Configura DNS manual en /etc/resolv.conf
sudo sh actualizarcertificados.sh    # Actualiza certificados CA y claves de repositorio
```

---

## Detalle de cada script

**`actualizar`** — Flujo de 10 pasos: sincroniza hora → repara dpkg → `apt-get update` → `full-upgrade --fix-missing` → `dist-upgrade` → `autoremove` → `autoclean` → `update` final → `apt -f install`. Pensado como actualización "todo en uno" segura para sistemas de escritorio y servidores.

**`actualiza`** — Envoltorio de una línea que ejecuta `actualizar` con `nohup ... &`, útil para lanzar la actualización y seguir trabajando en la misma terminal sin que se corte al cerrarla.

**`actualizahora`** — Only-time: fija la zona horaria `Europe/Madrid`, instala `ntpdate` si falta y sincroniza contra varios servidores NTP de respaldo.

**`apagar` / `apaga`** — Apagado del equipo; `apagar` usa `shutdown now`, `apaga` usa `poweroff` directamente.

**`resolv.sh`** — Sustituye `/etc/resolv.conf` por servidores DNS predefinidos y aplica el atributo inmutable (`chattr +i`) para que NetworkManager u otros servicios no lo sobrescriban.

**`actualizarcertificados.sh`** — Descarga la clave del repositorio de Kali y un paquete `.deb` de certificados CA, e invoca `update-ca-certificates`; útil cuando `apt update` falla por errores de certificados o firmas expiradas.

**`instalar.sh`** — Instalador local: fija la hora y copia los binarios principales a `/sbin/`.

**`sources.list`** — Ejemplo de fichero de repositorios `apt`, a usar como referencia o punto de partida, revisando que coincida con la versión y distribución de tu sistema.

---

## Preguntas frecuentes

| Pregunta | Respuesta |
|---|---|
| ¿Funciona en Ubuntu? | Sí, cualquier distribución basada en `apt`/`dpkg` (Ubuntu, Debian, Kali, Parrot OS, Mint, etc.) |
| ¿Necesito ser root? | Sí, todos los scripts realizan operaciones de sistema (`apt`, `timedatectl`, `shutdown`, etc.) |
| ¿Puedo cambiar la zona horaria? | Sí, edita `Europe/Madrid` por la tuya (formato `Región/Ciudad`) en `actualizar`, `actualizahora` e `instalar.sh` |
| ¿Qué hace `resolv.sh` con mi configuración DNS actual? | La sobrescribe por completo y la bloquea; haz una copia de tu `/etc/resolv.conf` antes de ejecutarlo si quieres poder revertir |

---

## Aviso de seguridad

Antes de ejecutar cualquier script con privilegios de root —especialmente el método `wget | bash`—, revisa su contenido. Ten en cuenta que:

- `resolv.sh` modifica y **bloquea** `/etc/resolv.conf` (`chattr +i`); revierte con `sudo chattr -i /etc/resolv.conf` si necesitas volver a la configuración gestionada automáticamente.
- `apagar` y `apaga` apagan el equipo sin confirmación previa.
- Los scripts asumen zona horaria `Europe/Madrid` y servidores NTP/DNS concretos; ajústalos a tu entorno antes de desplegarlos en producción.

---

#
[hackingyseguridad.com](http://www.hackingyseguridad.com/)
#
