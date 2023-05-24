######################### Directory jumping #########################

alias govim="cd $HOME/.config/nvim/"

alias d="cd $HOME && cd \$(find ./ -type d | fzf )"

alias f="cd $HOME && nvim \$(find ./ -type f | fzf )"

alias sd="cd \$(find ./ -type d | fzf )"

alias sf="nvim \$(find ./ -type f | fzf )"

alias ed="cd .. && cd \$(find ./ -type d | fzf )"

alias ef="cd .. && nvim \$(find ./ -type f | fzf )"

######################### OTHER #########################

alias lca='colorls -lA --sd --gs'

alias lc='colorls -A --sd --gs'

alias nv="nvim ."

alias rn="ranger ."

alias helpme="cat $HOME/dev/dotfiles/custom.zsh | sed 's/alias//'| sed 's/=/ ---> /' | sed 's/) /) ---> /' | sed 's/[\"'\'']//g' "

alias srb='source $HOME/.zshrc'

alias als='nvim $HOME/dev/dotfiles/custom.zsh'

alias tms='tmux ls'

pro() { PS1="($1) ${PS1}" ;}

vopen() {
    echo -e "Decrypting the archive...\n"
    gpg "$1"
    tarName="${1//\.gpg/}"
    echo -e "Archive name: $tarName"
    echo -e "Unpacking the archive...\n"
    tar xzf "$tarName"
    dirName="${tarName//\.tar\.gz/}"
    echo "Directory name: $dirname"
    echo -e "Deleting decrypted archive...\n"
    rm -rf "$tarName"
    echo -e "Done!\n"
    ls
}

vclose() {
    echo -e "Deleting old encrypted archive...\n"
    rm -rf "$1.tar.gz.gpg"
    echo -e "Creating new unencrypted archive...\n"
    tar -czf "$1.tar.gz" "$1"
    echo -e "Deleting unencrypted directory...\n"
    rm -rf "$1"
    echo -e "Encrypting new archive...\n"
    gpg -c "$1.tar.gz"
    echo -e "Deleting unencrypted archive...\n"
    rm -rf "$1.tar.gz"
    echo -e "Done:\n"
    ls
}

mig() {
    git remote set-url origin $1
    git push
    cd ..
}

######################### VARS ######################

export MAIN_DIR="$HOME/dev"
export dotfiles="$HOME/dev/dotfiles"
export i3Config="$HOME/dev/dotfiles/i3/config"
export i3StatusConfig="$HOME/dev/dotfiles/i3/i3status.conf"
export EDITOR=nvim
# export GIT_USER=fr-EDD1E

#cd $MAIN_DIR && ls -d */ > $MAIN_DIR/dotfiles/git-repos.txt && cd $HOME


######################### GIT STUFF ######################

gsa() {
    cd $HOME/dev/
    prev=$(pwd)
    repos=($(ls -d */))
    for i in ${repos[@]}
    do
        cd $MAIN_DIR/"$i"
        echo -e "-------------> ${i}		"
        git status -b -s
        echo -e "<-------------"
        sleep 0.1
        echo -e "\n\n"
    done
    cd $prev
}

gpa() {
    cd $HOME/dev/
    prev=$(pwd)
    repos=($(ls -d */))
    for i in ${repos[@]}
    do
        cd $MAIN_DIR/"$i"
        echo -e "-------------> ${i}		"
        git pull
        echo -e "<-------------"
        sleep 0.1
        echo -e "\n\n"
    done
    cd $prev
}

alias gp='git push'
alias gt='git pull'
alias ga='git add -A'

#gc() { git commit -am "$1" ;}

acp() { git add . ; git commit -am "$1"; git push ;}

alias gne='git commit -a --amend  --no-edit'

alias glo='git log --oneline --graph --decorate'

alias gs='git status -b -s'

alias glv='git log --graph --decorate --all --oneline'

alias gla='git log --all --graph --decorate --stat'

######################### C STUFF ######################

cb() {
    arg="$1"
    name="${arg//\.c/}"
    echo $name
    gcc "$1" -o "$name"
}

cr() {
    arg="$1"
    name="${arg//\.c/}"
    echo $name
    gcc "$1" -o "$name"
    ./"$name"
}


######################### WORK STUFF ######################

mpi() {
    mosquitto_pub -h ils-warsaw.ubudu.com -t "$1" -m "$2"
}


msi() {

    mosquitto_sub -h ils-warsaw.ubudu.com -t "$1" -v
}

msread() {
    mosquitto_sub -h ils-warsaw.ubudu.com -t gw/"$1"/dev/"$2"/serial/read -v
}

mswrite() {
    mosquitto_sub -h ils-warsaw.ubudu.com -t gw/"$1"/dev/"$2"/serial/write -v
}


bcd() {

bcrc -b ils-warsaw.ubudu.com -s ucs -m "$1\r\n" -t $2 -g $3

}

pco() {

    picocom /dev/tty$1 --b 115200

}

tma() {

    tmux a $1

}

cpx() {
    cat "$1" | xclip -selection clipboard
}

bmq() {
    $HOME/Downloads/ble_v2_dev_monitor-linux --mqtt-host ils-warsaw.ubudu.com --mqtt-port 1883 --mqtt-topic "$1"
}

flash() { nrfjprog --recover && nrfjprog --program "$1" --sectorerase && nrfjprog -r ;}

#keychain --quiet ~/.ssh/gw-key-1
#source ~/.keychain/$HOST-sh
# export -f gs
# export -f cb
# export -f cr
# export -f mpi
# export -f vclose
# export -f vopen

