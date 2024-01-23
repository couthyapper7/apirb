class MoviesController < ApplicationController
    def index
        title = params[:t]
        
        movie = Movie.new(title)
        movies = movie.search

        if movies.all?(&:valid?)

            if movies.present? && movies.first.valid?
                first_movie = movies.first
                movie_data = {
                    title: first_movie.title,
        
                    year: first_movie.year
                }
                
                render json: movie_data
            else 
                render json: { error: 'Error: invalid data field' }, status: :bad_request
            end
        else
        render json: { error: 'Error: invalid movie title' }, status: :bad_request
        end
    end
end


