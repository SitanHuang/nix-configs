set -l l_commands edit accounts burndown close register history balancesheet\
       balancesheetequity cashflow incomestatement info tags add modify\
       delete budget print git eval stats count export help version

set -l l_options "--file= -F --light-theme --lt --csv --html --format= --transpose"\
       "--budget= --currency= --valuation-date= --valuation-eop --income= --expense="\
       "--equity= --asset= -i --confirm --alias- --real --q1 --q2 --q3 --abs"\
       "--count --cumulative --cml --account= --sort --invert --hide-zero --hz"\
       "--skip --cumulative-columns= --epoch --avg --isofull --iso --daily --weekly"\
       "--biweekly --monthly --quarterly --yearly --sum --skip-book-close --sbc"\
       "-% --percent --max-depth= --depth= --dep= --sum-parent --sp --tree --field="\
       "--date= -y --default-pending --add-tag= --remove-tag= --set-mod= --prices"\
       "--remove-mod= --do-not-adjust --simple --ler --show-default-currency"\
       "--prices-only --pad-spaces= --right --no-config --drop= --drop-cols="\
       "--drop-columns= --csv-no-quotes --include-prices= --balance-to-currency="\
       "--debug --do-not-write-books --do-not-write-config --rewrite --tc-prices=false"\
       "--tc-expose --timeclock --cleared --eop --source= --parser= --minhour="\
       "--maxhour= --period= -P --today= --squash= --no-comma --csv-delimiter="\
       "--min-depth= --mdep= --mdepth= --interval= --flat --help --version"

set -l l_modifiers "desc: description: uuid: f: from: t: to: bc: bookClose:"\
       "pending: virt: clockIn: clockOut:"


# disable file completions
complete -c l -f

# options
complete -c l -n "__fish_seen_subcommand_from $l_commands" \
    -a "$l_options $l_modifiers"

# root subcommands
complete -c l -n "not __fish_seen_subcommand_from $l_commands" \
    -a "$l_commands $l_options $l_modifiers"

# ======= level 2 subcommands =======
complete -c l -n "__fish_seen_subcommand_from accounts" \
    -a "add rename $l_options $l_modifiers"

complete -c l -n "__fish_seen_subcommand_from info" \
    -a "flat $l_options $l_modifiers"

complete -c l -n "__fish_seen_subcommand_from edit" \
    -a "new $l_options $l_modifiers"

complete -c l -n "__fish_seen_subcommand_from budget" \
    -a "edit list $l_options $l_modifiers"

complete -c l -n "__fish_seen_subcommand_from export" \
    -a "gnucash-transactions gnucash-accounts $l_options $l_modifiers"

complete -c l -n "__fish_seen_subcommand_from git" \
    -a "checkout add commit push pull merge cherry-pick $l_options $l_modifiers"
