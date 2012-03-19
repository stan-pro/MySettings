# Set correct vim version
if command -v mvim &> /dev/null; then
  export EDITOR="mvim -v"
else
  export EDITOR="vim"
fi

export SHELL="/usr/local/bin/zsh"

# I always use x86_64
export ARCHFLAGS="-arch x86_64"

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  

# Python Startup
export PYTHONSTARTUP=$HOME/.pythonstartup


# Python path
# TODO Need to detect python version
if [ -d $HOME/.local/lib/python2.7/site-packages ]; then
  export PYTHONPATH=$HOME/.local/lib/python2.7/site-packages:$PYTHONPATH
fi

# homebrew
if command -v brew &> /dev/null; then
  export PATH=/usr/local/bin:/usr/local/sbin:$PATH
fi

# my bin
if [ -d $HOME/.local/bin ]; then
  export PATH=$HOME/.local/bin:$PATH
fi

# virtualenvwrapper
if [ -f $HOME/.local/bin/virtualenvwrapper.sh ]; then
  export VENVWRAP=$HOME/.local/bin/virtualenvwrapper.sh
fi

if [ ! -z $VENVWRAP ]; then
  [ -d ~/.virtualenvs ] || mkdir -p $HOME/.virtualenvs
  export WORKON_HOME=$HOME/.virtualenvs
  source $VENVWRAP
  
  export VIRTUALENV_USE_DISTRIBUTE=true

  # pip
  export PIP_VIRTUALENV_BASE=$WORKON_HOME
  export PIP_REQUIRE_VIRTUALENV=true
  export PIP_RESPECT_VIRTUALENV=true
  export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
fi

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

