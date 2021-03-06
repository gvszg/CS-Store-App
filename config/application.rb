require File.expand_path('../boot', __FILE__)

require 'rails/all'
# require 'capybara/rails'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StoreApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    Capybara.register_driver :selenium_chrome do |app|
        http_client = Selenium::WebDriver::Remote::Http::Default.new
        http_client.timeout = 300
        Capybara::Selenium::Driver.new(app, :browser => :chrome, :http_client => http_client)
    end
    # Capybara.configure do |config|
    #   config.run_server = false
    #   config.default_driver = :selenium
    #   config.app_host = 'http://map.ezship.com.tw' # change url
    # end
    
  end
end
