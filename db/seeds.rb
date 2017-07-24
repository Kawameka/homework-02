# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

types = [ 'Fiction', 'Nonfiction' ]
classifications = [ 'General Works', 'Philosophy, Psychology, Religion', 'World History', 'U.S. History', 'Geography, Anthropology, Recreation', 'Social Sciences', 'Law', 'Education', 'Fine Arts', 'Language and Literature', 'Science', 'Medicine', 'Technology', 'Agriculture', 'Military', 'Naval Science', 'Bibliography and Library Science', 'Auxiliary Sciences' ]

50.times do
  random_year = rand 1800..2017
  Book.create!(title: Faker::Book.title, author: Faker::Book.author, genre: Faker::Book.genre, classification: classifications.sample, type: types.sample, year: random_year)
end
