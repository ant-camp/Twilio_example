require 'twilio-ruby'

class Message < ActiveRecord::Base
has_many :contacts

#we can expand further onto this simple twilio request
#could add this in the background if we wanted also

#Twilio sms
def send_twilio_mms
  # Get your Account Sid and Auth Token from twilio.com/user/account

  account_sid = 'add your account sid'
  auth_token = 'add your auth token'

  # set up a client to talk to the Twilio REST API
  client = Twilio::REST::Client.new account_sid, auth_token


    mms_message_body = "name:#{self.contact.name}"
    mms_message_body += "" #quick way to create spacing inbetween txt lines
    mms_message_body += "phone: #{self.contact.phone_number}"
    mms_message_body += "" #quick way to create spacing inbetween txt lines
    mms_message_body += "#{self.message}"
  end



  mms_message = client.messages.create(
    from: '+13212965007', # your twilio number
    to: self.contact.phone_number,
    body: mms_message_body

  )
  puts mms_message
end

end
