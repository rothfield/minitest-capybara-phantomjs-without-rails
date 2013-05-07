require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'spec_helper.rb'
require 'launchy'

Capybara.register_driver :poltergeist do |app|
		options = {:timeout => 120,
						 :phantomjs_options => ['--load-images=no','--ignore-ssl-errors=yes']}
		Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.javascript_driver = :poltergeist
Capybara.default_driver = :poltergeist
Capybara.app_host = "http://www.google.com"

describe "Searching Google", :js => true do
		it "returns relevant results" do
				visit ""
				fill_in('q', :with => "maple leaf rag")
				find_button('Google Search').click
				page.should have_content("Scott Joplin")
				if false
						puts `lynx -dump x.html`
				end
				if false
						puts page.find('body').text
				end
				# save_and_open_page doesn't seem to work.
				if false
						save_page("x.html")
						Launchy.open("./x.html")
				end
		end
end
