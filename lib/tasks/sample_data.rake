require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_bicycles
  end
end

def make_users
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

def make_bicycles
  User.all(:limit => 6).each do |user|
    2.times do
      user.bicycles.create!(:serial_number => "123-456-789",
                            :make          => "Moots",
                            :model         => "RSL",
                            :color         => "Nude",
                            :avatar        => "small_bike.jpg")
    end
  end
end
