class Job < ApplicationRecord
  belongs_to :company, :foreign_key => :company_id
  has_many :applies

  validates :name, :place, presence: true
  validates :company_id, numericality: { only_integer: true }, presence: true
end
