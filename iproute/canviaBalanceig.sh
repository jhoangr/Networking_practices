#!/bin/bash
#ip route del default
#script per canviar el balanceig de càrrega entre els eth0 i eth1.
ip route change default scope global nexthop via 192.168.0.1 dev eth0 weight $1 \nexthop via 192.168.1.1 dev eth1 weight $2