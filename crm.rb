require_relative 'contact'
require 'sinatra'

get '/' do
  @crm_app_name = "Bitmaker's CRM"
  erb :index
end

get '/contacts' do
  Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'CEO')
  Contact.create('Sergey', 'Brin', 'sergey@google.com', 'Co-Founder')
  Contact.create('Steve', 'Jobs', 'steve@apple.com', 'Visionary')

  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end
