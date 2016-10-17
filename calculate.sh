#!/bin/bash

set -euo pipefail

# results data processing and  calculate the average and standard
# deviation.


POSTFIX=".dat"
TEMP="temp"

echo -n "" > set_temp.dat;
echo -n "" > get_temp.dat;
echo -n "" > result.csv;
# First need to process data file
for i in `seq 0 3`; do
	cat vm$i.csv | grep "SET" | cut -d "," -f 2 | cut -d "\"" -f 2 >> "set_temp.dat"
done


for j  in `seq 0 3`; do
	cat vm$j.csv | grep "GET" | cut -d "," -f 2 | cut -d "\"" -f 2 >> "get_temp.dat"
done



cat set_temp.dat | awk  '{sum += $1; sumsq += ($1 * $1) } END {sqd = sumsq / NR - (sum / NR)^2; if(sqd < 10^-8) sqd = 0; print "set"  ", "sum / NR ", " sqrt(sqd)}' >> result.csv


cat get_temp.dat | awk  '{sum += $1; sumsq += ($1 * $1) } END {sqd = sumsq / NR - (sum / NR)^2; if(sqd < 10^-8) sqd = 0; print "get"  ", "sum / NR ", " sqrt(sqd)}' >> result.csv 

echo "please check the result in result.csv"
