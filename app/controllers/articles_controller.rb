class ArticlesController < ApplicationController

	def new 
		@articulo = Article.new
	end

	def create
		#render plain: params[:article].inspect

		#@articulo = Article.new(params[:article])
		@articulo = Article.new(params.require(:article) .permit(:title, :text))
		
		if @articulo.save
			redirect_to @articulo
		else
			render 'new'
		end
	end

	def show 
		@articulo = Article.find(params[:id])
	end

	def index
		@articulos = Article.all
	end

	def edit
		@articulo = Article.find(params[:id])
	end

	def update 
		@articulo = Article.find(params[:id])

		if @articulo.update(params.require(:article) .permit(:title, :text))
			redirect_to @articulo
		else
			render 'edit'
		end
	end

	def destroy
		@articulo = Article.find(params[:id])
		@articulo.destroy

		redirect_to articles_path
	end

end
