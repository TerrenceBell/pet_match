class Pet 
  attr_accessor :name, :building, :url, :breed, :age, :weight, :gender
  @@all =[]
  def initialize(name,building,url)
    @name = name 
    @building  = building 
    @url = url 
    @@all << self
  end 
  
  def self.all 
    @@all 
  end 
end 