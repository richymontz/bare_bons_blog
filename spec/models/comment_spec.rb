require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "with 2 or more comments" do
    it "comments should belongs to post" do
      post = create(:post)
      comment1 = create(:comment, post: post)
      comment2 = create(:comment, post: post)
      expect(post.id).to eq(comment1.post_id)
      expect(post.id).to eq(comment2.post_id)
    end
  end
end
