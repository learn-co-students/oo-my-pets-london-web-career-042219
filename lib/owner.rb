class Owner

attr_reader :species
attr_accessor :name, :pets

@@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @pets = {cats: [], dogs: [], fishes: []}
    
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all = []
  end
  
  def say_species
    return "I am a #{species}."
  end
  
  def name
    @name 
  end
  
  def buy_fish(name)
    @fish = Fish.new(name)
    @pets[:fishes] << @fish 
  end
  
  def buy_cat(name)
    @cat = Cat.new(name)
    @pets[:cats] << @cat 
  end
  
  def buy_dog(name)
    @dog = Dog.new(name)
    @pets[:dogs] << @dog 
  end
  
  def walk_dogs
     dogs = @pets[:dogs] 
     dogs.each {|dog| dog.mood = "happy"}
  end
  
  def play_with_cats
     cats = @pets[:cats] 
     cats.each {|cat| cat.mood = "happy"}
  end
  
  def feed_fish
     fishes = @pets[:fishes] 
     fishes.each {|fish| fish.mood = "happy"}
  end
  
  def sell_pets
   dogs = @pets[:dogs] 
    cats = @pets[:cats]
   fishes = @pets[:fishes] 
    dogs.each {|dog| dog.mood = "nervous"}
    cats.each {|cat| cat.mood = "nervous"}
    fishes.each {|fish| fish.mood = "nervous"}
    @pets = []
  end
  
  def list_pets
    n_fish = @pets[:fishes].count
    n_cats = @pets[:cats].count
    n_dogs = @pets[:dogs].count
    return "I have #{n_fish} fish, #{n_dogs} dog(s), and #{n_cats} cat(s)."
  end
  
end