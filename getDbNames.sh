#!/bin/bash  
#Example to split a string using trim (tr) command  
  
my_str="We;welcome;you;on;javatpoint."  
my_arr=($(echo $my_str | tr ";""\n"))  
  
for i in "${my_arr[@]}"  
do  
echo $i  
done  
