class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
      #protect_from_forgery with: :exception
      #rescue_from CanCan::AccessDenied do |exception|
      #flash[:alert] = "Access denied. You are not authorized to access the requested page."
      #redirect_to root_path

  before_action :authenticate_user!

  before_action :check_permission, unless: :devise_controller?
  

  def check_permission
    if current_user && !current_user.has_role?(controller_name, action_name)
      flash[:alert] = "Access denied. You are not authorized to access the requested page."
      redirect_to root_path
    end
  end
  

end
