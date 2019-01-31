FactoryBot.define do
  factory :product do
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    price { Faker::Number.between(10, 1000) }

    trait :dragonball do
      title "七龍珠"
      description "好看的漫畫"
      price 80
    end

    trait :jojo do
      title "冒險野郎"
      description "替身"
      price 200
    end
  end
end
