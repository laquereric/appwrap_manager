# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in appwrap_manager.gemspec
gemspec

gem "rake", "~> 13.0"
gem "rspec", "~> 3.0"
gem "cucumber", "~> 9.0"

# Use local submodules for development, GitHub for production
if File.exist?(File.expand_path("vendor/appwrap_routes", __dir__))
  gem "appwrap_routes", path: "vendor/appwrap_routes"
  gem "appwrap_models", path: "vendor/appwrap_models"
  gem "appwrap_tests", path: "vendor/appwrap_tests"
  gem "appwrap_testrunner", path: "vendor/appwrap_testrunner"
else
  gem "appwrap_routes", github: "laquereric/appwrap_routes"
  gem "appwrap_models", github: "laquereric/appwrap_models"
  gem "appwrap_tests", github: "laquereric/appwrap_tests"
  gem "appwrap_testrunner", github: "laquereric/appwrap_testrunner"
end
