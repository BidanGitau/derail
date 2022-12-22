class UsersController <ApplicationController
  before_action :set_user ,only: [:edit, :update, :show]
    def index
        @users = User.all
    end
    
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
          session[:user_id]=@user.id
            flash[:notice]="wabe wabe welcome mzazi #{@user.username}"
            redirect_to @user
                 
             else
                flash[:notice]="kuwa serious mzazi"
                render 'new'
             end
        
    end
  def edit
    
  end
  def update
    
      if @user.update(user_params)
        flash[:success] = "Object was successfully updated"
        redirect_to users_path
      else
        flash[:error] = "Something went wrong"
        redirect_to articles_path
      end
  end
  
  


    
    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username,:email,:password)        
    end
end