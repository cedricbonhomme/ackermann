package main

import (
        "fmt"
        "flag"
        "strconv"
)

// Directly from definition
func ackermann(m int, n int) int {
    if m == 0 {
        return n+1
    }
    if n == 0 {
        return ackermann(m-1, 1)
    }
    return ackermann(m-1, ackermann(m, n-1))
}


// Precomputed for small m
func formula_ackermann(m int, n uint) uint {
    for {
        switch m {
            case 0:
                return n + 1
            case 1:
                return n + 2
            case 2:
                return (n << 1) + 3
            case 3:
                return (1 << (n+3)) - 3
            default: {
                if (n == 0) {
                    n = 1
                } else {
                    n = formula_ackermann(m, n - 1)
                }
                m--
                break
            }
        }
    }
    return uint(42) // mandatory, compiler bug?
}

func main() {
    flag.Parse()
    argv := flag.Args()
    m, _ := strconv.Atoi(argv[0])
    n, _ := strconv.Atoi(argv[1])
    fmt.Println(ackermann(m, n))
    //o := uint(n)
    //fmt.Println(formula_ackermann(m, o))
}
