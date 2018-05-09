#!/bin/bash
#Alex Malm 

echo "Lets compare the ifconfig and ip commands"
echo "First, lets try ifconfig"
sleep 2

sudo ifconfig -a
echo "Now lets try ip"
sleep 2
ip

echo "Lets mess around with route"
route -n
sleep 4
echo "You can add and remove routes with the following commands"
echo "route add -net default.gateway.address.255"
echo "route del -net default.gateway.address.255"
sleep 5

echo "Lets try bringing our ethernet interface down and up again"
sleep 3
ifdown enp2s0
ifup enp2s0

echo "traceroute -n"
traceroute -n

echo "Host www.google.com"
host www.google.com

echo "Input an address to ping!"
read PING
ping $PING
sleep 3

echo "arp -n"
arp -n
sleep 3

echo "Lets do some network manager tasks from CLI!
nmcli
sleep 3
nmcli connection show
nmcli device show
sleep 5

echo "Netstat is a really sweet tool! Check to see if people are creepin on you."
netstat -nt
sleep 5

echo "Lets look at your firewall setting with iptables -L"
sleep 2
iptables -L

dhclient eth0
cat /etc/dhcp/dhclient.conf
echo "Here's your dhclient config file"
sleep 10
cat /etc/NetworkManager/NetworkManager.conf
echo "Here's your Networkmanager config file"
sleep 10
echo "Here are the hosts and services files"
sleep 2
cat /etc/hosts
cat /etc/services