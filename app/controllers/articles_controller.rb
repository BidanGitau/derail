class ArticlesController < ApplicationController
    def index
        @articles=Article.all
    end

    def new
        @article=Article.new
    end

      def create
        @article=Article.new(
        params.require(:article).permit(:title,:description)
        )
        if @article.save
         flash[:notice]="wabe wabe"
        redirect_to article_path(@article)
             
         else
            render 'new'
         end
      end
    
    def show
        # making it an instance variable avaailable to the views
        @article=Article.find(
        params[:id]
        )
       
    end
    
    def edit
        @article=Article.find(params[:id])
    end

    def update
        @article=Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title,:description))
            flash[:notice]="updated successfully"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
end