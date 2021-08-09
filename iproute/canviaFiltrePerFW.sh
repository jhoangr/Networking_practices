#!/bin/bash

#script que permet afegir els filtres per FW

#ip route del 192.168.2.32/27 dev eth2 
#ip route del 192.168.2.64/27 dev eth2 
#ip route del 192.168.2.96/27 dev eth2 
#ip route del 192.168.2.128/27 dev eth2 
#ip route del 192.168.2.160/27 dev eth2 
#ip route del 192.168.2.192/27 dev eth2 
#ip route del 192.168.2.224/27 dev eth2 
#eliminem la cua afegida en activaAmpleDeBanda.sh que no té sentit en aquest context.
tc qdisc del dev eth2 root 

#afegim regles de routing que permeten marcar els paquets per després aplicar les regles de filtratge.
iptables -A PREROUTING -t mangle -i eth2 -j MARK --set-mark 1
iptables -A PREROUTING -t mangle -i eth3 -j MARK --set-mark 2
iptables -A PREROUTING -t mangle -i eth4 -j MARK --set-mark 3
iptables -A PREROUTING -t mangle -i eth5 -j MARK --set-mark 4
iptables -A PREROUTING -t mangle -i eth6 -j MARK --set-mark 5
iptables -A PREROUTING -t mangle -i eth7 -j MARK --set-mark 6
iptables -A PREROUTING -t mangle -i eth8 -j MARK --set-mark 7

tc filter add dev eth0 protocol ip parent 2:0 handle 1 fw flowid 2:1
tc filter add dev eth0 protocol ip parent 2:0 handle 2 fw flowid 2:2
tc filter add dev eth0 protocol ip parent 2:0 handle 3 fw flowid 2:3
tc filter add dev eth0 protocol ip parent 2:0 handle 4 fw flowid 2:4
tc filter add dev eth0 protocol ip parent 2:0 handle 5 fw flowid 2:5
tc filter add dev eth0 protocol ip parent 2:0 handle 6 fw flowid 2:6
tc filter add dev eth0 protocol ip parent 2:0 handle 7 fw flowid 2:7

tc filter add dev eth1 protocol ip parent 3:0 handle 1 fw flowid 3:1
tc filter add dev eth1 protocol ip parent 3:0 handle 2 fw flowid 3:2
tc filter add dev eth1 protocol ip parent 3:0 handle 3 fw flowid 3:3
tc filter add dev eth1 protocol ip parent 3:0 handle 4 fw flowid 3:4
tc filter add dev eth1 protocol ip parent 3:0 handle 5 fw flowid 3:5
tc filter add dev eth1 protocol ip parent 3:0 handle 6 fw flowid 3:6
tc filter add dev eth1 protocol ip parent 3:0 handle 7 fw flowid 3:7