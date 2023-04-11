ip link set tap0 nomaster
ip tuntap del tap0 mode tap
ip link set down dev br0
ip link del br0
ip route add default via 172.28.112.1 dev eth0