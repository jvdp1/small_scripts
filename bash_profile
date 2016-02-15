#.bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
if [ -f ~/.bash_intel ]; then
	. ~/.bash_intel
fi

PATH=$HOME/.local/bin:$HOME/bin:$HOME/progs/blupf90/bin:$HOME/progs/dmu/dmuv6/R5.1-EM64T/bin:$HOME/progs/pest_vce:$HOME/progs/wombat:$PATH

export PATH

export LD_LIBRARY_PATH=/home/jvandenp/projets/blup20120703/bin/:$LD_LIBRARY_PATH

ulimit -s unlimited
export OMP_NUM_THREADS=3
export MKL_NUM_THREADS=3
export KMP_STACKSIZE=1G


#For screen
if [ -f ~/.screen_lance ]; then
	. ~/.screen_lance
fi

