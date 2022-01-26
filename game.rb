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

    def play(rounds=1) 
        puts "\nThere are #{@players.size} players in the game:"

        @players.each do |player| 
            puts player
        end
        puts

        1.upto(rounds) do |count|
            puts "\nRound: #{count}:"
            @players.each do |player|
                GameTurn.take_turn(player)
                puts player  
            end
        end
    end

    def print_name_and_score(player)
        puts "#{player.name} (#{player.score})"
    end

    def print_stats 
        puts "\n\n#{@name}'s Statistics:"

        strong_players, wimpy_players = @players.partition { |player| player.strong? }
       
        puts "#{strong_players.size} strong players:"
        strong_players.each do |player|
            print_name_and_score(player)
        end

        puts "#{wimpy_players.size} wimpy players:"
        wimpy_players.each do |player|
            print_name_and_score(player)
        end

        sorted_players = @players.sort 

        puts "\n#{@name} High Scores"
        sorted_players.each do |player|
            formatted_name = player.name.ljust(20, '.')
            puts "#{formatted_name} #{player.score}"
        end
    end
end