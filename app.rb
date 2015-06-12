require('sinatra')
require('sinatra/reloader')
require('./lib/artwork')
require('./lib/museum')
also_reload('/lib/**/*.rb')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'museum'})
