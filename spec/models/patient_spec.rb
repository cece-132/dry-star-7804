require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'validatiuons' do
    it {should validate_presence_of :name }
    it {should validate_presence_of :age }
  end
  
  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
    it {should have_one(:hospital).through(:doctors)}
  end

  describe "class methods" do
    describe ".desc_alpha" do
      it 'orders patients by name in desc order' do
        @pt_2 = Patient.create!(name: "Patient 2", age: 18)
        @pt_1 = Patient.create!(name: "Patient 1", age: 64)
        @pt_3 = Patient.create!(name: "Patient 3", age: 17)
        @pt_5 = Patient.create!(name: "Patient 5", age: 45)
        @pt_4 = Patient.create!(name: "Patient 4", age: 39)
        @pt_6 = Patient.create!(name: "Patient 6", age: 13)
        @pt_8 = Patient.create!(name: "Patient 8", age: 55)
        @pt_7 = Patient.create!(name: "Patient 7", age: 36)

        expect(Patient.asc_alpha).to eq [@pt_1, @pt_2, @pt_3, @pt_4, @pt_5, @pt_6, @pt_7, @pt_8]
      end
    end

    describe ".older_than_18" do
      it 'only show patients older than 18' do
        @pt_1 = Patient.create!(name: "Patient 1", age: 64)
        @pt_2 = Patient.create!(name: "Patient 2", age: 43)
        @pt_3 = Patient.create!(name: "Patient 3", age: 17)
        @pt_4 = Patient.create!(name: "Patient 4", age: 39)
        @pt_5 = Patient.create!(name: "Patient 5", age: 15)
        @pt_6 = Patient.create!(name: "Patient 6", age: 18)
        @pt_7 = Patient.create!(name: "Patient 7", age: 36)
        @pt_8 = Patient.create!(name: "Patient 8", age: 55)

        expect(Patient.older_than_18).to eq [@pt_1, @pt_2, @pt_4, @pt_7, @pt_8]
      end
    end
  end
end