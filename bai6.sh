#!/bin/bash

awk -v FPAT="(\"([^\"]|\"\")\")|([^,])" 'NR>1 {
split($9, parts, "|")
for(i in parts) { if(parts[i] != "") count[parts[i]]++ }
}
END {
for (dir in count) {print count[dir], dir}}' fixed_tmdb.csv > bai6a.csv

awk -v FPAT="(\"([^\"]|\"\")\")|([^,])" 'NR>1 {
split($7, parts, "|")
for(i in parts) { if(parts[i] != "") count[parts[i]]++ }
}
END {
for (dir in count) {print count[dir], dir}}' fixed_tmdb.csv > bai6b.csv

sort -nr bai6a.csv | head -1 > bai6.csv
sort -nr bai6b.csv | head -1 >> bai6.csv
