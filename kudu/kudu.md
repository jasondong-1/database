### -impala-shell 建kudu表
```
use database;
 CREATE TABLE testj12 (
   col1 STRING NOT NULL,
   col2 STRING NULL,
   col3 STRING NULL,
   col4 STRING NULL,
   PRIMARY KEY (col1)             
 )                                                                                      
 PARTITION BY HASH (col1) PARTITIONS 16                                                 
 STORED AS KUDU;
 
 master:8051 界面显示的表名是impala::database.tablename
```