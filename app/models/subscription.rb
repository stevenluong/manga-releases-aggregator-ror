class Subscription < ActiveRecord::Base
  attr_accessible :manga_id, :user_id
	def self.get(user,manga)
		Subscription.where(:manga_id=>manga.id,:user_id=>user.id).first
	end
end
