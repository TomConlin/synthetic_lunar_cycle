#!/bin/bash

anytopnm out/025.png |pnmgamma |pnminvert |potrace -s - > 025.svg


# gs -dNOPAUSE -sDEVICE=bmp16m -r300 -sOutputFile=$1.bmp $1.pdf -c quit
# potrace -b svg -r 300 -t 5 -O 0.4 $1
# rm $1.bmp
