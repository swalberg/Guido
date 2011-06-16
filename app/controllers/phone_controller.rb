class PhoneController < ApplicationController
  before_filter :api_setup

  def call
    @client_id = params[:client]
    # First call my phone
    phone = ENV['MY_PHONE']
    Twilio::Call.make('3102196382', phone, "http://home.ertw.com:3000/phone/connected?client=#{params[:client]}")
  end

  def text
  end

  def connected
    client = FreshBooks::Client.get(params[:client])
    phone = client.work_phone.gsub(/[^0-9]/, "")
    verb = Twilio::Verb.new do |v|
      v.say "Connecting"
      v.dial phone
    end
    render(:text => verb.response)
  end

end
