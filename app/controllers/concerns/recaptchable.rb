require 'active_support/concern'

module Recaptchable
  extend ActiveSupport::Concern

  def recaptcha
    failed_recaptcha_response && return unless RecaptchaVerifier.verify(recaptcha_params, request.ip)
  end

  protected
    def failed_recaptcha_response
      render json: "Failed reCaptcha response", status: :unauthorized
    end

    def recaptcha_params
      params[:"g-recaptcha-response"]
    end
end 