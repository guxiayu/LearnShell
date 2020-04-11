#! /bin/bash
## this is a test file for remember DAME shell grammar.
## not all but useful
## guxiayu 
#set -x
set -e 


###
# basic var 
###
# basic form
var_one=10

var_two=var_one
#var can't be assigned by another var 
var_three=ss
#not a good style 
#use ""
var_one="string"
# no type

# array

arr_one[0]=12
arr_one[2]="asd"

# no autofill,typecheck
echo -e "===test res for basic form==== "
echo -e "var_one="${var_one}"\nvar_two="${var_two}
echo -e "var_three="${var_three}
echo -e "arr_one="${arr_one}"\narr_two="${arr_one[1]}
echo -e "arr_three="${arr_one[2]}
echo -e "content of arr="${arr_one[@]}
echo -e "===test res for basic form==== "
# local var
# see below 
# use declare 

declare -i sum=13
# useful options -i integer -a array -x export var -r readonly
# test modify
sum="string"

# use set
echo -e "===test res for basic var==== "
echo -e "inner_var="${inner_var}
echo -e "sum="${sum}
echo -e "modify sum="${sum}
echo -e "===test res for basic var==== "
###
# branch
###
# case 
case $1 in 
	"test")
		echo -e "test";;
	*)
		echo -e "default case";;
esac
# if 

if [ "$1" == "test" ];then
	echo "right"
elif [ "$2" != "" ];then
	echo -e "\$2 is not empty"
else 
	echo -e "else situation"

fi
# function

function sayHello() {
	# local var
	local inner_var="secret"
	echo -e "sec="${inner_var}
	# get all arguments
	for temp in $@
	do 
		echo -e ${temp}
	done 
	return 0
	# must be numeric.
}
echo -e "======test for function call========"
sayHello 12 13 14
echo -e "res="$?
echo -e "======test for function call========"
###
# loop
###
# for 

for temp in $*
# travese all arguments
do
	echo -e ${temp}
done
# another style for(C style) 
for (( i=0;i<=10;i=i+1))
do
	echo -e ${i}
done
# while 
i=0
while [ "$i" -le 10 ]
do
	echo -e ${i}
	i=$((i+1))	
done


# until
until [ "$i" == 0 ]
do
#	local var_in_until="test"
#	echo -e "local="${var_in_until}
# 	local can only use in function
	echo -e ${i}
	i=$((i-1)) 
done 




