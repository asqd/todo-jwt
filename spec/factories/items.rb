# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  done       :boolean
#  todo_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :item do
    name { Faker::Book.title }
    done false
    todo_id nil
  end
end
