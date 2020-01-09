#! /usr/bin/awk -f
# generate_slices.awk

# A synodic month is:         29.530588 Days  (avg)
#                            708.734112 Hours
#                         42,524.04672  Minutes
#            SECONDS=2551442.8032

function generate_slices(init, steps,   step, t, i){

    t = mktime(init)
    # output format
    # 5/28/1900&time=05:13:03.123
    # print strftime("%d/%m/%Y$time=%H:%M:%S", t)

    step = 2551442.8032 / steps

    for(i=0; i<steps; i++){
        t += step
        print strftime(USNO "%m/%d/%Y&time=%H:%M:%S", t)
    }
}


BEGIN {
    # base IRL for api call
    USNO=" http://api.usno.navy.mil/imagery/moon.png?date="
    # 07:05:14.428032   time step, for 100 steps
    # 29:31:50.12       time step, for  24 steps
    # 25:18:42.96       time step, for  28 steps
    # step = 7*3600 + 5*60 + 4.428032

    # inital new moon   2018 Mar 17 13:12:00	# :00.000662

    if(! steps)
	steps = 100

    generate_slices("2018 03 17 13 12 00", steps, step)
}


# New Moon 	2018 Mar 17 13:12
# New Moon 	2018 Apr 16 01:57   less 07:05:14.428032  is Apr 15  ~18:50
