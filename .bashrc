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

function EN
{
   #r="/home/richard/Documents/2do\ Semestre/C++\ _Opengl_python/C++/cpp/exp1/main"
   #nr=${#r}
   #p=`pwd`
   #np=${#p}
   #rr=${r:np:nr-np}
   #echo $rr
   ~/home/richard/Documents/main
}

function E
{
    firefox https://www.profellow.com https://dssg.uchicago.edu/ http://web.cs.toronto.edu/home.htm http://eecs.umich.edu/eecs/graduate/phd-description.html http://www.ml.cmu.edu/academics/ml-phd.html &
}

function N
{
    firefox http://money.cnn.com https://www.kiplinger.com https://www.thestreet.com/ https://www.marketwatch.com/ https://seekingalpha.com/ https://www.bloomberg.com/ https://www.forbes.com/#13b7e2c82254 https://www.nytimes.com https://www.mymoney.gov https://www.reuters.com/ https://www.bloomberg.com/businessweek https://www.wsj.com/europe https://www.ft.com/world https://www.marketwatch.com/ https://www.economist.com/ https://www.alphagamma.eu/finance/best-finance-websites/ &
}

function I
{
    d=`date`
    s=${d:4:3}"_"
    s=$s${d:8:3}
    fo="0"
    echo $s
    f_remoto=($(ls /home/richard/Documents/Ideas/))
    n=${#f_remoto[@]}

    for (( i=0; i < $n; i++ )); do
        nf=${f_remoto[${i}]}        
        echo ${nf:10:6}
        if [ "${nf:10:6}" == $s ]
        then            
            vim /home/richard/Documents/Ideas/$nf
            fo="1"
            echo "found"
        fi
    done 

    echo $fo
    re=""
    if [ $fo == "0" ]
    then
        for (( i=0; i < 28; i++ )); do
            if [ "${d:i:1}" == " " ]    #Imporant "${}"
            then            
                re=$re"_"
            else            
                re=$re${d:i:1}
            fi
        done
        
        re="ideas_"$re
        touch /home/richard/Documents/Ideas/"$re".txt
        vim /home/richard/Documents/Ideas/$re.txt
    fi
    
   


    #. /home/richard/Documents/Ideas/options.sh
}

function L
{

    d=`date`
    s=${d:4:3}"_"
    s=$s${d:8:3}
    fo="0"
    f_remoto=($(ls /home/richard/Documents/Learning/))
    n=${#f_remoto[@]}

    for (( i=0; i < $n; i++ )); do
        nf=${f_remoto[${i}]}        
        if [ "${nf:13:6}" == $s ]
        then            
            vim /home/richard/Documents/Learning/$nf
            fo="1"
        fi
    done 

    re=""
    if [ $fo == "0" ]
    then
        for (( i=0; i < 28; i++ )); do
            if [ "${d:i:1}" == " " ]    #Imporant "${}"
            then            
                re=$re"_"
            else            
                re=$re${d:i:1}
            fi
        done        
        re="learning_"$re
        touch /home/richard/Documents/Learning/"$re".txt
        vim /home/richard/Documents/Learning/$re.txt
    fi
    
}


function budget
{   
    echo "                                                  Personal Finance                           "
    echo "                                                                                             "
    echo "         ==========================                                                          "
    echo "                   Food                                                                      "
    echo "         ==========================                                                          "
    echo "                                                                                             "
    echo " Breakfast:   s/1.0 bread + s/.1.0 Kiwicha  =   s/2.0  "
    echo " Lunch:                                     =   s/6.0  "
    echo " Dinner:      s/0.30 te                     =   s/0.0  "

    echo "         ==========================                                                          "
    echo "                   Movility                                                                  "
    echo "         ==========================                                                          "
    echo "                                            =   s/0.0                                        "
    
    echo "         ==========================                                                          "
    echo "                  Rent "
    echo "         ==========================                                                          "
    echo "                                                                                             "
    echo " Departament  s/450.0                                                                        "
}


function motivation
{
    clear
    echo "                                                             Simplify                        "
    echo "                                                           Divide Parts                      "
    echo "                                                             Summary                         "
    echo "                   simplify                             Necessary to approve           simplify          "
    echo "                                              Recommendation to people to know about topic   - simplify  "
    echo "                    simplify  simplify                   simplify            simplify         simplify "
    echo "                                                Simplify                    simplify                    "
    echo "                                                Simplify                    simplify                    "
    echo "                                                Simplify                    simplify                    "
    echo "                                                Simplify                    simplify                    "
    echo "                                                Simplify                    simplify                    "
    echo "                                                Simplify                    simplify                    "
    echo "                                                Simplify                    simplify                    "
    echo "                                                Simplify                    simplify                    "
    echo "                                                                                                        "
    echo "                                                                                                        "
    echo "                                                                                                        "
    echo "                                              Diagrams                                                  "
    echo "                                                                                         Diagrams       "
    echo "                                                                                                        "
    echo "                                                                                                        "
    echo "                                                                                                        "
    echo "                                                                                                        "
}

function t
{
    clear 
    d=`date`
    day=${d:9:1}
    due[1]=30
    due[2]=18
    due[3]=18
    due[4]=11
    due[5]=12
    echo $d
    echo $((due[1]-day))

    # P_priorities[3]
    # P_Porcentage[3]
    # T_priorities[1]
    # T_porcentage[1]
      
    echo "                                                                                           "
    echo "                                                                                           "
    echo "                                                                                           "
    echo "                                                                                           "
    echo "                                                                                           "
    echo "                                                                                           "
    echo "                                                                   RichardYantas5          "
    echo "                                                                                           "
    echo "                                                                                           "
    echo "                                                         =================================="
    echo "                                                                     Projects              "
    echo "                                                         =================================="
    echo "                                                                                           "  
    echo "                                                                                           " 
    echo -ne "                      *  Procedural Urban Networks Pt1                     "
    printf "[▇                ]  5%%        $((due[1]-day)) Days         Due Date ${due[1]}/01/18       \n"
    echo -ne "                      *  Machine Translation using RNN                     " 
    printf "[                 ]  0%%        $((due[2]-day)) Days         Due Date ${due[2]}/01/18       \n"
    echo "                                                                                           "
    echo "                                                                                           " 
    echo "                                                                                           " 
    echo "                                                         =================================="
    echo "                                                                      Tasks                "
    echo "                                                         =================================="
    echo "                                                                                           " 
    echo "                                                                                           " 
    echo -ne "                      *  Terrain Rendering                                 "  
    printf "[                 ]  0%%        $((due[3]-day)) Days        Due Date ${due[3]}/01/18       \n"
    echo -ne "                      *  make a summary for 3 papers                       "
    printf "[                 ]  0%%        $((due[4]-day))  Days        Due Date ${due[4]}/01/18       \n"
    echo -ne "                      *  Fast Fourier Transformation                       "
    printf "[                 ]  0%%        $((due[5]-day)) Days        Due Date ${DUE[5]}/01/18"
    echo "                                                                                           " 
    echo "                                                                                           " 
    echo "                                                                                           " 
    echo "                                                                                           " 
    echo "                                                                                           " 

    echo "                                                         =================================="
    echo "                                                                      Optimal              "
    echo "                                                         =================================="
    echo "                                           Ideas                                           "
    echo "                                           *****                                           "
    echo "                                                                                           "
    echo "                                           Talk with Alex about the possibility to give up the master because I don't have money"
    echo "                                           Let's start the workshop of English and Maths , Programming "    
    echo "                                           Programming for yourself not for a Job,It will be more useful in their lives"
    echo "                                           Learning                                        "
    echo "                                           ********                                        "
    echo "                                           https://lefticus.gitbooks.io/cpp-best-practices/content/04-Considering_Safety.html"
    echo "                                           "
    echo 
    echo "                                           Important                                       "
    echo "                                           *********                                       "
    echo "                                           http://rics.ucsp.edu.pe/mcs/    -> 15 de enero(inicio) , Miércoles 04(cierre)                 "
    echo "                                           https://mscs.mum.edu/brochure-request.html      "
    echo "                                           "
    echo "                                                                                           "
    echo "                                           Activities to do                                "
    echo "                                           ****************                                "
    echo "                                           https://askubuntu.com/questions/412477/mount-remote-directory-using-ssh"    
    echo "                                           Implement to download youtube videos automatically"
    echo "                                           Implement pass files from my laptop to my computer and computer to laptop very fast"
    echo "                                           maybe share files with ssh"
    echo "                                           Develop explanation videos like 3blue1Brown about solution to peruvian problems (Domain of science)"
    echo "                                           WebSites to read - open with firefox            "    
    echo "                                           ************************************            "    
    echo "                                           Implement a links open to firefox about topics: "      
    echo "                                           1. Financial times   -> (Financial)               "       
    echo "                                           2. Gestion.pe           -> (Financial)"
    echo "                                           3. NYSE              -> (The New York Sockt Exchange)"     
    echo "                                           4. Reuters,com                                            "
    echo "                                           5.  "

    echo "                                           Health "
    echo "                                           ****** "
    echo "                                           1. Brocolli Yogurt "
    echo "                                           2. Carrot, Green Apple and Celery Juice"
    echo "                                           3. Lemon with Wather hot"
    echo "                                           4. Lentis with potatoes"
    echo "                                           5. Wheat Bread "
    echo "                                           Events, Schollarships, fellowships and congresses with Due Date"
    echo "                                           *************************************************"
    echo "                                           Events Scholarships - universities "
    echo "                                          "
      
}


function o
{
    clear
    echo "              "
    echo "                    "
    echo "                    "
    echo "                    "
    echo "                    "
    echo "                    "
    echo "                                                                    RichardYantas5"
    echo "                    "
    echo "                    "
    echo "                    "
    echo "                                                                Switch Project with (s)"
    echo "                                                                  Choose the option:"

    echo "                    "
    echo "                                                           _______________________________"
    echo "                                                          |                               |"
    echo "                                                          |    1. Sistemas Inteligentes   |"  
    echo "                                                          |    2. Computacion Grafica     |"
    echo "                                                          |    3. Vision Computacional    |"
    echo "                                                          |    4. Learning                |"
    echo "                                                          |    5. cpp                     |"
    echo "                                                          |    6. Saytana                 |"
    echo "                                                          |_______________________________|"
    echo "                         "
    echo "                         "
    echo "                         "
    echo "                         "
    echo "                         "
    echo "                         "
    echo "                         "
    echo "                         "
}

function s
{
    echo $1

    if [ $1 -eq 1 ]
    then        
        cd /home/richard/Documents/2do_Semestre/Sistemas_Inteligentes/ #&& subl .           
        #tmux 
    elif [ $1 -eq 2 ]
    then
        cd /home/richard/Documents/2do_Semestre/Computacion_Grafica/
    elif [ $1 -eq 3 ]
    then 
        cd /home/richard/Documents/2do_Semestre/Vision_Computacional/
    elif [ $1 -eq 4 ]
    then
        cd /home/richard/Documents/Learning
        ./options.sh        
    elif [ $1 -eq 5 ]
    then 
        cd /home/richard/Documents/2do_Semestre/C++_Opengl_python/C++/cpp
    elif [ $1 -eq 6 ]
    then 
        cd /home/richard/Documents/saytana/SAYTANA\ 2018/SAYTANA/saytana
    else
        cd /home/richard/Documents/2do_Semestre/
    fi
}

alias open='gnome-open'
alias p='xdg-open'
#export PS1='\u@\H:\W$ '
#export PS1="\e[0;31m[\u@\h \W]\$ \e[m "

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u\[\033[01;30m\]@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$'


