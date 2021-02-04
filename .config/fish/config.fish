set fish_greeting

set -x EDITOR vim

# fzf / ripgrep integration
set -x FZF_DEFAULT_COMMAND "rg --files --column --no-heading --hidden --smart-case --glob '!.git'"
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# app-specific bin/'s (e.g. code and psql)
test -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ; set PATH "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $PATH
test -d  "/Applications/Postgres.app/Contents/Versions/latest/bin" ; set PATH "/Applications/Postgres.app/Contents/Versions/latest/bin" $PATH

# GNU coreutils from Homebrew
set HOMEBREW_PREFIX (brew --prefix)
test -d "$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin" ; and set PATH "$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin" $PATH
test -d "$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman" ; and set MANPATH "$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH"

# n - interactive node version manager: https://github.com/tj/n
set -x N_PREFIX ~/.n
set -x PATH "$N_PREFIX/bin" $PATH

test -d ~/bin ; set PATH ~/bin $PATH

test -f ~/.config/fish/.extra ; and source ~/.config/fish/.extra

# aliases / utilities
function spoton   ; sudo mdutil -a -i on ; end
function spotoff  ; sudo mdutil -a -i off ; end

function karabiner_cli ; command "/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli" $argv ; end
