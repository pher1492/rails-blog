class ArticlesController < ApplicationController

	http_basic_authenticate_with name: "pher", password: "secret" 

	def show
		@article = Article.find(params[:id])
	end

	def index
		@article = Article.all 
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		##@article = Article.new(params.require([:article]).permit(:title, :text))
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'update'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to :back
	end

	private 
		def article_params
			params.require(:article).permit(:title, :text)

		end
	
end
