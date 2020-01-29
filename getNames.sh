#!/bin/bash

IFS=';' read -ra NAMES <<< "$STR"    #Convert string to array

#Print all names from array
for i in "${NAMES[@]}"; do
    echo $i
done
