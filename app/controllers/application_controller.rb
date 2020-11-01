require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "top_secret_session"
    register Sinatra::Flash 
  
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end

  helpers do 

    def logged_in?
      User.find(session[:user_id]) rescue nil
    end 
    
    def current_user
      # find a the current user
      @user ||= User.find_by(id: session[:user_id])
    end

#create an authorization helper or edit/delete
#if the user from the post == current usershotgun

def authorized_to_edit?(book)
  if !logged_in?
    flash[:error] = "You are not authorized to edit this post."
    redirect "/login" 
  end 
  end 


  end
end 
