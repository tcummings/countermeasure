# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                   "theocummings"
  user.email                  "theocummings@countermeasures.com"
  user.password               "bizbar"
  user.password_confirmation  "bizbar"
end

Factory.sequence :email do |n|
  "person-#{n}@countermeasures.com"
end

Factory.sequence :name do |n|
  "person #{n}"
end

Factory.define :bicycle do |bicycle|
  bicycle.avatar          "small_bike.jpg"
  bicycle.serial_number   "123-456-7890"
  bicycle.color           "black"
  bicycle.make            "Cannondale"
  bicycle.model           "Capo"
  bicycle.association     :user
end
