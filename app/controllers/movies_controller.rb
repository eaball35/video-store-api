class MoviesController < ApplicationController

  def index
    movies = Movie.all.as_json(only: [:id, :title, :release_date])
    render json: movies, status: :ok
  end

  def show
    movie = Movie.find_by(id: params[:id]).as_json(only: [:id, :title, :overview, :release_date, :inventory, :available_inventory])
  
    if movie
      render json: movie, status: :ok
      return
    else
      render json: {"errors" =>["not found"]}, status: :not_found
      return
    end 
  end 

  def create
    movie = Movie.new(movie_params)

    if movie.save
      render json: movie.as_json(only: [:id]), status: :ok
      return
    else
      render json: {
        ok: false,
        errors: movie.errors.messages
      }, status: :bad_request
      return
    end

  end 

  private

  def movie_params
    params.permit(:title, :overview, :release_date, :inventory)
  end
end
