#!/bin/bash

i=1000000 # increment
m=100000000 # max

if [ ! -e $m.txt ]; then
    python3 generate.py $m > $m.txt # generate m random numbers from [0,1)
fi

rm -f dc.txt it.txt

for n in `seq $i $i $m`
do
    { time -p head -n $n $m.txt | python3 min_max.py dc >> dc.txt ; } 2> dc.time
    { time -p head -n $n $m.txt | python3 min_max.py it >> it.txt ; } 2> it.time

    cat dc.time it.time | tr '\n' ' ' \
	| awk -v n=$n '{a=$4+$6; b=$10+$12; print n ": " a", " b}'
done

diff dc.txt it.txt
rm -f dc.txt it.txt
