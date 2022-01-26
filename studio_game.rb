require_relative "player.rb"
require_relative "game.rb"
require_relative 'clumsy_player'

knuckleheads = Game.new("Knucleheads")

knuckleheads.load_players(ARGV.shift)

klutz = ClumsyPlayer.new("klutz", 105)
knuckleheads.add_player(klutz)

# berserker = BerserkPlayer.new("berserker", 50)
# knuckleheads.add_player(berserker)

loop do 
    puts "\nHow many game rounds? ('quit' to exit)"
    answer = gets.chomp.downcase
    case answer
    when /^\d+$/
      knuckleheads.play(answer.to_i)
    when 'quit', 'exit'
      knuckleheads.print_stats
      break
    else
      puts "Please enter a number or 'quit'"
    end 
    knuckleheads.play(answer.to_i)
end

knuckleheads.save_high_scores
    
