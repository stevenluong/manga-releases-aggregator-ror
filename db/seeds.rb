# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
manga1 = Manga.create(:name=>"naruto",:display_name=>"Naruto")
manga2 = Manga.create(:name=>"towerofgod",:display_name=>"Tower of God")
chapter1 = manga1.chapters.create(:nb=>"200",:link=>"#",:date=>DateTime.yesterday);
chapter2 = manga2.chapters.create(:nb=>"300",:link=>"#",:date=>DateTime.now);

