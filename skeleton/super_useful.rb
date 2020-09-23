# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError => e 
    puts "Error was #{e.message} can only convert number string"
  end 
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]
class CoffeeError < StandardError
  # def message 
  #   p "maybe next time"
  # end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee" 
    raise CoffeeError.new("try again!")
    # feed_me_a_fruit
  else 
    raise.StandardError.new("Not a fruit") 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
begin 
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
rescue CoffeeError => e 
  puts e.message 
  retry 
end 
end  
# feed_me_a_fruit
# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError.new("must know friend for longer than 5 years") if yrs_known <= 5
    raise ArgumentError.new("must not be imaginary") if name.empty?
    raise ArgumentError.new("must have activities") if fav_pastime.empty? 
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end
a = BestFriend.new("bob", 6 , "")

