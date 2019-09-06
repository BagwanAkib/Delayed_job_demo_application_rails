class DeviceJob < ApplicationJob
  queue_as :default
  def perform(*args)
    # Do something later
    puts("\n--->Job"*5)
    puts("DeviceJob")
    puts("DeviceJob Executed! by Delayed_Job!")
    puts("\n<---close"*5)
  end
end
