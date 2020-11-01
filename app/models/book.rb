class Book < ActiveRecord::Base
    belongs_to :user

    validates :title, :author, :genre, :review, presence: true

end
