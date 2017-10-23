# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord

  has_secure_password

  has_many :todos, foreign_key: :created_by

  validates_presence_of :name, :email, :password_digest
end
