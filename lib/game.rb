class Game
    attr_accessor :board 
    attr_accessor :player_1, :player_2

    WIN_COMBINATIONS = [
        [0,1,2], 
        [3,4,5], 
        [6,7,8],
        [2,4,6],
        [0,4,8],
        [0,3,6],
        [1,4,7],
        [2,5,8]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        @board.turn_count.even? ? player_1 : player_2
    end

    def won?
        WIN_COMBINATIONS.each do |comb|
            if (@board.cells[comb[0]] == "X" && @board.cells[comb[1]] == "X" && @board.cells[comb[2]] == "X") ||
               (@board.cells[comb[0]] == "O" && @board.cells[comb[1]] == "O" && @board.cells[comb[2]] == "O")
              return comb;
            end
        end
      return false;
    end

    def draw?
        !won? && @board.turn_count == 9
    end

    def over?
        return won? || @board.turn_count == 9
    end

    def winner
        winningCombination = won?
        if !winningCombination
          return nil
        else
          # winningCombination = [1,4,7] for example
          return @board.cells[winningCombination[0]];
        end
    end

    def turn
        valid = false
        until valid
            move = current_player.move(@board)
            valid = @board.valid_move?(move)
        end
        @board.update(move, current_player)
    end

    def play
        until won? || over?
            turn
        end

        if draw?
            puts "Cat's Game!"
        else
            puts "Congratulations #{winner}!"
        end
    end
end
