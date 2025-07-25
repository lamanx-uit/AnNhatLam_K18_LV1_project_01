#!/bin/bash

# Bai 2
awk -v FPAT="([^,])|(\"([^\"]|\"\")\")" -v OFS="," '$18>7.5 {print}' tmdb-movies.csv > bai2.csv

# Bai 3
awk -F',' 'NR>1{
if(min=="" || $5<min) min=$5
if(max=="" || $5>max) max=$5
data[NR]=$0
revenue[NR]=$5
}
END {
for(i in data) {
if(revenue[i]==min) print data[i]}
for(j in data) {
if(revenue[j]==max) print data[j]}
}' fixed_tmdb.csv > bai3.csv

# Bai 4
awk -F',' 'NR>1{
sum += $5}
END {
print sum }' fixed_tmdb.csv > bai4.csv

# Bai 5
awk -F',' 'NR>1{profit=($5-$4); print profit, $0}' fixed_tmdb.csv | sort -nr | head -n 10 > bai5.csv
