#!/bin/sh

begin=$1
end=`/bin/date -d $1+$2day "+%Y%m%d"`
n=$begin
l=`/bin/date -d $begin "+%Y/%m/%d"`
table_list=log_tbl
partition_path=/BA/data/crm_log/LOG_TBL/
dump_sql=$table_list.sql

rm -rf $dump_sql

while [ $n -le $end ]; do
    echo "ALTER TABLE $table_list DROP PARTITION (log_date='$n');" >> $dump_sql
    echo "alter table $table_list add  partition(log_date='$n') location '$partition_path/$l';"  >> $dump_sql

    n=`/bin/date -d $n+1day "+%Y%m%d"`
    l=`/bin/date -d $l+1day "+%Y/%m/%d"`
done


