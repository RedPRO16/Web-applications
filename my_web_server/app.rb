require 'sinatra/base'


class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.

  get '/' do
    'Hello World!'

    return 'Hello World!'
  end

  get '/posts' do
   return 'A list of post'

  end

end