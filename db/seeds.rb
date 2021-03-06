# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.destroy_all
Author.destroy_all
Authorship.destroy_all

book_types = [ 'Fiction', 'Nonfiction' ]
classifications = [ 'General Works', 'Philosophy, Psychology, Religion', 'World History', 'U.S. History', 'Geography, Anthropology, Recreation', 'Social Sciences', 'Law', 'Education', 'Fine Arts', 'Language and Literature', 'Science', 'Medicine', 'Technology', 'Agriculture', 'Military', 'Naval Science', 'Bibliography and Library Science', 'Auxiliary Sciences' ]

50.times do
  random_year = rand 1800..2017
  Book.create!(title: Faker::Book.title, genre: Faker::Book.genre, classification: classifications.sample, book_type: book_types.sample, year: random_year)
end

25.times do
  Author.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: Faker::Number.between(20, 100))
end

books = Book.all

author_ids = Author.pluck(:id)

books.each do | book |
  Authorship.create!(book_id: book.id, author_id: author_ids.sample)
end