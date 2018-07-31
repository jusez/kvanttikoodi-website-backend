class GoogleRecaptchaClient
  require 'net/http'

  RECAPTCHA_VERIFY_URL = "https://www.google.com/recaptcha/api/siteverify".freeze

  def initialize
    uri = URI(RECAPTCHA_VERIFY_URL)
    @client = Net::HTTP.new(uri.host, uri.port)
    @client.use_ssl = true
    @request = Net::HTTP::Post.new(uri.path, {})
  end

  def verify_recaptcha(params)
    response = perform_verify_request(params)
    success?(response)
  end

  def success?(response)
    JSON.parse(response.body)["success"]
  end

  private

  attr_reader :client, :request

  def perform_verify_request(params)
    @request.body = URI.encode_www_form(params.merge({secret: ENV["RECAPTCHA_SECRET_KEY"]}))
    @client.request(@request)
  end
end  