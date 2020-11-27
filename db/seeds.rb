# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning DB...'
Restaurant.destroy_all
puts 'Db cleaned'
puts 'Creating Restaurants'

5.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: %w[chinese italian japanese french belgian].sample
  )

  review = Review.new(
    restaurant_id: restaurant.id,
    content: Faker::Restaurant.review,
    rating: rand(0..5)
  )
  puts "#{restaurant.name} is created"
end
