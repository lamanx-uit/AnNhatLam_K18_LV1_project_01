#!/bin/bash

# Convert date format in test.csv to epoch time and save to test1.csv
awk -v FPAT="([^,]*)|(\"([^\"]|\"\")*\")" -v OFS="," '{
    if (NR==1) print $0
    else {
        split($16, parts, "/")
        year=parts[3]
        if (year<25) full_year=year+2000
        else full_year=year+1900
        $16=mktime(full_year " " parts[1] " " parts[2] " 00 00 00")
        print $0
    }
}' tmdb_movie.csv > test1.csv

# Sort test1.csv by timestamp (column 16) in descending order and convert back to human-readable date
awk -v FPAT="([^,]*)|(\"([^\"]|\"\")*\")" -v OFS="," '{
    if (NR == 1) {
        header = $0
    } else {
        lines[NR] = $0
        timestamps[NR] = $16
        human_date = strftime("%Y-%m-%d", $16)
        $16 = human_date
        lines[NR] = $0
    }
}
END {
    print header
    n = asorti(timestamps, indices, "@val_num_desc")
    for (i = 1; i <= n; i++) {
        print lines[indices[i]]
    }
}' test1.csv > sorted_movies.csv
