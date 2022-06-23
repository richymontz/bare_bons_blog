require 'rails_helper'

RSpec.describe "Landing", type: :request do
    describe "GET /index" do
        before do
            @posts = create_list(:post, 3)
            get root_path
        end
      
        it "returns http success" do
            expect(response).to have_http_status(:success)
        end
    
        it "loads the page content" do
            expect(response.body).to match "BARE-BONE Blog"
        end
    
        it "lists the created posts in the page" do
            expect(response.body).to match @posts.first.title 
        end
    end
end