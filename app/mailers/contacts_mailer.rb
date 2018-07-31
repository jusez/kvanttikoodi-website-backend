class ContactsMailer < ApplicationMailer
  default to: 'info@kvanttikoodi.fi'

  def notify(params)
    mail subject: 'Yhteydenottopyyntö kotisivuilta',
     body: "Nimi: #{params[:name]}\n Puh: #{params[:phone]}\n Email: #{params[:email]}\n Viesti:\n\n #{params[:message]}"
  end
end