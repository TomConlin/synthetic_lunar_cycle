#! /usr/bin/awk -f
# generate_slices.awk

function generate_slices(init, t, i){
    t = mktime(init)
    # output format
    # 5/28/1900&time=05:13:03.123
    # print strftime("%d/%m/%Y$time=%H:%M:%S", t)
    for(i=1; i<=100; i++){
        t += step
        print strftime(USNO "%m/%d/%Y&time=%H:%M:%S", t)
    }
}

BEGIN{
    # base IRL for api call
    USNO=" http://api.usno.navy.mil/imagery/moon.png?date="
    # 07:05:14.428032   time step, for 100 steps
    step = 7*3600 + 5*60 + 4.428032
    # inital new moon   2018 Mar 17 13:12:00	0.000662
    generate_slices("2018 03 17 13 12 00")
}

# New Moon 	2018 Mar 17 13:12
# New Moon 	2018 Apr 16 01:57   less 07:05:14.428032  is Apr 15  ~18:50
