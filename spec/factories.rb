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
