let rec play_game() =
  print_endline "Enter your choice (rock/paper/scissors): "; 
  let user_choice = read_line () in
  String.lowercase_ascii user_choice
