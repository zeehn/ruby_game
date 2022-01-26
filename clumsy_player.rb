class ClumsyPlayer < Player 
    def found_treasure(treasure)
        points = treasure.points / 2.0
        @found_treasures[treasure.name] += points
        puts "#{@name} found a #{treasure.name} worth #{points} points."
    end
end