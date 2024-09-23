@implementation GKDatabaseConnection

+ (GKDatabaseConnection)connectionWithDatabasePath:(id)a3
{
  id v3;
  GKDatabaseConnection *v4;

  v3 = a3;
  v4 = -[GKDatabaseConnection initWithDatabasePath:]([GKDatabaseConnection alloc], "initWithDatabasePath:", v3);

  return v4;
}

- (GKDatabaseConnection)initWithDatabasePath:(id)a3
{
  id v4;
  GKDatabaseConnection *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *databaseQueue;
  id v8;
  NSObject *v9;
  id v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKDatabaseConnection;
  v5 = -[GKDatabaseConnection init](&v12, "init");
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.gamecenter.GKDatabaseConnection", 0);
    databaseQueue = v5->_databaseQueue;
    v5->_databaseQueue = (OS_dispatch_queue *)v6;

    v5->_stmtCache = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, 0);
    -[GKDatabaseConnection setPath:](v5, "setPath:", v4);
    v8 = -[GKDatabaseConnection open](v5, "open");
    if (!v5->_database)
    {
      v9 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        v10 = (id)GKOSLoggers(v8);
        v9 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        sub_1000D67D4();

      v5 = 0;
    }
  }

  return v5;
}

- (void)checkAndOpenDatabase
{
  id v3;
  NSObject *v4;
  id v5;

  if (!self->_database)
  {
    v3 = -[GKDatabaseConnection open](self, "open");
    if (!self->_database)
    {
      v4 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        v5 = (id)GKOSLoggers(v3);
        v4 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        sub_1000D67D4();
    }
  }
}

- (void)dealloc
{
  __CFDictionary *stmtCache;
  objc_super v4;

  if (self->_database)
    -[GKDatabaseConnection close](self, "close");
  stmtCache = self->_stmtCache;
  if (stmtCache)
    CFRelease(stmtCache);
  v4.receiver = self;
  v4.super_class = (Class)GKDatabaseConnection;
  -[GKDatabaseConnection dealloc](&v4, "dealloc");
}

- (int)getStatement:(sqlite3_stmt *)a3 forSQL:(id)a4
{
  id v6;
  sqlite3_stmt *Value;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  sqlite3 *database;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  sqlite3_stmt *ppStmt;

  v6 = a4;
  Value = (sqlite3_stmt *)CFDictionaryGetValue(self->_stmtCache, v6);
  ppStmt = Value;
  if (Value)
  {
LABEL_2:
    v8 = sqlite3_reset(Value);
    v9 = v8;
    if ((_DWORD)v8)
    {
      v10 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        v11 = (id)GKOSLoggers(v8);
        v10 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        sub_1000D6800((uint64_t)v6, v10, v9);
      ppStmt = 0;
    }
    goto LABEL_13;
  }
  database = self->_database;
  v13 = objc_retainAutorelease(v6);
  v14 = sqlite3_prepare_v2(database, (const char *)objc_msgSend(v13, "UTF8String"), (int)objc_msgSend(v13, "lengthOfBytesUsingEncoding:", 4), &ppStmt, 0);
  if (!(_DWORD)v14)
  {
    CFDictionarySetValue(self->_stmtCache, v13, ppStmt);
    Value = ppStmt;
    goto LABEL_2;
  }
  v9 = v14;
  v15 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v16 = (id)GKOSLoggers(v14);
    v15 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_1000D68A4((uint64_t)v13, v15, v9);
LABEL_13:
  *a3 = ppStmt;

  return v9;
}

