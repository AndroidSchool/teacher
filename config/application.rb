require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Teacher
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
    
    dotenv_root = "/home/#{Etc.getlogin}/dotenv"
    if Rails.env.production?
      dotenv_root = "/home/deployagent/dotenv"
    end
    puts "Loading .env from #{dotenv_root}/#{Rails.application.class.parent_name}/common.env"
    Dotenv.load!("#{dotenv_root}/#{Rails.application.class.parent_name}/common.env");
    puts "Loading .env from #{dotenv_root}/#{Rails.application.class.parent_name}/#{Rails.env}.env";
    Dotenv.load!("#{dotenv_root}/#{Rails.application.class.parent_name}/#{Rails.env}.env");

  end
end
