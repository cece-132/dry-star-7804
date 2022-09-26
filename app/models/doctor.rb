class Doctor < ApplicationRecord
  validates_presence_of :name, :hospital_id, :specialty, :university

  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients
end
