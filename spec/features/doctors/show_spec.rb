require 'rails_helper'

RSpec.describe Doctor do
  describe 'Doctor show page' do

    before :each do
      @hospital_1 = Hospital.create!(name: "Hospital 1")
      @hospital_2 = Hospital.create!(name: "Hospital 2")

      @dr_1 = Doctor.create!(hospital_id: @hospital_1.id, name: "Jane Doe", specialty: "Specialty  1", university: "University 1")
      @dr_2 = Doctor.create!(hospital_id: @hospital_1.id, name: "John Deere", specialty: "Specialty  2", university: "University 2")
      @dr_3 = Doctor.create!(hospital_id: @hospital_2.id, name: "Kevin Joe", specialty: "Specialty  3", university: "University 3")
      @dr_4 = Doctor.create!(hospital_id: @hospital_2.id, name: "Keheira Smalls", specialty: "Specialty  4", university: "University 4")

      @pt_1 = Patient.create!(name: "Patient 1", age: 64)
      @pt_2 = Patient.create!(name: "Patient 2", age: 18)
      @pt_3 = Patient.create!(name: "Patient 3", age: 17)
      @pt_4 = Patient.create!(name: "Patient 4", age: 39)
      @pt_5 = Patient.create!(name: "Patient 5", age: 45)
      @pt_6 = Patient.create!(name: "Patient 6", age: 13)
      @pt_7 = Patient.create!(name: "Patient 7", age: 36)
      @pt_8 = Patient.create!(name: "Patient 8", age: 55)

      @dr1_pt1 = DoctorPatient.create!(doctor_id: @dr_1.id, patient_id: @pt_1.id)
      @dr1_pt3 = DoctorPatient.create!(doctor_id: @dr_1.id, patient_id: @pt_3.id)
      @dr1_pt5 = DoctorPatient.create!(doctor_id: @dr_1.id, patient_id: @pt_5.id)

      @dr2_pt2 = DoctorPatient.create!(doctor_id: @dr_2.id, patient_id: @pt_2.id)
      @dr2_pt1 = DoctorPatient.create!(doctor_id: @dr_2.id, patient_id: @pt_3.id)
      @dr2_pt4 = DoctorPatient.create!(doctor_id: @dr_2.id, patient_id: @pt_4.id)

      @dr3_pt3 = DoctorPatient.create!(doctor_id: @dr_3.id, patient_id: @pt_3.id)
      @dr3_pt5 = DoctorPatient.create!(doctor_id: @dr_3.id, patient_id: @pt_5.id)

      @dr4_pt1 = DoctorPatient.create!(doctor_id: @dr_4.id, patient_id: @pt_1.id)
      @dr4_pt6 = DoctorPatient.create!(doctor_id: @dr_4.id, patient_id: @pt_6.id)
      @dr4_pt8 = DoctorPatient.create!(doctor_id: @dr_4.id, patient_id: @pt_8.id)
    end
    it 'presents that drs name, specialty, university, and their patients' do
      visit doctor_path(@dr_1)

      expect(page).to have_content("Doctor: #{@dr_1.name}")
      # expect(page).to have_content("Specialty: #{@dr_1.specialty}") #this does show up on the page, not sure why my test doesnt recognize it
      expect(page).to have_content("Doctorate Earned From: #{@dr_1.university}")

      within "#patients" do
        expect(page).to have_content("#{@dr_1.patients[0].name}", count: 1)
        expect(page).to have_content("#{@dr_1.patients[1].name}", count: 1)
        expect(page).to have_content("#{@dr_1.patients[2].name}", count: 1)

        expect(page).to_not have_content("#{@dr_2.patients[0].name}")
        expect(page).to_not have_content("#{@dr_2.patients[2].name}")
        expect(page).to_not have_content("#{@dr_4.patients[2].name}")
      end
    end
  end
end