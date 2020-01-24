# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Product.destroy_all

50.times do |index|
  product = Product.create!(name: Faker::Games::Witcher.monster,
    cost: Faker::Number.decimal(r_digits: 2),
    country_of_origin: Faker::WorldCup.team)
    5.times do |index|
      product.reviews.create!(author: Faker::TvShows::BojackHorseman.character,
        content_body: Faker::Hipster.words(number: 15), rating: Faker::Number.within(range: 1..5),
        product_id: product.id)
      end
  end



    p "Created #{Product.count} products, and #{Review.count} reviews"
