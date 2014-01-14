sum_matrix := method(m,

	sum := 0

	for(i, 0, (m size) - 1,
		for(j, 0, (m at(i) size) - 1,
			sum = sum + (m at(i) at(j))
		)
	)

	sum

)
