# frozen_string_literal: true

require_relative "lib/appwrap_manager/version"

Gem::Specification.new do |spec|
  spec.name = "appwrap_manager"
  spec.version = AppwrapManager::VERSION
  spec.authors = ["Eric Laquer"]
  spec.email = ["eric@example.com"]

  spec.summary = "Manager gem for appwrap suite - extracts routes, models, tests and runs tests"
  spec.description = "AppwrapManager wraps appwrap_routes, appwrap_models, appwrap_tests, and appwrap_testrunner gems. Provides rake tasks to extract all routes/models/tests and run all tests, writing only to the 'appwrap' folder."
  spec.homepage = "https://github.com/laquereric/appwrap_manager"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.3.6"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/laquereric/appwrap_manager"
  spec.metadata["changelog_uri"] = "https://github.com/laquereric/appwrap_manager/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.glob("{lib,features}/**/*") + %w[LICENSE.txt README.md CHANGELOG.md]
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Runtime dependencies - the gems this manager wraps
  spec.add_dependency "appwrap_routes", "~> 0.1"
  spec.add_dependency "appwrap_models", "~> 0.1"
  spec.add_dependency "appwrap_tests", "~> 0.1"
  spec.add_dependency "appwrap_testrunner", "~> 0.1"

  # Development dependencies
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "cucumber", "~> 9.0"
  spec.add_development_dependency "rake", "~> 13.0"
end

