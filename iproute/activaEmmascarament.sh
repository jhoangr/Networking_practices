#!/bin/sh


iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -j MASQUERADE
#iptables -t nat -A POSTROUTING -s 192.168.2.32/27 -j MASQUERADE
#iptables -t nat -A POSTROUTING -s 192.168.2.64/27 -j MASQUERADE
#iptables -t nat -A POSTROUTING -s 192.168.2.96/27 -j MASQUERADE
#iptables -t nat -A POSTROUTING -s 192.168.2.128/27 -j MASQUERADE
#iptables -t nat -A POSTROUTING -s 192.168.2.160/27 -j MASQUERADE
#iptables -t nat -A POSTROUTING -s 192.168.2.192/27 -j MASQUERADE
#iptables -t nat -A POSTROUTING -s 192.168.2.224/27 -j MASQUERADE

#añadir estas reglas de base y luego simplemente hacer un replace -> iptables -R "x" FORWARD -s 192.168.2.x/27 -j DROP/ACCEPT sencillo por número 1,2,3...7


iptables -t filter -A FORWARD -s 192.168.2.32/27 -j ACCEPT
iptables -t filter -A FORWARD -s 192.168.2.64/27 -j ACCEPT
iptables -t filter -A FORWARD -s 192.168.2.96/27 -j ACCEPT
iptables -t filter -A FORWARD -s 192.168.2.128/27 -j ACCEPT
iptables -t filter -A FORWARD -s 192.168.2.160/27 -j ACCEPT
iptables -t filter -A FORWARD -s 192.168.2.192/27 -j ACCEPT
iptables -t filter -A FORWARD -s 192.168.2.224/27 -j ACCEPT


echo "200     T1" >> /etc/iproute2/rt_tables
echo "201     T2" >> /etc/iproute2/rt_tables

ip route add 192.168.0.0/24 dev eth0 src 192.168.0.2 table T1
ip route add default via 192.168.0.1 table T1

ip route add 192.168.1.0/24 dev eth0 src 192.168.1.2 table T2
ip route add default via 192.168.1.1 table T2

ip rule add from 192.168.0.2 table T1
ip rule add from 192.168.1.2 table T2

#balanceig de càrrega entre eth0 i eth1
ip route add default scope global nexthop via 192.168.0.1 dev eth0 weight 5 \nexthop via 192.168.1.1 dev eth1 weight 5

 

 

