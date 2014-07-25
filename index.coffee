#Load the Simple API Module
api = require 'simple-api'

#Create API Server
v0 = new api
    prefix: ["api", "v0"]
    host: "localhost"
    port: "3333"
    logLevel: 0