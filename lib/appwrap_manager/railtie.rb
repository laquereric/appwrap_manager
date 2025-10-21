# frozen_string_literal: true

require "rails/railtie"

module AppwrapManager
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/appwrap_manager.rake"
    end
  end
end

