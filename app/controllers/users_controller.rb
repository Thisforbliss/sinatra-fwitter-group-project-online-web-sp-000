class UsersController < ApplicationController

  get '/signup' do
    if Helpers.is_logged_in?(session)
      redirect to '/tweets'
    else
    erb :"users/create_user"
    end
  end

  post '/signup' do
    params.each do |label, input|
      if input.empty?
        flash[:new_user_error] = "Please fill in #{label}."
        redirect '/signup'
      end
    end
     user = User.create(username: params["username"], email: params["email"], password: params["password"])
     session[:user_id] = user.id
     redirect "/tweets"

     if Helpers.is_logged_in?

     end
  end

  get '/login' do
    if Helpers.is_logged_in?(session)
      redirect to '/tweets'
    end
    erb :"users/login"
  end

  post '/login' do
    user = User.find_by(:username => params["username"])
     if user && user.authenticate(params["password"])
       session[:user_id] = user.id
       redirect to '/tweets'
     else
       flash[:login_error] = "Incorrect username and/or password. Please try again"
       redirect to '/login'
     end
  end

  get '/logout' do
    if Helpers.is_logged_in?(session)
      session.clear
      redirect to '/login'
    elsif
      !Helpers.is_logged_in?(session)
      redirect to '/'
    end
  end

  # get '/users/:slug' do
  #   slug = params[:slug]
  #   @user = User.find_by_slug(slug)
  #   erb :"users/show"
  # end

  get '/users/:slug' do
   @user = User.find_by_slug(params[:slug])
   erb :"users/show"
  end


end
