#!/bin/bash  
#Example for bash split string without $IFS  
  
read -p "Enter any string separated by colon(:) " str #reading string value  
  
readarray -d : -t strarr <<<"$str" #split a string based on the delimiter ':'  
  
printf "\n"  
  
#Print each value of Array with the help of loop  
for (( n=0; n < ${#strarr[*]}; n++ ))  
do  
echo "${strarr[n]}"  
done  
