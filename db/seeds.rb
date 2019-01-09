# frozen_string_literal: true

1.upto(5) do |i|
  Category.create!(
    name: Faker::Coffee.variety,
    description: Faker::Lorem.sentence
  )
  p "CATEGORY #{i} : créé"
end

1.upto(10) do |i|
  Item.create!(
    original_price: Faker::Number.decimal(2),
    name: Faker::Coffee.blend_name,
    category_id: rand(5) + 1
  )
  p "ITEM #{i} : créé"
end
