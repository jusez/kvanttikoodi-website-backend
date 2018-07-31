require_relative 'boot'

require "rails"
# Pick the frameworks you want:
#require "active_model/railtie"
#require "active_job/railtie"
#require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
#require "action_view/railtie"
#require "action_cable/engine"
# require "sprockets/railtie"
#require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KvanttikoodiBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.autoload_paths << "#{Rails.root}/lib"
    config.eager_load_paths << "#{Rails.root}/lib"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.action_mailer.smtp_settings = {
      :address => "email-smtp.eu-west-1.amazonaws.com",
      :port => 587,
      :user_name => ENV["SES_SMTP_USERNAME"], #Your SMTP user
      :password => ENV["SES_SMTP_PASSWORD"], #Your SMTP password
      :authentication => :login,
      :enable_starttls_auto => true
    }
  end
end
