require('sinatra')
require('sinatra/reloader')
require('./lib/artwork')
require('./lib/museum')
also_reload('/lib/**/*.rb')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'museum'})


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
