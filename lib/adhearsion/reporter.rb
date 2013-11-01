# encoding: utf-8

require 'toadhopper'

Adhearsion::Reporter = Class.new Adhearsion::Plugin

require 'adhearsion/reporter/hoptoad_notifier'

module Adhearsion
  class Reporter
    config :reporter do
      api_key nil,                  desc: "The Airbrake/Errbit API key"
      url     "http://airbrake.io", desc: "Base URL for notification service"
      notifier Adhearsion::Reporter::HoptoadNotifier, desc: "The class that will act as the notifier."
      enable true, desc: "Disables notifications. Useful for testing."
    end

    init :reporter do
      Reporter.config.notifier.instance.init
      Events.register_callback(:exception) do |e, logger|
        Reporter.config.notifier.instance.notify e
      end
    end
  end
end
