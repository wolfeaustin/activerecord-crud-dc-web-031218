# Replace the '__' in the below methods to to make the specs pass!
# Each '__' corresponds to a single line of code you will need to write.
# See the example below on the left and how it should look on the right.
# def make_a_new_movie_instance    # def make_a_new_movie_instance
#   movie = __                     #   movie = Movie.new
# end                              # end
require 'pry'
def can_be_instantiated_and_then_saved
  movie = Movie.new
  movie.title = "This is a title."
  movie.save
end

def can_be_created_with_a_hash_of_attributes
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.create(attributes)
end

def can_be_created_in_a_block(args = {})
  Movie.create do |m|
    #binding.pry
    m.title = args[:title] || "Home Alone"
    m.release_date = args[:release_date] || 1990
    m.director = args[:director]
    m.lead = args[:lead]
    m.in_theaters = args[:in_theaters]
    #binding.pry
  end

end

def can_get_the_first_item_in_the_database
  Movie.all.first[:title]
end

def can_get_the_last_item_in_the_database
  Movie.all.last[:title]
end

def can_get_size_of_the_database
  Movie.all.count
end

def can_find_the_first_item_from_the_database_using_id
  Movie.all.find{|el| el.id == 1}[:title]
end

def can_find_by_multiple_attributes
  # title == "Title"
  # release_date == 2000
  # director == "Me"
  Movie.all.find{|el| el.title == "Title" &&
    el.release_date == 2000 && el.director == "Me"}

end

def can_find_using_where_clause_and_be_sorted
  # For this test return all movies released after 2002 and ordered by
  # release date descending
  Movie.all.select{|m| m.release_date > 2002}.sort.reverse
end

def can_be_found_updated_and_saved
  # Updtate the title "Awesome Flick" to "Even Awesomer Flick"
  Movie.create(title: "Awesome Flick")
  m = Movie.find_by(title: "Awesome Flick")
  m.update(title: "Even Awesomer Flick")
  m
end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  Movie.create(title: "Wat?")
  m = Movie.find_by(title: "Wat?")
  Movie.update(m, title: "Wat, huh?")
  m
end

def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  arr = []
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  5.times do |i|
    temp = Movie.find_by(title: "Movie_#{i}")
    arr << temp
  end
  arr.each {|i| Movie.update(i, title: "A Movie")}
end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  m = Movie.find_by(title: "That One Where the Guy Kicks Another Guy Once")
  Movie.destroy(m)
end

def can_destroy_all_items_at_once
  arr = []
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  10.times do |i|
    temp = Movie.find_by(title: "Movie_#{i}")
    arr << temp
  end
  arr.each {|i| Movie.destroy(i)}
end
