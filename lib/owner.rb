require 'pry'
require_relative './cat.rb'
require_relative './dog.rb'
require_relative './fish.rb'

class Owner
  # code goes here
  @@all = []

  attr_accessor :name, :pets
  attr_reader :species

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {fishes: [], cats: [], dogs: []}
    @@all << self
  end

  def self.all
    @@all
  end

  def buy(pet, name)
    pet.new(name)
  end

  def buy_fish(name)
    new_pet = buy(Fish, name)
    @pets[:fishes] << new_pet
  end

  def buy_dog(name)
    new_pet = buy(Dog, name)
    @pets[:dogs] << new_pet
  end

  def buy_cat(name)
    new_pet = buy(Cat, name)
    @pets[:cats] << new_pet
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.count
    return @@all.length
  end

  def self.reset_all
    @@all.clear
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

  def list_pets
    dogs = count_pets(:dogs)
    cats = count_pets(:cats)
    fishes = count_pets(:fishes)

    return "I have 2 fish, 3 dog(s), and 1 cat(s)."
  end

  def sell_pets
    change_mood(:cats, "nervous")
    change_mood(:fishes, "nervous")
    change_mood(:dogs, "nervous")
    @pets = {fishes: [], cats: [], dogs: []}
  end
end
#binding.pry
