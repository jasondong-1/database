--data_con_db 替换为你们对应的db名称
-----------------------------------------------------------------------------
-- DDL for UserDefinedDatatype 'data_con_db.domain_appid'
-----------------------------------------------------------------------------

print '<<<<< CREATING UserDefinedDatatype - "data_con_db.domain_appid" >>>>>'
go

use data_con_db
go

IF EXISTS (SELECT 1 FROM data_con_db.dbo.systypes WHERE name = 'domain_appid')
BEGIN
	setuser 'dbo'
	exec sp_droptype 'domain_appid'

END
go

IF (@@error != 0)
BEGIN
	PRINT 'Error CREATING UserDefinedDatatype data_con_db.domain_appid'
	SELECT syb_quit()
END
go

SETUSER 'dbo'
go

exec  sp_addtype 'domain_appid' , 'numeric(15,0)' , null
go

SETUSER
go



-----------------------------------------------------------------------------
-- DDL for UserDefinedDatatype 'data_con_db.domain_graph'
-----------------------------------------------------------------------------

print '<<<<< CREATING UserDefinedDatatype - "data_con_db.domain_graph" >>>>>'
go

use data_con_db
go

IF EXISTS (SELECT 1 FROM data_con_db.dbo.systypes WHERE name = 'domain_graph')
BEGIN
	setuser 'dbo'
	exec sp_droptype 'domain_graph'

END
go

IF (@@error != 0)
BEGIN
	PRINT 'Error CREATING UserDefinedDatatype data_con_db.domain_graph'
	SELECT syb_quit()
END
go

SETUSER 'dbo'
go

exec  sp_addtype 'domain_graph' , 'image' , null
go

SETUSER
go



-----------------------------------------------------------------------------
-- DDL for UserDefinedDatatype 'data_con_db.domain_resourcetype'
-----------------------------------------------------------------------------

print '<<<<< CREATING UserDefinedDatatype - "data_con_db.domain_resourcetype" >>>>>'
go

use data_con_db
go

IF EXISTS (SELECT 1 FROM data_con_db.dbo.systypes WHERE name = 'domain_resourcetype')
BEGIN
	setuser 'dbo'
	exec sp_droptype 'domain_resourcetype'

END
go

IF (@@error != 0)
BEGIN
	PRINT 'Error CREATING UserDefinedDatatype data_con_db.domain_resourcetype'
	SELECT syb_quit()
END
go

SETUSER 'dbo'
go

exec  sp_addtype 'domain_resourcetype' , 'numeric(9,0)' , null
go

SETUSER
go


