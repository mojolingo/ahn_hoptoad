require 'spec_helper'

describe Adhearsion::Reporter do
  EventClass = Class.new
  ExceptionClass = Class.new StandardError

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
