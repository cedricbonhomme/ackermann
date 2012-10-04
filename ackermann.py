#! /usr/bin/env python
#-*- coding: utf-8 -*-

import sys
import resource

# Increases Python's recursion limit and the size of the stack.
resource.setrlimit(resource.RLIMIT_STACK, (2**29,-1))
sys.setrecursionlimit(10**6)

def naive_ackermann(m, n):
    """
    Directly from definition
    """
    if m == 0:
        return n + 1
    elif n == 0:
        return naive_ackermann(m - 1, 1)
    else:
        return naive_ackermann(m - 1, naive_ackermann(m, n - 1))

def formula_ackermann(m, n):
    """
    Precomputed for small m
    """
    while m >= 4:
        if n == 0:
            n = 1
        else:
            n = formula_ackermann(m, n - 1)
        m -= 1
    if m == 3:
        return (1 << n + 3) - 3
    elif m == 2:
        return (n << 1) + 3
    elif m == 1:
        return n + 2
    else:
        return n + 1

if __name__ == "__main__":
    # Point of entry in execution mode
    m, n = int(sys.argv[1]), int(sys.argv[2])
    print(naive_ackermann(m, n))
    #print(formula_ackermann(m, n))
