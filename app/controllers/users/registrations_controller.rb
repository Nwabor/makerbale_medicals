class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :middle_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :middle_name, :gender, :phone, :date_of_birth, :address, :profile_pic])
  end
end
