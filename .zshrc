# export PATH=$HOME/bin:/usr/local/bin:$PATH
 export LANG='en_US.UTF-8'

plugins=(
  git
)

# Environment Variables
export EDITOR='nvim'
export FONTCONFIG_FILE='~/fonts.conf'

function parse_git_branch() {
  git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

setopt PROMPT_SUBST

# Prompt

export PS1=' %F{140}❯ %F{73}%1d %F{245}%'
export RPROMPT='$(parse_git_branch)'

# List
alias ls='lsd -1'
alias lt='lsd --tree'
alias la='lsd -a --color=auto -1'

# alias nv='~/neovim_foldcol/build/bin/nvim'
# alias nv='~/neovim/build/bin/nvim'
alias nv='nvim'
# alias nvim='~/neovim/build/bin/nvim'
alias vi='vim'

# Change directory
alias ..='cd ..'
alias ...='cd ../..'

# Dotfiles
alias .nv='cd ~/.config/nvim/'

# Git Aliases
alias status='git status'
alias commit='git commit -m '
alias diff='git diff'
alias branch='git branch'
alias add='git add .'
alias push='git push'

# Render image
alias icat="kitty +kitten icat"

# Show Processes
alias gtop='LANG=en_US.utf8 TERM=xterm-256color gtop'

# Source config file
alias dots="/usr/bin/git --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME"
