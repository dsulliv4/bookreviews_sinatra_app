class UsersController < ApplicationController 

get "/login" do
  erb :login
end

post "/login" do
    #find the user
    user = User.find_by(email: params[:email])
    #authenticate the user
    if user && user.authenticate(params[:password])
    #log them in
    session[:user_id] = user.id
    #redirect them to user's profile (show)
    redirect '/users/#{user.id}'
    else
     #show an error message
        redirect '/login'
    
    end 
end 
get "/users/:id" do
    "users show page!"
end 

end 
end