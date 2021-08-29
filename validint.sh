#!/bin/bash

#Student Name: Tsui Shan IP
#Student ID: 10543651

#Task 2:
#Prompts the user to enter a two digit numberic code that is either 20 or 40
#No other inputs are to be accepted as valid

while true; do #Begin of the loop

#Prompt user for a two digit numberic code and assign it to a new variable: code
read -p "Please enter a two digit numberic code: " code

#Check whethe the input is 20 or 40. The loop runs as long as the input is not 20 or 40
    if [[ $code != 20 ]] && [[ $code != 40 ]]; then
        echo "Invalid Input! Please Try Again!" #Message if the input is not valid
    else
        break #Exit the loop if the input is valid
    fi
done #End of the loop

echo "Valid Input!" #Message if the input is valid

exit 0