number := (Random value(0,100) + 1) floor
guess := -1
tries := 0
lastDif := -1

while(tries < 10 and number != guess,
	guess := File clone standardInput readLine("Guess the number (1 to 100):") asNumber
	thisDif := (number - guess) abs

	if(lastDif > 0,
		if(thisDif < lastDif,
			"hotter" println,
			"colder" println
		)
	)

	lastDif = thisDif
	tries = tries + 1
)

if(guess == number,
	"Congratulations, you guessed the correct number!" println,
	"Sorry, your chances are over! The number was " print
	number println
)
