require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end


  get '/names' do

    names = params[:names]
    return "#{names}"

  end



  # get '/hello' do
  #   @name = params[:name]
  #   return "Hello #{name}"
  # end

  # post '/submit' do
  #   name = params[:name]
  #   message = params[:message]
  #   "Thanks #{name}, you sent this message: #{message}"
  # end


  # post '/names' do
  #   names = params[:names]
  #   return "#{names}"
  # end

  post '/sort-names' do
    names = params[:names]
    names.split(",").sort.join(",")
  end

end