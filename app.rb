require('sinatra')
require('sinatra/reloader')
require('./lib/artwork')
require('./lib/museum')
also_reload('/lib/**/*.rb')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'museum_tracker'})


get('/') do
  @museums = Museum.all
  erb(:index)
end

post('/') do
  name = params.fetch('name')
  museum = Museum.new({:name => name, :id => nil})
  museum.save
  redirect back
end

get('/museums/:id') do
  @museum = Museum.find(params.fetch('id').to_i)
  @museums = Museum.all
  erb(:museum)
end

post('/museums/:id') do
	museum_id = params.fetch('museum_id').to_i
	artwork = params.fetch('description')
	artwork = Artwork.new({:description => description, :museum_id => museum_id})
	artwork.save
	@museum = Museum.find(museum_id)
	redirect back
end

get('/museums/:id/edit') do
	@museum = Museum.find(params.fetch('id').to_i)
	@museums = Museums.all
	erb(:list)
end

patch('/lists/:id') do
	name = params.fetch('name')
	@museum = Museum.find(params.fetch('id').to_i)
	@museum.update({:name => name})
	@museums = Museum.all
	erb(:museum)
end

delete('/') do
	@museum = Museum.find(params.fetch('id').to_i)
	@museum.delete
	@museums = Museum.all
	erb(:index)
end