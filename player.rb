class Player 
    attr_reader :health
    attr_accessor :name
    def initialize(name, health=100)
        @name = name.capitalize 
        @health = health
        @found_treasures = Hash.new(0)
    end

    def to_s
        "I'm #{@name} with a health of #{@health} and a score of #{score}."
        "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
    end

    def blam
        @health -= 10
    end

    def w00t 
        @health += 15
    end
    
    def name=(new_name)
        @name = new_name.capitalize
    end

    def score 
        points + @health
    end

    def strong?
        @health > 100
    end

    def <=>(other_player)
        other_player.score <=> score
    end

    def found_treasure(treasure) 
        @found_treasures[treasure.name] += treasure.points 
        puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
        puts "#{@name}'s treasures: #{@found_treasures}"
    end

    def points 
        @found_treasures.values.reduce(0, :+)
    end

    def each_found_treasure 
        @found_treasures.each do |name, points|
            yield Treasure.new(name, points)
        end
    end
end