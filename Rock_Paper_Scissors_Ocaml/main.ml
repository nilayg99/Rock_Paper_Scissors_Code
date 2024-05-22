let rec play_game () =
  print_endline "Enter your choice (rock/paper/scissors): ";
  let user_choice = read_line () |> String.lowercase_ascii in
  if user_choice = "rock" || user_choice = "paper" || user_choice = "scissors" then
    let computer_options = ["rock"; "paper" ; "scissors"] in
    let random_index = Random.int (List.length computer_options) in
    let computer_choice = List.nth computer_options random_index in
    print_endline ("Your choice : " ^ user_choice);
    print_endline ("Computer choice : " ^ computer_choice);

    if user_choice = computer_choice then
      print_endline "It's a tie!"
    else if (user_choice = "rock" && computer_choice = "scissors") || (user_choice = "scissors" && computer_choice = "rock") || (user_choice = "paper" && computer_choice = "scissors") then
      print_endline "You win!"
    else
      print_endline "Computer wins!";

    play_game_again ()
  else
    (
      print_endline "Invalid choice! Please enter rock, paper, or scissors.";
      play_game ()
    )

and play_game_again () =
  print_endline "Play again? (yes/no)";
  let play_choice = read_line () |> String.lowercase_ascii in
  if play_choice = "yes" then
    play_game ()
  else if play_choice = "no" then
    print_endline "Thanks for playing!"
  else
    play_game_again ()
;;
play_game ()