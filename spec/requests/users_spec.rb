require "rails_helper"

describe "User requests" do

	it "can create user via API" do

		params = {
			:user => {
				:email => "mail@mail.cl",
				:password => "password",
				:password_confirmation => "password"
			}
		}

		post "/users", params: params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		expect(response).to be_success

		expect(json['email']).to eq "mail@mail.cl"

		expect(json['authentication_token']).not_to be_empty

	end

end