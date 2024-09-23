@implementation STUSQLiteEventStore

- (void)dealloc
{
  unsigned __int8 v3;
  id v4;
  id v5;
  NSObject *v6;
  objc_super v7;
  id v8;

  v8 = 0;
  v3 = -[STUSQLiteEventStore closeWithError:](self, "closeWithError:", &v8);
  v4 = v8;
  if ((v3 & 1) == 0)
  {
    v5 = sub_1000113BC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10007AB1C(v4, v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)STUSQLiteEventStore;
  -[STUSQLiteEventStore dealloc](&v7, "dealloc");
}

- (STUSQLiteEventStore)init
{
  void *v3;
  void *v4;
  STUSQLiteEventStore *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL crk_uniqueTemporaryDirectoryURL](NSURL, "crk_uniqueTemporaryDirectoryURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("events.db")));
  v5 = -[STUSQLiteEventStore initWithDatabaseURL:](self, "initWithDatabaseURL:", v4);

  return v5;
}

- (STUSQLiteEventStore)initWithDatabaseURL:(id)a3
{
  id v6;
  STUSQLiteEventStore *v7;
  STUSQLiteEventStore *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUSQLiteEventStore.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseURL"));

  }
  v11.receiver = self;
  v11.super_class = (Class)STUSQLiteEventStore;
  v7 = -[STUSQLiteEventStore init](&v11, "init");
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->mDatabaseURL, a3);

  return v8;
}

- (BOOL)storeEvent:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v16;

  v7 = a3;
  if (!v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUSQLiteEventStore.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver cat_archivedDataWithRootObject:error:](NSKeyedArchiver, "cat_archivedDataWithRootObject:error:", v7, a4));
  if (v8 && -[STUSQLiteEventStore openWithError:](self, "openWithError:", a4))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "date"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[STUSQLiteEventStore integerFromDate:](self, "integerFromDate:", v9)));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crk_hexString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "length")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("INSERT INTO EVENTS (DATE, EVENT_DATA, EVENT_DATA_LENGTH) VALUES (%@, X'%@', %@);"),
                      v10,
                      v11,
                      v12));

    v14 = -[STUSQLiteEventStore executeSQL:rowHandler:error:](self, "executeSQL:rowHandler:error:", v13, 0, a4);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)eventLogWithStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSMutableSet *v10;
  void *v11;
  void *v12;
  NSMutableSet *v13;
  id v14;
  _QWORD v16[4];
  NSMutableSet *v17;

  v8 = a3;
  v9 = a4;
  if (-[STUSQLiteEventStore openWithError:](self, "openWithError:", a5))
  {
    v10 = objc_opt_new(NSMutableSet);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[STUSQLiteEventStore integerFromDate:](self, "integerFromDate:", v8)));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT * FROM EVENTS WHERE DATE >= %@"), v11));

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001182C;
    v16[3] = &unk_1000C9D08;
    v13 = v10;
    v17 = v13;
    if (-[STUSQLiteEventStore executeSQL:rowHandler:error:](self, "executeSQL:rowHandler:error:", v12, v16, a5))
      v14 = objc_msgSend(objc_alloc((Class)CRKEventLog), "initWithStartDate:endDate:eventDatas:", v8, v9, v13);
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)purgeEventsBeforeDate:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v12;

  v7 = a3;
  if (!v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUSQLiteEventStore.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

  }
  if (-[STUSQLiteEventStore openWithError:](self, "openWithError:", a4))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[STUSQLiteEventStore integerFromDate:](self, "integerFromDate:", v7)));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DELETE FROM EVENTS WHERE DATE < %@"), v8));

    v10 = -[STUSQLiteEventStore executeSQL:rowHandler:error:](self, "executeSQL:rowHandler:error:", v9, 0, a4);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)integerFromDate:(id)a3
{
  double v3;

  objc_msgSend(a3, "timeIntervalSince1970");
  return (uint64_t)v3;
}

