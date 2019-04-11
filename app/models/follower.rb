class Follower 
    attr_accessor :name, :age, :life_motto

    @@all = []

    def initialize(name,age,life_motto=nil)
        @name = name 
        @age = age 
        @life_motto = life_motto 
        @@all << self 
    end

    def self.all 
        @@all 
    end

    def bloodoaths
        BloodOath.select { |bloodoath| bloodoath.follower == self } 
    end

    def cults 
        bloodoaths.map { |bloodoath| bloodoath.cult }.uniq
    end

    def join_cult(cult)
        if cult.minimum_age != nil 
            if age < cult.minimum_age 
                puts "Sorry, you are too young to join this cult!"
                return 
            end
        end

        bloodoaths.new(cult,self)
    end
    
    def self.of_a_certain_age(age)
        self.all.select { |follower| follower.age >= age }
    end

    def my_cults_slogans
        slogans = self.cults.map { |cult| cult.slogan }.uniq 
        slogans.each { |slogan| puts slogan }
        slogans 
    end

    def self.most_active 
        self.all.max_by { |follower| follower.cults.length }
    end

    def self.top_ten 
        self.all.sort_by { |follower| follower.cults.length*(-1) }.slice(0,10)
    end

    def fellow_cult_members 
        Followers.all.select do |follower|
            test1 = follower.cults.all? { |cult| self.cults.include?(cult) }
            test2 = self.cults.all? { |cult| follower.cults.include?(cult) }
            test1 & test2 
        end
    end
end
