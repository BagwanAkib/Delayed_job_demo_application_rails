class ApplicationController < ActionController::Base
    def index
        # Job start immediately 
        DeviceJob.perform_later()
    end
end
