#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -a'
alias grep='grep --color=auto'

# PS1='[\u@\h \W]\$ '
PS1='[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]]'

# 定义一个函数来追加 Git 分支信息（如果有）
git_branch_info() {
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ "${branch}" != "" ]; then
    if [ "${branch}" = "(no branch)" ]; then
      branch="($(git rev-parse --short HEAD)...)"
    fi
    echo "($branch)"
  fi
}

# 追加 Git 分支信息到 PS1
PS1="$PS1\[\033[91m\]\$(git_branch_info)\[\033[00m\]\n\$ "
