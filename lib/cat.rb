class Cat
  # code goes here
  @@all = []

  attr_reader :name, :species
  attr_accessor :mood

  def initialize(name)
    @name = name
    @mood = "nervous"
    @species = species
    @@all << self
  end

end
