#!/bin/bash
set -e

# create a stencil image

orig=${1##*/}

anytopnm out/$orig |ppmtopgm > img.pnm
pamgauss 5 5 -sigma=.7 -tupletype=GRAYSCALE < img.pnm | pnmconvol -nooffset - img.pnm > mask

pnmsmooth  img.pnm|pammasksharpen mask|pnmgamma|pnmnorm| pnminvert| pamthreshold|pamtopnm| pbmclean| pnmtopng > stencil/$orig
anytopnm stencil/$orig | potrace -s --flat >  svg/${orig%%.png}.svg

rm img.pnm mask
