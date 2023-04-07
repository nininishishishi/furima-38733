FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'Adidas1270'}
    password_confirmation {password}
    lastname              {'西村'}
    firstname             {'大地'}
    lastname_kana         {'ニシムラ'}
    firstname_kana        {'ダイチ'}
    birthday              {'1989-07-21'}
  end
end