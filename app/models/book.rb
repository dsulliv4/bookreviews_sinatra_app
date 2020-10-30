class Book < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    validates :title, :author, :genre, :review, presence: true

end
