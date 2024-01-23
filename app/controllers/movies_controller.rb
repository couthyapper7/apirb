class MoviesController < ApplicationController
    def index

        movie = Movie.new({title: params[:t]})

        if movie.valid?

            movies = movie.search

            if movies.present? && movies.first.valid?
                first_movie = movies.first
                movie_data = {
                title: first_movie.title,
                director: first_movie.director,
                year: first_movie.year
                }
                
                render json: movie_data
            else 
                render json: { error: 'Error: invalid data field' }, status: :bad_request
            end
        else
        render json: { error: 'Error: invalid movie tittle' }, status: :bad_request
        end
    end
end


