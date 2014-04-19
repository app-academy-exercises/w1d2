class Board

  def internal_board
     @internal_board ||= [0] * 9
   end

  def won?
    [check_row, check_col, check_diagnol].uniq.count > 1
  end

  def check_row
     (0..2).each do |row|
       are_uniq = internal_board[(row*3)..(row*3 + 2)].uniq
       if (are_uniq.count == 1 && !are_uniq.include?(0))
         return are_uniq.first #returns []
       end
     end
     0
  end

  def check_col
    (0..2).each do |col|
      are_uniq = [internal_board[col], internal_board[col+3],
                  internal_board[col+6]].uniq

      if (are_uniq.count == 1 && !are_uniq.include?(0))
        return are_uniq.first #returns []
      end
    end
    0
  end

  def check_diagnol
    are_uniq = [internal_board[0], internal_board[4],
                internal_board[8]].uniq

    if (are_uniq.count == 1 && !are_uniq.include?(0))
      return are_uniq.first #returns []
    end

    are_uniq = [internal_board[2], internal_board[4],
                internal_board[6]].uniq

    if (are_uniq.count == 1 && !are_uniq.include?(0))
      return are_uniq.first #returns []
    end
    0
  end

  def winner
    [check_row, check_col, check_diagnol].reduce(:+)
  end

  def empty?(pos)
    internal_board[pos] == 0
  end

  def place_mark(pos, mark)
    internal_board[pos] = mark
  end

  def print_board
    symbols = {1 => "o", 2 => "x"}
    visual = []

    for i in 0..9
      if !symbols.keys.include?(internal_board[i])
        visual << i
      else
        visual << symbols[internal_board[i]]
      end
    end

    p visual[0..2].join(' | ')
    p "-" * 9
    p visual[3..5].join(' | ')
    p "-" * 9
    p visual[6..8].join(' | ')
  end
end

class Game

  attr_accessor :players, :board

  def initialize(player1, player2 = nil)
    @board = Board.new
    @players = [player1, player2]
    i = 1
    players.each do |player|
      if player.is_a?(ComputerPlayer)
        player.board = @board
        player.symbol = i
      end
      i += 1
    end
  end

  def play
    symbols = {0 => "O", 1 => "X"}
    player = 0
    while !board.won? do
      board.print_board
      puts "Player #{player % 2 + 1} (#{symbols[player % 2]}), make your move:"
      move = players[player % 2].move
      if board.empty?(move)
        board.place_mark(move, player % 2 + 1)
        player += 1
      else
        puts "Space already taken."
      end
    end
    board.print_board
    puts "Player #{player % 2} wins!"
  end
end

class Player
  def move
  end
end

class HumanPlayer < Player
  def move
    gets.chomp.to_i
  end
end

class ComputerPlayer < Player
  attr_accessor :board, :symbol

  def move
    p = []
    #rows
    p << board[0..2]
    p << board[0..2]
    p << board[0..2]
    remaining = []

    p.each do |posib|
      if posib.count(symbol) > 1 && posib.include?(0)
        return
    end
  end
end

Game.new(HumanPlayer.new, HumanPlayer.new).play

# class Student
#   attr_accessor :first, :last, :courses
#
#   def courses
#     @courses ||= []
#   end
#
#   def initialize(first, last)
#     @first = first
#     @last = last
#   end
#
#   def name
#     "#{first} #{last}"
#   end
#
#   def enroll(course)
#     courses << course unless courses.include?(course)
#   end
#
#   def course_load
#     course_hash = {}
#     courses.each do |course|
#       if course_hash.keys.include?(course.department)
#         course_hash[course.department] += course.credits
#       else
#         course_hash[course.department] = course.credits
#       end
#     end
#   end
# end
#
# class Course
#   attr_accessor :name, :department, :credits, :students
#
#   def students
#     @students ||= []
#   end
#
#   def initialize(name, department, credits)
#     @name = name
#     @department = department
#     @credits = credits
#   end
#
#   def add_student(student)
#     students << student unless students.include?(student)
#   end
# end


