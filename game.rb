require_relative 'die'
require_relative 'game_turn'

class Game 
    def initialize(name)
        @name = name 
        @players = []
    end

    def add_player(player)
        @players << player
    end

    def play 
        puts "\nThere are #{@players.size} players in the game:"

        @players.each do |player| 
            puts player
        end
        puts

        @players.each do |player|
            GameTurn.take_turn(player)
            puts player 
            puts 
        end
    end
end