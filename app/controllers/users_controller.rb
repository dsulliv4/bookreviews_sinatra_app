class UsersController < ApplicationController 

get '/login' do
  erb :login
end


post '/login' do
    user = User.find_by(email: params[:email])
    #authenticate the user
    if user.save
      #log them in - creating a session, adding a key/value pair to session hash
      session[:user_id] = user.id
      #add a success message to the flash hash
      flash[:message] ="Welcome back #{user.name}"
      #redirects to user profile
      redirect "users/#{user.id}"
    else
    #show an error message
    flash[:error] = "Your credentials were invalid: #{user.errors.full_messages.to_sentence}"
      #redirect to login form
      redirect '/login'
    end
  end
 


get '/users/signup' do
    #render my sign form
    erb :'/users/signup'
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :'/users/show'
end 



# post sign up route that receive input data from user, create the user, and logs user in
get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
end 

post '/users' do
  @user = User.create(params)
  # logs the user in
  session[:user_id] = @user.id
  redirect "/users/#{@user.id}"
end

#LOG OUT
#get logout that clears the session hash
get '/logout' do
    #binding.pry
    session.clear
    #binding.pry
    #redirect to home/landing page
    redirect '/'
  end 
end 
