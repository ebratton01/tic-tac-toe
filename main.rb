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
        play_again = gets.chomp.downcase
        if play_again == 'y'
            keep_going = true
        elsif  play_again == 'n'
            puts "Farewell."
            keep_going = false
            break
        else
            puts "Not a valid input."
        end
    end
end