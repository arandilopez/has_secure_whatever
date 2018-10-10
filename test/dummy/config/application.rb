require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
require "has_secure_whatever"

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

HasSecureWhatever.configure do |config|
  config.secret_key = "8BwOVyaASwUuqMhEWzD17aWV1pdKAvKBOoCi0p5S7zY=" # can be placed in a ENV or credentials
end
