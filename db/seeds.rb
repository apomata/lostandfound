# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.create(title: "thing 1", description: "red")

Category.create(title: "thing 2", description: "blue")

owners = ["Alice", "Bob", "Carl", "Dave"]
titles = ["horton hears a who", "green eggs and ham", "the cat in the hat", "the lorax"]
descriptions = ["1 fish", "2 fish", "red fish", "blue fish"]
categories = Category.all.map{|c| c.id}

20.times do 
	Item.create(title: titles.sample, description: descriptions.sample, category: categories.sample, owner: owners.sample)
end



