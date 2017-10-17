FactoryGirl.define do
  factory :item do
    name { Faker::Book.title }
    done false
    todo_id nil
  end
end