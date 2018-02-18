# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.4.2'

gem 'puma'
gem 'rake'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sidekiq'

gem 'active_model_serializers', '~> 0.10.0'
gem 'activerecord'
gem 'pg', '~> 0.21'
gem 'sinatra-activerecord'

gem 'nokogiri'
gem 'capybara'
gem 'capybara-selenium'

gem 'slim'

group :test do
  gem 'database_cleaner'
  gem 'fabrication', '~> 2.16.2'
  gem 'faker'
  gem 'rspec'
  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'byebug'
  gem 'memory_profiler'
end

gem 'byebug', require: false
