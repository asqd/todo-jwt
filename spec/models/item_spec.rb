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

require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to(:todo) }

  it { should validate_presence_of(:name) }
end
