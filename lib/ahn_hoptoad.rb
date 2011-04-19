# Register an exception handler for Adhearsion exceptions.
# Requires Adhearsion 1.1.0 or later.

require 'toadhopper'
notifier = Toadhopper.new(COMPONENTS.ahn_hoptoad[:apikey],
                          :notify_host => COMPONENTS.ahn_hoptoad[:host])
Events.register_callback([:exception]) do |e|
  result = notifier.post!(e)
  if !result.errors.empty? || result.status != 200
    ahn_log.warn "Error posting exception to Hoptoad!"
    result.errors.each do |error|
      ahn_log.warn "Hoptoad error: #{error}"
    end
    ahn_log.warn "Original exception message: #{e.message}"
  end
end
