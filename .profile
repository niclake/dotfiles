PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"

export POWERLINE=1

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

export PATH="$HOME/.local/bin:$PATH"

if [ -d "$HOME/.nvm" ]; then
	export NVM_DIR="$HOME/.nvm"

	if [ -s "$NVM_DIR/nvm.sh" ]; then
		. "$NVM_DIR/nvm.sh"
	fi
fi

if [ -n "$RUBYOPT" ]; then
  export RUBYOPT="$RUBYOPT -r/Users/niclake/src/wkhtmltopdf-binary-docker/exe_path"
else
  export RUBYOPT='-r/Users/niclake/src/wkhtmltopdf-binary-docker/exe_path'
fi
