class MoviesController < ApplicationController
  
before_filter :load_resource, only: [:show, :edit]

  
  def index
    @movies =  Movie.search_for(params[:q]) || Movie.all
  end

 def show
    @movie = Movie.find(params[:id])
  end

  def new 
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end
 
  def create
  	@movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, :notice => "Your movie was saved"
    else
      render "new"
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movies_path, :notice => "The movie has been updated"
    else
      render "edit"
    end
  
  end

 def movie_params
    allow = [:title, :description, :year_released]
    params.require(:movie).permit(allow)
  end


  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, :notice => "Your post has been deleted"
  end



  def load_resource
    @movie = Movie.find(params[:id])
  end



end

