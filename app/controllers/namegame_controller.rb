class NamegameController < ApplicationController
  respond_to :js, :html

  def index
    # Create new cookies if they don't exist already
    cookies[:celebng_score] = 0 if (!cookies[:celebng_score])
    cookies[:celebng_rounds] = 1 if (!cookies[:celebng_rounds])
    # pass values of cookies to the index page
    @score = cookies[:celebng_score]
    @rounds = cookies[:celebng_rounds]
    begin
      # Test that the searchtext does in fact return a valid movie by testing the result of an arbitrary value 
      (Enceladus::Movie.find_by_title(params[:searchtext]).total_results > 0)
    rescue Enceladus::Exception::Api => e
      @movie = Movie.new("Interstellar")
    else
      @movie = Movie.new(params[:searchtext])
    end
    
  end

  def search
    @movie = Movie.new(params[:searchtext])
  end

end
