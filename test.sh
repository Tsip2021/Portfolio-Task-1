#!/bin/bash
clear

search_file="${1:-access_log.txt}" #variable with default value to hold the file to search
matches=0 #counter to hold the total number of matches from any pattern


check=1 #to confirm if the user wants to continue searching patterns

while [ "$check" -eq 1 ] #this loop runs as long as check equal to 1 and breaks otherwise
do
    read -p "Enter a search pattern: " search_pattern #varible to hold user search pattern

    echo -e "Options: \n\n\t1. Full word match \n\t2. Any word match \n\t3. Inverted match" #pattern search options available
    read -p "Option: " option #variable to hold user selected option

    while [  -z "$option" ] #condition to check if the user actually entered a valid option. Prompts the user until the available option is entered
    do
        echo "Invalid option"
        read -p "Option: " option
    done

######### Search Process for Option 1: Full word Match ######### 
    if [ "$option" -eq 1 ]
        then
            echo -e "\n-----Full word match[s]-----\n"
            matches=$(grep -o -i -w $search_pattern $search_file | wc -l) #determining the total number of full word matches

            if [ "$matches" -le 0 ]
            then
                echo -e "No matches found\n"                
            else        
                echo "$matches matches found"           
                echo -e "\n-----Result-----\n"
                grep -i -w -n $search_pattern $search_file         #printing out the match words/lines with their corresponding line numbers
            fi

######### Search Process for Option 2: Any word Match ######### 
        elif [ "$option" -eq 2 ]
        then
            echo -e "\n-----Any word match-----\n"            
            matches=$(grep -o -i $search_pattern $search_file | wc -l) #determining the total number of any word matches

            if [ "$matches" -le 0 ]
            then
                echo -e "No matches found\n"                
            else        
                echo "$matches matches found"           
                echo -e "\n-----Result-----\n"
                grep -o -i -n $search_pattern $search_file  #printing out the match words/lines with their corresponding line numbers
            fi

######### Search Process for Option 3: Inverted Match ######### 
        elif [ "$option" -eq 3 ]
        then
            echo -e "\n-----Inverted match----\n"        
            matches=$(grep -v $search_pattern $search_file | wc -l)  #determining the total number of inverted word matches

            if [ "$matches" -le 0 ]
            then
                echo -e "No matches found\n"                
            else        
                echo "$matches matches found"           
                echo -e "\n-----Result-----\n"
                grep -v -i -n $search_pattern $search_file  #printing out the match words/lines with their corresponding line numbers
            fi    
    fi
    echo -e "\n\nContinue? \n\t1: Yes \n\t2: No"
    read -p ">>" check #check if the user wants to continue. Program terminates if the users enters 2 or any other thing apart from 1
    echo -e "\n"
  
done

exit 0