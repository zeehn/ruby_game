require_relative 'player'

describe Player do 
    before do 
        @initial_health = 100
        @player = Player.new("zack", @initial_health)
    end

    it "has a capitalized name" do 
        expect(@player.name).to eq("Zack")
    end

    it "has an initial health" do 
        expect(@player.health).to eq(100)
    end

    it "has a string representation" do 
        expect(@player.to_s).to eq("I'm Zack with a health of 100 and a score of 104.")
    end

    it "computes a score as the sum of its health and length of name" do 
        expect(@player.score).to eq(100 + 4)
    end

    it "increases health by 15 when w00ted" do 
        @player.w00t 
        expect(@player.health).to eq(@initial_health + 15)
    end

    it "decreasess health by 10 when blammed" do 
        @player.blam 
        expect(@player.health).to eq(@initial_health - 10)
    end

    context "with a health greater than 100" do 
        before do 
            @initial_health = 150
            @player = Player.new("zack", @initial_health)
        end

        it "is strong" do 
            expect(@player.strong?).to eq(true)
        end
    end

    context "with a health less than or equal to 100" do 
        before do 
            @player = Player.new("zack", 100)
        end

        it "is wimpy" do 
            expect(@player.strong?).to eq(false)
        end
    end
end