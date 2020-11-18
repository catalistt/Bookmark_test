# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



#######################Creando categorías padres#########################################

Category.create(name: "Favoritos", visibility: true, parent_id: "")
Category.create(name: "Ocultos", visibility: false, parent_id: "" )
Category.create(name: "Otros", visibility: true, parent_id: "" )

20.times do
  Category.create(name: Faker::Commerce.department, visibility: "", parent_id: rand(25...28))
  Type.create(name: Faker::Book.genre)
  Bookmark.create(url: Faker::Internet.url, name: Faker::Internet.domain_word,type_id: rand(1...10), category_id: rand(25...35) )
end


