#!/bin/bash

#script para cambiar el ancho de banda a las diferentes subredes.
#$1 -> bandwith kbits
#$2 -> subxarxa


case $2 in 
  192.168.2.32/27)
	tc qdisc replace dev eth2 parent 1:1 handle 10: tbf rate $1 buffer 1600 limit 3000
	tc qdisc replace dev eth0 parent 2:1 handle 10: tbf rate $1 buffer 1600 limit 3000
	tc qdisc replace dev eth1 parent 3:1 handle 10: tbf rate $1 buffer 1600 limit 3000

	

	;;
  192.168.2.64/27)
	tc qdisc replace dev eth2 parent 1:2 handle 20: tbf rate $1 buffer 1600 limit 3000
	tc qdisc replace dev eth0 parent 2:2 handle 20: tbf rate $1 buffer 1600 limit 3000
	tc qdisc replace dev eth1 parent 3:2 handle 20: tbf rate $1 buffer 1600 limit 3000
	
 	;;
  192.168.2.96/27)
	tc qdisc replace dev eth2 parent 1:3 handle 30: tbf rate $1 buffer 1600 limit 3000
	tc qdisc replace dev eth0 parent 2:3 handle 30: tbf rate $1 buffer 1600 limit 3000
	tc qdisc replace dev eth1 parent 3:3 handle 30: tbf rate $1 buffer 1600 limit 3000
	
 	;;
  192.168.2.128/27)
	tc qdisc replace dev eth2 parent 1:4 handle 40: tbf rate $1 buffer 1600 limit 3000
	tc qdisc replace dev eth0 parent 2:4 handle 40: tbf rate $1 buffer 1600 limit 3000
	tc qdisc replace dev eth1 parent 3:4 handle 40: tbf rate $1 buffer 1600 limit 3000
 	;;
  192.168.2.160/27)
	tc qdisc replace dev eth2 parent 1:5 handle 50: tbf rate $1 buffer 1600 limit 3000
	tc qdisc replace dev eth0 parent 2:5 handle 50: tbf rate $1 buffer 1600 limit 3000
	tc qdisc replace dev eth1 parent 3:5 handle 50: tbf rate $1 buffer 1600 limit 3000
	
 	;;
  192.168.2.192/27)
	tc qdisc replace dev eth2 parent 1:6 handle 60: tbf rate $1 buffer 1600 limit 3000
	tc qdisc replace dev eth0 parent 2:6 handle 60: tbf rate $1 buffer 1600 limit 3000
	tc qdisc replace dev eth1 parent 3:6 handle 60: tbf rate $1 buffer 1600 limit 3000
	
 	;;
  192.168.2.224/27)
	tc qdisc replace dev eth2 parent 1:7 handle 70: tbf rate $1 buffer 1600 limit 3000
	tc qdisc replace dev eth0 parent 2:7 handle 70: tbf rate $1 buffer 1600 limit 3000
	tc qdisc replace dev eth1 parent 3:7 handle 70: tbf rate $1 buffer 1600 limit 3000
	
 	;;
  *)
	echo "La subred especificada no es correcta"
	;;
esac