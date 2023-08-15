alias t=task
set -gx EDITOR vim
set -gx LEDGER_FILE ~/Documents/journal.dat
#function fish_prompt
#  echo '[SitanHuang@localhost' (basename (string replace ~ '~' (pwd)))']$ '
#end

bass source ~/.bash_profile
alias ll="ls -lh"

alias lr="l --real"
alias lra="l --real 'ass*|lia*' --hz --sum --tree=0"
alias la="l 'ass*|lia*' --hz --tree=0 --sum"
alias lpend="l info pending:true"

function lb
  l bs f:@min t:@max --interval=10000,0,0 --isofull --asset=\* $argv | \
  sed -e '1,4d' | head -n -5 | # trim start and end
  sed -e "s/\x1b\[4m//g" | # remove underline
  less -XR --quit-if-one-screen
end