- (void)open
{
  sqlite3 **p_database;
  uint64_t v4;
  uint64_t v5;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  NSObject *v12;
  _BOOL8 v13;
  int v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  int v23;
  int v24;
  void *v25;
  id v26;
  _QWORD v27[9];
  int v28;
  uint64_t v29;
  _QWORD v30[3];
  _QWORD v31[3];
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  uint8_t v37[4];
  int v38;
  __int16 v39;
  int v40;
  uint8_t buf[8];
  uint8_t *v42;
  uint64_t v43;
  int v44;

  p_database = &self->_database;
  v4 = sqlite3_open_v2(-[NSString cStringUsingEncoding:](self->_path, "cStringUsingEncoding:", 4), &self->_database, 6, 0);
  if ((_DWORD)v4)
  {
    v5 = v4;
    if ((_DWORD)v4 != 23 && (_DWORD)v4 != 14)
    {
      if (!os_log_GKGeneral)
        v17 = (id)GKOSLoggers(v4);
      v18 = os_log_GKTrace;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v5;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "GKDatabaseConnection can't open database due to rc=%d, throwing exception", buf, 8u);
      }
      sqlite3_close(*p_database);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to open database (%d)"), v5));
      v20 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("GKDatabaseInaccessibleException"), v19, 0));

      objc_exception_throw(v20);
    }
    if (!os_log_GKGeneral)
      v7 = (id)GKOSLoggers(v4);
    v8 = os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKDatabaseConnection can't open database due to rc=%d", buf, 8u);
    }
    sqlite3_close(*p_database);
    *p_database = 0;
  }
  else if (!-[NSString isEqualToString:](self->_path, "isEqualToString:", CFSTR(":memory:")))
  {
    *(_QWORD *)buf = 0;
    v42 = buf;
    v43 = 0x2020000000;
    v44 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v32 = 0;
    v29 = 0;
    v30[0] = &v29;
    v30[1] = 0x2020000000;
    v30[2] = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000D5BF8;
    v27[3] = &unk_1002C1F90;
    v27[4] = self;
    v27[5] = buf;
    v27[6] = &v33;
    v27[7] = &v29;
    v27[8] = v31;
    v28 = 0;
    v9 = -[GKDatabaseConnection performSync:](self, "performSync:", v27);
    v10 = *((_DWORD *)v34 + 6);
    if (v10 == 5)
    {
      if (!os_log_GKGeneral)
        v11 = (id)GKOSLoggers(v9);
      v12 = os_log_GKTrace;
      v13 = os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO);
      if (v13)
      {
        v14 = *((_DWORD *)v34 + 6);
        *(_DWORD *)v37 = 67109120;
        v38 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "GKDatabaseConnection couldn't exec on the database due to rc2=%d - closing and returning", v37, 8u);
      }
      if (!os_log_GKGeneral)
        v15 = (id)GKOSLoggers(v13);
      v16 = os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_1000D6948((uint64_t)v30, v16);
      sqlite3_close(*p_database);
      *p_database = 0;
    }
    else if (*((_DWORD *)v42 + 6) | v10)
    {
      if (!os_log_GKGeneral)
        v21 = (id)GKOSLoggers(v9);
      v22 = os_log_GKTrace;
      if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        v23 = *((_DWORD *)v42 + 6);
        v24 = *((_DWORD *)v34 + 6);
        *(_DWORD *)v37 = 67109376;
        v38 = v23;
        v39 = 1024;
        v40 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "GKDatabaseConnection couldn't exec on the database due to rc1=%d or rc2=%d - closing and throwing an exception", v37, 0xEu);
      }
      sqlite3_close(*p_database);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to set pragmas for database connection.(%d %d)"), *((unsigned int *)v42 + 6), *((unsigned int *)v34 + 6)));
      v26 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("GKDatabaseInaccessibleException"), v25, 0));

      objc_exception_throw(v26);
    }
    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(v31, 8);
    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(buf, 8);
  }
}

- (void)close
{
  NSObject *databaseQueue;
  _QWORD block[5];

  if (GKAtomicCompareAndSwap32Barrier(0, 1, &unk_100317F20))
  {
    databaseQueue = self->_databaseQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D5FBC;
    block[3] = &unk_1002BBBD8;
    block[4] = self;
    dispatch_sync(databaseQueue, block);
  }
}

- (void)performSync:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = v4;
  if (!self->_database)
  {
    v6 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v7 = (id)GKOSLoggers(v4);
      v6 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_1000D6A7C();
    -[GKDatabaseConnection open](self, "open");
    if (!self->_database)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("GKDatabaseInaccessibleException"), CFSTR("cannot perform operation on unopened database. Tried to re-open and failed. Restarting gamed"), 0));
      objc_exception_throw(v10);
    }
  }
  databaseQueue = self->_databaseQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000D61EC;
  v11[3] = &unk_1002BB450;
  v11[4] = self;
  v12 = v5;
  v9 = v5;
  dispatch_sync(databaseQueue, v11);

}

- (void)performAsync:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = v4;
  if (!self->_database)
  {
    v6 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v7 = (id)GKOSLoggers(v4);
      v6 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_1000D6AA8();
    -[GKDatabaseConnection open](self, "open");
    if (!self->_database)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("GKDatabaseInaccessibleException"), CFSTR("cannot perform operation on unopened database. Tried to re-open and failed. Restarting gamed"), 0));
      objc_exception_throw(v10);
    }
  }
  databaseQueue = self->_databaseQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000D6308;
  v11[3] = &unk_1002BB450;
  v11[4] = self;
  v12 = v5;
  v9 = v5;
  dispatch_async(databaseQueue, v11);

}

- (void)performAsyncTransaction:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  NSObject *v9;
  id v10;
  NSObject *databaseQueue;
  void *v12;
  _QWORD block[5];
  id v14;
  void (**v15)(_QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (self->_database)
    goto LABEL_7;
  v9 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v10 = (id)GKOSLoggers(v7);
    v9 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_1000D6AD4();
  -[GKDatabaseConnection open](self, "open");
  if (self->_database)
  {
LABEL_7:
    databaseQueue = self->_databaseQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D6458;
    block[3] = &unk_1002C1FB8;
    block[4] = self;
    v14 = v6;
    v15 = v8;
    dispatch_async(databaseQueue, block);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForServerCode:reason:](NSError, "userErrorForServerCode:reason:", 1, CFSTR("Database not available at this time")));
    ((void (**)(_QWORD, void *))v8)[2](v8, v12);

  }
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (sqlite3)database
{
  return self->_database;
}

- (void)setDatabase:(sqlite3 *)a3
{
  self->_database = a3;
}

- (OS_dispatch_queue)databaseQueue
{
  return self->_databaseQueue;
}

- (void)setDatabaseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_databaseQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
