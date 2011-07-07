require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => "CounterMeasures User",
                 :email => "user@countermeasures.com",
                 :password => "tester",
                 :password_confirmation => "tester")
    
    admin = User.create!(:name => "admin user",
                         :email => "admin@countermeasures.com",
                         :password => "smelly",
                         :password_confirmation => "smelly")
    admin.toggle!(:admin)

    99.times do |n|
      name = Faker::Name.name
      email = "test-#{n+1}@countermeasures.com"
      password = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)

    end
  end
end
