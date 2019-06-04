class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # private same class scope
  # vs.
  # same project scope
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end

    # def user_params
    #   params.require(:user).permit(:email, :encryted_password, :first_name, :last_name)
    # end
end
