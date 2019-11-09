#!/bin/bash

for pid in $(ps ax -o pid | tail -n +2); do
    statusPid=$(grep -P "^Pid:" /proc/$pid/status | grep -o -P '\d*')
    statusPpid=$(grep -P "^PPid:" /proc/$pid/status | grep -o -P '\d*')
    sleepAvg=$(grep -P "avg_atom" /proc/$pid/sched | grep -o -P '\d*')

    if [[ -z $statusPid ]] ; then
        continue
    fi

    if [[ -z $statusPpid ]] ; then
        statusPpid=0
    fi

    if [[ -z $sleepAvg ]] ; then
        sleepAvg=0
    fi

    echo "ProcessID=$statusPid : Parent_ProcessID=$statusPpid : Average_Sleeping_Time=$sleepAvg"
done | sort --key=2 -V > "kek.log"
