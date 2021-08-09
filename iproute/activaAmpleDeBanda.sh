#!/bin/sh

#afegim 1 cua amb set bandes de tipus tbf per repartir el tráfic desde el router que va cap els departaments
tc qdisc add dev eth2 root handle 1: prio bands 7
#aquesta cua no té gaire sentit en la part opcional
tc qdisc add dev eth2 parent 1:1 handle 10: tbf rate 10kbit buffer 1600 limit 3000
tc qdisc add dev eth2 parent 1:2 handle 20: tbf rate 20kbit buffer 1600 limit 3000
tc qdisc add dev eth2 parent 1:3 handle 30: tbf rate 30kbit buffer 1600 limit 3000
tc qdisc add dev eth2 parent 1:4 handle 40: tbf rate 40kbit buffer 1600 limit 3000
tc qdisc add dev eth2 parent 1:5 handle 50: tbf rate 50kbit buffer 1600 limit 3000
tc qdisc add dev eth2 parent 1:6 handle 60: tbf rate 60kbit buffer 1600 limit 3000
tc qdisc add dev eth2 parent 1:7 handle 70: tbf rate 70kbit buffer 1600 limit 3000


#afegim 1 cua amb set bandes de tipus tbf per repartir el tráfic desde el router que ve desde els departaments 
#i surt per eth0
tc qdisc add dev eth0 root handle 2: prio bands 7

tc qdisc add dev eth0 parent 2:1 handle 10: tbf rate 10kbit buffer 1600 limit 3000
tc qdisc add dev eth0 parent 2:2 handle 20: tbf rate 20kbit buffer 1600 limit 3000
tc qdisc add dev eth0 parent 2:3 handle 30: tbf rate 30kbit buffer 1600 limit 3000
tc qdisc add dev eth0 parent 2:4 handle 40: tbf rate 40kbit buffer 1600 limit 3000
tc qdisc add dev eth0 parent 2:5 handle 50: tbf rate 50kbit buffer 1600 limit 3000
tc qdisc add dev eth0 parent 2:6 handle 60: tbf rate 60kbit buffer 1600 limit 3000
tc qdisc add dev eth0 parent 2:7 handle 70: tbf rate 70kbit buffer 1600 limit 3000

#afegim 1 cua amb set bandes de tipus tbf per repartir el tráfic desde el router que ve desde els departaments 
#i surt pet eth1
tc qdisc add dev eth1 root handle 3: prio bands 7

tc qdisc add dev eth1 parent 3:1 handle 10: tbf rate 10kbit buffer 1600 limit 3000
tc qdisc add dev eth1 parent 3:2 handle 20: tbf rate 20kbit buffer 1600 limit 3000
tc qdisc add dev eth1 parent 3:3 handle 30: tbf rate 30kbit buffer 1600 limit 3000
tc qdisc add dev eth1 parent 3:4 handle 40: tbf rate 40kbit buffer 1600 limit 3000
tc qdisc add dev eth1 parent 3:5 handle 50: tbf rate 50kbit buffer 1600 limit 3000
tc qdisc add dev eth1 parent 3:6 handle 60: tbf rate 60kbit buffer 1600 limit 3000
tc qdisc add dev eth1 parent 3:7 handle 70: tbf rate 70kbit buffer 1600 limit 3000



#afegim regles de routing que permeten marcar els paquets per després aplicar les regles de filtratge.
#això no té sentit en la part opcional amb múltiples interficies.
ip route add 192.168.2.32/27 dev eth2 scope link realm 1
ip route add 192.168.2.64/27 dev eth2 scope link realm 2
ip route add 192.168.2.96/27 dev eth2 scope link realm 3
ip route add 192.168.2.128/27 dev eth2 scope link realm 4
ip route add 192.168.2.160/27 dev eth2 scope link realm 5
ip route add 192.168.2.192/27 dev eth2 scope link realm 6
ip route add 192.168.2.224/27 dev eth2 scope link realm 7

#Si ens dirigim cap als departaments afegim a les cues els paquets en funció del valor realm.
#això no té sentit en la part opcional amb múltiples interficies.
tc filter add dev eth2 parent 1:0 protocol ip \route to 1 classid 1:1
tc filter add dev eth2 parent 1:0 protocol ip \route to 2 classid 1:2
tc filter add dev eth2 parent 1:0 protocol ip \route to 3 classid 1:3
tc filter add dev eth2 parent 1:0 protocol ip \route to 4 classid 1:4
tc filter add dev eth2 parent 1:0 protocol ip \route to 5 classid 1:5
tc filter add dev eth2 parent 1:0 protocol ip \route to 6 classid 1:6
tc filter add dev eth2 parent 1:0 protocol ip \route to 7 classid 1:7

#Si venim dels departaments classifiquem a les cues en funció del realm per la eth0.
tc filter add dev eth0 parent 2:0 protocol ip \route from 1 classid 2:1
tc filter add dev eth0 parent 2:0 protocol ip \route from 2 classid 2:2
tc filter add dev eth0 parent 2:0 protocol ip \route from 3 classid 2:3
tc filter add dev eth0 parent 2:0 protocol ip \route from 4 classid 2:4
tc filter add dev eth0 parent 2:0 protocol ip \route from 5 classid 2:5
tc filter add dev eth0 parent 2:0 protocol ip \route from 6 classid 2:6
tc filter add dev eth0 parent 2:0 protocol ip \route from 7 classid 2:7

#Si venim dels departaments classifiquem a les cues en funció del realm per la eth1.
tc filter add dev eth1 parent 3:0 protocol ip \route from 1 classid 3:1
tc filter add dev eth1 parent 3:0 protocol ip \route from 2 classid 3:2
tc filter add dev eth1 parent 3:0 protocol ip \route from 3 classid 3:3
tc filter add dev eth1 parent 3:0 protocol ip \route from 4 classid 3:4
tc filter add dev eth1 parent 3:0 protocol ip \route from 5 classid 3:5
tc filter add dev eth1 parent 3:0 protocol ip \route from 6 classid 3:6
tc filter add dev eth1 parent 3:0 protocol ip \route from 7 classid 3:7
