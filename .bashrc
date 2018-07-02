# Coloured PROMPT, username@hostname FQDN
export PS1='[\e[1;33m\u\e[0m\e[1;34m@\H\e[0m \w]\e[0;33m\$\e[0m '

# mailx wrapper for virtual domains
# i.e.: 'mail -u info' tests for directory presence and uses it
# otherwise tries to use local account mailbox if that account exists
function mail() {

    domain="MY_DOMAIN"
    maildir="/mail/$domain"

    if [ $# -eq 2 ] && [ "$1" == "-u" ] && [ -d $maildir/$2 ]; then
        $(which mailx) -v -f $maildir/$2
    else
        $(which mailx) "$@"
    fi

}
