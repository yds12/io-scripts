doFile("hash.io")

Builder := Object clone

# If an argument is of type Number, it indicates the nesting level of the
# call. This will be used to indent the XML code
# If an argument is a Map (like a hash or dictionary), it will be used to build
# the XML attributes of the tag
Builder forward := method(

	nesting := 0
	attr := ""

	call message arguments foreach(arg,
		if(arg type == "Number",
			nesting = arg
		)
		if(arg type == "Map",
			arg keys foreach(key,
				attr := attr .. " " .. key .. "=\"" .. arg at(key) .. "\""
			)
		)
	)

	indent := ""
	for(i, 0, nesting, indent := indent .. "    ")

	writeln(indent .. "<", call message name, attr, ">")

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
