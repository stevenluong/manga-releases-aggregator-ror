class Manga < ActiveRecord::Base
  attr_accessible :display_name, :name
	has_many :chapters
	def last_chapter
		chapters.max_by{|c| c.nb}
	end
end
