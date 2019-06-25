class ArticlesController<ApplicationController

    def create
        @article=Article.new
        @article.name=params[:name]
        @article.description=params[:description]
        if (@article.save)
            render json: {message: 'Created successfully'}
        else
            render json: {message: 'Not Created'}
        end
    end

    def index
        @articles=Article.all
        render json: {articles: @articles}    
    end

    def update
        byebug
        @article=Article.find(params[:id].to_i)
        @article.name=params[:name]
        @article.description=params[:description]
        if (@article.update(article_params))
            render json: {message: 'Updated successfully'}
        else
            render json: {message: 'Not Updated'}
        end
        
    end

    def destroy
        @article=Article.find(params[:id].to_i)
        if (@article.destroy)
            render json: {message: 'Deleted successfully'}
        else
            render json: {message: 'Not Deleted'}
        end

    end

    private

    def article_params
        params.require(:article).permit(:name,:description)
    end

end