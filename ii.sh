#!/bin/bash

ps uax --sort=-start_time | awk '{if (NR == 2) print $0}' | awk 'NR==1 {print $2}'
