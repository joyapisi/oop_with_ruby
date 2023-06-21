require 'remover'
require './foods'

class Animal
  # setters and getters
  attr_reader :owner, :visits
  attr_accessor :name
  attr_reader :id, :type, :number_of_legs
  
  def initialize(type, number_of_legs, name = "Unknown")
    @id = Random.rand(1..1000)
    @name = name
    @number_of_legs = number_of_legs
    @type = type
    @liked_food = NoFood.new()
    @visits = []
  end

  def owner=(owner)
    @owner = owner
    owner.animals.push(self) unless owner.animals.include?(self)
  end

  # a method to tell if the animal likes a type of food or not.
  def likes_food?(food)
    @liked_food.is_liked?(food)
  end

  # all animals say this
  def speak
    'grrr'
  end

  # remove one leg using remover parent class
  def remove_leg
    remover = Remover.new
    @number_of_legs = remover.decrease(@number_of_legs)
  end
end
