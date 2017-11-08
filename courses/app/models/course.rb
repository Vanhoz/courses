class Course < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title, presence: true
  validates :materials, presence: true
  validates :questions, presence: true
end
