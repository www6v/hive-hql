#!/bin/sh

begin=$1
end=$2
n=$begin
ppath=/BA/data/crm_log/LOG_TBL_DEC/

rm -rf $dump_sql

while [ $n -lt $end ]; do
    echo "ALTER TABLE LOG_TBL_DEC DROP IF EXISTS PARTITION (log_date='$n');INSERT OVERWRITE DIRECTORY '$ppath/$n' select a.id     ,a.userid   ,a.MacAddr  ,if(b.deco is null,'--', b.deco) ,a.wifi     ,a.g3       ,a.cmnet    ,a.cmwap    ,a.mbtype   ,a.mbos     ,a.ver      ,a.ip       ,a.country  ,a.region   ,a.city     ,a.isp      ,a.flow     ,a.firstlogin,a.lastlogin,a.logintimes,a.onlinetime,a.fun1001  ,a.fun1002  ,a.fun1003  ,a.fun1004  ,a.fun1005  ,a.fun1006  ,a.fun1007  ,a.fun1008  ,a.fun1009  ,a.fun1010  ,a.fun1011  ,a.fun1012  ,a.fun1013  ,a.fun1014  ,a.fun1015  ,a.fun1016  ,a.fun1017  ,a.fun1018  ,a.fun1019  ,a.fun1020  ,a.fun1021  ,a.fun1022  ,a.fun1023  ,a.fun1024  ,a.fun1025  ,a.fun1026  ,a.fun1027  ,a.fun1028  ,a.fun1029  ,a.fun1030  ,a.fun1031  ,a.fun1032  ,a.fun1033  ,a.fun1034  ,a.fun1035  ,a.fun1036  ,a.fun1037  ,a.fun1038  ,a.fun1039  ,a.fun1040  ,a.fun1041  ,a.fun1042  ,a.fun1043  ,a.fun1044  ,a.fun1045  ,a.fun1046  ,a.fun1047  ,a.fun1048  ,a.fun1049  ,a.fun1050  ,a.fun1051  ,a.fun1052  ,a.fun1053  ,a.fun1054  ,a.fun1055  ,a.fun1056  ,a.fun1057  ,a.fun1058  ,a.fun1059  ,a.fun1060  ,a.fun1061  ,a.fun1062  ,a.fun1063  ,a.fun1064  ,a.fun1065  ,a.fun1066  ,a.fun1067  ,a.fun1068  ,a.fun1069  ,a.fun1070  ,a.fun1071  ,a.fun1072  ,a.fun1073  ,a.fun1074  ,a.fun1075  ,a.fun1076  ,a.fun1077  ,a.fun1078  ,a.fun1079  ,a.fun1080  ,a.fun1081  ,a.fun1082  ,a.fun1083  ,a.fun1084  ,a.fun1085  ,a.fun1086  ,a.fun1087  ,a.fun1088  ,a.fun1089  ,a.fun1090  ,a.fun1091  ,a.fun1092  ,a.fun1093  ,a.fun1094  ,a.fun1095  ,a.fun1096  ,a.fun1097  ,a.fun1098  ,a.fun1099  ,a.fun1100  from LOG_TBL a left outer join DecodeTBL b on a.UserName=b.enco where a.log_date=$n;alter table LOG_TBL_DEC add partition(log_date='$n') location '$ppath/$n';" |hive
    n=`/bin/date -d $n+1day "+%Y%m%d"`
done


