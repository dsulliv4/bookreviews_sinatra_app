class BooksController < ApplicationController


   #index route for all posts
   get '/books' do
        "Welcome!"
        #leverage the model to get all posts from our database
        @posts = Post.all
        #render all posts
   end 

   # show route for a single post
   get '/books/:id' do 
      @post = Post.find(params[:id])
      erb :"/posts/show"
end 



   #CREATE


   #UPDATE


   #DELETE 
   
   
end 