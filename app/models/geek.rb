class Geek < ApplicationRecord
  has_many :applies

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :stack, :resume, presence: true
end
