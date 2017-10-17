class Item < ApplicationRecord
  # relations
  belongs_to :todo

  # validations
  validates_presence_of :name
end
