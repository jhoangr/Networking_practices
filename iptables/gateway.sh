#!/bin/sh

#activamos ip_forward

echo 1 > /proc/sys/net/ipv4/ip_forward


#regla para permitir que el tráfico de la 192.168.2.0/24 pueda ser redirigido a Internet
iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -o eth1 -j SNAT --to 192.168.1.2

#reglas para loguear actividades de los usuarios
iptables -t filter -A INPUT -m tos --tos 0x22 -j LOG --log-prefix "user1: " 
iptables -t filter -A INPUT -m tos --tos 0x44 -j LOG --log-prefix "user2: " 
iptables -t filter -A FORWARD -m tos --tos 0x22 -j LOG --log-prefix "user1: " 
iptables -t filter -A FORWARD -m tos --tos 0x44 -j LOG --log-prefix "user2: " 

#regla para dropear el trafico del user2 que se dirige a internet
iptables -t filter -A FORWARD -m tos --tos 0x44 -j DROP



#connexions HTTP entrants a la màquina desde la 192.168.2.0/24 les refusem
#iptables -A INPUT -p tcp --dport 80 -s 192.168.2.0/24 -j DROP
echo "Processing BLACKLIST"

#BLACKLIST
iptables -t filter -N blacklist
iptables -t filter -A INPUT -p tcp --dport 80 -j blacklist
iptables -t filter -A blacklist -s 192.168.2.0/24 -j DROP

echo "Processing WHITELIST"

#WHITELIST
iptables -t filter -N whitelist
iptables -t filter -A INPUT -p tcp --dport 22 -j whitelist
iptables -t filter -A whitelist ! -s 192.168.2.0/24 -j DROP



#connexions SSH entrants a la màquina les refusem si no provenen de la 192.168.2.0/24
#iptables -A INPUT -p tcp --dport 22 ! -s 192.168.2.0/24 -j DROP

echo "Processing REDIRIS+TRACEROUTE"
#connexions de les workstations que no vagin cap a la UAB o el servei ftp de rediris les dropegem
iptables -A FORWARD -p tcp --dport 20:21 -s 192.168.2.0/24 -d ftp.rediris.es -j ACCEPT
iptables -t filter -A OUTPUT ! -s 192.168.2.0/24 -p icmp --icmp-type 11 -j DROP
iptables -A FORWARD -s 192.168.2.0/24 ! -d 158.109.79.0/24 -j DROP







