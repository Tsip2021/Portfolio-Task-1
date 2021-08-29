#!/bin/bash

#Student Name: Tsui Shan IP
#Student ID: 10543651

#Task 2:
#Prompts the user to enter a two digit numberic code that is either 20 or 40
#No other inputs are to be accepted as valid

#Begin of the script
#Prompts the user to enter a two digit number code and assign it to a variable: code
read -p "Please enter a two digit numberic code: " code

#Check whethe the input is valid or not. The loop runs as long as the input is valid
while [[ $code != 20 ]] && [[ $code != 40 ]]
do
echo "Invalid Input! Please Try Again!" #Message if the input is not valid
read -p "Please enter a two digit numberic code: " code
done

echo "Valid Input!" #Message if the input is valid

exit 0
#End of the script