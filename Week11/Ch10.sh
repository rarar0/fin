#!/bin/bash
#Alex Malm 

echo "This is how you generate an SSH key!"
echo "ssh-keygen -t rsa -N '' -f /etc/ssh/ssh_host_rsa_key"
echo "Start the ssh service with:"
echo "service sshd start"
sleep 5

echo "Transfer files with SCP!"

echo "scp user@host:filename"
echo "scp file user@host:dir"
echo "scp user1@host1:file user2@host2:dir"
sleep 5
echo "Here are some ways to search open connections with lsof!"
echo "lsof -i"
lsof -i
sleep 3
echo "lsof -i:443"
lsof -i:443
sleep 3
echo "lsof -i:TCP@443"
lsof -i:TCP@443
sleep 3

echo "Now its time for TCPDump"
sleep 3
tcpdump
echo "Your standard TCPDump. Lets try searching for udp connections or port 80"
tcpdump udp or port 80
sleep 3
echo "Lets use nmap for google.com"
nmap google.com

#security services
#ftpd
#telnetd
#rlogind
#rexecd
#fingerd