require 'pry'
require_relative './cat.rb'
require_relative './dog.rb'
require_relative './fish.rb'

class Owner

@@all = []
@@count = []
@@reset_all = []

attr_reader :species
attr_accessor :pets, :name, :fish, :cat, :dog, :mood

  def initialize(pets={fishes: [], cats: [], dogs: []}, species)
    @species = species
    @pets = pets
    @name = name
    @@all << self
    @mood = mood
  end
# binding.pry
  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@reset_all = @@all.clear
  end

  def say_species
    return "I am a #{@species}."
  end
# binding.pry

  def buy_pet(type, name) #type is the class
     type.new(name) #type is replace by say Fish.new("Lucy")
 #So we are adding a new fish to the hash pets key :fish, array of which fishes.
  end

  def buy_fish(name) #we are going to get the name of the new fish.
    new_fish = buy_pet(Fish, name)
    @pets[:fishes] << new_fish #buy_pet is more generic but we need to pass it hardcoded variables
    #:fish (species) and Fish (class) for the buy_fish method
  end

  def buy_cat(name) #we are going to get the name of the new cat.
    new_cat = buy_pet(Cat, name)
    @pets[:cats] << new_cat
  end

  def buy_dog(name) #we are going to get the name of the new dog.
    new_dog = buy_pet(Dog, name)
    @pets[:dogs] << new_dog
  end

  def change_mood(species, state) #we went through each pet species, and gave their mood a variable name.
    @pets[species].each do |pet| #for change_mood we need two arguments, the species (:cats, etc.) and the state which we are hardcoding to "happy"
      pet.mood = state
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

  def sell_pets #note to self: there must be a way to do this in a simple way with an each statement
    change_mood(:dogs, "nervous")
    change_mood(:cats, "nervous")
    change_mood(:fishes, "nervous")
    @pets = []
  end

  def list_pets #it wants a specific return so we accessed the hash of pets and then each animal's array and wrote count.
    return "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

end
