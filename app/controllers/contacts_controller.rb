class ContactsController < ApplicationController
  include Recaptchable

  before_action :recaptcha, only: [:contact_us]

  def contact_us
    render json: nil, status: :created
  end

  protected

  def permitted_params
    params.permit(:name, :phone, :email, :message)
  end
end