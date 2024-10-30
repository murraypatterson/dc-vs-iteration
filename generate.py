import sys
import random

# generate n random numbers from [0,1)

n = int(sys.argv[1])

for i in range(n) :
    print(random.random())
