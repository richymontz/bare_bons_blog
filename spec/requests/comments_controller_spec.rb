require 'rails_helper'

RSpec.describe CommentsController, type: :request do
  describe "POST /create" do
    context "when is requested wuth correct params" do
      before do
        @comment_attributes = attributes_for(:comment)
        @post = create(:post)
        post comments_path, params: { post_id: @post.id, comment: @comment_attributes }
      end

      it "should redirect to post page" do
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(post_path(@post))
      end
      

      it "should create a new comment for a post" do
        created_comment = Comment.first
        expect(created_comment.email).to eq(@comment_attributes[:email])  
        expect(created_comment.body).to eq(@comment_attributes[:body])  
      end
    end
  end
end
