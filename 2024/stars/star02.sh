#!/usr/bin/bash

#### Part 1 ####

declare -a -i values
declare -i total=0

# report_test VALUES_ARRAY => BOOLEAN
function report_test() (
  declare -rai REPORT=( ${@} )
  declare -ri SIZE=( ${#} )
  declare -i failure=0 nbr=0 d
  # Increasing
  while [ ${failure} -eq 0 ] && [ ${nbr} -lt ${SIZE} ]
  do
    d=$(( ${REPORT[$nbr+1]} - ${REPORT[$nbr]} ))
    if [ ${d} -lt 0 ] || [ ${d} -gt 4 ]
    then
      failure=1
    else
      nbr+=1
    fi
  done
  if [ ${failure} -eq 0 ]
  then
    exit 0
  fi
  failure=0
  nbr=0
  # Decreasing
  while [ ${failure} -eq 0 ] && [ ${nbr} -lt ${SIZE} ]
  do
    d=$(( ${REPORT[$nbr]} - ${REPORT[$nbr+1]} ))
    if [ ${d} -lt 0 ] || [ ${d} -gt 4 ]
    then
      failure=1
    else
      nbr+=1
    fi
  done
  if [ ${failure} -eq 0 ]
  then
    exit 0
  fi
  exit 1
)

while read -a values
do
  echo $( report_test ${values[@]} )
done < ../inputs/input02.txt
