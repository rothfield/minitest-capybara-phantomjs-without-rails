require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'

require 'capybara/dsl'
require 'capybara_minitest_spec'
require 'capybara/poltergeist'
require 'launchy'
require 'turn/autorun'
Turn.config do |c|
	#	c.format = :outline
		c.format = :pretty
		c.natural = true
		# use one of output formats:
		#  # :outline  - turn's original case/test outline mode [default]
		#   # :progress - indicates progress with progress bar
		#    # :dotted   - test/unit's traditional dot-progress mode
		#     # :pretty   - new pretty reporter
		#      # :marshal  - dump output as YAML (normal run mode only)
		#       # :cue      - interactive testing
		#        c.format  = :outline
		#         # turn on invoke/execute tracing, enable full backtrace
		#          c.trace   = true
		#           # use humanized test names (works only with :outline format)
		#            c.natural = true
end
Capybara.register_driver :poltergeist do |app|
		options = {:timeout => 120,
						 :phantomjs_options => ['--load-images=no','--ignore-ssl-errors=yes']}
		Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.javascript_driver = :poltergeist
Capybara.default_driver = :poltergeist
Capybara.app_host = "http://www.google.com"

describe Array do
		it "can be created with no arguments" do
				Array.new.must_be_instance_of String #Array
		end

		it "can be created with a specific size" do
				Array.new(10).size.must_equal 10
		end
end

describe "Searching Google" do
		include Capybara::DSL
		it "returns relevant results" do
				visit ""
				fill_in('q', :with => "maple leaf rag")
				find_button('Google Search').click
				page.must_have_content("Scott Joplin")
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

