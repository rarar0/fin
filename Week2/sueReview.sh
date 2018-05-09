#Hi Sue! When changing directory, you would want to specify a path, such as Documents.
#"cd dir" Won't work because there is no directory called dir (Unless you use mkdir dir)

#! /bin/sh
#Sue's linux script

#First line
echo I hope this works

#check directory
ls

#check present directory
pwd

#change directory
cd Documents

#Create files
touch bills.txt
touch users.txt
touch desktops.txt
touch laptops.txt
touch emails.txt

#make directories
mkdir Finance
mkdir Users
mkdir Computers

#move files to appropriate folders
mv bills.txt Finance
mv users.txt emails.txt Users
mv desktops.txt laptops.txt Computers

#check files with wildcard
echo *.txt

#find users and sort
find dir users.txt -print
sort users.txt

#One small edit
