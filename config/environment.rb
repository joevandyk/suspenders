PROJECT_NAME = "CHANGEME"

throw "The project's name in environment.rb is blank" if PROJECT_NAME.empty?
throw "Project name (#{PROJECT_NAME}) must_be_like_this" unless PROJECT_NAME =~ /^[a-z_]*$/

RAILS_GEM_VERSION = '2.1.1' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'mislav-will_paginate', 
             :lib => 'will_paginate', 
             :source => 'http://gems.github.com', 
             :version => '~> 2.3.7'
  
  config.load_paths += Dir.glob(File.join(RAILS_ROOT, 'vendor', 'gems', '*', 'lib'))

  config.time_zone = 'UTC'

  SESSION_KEY = "CHANGESESSION" 
  config.action_controller.session = {
    :session_key => "_#{PROJECT_NAME}_session",
    :secret      => SESSION_KEY
  }

  config.active_record.schema_format = :sql
end

