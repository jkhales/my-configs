# Set up the prompt
PATH=/home/shane/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
alias sage="~/Software/sage/sage "
alias sound="alsamixer"
#autoload -Uz promptinit
#promptinit
#prompt adam1

#setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias sagi='sudo apt-get install'
	alias cp='cp -i'
	alias mv='mv -i'
	alias rm='rm -i'

setopt correctall

autoload -U colors && colors

##PROMPT="%(?.%{$fg[magenta]%}.%{$fg[red]%})%T %{$fg[cyan]%}"
PROMPT="%(?.%{$fg[red]%}.%{$fg[magenta]%})■ %{$fg[cyan]%}"
#
#PROMPT="$fg[blue]%~ $fg[green]"
precmd ()
{
#echo '\e[0;36m\c'
#history -1 | sed 's/^ [0-9][0-9]*  //'
case $? in
	#0) RPROMPT="%{$fg[yellow]%}`/home/shane/bin/jspeak typ`, Sir %{$fg_bold[blue]%}%~ %{$reset_color%}%{$fg[cyan]%}";;
	0) RPROMPT="%{$fg_bold[blue]%}%~ %{$reset_color%}%{$fg[cyan]%}";;
	#*) RPROMPT="%{$fg[yellow]%}`jspeak err`, Sir %{$fg_bold[blue]%}%~ %{$reset_color%}%{$fg[cyan]%}";;
	*) RPROMPT="%{$fg_bold[blue]%}%~ %{$reset_color%}%{$fg[cyan]%}";;
esac
}

preexec ()
{
#clear
echo '\e[0;32m\c'
}

#PROMPT='[%* on %D]'

export EDITOR="vim"
##export PS1='\[\033[0;36m[\A \w]\$ \e[m\]'
#colour="\e[m\e[0;32m"
#PROMPT="\`if [[ \$? = "0" ]]; then echo "\\[\\033[36m\\]"; else echo "\\[\\033[31m\\]"; fi\`\A \w\$ \\[\\033[36m\\]\$(jeeves $?) \[\e[m\e[0;32m"\\]'"
##PROMPT_COMMAND='PS1="`if [[ \$? = "0" ]]; then echo "\e[0;36m[\A \w]\$ \e[m"; else echo "\e[0;31m[\A \w]\$ \e[m"; fi\`"'

echo "$fg[yellow]\c"
cal
rem | grep -v "^$" | tail -n +2 | sed 's/.*[^:]$/- &/g' 
echo
MAIL=/home/shane/mail/inbox && export MAIL

alias emid="grep "@" | sed 's/.*[|, ]\([a-zA-Z0-9_\.]*@[a-zA-Z0-9_]*\.[a-zA-Z0-9_\.]*\)[|, ].*/\1/'"
alias normalscreen="xrandr --output LVDS1 --mode 1280x800"
alias track="chromium-browser https://tools.usps.com/go/TrackConfirmAction?qtc_tLabels1=9449010200793324598548"
alias week="rem -cuc+1"
alias week2="rem -cuc+2"
alias repeattube='chromium-browser $(xclip -o|sed 's/you\.be/yourepeat/')'
alias radio="mplayer -idle -input file=/home/shane/mplayer_fifo -playlist"
alias mplayerd="screen -d -m mplayer -idle -input file=/home/shane/mplayer_fifo"
alias pause='echo "pause" > mplayer_fifo'
alias shutup='echo "stop" > mplayer_fifo'
alias prev='echo "pt_step -1" > mplayer_fifo'
alias next='echo "pt_step 1" > mplayer_fifo'
alias shot='echo "screenshot 0" > mplayer_fifo'
alias playing="less /dev/shm/current.pls"
alias news="echo 'loadlist /home/shane/Music/bbcnews.pls 0'>/home/shane/mplayer_fifo"
alias refresh="source ~/.zshrc"
alias caps2esc="xmodmap .capsesc"
alias refresh="source /home/shane/.zshrc"
alias fa='find -maxdepth 2 -type f -iname \*.mp3 | sort > playlist.pls'
alias work='current="mainproof"; (gvim ~/work/$current.tex; zathura ~/work/$current.pdf)&'
alias dim="xbacklight -20"
alias bright="xbacklight +20"
alias wakeup="killall centerim;cp /home/shane/Dropbox/centerimconfig /home/shane/.centerim/config; screen -d -m centerim"
alias ouch="dim; dim; dim"
alias getlost="killall centerim"

xkcd(){ wget -qO- http://xkcd.com/|tee >(feh $(grep -Po '(?<=")http://imgs[^/]+/comics/[^"]+\.\w{3}'))|grep -Po '(?<=(\w{3})" title=").*(?=" alt)';}
call(){echo $1 | xclip; cat call.macro | xmacroplay :0}
hunt(){grep -i "$1" /home/shane/Databases/moleskines | grep -i "$2" | grep -i "$3" | grep -i "$4" | grep -i "$5" | grep -i "$6" | grep -i "$7" | grep -i "$8" | grep -i "$9";}
click(){(sleep $1; import -window root $2)&}
later(){(sleep $(echo "$1*60" | bc -l); notify-send "$2 $3 $4 $5 $6 $7 $8 $9")&}
mu()
	{
	pgrep mplayer>/dev/null	
	if [ $? = 0 ];
	then ;
		else screen -d -m mplayer -idle -input file=/home/shane/mplayer_fifo;
	fi
	case $1 in
		pl*) echo "loadfile \"${PWD}/$2\"">/home/shane/mplayer_fifo;;
		ad*) echo "loadfile \"${PWD}/$2\" 1">/home/shane/mplayer_fifo;;
		*/*.pls) echo "loadlist \"${PWD}/$1\" 1">/home/shane/mplayer_fifo;ln -f -s ${PWD}/$1 /dev/shm/current.pls;;
		*/*) echo "loadfile \"${PWD}/$1\" 1">/home/shane/mplayer_fifo;;
		ra*) echo "loadlist \"${PWD}/$2\" 0">/home/shane/mplayer_fifo;;
		pa*) echo "pause">/home/shane/mplayer_fifo;;
		vo*) echo "volume $2 1">/home/shane/mplayer_fifo;;
		*) echo "$1 $2 $3">/home/shane/mplayer_fifo;;
	esac;
	}
skip(){echo "pt_step $1" > mplayer_fifo}
direct(){w3m -dump "http://maps.google.com/maps?f=d&source=s_d&saddr=$(echo $1 | sed 's/  */+/g')&daddr=$(echo $2 | sed 's/  */+/g')&pw=2" |grep "●\|^ *total\|^ *About"}

	#if [ "$TERM" != "screen" ]; then
	#	exec /usr/bin/screen
	#fi
	#
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

export PERL_LOCAL_LIB_ROOT="/home/shane/perl5";
export PERL_MB_OPT="--install_base /home/shane/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/shane/perl5";
export PERL5LIB="/home/shane/perl5/lib/perl5/i686-linux-gnu-thread-multi-64int:/home/shane/perl5/lib/perl5";
export PATH="/home/shane/perl5/bin:$PATH";

calc(){ awk "BEGIN{ print $* }" ;}
#pgrep dropbox>/dev/null
#if [ $? = 0 ];
#then ;
#	else dropbox start;
#fi
bindkey "^R" history-incremental-search-backward
rem |tail --lines=+2| grep -v '^ *$'| sed 's/^/-/'>/tmp/reminders
