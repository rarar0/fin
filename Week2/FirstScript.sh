#!/bin/bash
#CSCI 2461
#Alex Malm

#First Script

#echo
echo "This is a test of my shell script"

#Shows file paths
ls -l

#Shows current path
pwd

#changes current directory to domuments
cd ~/Documents

#Shows /Documents
ls -l

#Makes 2 files
touch Bingo.txt Bongo.txt

#shows 2 new files
ls -l

#Changes Bingo.txt to Bongo2.txt
mv Bingo.txt Bongo2.txt

#Bingo is now named Bongo2
ls -l

#Writes "THE SHOES" to Bongo2.txt

echo "THE SHOES" >> Bongo2.txt

#Reads Bongo2
cat Bongo2.txt

#Copies Bongo2 to Bongo
cp Bongo2.txt Bongo.txt

echo "TWO SHOES" >> Bongo2.txt

mkdir Ringo

mv Bongo2.txt Ringo
mv Bongo.txt Ringo

cd Ringo
ls -l

echo "Reading contents of Bongo2"

cat Bongo2.txt

rm Bongo2.txt

rm Bongo.txt

cd ~/Documents

rmdir Ringo
