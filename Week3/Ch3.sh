#!/bin/bash
#Networking 3 Linux
#Alex Malm
#Ch. 3
cd ~/Documents

echo "Dev/zero is directed to a file Zero.txt using the dd command"
touch Zero.txt

sleep 3

dd if=/dev/zero of=Zero.txt bs=512 count=1
hexdump Zero.txt | less

sleep 3

echo "Current Directory is changed to documents, and output from udevadm is sent to devices.txt"
touch devices.txt

sleep 3

udevadm info --query=all --name=/dev/sda >> devices.txt
head devices.txt

sleep 3

echo "Next, we will view the udevadm monitor. "

sleep 3

udevadm monitor
rm Zero.txt
rm devices.txt
cd ~