class UsersController < ApplicationController

  get '/signup' do
    erb :"users/create_user"
  end

  post '/signup' do
    #binding.pry
     @user = User.create(username: params["username"], email: params["email"], password: params["password"])
#binding.pry
     redirect "/tweets"



  end
end
