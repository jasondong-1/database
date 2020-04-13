与mysql语法雷同
### 登入gbase
```
gccli -uuser -hhost -ppasswd
```

### 导出数据到本地 
```
rmt:select * from database.table into outfile '/path/to/file' fields terminated by '\t' null_value '';
```

### 导入数据
有的gbase版本只支持导入ftp文件,不支持导入本地文件 
```
LOAD DATA INFILE 'SFTP://操作系统用户:密码@10.7.6.112///目录/文件名' INTO TABLE 表名 DATA_FORMAT 3 FIELDS TERMINATED BY '分隔符' ;
```