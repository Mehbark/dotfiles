test="echo it works!"
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
alias c='cargo clippy || cargo check'
alias cw="cargo watch -c --poll -x 'clippy -- -W clippy::pedantic'"
alias cbr='cargo build --release'
alias crr='cargo run --release'
alias crd="cargo rustdoc"
alias cft="cargo fmt"

#general rust aliases
alias rft='rustfmt'

#git aliases
alias g="git"
alias gcs="batcat -p -l bash /home/mehbark/main/misc/gitCliCheatSheet.js"
alias gco="git checkout"
alias gb="git branch"
alias gc="git commit -m"
alias gst="git status"
alias ga="git add"
alias gp="git push"
alias gl='git log --oneline --graph --decorate --all'
alias gi='git init'

#more complex aliases
alias ri="git init; cargo init"
alias rn="new_cargo_quick"
alias ka="killall -r '.*'"

new_cargo_quick() {
  mkdir $1
  cd $1
  git init
  cargo init
}
