#INCLUDE CLASSES - Arcade Store
class Initshop
require './store.rb'
require './location.rb'
require './product.rb'
require 'yaml/store'

storedb = YAML::Store.new "store.yaml"
productdb = YAML::Store.new "product.yaml"
locationdb = YAML::Store.new "location.yaml"

#Store Object creation
store = Store.new(1,"JAKE'S ARCADE GAMES AND STUFF", "Your number 1 source for classic video game machines.")

#Location Object creation
location1 = Location.new(1,"The Cabinet Farm","Toroto")
location2 = Location.new(2,"Classic Retro Works","New York")
location3 = Location.new(3,"Gamerama and Phone repair","Calgary")
location4 = Location.new(4,"East Coast Game Center","Boston")
location5 = Location.new(5,"Windy City Midway","Chicago")

#Product creation
prod1 = Product.new(1,"BURGER TIME",250,"Match the hamburgers to save the world.")
prod2 = Product.new(2,"GALAGA",375,"Space Aliens are coming for you.")
prod3 = Product.new(3,"PAPER BOY",425,"Deliver all of the newspapers")
prod4 = Product.new(4,"DIG DUG",300,"The classic digging classic.")
prod5 = Product.new(5,"DONKEY KONG",750,"Can you reach the top?")
prod6 = Product.new(6,"NINTENDO ICE HOCKEY",500,"Intense on ice action.")
prod7 = Product.new(7,"SONIC THE HEDGEHOG",408,"Gotta go fast.")
prod8 = Product.new(8,"HALO",150,"Finish the fight.")
prod9 = Product.new(9,"FORZA MOTORSPORT",340,"Fast racing action.")
prod10 = Product.new(10,"MASS EFFECT 3",800,"Epic space adventure.")

store.add_location(location1.id)
store.add_location(location2.id)
store.add_location(location3.id)
store.add_location(location4.id)

location1.add_product(1,8)
location1.add_product(2,10)
location1.add_product(10,6)
location2.add_product(2,7)
location2.add_product(3,12)
location2.add_product(4,20)
location3.add_product(5,2)
location3.add_product(6,3)
location4.add_product(7,20)
location4.add_product(8,13)
location4.add_product(9,12)

#STORE DB WRITE
storedb.transaction do
  storedb["#{store.id}"] = store
end

#LOCATION DB WRITE
locationdb.transaction do
  locationdb["#{location1.id}"] = location1
  locationdb["#{location2.id}"] = location2
  locationdb["#{location3.id}"] = location3
  locationdb["#{location4.id}"] = location4
end

#PRODUCT DB WRITE
productdb.transaction do
  productdb["#{prod1.id}"] = prod1
  productdb["#{prod2.id}"] = prod2
  productdb["#{prod3.id}"] = prod3
  productdb["#{prod4.id}"] = prod4
  productdb["#{prod5.id}"] = prod5
  productdb["#{prod6.id}"] = prod6
  productdb["#{prod7.id}"] = prod7
  productdb["#{prod8.id}"] = prod8
  productdb["#{prod9.id}"] = prod9
  productdb["#{prod10.id}"] = prod10

end

end #Init shop
