class AddImageToBooks < ActiveRecord::Migration
  def up
    add_column :books, :image_url, :string
  end
end
