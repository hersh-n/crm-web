require_relative 'contact'
require 'sinatra'

get '/' do
  @crm_app_name = "my CRM"
  erb :index
end

get "/contacts" do
	@contacts = Contact.all
 	erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

get "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get "/contacts/:id/edit" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

delete "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.remove
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

post "/contacts/search" do
	@contacts = Contact.search_by_attribute("first_name", params[:first_name])
	erb :contacts
end


put "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

post '/contacts' do
	Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
	redirect to('/contacts')
end





