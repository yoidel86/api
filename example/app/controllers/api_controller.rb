class ApiController < ApplicationController
  require "google/cloud/datastore"
   def index
       datastore = Google::Cloud::Datastore.new(
        project: "financial-10",
        keyfile: File.join(Rails.root, 'config', 'jsonkey.json')
      )
      query = datastore.query("HistoricE")
      tasks = datastore.run query
      render json: {status: 'SUCCESS', message: 'Loaded all posts', data: tasks}, status: :ok
    end 
  
  def emitter
       datastore = Google::Cloud::Datastore.new(
        project: "financial-10",
        keyfile: File.join(Rails.root, 'config', 'jsonkey.json')
      )
      query = datastore.query("HistoricE").where("Emisora", "=",params[:name])
      tasks = datastore.run query
      render json: {status: 'SUCCESS', message: 'Loaded all posts', data: tasks}, status: :ok
   end 
   def operaciones
       datastore = Google::Cloud::Datastore.new(
        project: "financial-10",
        keyfile: File.join(Rails.root, 'config', 'jsonkey.json')
      )
      query = datastore.query("HistoricP").where("Emisora", "=",params[:name])
      tasks = datastore.run query
      render json: {status: 'falsee', message: 'Loaded all posts', data: tasks}, status: :ok
   end 
end