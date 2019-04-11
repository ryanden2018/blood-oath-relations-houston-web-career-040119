class BloodOath
    attr_accessor :initiation_date, :cult, :follower

    @@all = []

    def initialize(cult,follower,initiation_date=nil)
        @cult = cult 
        @follower = follower 
        @initiation_date = initiation_date
        @@all << self 
    end

    def self.all 
        @@all 
    end
end
