#! /bin/bash
#CSCI 2461-70
#Alex Malm

#Use fdisk to look at your disks
echo "Use of fdisk and the -l option to look at your devices"
sleep 3
sudo fdisk -l
sleep 3

#Check yo disks
echo "Use of fsck on a specific drive"
sleep 2
sudo fsck /dev/sdb1
sleep 2

#Create a thing, mount and unmount it
cd ~/Documents
touch bingo.img
dd if=/dev/zero of=~/Documents/bingo.img bs=1024 count=128
sudo mkfs -t ext4 ~/Documents/bingo.img
mkdir ~/mountie
sudo mount -t ext4 ~/Documents/bingo.img ~/mountie
mount | less
sleep 3
sudo umount -t ext4 ~/Documents/bingo.img ~/mountie

rm ~/Documents/bingo.img
rmdir ~/mountie
cd ~