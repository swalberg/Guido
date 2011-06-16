class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :api_setup


  private

  def api_setup
    Twilio.connect(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
    FreshBooks::Base.establish_connection(ENV['FRESHBOOKS_URL'], ENV['FRESHBOOKS_TOKEN'])
    Time.zone = "Central Time (US & Canada)"
  end
end
