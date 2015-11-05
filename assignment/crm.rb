require_relative 'contact'
require 'sinatra'

Contact.create("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar")


get '/' do
  @crm_app_name = "my CRM"
  erb :index
end

get "/contacts" do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

get "/contacts/1000" do
  @contact = Contact.find(1000)
  erb :show_contact
end

post '/contacts' do
	Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
	redirect to('/contacts')
end

