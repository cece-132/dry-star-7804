require 'rails_helper'

RSpec.describe DoctorPatient, type: :model do
  describe 'validatiuons' do
    it {should validate_presence_of :doctor_id }
    it {should validate_presence_of :patient_id }
  end
  
  describe 'relationships' do
    it {should belong_to :doctor}
    it {should belong_to :patient}
  end
end