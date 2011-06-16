Guido
=====

A sample Freshbooks/Twilio application built to enter the latest Twilio contest and satisfy my own curiousity about the API. 

Basically Guido grabs your outstanding invoices and displays a list of customers, giving you the option to click-to-call customers, and add annotations about what transpired on the call.

I profusely apologize for the lack of comments, test cases, and ugly controllers. 

Usage
-----

You need to pass your API keys and phone number in as environment variables.

export MY\_PHONE=your 10 digit phone number
export TWILIO\_SID=your twilio SID
export TWILIO\_TOKEN=your twilio token
export FRESHBOOKS\_URL="example.freshbooks.com"
export FRESHBOOKS\_TOKEN=your Freshbook API token

or, in Heroku, look at heroku config

Some notes about problems I ran into:
http://ertw.com/blog/2011/06/16/freshbooksheroku-and-twilio-apis/
