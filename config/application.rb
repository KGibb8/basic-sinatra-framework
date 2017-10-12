require 'rubygems'
require 'sinatra'
require 'sinatra/flash'
require 'haml'
require 'pry'

Dir["./config/initializers/*.rb"].each { |file| require file }
Dir["./app/helpers/*.rb"].each {|file| require file }
Dir["./lib/*.rb"].each {|file| require file }

set :run, false

class Application < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  set :assets, 'app/assets'
  set :views, 'app/views'
  set :public, "public"
  set :root, File.dirname(__FILE__)

  configure do
    set :server, :puma
  end

  get('/') do
    haml :index, layout: :"layouts/application"
  end
end
