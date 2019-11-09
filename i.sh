#!/bin/bash

sed 's/\x0/\n/g' /proc/${1}/environ | wc -l;
