#!/bin/sh

rm test.sql

begin=$1
end=`/bin/date -d $1+$2day "+%Y%m%d"`
n=$begin
#l=$begin
l=`/bin/date -d $begin "+%Y/%m/%d"`


while [ $n -le $end ]; do
    #echo $n
    echo "ALTER TABLE ads_click DROP PARTITION (dt='$n');" >> test.sql
    echo "alter table ads_click add  partition(dt=$n) location '/activeMQtest/adsQueue/$l';"  >> test.sql


    echo "ALTER TABLE ads_user  DROP PARTITION (dt='$n');" >> test.sql
    echo "alter table ads_user  add  partition(dt=$n) location '/activeMQtest/adsUserQueue/$l';"  >> test.sql


    echo "ALTER TABLE ads_zhb  DROP PARTITION (dt='$n');" >> test.sql
    echo "alter table ads_zhb  add  partition(dt=$n) location '/activeMQtest/adsZHBQueue/$l';"  >> test.sql


    n=`/bin/date -d $n+1day "+%Y%m%d"`
    l=`/bin/date -d $l+1day "+%Y/%m/%d"`
done


