class MoviesController < ApplicationController
    def index
        title = params[:t]
        
        movie = Movie.new(title)
        movies = movie.search

        begin
            
            movies_data = []

            movies.each do |m|
                if m.title.present? && m.year.present?
                    movies_data << {
                        title: m.title,
                        year: m.year
                    }
                else
                    render json: { error: 'Error: invalid movie title' }, status: :bad_request
                end
            end
            render json: movies_data
        rescue
            render json: { error: 'Error: no se encontraron películas con ese título' }, status: :not_found
        end
    end
end


