require 'sinatra'
require 'pony'
get '/index' do
  erb :index
end

get '/informacion' do
	erb :informacion
end

get '/soluciones' do
	erb :soluciones
end

get '/gestion' do
	erb :gestion
end

get '/contacto' do
	erb :contacto
end

put '/contactar' do
	message = "Hola, nos acaba de contactar " + params[:name] + " con el siguiente mensaje: \n" + params[:message] 
						+ "\n El correo de " + params[:name] + "es: " + params[:email]
	issue = "Nos contactaron por: " + params[:issue]
	p message
	p issue
	p ""
	p ""
	p ""
	p ""
	p ""
	p ""
	p ""
	p ""
	p ""

  Pony.options = {   
                   :from           => 'felipe.fvaldivia@gmail.com',
                   :via            => :smtp,
                   :via_options    => {
                     :address        => 'smtp.gmail.com',
                     :port           => '587',
                     :user_name      => 'acso.contacting@gmail.com',
                     :password       => 'mamita1255',
                     :authentication => :plain, 
                     :domain         => "localhost.localdomain"
                    }
                 } 

	Pony.mail(subject: issue, to: "marcosacoria@gmail.com", html_body: message)

	redirect '/contacto'
end