#!/bin/bash

#script para desactivar/activar el paso de los paquetes a internet a las diferentes subredes.
#$1 -> activar/desactivar
#$2 -> subxarxa


case $2 in 
  192.168.2.32/27)

	if [ "$1" == "activar" ] 
	then
		iptables -R FORWARD 1 -s 192.168.2.32/27 -j ACCEPT
	elif [ "$1" == "desactivar" ]
	then 
		iptables -R FORWARD 1 -s 192.168.2.32/27 -j DROP 
	else
		echo "se debe especificar activar/desactivar como primer parámetro"
	
	fi

	;;
  192.168.2.64/27)
	if [ "$1" == "activar" ] 
	then
		iptables -R FORWARD 2 -s 192.168.2.64/27 -j ACCEPT
	elif [ "$1" == "desactivar" ]
	then 
		iptables -R FORWARD 2 -s 192.168.2.64/27 -j DROP 
	else
		echo "se debe especificar activar/desactivar como primer parámetro"
	
	fi
 	;;
  192.168.2.96/27)
	if [ "$1" == "activar" ] 
	then
		iptables -R FORWARD 3 -s 192.168.2.96/27 -j ACCEPT
	elif [ "$1" == "desactivar" ]
	then 
		iptables -R FORWARD 3 -s 192.168.2.96/27 -j DROP 
	else
		echo "se debe especificar activar/desactivar como primer parámetro"
	
	fi
 	;;
  192.168.2.128/27)
	if [ "$1" == "activar" ] 
	then
		iptables -R FORWARD 4 -s 192.168.2.128/27 -j ACCEPT
	elif [ "$1" == "desactivar" ]
	then 
		iptables -R FORWARD 4 -s 192.168.2.128/27 -j DROP 
	else
		echo "se debe especificar activar/desactivar como primer parámetro"
	
	fi
 	;;
  192.168.2.160/27)
	if [ "$1" == "activar" ] 
	then
		iptables -R FORWARD 1 -s 192.168.2.160/27 -j ACCEPT
	elif [ "$1" == "desactivar" ]
	then 
		iptables -R FORWARD 1 -s 192.168.2.160/27 -j DROP 
	else
		echo "se debe especificar activar/desactivar como primer parámetro"
	
	fi
 	;;
  192.168.2.192/27)
	if [ "$1" == "activar" ] 
	then
		iptables -R FORWARD 1 -s 192.168.2.192/27 -j ACCEPT
	elif [ "$1" == "desactivar" ]
	then 
		iptables -R FORWARD 1 -s 192.168.2.192/27 -j DROP 
	else
		echo "se debe especificar activar/desactivar como primer parámetro"
	
	fi
 	;;
  192.168.2.224/27)
	if [ "$1" == "activar" ] 
	then
		iptables -R FORWARD 1 -s 192.168.2.224/27 -j ACCEPT
	elif [ "$1" == "desactivar" ]
	then 
		iptables -R FORWARD 1 -s 192.168.2.224/27 -j DROP 
	else
		echo "se debe especificar activar/desactivar como primer parámetro"
	
	fi
 	;;
  *)
	echo "La subred especificada no es correcta"
	;;
esac