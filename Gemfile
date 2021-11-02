source 'https://rubygems.org'

ruby '2.6.6'
gem 'rails', '4.2.11'


gem 'sass-rails', '~> 5.0.3'
gem 'uglifier', '>= 2.7.1'

gem 'jquery-rails'


# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'byebug'
  gem 'database_cleaner'
  gem 'cucumber-rails', require: false
  gem 'rspec-rails'
  gem 'pry'
  gem 'pry-byebug'

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.3.6'
  gem 'web-console', group: :development
end

group :production do
  gem 'pg', '~> 0.2'
  gem 'rails_12factor'
end
