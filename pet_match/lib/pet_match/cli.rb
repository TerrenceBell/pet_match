require 'pry'
class Cli 
  
 def call 
   puts "Welcome to Pet Match! Thank you for showing interest in these animals!"
   puts "We would like to connect you with a new addition to your family."
   #puts "What page would you like to see?"
   Scraper.scrape_site
   list_animals
 end
 def list_animals 
   Pet.all.each.with_index(1) do |pet,i|
  
     puts "#{i}. #{pet.name} - #{pet.building}"
    
   end 
   choose_pet
 end 
 
 def choose_pet
   puts "Enter the number of who you would like to learn about:"
  input = gets.chomp 
  if !input.to_i.between?(1, Pet.all.count)
    puts "Whoopsies! it looks like you made an invalid selection. Please try again"
    list_animals
    choose_pet
  else 
    pet = Pet.all[input.to_i-1]
    about_this_pet(pet)
  end 
  puts "Do you feel like your home is the right fit for #{Pet.name}?"
  puts "Enter Y or N"
    answer = gets.strip.downcase
  if answer == "y"
    puts "Great! Please cal 210-655-1481 to set up a visit!"
    exit 
  elsif answer == "n"
    puts "Lets keep looking.."
  list_animals
  choose_pet 
  else 
     puts "Whoopsies! it looks like you made an invalid selection. Please try again"
     list_animals
     choose_pet
end
end

def about_this_pet(pet)
  Scraper.scrape_pet(pet)
  puts "Here are some more details about #{pet.name}"
  puts "breed: #{pet.breed}"
  puts "gender: #{pet.gender}"
  puts "age: #{pet.age}"
  puts "weight: #{pet.weight}"
end

end
  