#!/bin/bash

ERROR=0

file1=$1
file2=$2
file3=$3


function show_usage() {
  printf "Usage: ${0} [file1 file2 file3]\n"
}

function show_help() {
  printf "File(s) specified do not exist\n"
  show_usage
}

[ ! -e "$file1" ] && show_help && exit 1
[ ! -e "$file2" ] && show_help && exit 1 
[ ! -e "$file3" ] && show_help && exit 1 

if [ $# -lt 3 ]; then
  printf "Not enough arguments provided\n"
  show_usage
  exit 1
fi

for file in $file1 $file2 $file3; do
  zcat $file >> tmp1
done

sort tmp1 > outfile

rm -f tmp1

exit 0
