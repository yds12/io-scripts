Actor := Object clone

Actor set := method(name, time,

	self name ::= name
	self time ::= time

)

Actor run := method(

	c := 0
	while(c < 10,
		writeln(name)
		wait(time)
		c = c + 1
	)

)

fast := Actor clone do(set("Fast", 0.1))
slow := Actor clone do(set("Slow", 0.2))

slow @@run
fast @@run
wait(3)
