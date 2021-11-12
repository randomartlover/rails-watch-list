require 'json'
require 'open-uri'

url = 'http://tmdb.lewagon.com/movie/top_rated'
image_base_url = 'https://image.tmdb.org/t/p/w500'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)['results']

puts 'Seeding started'
movies.each do |movie|
  new_movie = Movie.new
  new_movie.title = movie['original_title']
  new_movie.overview = movie['overview']
  new_movie.poster_url = image_base_url + movie['poster_path']
  new_movie.rating = movie['vote_average']
  new_movie.save!
  puts 'movie created'
end
puts 'Seeding done'