- (BOOL)migrateDatabaseWithError:(id *)a3
{
  unsigned __int8 v5;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  NSURL *mDatabaseURL;
  unsigned __int8 v14;
  unsigned __int8 v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = -1;
  v26 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100011CBC;
  v27[3] = &unk_1000C9D30;
  v27[4] = &v28;
  v5 = -[STUSQLiteEventStore executeSQL:rowHandler:error:](self, "executeSQL:rowHandler:error:", CFSTR("PRAGMA user_version"), v27, &v26);
  v6 = v26;
  if (v29[3] != 1)
  {
    if ((v5 & 1) == 0)
    {
      v8 = sub_1000113BC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "verboseDescription"));
        sub_10007AC64();
      }

    }
    v25 = v6;
    v10 = -[STUSQLiteEventStore closeWithError:](self, "closeWithError:", &v25);
    v11 = v25;

    if ((v10 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      mDatabaseURL = self->mDatabaseURL;
      v24 = v11;
      v14 = objc_msgSend(v12, "crk_safeRemoveItemAtURL:error:", mDatabaseURL, &v24);
      v6 = v24;

      if ((v14 & 1) == 0)
      {
        v18 = sub_1000113BC();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "verboseDescription"));
          sub_10007ABEC();
        }

        if (!a3)
        {
          v7 = 0;
          goto LABEL_24;
        }
        v11 = v6;
        goto LABEL_23;
      }
      v23 = v6;
      v15 = -[STUSQLiteEventStore _openWithError:](self, "_openWithError:", &v23);
      v11 = v23;

      if ((v15 & 1) != 0)
      {
        v7 = 1;
LABEL_15:
        v6 = v11;
        goto LABEL_24;
      }
      v20 = sub_1000113BC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "verboseDescription"));
        sub_10007ABB0();
      }

      if (a3)
      {
LABEL_23:
        v6 = objc_retainAutorelease(v11);
        v7 = 0;
        *a3 = v6;
        goto LABEL_24;
      }
    }
    else
    {
      v16 = sub_1000113BC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "verboseDescription"));
        sub_10007AC28();
      }

      if (a3)
        goto LABEL_23;
    }
    v7 = 0;
    goto LABEL_15;
  }
  v7 = 1;
LABEL_24:

  _Block_object_dispose(&v28, 8);
  return v7;
}

- (BOOL)openWithError:(id *)a3
{
  BOOL v3;
  void *v6;
  void *v7;
  unsigned int v8;

  if (self->mHandle)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByDeletingLastPathComponent](self->mDatabaseURL, "URLByDeletingLastPathComponent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, a3);

  if (v8
    && -[STUSQLiteEventStore _openWithError:](self, "_openWithError:", a3)
    && -[STUSQLiteEventStore migrateDatabaseWithError:](self, "migrateDatabaseWithError:", a3))
  {
    v3 = -[STUSQLiteEventStore createTableWithError:](self, "createTableWithError:", a3);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_openWithError:(id *)a3
{
  uint64_t v5;
  id v6;

  v5 = sqlite3_open_v2(-[NSURL fileSystemRepresentation](self->mDatabaseURL, "fileSystemRepresentation"), &self->mHandle, 32774, 0);
  if ((_DWORD)v5)
  {
    if (a3)
    {
      v6 = -[STUSQLiteEventStore sqliteErrorWithCode:description:](self, "sqliteErrorWithCode:description:", v5, sqlite3_errmsg(self->mHandle));
      *a3 = (id)objc_claimAutoreleasedReturnValue(v6);
    }
    self->mHandle = 0;
  }
  return (_DWORD)v5 == 0;
}

- (BOOL)closeWithError:(id *)a3
{
  sqlite3 *mHandle;
  uint64_t v6;
  id v7;
  id v8;
  BOOL result;

  mHandle = self->mHandle;
  if (!mHandle)
    return 1;
  v6 = sqlite3_close_v2(mHandle);
  if (!(_DWORD)v6)
  {
    self->mHandle = 0;
    return 1;
  }
  if (!a3)
    return 0;
  v7 = -[STUSQLiteEventStore sqliteErrorWithCode:description:](self, "sqliteErrorWithCode:description:", v6, sqlite3_errmsg(self->mHandle));
  v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  result = 0;
  *a3 = v8;
  return result;
}

- (BOOL)createTableWithError:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS EVENTS (EVENT_ID INTEGER PRIMARY KEY, DATE INT NOT NULL, EVENT_DATA BLOB, EVENT_DATA_LENGTH INT); PRAGMA user_version = %@"),
                   v5));

  LOBYTE(a3) = -[STUSQLiteEventStore executeSQL:rowHandler:error:](self, "executeSQL:rowHandler:error:", v6, 0, a3);
  return (char)a3;
}

- (BOOL)executeSQL:(id)a3 rowHandler:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  sqlite3 *mHandle;
  id v12;
  const char *v13;
  int (__cdecl *v14)(void *, int, char **, char **);
  uint64_t v15;
  void *v17;
  char *errmsg;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUSQLiteEventStore.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sql"));

  }
  errmsg = 0;
  mHandle = self->mHandle;
  v12 = objc_retainAutorelease(v9);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  if (v10)
    v14 = (int (__cdecl *)(void *, int, char **, char **))sub_100012080;
  else
    v14 = 0;
  v15 = sqlite3_exec(mHandle, v13, v14, v10, &errmsg);
  if ((_DWORD)v15)
  {
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(-[STUSQLiteEventStore sqliteErrorWithCode:description:](self, "sqliteErrorWithCode:description:", v15, errmsg));
    sqlite3_free(errmsg);
  }

  return (_DWORD)v15 == 0;
}

- (id)sqliteErrorWithCode:(int)a3 description:(const char *)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSErrorUserInfoKey v9;
  void *v10;

  if (a4)
  {
    v9 = NSLocalizedDescriptionKey;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a4));
    v10 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("SQLite3"), a3, v6));

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDatabaseURL, 0);
}

@end
