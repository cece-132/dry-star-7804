class Patient < ApplicationRecord
  validates_presence_of :name, :age

  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients
  has_one :hospital, through: :doctors

  def self.asc_alpha
    order(:name)
  end

  def self.older_than_18
    where('age > 18')
  end
end