require 'date'

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

    def self.first_oath
         self.all.min_by do |bloodoath|
            year = bloodoath.initiation_date.split("-")[0].to_i
            month = bloodoath.initiation_date.split("-")[1].to_i
            day = bloodoath.initiation_date.split("-")[2].to_i 
            Date.new(year,month,day).to_time.to_i 
         end
    end
end
