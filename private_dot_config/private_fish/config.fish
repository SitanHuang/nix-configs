alias t=task
set -gx EDITOR vim
set -gx LEDGER_FILE ~/Documents/journal.dat
#function fish_prompt
#  echo '[SitanHuang@localhost' (basename (string replace ~ '~' (pwd)))']$ '
#end

bass source ~/.bash_profile
alias ll="ls -lh"

alias lr="l --real"
#alias lra="l --real 'ass*|lia*' --hz --sum --tree=0"
alias la="ledg2 acc --hz --sp=false --tree=false -a '{asset,liability}*' --sum"
alias lpend="l info pending:true"

alias lra="ledg2 acc --hz --real --sp=false --tree=false -a '{asset,liability}*' --sum"

alias lburn='l query " --name Income -a {income}* --invert" " --name Expense -a {expense}*" --monthly -f "beginning of last year" -t "beginning of next month" --currency=\$ --vs txnDate --plot'

function lb
  l bs f:@min t:@max --interval=10000,0,0 --isofull --asset=\* $argv | \
  sed -e '1,4d' | head -n -5 | # trim start and end
  sed -e "s/\x1b\[4m//g" | # remove underline
  less -XR --quit-if-one-screen
end

