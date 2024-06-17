class ReceptionistController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_receptionist

  def show
    @patients = Patient.all # Assuming you have a Patient model
  end

  private

  def ensure_receptionist
    redirect_to root_path, alert: 'Access denied.' unless current_user.receptionist?
  end
end
