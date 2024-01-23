class Movie < ApplicationRecord
    class Movie
        include ActiveModel::Validations

        attr_accessor :title

        validates :title, presence: true, format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "only allows letters, numbers and spaces" }

        def initialize(title)
            @title = title
        end
    
        def search
            encoded_title = URI.encode(@title)
        
            client = Omdb::Api::Client.new(api_key: '9e5ea815')
        
            client.search(search: encoded_title)
        end
    end
end
