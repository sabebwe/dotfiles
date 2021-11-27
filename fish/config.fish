if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting ""
    # theme
   set -g theme_color_scheme terminal-dark
   set -g fish_prompt_pwd_dir_length 1
   set -g theme_display_user yes
   set -g theme_hide_hostname no
   set -g theme_hostname always

   # aliases
   alias ls "ls -p -G"
   alias la "ls -A"
   alias ll "ls -l"
   alias lla "ll -A"
   alias g git

   if type -q exa
     alias ll "exa -l -g --icons"
     alias lla "ll -a"
   end

   if type -q bat
     alias cat "bat"
   end

   command -qv nvim && alias vim nvim

   set -gx EDITOR nvim

   set -gx PATH bin $PATH
   set -gx PATH ~/bin $PATH
   set -gx PATH ~/.local/bin $PATH

   # NodeJS
   set -gx PATH node_modules/.bin $PATH

   # NVM
   function __check_rvm --on-variable PWD --description 'Do nvm stuff'
     status --is-command-substitution; and return

     if test -f .nvmrc; and test -r .nvmrc;
       nvm use
     else
     end
   end

   set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
   if test -f $LOCAL_CONFIG
     source $LOCAL_CONFIG
   end
end
