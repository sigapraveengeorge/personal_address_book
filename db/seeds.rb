# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Group.destroy_all
Address.destroy_all

#Generate groups dummy data
groups = []
#create new group and get the id and store to groups array
groups << Group.create(name: "Family").id #0
groups << Group.create(name: "Friends").id #1
groups << Group.create(name: "Colleagues").id #2

addresses = []

#generate 20 fake addresses
20.times do |i|
	new_address = {
		id: i,
		name: Faker::Name.name,
		email: Faker::Internet.email,
		company: Faker::Company.name,
		address: "#{Faker::Address.street_name} #{Faker::Address.zip} #{Faker::Address.city}",
		phone: Faker::PhoneNumber.cell_phone,
		group_id: groups[Random.rand(0..2)]
	}
	addresses.push(new_address)
end
#Save the fake data to database
Address.create(addresses)

p "#{Group.count} groups successfully created" 
p "#{Address.count} addresses successfully created"