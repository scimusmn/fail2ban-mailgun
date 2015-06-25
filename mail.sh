#!/bin/bash

# Get secrets
source /etc/mailgun_api.conf

# Send mail message via Mailgun
function send_sms {
  echo "Sending"
  mailgun_call="/usr/bin/curl -s --user 'api:$mailgun_api'
  https://api.mailgun.net/v3/$mailgun_domain/messages -F from='$from' \
  -F to='$to' \
  -F subject='$server - fail2ban $message an IP' \
  -F text='fail2ban $1 IP: <ip>'"
  echo $mailgun_call
  eval $mailgun_call
  exit
}

if [ "$1" = 'ban' ]
then
  message="banned"
  send_sms $message
else
  message="unbanned"
  send_sms $message
fi
