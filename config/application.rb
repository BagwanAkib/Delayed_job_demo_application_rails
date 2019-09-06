require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DelayedJobDemoApplication
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Delayed Job set the queue_adapter configration
    config.active_job.queue_adapter = :delayed_job
    
    Delayed::Worker.sleep_delay = 60

    # delay_jobs while application is in testing or development
    Delayed::Worker.delay_jobs = false
    
    # default behavior is to read 5 jobs from the queue when finding an available job.
    Delayed::Worker.read_ahead

    # The default Worker.max_attempts is 3.
    Delayed::Worker.max_attempts = 3

    # The default Worker.max_run_time is 5.minutes.
    Delayed::Worker.max_run_time = 5.minutes
  end
end
