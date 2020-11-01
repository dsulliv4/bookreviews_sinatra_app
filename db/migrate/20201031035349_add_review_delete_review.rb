class AddReviewDeleteReview < ActiveRecord::Migration
  def up
    add_column :books, :review, :string
  end

  def down
    remove_column :books, :reviews 
  end 
end
