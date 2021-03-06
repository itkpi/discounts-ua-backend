Fabricator(:discount) do
  discount_type_period
  name { Faker::Commerce.product_name }
  small_img_url { Faker::LoremPixel.image }
  img_url { Faker::LoremPixel.image }
  price_new { Faker::Commerce.price }
  price_old { Faker::Commerce.price + Random.rand(Faker::Commerce.price) }
end
