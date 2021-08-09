#!/bin/sh

#añadir gateway
ip route add default via 192.168.2.1
#reglas para marcar paquetes en funcion del usuario, user1=999 - user2=998
iptables -t mangle -A OUTPUT -m owner --gid-owner 999 -j TOS --set-tos 0x22
iptables -t mangle -A OUTPUT -m owner --gid-owner 998 -j TOS --set-tos 0x44

