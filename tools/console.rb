require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

c1 = Cult.new("Falling Star","Los Angeles",1991,"too many asteroids")
c2 = Cult.new("Rising Star","San Francisco",1992, "too few bears")
c3 = Cult.new("Jumping Bilges","New York City",1993, "livers for all")
c4 = Cult.new("Super","St Louis",1994, "chemical dream")
c5 = Cult.new("Duper","Salt Lake City",1995, "electric lamb")

f1 = Follower.new("Jack",22,"life is a dream")
f2 = Follower.new("Susan",28,"boats are awesome")
f3 = Follower.new("Pete",31,"i like computers")
f4 = Follower.new("Craig",20,"brave new world")
f5 = Follower.new("CRAIG",25,"hello")
f6 = Follower.new("Janet",37,"goodbye")

bo1 = BloodOath.new(c1,f1,"2002-12-21")
bo2 = BloodOath.new(c2,f2,"1998-01-12")
bo3 = BloodOath.new(c3,f3,"1998-01-13")
bo4 = BloodOath.new(c4,f4,"2005-05-03")
bo5 = BloodOath.new(c5,f5,"2000-01-01")
bo13 = BloodOath.new(c1,f3,"2010-03-03")
bo15 = BloodOath.new(c1,f5,"2003-03-03")
bo25 = BloodOath.new(c2,f5,"2002-02-02")
bo16 = BloodOath.new(c1,f6,"2010-01-01")



binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
