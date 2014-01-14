
squareBrackets := method(

	l := List clone

	call message arguments foreach(arg,
		l append(arg)
	)

	l

)
