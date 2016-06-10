require_relative 'contact'
require 'sinatra'

# Temporary fake data so that we always find contact with id 1.
Contact.create('Johnny', 'Bravo', 'johnny@bitmakerlabs.com', 'Rockstar')
Contact.create('Courtney', 'Noonan', 'courtney@bitmakerlabs.com', 'Rockstar')
Contact.create('James', 'Bibby', 'jamie@bitmakerlabs.com', 'Rockstar')
Contact.create('Owen', 'Noonan', 'owen@bitmakerlabs.com', 'Rockstar')

get '/' do
  @crm_app_name = "Bitmaker's CRM"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to ('/contacts')
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  erb :show_contact
end
