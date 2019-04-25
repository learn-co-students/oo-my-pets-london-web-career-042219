require './lib/cat.rb'
require './lib/dog.rb'
require './lib/fish.rb'
require 'pry'

class Owner
  
  attr_reader :species
  attr_accessor :pets, :name

  @@all = []

  def self.all
    return @@all
  end

  def self.count
    return @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @pets = {fishes: [], dogs: [], cats: []}
  end

  def say_species
    return "I am a #{@species}."
  end

  def buy(pet, name)
    pet.new(name)
  end

  def buy_fish(name)
    new_pet = buy(Fish, name)
    @pets[:fishes] << new_pet
  end

  def buy_cat(name)
    new_pet = buy(Cat, name)
    @pets[:cats] << new_pet
  end

  def buy_dog(name)
    new_pet = buy(Dog, name)
    @pets[:dogs] << new_pet
  end

  def change_mood(species, state)
    @pets[species].each do |pet|
      pet.mood=state
    end
  end

  def walk_dogs
    change_mood(:dogs, "happy")
  end

  def play_with_cats
    change_mood(:cats, "happy")
  end

  def feed_fish
    change_mood(:fishes, "happy")
  end

  def owner_pets(species)
    @pets[species]
  end

  def count_pets(species)
    owner_pets(species).length
  end

  def sell_pets
    change_mood(:dogs, "nervous")
    change_mood(:cats, "nervous")
    change_mood(:fishes, "nervous")
    @pets = {fishes: [], dogs: [], cats: []}
  end

  def list_pets
    dogs = count_pets(:dogs)
    cats = count_pets(:cats)
    fish = count_pets(:fishes)

    return "I have #{fish} fish, #{dogs} dog(s), and #{cats} cat(s)."
  end
end

# steve = Owner.new("steve")

# steve.buy_fish("Bubbles")
# steve.buy_cat("Robin")
# steve.buy_cat("Joe")
# steve.buy_dog("Woof")

# binding.pry

# puts "stuff"