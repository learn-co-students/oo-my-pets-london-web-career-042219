require './lib/cat.rb'
require './lib/dog.rb'
require './lib/fish.rb'




class Owner
  attr_reader :species #as the species of the owner will never change, it will always be "human"
  attr_accessor :name, :pets

  @@all = []


  def initialize(all)
    @name = name
    @species = "human" #set the inital species of owner
    @pets = {fishes: => [], cat: [], dog: []} #every owner that is initialized, has these pets at the start, which are no pets.
    @all << self
  end

  def self.all
    @@all
  end

  def buy(pet, name) ##helper method, this creates a new pet with a name to be bought
    pet.new(name)
  end

  def buy_fish(name)
    new_pet = buy(Fish, name)
    @pets[:fishes] << new_pet
  end

  def buy_cat(name)
    new_pet = buy[Cat], name)
    @pets[:cat] << new_pet
  end

  def buy_dog(name)
    new_pet = buy(Dog, name)
    @pets[:dog] << new_pet
  end

end
