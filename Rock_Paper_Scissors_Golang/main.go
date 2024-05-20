package main

import (
	"fmt"
	"math/rand"
	"time"
)

type option struct {
	Name string
}

var option_Choice = []option{
	{Name: "Rock"},
	{Name: "Paper"},
	{Name: "Scissors"},
}

func main() {
	random := rand.New(rand.NewSource(time.Now().UnixNano()))

	for {
		fmt.Println("Pick your choice from below options :")
		fmt.Println("1. Rock\n2. Paper\n3. Scissors")
		var user_Choice int
		_, err := fmt.Scan(&user_Choice)
		if err != nil {
			fmt.Println("Error reading User Choice:", err)
			continue
		}

		if user_Choice < 1 || user_Choice > 3 {
			fmt.Println("Invalid choice. Please choose between 1, 2, or 3.")
			continue
		}

		userChoice := option_Choice[user_Choice-1]
		fmt.Println("You chose:", userChoice.Name)

		computerIndex := random.Intn(len(option_Choice))
		computerChoice := option_Choice[computerIndex]
		fmt.Println("Computer chose:", computerChoice.Name)

		result := determineWinner(userChoice.Name, computerChoice.Name)
		fmt.Println(result)

		fmt.Println("Play again? (yes/no)")
		var playAgain string
		fmt.Scan(&playAgain)
		if playAgain != "yes" {
			break
		}
	}
}

func determineWinner(userChoice, computerChoice string) string {
	if userChoice == computerChoice {
		return "It's a tie!"
	} else if (userChoice == "Rock" && computerChoice == "Scissors") ||
		(userChoice == "Paper" && computerChoice == "Rock") ||
		(userChoice == "Scissors" && computerChoice == "Paper") {
		return "You win!"
	} else {
		return "Computer wins!"
	}
}
