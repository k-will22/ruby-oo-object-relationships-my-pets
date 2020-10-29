require 'pry'

class Owner
  # code goes here

  @@all = []

   attr_reader :name, :species
  def initialize(name, species="human")
    @name = name 
    @species = species 
    @@all << self 
  end

  def say_species
     p "I am a human."
  end 

  def self.all 
    @@all 
  end 

  def self.count 
    self.all.count 
  end 

  def self.reset_all 
     @@all = []
  end 

  def cats
    Cat.all.select {|x| x.owner == self}
  end 

  def dogs
    Dog.all.select {|x| x.owner == self}
  end 

  def buy_cat(name)
    Cat.new(name, self) 
  end 

  def buy_dog(name)
    Dog.new(name, self) 
  end 

  def walk_dogs 
    Dog.all.select {|x| x.mood = "happy"}
  end

  def feed_cats
    Cat.all.select {|x| x.mood = "happy"}
  end 

  def sell_pets 
    Dog.all.select {|x| x.mood = "nervous"}
    Cat.all.select {|x| x.mood = "nervous"}
    Dog.all.select {|x| x.owner = nil}
    Cat.all.select {|x| x.owner = nil}
  end 
 
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 


end