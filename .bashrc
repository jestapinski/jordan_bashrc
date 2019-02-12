export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export CONFIG='config/puma.rb'
export THREADS=10
alias jn='jupyter notebook'
alias p="python"
alias p3="python3"
alias m='mongo'
alias sm='sudo mongo'
alias md='sudo mongod'
alias ga='git add .'
alias gc='git commit'
alias gp='git push'
alias gpo='git push -u origin master'
alias gcl='git clone'
alias gpul='git pull'
alias rs='rails server'
alias rc='rails console'
alias rt='rails test'
alias rtm='rails test:models'
alias rdbm='rails db:migrate'
alias rdbp='rails db:populate'
alias bi='bundle install'
alias rtc='rails test:controllers'
alias test_ui='bundle exec rails cucumber'
alias c='clear'
alias o='open'
alias sb='sublime'
alias setup_rails='bundle install; rails db:migrate; rails db:populate; rails server'
alias gb='gradle build'

# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        STAT=`parse_git_dirty`
        echo "[${BRANCH}${STAT}]"
    else
        echo ""
    fi
}

# get current status of git repo
function parse_git_dirty {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits="!${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

export PS1="\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\] \`parse_git_branch\` \\$ "
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
