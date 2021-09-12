#!/bin/bash

awk -F, 'BEGIN{OFS=",";} { t = $1; $1 = $3; $3 = t; print; } ' $1 > ../tmp/tem1.csv
awk -F, 'BEGIN{OFS=",";} { t = $2; $2 = $5; $5 = t; print; } ' ../tmp/tem1.csv > ../tmp/tem2.csv
awk  'BEGIN { FS=OFS= "," };{sub("T"," ",$1); print}' ../tmp/tem2.csv > ../tmp/tem3.csv
awk  'BEGIN { FS=OFS= "," };{sub("Z","",$1); print}' ../tmp/tem3.csv > ../tmp/tem4.csv
tail -n +2 ../tmp/tem4.csv > ../tmp/tem5.csv
nl -s , ../tmp/tem5.csv > ../tmp/tem6.csv
cat ../resources/headers.txt > "../results/fixed-"$1
cat ../tmp/tem6.csv >> "../results/fixed-"$1
