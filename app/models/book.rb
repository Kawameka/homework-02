class Book < ApplicationRecord
  validates :title, :author, :genre, :classification, :book_type, :year, presence: true

  # sets index @books variable to either "where" or "all"
  def self.search(term)
    if term
      # allows searches for all columns of book db
      # "%{term}" is required for each ILIKE query
      where(['author ILIKE ? OR title ILIKE ? OR genre ILIKE ? OR classification ILIKE ? OR book_type ILIKE ?', "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%"])
    else
      all
    end
  end
end
