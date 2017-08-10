class Book < ApplicationRecord
  validates :title, :genre, :classification, :book_type, :year, presence: true
  has_many :authorships
  has_many :authors, through: :authorships

  # sets index @books variable to either "where" or "all"
  def self.search(term)
    if term
      # allows searches for all columns of book db
      # "%{term}%" is required for each ILIKE query
      joins(:authors).where('title ILIKE ? OR genre ILIKE ? OR classification ILIKE ? OR book_type ILIKE ? OR authors.first_name ILIKE ? OR authors.last_name ILIKE ?', "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%")
    else
      all
    end
  end

  def book_info
    "#{title} by #{authors.map(&:full_name).join(", ")}"
  end  
end