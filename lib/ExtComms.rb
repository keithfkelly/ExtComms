#require "ExtComms/version"
require 'twilio-ruby'
module ExtComms

	class ExtComms
		#SMS Generating Method. 
		#Takes a phone number (to) and
		#the message data (body) as arguments.
		def sendSMS(to, body)
			#Twilio Account ID
			account_sid = "AC4ec831329d317ff210717149d88ce48d"
			# Twilio Authentication Token
			auth_token = "1bed194febf4682c9eed34871f5c739a"
			#Creates a Twilio Client
			@client = Twilio::REST::Client.new account_sid, auth_token 
			#Creates the SMS and sends it
			@client.account.sms.messages.create(
				:from => '+17025054171',
				:to=>"#{to}",
				:body=>"#{body}"
			)
		end
		
		#Phone Call Creation Method
		#Takes a Phone number and string as arguments.
		#The String is encoded to URI Standards and passed to the
		#Twilio Echo Twimlet. This can be found at https://www.twilio.com/labs/twimlets/echo.
		#The Twimlet allows XML to be created for the call script.
		def doCall(to,echo)
			account_sid = "AC4ec831329d317ff210717149d88ce48d"
			auth_token = "1bed194febf4682c9eed34871f5c739a"
			echo = "http://twimlets.com/echo?Twiml=<Response><Say>#{echo}</Say></Response>"
			#URI Encoding of the String
			echo = URI::encode(echo)
			@client = Twilio::REST::Client.new account_sid, auth_token
			@client.account.calls.create(
				:from => '+17025054171',
				:to=>"#{to}",
				# Passing the Twimlet to Twilio for Proccessing
				:url => "#{echo}" 
			)
		end
	end
end
