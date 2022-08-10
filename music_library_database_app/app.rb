# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository'
    also_reload 'lib/artist_repository'
  end

  get '/artists' do
    repo =  ArtistRepository.new
    artists = repo.all
    response = artists.map { |artist| artist.name}.join(', ')

  end

  post '/artists' do
    new_artist = Artist.new
    new_artist.id = params['id'].to_i
    new_artist.name = params['name']
    new_artist.genre = params['genre']
      repo = ArtistRepository.new
      repo.create(new_artist)
  end

  get '/artists' do
    repo =  ArtistRepository.new
    artists = repo.all
  end
end