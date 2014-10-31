#! bin/sh

#M=12
#D=31


#for((i=0;i<"$M";i++))
# do 
 # for((j=0;j<"$D";j++))
  #  do

        #if[$i -lt 10];then
          # bi  = "0$i"     
          # echo "alter table ads_click add  partition(dt=20140$i$j) location '/activeMQtest/adsQueue/2014/$i/$j';"  >> test.sql
        #fi


   # done
# done

sh printday.sh 20140101 365

sh $HIVE_HOME/bin/hive < test.sql

