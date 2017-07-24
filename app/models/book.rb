class Book < ApplicationRecord
  validates :title, :author, :genre, :classification, :book_type, :year, presence: true
end
