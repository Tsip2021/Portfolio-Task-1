#!/bin/bash

#Student Name: Tsui Shan IP
#Student ID: 10543651

#Task 4:
#Allow user to search for specific lines in a server access log and save those lines written to a new file for further use

file="${1:-access_log.txt}" #Variable with default value to hold the file to search
matches=0 #Counter to hold the total number of matches from any pattern
check=1 #Variable to confirm if the user wants to continue searching

while [ $check = 1 ]; do
    read -p "Please Enter the Search Pattern: " pattern

        while true; do
            echo -e "1) Whole Word Match\n2) Any Match\n3) Inverted Match"
            read -p "Please Select the Search Method [1, 2 or 3]: " method
            if [ $method -gt 3 ]; then
                echo "Invalid Search Method! Please Try Again!"
            else
              #  echo "$pattern + $method"
                break
            fi
        done





    echo -e "1: Yes \n2: No"
    read -p "Start a New Search [1 or 2]: " check #check if the user wants to continue. Program terminates if the users enters 2 or any other thing apart from 1
done

exit 0