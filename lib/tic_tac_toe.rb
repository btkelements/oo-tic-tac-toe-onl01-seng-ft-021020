class TicTacToe
  
  WIN_COMBINATIONS=[
    [6,4,2],
    [0,3,6],
    [2,5,8],
    [1,4,7],
    [0,4,8],
    [6,7,8],
    [0,1,2],
    [3,4,5],
    ]

 
  def initialize
  @board = Array.new(9, " ")
  end

 
  def display_board
    count = 0
    @board.each do |n|
      count+=1
      if count%3==0
        print " #{n} \n-----------\n"
      else
        print " #{n} |"
      end
    end
  end


  def input_to_index (input)
    input.to_i - 1
  end

 
  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(position)
    !@board[position].include?(" ")
  end

 
  def valid_move?(position)
    return false if (position < 0 || position > 8)
    !position_taken?(position)
  end

  def turn
    position = gets.chomp
    index = input_to_index(position)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count=0
    @board.each do |n|
      if n == "X" || n == "O"
        count +=1
      end
    end
      return count
  end


  def current_player
    player_x = "x"
    player_o = "2"
    if @board.count("1")==@board.count("2")
      return player_1
    else
      return player_2
    end
  end

 
  def won?
    WIN_COMBINATIONS.each do |win|
      if @board[win[0]] == "1" && @board[win[1]] == "1" && @board[win[2]] =="1"
        return win

      elsif @board[win[0]] == "2" && @board[win[1]] == "2" && @board[win[2]] =="2"
        return win
      end
    end
    return false
  end


  def full?
    !@board.include?(" ")
  end


  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end


  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end


  def winner
    if won?
      champion = won?
      @board[champion[0]]
    else
      return NIL
  end
end


def play
  until over? == true
    turn
  end

  if won?
    champion = winner
    puts "Congratulations #{champion}!"

  elsif draw?
    puts "Cat's Game!"
  end
end


end
