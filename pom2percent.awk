#! /usr/bin/awk -f
# pom2percent.awk <pomstring>

# The Moon [is | was | will be]
#   [New |Full |at the [First | Last] Quarter ] |
#   [[Waxing | Waning ]
#           [Gibbous | Crescent] 
#                (%1.0f%% of Full)
#   ]

/^The Moon is New/{print "000.png"}

/^The Moon is Waxing /{
    split($0,  p, "[%(]" )
    printf "%3.3i.png", p[2] / 2
}

/^The Moon is at the First Quarter/{print "024.png"}

/^The Moon is Full/{print "049.png"}

/^The Moon is at the Last Quarter/{print "074.png"}

/^The Moon is Waning /{
    split($0,  p, "[%(]" )
    printf "%3.3i.png", 100 - (p[2] / 2)
}

