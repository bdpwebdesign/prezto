# ENVIRONMENT
#
# Sets general shell options and defines environment variables.

# Smart URLs
local paster
[[ $OSTYPE == linux* ]] && paster=bracketed-paste-magic || paster=bracketed-paste-url-magic
autoload -Uz $paster
zle -N bracketed-paste $paster
unset paster
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Termcap
if zstyle -t ':prezto:environment:termcap' color; then
	export LESS_TERMCAP_mb=$'\E[00;31m'      # Begins blinking.
	export LESS_TERMCAP_md=$'\E[00;33m'      # Begins bold.
	export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
	export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
	export LESS_TERMCAP_so=$'\E[01;47;30m'   # Begins standout-mode.
	export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
	export LESS_TERMCAP_us=$'\E[00;32m'      # Begins underline.
fi
