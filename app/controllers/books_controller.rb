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
       @book= Book.create(title: params[:title], author: params[:author], genre: params[:genre])
        if @book.save
       # show post creation success message
         flash[:message] = "Created post successfully!"
         redirect '/books/#{book.id}'
       else
         flash[:error] = "Please fill out all inputs before submitting."
         redirect '/books/new'
       end

      end 

   
   #SHOW
      
   get '/books/:id' do 
      #make sure every controller action verifies if there's a user logged in 
      if !logged_in?
          redirect "/login"
      else 
          @book = Book.find_by_id(params[:id])
          erb :"/books/show"
      end 
  end


   #UPDATE
   get '/books/:id/edit' do
      @book = Book.find(params[:id])
       if authorized_to_edit?(@book)
         erb :'/posts/edit'
      else
         flash[:error] = "You are not authorized to modify this post."
         redirect "/books"
   end 
end 

   patch '/books/:id' do
      @post = Post.find(params[:id])
      @post.update(title: params[:title], author: params[:author],genre: params[:genre])
      redirect '/books/#{@book.id}'
   end 


   #DELETE 
   #create link to delete on post show page
   #use Rack::MethodOvrride in config.ru
   #delete route to delete our post

   delete '/books/:id' do 
      @book = Book.find(params[:id])
      @book.destroy
      redirect '/books'
   end 


   
end 

