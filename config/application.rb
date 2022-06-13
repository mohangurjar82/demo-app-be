require_relative "boot"

require 'rails/all' 

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DemoApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.

    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*',
                 headers: :any,
                 expose: %w[access-token expired token-type uid client],
                 methods: %i[get post options delete put patch]
      end
    end

    config.action_mailer.default_url_options = { host: 'localhost', port:3001 }
    config.action_mailer.perform_deliveries = true

    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
      address:              'smtp.gmail.com',
      port:                   587,
      domain:               'gmail.com',
      user_name:            'username',
      password:             'password',
      authentication:       :plain,
      enable_starttls_auto: true
    }

    config.api_only = true
  end
end
