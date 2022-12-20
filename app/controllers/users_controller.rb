class UsersController <ApplicationController
    def show
        @user = User.find(params[:id])
        @articles=@user.articles
    end
    
    def new
        @user=User.new
    end
    def create
       @user=User.new(user_params) 
        if @user.save
            flash[:notice]="wabe wabe welcome mzazi #{@user.username}"
            redirect_to articles_path
                 
             else
                flash[:notice]="kuwa serious mzazi"
                render 'new'
             end
        
    end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "Object was successfully updated"
        redirect_to users_path
      else
        flash[:error] = "Something went wrong"
        redirect_to articles_path
      end
  end
  
  


    private
    def user_params
        params.require(:user).permit(:username,:email,:password)        
    end
end