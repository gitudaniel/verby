class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user|
      	user.permit(:name,:date_of_birth, :is_female, :penname, :email, :password) 
      end
	  devise_parameter_sanitizer.permit(:account_update) do |user| 
	    user.permit(:name, :penname, :email, :password, :current_password, :is_female, :date_of_birth) 
	  end
    end
end
