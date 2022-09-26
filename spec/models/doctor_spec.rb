require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'validatiuons' do
    it {should validate_presence_of :name }
    it {should validate_presence_of :hospital_id }
    it {should validate_presence_of :specialty }
    it {should validate_presence_of :university }
  end
  
  describe 'relationships' do
    it {should belong_to :hospital}
    it {should have_many :doctor_patients}
    it {should have_many(:patients).through(:doctor_patients)}
  end
end