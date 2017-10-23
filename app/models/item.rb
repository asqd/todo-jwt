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

class Item < ApplicationRecord
  # relations
  belongs_to :todo

  # validations
  validates_presence_of :name
end
