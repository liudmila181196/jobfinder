class Apply < ApplicationRecord
  belongs_to :geeks
  belongs_to :jobs

  validates :job_id, :geek_id, numericality: { only_integer: true }, presence: true
  validates :read, :invited, presence: true
end
