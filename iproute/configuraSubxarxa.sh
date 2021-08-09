#!/bin/bash

#script para configurar los departamentos en función de su subred.
#$1 -> subxarxa


case $1 in 
  192.168.2.32/27)
	
	ip addr add 192.168.2.34/27 dev eth0
	ip route add default via 192.168.2.33 
	;;
  192.168.2.64/27)
	
	ip addr add 192.168.2.66/27 dev eth0
	ip route add default via 192.168.2.65 
	
 	;;
  192.168.2.96/27)
	
	ip addr add 192.168.2.98/27 dev eth0
	ip route add default via 192.168.2.97 
 	;;	
  192.168.2.128/27)
	
	ip addr add 192.168.2.130/27 dev eth0
	ip route add default via 192.168.2.129 
 	;;
  192.168.2.160/27)
	
	ip addr add 192.168.2.162/27 dev eth0
	ip route add default via 192.168.2.161	 
 	;;
  192.168.2.192/27)
	
	ip addr add 192.168.2.194/27 dev eth0
	ip route add default via 192.168.2.193 
 	;;
  192.168.2.224/27)
	
	ip addr add 192.168.2.226/27 dev eth0
	ip route add default via 192.168.2.225 
 	;;
  *)	
	echo "La subred especificada no es correcta"
	;;
esac
