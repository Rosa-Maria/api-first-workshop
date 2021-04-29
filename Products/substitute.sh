#!/bin/sh
file=$1
echo "replacing substitutions with environment vars for file $file"
list=$(grep -wo "\\$\S\S*\\$" $file | sort -u | tr '$' '\n')
echo $list;
for thing in ${list[@]}; do sed -i 's/\$\$'$thing'\$\$/'$"${!thing}"'/g' $file; done