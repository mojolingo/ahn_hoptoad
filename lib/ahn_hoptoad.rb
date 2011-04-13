# Register an exception handler for Adhearsion exceptions.
# Requires Adhearsion 1.1.0 or later.

require 'toadhopper'
notifier = Toadhopper.new(COMPONENTS.ahn_hoptoad[:apikey],
                          :notify_host => COMPONENTS.ahn_hoptoad[:host])
Events.register_callback([:exception]) do |e|
  notifier.post!(e)
end
