# postgre 日常使用语法

### -进入命令行  
1.切换到postgres用户    
```bash
sudo -i -u postgres
```
2.进入psql命令行  
```bash
执行 psql 命令
```

### -查看数据库  
```
\l  请注意是L的小写，不是数字1
```

### -切换数据库  
```bash
\c database
```

### -查看有哪些表 
```bash
\d
```

### -查看某张具体的表  
```bash
\d tablename
```

### -查看建表语句
```
pg_dump -U postgres -W -d test -t company -s
简单解释：
-U username
-W 输入密码
-d databse 
-t tablename
-s only_schema
```  

### -创建主键自增的表  
```
CREATE TABLE public.company (
    id serial PRIMARY KEY,
    name text NOT NULL,
    age integer NOT NULL,
    address character(50),
    salary real,
    join_date date
);

```