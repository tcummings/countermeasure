# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                   "theocummings"
  user.email                  "theocummings@countermeasure.com"
  user.password               "bizbar"
  user.password_confirmation  "bizbar"
end
