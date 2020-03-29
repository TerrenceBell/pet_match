class Scraper
 
SITE = "https://adltexas.org/pets/"

# def self.scrape_page(url) 
#   url = "https://adltexas.org/pets/" 
#   page_choice = gets.strip.between?(1,10)
#   if page_choice == 1 
#     self.scrape_page(url)
#   elsif page choice > 1 
#   url = "https://adltexas.org/pets/page#{page_choice}/"
#   self.scrape_site(url)
#   binding.pry 
# end 
# end 




def self.scrape_site

  page = Nokogiri::HTML(open(SITE))
  
  results = page.css("div#gallery-container.row.small-up-1.medium-up-2.large-up-3.pet-gallery").css(".pet-details").each do |details|
  
    name =  details.css(".pet-title a")[0].text
    building = details.css(".pet-location").text.strip
    url = details.css(".pet-title a")[0].attr("href")
    Pet.new(name,building,url)
    
end 
  
  # pets = results.each do |r| 
  #   puts r.css('.item.pet-archive.column.text-center').text.strip
  # end
  # animal = pets.each do |i|
  #   puts i.css('.pet-details').text.strip
  #   animal
  # end
  
  def self.scrape_pet(pet)
      html = open(pet.url)
      page = Nokogiri::HTML(html)
    
     pet.breed = page.css(".column p")[0].text
     pet.gender = page.css(".column p")[1].text
     pet.weight =  page.css(".column p")[3].text
     pet.age = page.css(".column p")[2].text
end
end
end