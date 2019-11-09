#!/bin/bash

LIST=""

LISTT=$(ls -1 /proc | grep "^[[:digit:]]*$" ) 

for PID in $LISTT
do
	if [ -d "/proc/$PID" ]
	then
		RES_MEM=$(awk '{print $2}' < "/proc/$PID/statm")
		SH_MEM=$(awk '{print $3}' < "/proc/$PID/statm")
		DIFF_MEM=$(( RES_MEM - SH_MEM ))
		LIST+="$PID:$DIFF_MEM"
		LIST+=$'\n'
	fi
done

sort -nr --field-separator=':' -k2 <<<$LIST | head -n -1 >task4.out
