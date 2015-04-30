class Movie < ActiveRecord::Base

  attr_reader :title, :castnames, :castphotos, :poster, :year, :budget, :producers  #string

  def initialize(query)
    movie = Enceladus::Movie.find_by_title(query).first
    @title = movie.original_title
    @year = movie.release_date
    @poster = "https://image.tmdb.org/t/p/w185" + movie.poster_path
    castarray = movie.cast[0..9] # ten cast members
    @castnames = actornames(castarray)
    @castphotos = actorphotos(castarray)
    @budget = movie.budget
    @producers = movie.production_companies

  end

  def self.is_valid_search(query)
    # not really necessary
    movie = Enceladus::Movie.find_by_title(query) # map, not an array
    return true if (movie.first.release_date) #
    return false
  end

  def self.first_title(query)
    # This returns the first result from the query
    # Useful in order to find the correct movie title before instantiating a movie object
    return Enceladus::Movie.find_by_title(query).first.original_title
  end

  def actornames(castarray)
    # Look at the cast, pick out cast names and photos only, then return it as a hash
    tempcast = Array.new
    castarray.each do |member| 
      tempcast << member.name
    end
    return tempcast
  end

  def actorphotos(castarray)
    tempcast = Array.new
    castarray.each do |member|
      tempcast << member.profile_urls.second # 185px wide photo
    end
    return tempcast
  end


end
