#! /bin/sh 
# mooncurrent.sh
HOME=/home/users/tomc
SRCDIR=$HOME/GitHub/synthetic_lunar_cycle/out
POMDIR=$HOME/bin
DSTDIR=$HOME/public_html/images 
CUR=$(printf "%3.3i.png" $($POMDIR/pom|/bin/sed -n 's/.*(\([0-9]\+\)% .*)/\1/p')) 

/bin/ln --force --no-dereference --symbolic $SRCDIR/$CUR $DSTDIR/moon.png
