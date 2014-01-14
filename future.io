future := URL with("http://google.com/") @fetch

writeln("This line will execute immediately...")
writeln("fetched ", future size, "bytes.")
