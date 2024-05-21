let rec play_game() =
  print_endline "Enter your choice (rock/paper/scissors): "; 
  let user_choice = read_line () |> String.lowercase_ascii in
  while user_choice <> rock || user_choice <> paper || user_choice <> scissors
  print_endline "Invalid choice! Please enter rock, paper, or scissors."
  play_game()
;;

play_game();