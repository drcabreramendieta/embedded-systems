#!/usr/bin/bash
ip link add name br0 type bridge
ip addr add 172.28.127.140/20 dev br0
ip tuntap add tap0 mode tap
ip link set tap0 master br0
ip route del default via 172.28.112.1 dev eth0
ip link set up dev tap0
ip link set up dev br0
ip link set down dev eth0
ip link set up dev eth0