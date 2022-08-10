require "spec_helper"
require "rack/test"
require_relative '../../app'


def reset_albums_table
  seed_sql = File.read('spec/seeds/albums_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe Application do
  before(:each) do
    reset_albums_table
  end
end

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /artists" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = get('/artists', names: 'Pixies, ABBA, Taylor Swift, Nina Simone, Kiasmos')
      expected_response = 'Pixies, ABBA, Taylor Swift, Nina Simone, Kiasmos'
      expect(response.status).to eq (200)
      expect(response.body).to eq (expected_response)
    end
  end

  context "POST /artists" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = post('/artists', name: 'Wild nothing', genre: 'Indie')

      expect(response.status).to eq (200)
      expect(response.body).to eq ('')
    end
  end

  context "GET /artists" do
    it 'returns 200 OK with include new artist' do
      # Assuming the post with id 1 exists.
      response = get('/artists')

      expect(response.status).to eq (200)
      expect(response.body).to include('Wild nothing')
    end
  end
end