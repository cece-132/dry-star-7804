class DoctorPatient < ApplicationRecord
  validates_presence_of :doctor_id, :patient_id

  belongs_to :doctor
  belongs_to :patient
end