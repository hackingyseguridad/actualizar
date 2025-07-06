#!/bin/bash
# Script para modificar /etc/resolv.conf y configurar manualmente DNS resolver
# (Resolvers) Antonio Taboada - http://www.hackingyseguridad.com/ 2025

chattr -i /etc/resolv.conf

RESOLVER="
# (Resolvers) http://www.hackingyseguridad.com/ 

nameserver 213.0.184.85
nameserver 213.0.184.88
nameserver 2a02:9000::aaaa
nameserver 2a02:9000::bbbb"

echo "$RESOLVER" > /etc/resolv.conf

chattr +i /etc/resolv.conf

echo
