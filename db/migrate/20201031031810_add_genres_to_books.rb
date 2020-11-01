class AddGenresToBooks < ActiveRecord::Migration
  def change
    add_column :books, :reviews, :string
  end
end
