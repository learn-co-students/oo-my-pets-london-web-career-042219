class Owner
  # code goes here
  attr_reader :species
  attr_accessor :name, :pets

  @@all = []

  def initialize( name, species="human")
    @name = name
    @species = species

    @pets = {
    fishes:[],
    dogs:[],
    cats:[] }

    @@all << self

  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all=[]
  end

  def say_species
    "I am a human."
  end

  def buy_fish( name )
      #new_fish= Fish.new( name )
      @pets[:fishes]<<Fish.new( name )
  end

  def buy_cat( name )
      @pets[:cats]<<Cat.new( name )
  end

  def buy_dog( name )
      #new_fish= Fish.new( name )
      @pets[:dogs]<<Dog.new( name )
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood="happy"}
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.mood="happy"}
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.mood="happy"}
  end

  def sell_pets
    @pets[:dogs].each {|dog| dog.mood="nervous"}
    @pets[:cats].each {|cat| cat.mood="nervous"}
    @pets[:fishes].each {|fish| fish.mood="nervous"}
    @pets[:dogs]=[]
    @pets[:cats]=[]
    @pets[:fishes]=[]
  end

  def list_pets
      "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end

end
