#!/bin/bash

#Student Name: Tsui Shan IP
#Student ID: 10543651

#Task 1: 
#Calculates the sum of three (3) integers entered through the command line
#If the sum exceeds 30, give the user a warning message and exit the script

#Calculates the sum of three integers that user entered through the command line and save it to a new variable: sum
sum=$(($1+$2+$3))

if [[ $sum -le 30 ]]; then #Check whether the sum is less than or equal to 30
    echo "The sum of $1 and $2 and $3 is $sum" #Message if the sum is less than or equal to 30
    exit 0 #Exit the script without errors
else
    echo "Sum exceeds maximum allowable" #Message if the sum is greater than 30
    exit 1 #Exit the script with errors
fi

exit 0