class ApplicationController < ActionController::Base
	
	before_action :configure_permitted_parameters, if: :devise_controller?
	#サインインした後の画面
	def after_sign_in_path_for(resource)
		user_path(current_user.id)
	end
	def after_sign_out_path_for(resource)
	    root_path # ログアウト後に遷移するpathを設定
    end
    def after_sign_up_path_for(resource)
    	flash[:notice] = "successfully"
    	user_path(current_user.id)
    end
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
	end
end
