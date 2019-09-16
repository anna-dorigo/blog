class CommentsController < ApplicationController

	def create 
		@articulo = Article.find(params[:article_id])
		@comment = @articulo.comments.create(comment_params)
		redirect_to article_path(@articulo)
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
	
end
