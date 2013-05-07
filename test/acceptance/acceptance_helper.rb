require 'capybara/dsl'
require 'capybara_minitest_spec'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
#require 'spec_helper.rb'
require 'launchy'

Capybara.register_driver :poltergeist do |app|
		options = {:timeout => 120,
						 :phantomjs_options => ['--load-images=no','--ignore-ssl-errors=yes']}
		Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.javascript_driver = :poltergeist
Capybara.default_driver = :poltergeist
Capybara.app_host = "http://www.google.com"


