class Comment < ApplicationRecord
  belongs_to :post

  validates :email, 
            presence: true, 
            format: { 
              with: /\w+@\w+\.{1}[a-zA-Z]{2,}/, 
              message: 'Please enter correct email format' 
            }
                  
  validates :body, presence: true
end