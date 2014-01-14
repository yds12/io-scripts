fib := method(n,
	
	if(n <= 2, return 1)
	return fib(n - 1) + fib (n - 2)

)

fibd := method(n,

	if(n <= 2, return 1)

	last := 1
	penultimate := 1
	res := 0

	for(i, 3, n,
		res = last + penultimate
		penultimate = last
		last = res
	)

	res
)
