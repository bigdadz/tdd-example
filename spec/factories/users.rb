FactoryBot.define do
  sequence(:name)           { |n| "User Number #{n}" }
  factory :user do
     name { FactoryBot.generate(:name) }
  end
end
