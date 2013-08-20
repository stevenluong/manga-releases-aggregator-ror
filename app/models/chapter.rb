class Chapter < ActiveRecord::Base
  attr_accessible :date, :link, :manga_id, :nb
	belongs_to :manga
end
