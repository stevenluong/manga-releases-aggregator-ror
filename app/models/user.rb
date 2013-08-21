class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
				 :validatable, :token_authenticatable#, :confirmable
	before_save :ensure_authentication_token

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
	has_many :subscriptions
	has_many :mangas, through: :subscriptions

	def has_subscribe(manga)
		Subscription.exists?(:manga_id=>manga.id,:user_id=>id)
	end
end
