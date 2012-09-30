package main

import (
        "fmt"
        "flag"
        "strconv"
)

func ackermann(m int, n int) int {
    if m == 0 {
        return n+1
    }
    if n == 0 {
        return ackermann(m-1, 1)
    }
    return ackermann(m-1, ackermann(m, n-1))
}

func main() {
    flag.Parse()
    argv := flag.Args()
    m, _ := strconv.Atoi(argv[0])
    n, _ := strconv.Atoi(argv[1])
    fmt.Println(ackermann(m, n))
}
