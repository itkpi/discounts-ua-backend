# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.4.2'

gem 'dotenv'
gem 'puma'
gem 'rake'
gem 'sidekiq'
gem 'sinatra'
gem 'sinatra-contrib'

gem 'active_model_serializers', '~> 0.10.0'
gem 'activerecord'
gem 'pg', '~> 0.21'
gem 'sinatra-activerecord'

gem 'capybara'
gem 'capybara-selenium'
gem 'nokogiri'

gem 'bugsnag'
gem 'snitcher'

gem 'raddocs'
gem 'rspec_api_documentation'

group :test do
  gem 'database_cleaner'
  gem 'fabrication', '~> 2.16.2'
  gem 'faker'
  gem 'json_spec'
  gem 'rspec'
  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'byebug'
  gem 'hirb', require: true
  gem 'memory_profiler'

  gem 'reek', require: false
  gem 'rubocop', require: false
end
