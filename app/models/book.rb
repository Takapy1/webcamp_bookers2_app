class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, on: [:create, :update]
  validates :body, presence: true, on: [:create, :update]

end
