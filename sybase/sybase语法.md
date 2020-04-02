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
