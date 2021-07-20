FactoryBot.define do
  factory :user do
    sequence(:first_name, 1) { |n| "north#{n}" }
    last_name { "maina" }
  end
end
