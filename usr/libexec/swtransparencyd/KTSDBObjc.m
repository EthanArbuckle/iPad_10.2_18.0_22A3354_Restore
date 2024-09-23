@implementation KTSDBObjc

- (id)initDatabaseWithURL:(id)a3
{
  id v4;
  KTSDBObjc *v5;
  const char *v6;
  int v7;
  KTSDBObjc *v8;
  os_log_t v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KTSDBObjc;
  v5 = -[KTSDBObjc init](&v11, "init");
  if (!v5)
    goto LABEL_11;
  v6 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation");
  if (v6)
    v7 = 6;
  else
    v7 = 134;
  v8 = 0;
  if (!sqlite3_open_v2(v6, &v5->_db, v7, 0))
  {
    v9 = os_log_create("KTSDBObjc", "db");
    -[KTSDBObjc setLog:](v5, "setLog:", v9);

    if (-[KTSDBObjc executeSQL:](v5, "executeSQL:", CFSTR("pragma journal_mode = WAL"))
      && (-[KTSDBObjc autoVacuumSetting](v5, "autoVacuumSetting") == 2
       || -[KTSDBObjc executeSQL:](v5, "executeSQL:", CFSTR("pragma auto_vacuum = incremental"))
       && -[KTSDBObjc executeSQL:](v5, "executeSQL:", CFSTR("VACUUM"))))
    {
      v8 = v5;
      goto LABEL_12;
    }
LABEL_11:
    v8 = 0;
  }
LABEL_12:

  return v8;
}

- (BOOL)executeSQLStmt:(id)a3
{
  return -[KTSDBObjc executeSQL:](self, "executeSQL:", CFSTR("%@"), a3);
}

- (BOOL)executeSQL:(id)a3
{
  uint64_t v4;

  return -[KTSDBObjc executeSQL:arguments:](self, "executeSQL:arguments:", a3, &v4);
}

- (BOOL)executeSQL:(id)a3 arguments:(char *)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  NSObject *v10;
  BOOL v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v6, a4);

  if (-[KTSDBObjc db](self, "db"))
  {
    v8 = sqlite3_exec(-[KTSDBObjc db](self, "db"), (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), 0, 0, 0);
    if (!v8)
    {
      v11 = 1;
      goto LABEL_8;
    }
    v9 = v8;
    v10 = objc_claimAutoreleasedReturnValue(-[KTSDBObjc log](self, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315394;
      v14 = sqlite3_errmsg(-[KTSDBObjc db](self, "db"));
      v15 = 1024;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sqlite3_exec: %s[%d]", (uint8_t *)&v13, 0x12u);
    }

  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (int)autoVacuumSetting
{
  int v3;
  int v4;
  NSObject *v5;
  const char *v6;
  int v7;
  int v8;
  int v9;
  NSObject *v10;
  const char *v11;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;

  ppStmt = 0;
  v3 = sqlite3_prepare_v2(-[KTSDBObjc db](self, "db"), "PRAGMA auto_vacuum", -1, &ppStmt, 0);
  if (!v3)
  {
    v8 = sqlite3_step(ppStmt);
    if (v8 != 101)
    {
      v9 = v8;
      if (v8 == 100)
      {
        v7 = sqlite3_column_int(ppStmt, 0);
LABEL_12:
        sqlite3_finalize(ppStmt);
        return v7;
      }
      v10 = objc_claimAutoreleasedReturnValue(-[KTSDBObjc log](self, "log"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = sqlite3_errmsg(-[KTSDBObjc db](self, "db"));
        *(_DWORD *)buf = 136315394;
        v15 = v11;
        v16 = 1024;
        v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sqlite3_step: %s[%d]", buf, 0x12u);
      }

    }
    v7 = -1;
    goto LABEL_12;
  }
  v4 = v3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTSDBObjc log](self, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = sqlite3_errmsg(-[KTSDBObjc db](self, "db"));
    *(_DWORD *)buf = 136315394;
    v15 = v6;
    v16 = 1024;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "sqlite3_prepare_v2: %s[%d]", buf, 0x12u);
  }

  return -1;
}

- (void)close
{
  if (-[KTSDBObjc db](self, "db"))
    sqlite3_close(-[KTSDBObjc db](self, "db"));
  -[KTSDBObjc setDb:](self, "setDb:", 0);
}

- (void)dealloc
{
  objc_super v3;

  if (-[KTSDBObjc db](self, "db"))
    sqlite3_close(-[KTSDBObjc db](self, "db"));
  v3.receiver = self;
  v3.super_class = (Class)KTSDBObjc;
  -[KTSDBObjc dealloc](&v3, "dealloc");
}

- (id)prepareStatement:(id)a3 error:(id *)a4
{
  id v6;
  KTSDBStmt *v7;

  v6 = a3;
  v7 = -[KTSDBStmt initWithStatement:db:error:]([KTSDBStmt alloc], "initWithStatement:db:error:", v6, self, a4);

  return v7;
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

@end
