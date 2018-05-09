#!/bin/bash
#Alex Malm 
#A R C H L I N U X


echo "Creates a Directory called Chapter8"
sleep 3
cd ~
mkdir ~/Chapter8
cd ~/Chapter8
echo "Creates a subdirectory with input from user"
sleep 2
echo "What would you like to name your new directory?"
read DIR_NAME
mkdir ~/Chapter8/${DIR_NAME}
sleep 1
echo "Directory $DIR_NAME has been created!"

echo "Lets create a text file (to be used later)"
echo "What would you like to name the file you are creating?"
read FILE_NAME
touch ~/Chapter8/${FILE_NAME}.txt
sleep 1
echo "I created a file called ${FILE_NAME}.txt"
sleep 1

#Next we will place some information into a new file
echo "Please input a new filename for storage space information"
read SYS
touch ~/Chapter8/${SYS}.txt
echo "---RAM---" >> ${SYS}.txt
vmstat >> ${SYS}.txt
echo "---Disk information---" >> ${SYS}.txt
lsblk >> ${SYS}.txt
sudo fdisk -l >> ${SYS}.txt
echo "---USB information---" >> ${SYS}.txt
lsusb >> ${SYS}.txt
sleep 2
echo "We will now read this text file with the cat command"
sleep 2
cat ~/Chapter8/${SYS}.txt | less

echo "A blank file will be created, mounted, and filled with the hacker's manifesto"

sleep 3

mkdir -p ~/Chapter8/testMount/test
touch ~/Chapter8/testMount/1337.img
echo "Created ~/Chapter8/testMount/test"

sleep 3
#Using DD to make a blank image
dd if=/dev/zero of=~/Chapter8/testMount/1337.img bs=1M count=4
sudo mkfs -t ext4 ~/Chapter8/testMount/1337.img

#Mount the image to /testMount/Test
echo "Mounting..."
sudo mount -t ext4 ~/Chapter8/testMount/1337.img ~/Chapter8/testMount/test

#writes the hackers manifesto to our text file we created earlier, then copies to our mount point
echo "We explore... and you call us criminals. We seek after knowledge... and you call us criminals. We exist without skin color, without nationality, without religious bias... and you call us criminals. You build atomic bombs, you wage wars, murder, cheat, and lie to us and try to make us believe it's for our own good, yet we're the criminals. Yes I am a criminal. My crime is that of curiosity. My crime is that of judging people by what they say and  think, not what they look like. My crime is that of outsmarting you, something that you will never forgive me. I am a hacker, and this is my manifesto. You may stop this individual, but you can't stop us all...after all, we're all alike." >> ~/Chapter8/${FILE_NAME}.txt
sudo cp ~/Chapter8/${FILE_NAME}.txt ~/Chapter8/testMount/test/MANIFESTO.txt
sudo umount ~/Chapter8/testMount/test

#Hexdumping our image
hexdump -C ~/Chapter8/testMount/1337.img | less

cd ~
clear
echo "Press enter to delete all this crap we made"
read
sudo rm -rf ~/Chapter8