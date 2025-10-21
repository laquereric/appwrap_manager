# frozen_string_literal: true

require_relative "appwrap_manager/version"

module AppwrapManager
  class Error < StandardError; end

  # AppwrapManager is a wrapper gem that coordinates the appwrap suite of gems.
  # It provides unified rake tasks to extract routes, models, and tests,
  # as well as run all tests using the testrunner.
  #
  # All operations write exclusively to the 'appwrap' folder.
end

# Load rake tasks if we're in a Rails environment
require "appwrap_manager/railtie" if defined?(Rails)

