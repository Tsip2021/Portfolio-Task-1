#!/bin/bash

#Student Name: Tsui Shan IP
#Student ID: 10543651

#Task 4:
#Allow user to search for specific lines in a server access log and save those lines written to a new file for further use

file="${1:-access_log.txt}" #Variable with default value to hold the file to search
matches=0 #Counter to hold the total number of matches from any pattern
check=1 #Variable to confirm if the user wants to continue searching

#Begin of the loop
while [ $check = 1 ]; do
    read -p "Please Enter the Search Pattern: " pattern

        while true; do
            echo -e "1) Whole Word Match\n2) Any Word Match\n3) Inverted Match"
            read -p "Please Select the Search Method [1, 2 or 3]: " method
            if [[ $method != [1-3] ]]; then
                echo "Invalid Search Method! Please Try Again!"
            else
                break
            fi
        done

        if [ $method = 1 ]; then #Search process for method 1: Whold Word Match
            echo -e "\n-----Full word match[s]-----"
            matches=$(grep -o -i -w $pattern $file | wc -l) #Determine the total number of full word matches

            if [ "$matches" -le 0 ]; then
                echo -e "No matches found\n"                
            else        
                echo "$matches matches found"           
                echo -e "\n-----Result-----"
                grep -i -w -n $pattern $file #Print out the match words/lines with their corresponding line numbers
                echo -e "-----End-----"
                echo -e "\n"
            fi

        elif [ $method = 2 ]; then #Search process for method 2: Any Word Match
            echo -e "\n-----Any Word Match-----"            
            matches=$(grep -o -i $pattern $file | wc -l) #Determine the total number of any word matches

            if [ "$matches" -le 0 ]; then
                echo -e "No matches found\n"                
            else        
                echo "$matches matches found"           
                echo -e "\n-----Result-----"
                grep -o -i -n $pattern $file  #Print out the match words/lines with their corresponding line numbers
                echo -e "-----End-----"
                echo -e "\n"
            fi
        
        elif [ $method = 3 ]; then #Search process for method 3: Inverted Match
            echo -e "\n-----Inverted Match----\n"        
            matches=$(grep -v $pattern $file | wc -l)  #Determine the total number of inverted word matches

            if [ "$matches" -le 0 ]; then
                echo -e "No matches found\n"                
            else        
                echo "$matches matches found"           
                echo -e "\n-----Result-----"
                grep -v -i -n $pattern $file  #Print out the match words/lines with their corresponding line numbers
                echo -e "-----End-----"
                echo -e "\n"
            fi    
        fi

    echo -e "1: Yes \n2: No"
    read -p "Start a New Search [1 or 2]: " check #check if the user wants to continue. Program terminates if the users enters 2 or any other thing apart from 1
done #End of the loop

exit 0