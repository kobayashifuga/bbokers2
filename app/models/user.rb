class User < ApplicationRecord
	attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:username]

  has_many :books, dependent: :destroy

  attachment :profile_image



  validates :username,
  	uniqueness: true,
  	length: { minimum: 2, maximum: 20 }

  validates :comment, {length: {maximum: 50}}
  
def email_required?
   false
end
 def email_changed?
   false
 end
end
