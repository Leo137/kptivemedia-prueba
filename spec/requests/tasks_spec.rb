require "rails_helper"

describe "Task requests" do

	before :each do

		@user = create(:user)
		@tasks = FactoryGirl.create_list(:task, 10, user: @user)
		@query_parameters = {user_email: @user.email, user_token: @user.authentication_token}.to_query

	end

	it "can lists tasks for user" do

		get "/tasks?#{@query_parameters}"

		expect(response).to be_success

		expect(json['tasks'].count).to eq 10

	end

	it "can create new task for user" do

		params = {
			:task => {
				:name => "tarea nueva",
				:resolved => false
			}
		}

		post "/tasks?#{@query_parameters}", params: params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		expect(response).to be_success

		expect(json['task']).not_to be_empty

		expect(json['task']['name']).to eq "tarea nueva"

	end

	it "can update task for user" do

		last_task = @tasks.last

		new_name = last_task.name + "editado"
		new_resolved = !last_task.resolved

		params = {
			:task => {
				:name => new_name,
				:resolved => new_resolved
			}
		}

		puts last_task.resolved

		put "/tasks/#{last_task.id}?#{@query_parameters}", params: params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

		puts response.body

		expect(response).to be_success

		expect(json['task']).not_to be_empty

		expect(json['task']['name']).to eq new_name
		expect(json['task']['resolved']).to be new_resolved

	end


end