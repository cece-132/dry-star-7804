class DoctorPatientsController < ApplicationController

  def destroy
    dr_pt = DoctorPatient.find_by(doctor_id: params[:doctor_id], patient_id: params[:patient_id])
    dr_pt.destroy
    redirect_to doctor_path(params[:doctor_id])
  end
end