class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
        # :validatable
   attachment :profile_image
   has_many :books, dependent: :destroy

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/

   validates :name, presence: true
   validates :email, presence: true, uniqueness: true,
                      format: { with: VALID_EMAIL_REGEX }, on: :create
   validates :password, presence: true, length: { minimum: 6 }, on: :create
   devise :validatable, password_length: 6..128
  # , format: { with: VALID_PASSWORD_REGEX }
end
