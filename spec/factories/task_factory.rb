FactoryGirl.define do
	factory :task do

		sequence(:name) { Faker::Lorem.word }
		sequence(:resolved) { Faker::Boolean.boolean }
		sequence(:status) { Faker::Lorem.word }
		user

	end
end