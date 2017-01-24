class TasksController < ApplicationController
	before_action :set_task, only: [:show, :update, :destroy]

	 # GET /tasks
	 # GET /tasks.json
	 def index
	 	@tasks = Task.where(user_id: current_user.id)
	 	render json: {tasks: @tasks}
	 end

	 # GET /tasks/1
	 # GET /tasks/1.json
	 def show
	 	render json: {task: @task}
	 end

	 # POST /tasks
	 # POST /tasks.json
	 def create
	 	@task = Task.new(task_params)
	 	@task.user = current_user
	 	if @task.save
	 		render json: {task: @task}
	 	else
	 		head 500
	 	end
	 end

	 # PATCH/PUT /tasks/1
	 # PATCH/PUT /tasks/1.json
	 def update
	 	if @task.update(task_params)
	 		render json: {task: @task}
	 	else
	 		head 500
	 	end
	 end

	 # DELETE /tasks/1
	 # DELETE /tasks/1.json
	 def destroy
	 	@task.destroy
	 	head 200
	 end

	 private
	   # Use callbacks to share common setup or constraints between actions.
	   def set_task
	   	@task = Task.find_by_id(params[:id])
	   	if @task == nil
	   		head 404
	   	end
	end

   	# Never trust parameters from the scary internet, only allow the white list through.
   	def task_params
   		params.fetch(:task, {}).permit(:name, :resolved)
   	end
end
