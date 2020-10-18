class Company < ApplicationRecord
  has_many :jobs

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
end
