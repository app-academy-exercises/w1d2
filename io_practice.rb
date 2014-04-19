def number_guess
  number = rand(100)
  found = false

  guesses = 0
  while !found do
    puts "Pick a number between 1 - 100: "
    guess = gets.chomp.to_i
    if guess == number
      found = true
    elsif guess < number
      puts "Too low! Try again"
    else
      puts "Too High! Try again"
    end

    guesses += 1
  end

  puts "You win! It took this many tries #{guesses}"
end

# number_guess

def shuffle_lines
  puts "Enter a file name: "
  file_name = gets.chomp

  lines = []

  File.foreach(file_name) do |line|
    lines << line.chomp#.gets.chomp
  end

  lines.shuffle!

  new_f = File.open("#{file_name}-shuffled.txt",'w')
  lines.each do |line|
    new_f.puts line
  end

end

shuffle_lines