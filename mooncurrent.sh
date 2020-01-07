#! /bin/sh 
# mooncurrent.sh
HOME=/home/users/tomc
SRCDIR=$HOME/GitHub/synthetic_lunar_cycle
POMDIR=$HOME/bin
DSTDIR=$HOME/public_html/images 
CUR=$($POMDIR/pom | $SRCDIR/pom2percent.awk)

/bin/ln --force --no-dereference --symbolic $SRCDIR/out/$CUR $DSTDIR/moon.png
