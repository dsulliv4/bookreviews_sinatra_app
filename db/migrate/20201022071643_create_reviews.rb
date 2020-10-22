class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :text
      t.integer :user_id
      t.sinteger :book_id

      t.timestamps null: false
    end
  end
end
