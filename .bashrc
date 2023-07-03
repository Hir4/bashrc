###########
# DOCKER #
#########

## list
alias dlc='docker ps -aq'
alias dli='docker images -a'
## stop
alias dsa='docker stop $(dlc)'
## remove
alias dri='docker rmi -f $(docker images -q)'
alias drc='docker rm $(docker ps -aq)'
alias dra='docker system prune && docker volume prune && docker system prune -a && docker network prune && docker system prune'

########
# GIT #
######

function gmain() { # Função para ir para main/ master
  git checkout main
  if [ ! $? -eq 0 ]; then
    git checkout master
  fi
}
function gnb() { # Função para criar nova branch
  git checkout -b "${1}"
}
function gb() { # Função para trocar de branch
  git checkout "${1}"
}
function gadd() { # Função para adicionar arquivos
  for file_name in "$@"; do
    git add "$file_name"
  done
}
function gunstage() { # Função para remover arquivos
  for file_name in "$@"; do
    git reset HEAD -- "$file_name"
  done
}
function gunstage() { # Função para remover arquivos
  for file_name in "$@"; do
    git reset HEAD -- "$file_name"
  done
}
alias gstts='git status'
alias gcmt='git commit'
alias gpull='git pull'
alias gpush='git push'
alias glcmt='git log --pretty=oneline'
function gpup() { # Função para push upstream
  remote="origin"
  if [[ -n "$1" ]]; then
    remote="$1"
  fi
  aux=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')
  branch=${aux:2:-1}
  git push -u "${remote}" "${branch}"
}
function grebase() { # Função para combinar commits
  git rebase main
  if [ ! $? -eq 0 ]; then
    git rebase master
  fi
}
