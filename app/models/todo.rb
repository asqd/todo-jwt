# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  title      :string
#  created_by :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Todo < ApplicationRecord
  # relations
  has_many :items, dependent: :destroy

  # validations
  validates_presence_of :title, :created_by
end
