#!/bin/bash

LISTT=$(ls -1 /proc | grep "^[[:digit:]]*$" ) 
for PID in $LISTT
do
	if [ -d "/proc/$PID" ] && [ -r "/proc/$PID/exe" ]

	then
		readlink /proc/$PID/exe | awk -v pid=$PID '{if (substr($0, 0, 7) == "/sbin/") {print pid}}'
	fi
done > task3.out

