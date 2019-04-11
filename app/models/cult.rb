class Cult 
    attr_accessor :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name,location,founding_year=nil,slogan=nil)
        @name = name 
        @location = location 
        @founding_year = founding_year 
        @slogan = slogan 
        @@all << self 
    end

    def self.all 
        @@all 
    end

    def recruit_follower(follower)
        BloodOath.new(self,follower)
    end

    def cult_population
        followers.length 
    end

    def bloodoaths
        BloodOath.select { |bloodoath| bloodoath.cult == self } 
    end

    def followers
        bloodoaths.map { |bloodoath| bloodoath.follower }.uniq
    end

    def self.find_by_name(name)
        self.all.find { |cult| cult.name == name }
    end

    def self.find_by_location(location)
        self.all.find { |cult| cult.location == location }
    end

    def self.find_by_founding_year(year)
    end

end
