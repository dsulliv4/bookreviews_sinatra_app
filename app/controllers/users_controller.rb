class UsersController < ApplicationController 

get '/login' do
  erb :login
end


post '/login' do
    user = User.find_by(email: params[:email])
    #authenticate the user
    if post.save
      #log them in - creating a session, adding a key/value pair to session hash
      session[:user_id] = user.id
      #add a success message to the flash hash
      flash[:message] ="Welcome back #{user.name}"
      #redirects to user profile
      redirect "users/#{user.id}"
    else
    #show an error message
    flash[:error] = "Your credentials were invalid: #{post.errors.full_messages.to_sentence}"
      #redirect to login form
      redirect '/login'
    end
  end
 

get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
end 


get '/users/signup' do
    #render my sign form
    erb :'/users/signup'
end





# post sign up route that receive input data from user, create the user, and logs user in
post '/users' do
    #will eventually need to add validations to confirm all inputs are filled out before creating user
    @user = User.create(params)
    #post sign up route to create user using params and add key/value pair to sessions hash
    session[:user_id] = @user.id
    # redirect to user profile
    redirect "/users/#{user.id}"

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
