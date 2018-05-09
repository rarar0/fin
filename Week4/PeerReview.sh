#!/bin/bash
#Rony Valle Lopez
#Chapter 4 script
#Alex Malm Review/revision

#The script overall gives a good base

#the following script allows you to see your Devices that can be formatted 
#and it also starts fdisk so you can format your device.

#the amount of space available in your devices


echo
echo ------------available disk space in your devices--------------
echo
#displays available disk space
df

echo
echo -------------choose the device you want to format-------------
echo
#command that shows you attached storage devices
lsblk 
echo
echo ------------create you partition using fdisk-----------------
echo
#this command starts the program fdisk which allows you to format a storage device
#and allows the creation of partition tables. 
fdisk -l