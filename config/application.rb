require_relative "boot"

require "rails/all"


Bundler.require(*Rails.groups)

module Base
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
    config.load_defaults 6.1
  end
end
