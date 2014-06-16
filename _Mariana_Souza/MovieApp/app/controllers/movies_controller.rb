class MoviesController < ApplicationController
  
  def index
  end

  def new 
  end

  def create
  	# render plain: params[:movie].inspect
  	@movie = Movie.new(params[:movie])
  	@movie.save
  	redirect_to @movie
  end

end

