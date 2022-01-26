require_relative "player.rb"
require_relative "game.rb"


player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knucleheads = Game.new("Knucleheads")
knucleheads.add_player(player1)
knucleheads.add_player(player2)
knucleheads.add_player(player3)
knucleheads.play(3)
knucleheads.print_stats