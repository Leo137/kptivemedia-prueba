pwd = Faker::Internet.password

FactoryGirl.define do
	factory :user do

		sequence(:email) { Faker::Internet.email }
		password pwd
		password_confirmation pwd

	end
end