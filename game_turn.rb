module GameTurn 
    def self.take_turn(player)
        die = Die.new 
                
        case die.roll 
        when 1..2
            player.blam
            puts "#{player.name} blammed!" 
        when 3..4
            puts "#{player.name} skipped!"
        else
            player.w00t
            puts "#{player.name} w00ted!"
        end
    end
end