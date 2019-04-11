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
end
