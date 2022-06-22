class Post < ApplicationRecord
    has_many :comments, dependent: :destroy

    validates :title, presence: true, length: { minimum: 5 }
    validates :body, presence: true

    scope :ascending, ->() { order(:created_at) }
end