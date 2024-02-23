require 'open-uri'
require 'json'

Movie.destroy_all

url = "http://tmdb.lewagon.com/movie/now_playing?language=en-US&page=1"

movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

puts "seeding started...."

movies['results'].each do |movie|
  puts "seeding new element"
  puts "#{movie['original_title']}"
  puts "#{movie['overview']}"
  puts "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}"
  puts "#{movie['vote_average']}"

  title = movie['original_title']
  overview = movie['overview']
  poster_url = "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}"
  rating = movie['vote_average']

new_movie = Movie.new(title: title,overview: overview,poster_url: poster_url,rating: rating)
new_movie.save!
puts "new movie added..."

end

puts "finished"


# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true

# request = Net::HTTP::Get.new(url)
# request["accept"] = 'application/json'

# response = http.request(request)
# puts response.read_body
