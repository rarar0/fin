#!/bin/bash
#CSCI 2461-70
#Alex Malm

echo "Lets take a look at grub cfg!"
sleep 2
cat /usr/share/grub/default/grub | less

echo "Lets try it another way!"
sleep 3
grub-mkconfig

echo "Messing around with boot files is dangerous! Be careful."