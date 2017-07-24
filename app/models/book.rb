class Book < ApplicationRecord
  validates :title, :author, :genre, :classification, :type, :year, presence: true
end
