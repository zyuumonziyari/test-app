FactoryBot.define do
  factory :post do
    title { 'タイトル1' }
    content { '本文1' }

    association :user
  end
end
