def generate_primes(limit):
    count = 0
    n = 2
    y = []
    while count < limit:
        print("Total primes found:", count)
        div_count = 0
        for divisor in range(1, int(n / 2) + 1):
            if (n % divisor == 0):
                div_count += 1
            elif div_count > 1:
                break
        if div_count <= 1:
            count += 1
            y.append(n)
        n += 1
    x = list(range(count))
    return x, y
