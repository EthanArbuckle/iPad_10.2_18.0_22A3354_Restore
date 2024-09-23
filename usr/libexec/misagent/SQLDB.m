@implementation SQLDB

- (SQLDB)init
{

  return 0;
}

- (SQLDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  SQLDB *v8;
  SQLDB *v9;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *transactionSem;
  sqlite3 *db;
  BOOL v13;
  objc_super v15;

  v4 = a4;
  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SQLDB;
  v8 = -[SQLDB init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_url, a3);
    v10 = dispatch_semaphore_create(1);
    transactionSem = v9->_transactionSem;
    v9->_transactionSem = (OS_dispatch_semaphore *)v10;

    if (!v9->_transactionSem)
      goto LABEL_9;
    db = sub_10000A9FC(v9->_url, v4);
    v9->_db = db;
    if (!db)
      goto LABEL_9;
    if (v4)
    {
      v13 = 1;
    }
    else
    {
      -[SQLDB setupPermissions](v9, "setupPermissions");
      v13 = sub_10000AA90(v9->_db, 0);
      db = v9->_db;
    }
    v9->_readonly = v13;
    sqlite3_busy_timeout(db, 300000);
    if (!v9->_readonly)
    {
      -[SQLDB executeQuery:withBind:withResults:](v9, "executeQuery:withBind:withResults:", CFSTR("PRAGMA journal_mode = WAL"), 0, 0);
      -[SQLDB executeQuery:withBind:withResults:](v9, "executeQuery:withBind:withResults:", CFSTR("PRAGMA foreign_keys = ON"), 0, 0);
      if (!-[SQLDB setupSchema](v9, "setupSchema"))
      {
LABEL_9:

        v9 = 0;
      }
    }
  }

  return v9;
}

- (SQLDB)initWithDatabaseURL:(id)a3
{
  return -[SQLDB initWithDatabaseURL:asReadOnly:](self, "initWithDatabaseURL:asReadOnly:", a3, 0);
}

+ (id)databaseWithURL:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  int v9;
  id v10;

  v4 = a3;
  v5 = sub_10000757C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DB being loaded from %@", (uint8_t *)&v9, 0xCu);
  }

  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithDatabaseURL:", v4);
  return v7;
}

- (NSURL)walURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByDeletingLastPathComponent](self->_url, "URLByDeletingLastPathComponent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](self->_url, "lastPathComponent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-wal"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", v5));

  return (NSURL *)v6;
}

- (NSURL)shmURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByDeletingLastPathComponent](self->_url, "URLByDeletingLastPathComponent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](self->_url, "lastPathComponent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-shm"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", v5));

  return (NSURL *)v6;
}

- (BOOL)setupSchema
{
  unsigned int v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = -[SQLDB executeQuery:withBind:withResults:](self, "executeQuery:withBind:withResults:", CFSTR("CREATE TABLE IF NOT EXISTS settings(name TEXT, value TEXT, PRIMARY KEY (name))"), 0, 0);
  if (v2)
  {
    v3 = sub_10000757C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10000B708(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return v2 == 0;
}

- (void)setupPermissions
{
  id v2;

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_url, "path")));
  sub_10000AAAC((const char *)objc_msgSend(v2, "UTF8String"));

}

- (void)dealloc
{
  sqlite3 *db;
  objc_super v4;

  db = self->_db;
  if (db)
    sqlite3_close(db);
  v4.receiver = self;
  v4.super_class = (Class)SQLDB;
  -[SQLDB dealloc](&v4, "dealloc");
}

- (int)executeQuery:(id)a3 withBind:(id)a4 withResults:(id)a5
{
  id v8;
  _QWORD v10[4];
  id v11;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007AB0;
  v10[3] = &unk_100010A40;
  v11 = a5;
  v8 = v11;
  LODWORD(a4) = -[SQLDB executeQuery:withBind:withCancellableResults:](self, "executeQuery:withBind:withCancellableResults:", a3, a4, v10);

  return (int)a4;
}

