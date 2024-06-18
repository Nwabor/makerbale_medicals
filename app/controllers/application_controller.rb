class ApplicationController < ActionController::Base
  before_action :redirect_if_authenticated

  private

  def redirect_if_authenticated
    if user_signed_in?
      redirect_to after_sign_in_path_for(current_user)
    end
  end
end
