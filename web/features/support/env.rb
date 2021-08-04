require "capybara/cucumber"
require "selenium-webdriver"
require "site_prism"
require "pry-byebug"
require "dotenv"
require "httparty"
require "httparty/request"
require "httparty/response/headers"
require "rspec/expectations"

if ENV["ENV"]
  puts "Iniciando o teste no ambiente"
  Dotenv.load("environment/.env." + ENV["ENV"], ".env")
else
  Dotenv.load(".env")
end

Capybara.register_driver :chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  [
    "headless",
    "--enable-javascript",
    "no-sandbox",
    "window-size=1440x900",
    "disable-gpu",
    "--disable-dev-shm-usage",

  ].each { |arg| options.add_argument(arg) }

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.configure do |config|
  config.default_driver = (ENV["DRIVER"] || "selenium_chrome").to_sym
  config.app_host = ENV["url_padrao"]
  config.default_max_wait_time = 10
end
