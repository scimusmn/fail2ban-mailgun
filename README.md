# Scripted email messages for fail2ban actions via Mailgun

When fail2ban executes and action, we run these scripts to send the appropriate
email with Mailgun

## Install
    cp api.default.conf api.conf

Edit the api.conf file, adding your Mailgun API details.
