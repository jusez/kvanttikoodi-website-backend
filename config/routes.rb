Rails.application.routes.draw do
  post "contact", to: "contacts#contact_us"
end
