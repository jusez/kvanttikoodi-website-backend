class ContactsMailer < ApplicationMailer
  default to: 'info@kvanttikoodi.fi'

  def notify(params)
    mail subject: 'Yhteydenottopyyntö kotisivuilta',
     body: "Nimi: #{params[:name]}\nPuh: #{params[:phone]}\nEmail: #{params[:email]}\nViesti:\n\n#{params[:message]}"
  end
end