
## Fabricate images of the moon's illuminated precent

I have been fetching images from [USNO](http://api.usno.navy.mil/imagery/moon.png)
for decades now.  

I should give then a break by generating a set once and keeping them.  
I have looked around and not found anything I like better and most
actual photos I like less.

These images I like are synthetic,
USNO got data from [USGS](https://pdsmaps.wr.usgs.gov/maps.html)
which may be [moved here](https://astrogeology.usgs.gov/)
build a model and raytrace images on demand, this is why you can request
images from any time past present or future.  


My goal here is to get a regular set of images over one lunar cycle
labled so they may be reused as stunt doubles of other months.
Yes.  I will lose up to the moment accuracy, wrong slant on the terminator etc,
but will gain independence when USNO temporarily goes dark.
Also get a lunar cycle labled by percent which I can use in other projects.  


A synodic month is:      29.530588 Days  (avg)  
Multiply by 24.0 is:    708.734112 Hours  
Multiply by 60.0 is: 42,524.04672  Minutes  

If I made one hundred images (whole percents only) they
would be only meaningfully updated every seven hours or
several (3) times a day.

This is overkill in temporal resolution for my use which is
to notice if a good day for sidewalk astronomy is coming up soon.  
Sounds like a plan; 100 images.

Should be able to pick a date and time for a new moon and step
through 100 requests 7.08734112 hours apart.

0.08734112 hours times 60.0 is:  5.2404672 minutes 
0.2404672 minutes times 60 is:  14.428032 seconds

07:05:14.428032 is the time step

Using the image server at: [USNO](http://aa.usno.navy.mil/data/docs/diskmap.php)

API call looks like:

   http://api.usno.navy.mil/imagery/moon.png?date=5/28/1900&time=05:13:03.123

For the sake of pointless precision I woulds like to select a month
who's actual lenght is close to the average length of 29.530588 days.

It should not matter which month
get a list of new moons for 2018 from:
 
http://aa.usno.navy.mil/cgi-bin/aa_phases.pl?year=2018&month=1&day=1&nump=50&format=t

make  a script [`newmoon_date_len.awk`](newmoon_date_len.awk)
to find the actual lengths of each month and
subtract the length of our "average" month.  

- 2018 Jan 17 02:17:00	0.252745
- 2018 Feb 15 21:05:00	0.0992731
- 2018 Mar 17 13:12:00	0.000662    <-- minimium in this set
- 2018 Apr 16 01:57:00	-0.120171
- 2018 May 15 11:48:00	-0.200727
- 2018 Jun 13 19:43:00	-0.235449
- 2018 Jul 13 02:48:00	-0.231977
- 2018 Aug 11 09:58:00	-0.195171
- 2018 Sep 09 18:01:00	-0.123644
- 2018 Oct 09 03:47:00	0.0214953
- 2018 Nov 07 16:02:00	0.106912

Assuming they cache,  
months from the recent past may be quicker than months in the future.

2018 Mar 17 13:12:00  looks good enough

make a script [`generate_slices.awk`](generate_slices.awk) 
to generate queries against the api  
check that the last slice time is sane  
(it within tens of seconds over the month)


### Generate images

    mkdir out
    n=0
    for slice in $(./generate_slices.awk); do
        echo ${n} "\t" $slice;
        curl ${slice}>$(printf "out/%03i.png" ${n});
        ((n+=1));
        sleep 3;
    done


Looks good.

100 1024x1024 images

On my page I use 320x320  so, scale a set

first preserve originals and write protect
(the `mogrify` command will overwrite by default)


mkdir moon_320px
# 320/1024  == 0.3125

mogrify -scale 0.3125 -path ./moon_320px/  out/*.png 








convert -delay 10 -loop 0 out/*.png gif/lunarcycle.gif
