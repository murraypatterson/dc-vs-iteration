import sys
import math

# load list a from file handle h
def load_a(h=sys.stdin) :

    a = []

    x = h.readline()
    while x :
        a.append(float(x.strip()))

        x = h.readline()

    return a

# divide and conquer method for min, max of list a
def min_max_dc(a) :
    n = len(a)

    # base case: min = max = only element
    if n == 1 :
        return a[0], a[0]

    # recursive case: a has at least 2 elements
    mid = n//2

    min_l, max_l = min_max_dc(a[:mid]) # recursive call
    min_r, max_r = min_max_dc(a[mid:])

    mini = min(min_l, min_r) # combine solutions
    maxi = max(max_l, max_r)

    return mini, maxi

# iterative method for min, max of list a
def min_max_it(a) :

    mini = a[0]
    maxi = a[0]
    for e in a :

        if e < mini :
            mini = e

        if e > maxi :
            maxi = e

    return mini, maxi

# Main

a = load_a(open(sys.argv[1],'r'))

mini, maxi = None, None
if sys.argv[2] == 'dc' :
    mini, maxi = min_max_dc(a) # run d&c version
else :
    mini, maxi = min_max_it(a) # run iterative version

print('{:.10f} {:.10f}'.format(mini, maxi))
