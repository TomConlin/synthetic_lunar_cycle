#!/bin/bash
set -e

# create a stencil image3

orig=${1##*/}
radius=1

# alpha 
#   trimmed mean            (0.0 <= alpha <= 0.5)
#   estimation smoothing.   (1.0 <= alpha <= 2.0)
#   edge enhancement.       (-0.1 >= alpha >= -0.9)

#anytopnm out/$orig | pgmmedian |pgmenhance | pnmsmooth | pnmhisteq | pamedge|pnminvert| pamthreshold|pamtopnm| pbmclean| pnmtopng > stencil/$orig
anytopnm stencil/$orig | potrace -s --flat >  svg/${orig%%.png}.svg

