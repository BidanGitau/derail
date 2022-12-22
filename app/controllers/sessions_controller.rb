class SessionsController < ApplicationController
    def new
       
    end
    def create
        user=User.find_by(email: params[:sessions][:email].downcase)
        if user && user.authenticate(params[:sessions][:password])
            session[:user_id]=user.id
            redirect_to users_path
        else
            flash.now[:alert]="There were some wrong details entered"
            render 'new'
        end
    end
    
    def destroy
        session[:user_id]=nil
        flash[:notice]="Logged out"
        redirect_to root_path
    end
   
end