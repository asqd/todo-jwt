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

require 'rails_helper'

RSpec.describe Todo, type: :model do
  it { should have_many(:items).dependent(:destroy) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }
end
