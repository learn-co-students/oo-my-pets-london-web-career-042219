class Owner
  @@all = []

  attr_reader :species
  attr_accessor :name, :pets, :buy_fish

  def initialize(species)
    @species = species
    @pets = { :fishes => [], :dogs => [], :cats => []}
    @@all << self

  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    @@all = []
  end

  def say_species
     "I am a #{species}."
  end

  def buy(animal, name, pet_type)
     @pets[pet_type] << animal.new(name)
  end

  def buy_fish(name)
    buy(Fish, name, :fishes)
  end

  def buy_cat(name)
    buy(Cat, name, :cats)
  end

  def buy_dog(name)
    buy(Dog, name, :dogs)
  end

  def walk_dogs
    @pets[:dogs].map { |dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].map { |cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].map { |fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.map do
      |k,v|
        @pets[k].map { |animal| animal.mood = "nervous"}
    end
    @pets = { :fishes => [], :dogs => [], :cats => []}
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end

end