def moves
  {
    "Rock" => "Scissors",
    "Scissors" => "Paper",
    "Paper" => "Rock"
  }
end

def rps(player_move)
  computer_move = moves.keys.sample
  # Draw Case
  if computer_move == player_move
    "#{computer_move}, Draw"
  # Win Case
  elsif moves[player_move] == computer_move
    "#{computer_move}, Win"
  #Lose
  else
    "#{computer_move}, Lose"
  end
end

p rps("Rock") # => "Paper, Lose"
p rps("Scissors") # => "Scissors, Draw"
p rps("Scissors") # => "Paper, Win"

def remix(ingredients)
  alcohols = []
  mixers = []

  ingredients.each do |a, m|
    alcohols << a
    mixers << m
  end

  alcohols.shuffle.map.with_index {|x, i| [x, mixers[i]]}
end

def remix(ingredients)
  alcohols, drinks = ingredients.transpose
  alcohols.zip(drinks.shuffle)
end

p remix([
  ["rum", "coke"],
  ["gin", "tonic"],
  ["scotch", "soda"]
])