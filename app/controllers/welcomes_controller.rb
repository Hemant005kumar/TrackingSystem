class WelcomesController < ApplicationController
	
	skip_before_action :authenticate_user!, :check_permission

end
