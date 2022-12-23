class ApplicationController < ActionController::Base
    helper_method :current_user ,:logged_in? ,:require_user
    def current_user 
        @current_user ||=User.find(session[:user_id]) if session[:user_id]
      end

    def logged_in?
        !!current_user
        #turning the above function into a boolean
    end
    def require_user
        if !logged_in?
            flash[:alert]="you must be logged in"
            redirect_to login_path
    end
end
end
