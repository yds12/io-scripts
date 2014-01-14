List2 := Object clone

List2 dim := method(x, y,
	self lines := list

	for(i, 0, y - 1,
		self lines append(list)

		for(j, 0, x - 1,
			self lines at(i) append(nil)
		)
	)
	self lines
)

List2 set := method(x, y, value,
	lines at(x) atPut(y, value)
)

List2 get := method(x, y,
	lines at(x) at(y)
)

List2 transpose := method(
	oldLines := lines
	self lines := list

	y := oldLines size
	
	if(y == 0, return)

	x := oldLines at(0) size

	for(i, 0, x - 1,
		lines append(list)

		for(j, 0, y - 1,
			lines at(i) append(oldLines at(j) at(i))
		)
	)
	lines
)

List2 fromFile := method(fileName,
	f := File with(fileName)
	f openForReading

	y := f readLine asNumber
	x := f readLine asNumber
	
	self lines := list

	for(i, 0, y - 1,
		lines append(list)

		for(j, 0, x - 1,
			lines at(i) append(f readLine asNumber)
		)
	)

	f close
)

List2 toFile := method(fileName,
	f := File with(fileName)
	f remove
	f openForAppending

	y := self lines size
	x := 0
	
	if(y != 0, x = self lines at(0) size)

	f write(y asString)
	f write("\n")
	f write(x asString)
	f write("\n")

	for(i, 0, y - 1,
		for(j, 0, x - 1,
			line := self get(i, j) asString
			f write(line)
			f write("\n")
		)
	)

	f close
)
