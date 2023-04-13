FactoryBot.define do
  factory :item do
    title  { Faker::Lorem.sentence }
    detail { Faker::Lorem.sentence }
    category_id { 2 }
    condtion_id { 2 }
    shipping_cost_id { 2 }
    prefecture_id { 2 }
    reserve_id { 2 }
    price { 2000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
