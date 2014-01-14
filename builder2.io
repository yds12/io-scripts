Builder := Object clone

# If an argument is of type Number, it indicates the nesting level of the
# call. This will be used to indent the XML code
Builder forward := method(

	nesting := 0

	call message arguments foreach(arg,
		if(arg type == "Number",
			nesting = arg
			break
		)
	)

	indent := ""
	for(i, 0, nesting, indent := indent .. "    ")

	writeln(indent .. "<", call message name, ">")

	call message arguments foreach(arg,
		if(arg type == "Message",
			arg arguments = arg arguments insertAt(nesting + 1, 0)
			content := self doMessage(arg);

			if(content type == "Sequence",
				writeln("    " .. indent .. content)
			)
		)
	)

	writeln(indent .. "</", call message name, ">")
)
