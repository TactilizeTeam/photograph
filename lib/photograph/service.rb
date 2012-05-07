require 'sinatra'
require 'sinatra/json'

module Photograph
  class Service < ::Sinatra::Base
    helpers Sinatra::JSON

    get '/' do
      json :version => Photograph::VERSION
    end

    get '/shoot' do
      artist = Artist.new params[:url]
      artist.shoot!

      send_file artist.image.path,
        :type => :png

      artist.clean!
    end
  end
end

