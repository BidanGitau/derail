class ArticlesController < ApplicationController
    before_action :set_article , only:[:show,:edit,:update,:destroy]
    before_action :require_user ,except:[:index,:show]
    before_action :require_same_user ,only:[:edit,:update,:destroy]
     #provides to the above actions the method set_article
     
    def index
        @articles = Article.paginate(:page => params[:page])
    end

    def new
        @article=Article.new
    end

      def create
        @article=Article.new(article_params)
        
        @article.user=current_user
        if @article.save
        flash[:notice]="wabe wabe"
        redirect_to article_path(@article)
             
         else
            render 'new'
         end
      end
    
    def show
        # making it an instance variable avaailable to the views
       
       
    end
    
    def edit
        
    end

    def update
        
        if @article.update(article_params)
            flash[:notice]="updated successfully"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    
     def destroy
       
        @article.destroy
    
        redirect_to articles_path, status: :see_other
       end

     private
     def set_article
        @article=Article.find(params[:id])
        
     end

     def article_params
        params.require(:article).permit(:title,:description)
     end
     def require_same_user
        if current_user != @article.user && !current_user.admin?
            flash[:alert]="can only edit delete own articles" 
            redirect_to @article
        end
        
     end
end