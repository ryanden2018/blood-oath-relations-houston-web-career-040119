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
        self.all.select { |cult| cult.founding_year == year }
    end

    def average_age
        followers.inject(0) { |sum,follower| sum += follower.age }.to_f / followers.length.to_f 
    end

    def my_followers_mottos 
        followers.map { |follower| follower.life_motto }.uniq.delete_if { |x| x == nil }
    end

    def self.least_popular
        self.all.min_by { |cult| cult.followers.length }
    end

    def self.locations 
        self.all.map { |cult| cult.location }.uniq 
    end

    def self.most_common_location
        self.locations.max_by do |location|
            self.all.select { |cult| cult.location == location }.length 
        end
    end
end
