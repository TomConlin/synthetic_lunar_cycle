#! /usr/bin/gawk -f

function abb2month(a){
    return int((index("JanFebMarAprMayJunJulAugSepOctNovDec",a)+3)/3)
}

# New Moon 	2018 Jan 17 02:17
BEGIN{
    lastmoon = mktime("2018 1 17 2 17 0")
}

/^New/{
    split($6, a, ":")
    if(length(a)<3)a[3]=0
    dtst = $3 " " abb2month($4) " " $5 " " a[1] " " a[2] " " a[3]    
    thismoon = mktime(dtst)
    print(strftime("%Y %b %d %H:%M:%S",lastmoon) "\t" (thismoon-lastmoon) / 86400 - 29.530588)
    lastmoon = thismoon
}

# ./newmoon_date_len.awk 2018qdates.txt 
# 2018 Jan 17 02:17:00	-29.5306
# 2018 Jan 17 02:17:00	0.252745
# 2018 Feb 15 21:05:00	0.0992731
# 2018 Mar 17 13:12:00	0.000662    <-- minimium in this set
# 2018 Apr 16 01:57:00	-0.120171
# 2018 May 15 11:48:00	-0.200727
# 2018 Jun 13 19:43:00	-0.235449
# 2018 Jul 13 02:48:00	-0.231977
# 2018 Aug 11 09:58:00	-0.195171
# 2018 Sep 09 18:01:00	-0.123644
# 2018 Oct 09 03:47:00	0.0214953
# 2018 Nov 07 16:02:00	0.106912
