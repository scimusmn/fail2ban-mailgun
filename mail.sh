#!/bin/bash

# Get secrets
source api.conf

# Send mail message via Mailgun
function send_sms {
  echo "Sending"
  mailgun_call="/usr/bin/curl -s --user 'api:$mailgun_api' https://api.mailgun.net/v3/$mailgun_domain/messages -F from='$from' -F to='$to' -F subject='$server - fail2ban blocked an IP' -F text='fail2ban blocked IP: <ip>'"
  echo $mailgun_call
  eval $mailgun_call
  exit
}

send_sms
