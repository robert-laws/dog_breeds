class DogBreeds::Scrape
  URL = "http://www.akc.org/dog-breeds"

  def get_dogs_by_letter(letter)
    result = get_html("?letter=#{letter}", "az_search")
    result.collect { |dog| dog.css('.scale-contents h2 a').text }[0..-2]
  end

  def get_dog_by_name(name) # returns an array of the individual dog traits
    result = get_html("#{name}", "name_search")
    result.size > 0 ? result.collect { |detail| detail.text.split(":")[1].strip } : []
  end

  private

  def get_html(arg, type) # returns an array of dog names by latter (with last element removed, which is a node with no data)
    search = type == "az_search" ? "div.event-contain .event" : "div.breed-details__main li"
    Nokogiri::HTML(open("#{URL}/#{arg}")).css(search)
  end
end