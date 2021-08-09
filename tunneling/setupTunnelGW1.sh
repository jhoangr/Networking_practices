#!/bin/sh
#creamos túnel asignando como host del otro extremo GW2
ip tunnel add foo mode sit remote 10.0.3.2
#activamos el túnel
ip link set foo up
#añadimos regla para enrutar el tráfico IPv6 hacia el túnel
ip -6 r add 2000::/3 dev foo