class Author < ApplicationRecord
  validates :first_name, :last_name, :age, presence: true
  has_many :authorships
  has_many :books, through :authorships
end
