# spec/factories/users.rb

FactoryBot.define do
    factory :user do
      email { "test@example.com" }
      password { "password" }
    end
  end
  
  # spec/factories/projects.rb
  FactoryBot.define do
    factory :project do
      name { "Test Project" }
      description { "This is a test project." }
      status { "active" }
    end
  end
  