# UTILITY
#
# Defines general aliases and functions.

# Load dependencies.
pmodload 'helper' 'spectrum'

# Correct commands.
setopt CORRECT

# ls
if is-callable 'dircolors'; then
	# GNU Core Utilities
	alias ls='ls --group-directories-first'

	if zstyle -t ':prezto:module:utility:ls' color; then
		if [[ -s "$HOME/.dir_colors" ]]; then
			eval "$(dircolors --sh "$HOME/.dir_colors")"
		else
			eval "$(dircolors --sh)"
		fi

		alias ls="${aliases[ls]:-ls} --color=auto"
	else
		alias ls="${aliases[ls]:-ls} -F"
	fi
else
	# BSD Core Utilities
	if zstyle -t ':prezto:module:utility:ls' color; then
		# Define colors for BSD ls.
		export LSCOLORS='exfxcxdxbxGxDxabagacad'

		# Define colors for the completion system.
		export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

		alias ls="${aliases[ls]:-ls} -G"
	else
		alias ls="${aliases[ls]:-ls} -F"
	fi
fi

# grep
if zstyle -t ':prezto:module:utility:grep' color; then
	export GREP_COLOR='1;32'            # BSD.
	export GREP_COLORS="mt=$GREP_COLOR" # GNU.
	alias grep="${aliases[grep]:-grep} --color=auto"
fi
