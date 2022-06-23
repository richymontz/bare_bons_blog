require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /new" do
    before do
      get new_post_path
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "loads the page content" do
      expect(response.body).to match "<h1>New Post</h1>"
    end
  end

  describe "POST /create" do
    context "when post params are correct" do
      before do
        @post_attributes = attributes_for(:post)
        post posts_path, params: { post: @post_attributes }
      end
  
      it "should redirect to admin index path" do
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(admin_index_path)
      end
  
      it "should create the post" do
        title = @post_attributes[:title]
        post = Post.find_by(title: title)
        
        expect(post.title).to eq(title) 
      end
    end

    context "when post params are not correct" do
      before do
        @post_attributes = { title: 'bad', body: nil }
        post posts_path, params: { post: @post_attributes }
      end

      it "should response with unprocessable_entity" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /edit" do
    before do
      post = create(:post)
      get edit_post_path(post)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "loads the page content" do
      expect(response.body).to match "<h1>Edit Post</h1>"
    end
  end

  describe "PUT /update" do
    context "when title is requested to update" do
      before do
        @post = create(:post)
        @post_title = @post.title
        put "/posts/#{@post.id}", params: { post: {title: 'New updated title'} }
        @post.reload
      end
  
      it "should redirect to admin index path" do
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(admin_index_path)
      end
  
      it "should change the title" do
        expect(@post.title).to_not eq(@post_title) 
      end
    end

    context "when post title is not correct" do
      before do
        post = create(:post)
        put "/posts/#{post.id}", params: { post: {title: '...', body: nil} }
      end

      it "should response with unprocessable_entity" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /destroy" do
    before do
      post = create(:post)
      delete "/posts/#{post.id}"
    end

    it "should redirect to admin index path" do
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(admin_index_path)
    end
  end
end
