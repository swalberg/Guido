class IncomingController < ApplicationController
  def index
    verb = Twilio::Verb.new { |v|
      v.say "Its hammer time"
      v.hangup
    }
    puts verb.response
    render(:text => verb.response)
  end

end
