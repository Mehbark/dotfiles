# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#some cargo aliases :)
alias cn='cargo new'
alias cnl='cargo new --lib'
alias ci='cargo init'
alias cr='cargo run'
alias cb='cargo build'
alias ct='cargo test'
alias c='cargo check'
alias cbr='cargo build --release'

#general rust aliases
alias rft='rustfmt'

#git aliases
alias gcs="batcat /home/mehbark/main/misc/gitCliCheatSheet.js"
alias gco="git checkout"
alias gc="git commit -m"

ezcommit() {
  git commit -m "$1"
}

#QoL
BAT(1)                                                                   General Commands Manual                                                                   BAT(1)

NAME
       bat - manual page for bat

DESCRIPTION
       bat - a cat(1) clone with syntax highlighting and Git integration.

USAGE
              bat [OPTIONS] [FILE]...

              bat <SUBCOMMAND>

OPTIONS
       General remarks

              Command-line options like '-l'/'--language' that take values can be specified as either '--language value', '--language=value', '-l value' or '-lvalue'.

       -l, --language <language>

              Explicitly  set  the  language  for  syntax  highlighting. The language can be specified as a name (like 'C++' or 'LaTeX') or possible file extension (like
              'cpp', 'hpp' or 'md'). Use '--list-languages' to show all supported language names and file extensions.

       -L, --list-languages

              Display a list of supported languages for syntax highlighting.

       -m, --map-syntax <from:to>...

              Map a file extension or file name to an existing syntax. For example, to highlight *.conf files with the INI syntax, use '-m conf:ini'. To highlight  files
              named '.myignore' with the Git Ignore syntax, use '-m .myignore:gitignore'.

       --theme <theme>

              Set  the theme for syntax highlighting. Use '--list-themes' to see all available themes. To set a default theme, add the '--theme="..."' option to the con‐
              figuration file or export the BAT_THEME environment variable (e.g.: export BAT_THEME="...").

       --list-themes

              Display a list of supported themes for syntax highlighting.

       --style <style-components>

              Configure which elements (line numbers, file headers, grid borders, Git modifications, ..) to display in addition to the file contents. The argument  is  a
              comma-separated  list  of  components  to  display  (e.g.   'numbers,changes,grid')  or  a  pre-defined  style  ('full').  To  set a default style, add the
              '--style=".."' option to the configuration file or export the BAT_STYLE environment variable (e.g.: export BAT_STYLE=".."). Possible values: *auto*,  full,
              plain, changes, header, grid, numbers, snip.

       -p, --plain

              Only  show plain style, no decorations. This is an alias for '--style=plain'. When '-p' is used twice ('-pp'), it also disables automatic paging (alias for
              '--style=plain --pager=never').

       -n, --number

              Only show line numbers, no other decorations. This is an alias for '--style=numbers'

       -A, --show-all

              Show non-printable characters like space, tab or newline. Use '--tabs' to control the width of the tab-placeholders.

       -r, --line-range <N:M>...

              Only print the specified range of lines for each file. For example:

              --line-range 30:40
                     prints lines 30 to 40

              --line-range :40
                     prints lines 1 to 40
alias '..'="cd .."
alias md="mkdir"
alias m="makeAndMoveToDir"
alias cat="simpleBat"

simpleBat() {
  batcat "$1" -p
}

#Define a function to make a directory and move to it
makeAndMoveToDir() {
  mkdir "$1"
  cd "$1"
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
source "$HOME/.cargo/env"
