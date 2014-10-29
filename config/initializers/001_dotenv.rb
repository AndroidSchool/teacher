# Be sure to restart your server when you modify this file.
puts "Initializing Dotenv"
dotenv_root = "/home/#{Etc.getlogin}/dotenv"
if Rails.env.production?
  dotenv_root = "/home/deployagent/dotenv"
end

Dotenv.load!("#{dotenv_root}/#{Rails.application.class.parent_name}/common.env");
Dotenv.load!("#{dotenv_root}/#{Rails.application.class.parent_name}/#{Rails.env}.env");