- (int)executeQuery:(id)a3 withBind:(id)a4 withCancellableResults:(id)a5
{
  id v8;
  void (**v9)(id, sqlite3_stmt *);
  uint64_t (**v10)(id, sqlite3_stmt *, void *);
  sqlite3 **p_db;
  sqlite3 *db;
  id v13;
  int v14;
  int v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  sqlite3_stmt *v21;
  int v22;
  int v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  const char *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  _BOOL4 v35;
  char v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  NSObject *v46;
  id v47;
  int v48;
  id v49;
  NSObject *v50;
  id v51;
  NSObject *v52;
  int v53;
  const char *v55;
  int v56;
  id v57;
  void (**v58)(id, sqlite3_stmt *);
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  _BYTE v61[14];

  v8 = a3;
  v9 = (void (**)(id, sqlite3_stmt *))a4;
  v10 = (uint64_t (**)(id, sqlite3_stmt *, void *))a5;
  ppStmt = 0;
  db = self->_db;
  p_db = &self->_db;
  v13 = objc_retainAutorelease(v8);
  v14 = sqlite3_prepare_v2(db, (const char *)objc_msgSend(v13, "UTF8String"), -1, &ppStmt, 0);
  if (v14)
  {
    v15 = v14;
    v16 = sub_10000757C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10000B7A4(p_db, v17);

    v18 = sub_10000757C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10000B854();
    v20 = &__NSDictionary0__struct;
LABEL_39:

  }
  else
  {
    if (v9)
      v9[2](v9, ppStmt);
    if (v10 && (v21 = ppStmt, (v22 = sqlite3_column_count(ppStmt)) != 0))
    {
      v23 = v22;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2 * v22));
      if (v23 >= 1)
      {
        v57 = v13;
        v58 = v9;
        v24 = 0;
        do
        {
          v25 = sqlite3_column_origin_name(v21, v24);
          v26 = sqlite3_column_name(v21, v24);
          v27 = sqlite3_column_table_name(v21, v24);
          if (v25 && v27)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v27));
            if (objc_msgSend(v28, "hasSuffix:", CFSTR("s")))
            {
              v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "substringToIndex:", (char *)objc_msgSend(v28, "length") - 1));

              v28 = (void *)v29;
            }
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v24));
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%s"), v28, v25));
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v30, v31);

          }
          if (v26)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v24));
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v26));
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v32, v33);

          }
          v24 = (v24 + 1);
        }
        while (v23 != (_DWORD)v24);
        v13 = v57;
        v9 = v58;
      }
    }
    else
    {
      v20 = &__NSDictionary0__struct;
    }
    do
    {
      v34 = sqlite3_step(ppStmt);
      v15 = v34;
      if ((v34 - 102) <= 0xFFFFFFFD)
      {
        v45 = sub_10000757C();
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v55 = sqlite3_errmsg(*p_db);
          v56 = sqlite3_errcode(*p_db);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v61 = v55;
          *(_WORD *)&v61[8] = 1024;
          *(_DWORD *)&v61[10] = v56;
          _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "SQL error '%s' (%1d)", buf, 0x12u);
        }

        v47 = sub_10000757C();
        v19 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v61 = v15;
          *(_WORD *)&v61[4] = 2112;
          *(_QWORD *)&v61[6] = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Step error (%d) on query: %@", buf, 0x12u);
        }
        goto LABEL_39;
      }
      v35 = v34 == 100;
      v36 = 1;
      if (v10 && v15 == 100)
      {
        v36 = v10[2](v10, ppStmt, v20);
        v35 = 1;
      }
    }
    while (v35 && (v36 & 1) != 0);
    if (v35)
      v15 = 100;
    if (((!v35 | v36) & 1) == 0)
    {
      v37 = sub_10000757C();
      v19 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_10000B820(v19, v38, v39, v40, v41, v42, v43, v44);
      v15 = 4;
      goto LABEL_39;
    }
  }
  v48 = v15;
  if (ppStmt)
  {
    v48 = sqlite3_finalize(ppStmt);
    if (v48)
    {
      v49 = sub_10000757C();
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        sub_10000B7A4(p_db, v50);

      v51 = sub_10000757C();
      v52 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        sub_10000B73C();

    }
  }
  if (v15 == 101)
    v53 = v48;
  else
    v53 = v15;
  if (v15)
    v48 = v53;

  return v48;
}

