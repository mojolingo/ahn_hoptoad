# Register an exception handler for Adhearsion exceptions.
# Requires Adhearsion 1.1.0 or later.

require 'toadhopper'
notifier = Toadhopper.new(COMPONENTS.ahn_hoptoad[:apikey],
                          :notify_host => COMPONENTS.ahn_hoptoad[:host])
Events.register_callback([:exception]) do |e|
  response = notifier.post!(e)
  if !response.errors.empty? || !(200..299).include?(response.status.to_i)
    ahn_log.warn "Error posting exception to Hoptoad! Response code #{response.status}"
    response.errors.each do |error|
      ahn_log.warn "Hoptoad error: #{error}"
    end
    ahn_log.warn "Original exception message: #{e.message}"
  end
end
