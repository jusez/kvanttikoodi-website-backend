class ContactsController < ApplicationController
  include Recaptchable

  before_action :recaptcha, only: [:contact_us]

  def contact_us
    if ContactsMailer.notify(permitted_params).deliver
      render json: nil, status: :created
    else
      render json: nil, status: :not_found     
    end
  end

  protected

  def permitted_params
    params.permit(:name, :phone, :email, :message)
  end
end