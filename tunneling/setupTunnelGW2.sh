#!/bin/sh
ip tunnel add foo mode sit remote 10.0.0.1
ip link set foo up
ip -6 r add 2000::/3 dev foo