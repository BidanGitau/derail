class CategoriesController < ApplicationController
  before_action :require_admin,except: [:index,:show]
    def index
    @categories=Category.all
    end

     def new
       @category=Category.new
     end

    def create
      @category=Category.new(category_params)
      if @category.save
        flash[:notice]="hurrah"
        redirect_to @category
      else
        render "new"
      end
    end

    def show
      @category=Category.find(params[:id])  
      @categories_article=@category.articles
    end
    def edit
      @category=Category.find(params[:id])  
    end
    def update
      @category=Category.find(params[:id])
        if @category.update(category_params)
          flash[:success] = "Object was successfully updated"
          redirect_to @category
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
    private
    def category_params
        params.require(:category).permit(:name)
    end
    def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert]="olny admn can do that"
      redirect_to categories_path
    end
    end
end