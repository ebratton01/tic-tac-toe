require_relative 'game.rb'
require_relative 'board.rb'

keep_going = true
play_again = true

while keep_going
    game = PlayGame.new()
    game.intro
    game.start

    while play_again
        puts "Do you want to play again, y or n?"
        input = gets.chomp.downcase
        if input == 'y'
            keep_going = true
            break
        elsif input == 'n'
            puts "Farewell."
            keep_going = false
            break
        else
            puts "Not a valid input."
        end
    end
end