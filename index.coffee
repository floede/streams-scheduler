#Load the Simple API Module
api = require 'simple-api'

#Create API Server
v0 = new api
    prefix: ["api", "v0"]
    host: "localhost"
    port: "3333"
    logLevel: 0

TasksController =
	options: {} #This doesn't get used
	
	routes: 
		getAllTasks:
			method: "GET"
			path: []
		getTask:
			method: "GET"
			path: ["*identifier"]
		getCategoryTasks:
			method: "GET"
			path: ["category", "*category"]
		createTask:
			method: "POST"
			path: []
		updateTask:
		    method: "PUT"
		    path: ["*identifier"]
		deleteTask:
		    method: "DELETE"
		    path: ["*identifier"]
		completeTask:
		    method: "PUT"
		    path: ["*identifier", "complete"]

	actions: 
		getAllTasks: (req, res, params) ->
			Tasks = mongoose.model "Tasks"

			Tasks.getAll (err,allTasks) =>
				if err
					console.log err
					@responses.internalError res
				else
					@responses.respond res, allTasks

	helpers: {}