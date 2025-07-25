#! /bin/bash

awk -v FPAT="(\"([^\"]|\"\")*\")|([^,]*)" 'NR>1 {
split($14, parts, "|")
for(i in parts) { if(parts[i] != "") count[parts[i]]++ }
}
END {
for (dir in count) {print count[dir], dir}}' fixed_tmdb.csv > bai7.csv
