require 'spec_helper'

describe Adhearsion::Reporter do
  EventClass = Class.new
  ExceptionClass = Class.new StandardError

  context "with a DummyNotifier" do
    class DummyNotifier
      include Singleton
      attr_reader :initialized, :notified
      def init
        @initialized = true
      end

      def notify(ex)
        @notified = ex
      end
    end

    before(:each) do
      Adhearsion::Reporter.config.notifier = DummyNotifier
      Adhearsion::Plugin.init_plugins
      Adhearsion::Events.register_handler :event, EventClass do |event|
        raise ExceptionClass
      end
      Adhearsion::Events.trigger_immediately :event, EventClass.new
      Adhearsion::Events.clear_handlers :event, EventClass
    end

    it "calls init on the notifier instance" do
      Adhearsion::Reporter.config.notifier.instance.initialized.should == true
    end

    it "logs an exception event" do
      sleep 0.25
      Adhearsion::Reporter.config.notifier.instance.notified.class.should == ExceptionClass
    end
  end

  # context "with a NewrelicNotifier" do
  #   before(:each) do
  #     Adhearsion::Reporter.config.notifier = Adhearsion::Reporter::NewrelicNotifier
  #     Adhearsion::Reporter.config.newrelic.license_key = 'BLAH'
  #     Adhearsion::Reporter.config.newrelic.app_name = 'AhnRepTest'
  #   end

  #   it "does stuff" do
  #     Adhearsion::Plugin.init_plugins
  #     Adhearsion::Events.register_handler :event, EventClass do |event|
  #       raise ExceptionClass
  #     end
  #     Adhearsion::Events.trigger_immediately :event, EventClass.new
  #     Adhearsion::Events.clear_handlers :event, EventClass
  #   end
  # end
end
