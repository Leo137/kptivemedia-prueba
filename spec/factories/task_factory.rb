FactoryGirl.define do
	factory :task do

		sequence(:name) { Faker::Lorem.word }
		sequence(:resolved) { Faker::Boolean.boolean }
		user

	end
end