require './config/environment'
require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  enable :sessions
  use Rack::Flash
  configure do
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

<<<<<<< HEAD
  get '/' do
    erb :index
  end



=======
get '/' do
  "Welcome to Fwitter"
   
end

get '/signup' do 


end
>>>>>>> 90856b55b658d444fd56c9d44462967c7c645a9b


end
