class DogBreeds::CLI

  attr_accessor :letter, :dog_name, :dog_list, :dog_details, :dog_name_search
  
  def call
    puts "Welcome to the dog breeds list, viewer, and comparison tool"
    start
  end

  def start
    puts ""
    choose_letter

    @dog_list = DogBreeds::Scrape.new.get_dogs_by_letter(@letter)

    @dog_list.size > 0 ? display_dog_list(@dog_list) : no_list

    puts ""
    choose_dog

    @dog_details = DogBreeds::Scrape.new.get_dog_by_name(@dog_name_search)

    if @dog_details.size > 0
      @dog_name = @dog_name_search
      dog = DogBreeds::Dog.create_new_from_details(@dog_name, @dog_details)
    else
      view_again?
    end

    if @dog_details.size > 0
      display_dog_details(dog)
    else
      
    end

    puts ""
    view_again?
  end

  def choose_letter
    puts "Select a letter between A to Z for a list of dogs"
    input = gets.strip
    # input = 'j'
    input.match(/^[a-zA-Z]{1}$/i) ? @letter = input.upcase : choose_letter
  end

  def choose_dog
    puts "Select a number to see details for that dog"
    input = gets.strip
    # input = "3"
    input.match(/^([1-9]|[12][0-9])$/) && input.to_i < @dog_list.count + 1 ? @dog_name_search = @dog_list[input.to_i - 1].downcase.split(" ").join("-") : choose_dog
  end

  def display_dog_list(list)
    puts "------------ Dog name begins with #{@letter} ------------"
    list.each_with_index do |dog_name, index|
      puts "#{index.to_i + 1}. #{dog_name}"
    end
  end

  def display_dog_details(dog)
    puts "------------ Details for #{dog.name} ------------"

    # display dog details
    puts "Name: #{dog.name}"
    puts "Personality: #{dog.personality}"
    puts "Energy Level: #{dog.energy}"
    puts "Good with Children: #{dog.with_children}"
    puts "Good with other dogs: #{dog.with_dogs}"
    puts "Shedding: #{dog.shedding}"
    puts "Grooming: #{dog.grooming}"
    puts "Trainability: #{dog.trainability}"
    puts "Barking Level: #{dog.barking}"
    puts ""
    puts "---------------- Stats ---------------"
    puts "Height Male: #{dog.height_male}"
    puts "Height Female: #{dog.height_female}"
    puts "Weight Male: #{dog.weight_male}"
    puts "Weight Female: #{dog.weight_female}"
    puts "Life Expectancy: #{dog.life}"
  end

  def no_detail
    puts "This dog does not have any information"
    reset
  end

  def no_list
    puts "There are no dogs for #{@letter.upcase}. Choose again"
    reset
  end

  def view_again?
    puts "Do you want to view another dog? Enter Y or N"
    input = gets.strip.downcase
    # input = "n"
    if input == "y"
      reset
    elsif input == "n"
      exit
    else
      view_again?
    end
  end

  def reset
    @letter = ""
    @dog_name = ""
    @dog_name_search = ""
    @dog_list = []
    @dog_details = []

    start
  end

  def exit
    puts "Have a nice day"
    # DogBreeds::Dog.all.each do |dog|
    #   puts dog.name
    # end
  end

end