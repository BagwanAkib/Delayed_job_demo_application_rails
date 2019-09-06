# Rails delayed_job Demo Application

> This Is just steps to create demo to use ` delayed_job`

 > This document is created by [Reffrence](https://github.com/collectiveidea/delayed_job) please visit for more information.

* Add Gemfile
```Ruby
gem 'delayed_job_active_record'
```
* Run bundle install
```Ruby
bundle install
```

* Run migrations install
```Ruby
# create delayed_job and migration files
rails generate delayed_job:active_record

# Run Migrations
rake db:migrate
```
 * Add following to config/application.rb [ In Rails 4.2+, set the queue_adapter in config/application.rb ]

 ```ruby
 
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
 ```
* Create Job
```ruby 
rails g job device
```
add the given code in  `app/jobs/device_job.rb`
device_job.rb
```ruby
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
```

* to execute it we are using index page of application
(i.e. app/controllers/application_controller.rb) and also creat view in app/view/application/index.html.erb

application_controller.rb
```ruby
class ApplicationController < ActionController::Base
    def index
        # Job start immediately 
        DeviceJob.perform_later()
    end
end
```
index.html
```html
<h1>Check console</h1>
```
 