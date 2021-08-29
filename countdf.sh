#!/bin/bash

#Student Name: Tsui Shan IP
#Student ID: 10543651

#Task 3:
#Counts the number of files and child directories within a specific directory according to a specified property

nonemptyfile=0 #Variable to hold number of files with data
nonemptydir=0 #Variable to hold number of non-empty directories
emptyfile=0 #Variable to hold number of files without data
emptydir=0 #Varibale to hold number of empty directories

#Begin of the loop
for item in /$1/*; do
    if [ -f $item ]; then #Check if the item is a file
        if [ -s $item ]; then #Check if the file contain data
            let nonemptyfile++ #Increase the number of files with data by one each time if we find a file with data
        else
            let emptyfile++ #Increase the number of files without data by one each time we find a file without data
        fi
    fi

    if [ -d $item ]; then #Check if the item is a directory
        if [ "$(ls -A $item)" ]; then #Check if the directory contain data
            let nonemptydir++ #Increase the number of directories with data by one each time if we find a directory with data
        else
            let emptydir++ #Increase the number of directories without data by one each time if we find a directory without data
        fi
    fi
done #End of the loop

#Output the result
echo "The $1 directory contains:"
echo "$nonemptyfile files that contain data"
echo "$emptyfile files that are empty"
echo "$nonemptydir non-empty directories"
echo "$emptydir empty directories"

exit 0