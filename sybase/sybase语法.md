# sybase 基本语法
### -进入命令行  
```
/opt/sybase/OCS-15_0/bin/isql64 -U username -P passwd -SASE
```

### -查看数据库
```
1> sp_helpdb
2> go
```

### -建表
```
> CREATE TABLE  test(
    T_ID             numeric(20) not null, 
    T_BIGINT      bigint null,
    T_UNSIGNED_BIGINT  unsigned bigint null,
    T_DECIMAL   decimal(10,5) null,
    T_MONEY    money null,
    T_SMALLMONEY smallmoney null,
    T_CHAR        char(20) null,
    T_UNICHAR  unichar(20) null,
    T_UNIVARCHAR  univarchar(20) null,
    T_SMALLDATETIME   smalldatetime null,
   T_TEXT    text null,
   T_UNITEXT  unitext null,
   T_IMAGE image null,
   T_BINARY binary(200) null,
   T_VARBINARY varbinary(200) null,
   T_BIT bit
)
>go
```

### -插入数据  
```
>DECLARE @a int
DECLARE @b int 
SET @a = 0 while @a<1
BEGIN
WAITFOR DELAY '00:00:01'
SET @b=1 while @b<=100
BEGIN
INSERT INTO test VALUES(@b+@a*100,
-1,333,123.45678,
$123.89,$45.67,
'zhongguo','zhengjiang','hangzhou',
getdate(),
'abcd中国浙江','大事发生大幅发发dfdf',
'image断电断电',
'0xabcd','0xfde',0)
set @b = @b+1
end
set @a = @a+1
end
>go
```

### -查看表 
```
>SELECT name FROM sysobjects WHERE type = 'U'
>go
```

### -查看表结构
```
>sp_help test
>go
```
### -查看client，server编码格式 
```
　　查看服务器端字符集： 
　　在isql环境中执行： 
　　1>; sp_helpsort 
　　2>; go 
　　查看客户端字符集： 
　　在isql环境中执行： 
　　1>; select @@client_csname 
　　2>; go 
```

### -为sybase安装新的编码格式  
```
cd /opt/sybase  #sybase安装目录，需切换导自己的目录
source SYBASE.sh #若不执行此命令，则charset命令找不到
#假设要安装utf8编码格式
cd /opt/sybase/charsets/utf8
执行命令：charset -U用户名 -P密码 -S服务名 binary.src 要安装字符集名
比如：charset -Usa -P  -Szxck binary.srt utf8
```

### -更改服务端编码格式
```
找到你要更改的编码格式名称对应的id，用下面语句查询：
>select name,id from master..syscharsets

比如修改为cp936，id为171

>sp_configure "default character set id",171
>go

重启server两次即可。
（注:第一次启动后，server会自动宕掉，需要第二次重启后才能使用
```

### -停止sybase服务 
```bash
cd /opt/sybase/ASE-15_0/install
./showserver
kill -9 pid
```

### -启动sybase 
```bash
cd /opt/sybase
source SYBASE.sh
cd /opt/sybase/ASE-15_0/install
./startserver -f RUN_ASE --f RUN_ASW_BS
```
### -更改client的默认编码格式
```
vim /opt/sybase/locales/locales.dat  #其中配置了各种系统的字符集，windows 为[NT],linux 为[linux]
修改带 default字样的行，比如
locale = default, us_english, cp936

经在linux下测试，如果linux系统设置的字符集LANG=utf8 ，则sybase客户端的编码格式也是utf8，如果
unset LANG，则client的编码格式会使用cp936
```

### -The transaction log in database xxx is almost full
日志写满了所导致的，解决方案有两种，
```
1.清楚日志
>DUMP TRANSACTION 你的数据库 WITH NO_LOG
>go
2.调大日志的容量，在建库时就分配较多日志容量
>disk init
name="log_device",
physname="/opt/sybase/tranlog/log.dat",
size = 512000
>go

>create database dbo
     on default=100
     log on log_device=50
>go
其中log_device=50中的50是百分比
```

### 创建带主键自增的表
```
CREATE TABLE dbo.old_new_bas_admin_district(
	id    bigint  identity,
	old_admin_district_id    numeric(15,0),
	new_admin_district_id    numeric(15,0)
)with identity_gap=1

with identity_gap=1 设置跳跃值为1
```


### sybase The 'select into' database option is not enabled for database 'your dbname'
修改表中字段长度时遇到上面错误，解决方法如下
```
use   master
go
sp_dboption 'your dbname','select into/bulkcopy/pllsort',true
go
```