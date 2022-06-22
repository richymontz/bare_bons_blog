class CommentsController < ApplicationController
    def create
        @post = Post.find_by(id: params[:post_id])
        
        comment = Comment.new(comment_params)
        comment.post = @post
        
        if comment.save
            redirect_to post_path(@post), notice: "Comment was successfully created."
        else
            render 'posts/show', status: :unprocessable_entity
        end
    end 

    private

    def comment_params
        params.require(:comment).permit(:id, :email, :body)
    end
end
