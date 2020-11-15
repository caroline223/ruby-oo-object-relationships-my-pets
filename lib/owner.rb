class Owner

  attr_reader :name, :species
  attr_accessor :pets, :dogs, :cats, :mood
  

  @@all = []
  

  def initialize(name)
    @name = name
    @species = "human" 
    @@all << self 
  end

  def say_species 
    return "I am a #{@species}."
  end

  def self.all
    @@all 
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.each do |cat|
      cat.mood = "happy"
    end
  end

  def cats
   Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def sell_pets
    pets = self.dogs + self.cats

    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil 
    end
  end

  def list_pets
     "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end