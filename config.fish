bass source ~/.bashrc

set -U fish_key_bindings fish_default_key_bindings

# Autojump
source /usr/share/autojump/autojump.fish

# Fuck
thefuck --alias | source

alias l='ll'
alias lx='latexmk'
alias p='python'
alias ipy='ipython'

# git aliases
alias add='git add'
alias addu='git add -u'
alias adu='git add -u'
alias commit='git commit'
alias branch='git branch'
alias merge='git merge'
alias pull='git pull'
alias push='git push'
alias st='git status'
alias bye='exit'
alias cdl='cd ~/git'
alias tmux='tmux -u'
alias pad='pueue add --'
alias pst='pueue status'

function c
	cd $argv
	ll
end

set -gx SHELL /usr/bin/fish

set -gx PATH ~/bin ~/.local/bin /home/arne/.gem/ruby/2.6.0/bin $PATH

set -x VISUAL vim
set -x PYTHONIOENCODING UTF-8
set -x LANG en_US.UTF-8

set -x KMP_WARNINGS false
set -x TF_CPP_MIN_LOG_LEVEL 3

set -x LN_PREFIX /usr/local
set -x LD_LIBRARY_PATH $LN_PREFIX/lib $LD_LIBRARY_PATH
set -x PYTHONPATH $LN_PREFIX/lib/python2.7/site-packages $PYTHONPATH

function concat_stapler
    echo cat
    set c 0
    for f in $argv
        if test $f = 'blank.pdf'
            continue
        end
        echo $f
        set pages (pdfinfo "$f" | grep -aoP '^Pages:\s*\K\d+')
        set odd (math "$pages%2")
        if test $odd -eq 1
            echo "blank.pdf"
        end
    end
    echo all.pdf
end

function concat
    if [ ! -e blank.pdf ]
        convert xc:none -page A4 blank.pdf > /dev/null
    end
    concat_stapler $argv | xargs stapler
end

function gcd
        cd (git rev-parse --show-cdup)
end

function shrinkpdf
    gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -sOutputFile=_small.pdf $argv[1]
    mv _small.pdf $argv[1]
end

function append
        stapler cat $argv[1] $argv[2] temp.pdf
        mv temp.pdf $argv[1]
end

