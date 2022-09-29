# require "open-uri"
# require "yaml"

# file = "https://gist.githubusercontent.com/dmilon/e897669bfa411bfdd92c9f59f91dd6fe/raw/d1e1b06e25616771fddf44bf066765f518b0655d/imdb.yml"
# sample = YAML.load(URI.open(file).read)

# puts "Creating directors..."
# directors = {}  # slug => Director
# sample["directors"].each do |director|
#   directors[director["slug"]] = Director.create! director.slice("first_name", "last_name")
# end

# puts "Creating movies..."
# sample["movies"].each do |movie|
#   Movie.create! movie.slice("title", "year", "synopsis").merge(director: directors[movie["director_slug"]])
# end

# puts "Creating tv shows..."
# sample["tv_shows"].each do |tv_show|
#   TvShow.create! tv_show
# end
# puts "Finished!"
require 'faker'
puts "Clearing DB"
Movie.destroy_all
Director.destroy_all
TvShow.destroy_all

puts "Creating directors..."
directors = {}  # slug => Director
20.times do
  director = Director.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  director.save!
end

puts "Creating movies..."
150.times do
  movie = Movie.new(title: Faker::Movie.title, year: rand(1960..2022), synopsis: Faker::Movies::HarryPotter.quote)
  movie.director = Director.all.sample
  movie.save!
end

puts "Creating tv shows..."
75.times do
  tvshow = TvShow.new(title: Faker::Book.title, year: rand(1960..2022), synopsis: Faker::TvShows::DrWho.quote)
end
puts "Finished!"
