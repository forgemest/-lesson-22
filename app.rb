require 'rubygems'
require 'sinatra'
# require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do
  @username = params[:username]
  @phone = params[:phone]
  @datetime = params[:datetime]
  @title = "Спасибо за регистрацию #{@username}"
  @message = 'Выберите себе мастера по стрижке'
  @barber = params[:barber]
  f = File.open './public/user.txt', 'a'
  f.write "username: #{@username}, phone: #{@phone}, datetime: #{@datetime}, name_barber: #{@barber}; "
  f.close
  erb :choice
end

get '/contacts' do
  erb :contacts
end

post '/contacts' do
  @email = params[:email]
  @text = params[:text]
  f = File.open './public/user_text.txt', 'a'
  f.write "user email: #{@email}, text: #{@text}; "
  f.close
  erb :contacts_mess
end

get '/admin' do
  erb :admin
end

post '/admin' do
  @login = params[:log]
  @password = params[:pas]

  if @login == 'admin' && @password == '12345'
    @file = File.open("./public/user_text.txt",'r')
    erb :welcom
  elsif @login == 'admin' && @password == 'admin'
    @status = 'Хорошая попытка Хакер'
    erb :admin
  else
    @status = 'Access denied'
    erb :admin
    end
  end