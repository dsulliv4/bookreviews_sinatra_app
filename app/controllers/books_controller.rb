class BooksController < ApplicationController


   #index route for all posts
   get '/books' do
        "Welcome!"
        #leverage the model to get all posts from our database
        @books = Book.all
        #render all posts
        erb :"/books/index"
   end 

   # show route for a single post
   
   #CREATE
      #take you to the view of a form that creates the post
      get '/books/new' do
         if logged_in?
            erb :"/books/new"
         else
            flash[:error] = "You must be logged in to log a new book."
            redirect "/"
      end 
   end  

      post '/books' do
         
         # receive the params that the user input in the create new post form
       @book= Book.new(title: params[:title], author: params[:author], genre: params[:genre], review: params[:review], image_url: params[:image_url], user_id: current_user.id)
        if @book.save
       # show post creation success message
         flash[:message] = "Created post successfully!"
         redirect "/books/#{@book.id}"
       else
         flash[:error] = "Please fill out all inputs before submitting."
         redirect "/books/new"
       end

      end 

   
   #SHOW
      
   get '/books/:id' do 
      #make sure every controller action verifies if there's a user logged in 
   
          @book = Book.find_by_id(params[:id])
          erb :'/books/show'
      end 
  


   #UPDATE
   get '/books/:id/edit' do
      @book = Book.find(params[:id])
       #if authorized_to_edit?(@book)
       if @book.user_id == current_user.id
         erb :'/books/edit'
      else
         flash[:error] = "You are not authorized to modify this post."
         redirect "/books"
   end 
end 

   patch '/books/:id' do
      @book = Book.find(params[:id])
      if @book.update(title: params[:title], author: params[:author], genre: params[:genre], review: params[:review], image_url: params[:image_url])
      redirect "/books/#{@book.id}"
      else 
         flash[:error] = "Please fill out all required fields."
         redirect "/books/#{@book.id}"
      end 
      end 


   #DELETE 


   delete '/books/:id' do 
      @book = Book.find(params[:id])
      if @book.user_id == current_user.id
         @book.destroy
         redirect "/books"
     else 
      flash[:error] = "You are not authorized to delete this post."
         redirect "/books"
   end 
end 


   
end 
