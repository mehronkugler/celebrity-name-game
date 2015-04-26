class NamegameController < ApplicationController

  def index
    # Create new cookies if they don't exist already
    cookies[:celebng_score] = 0 if (!cookies[:celebng_score])
    cookies[:celebng_rounds] = 1 if (!cookies[:celebng_rounds])
    # pass values of cookies to the index page
    @score = cookies[:celebng_score]
    @rounds = cookies[:celebng_rounds]
  end

end
