FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'00test'}
    password_confirmation {password}
    last_name             {'試験'}
    first_name            {'試験'}
    last_name_kana        {'シケン'}
    first_name_kana       {'シケン'}
    birthday              {'1930-01-01'}
  end
end