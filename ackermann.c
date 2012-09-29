
// Directly from definition
unsigned int naive_ackermann(unsigned int m, unsigned int n) {
    calls++;
    if (m == 0)
        return n + 1;
    else if (n == 0)
        return naive_ackermann(m - 1, 1);
    else
        return naive_ackermann(m - 1, naive_ackermann(m, n - 1));
}

// Partially iterative
unsigned int iterative_ackermann(unsigned int m, unsigned int n) {
    calls++;
    while (m != 0) {
        if (n == 0) {
            n = 1;
        } else {
            n = iterative_ackermann(m, n - 1);
        }
        m--;
    }
    return n + 1;
}