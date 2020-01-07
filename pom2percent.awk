#! /usr/bin/awk -f
# pom2percent.awk <pomstring>

# The Moon [is | was | will be]
#   [Full |at the [First | Last] Quarter ] |
#   [[Waxing | Waning ]
#           [Gibbous | Crescent] 
#                (%1.0f%% of Full)
#   ]

/^The Moon is Waxing /{  # 000-025
    split($0,  p, "[%(]" )
    printf "%3.3i.png", p[2] / 2
}

/^The Moon is at the First Quarter/{print "025.png"}

/^The Moon is Full/{print "050.png"}

/^The Moon is at the Last Quarter/{print "075.png"}

/^The Moon is Waning  /{
    ssplit($0,  p, "[%(]" )
    printf "%3.3i.png", p[2] / 2 + 50
}

