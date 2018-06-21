FactoryBot.define do
  factory :user,aliases: [:owner] do
    first_name "Aaron"
    last_name "sumner"
    sequence(:email) { |n| "tester#{n}@example.com"}
    password "dottle-nonveau-pavilion-tights-furze"
  end
end
