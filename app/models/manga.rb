class Manga < ActiveRecord::Base
  attr_accessible :display_name, :name
	has_many :chapters
	def last_chapter
		chapters.max_by{|c| c.nb ||= 0} 
	end
	def as_json(options = { })
    super((options || { }).merge({
        :methods => [:last_chapter_nb]
    }))
	end
	def last_chapter_nb
		chapters.map{|chapter| chapter.nb ||= 0}.max
	end

end
