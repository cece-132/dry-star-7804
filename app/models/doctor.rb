class Doctor < ApplicationRecord
  validates_presence_of :name, :hospital_id, :specialty, :university

  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def patient_count
    patients.count
  end

  def self.desc_pt_count
    # ran out of time
  end
end
