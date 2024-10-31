#!/bin/bash

i=100000 # increment
m=1000000 # max

if [ ! -e $m.txt ]; then
    python3 generate.py $m > $m.txt # generate m random numbers from [0,1)
fi

ghc min_max.hs
rm -f dc.txt it.txt hs.txt

printf "n\tPy(D&C)\tPy(it)\tHaskell\n"
for n in `seq $i $i $m`
do
    head -n $n $m.txt > ns.txt
    { time -p python3 min_max.py ns.txt dc >> dc.txt ; } 2> dc.time
    { time -p python3 min_max.py ns.txt it >> it.txt ; } 2> it.time
    { time -p ./min_max ns.txt >> hs.txt ; } 2> hs.time

    cat dc.time it.time hs.time | tr '\n' ' ' \
	| awk -v n=$n '{a=$4+$6; b=$10+$12; c=$16+$18; print n"\t"a"\t"b"\t"c}'
done

diff dc.txt it.txt
diff dc.txt hs.txt
rm -f dc.txt it.txt hs.txt
