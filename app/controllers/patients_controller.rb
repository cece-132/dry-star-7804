class PatientsController < ApplicationController
  def index
    @patients = Patient.asc_alpha
  end
end