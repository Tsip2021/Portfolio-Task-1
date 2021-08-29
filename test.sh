#!/bin/bash

nonemptyfile=0
nonemptydir=0
emptyfile=0
emptydir=0

#Begin of the loop
for item in /$1/*; do
    if [ -f $item ]; then
        if [ -s $item ]; then
            let nonemptyfile++
        else
            let emptyfile++
        fi
    fi

    if [ -d $item ]; then
        if [ $(ls -A $item) ]; then
            let nonemptydir++
        else
            let emptydir++
        fi
    fi
done

    

    #if [[ -d $item ]] && [[ $(ls -A $item) ]]; then
       # ls $item
   # else
     #   let emptydir++
   # fi
#done

echo "Dir Name: $1"
echo "$nonemptyfile files that contain data"
echo "$emptyfile files that are empty"
echo "$nonemptydir"
echo "$emptydir"

exit 0