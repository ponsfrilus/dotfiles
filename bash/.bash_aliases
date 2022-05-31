# $HOME/dev

#alias dev='cd $HOME/Dev; ls -ltrd */'
alias dev='cd $HOME/Dev; echo -e "\n⚠ This is the 20 last active diretories in `pwd`\n"; ls -ltrd --color=always */ | tail -20'
alias doc='cd $HOME/Documents; echo -e "\n⚠ This is the 20 last active diretories in `pwd`\n"; ls -ltrd --color=always */ | tail -20'
alias dow='cd $HOME/Downloads; echo -e "\n⚠ This is the 20 last active diretories in `pwd`\n"; ls -ltrd --color=always */ | tail -20'
alias down=dow

alias tev='cd $HOME/Dev; echo "cd $(ls  -t | tail -n +2 | head -1)"'

alias dojo='cd $HOME/Dev/dojo; ls -ltrd */'
alias colloquium='cd $HOME/Dev/colloquium; ls -ltrd */'
alias grants='cd $HOME/Dev/grantsdb/grantsdb/; ls -ltrd */'
alias go='cd $HOME/Dev/fsd/go/; ls -ltrd */'
alias alumni='cd $HOME/Dev/alumni/hivebrite; ls -ltrd */'

alias fsd='cd $HOME/Dev/fsd; echo -e "\n⚠ This is the 20 last active diretories in `pwd`\n"; ls -ltrd --color=always */ | tail -20'
alias noc='cd $HOME/Dev/fsd/external-noc; echo -e "\n⚠ This is the 20 last active diretories in `pwd`\n"; ls -ltrd --color=always */ | tail -20'
alias ticket='cd $HOME/Dev/fsd/ticketshop; echo -e "\n⚠ This is the 5 last active diretories in `pwd`\n"; ls -ltrd --color=always */ | tail -5'
alias ticketshop=ticket
alias cff=ticket
alias lhd='cd $HOME/Dev/fsd/LHD; echo -e "\n⚠ This is the 20 last active diretories in `pwd`\n"; ls -ltrd --color=always */ | tail -20'
alias apprentis='cd $HOME/Dev/_apprentis; echo -e "\n⚠ This is the 20 last active diretories in `pwd`\n"; ls -ltrd --color=always */ | tail -20'
alias wp-dev='cd $HOME/Dev/fsd/wp-dev; echo -e "\n⚠ This is the 5 last active diretories in `pwd`\n"; ls -ltrd --color=always */ | tail -5'
alias wp-ops='cd $HOME/Dev/fsd/wp-ops; echo -e "\n⚠ This is the 5 last active diretories in `pwd`\n"; ls -ltrd --color=always */ | tail -5'

# websti
alias jahia2wp='cd $HOME/Dev/websti/jahia2wp/'
alias websti='cd $HOME/Dev/websti/jahia2wp/volumes/srv/test/sti-dev.epfl.ch/htdocs/'
alias theme='cd $HOME/Dev/websti/jahia2wp/volumes/srv/test/sti-dev.epfl.ch/htdocs/wp-content/themes/epfl-sti/'
alias plugin='cd $HOME/Dev/websti/jahia2wp/volumes/srv/test/sti-dev.epfl.ch/htdocs/wp-content/plugins/'

# VPN
#alias vpn='sudo openconnect -u $USER vpn.epfl.ch'
alias vpn-epfl='echo "$EPFL_VPN_PWD" | base64 --decode | sudo openconnect vpn.epfl.ch --disable-ipv6 -u $USER --passwd-on-stdin'

# vim
#alias vim='/usr/bin/nvim'

## TKGI
alias tkgi='tkgi get-kubeconfig svc0176idevfsdkt0001 -u $USER -a tkgi.epfl.ch --ca-cert $HOME/Dev/testTKGI/tkgi.crt'
alias tkgi-context='kubectl config use-context svc0176idevfsdkt0001'

# tools
alias pg='ping 8.8.8.8'
## gitpull
alias gp='find "$PWD" -name vendor -prune -false -o  -name .git | while read line; do (set -x; cd "$line"/../ && git pull --ff-only); done'

alias test="echo test"

alias kc="kubectl"
alias kgp="kubectl get pods -o wide"



# OpenVPN
alias vpn="sudo openconnect vpn.epfl.ch --disable-ipv6 -u $USER --servercert $EPFL_VPN_CERT"

# bat / cat
#alias cat="bat"


# Testing cool stuff to print out when using aliassed "cd"
alias test1="git rev-parse --abbrev-ref HEAD" # Print current branch
alias test2="git status -s" # Print sumarized git status

alias myip='ip addr show | grep '"'"'inet\b'"'"' | awk '"'"'{print $2}'"'"' | cut -d/ -f1 | grep -v -e "^127.0.0" -e "^172."'
alias ipfinder='myip'


# https://superuser.com/a/1486681
git_pull_rebase_fn() {
    echo -n "Want to use “git pull --rebase”? [Y]es, [N]o, [Aa]bort? "
    read REPLY
    case $REPLY in
    [Yy]) echo 'git pull --rebase' && git pull --rebase ;;
    [Nn]) echo 'git pull --no-rebase' && git pull --no-rebase ;;
    [Aa]) return ;;
    # Here are a few optional options to choose between
    # Any other answer:

    # 1. Repeat the question
    *) git_pull_rebase_fn;;

    # 2. ignore
    # *) ;;

    # 3. Exit terminal
    #*) exit ;;

    esac
    # REPLY=''
}
git() { if [[ $@ == "pull" ]]; then git_pull_rebase_fn; else command git "$@"; fi; }

# https://webmasters.stackexchange.com/questions/8539/how-do-i-check-that-a-domain-is-available-without-triggering-a-grabber
alias checkdomain="(read domain; whois \$domain | grep -qciE 'no (match|object found)' && echo -e '\033[0;32mAvailable\033[0m' || echo -e '\033[0;31mNot available\033[0m') <<<"

export HOMEBREW_NO_ANALYTICS=1

export GHTOKEN=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

# pyenv
eval "$(pyenv virtualenv-init -)"
