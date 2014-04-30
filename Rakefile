require "bundler/setup"
require "twilio-ruby"
require 'yaml'

task :config_twilio do
  twilio_config = YAML.load_file("twilio.yml")

  account_sid = (ENV["ACCOUNT_SID"] || twilio_config["account_sid"])
  auth_token = (ENV["AUTH_TOKEN"] || twilio_config["auth_token"])
  phone_sid = (ENV["PHONE_SID"] || twilio_config["phone_sid"])
  url = ENV["URL"] + "/voice"

  @client = Twilio::REST::Client.new account_sid, auth_token
  @number = @client.account.incoming_phone_numbers.get(phone_sid)

  puts "Updating #{phone_sid} (#{@number.phone_number}) to point to: #{url}"
  @number.update(:voice_url => url)
end
