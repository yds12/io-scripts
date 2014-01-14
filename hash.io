# Makes the curly brackets create a new Map, and parse its internal contents
curlyBrackets := method(

	h := Map clone

	call message arguments foreach(arg,
		h doMessage(arg)
	)

	h

)

# Makes the "key:value" inside the hash translate to atPut(key, value)
OperatorTable addAssignOperator(":", "hashPut")

# Implements the hashPut method
Map hashPut := method(

	self atPut(call evalArgAt(0), call evalArgAt(1))

)
