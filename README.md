# Scripted email messages for fail2ban actions via Mailgun

When fail2ban executes and action, we run these scripts to send the appropriate
email with Mailgun

## Install
Download the app and set up config files.

    $ cd /usr/local/bin
    $ git clone https://github.com/scimusmn/fail2ban-mailgun.git
    $ cd fail2ban-mailgun
    $ cp mailgun_api.default.conf /etc/mailgun_api.conf

Edit the api.conf file, adding your Mailgun API details.

Define a new action in fail2ban at: `/etc/fail2ban/action.d/mailgun.conf`

    [Definition]
    actionstart =
    actionstop =
    actioncheck =
    actionban = /usr/local/bin/fail2ban-mailgun/mail.sh ban
    actionun = /usr/local/bin/fail2ban-mailgun/mail.sh unban

Modify or add an action entry in the jail you wish to configure. We're assuming
that you've copied jail.conf to jail.local and will be adding this rule to the
SSH jail entry.

    [ssh]

    enabled  = true
    port     = ssh
    filter   = sshd
    logpath  = /var/log/auth.log
    maxretry = 6
    action = %(action_)s
        mailgun

The last part states to set the action to the default action variable,
likely defined above in your jail.local file, and then to add the mailgun
action to the ban process.