- (int)transaction:(id)a3
{
  return -[SQLDB transaction:immediate:](self, "transaction:immediate:", a3, 0);
}

- (int)transaction:(id)a3 immediate:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int (**v6)(_QWORD);
  const __CFString *v7;
  int v8;

  v4 = a4;
  v6 = (unsigned int (**)(_QWORD))a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_transactionSem, 0xFFFFFFFFFFFFFFFFLL);
  if (v4)
    v7 = CFSTR("begin immediate transaction");
  else
    v7 = CFSTR("begin transaction");
  v8 = -[SQLDB executeQuery:withBind:withResults:](self, "executeQuery:withBind:withResults:", v7, 0, 0);
  if (!v8)
  {
    if (v6[2](v6)
      && !-[SQLDB executeQuery:withBind:withResults:](self, "executeQuery:withBind:withResults:", CFSTR("end transaction"), 0, 0))
    {
      v8 = 0;
    }
    else
    {
      v8 = -[SQLDB executeQuery:withBind:withResults:](self, "executeQuery:withBind:withResults:", CFSTR("rollback transaction"), 0, 0);
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_transactionSem);

  return v8;
}

- (int)checkpoint
{
  return sqlite3_wal_checkpoint_v2(self->_db, 0, 3, 0, 0);
}

- (id)readSetting:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1000081A0;
  v14 = sub_1000081B0;
  v15 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000081B8;
  v8[3] = &unk_100010760;
  v4 = a3;
  v9 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000081F4;
  v7[3] = &unk_1000109C8;
  v7[4] = &v10;
  -[SQLDB executeQuery:withBind:withResults:](self, "executeQuery:withBind:withResults:", CFSTR("SELECT value FROM settings WHERE name = ?1"), v8, v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)setSetting:(id)a3 toValue:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000082DC;
  v8[3] = &unk_100010878;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[SQLDB executeQuery:withBind:withResults:](self, "executeQuery:withBind:withResults:", CFSTR("INSERT OR REPLACE INTO settings (name, value) VALUES (?1, ?2)"), v8, 0);

}

- (void)deleteSetting:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000083C4;
  v5[3] = &unk_100010760;
  v6 = a3;
  v4 = v6;
  -[SQLDB executeQuery:withBind:withResults:](self, "executeQuery:withBind:withResults:", CFSTR("DELETE FROM settings WHERE name = ?1"), v5, 0);

}

- (unint64_t)tableRowCount:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1000081A0;
  v17 = sub_1000081B0;
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT COUNT(*) FROM %@"), v4));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008554;
  v12[3] = &unk_1000109C8;
  v12[4] = &v13;
  v6 = -[SQLDB executeQuery:withBind:withResults:](self, "executeQuery:withBind:withResults:", v5, 0, v12);
  if (v6)
  {
    v7 = sub_10000757C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000B8BC((uint64_t)v4, v6, v8);

  }
  v9 = (void *)v14[5];
  if (v9)
    v10 = objc_msgSend(v9, "unsignedIntegerValue");
  else
    v10 = 0;

  _Block_object_dispose(&v13, 8);
  return (unint64_t)v10;
}

- (id)lastInsertRowID
{
  sqlite3_int64 insert_rowid;

  insert_rowid = sqlite3_last_insert_rowid(self->_db);
  return +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", insert_rowid);
}

- (NSURL)dbURL
{
  return self->_url;
}

- (double)totalSizeMB
{
  return self->_totalSizeMB;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSem, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
