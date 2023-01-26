require_relative 'board.rb'

class PlayGame
    attr_reader :board, :player_one, :player_two

    def initialize
        @board = Board.new
        @player_one = ''
        @player_two = ''
        @turn = 1
    end
    
    def intro
        puts 'Let\'s play tic-tac-toe!'
        puts 'Player 1 name: '
        name = gets.chomp
        piece = 'x'
        @player_one = Player.new(name, piece)
        puts 'Player 2 name: '
        name = gets.chomp
        piece = 'o'
        @player_two = Player.new(name, piece)
    end

    def start
        game_over = false
        until game_over
            if @turn == 1
                puts "#{player_one.name} make a move!"
            else
                puts "#{player_two.name}, your turn!"
            end
            board.SetUpBoard
            player_turns(@turn)
            game_over = board.check_winner
            if !game_over
                game_over = board.isFull? 
            end
        end

        if @turn == 2
            puts "#{player_one.name} wins!"
        else
            puts "#{player_two.name} wins!"
        end
    end

    def player_turns(turns)
        valid = false
        if turns == 1
            while !valid
                input = gets.chomp.to_i
                if input.between?(0,8) && board.isValid?(input)
                    board.update_board(input, player_one.piece)
                    valid = true
                    @turn = 2
                else
                    puts 'Not a valid move, please try again.'
                    valid = false
                end
            end
        else
            while !valid
                input = gets.chomp.to_i
                if input.between?(0,8) && board.isValid?(input)
                    board.update_board(input, player_two.piece)
                    valid = true
                    @turn = 1
                else
                    puts 'Not a valid move, please try again.'
                    valid = false
                end
            end
        end
    end
end

