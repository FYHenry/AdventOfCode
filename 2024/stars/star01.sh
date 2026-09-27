#!/usr/bin/bash

#### Part 1 ####

declare -a -i values ll lr
declare -i abs total=0

# dist LEFT RIGHT => ABSOLUTE_VALUE
function dist() (
  declare -ri LEFT=${1} RIGHT=${2}
  if [ ${LEFT} -gt ${RIGHT} ]
  then
    echo $(( $LEFT - $RIGHT ))
  else
    echo $(( $RIGHT - $LEFT ))
  fi
)

while read -a values
do
  ll=(${ll[*]} ${values[0]} )
  lr=(${lr[*]} ${values[1]} )
done < ../inputs/input01.txt

ll=( $(printf '%i\n' ${ll[*]} | sort -n) )
lr=( $(printf '%i\n' ${lr[*]} | sort -n) )

for nbr in $( seq 0 1 $(( ${#ll[*]}-1 )) )
do
  abs=$( dist ${ll[$nbr]} ${lr[$nbr]} )
  echo "|${ll[$nbr]} - ${lr[$nbr]}| = ${abs}"
  total+=${abs}
done

echo -e "\nTotal\n : ${total}"

#### Part 2 ####

declare -ai similarities
declare -i product
total=0
ll=()
lr=()

while read -a values
do
  ll=(${ll[*]} ${values[0]} )
  lr=(${lr[*]} ${values[1]} )
done < ../inputs/input01.txt

ll=( $(printf '%i\n' ${ll[*]} | sort -n -u) )

for value in ${ll[*]}
do
  product=$(($(printf '%i\n' ${lr[*]} | grep ${value} -c) * ${value}))
  if [ ${product} -ne 0 ]
  then
    similarities=( ${similarities[*]}  ${product} )
    total+=${product}
  fi
done

echo -e "\nValue -> Similarity"
for nbr in $( seq 0 1 $(( ${#similarities[*]}-1 )) )
do
  echo "${lr[$nbr]} -> ${similarities[$nbr]}"
done

echo -e "\nTotal similarity\n : ${total}"
