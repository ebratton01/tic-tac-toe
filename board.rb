require 'pry-byebug'

class Board
    attr_reader :board

    WIN = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], 
        [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    def initialize
        @board = ['0','1','2','3','4','5','6','7','8']
    end

    def SetUpBoard
        puts <<-HEREDOC

            #{board[0]} | #{board[1]} | #{board[2]}
            --+---+--
            #{board[3]} | #{board[4]} | #{board[5]}
            --+---+--
            #{board[6]} | #{board[7]} | #{board[8]}

        HEREDOC
    end

    def update_board(number, piece)
        @board[number] = piece 
    end

    def isValid?(input)
        if @board[input] == 'x' || @board[input] == 'o'
            return false 
        else
            return true
        end
    end

    def isFull?
        @board.all? {|e| e =~ /[^0-9]/}
    end

    def check_winner
        winner = nil
        WIN.any? do |combo|
            winner = [board[combo[0]], board[combo[1]], board[combo[2]]].uniq.length == 1
            if winner
                return true
            end
        end
    end
end

class Player
    attr_reader :name, :piece

    def initialize(name, piece)
        @name = name
        @piece = piece
    end
end