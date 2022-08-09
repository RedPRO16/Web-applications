require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do

  end

  get '/hello' do
    @name = params[:name]
    return erb(:index)
  end

  post '/submit' do
    name = params[:name]
    message = params[:message]
    "Thanks #{name}, you sent this message: #{message}"
  end


<<<<<<< HEAD
end
=======
end
>>>>>>> 0481ddb265bfe2ced8e5a23e57be27b69d9611c1
