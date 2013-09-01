class HomeController < ApplicationController
	before_filter :out, only: [:admin,:log]
	def index
	end
	def about
	end
	def log
    redirect_to "https://slapps.fr/log/manga-releases-aggregator-js"
	end
	def admin
		@users = User.all
	end
end
