#!/bin/bash

#Student Name: Tsui Shan IP
#Student ID: 10543651

#Task 1: 
#Calculates the sum of three (3) integers entered through the command line.
#If the sum exceeds 30, give the user a warning message and exit the script

#Begin of the script
#Calculates the sum of three integers that user entered through the command line and assign it to the variable: sum
sum=$(($1+$2+$3))

#Check whether the sum is less than or equal to 30
if [[ $sum -le 30 ]]; then
    echo "The sum of $1 and $2 and $3 is $sum" #Message if the sum is less than or equal to 30
    exit 0
else
    echo "Sum exceeds maximum allowable" #Message if the sum is greater than 30
    exit 1
fi

exit 0
#End of the script