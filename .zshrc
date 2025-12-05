##############################################
# 0) Powerlevel10k Instant Prompt (mantener arriba)
##############################################
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##############################################
# 1) Oh My Zsh Core
##############################################
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

##############################################
# 2) External plugins
##############################################
# Autosuggestions (si existe)
[[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

##############################################
# 3) PATH y herramientas según sistema
##############################################
case "$OSTYPE" in
  darwin*)  # macOS
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="$HOME/Applications/SwiftBar:$PATH"
    export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
    export PATH="/opt/homebrew/opt/icu4c/sbin:$PATH"
    export PATH="/opt/homebrew/opt/qt/bin:$PATH"
    export PATH="/usr/local/opt/mysql-client/bin:$PATH"
    export PATH="/Users/one/.codeium/windsurf/bin:$PATH"
    ;;

  linux-musl*)  # iSH (Alpine)
    # Ajustes mínimos compatibles
    alias ll='ls -lah'
    export PATH="$HOME/.local/bin:$PATH"
    ;;
esac

##############################################
# 4) Historial & comportamiento
##############################################
export HISTSIZE=100000
export SAVEHIST=100000
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE

##############################################
# 5) XpertaSocial Engineering Setup
##############################################
# Cleanup Next.js dev stuck processes (macOS; ignora errores en iSH)
pkill -f "next-dev" 2>/dev/null || true

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

alias ws="cd ~/ws"
alias dev="cd ~/ws/xpertasocial-web && npm run dev:turbo"

##############################################
# 6) Environments externos
##############################################
# Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# Iterm2 shell integration
[[ -f "$HOME/.iterm2_shell_integration.zsh" ]] && \
  source "$HOME/.iterm2_shell_integration.zsh"

# NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

##############################################
# 7) Secrets privados (NO versionados)
##############################################
[[ -f "$HOME/.secrets" ]] && source "$HOME/.secrets"

##############################################
# 8) Dotfiles alias
##############################################
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

##############################################
# 9) Powerlevel10k config final
##############################################
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
