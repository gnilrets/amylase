# spec/factories/clients.rb

FactoryGirl.define do
  factory :client do
    sequence(:name) { |n| "MyClient-#{n}" }
  end
end
