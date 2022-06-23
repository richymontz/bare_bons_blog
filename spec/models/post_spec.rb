require 'rails_helper'

RSpec.describe Post, type: :model do
  context "When post calls save" do
    it "should be created" do
      post = create(:post)
      expect(Post.first).to eq(post.reload)
    end
  end
end
