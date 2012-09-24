require 'rest_client'

module Photograph
  class Page
    @queue = :pages

    def self.perform options, callback
      artist =  Artist.new(options)
      artist.shoot!

      artist.clean!
    end
  end
end
