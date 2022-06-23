FactoryBot.define do
    factory :comment do
        email { Faker::Internet.email  }
        body { Faker::Lorem.paragraph(sentence_count: 10, supplemental: true) }
    end
  end 