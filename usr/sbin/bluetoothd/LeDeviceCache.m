@implementation LeDeviceCache

- (void)readDeviceByAddress:(unint64_t)a3
{
  const char *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  char *v15;
  const char *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  char *v22;
  const char *v23;
  NSObject *v24;
  const char *v25;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const char *v30;

  v5 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0);
  v6 = sub_100021770(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = sub_100021770(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT * FROM %s WHERE Address = '%@' OR ResolvedAddress = '%@'"), v5, v7, v9));

  v11 = -[LeDeviceCache readDeviceFromDatabase:statement:](self, "readDeviceFromDatabase:statement:", self->_pairedDatabase, v10);
  v12 = v11;
  if (v11)
  {
    sub_10064D354((uint64_t *)v11, 1);
  }
  else
  {
    v13 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_INFO))
    {
      v14 = sub_100021770(a3);
      v15 = (char *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138543618;
      v28 = v15;
      v29 = 2082;
      v30 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 0);
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Unable to locate device address %{public}@ in '%{public}s' cache", buf, 0x16u);

    }
    if (self->_otherDatabase)
    {
      v16 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 1);
      v17 = sub_100021770(a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT * FROM %s WHERE Address = '%@'"), v16, v18));

      v12 = -[LeDeviceCache readDeviceFromDatabase:statement:](self, "readDeviceFromDatabase:statement:", self->_otherDatabase, v19);
      if (!v12)
      {
        v20 = qword_100999810;
        if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_INFO))
        {
          v21 = sub_100021770(a3);
          v22 = (char *)objc_claimAutoreleasedReturnValue(v21);
          v23 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1);
          *(_DWORD *)buf = 138543618;
          v28 = v22;
          v29 = 2082;
          v30 = v23;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Unable to locate device address %{public}@ in '%{public}s' cache", buf, 0x16u);

        }
        v12 = 0;
      }
      v10 = (void *)v19;
    }
    else
    {
      v24 = qword_100999810;
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_INFO))
      {
        v25 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1);
        *(_DWORD *)buf = 136446210;
        v28 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Ignoring read as '%{public}s' cache has not been loaded yet", buf, 0xCu);
      }
      v12 = 0;
    }
  }

  return v12;
}

- (void)readDevice:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;

  v4 = a3;
  v5 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT * FROM %s WHERE Uuid = '%@'"), v5, v6));

  v8 = -[LeDeviceCache readDeviceFromDatabase:statement:](self, "readDeviceFromDatabase:statement:", self->_pairedDatabase, v7);
  v9 = v8;
  if (v8)
  {
    sub_10064D354((uint64_t *)v8, 1);
  }
  else
  {
    v10 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v18 = (const char *)v4;
      v19 = 2082;
      v20 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 0);
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Unable to locate device \"%{public}@\" in '%{public}s' cache", buf, 0x16u);
    }
    if (self->_otherDatabase)
    {
      v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT * FROM %s WHERE Uuid = '%@'"), -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 1), v4));

      v9 = -[LeDeviceCache readDeviceFromDatabase:statement:](self, "readDeviceFromDatabase:statement:", self->_otherDatabase, v11);
      if (!v9)
      {
        v12 = qword_100999810;
        if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_INFO))
        {
          v13 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1);
          *(_DWORD *)buf = 138543618;
          v18 = (const char *)v4;
          v19 = 2082;
          v20 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Unable to locate device \"%{public}@\" in '%{public}s' cache", buf, 0x16u);
        }
        v9 = 0;
      }
      v7 = (void *)v11;
    }
    else
    {
      v14 = qword_100999810;
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_INFO))
      {
        v15 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1);
        *(_DWORD *)buf = 136446210;
        v18 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Ignoring read as '%{public}s' cache has not been loaded yet", buf, 0xCu);
      }
      v9 = 0;
    }
  }

  return v9;
}

- (const)tableNameForType:(unint64_t)a3
{
  if (a3)
    return "OtherDevices";
  else
    return "PairedDevices";
}

- (void)readDeviceFromDatabase:(sqlite3 *)a3 statement:(id)a4
{
  id v5;
  int v6;
  NSObject *v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  NSNumber *v14;
  uint64_t v15;
  const unsigned __int8 *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  const char *v23;
  int v24;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  sqlite3_stmt *ppStmt;
  char v37[16];
  _BYTE buf[40];
  id *v39;
  id *v40;
  id *v41;
  id *v42;
  id *v43;

  ppStmt = 0;
  v5 = objc_retainAutorelease(a4);
  v6 = sqlite3_prepare_v2(a3, (const char *)objc_msgSend(v5, "UTF8String"), -1, &ppStmt, 0);
  if (v6)
  {
    v7 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      v23 = sqlite3_errmsg(a3);
      v24 = sqlite3_extended_errcode(a3);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v6;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = v23;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to execute statement \"%s\" with error %d (%{public}s, %d)", buf, 0x22u);
    }
    goto LABEL_30;
  }
  v8 = sqlite3_step(ppStmt);
  v9 = v8;
  if (v8 == 101)
    goto LABEL_29;
  if (v8 == 100)
  {
    v10 = 0;
    v34 = 0;
    v35 = 0;
    v32 = 0;
    v33 = 0;
    v30 = 0;
    v31 = 0;
    v28 = 0;
    v29 = 0;
    v27 = 0;
    *(_QWORD *)buf = &v35;
    *(_QWORD *)&buf[8] = &v34;
    *(_QWORD *)&buf[16] = &v29;
    *(_QWORD *)&buf[24] = &v33;
    *(_QWORD *)&buf[32] = &v32;
    v39 = &v28;
    v40 = &v27;
    v41 = &v26;
    v42 = &v31;
    v43 = &v30;
    v26 = 0;
    while (1)
    {
      v11 = qword_1009993F0[v10];
      if (v11 == objc_opt_class(NSString))
      {
        v16 = sqlite3_column_text(ppStmt, v10);
        if (!v16)
          goto LABEL_16;
        v13 = *(uint64_t **)&buf[8 * v10];
        if (*v13)
          goto LABEL_16;
        v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v16));
      }
      else
      {
        v12 = qword_1009993F0[v10];
        if (v12 != objc_opt_class(NSNumber))
          goto LABEL_16;
        v13 = *(uint64_t **)&buf[8 * v10];
        if (*v13)
          goto LABEL_16;
        v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", sqlite3_column_int(ppStmt, v10));
        v15 = objc_claimAutoreleasedReturnValue(v14);
      }
      v17 = (void *)*v13;
      *v13 = v15;

LABEL_16:
      if (++v10 == 10)
      {
        v18 = objc_alloc((Class)NSUUID);
        v19 = objc_msgSend(v18, "initWithUUIDString:", v35);
        if (!v33 && os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_FAULT))
          sub_1006E2064((uint64_t)objc_msgSend(objc_retainAutorelease(v35), "UTF8String"), (uint64_t)v37);
        if (v19)
        {
          if (v33)
            operator new();
        }
        else if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
          objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
          sub_1006E2020();
        }

        goto LABEL_29;
      }
    }
  }
  v20 = qword_100999810;
  if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
    sub_1006E1FA4(v9, v20, v21);
LABEL_29:
  sqlite3_finalize(ppStmt);
LABEL_30:

  return 0;
}

- (const)friendlyNameForType:(unint64_t)a3
{
  if (a3)
    return "other devices";
  else
    return "paired devices";
}

- (void)tryLoadProtectedCache
{
  if (!self->_otherDatabase && MKBDeviceUnlockedSinceBoot() == 1)
  {
    if (-[LeDeviceCache loadDatabase:](self, "loadDatabase:", 1))
      -[LeDeviceCache updateProtectedCacheMetrics](self, "updateProtectedCacheMetrics");
  }
}

+ (id)sharedInstance
{
  if (qword_100991E48 != -1)
    dispatch_once(&qword_100991E48, &stru_1009291D8);
  return (id)qword_100991E40;
}

- (LeDeviceCache)init
{
  LeDeviceCache *v2;
  LeDeviceCache *v3;
  uint64_t v4;
  int v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int v10;
  NSObject *v11;
  void *__p[2];
  char v14;
  int v15;
  objc_super v16;
  uint8_t buf[8];
  char v18;

  v16.receiver = self;
  v16.super_class = (Class)LeDeviceCache;
  v2 = -[LeDeviceCache init](&v16, "init");
  v3 = v2;
  if (!v2)
    return v3;
  *(_OWORD *)&v2->_maxSeenDevices = xmmword_10073E0C0;
  v2->_pairedDatabase = 0;
  v2->_otherDatabase = 0;
  v15 = 0;
  v4 = sub_100027F68();
  sub_100091AE8(buf, "LeDeviceCache");
  sub_100091AE8(__p, "MaxConnectedOnDisk");
  v5 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, int *))(*(_QWORD *)v4 + 88))(v4, buf, __p, &v15);
  if (v14 < 0)
    operator delete(__p[0]);
  if ((v18 & 0x80000000) == 0)
  {
    if (!v5)
      goto LABEL_14;
LABEL_8:
    v6 = v15;
    v7 = qword_100999810;
    if (v15 < 1)
    {
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
        sub_1006E15CC();
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Warning: Using override value (%d) for max number of connected devices to be cached on disk", buf, 8u);
        v6 = v15;
      }
      v3->_maxSeenDevices = v6;
    }
    goto LABEL_14;
  }
  operator delete(*(void **)buf);
  if (v5)
    goto LABEL_8;
LABEL_14:
  v8 = sub_100027F68();
  sub_100091AE8(buf, "LeDeviceCache");
  sub_100091AE8(__p, "MaxSeenOnDisk");
  v9 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, int *))(*(_QWORD *)v8 + 88))(v8, buf, __p, &v15);
  if (v14 < 0)
    operator delete(__p[0]);
  if (v18 < 0)
  {
    operator delete(*(void **)buf);
    if (!v9)
      return v3;
  }
  else if (!v9)
  {
    return v3;
  }
  v10 = v15;
  v11 = qword_100999810;
  if (v15 < 1)
  {
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
      sub_1006E156C();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Warning: Using override value (%d) for max number of seen devices to be cached on disk", buf, 8u);
      v10 = v15;
    }
    v3->_maxConnectedDevices = v10;
  }
  return v3;
}

- (int)_genericExecute:(id)a3 inDatabase:(sqlite3 *)a4
{
  id v5;
  int v6;
  NSObject *v7;
  id v8;
  const char *v9;
  int v10;
  NSObject *v11;
  id v13;
  const char *v14;
  int v15;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

  ppStmt = 0;
  v5 = objc_retainAutorelease(a3);
  v6 = sqlite3_prepare_v2(a4, (const char *)objc_msgSend(v5, "UTF8String"), -1, &ppStmt, 0);
  if (v6)
  {
    v7 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      v9 = sqlite3_errmsg(a4);
      v10 = sqlite3_extended_errcode(a4);
      *(_DWORD *)buf = 136315906;
      v18 = v8;
      v19 = 1024;
      v20 = v6;
      v21 = 2082;
      v22 = v9;
      v23 = 1024;
      v24 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to prepare statement \"%s\" with error %d (%{public}s, %d)", buf, 0x22u);
    }
  }
  else
  {
    v6 = sqlite3_step(ppStmt);
    if (v6 != 101)
    {
      v11 = qword_100999810;
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
      {
        v13 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
        v14 = sqlite3_errmsg(a4);
        v15 = sqlite3_extended_errcode(a4);
        *(_DWORD *)buf = 136315906;
        v18 = v13;
        v19 = 1024;
        v20 = v6;
        v21 = 2082;
        v22 = v14;
        v23 = 1024;
        v24 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to execute statement \"%s\" with error %d (%{public}s, %d)", buf, 0x22u);
      }
    }
    sqlite3_finalize(ppStmt);
  }

  return v6;
}

- (void)clearAllDatabases
{
  void *v3;
  unsigned int v4;
  NSObject *v5;
  unsigned int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  unsigned int v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DELETE FROM %s"), "CustomProperties"));
  v4 = -[LeDeviceCache _genericExecute:inDatabase:](self, "_genericExecute:inDatabase:", v3, self->_pairedDatabase);
  v5 = qword_100999810;
  if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v3;
    v17 = 1024;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Executing %@ on _pairedDatabase devices returned %d", buf, 0x12u);
  }
  v6 = -[LeDeviceCache _genericExecute:inDatabase:](self, "_genericExecute:inDatabase:", v3, self->_otherDatabase);
  v7 = qword_100999810;
  if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v3;
    v17 = 1024;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Executing %@ on _otherDatabase devices returned %d", buf, 0x12u);
  }
  v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DELETE FROM %s"), -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0)));

  v9 = (void *)v8;
  v10 = -[LeDeviceCache _genericExecute:inDatabase:](self, "_genericExecute:inDatabase:", v8, self->_pairedDatabase);
  v11 = qword_100999810;
  if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v9;
    v17 = 1024;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Executing %@ on _pairedDatabase devices returned %d", buf, 0x12u);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DELETE FROM %s"), -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 1)));

  v13 = -[LeDeviceCache _genericExecute:inDatabase:](self, "_genericExecute:inDatabase:", v12, self->_otherDatabase);
  v14 = qword_100999810;
  if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v12;
    v17 = 1024;
    v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Executing %@ on _otherDatabase devices returned %d", buf, 0x12u);
  }

}

- (BOOL)initializeDatabases:(LeDeviceCacheEventListener *)a3 queue:(dispatch_queue_s *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  __CFNotificationCenter *LocalCenter;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  int v25;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *__p[2];
  char v33;
  char v34;
  _QWORD handler[5];
  int out_token;
  id v37;
  _BYTE buf[12];
  __int16 v39;
  id v40;
  char v41;

  v7 = objc_autoreleasePoolPush();
  self->_listener = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LeDeviceCache databaseContainerURL](self, "databaseContainerURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
  v11 = objc_msgSend(v8, "fileExistsAtPath:", v10);

  if ((v11 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LeDeviceCache databaseContainerURL](self, "databaseContainerURL"));
    v37 = 0;
    v14 = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v37);
    v15 = v37;

    if ((v14 & 1) == 0)
    {
      v16 = qword_100999810;
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[LeDeviceCache databaseContainerURL](self, "databaseContainerURL"));
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "path")));
        v29 = objc_msgSend(v28, "UTF8String");
        v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedDescription")));
        v31 = objc_msgSend(v30, "UTF8String");
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v29;
        v39 = 2082;
        v40 = v31;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Could not create directory at path \"%s\" with error %{public}s", buf, 0x16u);

      }
    }

  }
  out_token = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100340BE0;
  handler[3] = &unk_1009172C8;
  handler[4] = self;
  v17 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, (dispatch_queue_t)a4, handler);
  v18 = qword_100999810;
  if (v17)
  {
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
      sub_1006E1664();
  }
  else if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Successfully registered for MKB first unlock notification", buf, 2u);
  }
  if (!-[LeDeviceCache loadDatabase:](self, "loadDatabase:", 0))
  {
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
      sub_1006E162C((uint64_t)-[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 0), (uint64_t)buf);
    goto LABEL_29;
  }
  LODWORD(__p[0]) = 0;
  if (-[LeDeviceCache readIntFromDatabase:statement:value:](self, "readIntFromDatabase:statement:value:", self->_pairedDatabase, CFSTR("SELECT COUNT() FROM PairedDevices"), __p))
  {
    v19 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = __p[0];
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Paired device cache contains %d device(s)", buf, 8u);
    }
  }
  v34 = 0;
  v20 = sub_100038E50();
  (*(void (**)(uint64_t, char *))(*(_QWORD *)v20 + 104))(v20, &v34);
  if (!v34)
  {
    v22 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
    {
      v23 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1);
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Ignoring request to load '%{public}s' cache as we're before first unlock", buf, 0xCu);
    }
    goto LABEL_22;
  }
  if (!-[LeDeviceCache loadDatabase:](self, "loadDatabase:", 1))
  {
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
      sub_1006E162C((uint64_t)-[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1), (uint64_t)buf);
LABEL_29:
    v25 = 1;
    goto LABEL_30;
  }
  -[LeDeviceCache updateProtectedCacheMetrics](self, "updateProtectedCacheMetrics");
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("SystemKeybagUnlocked"), 0, 0, 1u);
LABEL_22:
  v24 = sub_100027F68();
  sub_100091AE8(buf, "LeDeviceCache");
  sub_100091AE8(__p, "WipeNameOrigin");
  (*(void (**)(uint64_t, _BYTE *, void **, _QWORD))(*(_QWORD *)v24 + 80))(v24, buf, __p, 0);
  if (v33 < 0)
    operator delete(__p[0]);
  if (v41 < 0)
    operator delete(*(void **)buf);
  v25 = 0;
LABEL_30:
  objc_autoreleasePoolPop(v7);
  return v25 == 0;
}

- (id)databaseContainerURL
{
  uint64_t v2;
  void **v3;
  void *v4;
  void *v5;
  void *v6;
  void *__p[2];
  uint64_t v9;

  __p[0] = 0;
  __p[1] = 0;
  v9 = 0;
  v2 = sub_100038E50();
  (*(void (**)(uint64_t, void **))(*(_QWORD *)v2 + 168))(v2, __p);
  if (v9 >= 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("/Library/Database")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 1));
  if (SHIBYTE(v9) < 0)
    operator delete(__p[0]);

  return v6;
}

- (void)removeDevicesDuplicatesOf:(unint64_t)a3 originalUuid:(id)a4
{
  unsigned __int8 *v6;
  NSObject *v7;
  id v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  sqlite3 *pairedDatabase;
  id v22;
  const unsigned __int8 *v23;
  NSObject *v24;
  void *v25;
  const char *v26;
  const char *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  sqlite3 *v34;
  id v35;
  sqlite3_stmt *ppStmt;
  char v37[32];
  uint8_t buf[4];
  const unsigned __int8 *v39;
  __int16 v40;
  const char *v41;

  v6 = (unsigned __int8 *)a4;
  v7 = qword_100999810;
  if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_INFO))
  {
    v8 = sub_100021770(a3);
    v9 = (char *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138543618;
    v39 = v6;
    v40 = 2114;
    v41 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Removing duplicates of %{public}@ (%{public}@)", buf, 0x16u);

  }
  v10 = -[LeDeviceCache duplicatePairedDevicesForAddress:originalUuid:](self, "duplicatePairedDevicesForAddress:originalUuid:", a3, v6);
  if ((_DWORD)v10)
  {
    v11 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
    {
      v12 = sub_100021770(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      sub_1006E1770(v13, (uint64_t)v37, v10, v11);
    }
    v14 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    v16 = sub_100021770(a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = sub_100021770(a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT Uuid FROM %s WHERE Uuid != '%@' AND (Address = '%@' OR ResolvedAddress = '%@')"), v14, v15, v17, v19));

    ppStmt = 0;
    pairedDatabase = self->_pairedDatabase;
    v22 = objc_retainAutorelease(v20);
    if (!sqlite3_prepare_v2(pairedDatabase, (const char *)objc_msgSend(v22, "UTF8String"), -1, &ppStmt, 0))
    {
      while (sqlite3_step(ppStmt) == 100)
      {
        v23 = sqlite3_column_text(ppStmt, 0);
        if (v23)
        {
          v24 = qword_100999810;
          if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
          {
            v26 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 0);
            *(_DWORD *)buf = 136315394;
            v39 = v23;
            v40 = 2080;
            v41 = v26;
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Removing stale device \"%s\" from '%s' cache", buf, 0x16u);
          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v23));
          -[LeDeviceCache removeCustomPropertiesJSONForDeviceUUID:inDatabase:](self, "removeCustomPropertiesJSONForDeviceUUID:inDatabase:", v25, self->_pairedDatabase);

        }
      }
      sqlite3_finalize(ppStmt);
    }
    v27 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    v29 = sub_100021770(a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = sub_100021770(a3);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DELETE FROM %s WHERE Uuid != '%@' AND (Address = '%@' OR ResolvedAddress = '%@')"), v27, v28, v30, v32));

    v34 = self->_pairedDatabase;
    v35 = objc_retainAutorelease(v33);
    sqlite3_exec(v34, (const char *)objc_msgSend(v35, "UTF8String"), 0, 0, 0);

  }
}

- (void)loadPairedDevice:(id)a3 address:(unint64_t)a4 ifMissing:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t *v16;
  sqlite3 *otherDatabase;
  const char *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  void *v29;
  const char *v30;
  id v31;
  void *v32;
  const char *v33;
  id v34;
  void *v35;
  uint64_t v36;
  unsigned int v37;
  id v38;
  id v39;
  int v40;
  __int16 v41;
  char v42;
  _BYTE v43[16];
  _BYTE buf[22];
  __int16 v45;
  const char *v46;

  v5 = a5;
  v8 = a3;
  if (v8)
  {
    v9 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT * FROM %s WHERE Uuid = '%@'"), v9, v10));
  }
  else
  {
    v12 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0);
    v13 = sub_100021770(a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v14 = sub_100021770(a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT * FROM %s WHERE Address = '%@' OR ResolvedAddress = '%@'"), v12, v10, v15));

  }
  v16 = -[LeDeviceCache readDeviceFromDatabase:statement:](self, "readDeviceFromDatabase:statement:", self->_pairedDatabase, v11);
  otherDatabase = self->_otherDatabase;
  if (!v16)
  {
    if (!otherDatabase)
      goto LABEL_10;
    v18 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 1);
    if (v8)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
      v20 = v11;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT * FROM %s WHERE Uuid = '%@'"), v18, v19));
    }
    else
    {
      v24 = sub_100021770(a4);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v25 = sub_100021770(a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v26 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT * FROM %s WHERE Address = '%@' OR ResolvedAddress = '%@'"), v18, v19, v20));

      v11 = (void *)v26;
    }

    v16 = -[LeDeviceCache readDeviceFromDatabase:statement:](self, "readDeviceFromDatabase:statement:", self->_otherDatabase, v11);
    if (!v16)
      goto LABEL_17;
LABEL_13:
    v22 = v8;
    sub_10064D354(v16, 1);
    goto LABEL_14;
  }
  if (otherDatabase)
    goto LABEL_13;
LABEL_10:
  v21 = qword_100999810;
  if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1);
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Ignoring read as '%{public}s' cache has not been loaded yet", buf, 0xCu);
  }
  if (v16)
    goto LABEL_13;
LABEL_17:
  v27 = qword_100999810;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
    {
      v31 = sub_100021770(a4);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v33 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 0);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v32;
      v45 = 2082;
      v46 = v33;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to load paired device \"%{public}@\" (%{public}@) from '%{public}s' cache", buf, 0x20u);

      v27 = qword_100999810;
      if (v8)
        goto LABEL_31;
    }
    else if (v8)
    {
      goto LABEL_31;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v34 = sub_100021770(a4);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      sub_1006E1824(v35, (uint64_t)v43);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    uuid_clear(buf);
    v36 = sub_1000746A4(a4);
    v40 = v36;
    v42 = BYTE6(v36);
    v41 = WORD2(v36);
    if (uuid_is_null(buf))
      v37 = 7;
    else
      v37 = 0;
    sub_1000728E8(buf, (uint64_t)&v40, v37);
    v38 = sub_100030DF4(buf);
    objc_claimAutoreleasedReturnValue(v38);
    v27 = qword_100999810;
LABEL_31:
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v39 = sub_100021770(a4);
      objc_claimAutoreleasedReturnValue(v39);
      sub_1006E17C8();
    }
    operator new();
  }
  if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
  {
    v28 = sub_100021770(a4);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 0);
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v29;
    v45 = 2082;
    v46 = v30;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Failed to load paired device \"%{public}@\" (%{public}@) from '%{public}s' cache, but thats ok.", buf, 0x20u);

  }
  v16 = 0;
  v22 = v8;
LABEL_14:
  -[LeDeviceCache removeDevicesDuplicatesOf:originalUuid:](self, "removeDevicesDuplicatesOf:originalUuid:", a4, v22);

  return v16;
}

- (int)duplicatePairedDevicesForAddress:(unint64_t)a3 originalUuid:(id)a4
{
  id v6;
  const char *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v15;

  v6 = a4;
  v15 = 0;
  v7 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  v9 = sub_100021770(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = sub_100021770(a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT COUNT() FROM %s WHERE Uuid != '%@' AND (Address = '%@' OR ResolvedAddress = '%@')"), v7, v8, v10, v12));

  -[LeDeviceCache readIntFromDatabase:statement:value:](self, "readIntFromDatabase:statement:value:", self->_pairedDatabase, v13, &v15);
  LODWORD(self) = v15;

  return (int)self;
}

- (void)writeDevice:(const void *)a3
{
  void *v5;
  int v6;
  _BOOL8 v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  sqlite3_stmt *v22;
  id v23;
  id v24;
  sqlite3_stmt *v25;
  const char *v26;
  sqlite3_stmt *v27;
  id v28;
  id v29;
  sqlite3_stmt *v30;
  uint64_t v31;
  id v32;
  const char *v33;
  sqlite3_stmt *v34;
  id v35;
  sqlite3_stmt *v36;
  const char *v37;
  int v38;
  NSObject *v39;
  id v40;
  const char *v41;
  const char *v42;
  int v43;
  NSObject *v44;
  id v45;
  const char *v46;
  sqlite3 *v47;
  _BYTE buf[24];
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;

  v5 = objc_autoreleasePoolPush();
  v6 = *((unsigned __int8 *)a3 + 160);
  v7 = *((_BYTE *)a3 + 160) == 0;
  v8 = 24;
  if (*((_BYTE *)a3 + 160))
    v8 = 16;
  v47 = *(Class *)((char *)&self->super.isa + v8);
  v9 = qword_100999810;
  if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_INFO))
  {
    v10 = *(id *)a3;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", v7);
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Writing device \"%{public}@\" to '%{public}s' cache", buf, 0x16u);

  }
  if (v6 || self->_otherDatabase)
  {
    -[LeDeviceCache removeDevice:internal:](self, "removeDevice:internal:", a3, 1);
    if (!v6)
      -[LeDeviceCache evictIfNeeded:](self, "evictIfNeeded:", *((_DWORD *)a3 + 34) != 0);
    if (*((_QWORD *)a3 + 24))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:"));
      v14 = (_QWORD *)*((_QWORD *)a3 + 22);
      if (v14 != (_QWORD *)((char *)a3 + 184))
      {
        do
        {
          v15 = v14 + 4;
          if (*((char *)v14 + 55) < 0)
            v15 = (_QWORD *)*v15;
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v15));
          objc_msgSend(v13, "addObject:", v16);

          v17 = (_QWORD *)v14[1];
          if (v17)
          {
            do
            {
              v18 = v17;
              v17 = (_QWORD *)*v17;
            }
            while (v17);
          }
          else
          {
            do
            {
              v18 = (_QWORD *)v14[2];
              v19 = *v18 == (_QWORD)v14;
              v14 = v18;
            }
            while (!v19);
          }
          v14 = v18;
        }
        while (v18 != (_QWORD *)((char *)a3 + 184));
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", CFSTR(",")));

    }
    else
    {
      v20 = 0;
    }
    if (v6)
      v21 = 32;
    else
      v21 = 40;
    v22 = *(Class *)((char *)&self->super.isa + v21);
    v23 = *(id *)a3;
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUIDString")));
    sqlite3_bind_text(v22, 1, (const char *)objc_msgSend(v24, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    v25 = *(Class *)((char *)&self->super.isa + v21);
    if (*((char *)a3 + 127) < 0)
    {
      sub_10003430C(buf, *((void **)a3 + 13), *((_QWORD *)a3 + 14));
    }
    else
    {
      *(_OWORD *)buf = *(_OWORD *)((char *)a3 + 104);
      *(_QWORD *)&buf[16] = *((_QWORD *)a3 + 15);
    }
    if (buf[23] >= 0)
      v26 = buf;
    else
      v26 = *(const char **)buf;
    sqlite3_bind_text(v25, 2, v26, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    sqlite3_bind_int(*(sqlite3_stmt **)((char *)&self->super.isa + v21), 3, *((_DWORD *)a3 + 32));
    v27 = *(Class *)((char *)&self->super.isa + v21);
    v28 = sub_100021770(*((_QWORD *)a3 + 2));
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v28));
    sqlite3_bind_text(v27, 4, (const char *)objc_msgSend(v29, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    v30 = *(Class *)((char *)&self->super.isa + v21);
    v31 = *((_QWORD *)a3 + 3);
    if (v31)
    {
      v32 = sub_100021770(*((_QWORD *)a3 + 3));
      v27 = (sqlite3_stmt *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v32));
      v33 = (const char *)-[sqlite3_stmt UTF8String](v27, "UTF8String");
    }
    else
    {
      v33 = 0;
    }
    sqlite3_bind_text(v30, 5, v33, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (v31)

    sqlite3_bind_int(*(sqlite3_stmt **)((char *)&self->super.isa + v21), 6, *((_DWORD *)a3 + 33));
    sqlite3_bind_int(*(sqlite3_stmt **)((char *)&self->super.isa + v21), 7, *((_DWORD *)a3 + 34));
    sqlite3_bind_int(*(sqlite3_stmt **)((char *)&self->super.isa + v21), 8, *((unsigned __int8 *)a3 + 162));
    v34 = *(Class *)((char *)&self->super.isa + v21);
    v35 = objc_retainAutorelease(v20);
    sqlite3_bind_text(v34, 9, (const char *)objc_msgSend(v35, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v36 = *(Class *)((char *)&self->super.isa + v21);
    if (*((char *)a3 + 231) < 0)
    {
      sub_10003430C(buf, *((void **)a3 + 26), *((_QWORD *)a3 + 27));
    }
    else
    {
      *(_OWORD *)buf = *((_OWORD *)a3 + 13);
      *(_QWORD *)&buf[16] = *((_QWORD *)a3 + 28);
    }
    if (buf[23] >= 0)
      v37 = buf;
    else
      v37 = *(const char **)buf;
    sqlite3_bind_text(v36, 10, v37, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    v38 = sqlite3_step(*(sqlite3_stmt **)((char *)&self->super.isa + v21));
    if (v38 == 101)
    {
      -[LeDeviceCache writeCustomPropertiesJSONForDevice:inDatabase:](self, "writeCustomPropertiesJSONForDevice:inDatabase:", a3, v47);
      if (!v6)
      {
        if (*((_DWORD *)a3 + 34))
          -[LeDeviceCache setConnectedDeviceCount:](self, "setConnectedDeviceCount:", -[LeDeviceCache connectedDeviceCount](self, "connectedDeviceCount") + 1);
        else
          -[LeDeviceCache setSeenDeviceCount:](self, "setSeenDeviceCount:", -[LeDeviceCache seenDeviceCount](self, "seenDeviceCount") + 1);
      }
      v44 = qword_100999810;
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_INFO))
      {
        v45 = *(id *)a3;
        v46 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", v7);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v46;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Successfully wrote device \"%{public}@\" into '%{public}s' cache", buf, 0x16u);

      }
    }
    else
    {
      v39 = qword_100999810;
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
      {
        v40 = *(id *)a3;
        v41 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", v7);
        v42 = sqlite3_errmsg(v47);
        v43 = sqlite3_extended_errcode(v47);
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = v40;
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v41;
        *(_WORD *)&buf[22] = 1024;
        v49 = v38;
        v50 = 2082;
        v51 = v42;
        v52 = 1024;
        v53 = v43;
        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to write device \"%{public}@\" into '%{public}s' cache with error %d (%{public}s, %d)", buf, 0x2Cu);

      }
    }
    sqlite3_reset(*(sqlite3_stmt **)((char *)&self->super.isa + v21));
    sqlite3_clear_bindings(*(sqlite3_stmt **)((char *)&self->super.isa + v21));

  }
  else
  {
    v11 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_INFO))
    {
      v12 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1);
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Ignoring write as '%{public}s' cache has not been loaded yet", buf, 0xCu);
    }
  }
  objc_autoreleasePoolPop(v5);
}

- (void)removeDevice:(const void *)a3 internal:(BOOL)a4
{
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  void *v11;
  void *v12;
  sqlite3 *pairedDatabase;
  int v14;
  NSObject *v15;
  id v16;
  char *v17;
  const char *v18;
  id v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  const char *v26;
  void *v27;
  void *v28;
  sqlite3 *otherDatabase;
  id v30;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  char *v35;
  const char *v36;
  int v37;
  int v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  const char *v42;

  v38 = 0;
  v7 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)a3, "UUIDString"));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT COUNT() FROM %s WHERE Uuid = '%@'"), v7, v8));

  -[LeDeviceCache readIntFromDatabase:statement:value:](self, "readIntFromDatabase:statement:value:", self->_pairedDatabase, v9, &v38);
  if (v38)
  {
    v10 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)a3, "UUIDString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DELETE FROM %s WHERE Uuid = '%@'"), v10, v11));

    pairedDatabase = self->_pairedDatabase;
    v9 = objc_retainAutorelease(v12);
    v14 = sqlite3_exec(pairedDatabase, (const char *)objc_msgSend(v9, "UTF8String"), 0, 0, 0);
    if (!a4 && !v14)
    {
      v15 = qword_100999810;
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(id *)a3;
        v17 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
        v18 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 0);
        *(_DWORD *)buf = 138543618;
        v40 = v17;
        v41 = 2082;
        v42 = v18;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removed device \"%{public}@\" from '%{public}s' cache", buf, 0x16u);

      }
    }
    v19 = *(id *)a3;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
    -[LeDeviceCache removeCustomPropertiesJSONForDeviceUUID:inDatabase:](self, "removeCustomPropertiesJSONForDeviceUUID:inDatabase:", v20, self->_pairedDatabase);

    goto LABEL_24;
  }
  if (self->_otherDatabase)
  {
    v37 = 0;
    v21 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)a3, "UUIDString"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT LastConnectionTime FROM %s WHERE Uuid = '%@'"), v21, v22));

    if (-[LeDeviceCache readIntFromDatabase:statement:value:](self, "readIntFromDatabase:statement:value:", self->_otherDatabase, v23, &v37))
    {
      v24 = *(id *)a3;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
      -[LeDeviceCache removeCustomPropertiesJSONForDeviceUUID:inDatabase:](self, "removeCustomPropertiesJSONForDeviceUUID:inDatabase:", v25, self->_otherDatabase);

      v26 = -[LeDeviceCache tableNameForType:](self, "tableNameForType:", 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)a3, "UUIDString"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DELETE FROM %s WHERE Uuid = '%@'"), v26, v27));

      otherDatabase = self->_otherDatabase;
      v30 = objc_retainAutorelease(v28);
      if (!sqlite3_exec(otherDatabase, (const char *)objc_msgSend(v30, "UTF8String"), 0, 0, 0))
      {
        if (!a4)
        {
          v34 = qword_100999810;
          if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
          {
            v35 = (char *)*(id *)a3;
            v36 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1);
            *(_DWORD *)buf = 138543618;
            v40 = v35;
            v41 = 2082;
            v42 = v36;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Removed device \"%{public}@\" from '%{public}s' cache", buf, 0x16u);

          }
        }
        if (v37)
          -[LeDeviceCache setConnectedDeviceCount:](self, "setConnectedDeviceCount:", -[LeDeviceCache connectedDeviceCount](self, "connectedDeviceCount") - 1);
        else
          -[LeDeviceCache setSeenDeviceCount:](self, "setSeenDeviceCount:", -[LeDeviceCache seenDeviceCount](self, "seenDeviceCount") - 1);
        v23 = v30;
        goto LABEL_23;
      }
      v23 = v30;
    }
    if (!a4)
    {
      v31 = qword_100999810;
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
        sub_1006E1868((void **)a3, v31);
    }
LABEL_23:
    v9 = v23;
    goto LABEL_24;
  }
  v32 = qword_100999810;
  if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_INFO))
  {
    v33 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1);
    *(_DWORD *)buf = 136446210;
    v40 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Ignoring read as '%{public}s' cache has not been loaded yet", buf, 0xCu);
  }
LABEL_24:

}

- (BOOL)createDatabase:(sqlite3 *)a3 type:(unint64_t)a4 path:(const char *)a5 flags:(int)a6
{
  int v10;
  NSObject *v11;
  const char *v13;
  const char *v14;
  int v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  v10 = sqlite3_open_v2(a5, a3, a6 | 4, 0);
  if (v10)
  {
    v11 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
    {
      v13 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", a4);
      v14 = sqlite3_errmsg(*a3);
      v15 = sqlite3_extended_errcode(*a3);
      v16 = 136447234;
      v17 = v13;
      v18 = 2080;
      v19 = a5;
      v20 = 1024;
      v21 = v10;
      v22 = 2082;
      v23 = v14;
      v24 = 1024;
      v25 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create '%{public}s' cache at \"%s\" with error %d (%{public}s, %d)", (uint8_t *)&v16, 0x2Cu);
    }
    if (*a3)
    {
      sqlite3_close_v2(*a3);
      *a3 = 0;
    }
  }
  else
  {
    -[LeDeviceCache createTablesForDatabase:type:](self, "createTablesForDatabase:type:", *a3, a4);
  }
  return v10 == 0;
}

- (BOOL)loadDatabase:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  const std::__fs::filesystem::path *v8;
  void *v9;
  sqlite3 **p_otherDatabase;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  id v17;
  void *v18;
  unsigned int v19;
  id v20;
  unsigned int v21;
  NSObject *v22;
  id v23;
  void *v24;
  unsigned int v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  int v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  void *v36;
  sqlite3 *v37;
  int v38;
  NSObject *v39;
  const char *v40;
  int v41;
  void *v42;
  void *v43;
  id v44;
  const std::__fs::filesystem::path *v45;
  std::error_code *v46;
  void *v47;
  void *v48;
  id v49;
  const std::__fs::filesystem::path *v50;
  std::error_code *v51;
  const char *v52;
  void *v53;
  sqlite3 *v54;
  void *v55;
  int v56;
  NSObject *v57;
  const char *v58;
  int v59;
  const char *v60;
  NSObject *v61;
  const char *v62;
  NSObject *v63;
  const char *v64;
  NSObject *v65;
  const char *v66;
  BOOL v67;
  NSObject *v68;
  const char *v69;
  void *v70;
  sqlite3 *v71;
  id v72;
  int v73;
  NSObject *v74;
  uint64_t v75;
  int v76;
  int v77;
  NSObject *v78;
  const char *v80;
  int v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  NSDateFormatter *v89;
  sqlite3_stmt **ppStmt;
  const char *ppStmta;
  void *v92;
  void *__p[2];
  char v94;
  char v95;
  int v96;
  id v97;
  id v98;
  _BYTE v99[28];
  __int16 v100;
  int v101;
  _DWORD v102[8];
  stat buf;

  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LeDeviceCache databaseContainerURL](self, "databaseContainerURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("com.apple.MobileBluetooth.ledevices.other.db")));

    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path")));
    v8 = (const std::__fs::filesystem::path *)objc_msgSend(v7, "UTF8String");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    p_otherDatabase = &self->_otherDatabase;
    ppStmt = &self->_writeOtherDeviceStmt;
    if ((objc_msgSend(v92, "fileExistsAtPath:", v9) & 1) != 0)
    {
      v11 = 3145730;

    }
    else
    {
      v15 = objc_msgSend(v92, "fileExistsAtPath:", CFSTR("/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db"));
      v11 = 3145730;

      if (v15)
      {
        v16 = qword_100999810;
        if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
        {
          v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path")));
          buf.st_dev = 136315394;
          *(_QWORD *)&buf.st_mode = "/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db";
          WORD2(buf.st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)objc_msgSend(v17, "UTF8String");
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Moving LE database from %s to %s", (uint8_t *)&buf, 0x16u);

        }
        chmod("/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db", 0x1B6u);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
        v97 = 0;
        v19 = objc_msgSend(v92, "copyItemAtPath:toPath:error:", CFSTR("/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db"), v18, &v97);
        v20 = v97;

        if (v19)
        {
          objc_msgSend(v92, "removeItemAtPath:error:", CFSTR("/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db"), 0);
        }
        else
        {
          v27 = qword_100999810;
          if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
          {
            v82 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedDescription")));
            v83 = objc_msgSend(v82, "UTF8String");
            buf.st_dev = 136446210;
            *(_QWORD *)&buf.st_mode = v83;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to move old database to new path: %{public}s", (uint8_t *)&buf, 0xCu);

          }
        }

      }
    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LeDeviceCache databaseContainerURL](self, "databaseContainerURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByAppendingPathComponent:", CFSTR("com.apple.MobileBluetooth.ledevices.paired.db")));

    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path")));
    v8 = (const std::__fs::filesystem::path *)objc_msgSend(v13, "UTF8String");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    p_otherDatabase = &self->_pairedDatabase;
    ppStmt = &self->_writePairedDeviceStmt;
    if ((objc_msgSend(v92, "fileExistsAtPath:", v14) & 1) != 0)
    {

    }
    else
    {
      v21 = objc_msgSend(v92, "fileExistsAtPath:", CFSTR("/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.paired.db"));

      if (!v21)
      {
        v11 = 4194306;
        goto LABEL_24;
      }
      v22 = qword_100999810;
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path")));
        buf.st_dev = 136315394;
        *(_QWORD *)&buf.st_mode = "/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.paired.db";
        WORD2(buf.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)objc_msgSend(v23, "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Moving LE database from %s to %s", (uint8_t *)&buf, 0x16u);

      }
      chmod("/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.paired.db", 0x1B6u);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
      v98 = 0;
      v25 = objc_msgSend(v92, "copyItemAtPath:toPath:error:", CFSTR("/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.paired.db"), v24, &v98);
      v26 = v98;

      if (v25)
      {
        objc_msgSend(v92, "removeItemAtPath:error:", CFSTR("/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.paired.db"), 0);
      }
      else
      {
        v28 = qword_100999810;
        if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
        {
          v84 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedDescription")));
          v85 = objc_msgSend(v84, "UTF8String");
          buf.st_dev = 136446210;
          *(_QWORD *)&buf.st_mode = v85;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to move old database to new path: %{public}s", (uint8_t *)&buf, 0xCu);

        }
      }

    }
    v11 = 4194306;
  }
LABEL_24:
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", CFSTR("/var/mobile/Library/Preferences/com.apple.MobileBluetooth.ledevices.plist")));
  v96 = v29 != 0;
  memset(&buf, 0, sizeof(buf));
  if (!stat((const char *)v8, &buf))
  {
    if (v96 == 1 && os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_FAULT))
      sub_1006E19BC();
    v30 = sqlite3_open_v2((const char *)v8, p_otherDatabase, v11, 0);
    if (v30)
    {
      v31 = qword_100999810;
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
      {
        v32 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", a3);
        *(_DWORD *)v99 = 136446722;
        *(_QWORD *)&v99[4] = v32;
        *(_WORD *)&v99[12] = 2080;
        *(_QWORD *)&v99[14] = v8;
        *(_WORD *)&v99[22] = 1024;
        *(_DWORD *)&v99[24] = v30;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to open '%{public}s' cache at \"%s\", result is %d", v99, 0x1Cu);
      }
    }
    else
    {
      v89 = objc_opt_new(NSDateFormatter);
      -[NSDateFormatter setDateFormat:](v89, "setDateFormat:", CFSTR("HH:mm:ss_MM-dd-yyyy"));
      if (-[LeDeviceCache readIntFromDatabase:statement:value:](self, "readIntFromDatabase:statement:value:", *p_otherDatabase, CFSTR("SELECT value FROM _SqliteDatabaseProperties WHERE key = '_ClientVersion'"), &v96))
      {
        v33 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT COUNT() FROM sqlite_master WHERE type='table' AND name='%s';"),
                  -[LeDeviceCache tableNameForType:](self, "tableNameForType:", a3)));
        v102[0] = 0;
        v88 = (void *)v33;
        v34 = -[LeDeviceCache readIntFromDatabase:statement:value:](self, "readIntFromDatabase:statement:value:", *p_otherDatabase, v33, v102);
        if (v102[0])
          v35 = v34;
        else
          v35 = 0;
        if ((v35 & 1) != 0)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS UuidIndex ON %s(Uuid);"),
                            -[LeDeviceCache tableNameForType:](self, "tableNameForType:", a3)));
          v37 = *p_otherDatabase;
          v87 = objc_retainAutorelease(v36);
          v38 = sqlite3_exec(v37, (const char *)objc_msgSend(v87, "UTF8String"), 0, 0, 0);
          v39 = qword_100999810;
          if (v38)
          {
            if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
            {
              v40 = sqlite3_errmsg(*p_otherDatabase);
              v41 = sqlite3_extended_errcode(*p_otherDatabase);
              *(_DWORD *)v99 = 67109634;
              *(_DWORD *)&v99[4] = v38;
              *(_WORD *)&v99[8] = 2080;
              *(_QWORD *)&v99[10] = v40;
              *(_WORD *)&v99[18] = 1024;
              *(_DWORD *)&v99[20] = v41;
              _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to create Uuid index with error %d (%s, %d)", v99, 0x18u);
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_INFO))
            {
              v52 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", a3);
              *(_DWORD *)v99 = 136446210;
              *(_QWORD *)&v99[4] = v52;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Created index for '%{public}s'", v99, 0xCu);
            }
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS %s (%s TEXT, %s TEXT, UNIQUE(%s));CREATE INDEX IF NOT EXISTS %s ON %s (%s);"),
                              "CustomProperties",
                              "Uuid",
                              "JSON",
                              "Uuid",
                              "CustomPropertiesIndex",
                              "CustomProperties",
                              "Uuid"));
            v54 = *p_otherDatabase;
            v86 = objc_retainAutorelease(v53);
            v55 = v86;
            v56 = sqlite3_exec(v54, (const char *)objc_msgSend(v86, "UTF8String"), 0, 0, 0);
            v57 = qword_100999810;
            if (v56)
            {
              if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
              {
                v58 = sqlite3_errmsg(*p_otherDatabase);
                v59 = sqlite3_extended_errcode(*p_otherDatabase);
                *(_DWORD *)v99 = 67109634;
                *(_DWORD *)&v99[4] = v56;
                *(_WORD *)&v99[8] = 2080;
                *(_QWORD *)&v99[10] = v58;
                *(_WORD *)&v99[18] = 1024;
                *(_DWORD *)&v99[20] = v59;
                _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Failed to create CustomProperties table and index with error %d (%s, %d)", v99, 0x18u);
                v55 = v86;
              }
            }
            else if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_INFO))
            {
              v60 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", a3);
              *(_DWORD *)v99 = 136446210;
              *(_QWORD *)&v99[4] = v60;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "Verified CustomProperties table is ready and indexed for '%{public}s'", v99, 0xCu);
            }

          }
        }
        else
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v89, "stringFromDate:", v47));
          v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s.%@.corrupt"), v8, v48)));
          v50 = (const std::__fs::filesystem::path *)objc_msgSend(v49, "UTF8String");
          rename(v8, v50, v51);

          if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_FAULT))
          {
            -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", a3);
            sub_1006E1954();
          }
          v96 = 0;
          sqlite3_close_v2(*p_otherDatabase);
          *p_otherDatabase = 0;
        }

      }
      else
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v89, "stringFromDate:", v42));
        v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s.%@.corrupt"), v8, v43)));
        v45 = (const std::__fs::filesystem::path *)objc_msgSend(v44, "UTF8String");
        rename(v8, v45, v46);

        if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_FAULT))
        {
          -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", a3);
          sub_1006E1988();
        }
        sqlite3_close_v2(*p_otherDatabase);
        *p_otherDatabase = 0;
      }

    }
  }
  if (!v96)
  {
    v65 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
    {
      v66 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", a3);
      *(_DWORD *)v99 = 136446210;
      *(_QWORD *)&v99[4] = v66;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Current '%{public}s' cache version is: none", v99, 0xCu);
    }
    if (-[LeDeviceCache createDatabase:type:path:flags:](self, "createDatabase:type:path:flags:", p_otherDatabase, a3, v8, v11))
    {
      goto LABEL_71;
    }
    goto LABEL_68;
  }
  if (v96 != 1)
  {
    if (v96 == 2)
    {
      v61 = qword_100999810;
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
      {
        v62 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", a3);
        *(_DWORD *)v99 = 136446466;
        *(_QWORD *)&v99[4] = v62;
        *(_WORD *)&v99[12] = 1024;
        *(_DWORD *)&v99[14] = v96;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Current '%{public}s' cache version is: up-to-date (v%d)", v99, 0x12u);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_FAULT))
    {
      -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", a3);
      sub_1006E18F4();
    }
    goto LABEL_71;
  }
  v63 = qword_100999810;
  if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
  {
    v64 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", a3);
    *(_DWORD *)v99 = 136446210;
    *(_QWORD *)&v99[4] = v64;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Current '%{public}s' cache version is: legacy plist", v99, 0xCu);
  }
  if (!-[LeDeviceCache createDatabase:type:path:flags:](self, "createDatabase:type:path:flags:", p_otherDatabase, a3, v8, v11))
  {
LABEL_68:
    v67 = 0;
    goto LABEL_92;
  }
  -[LeDeviceCache migratePlistData:database:type:](self, "migratePlistData:database:type:", v29, *p_otherDatabase, a3);
LABEL_71:
  if (*p_otherDatabase)
  {
    sqlite3_extended_result_codes(*p_otherDatabase, 1);
    sqlite3_exec(*p_otherDatabase, "PRAGMA journal_mode = 'wal'", 0, 0, 0);
  }
  v68 = qword_100999810;
  if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
  {
    v69 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", a3);
    *(_DWORD *)v99 = 136446210;
    *(_QWORD *)&v99[4] = v69;
    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Successfully loaded '%{public}s' cache from disk", v99, 0xCu);
  }
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("INSERT INTO %s (Uuid, Name, NameOrigin, Address, ResolvedAddress, LastSeenTime, LastConnectionTime, GATTServiceChangeConfig, Tags, iCloudIdentifier) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10)"), -[LeDeviceCache tableNameForType:](self, "tableNameForType:", a3)));
  v71 = *p_otherDatabase;
  v72 = objc_retainAutorelease(v70);
  v73 = sqlite3_prepare_v2(v71, (const char *)objc_msgSend(v72, "UTF8String"), -1, ppStmt, 0);
  if (v73)
  {
    v74 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
    {
      ppStmta = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", a3);
      v80 = sqlite3_errmsg(*p_otherDatabase);
      v81 = sqlite3_extended_errcode(*p_otherDatabase);
      *(_DWORD *)v99 = 136446978;
      *(_QWORD *)&v99[4] = ppStmta;
      *(_WORD *)&v99[12] = 1024;
      *(_DWORD *)&v99[14] = v73;
      *(_WORD *)&v99[18] = 2082;
      *(_QWORD *)&v99[20] = v80;
      v100 = 1024;
      v101 = v81;
      _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "Failed to create prepared write statement for '%{public}s' cache with error %d (%{public}s, %d)", v99, 0x22u);
    }
  }
  v95 = 0;
  v75 = sub_100027F68();
  sub_100091AE8(v99, "LeDeviceCache");
  sub_100091AE8(__p, "WipeNameOrigin");
  (*(void (**)(uint64_t, _BYTE *, void **, char *))(*(_QWORD *)v75 + 72))(v75, v99, __p, &v95);
  if (v94 < 0)
    operator delete(__p[0]);
  if ((v99[23] & 0x80000000) != 0)
    operator delete(*(void **)v99);
  if (qword_100977B40 != -1)
    dispatch_once(&qword_100977B40, &stru_1009291F8);
  v76 = sub_1004B9B50((uint64_t)off_100977B38);
  if (v95)
    v77 = 1;
  else
    v77 = v76;
  if (v77 == 1)
  {
    v78 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v99 = 0;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "LeDeviceCache Wipe Name Origin for all LE devices", v99, 2u);
    }
    -[LeDeviceCache wipeDatabaseNameOrigin:](self, "wipeDatabaseNameOrigin:", a3);
  }

  v67 = 1;
LABEL_92:

  return v67;
}

- (void)createTablesForDatabase:(sqlite3 *)a3 type:(unint64_t)a4
{
  void *v7;
  NSObject *v8;
  id v9;
  int v10;
  NSObject *v11;
  const char *v12;
  int v13;
  uint8_t buf[4];
  _BYTE v15[14];
  __int16 v16;
  int v17;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS _SqliteDatabaseProperties;CREATE TABLE _SqliteDatabaseProperties(key TEXT, value TEXT, UNIQUE(key));INSERT INTO _SqliteDatabaseProperties (key, value) VALUES ('_ClientVersion', %d);DROP TABLE IF EXISTS %s;CREATE TABLE %s(Uuid TEXT, Name TEXT, NameOrigin INT, Address TEXT, ResolvedAddress TEXT, LastSeenTime INT, LastConnectionTime INT, GATTServiceChangeConfig INT, Tags TEXT, iCloudIdentifier TEXT);DROP INDEX IF EXISTS %s;DROP TABLE IF EXISTS %s;CREATE TABLE %s (%s TEXT, %s TEXT, UNIQUE(%s));CREATE INDEX IF NOT EXISTS %s ON %s (%s);"),
                   2,
                   -[LeDeviceCache tableNameForType:](self, "tableNameForType:", a4),
                   -[LeDeviceCache tableNameForType:](self, "tableNameForType:", a4),
                   "CustomPropertiesIndex",
                   "CustomProperties",
                   "CustomProperties",
                   "Uuid",
                   "JSON",
                   "Uuid",
                   "CustomPropertiesIndex",
                   "CustomProperties",
                   "Uuid"));
  v8 = qword_100999810;
  if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)v15 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", a4);
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating new '%{public}s' cache", buf, 0xCu);
  }
  v9 = objc_retainAutorelease(v7);
  v10 = sqlite3_exec(a3, (const char *)objc_msgSend(v9, "UTF8String"), 0, 0, 0);
  if (v10)
  {
    v11 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
    {
      v12 = sqlite3_errmsg(a3);
      v13 = sqlite3_extended_errcode(a3);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v15 = v10;
      *(_WORD *)&v15[4] = 2082;
      *(_QWORD *)&v15[6] = v12;
      v16 = 1024;
      v17 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create tables with error %d (%{public}s, %d)", buf, 0x18u);
    }
  }

}

- (void)migratePlistData:(id)a3 database:(sqlite3 *)a4 type:(unint64_t)a5
{
  NSObject *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  sqlite3_stmt *v17;
  id v18;
  sqlite3_stmt *v19;
  id v20;
  sqlite3_stmt *v21;
  void *v22;
  sqlite3_stmt *v23;
  id v24;
  sqlite3_stmt *v25;
  id v26;
  sqlite3_stmt *v27;
  void *v28;
  sqlite3_stmt *v29;
  void *v30;
  sqlite3_stmt *v31;
  void *v32;
  sqlite3_stmt *v33;
  void *v34;
  id v35;
  sqlite3_stmt *v36;
  id v37;
  int v38;
  NSObject *v39;
  id v40;
  const char *v41;
  int v42;
  id v43;
  int v44;
  NSObject *v45;
  void *v46;
  id v47;
  int v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  id v55;
  NSObject *v56;
  const char *v57;
  int v58;
  const char *v59;
  int v60;
  const char *v61;
  int v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  sqlite3 *db;
  void *v71;
  void *v72;
  id v73;
  id v74;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  _BYTE v77[24];
  __int16 v78;
  int v79;

  v67 = a3;
  v6 = qword_100999810;
  if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)v77 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", a5);
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Migrating '%{public}s' cache from legacy plist", buf, 0xCu);
  }
  v7 = sqlite3_exec(a4, "CREATE TABLE Temp(Uuid TEXT, Name TEXT, NameOrigin INT, Address TEXT, ResolvedAddress TEXT, LastSeenTime INT, LastConnectionTime INT, GATTServiceChangeConfig INT, Tags TEXT, iCloudIdentifier TEXT)", 0, 0, 0);
  if (v7)
  {
    v8 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
    {
      v57 = sqlite3_errmsg(a4);
      v58 = sqlite3_extended_errcode(a4);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v77 = v7;
      *(_WORD *)&v77[4] = 2082;
      *(_QWORD *)&v77[6] = v57;
      *(_WORD *)&v77[14] = 1024;
      *(_DWORD *)&v77[16] = v58;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to create temporary table with error %d (%{public}s, %d)", buf, 0x18u);
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", -[LeDeviceCache tableNameForType:](self, "tableNameForType:", a5)));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", v9));

  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "keyEnumerator"));
  ppStmt = 0;
  v10 = sqlite3_prepare_v2(a4, "INSERT INTO Temp (Uuid, Name, NameOrigin, Address, ResolvedAddress, LastSeenTime, LastConnectionTime, GATTServiceChangeConfig, Tags, iCloudIdentifier) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10)", -1, &ppStmt, 0);
  db = a4;
  if (v10)
  {
    v11 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
    {
      v12 = sqlite3_errmsg(a4);
      v13 = sqlite3_extended_errcode(a4);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v77 = v10;
      *(_WORD *)&v77[4] = 2082;
      *(_QWORD *)&v77[6] = v12;
      *(_WORD *)&v77[14] = 1024;
      *(_DWORD *)&v77[16] = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create prepared write statement for temporary cache with error %d (%{public}s, %d)", buf, 0x18u);
    }
  }
  else
  {
    while (1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "nextObject"));
      if (!v14)
        break;
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKeyedSubscript:", v15));
      v17 = ppStmt;
      v18 = objc_retainAutorelease(v15);
      sqlite3_bind_text(v17, 1, (const char *)objc_msgSend(v18, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      v19 = ppStmt;
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Name"))));
      sqlite3_bind_text(v19, 2, (const char *)objc_msgSend(v20, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      v21 = ppStmt;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("NameOrigin")));
      sqlite3_bind_int(v21, 3, (int)objc_msgSend(v22, "intValue"));

      v23 = ppStmt;
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Address"))));
      sqlite3_bind_text(v23, 4, (const char *)objc_msgSend(v24, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      v25 = ppStmt;
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ResolvedAddress"))));
      sqlite3_bind_text(v25, 5, (const char *)objc_msgSend(v26, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      v27 = ppStmt;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("LastSeenTime")));
      sqlite3_bind_int(v27, 6, (int)objc_msgSend(v28, "intValue"));

      v29 = ppStmt;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("LastConnectionTime")));
      sqlite3_bind_int(v29, 7, (int)objc_msgSend(v30, "intValue"));

      v31 = ppStmt;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("GATTServiceChangeConfig")));
      sqlite3_bind_int(v31, 8, (int)objc_msgSend(v32, "intValue"));

      v33 = ppStmt;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Tags")));
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "componentsJoinedByString:", CFSTR(","))));
      sqlite3_bind_text(v33, 9, (const char *)objc_msgSend(v35, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      v36 = ppStmt;
      v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("iCloudIdentifier"))));
      sqlite3_bind_text(v36, 10, (const char *)objc_msgSend(v37, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      v38 = sqlite3_step(ppStmt);
      if (v38 != 101)
      {
        v39 = qword_100999810;
        if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
        {
          v40 = objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
          v41 = sqlite3_errmsg(db);
          v42 = sqlite3_extended_errcode(db);
          *(_DWORD *)buf = 136446978;
          *(_QWORD *)v77 = v40;
          *(_WORD *)&v77[8] = 1024;
          *(_DWORD *)&v77[10] = v38;
          *(_WORD *)&v77[14] = 2082;
          *(_QWORD *)&v77[16] = v41;
          v78 = 1024;
          v79 = v42;
          _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to migrate device \"%{public}s\" with error %d (%{public}s, %d)", buf, 0x22u);
        }
      }
      sqlite3_reset(ppStmt);
      sqlite3_clear_bindings(ppStmt);

    }
    sqlite3_finalize(ppStmt);
  }
  v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("INSERT INTO %s SELECT * FROM Temp ORDER BY LastConnectionTime,LastSeenTime ASC; DROP TABLE Temp"),
                                       -[LeDeviceCache tableNameForType:](self, "tableNameForType:", a5))));
  v44 = sqlite3_exec(db, (const char *)objc_msgSend(v43, "UTF8String"), 0, 0, 0);
  if (v44)
  {
    v45 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
    {
      v59 = sqlite3_errmsg(db);
      v60 = sqlite3_extended_errcode(db);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v77 = v44;
      *(_WORD *)&v77[4] = 2082;
      *(_QWORD *)&v77[6] = v59;
      *(_WORD *)&v77[14] = 1024;
      *(_DWORD *)&v77[16] = v60;
      _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to insert from temporary table with error %d (%{public}s, %d)", buf, 0x18u);
    }
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UPDATE %s SET LastSeenTime = ROWID WHERE LastSeenTime > 0; UPDATE %s SET LastConnectionTime = ROWID WHERE LastConnectionTime > 0"),
                    -[LeDeviceCache tableNameForType:](self, "tableNameForType:", a5),
                    -[LeDeviceCache tableNameForType:](self, "tableNameForType:", a5)));

  v47 = objc_retainAutorelease(v46);
  v48 = sqlite3_exec(db, (const char *)objc_msgSend(v47, "UTF8String"), 0, 0, 0);
  if (v48)
  {
    v49 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
    {
      v61 = sqlite3_errmsg(db);
      v62 = sqlite3_extended_errcode(db);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v77 = v48;
      *(_WORD *)&v77[4] = 2082;
      *(_QWORD *)&v77[6] = v61;
      *(_WORD *)&v77[14] = 1024;
      *(_DWORD *)&v77[16] = v62;
      _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Failed to update from temporary table with error %d (%{public}s, %d)", buf, 0x18u);
    }
  }
  if (a5 == 1)
  {
    v50 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v77 = "/var/mobile/Library/Preferences/com.apple.MobileBluetooth.ledevices.plist";
      *(_WORD *)&v77[8] = 2080;
      *(_QWORD *)&v77[10] = "/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.plist";
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "Backing up legacy plist from \"%s\" to \"%s\", buf, 0x16u);
    }
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v74 = 0;
    objc_msgSend(v51, "copyItemAtPath:toPath:error:", CFSTR("/var/mobile/Library/Preferences/com.apple.MobileBluetooth.ledevices.plist"), CFSTR("/var/mobile/Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.plist"), &v74);
    v52 = v74;

    if (v52)
    {
      v53 = qword_100999810;
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
      {
        v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "localizedDescription")));
        v64 = objc_msgSend(v63, "UTF8String");
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)v77 = v64;
        _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Failed to backup legacy plist with error %{public}s", buf, 0xCu);

      }
    }

    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v73 = 0;
    objc_msgSend(v54, "removeItemAtPath:error:", CFSTR("/var/mobile/Library/Preferences/com.apple.MobileBluetooth.ledevices.plist"), &v73);
    v55 = v73;

    if (v55)
    {
      v56 = qword_100999810;
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
      {
        v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "localizedDescription")));
        v66 = objc_msgSend(v65, "UTF8String");
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)v77 = v66;
        _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Failed to clean up legacy plist with error %{public}s", buf, 0xCu);

      }
    }

  }
}

- (void)wipeDatabaseNameOrigin:(unint64_t)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  sqlite3 *v8;
  id v9;
  int v10;
  NSObject *v11;
  const char *v12;
  int v13;
  uint8_t buf[4];
  _BYTE v15[14];
  __int16 v16;
  int v17;

  v5 = qword_100999810;
  if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "Other";
    if (!a3)
      v6 = "Paired";
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Wipe Name Origin of %{public}s LE Device Database", buf, 0xCu);
  }
  v7 = 24;
  if (!a3)
    v7 = 16;
  v8 = *(Class *)((char *)&self->super.isa + v7);
  if (v8)
  {
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UPDATE %s SET NameOrigin = %d WHERE iCloudIdentifier = ''"), -[LeDeviceCache tableNameForType:](self, "tableNameForType:", a3), 1)));
    v10 = sqlite3_exec(v8, (const char *)objc_msgSend(v9, "UTF8String"), 0, 0, 0);
    if (v10)
    {
      v11 = qword_100999810;
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
      {
        v12 = sqlite3_errmsg(v8);
        v13 = sqlite3_extended_errcode(v8);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v15 = v10;
        *(_WORD *)&v15[4] = 2082;
        *(_QWORD *)&v15[6] = v12;
        v16 = 1024;
        v17 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to wipe name origin column of the table with error %d (%{public}s, %d)", buf, 0x18u);
      }
    }

  }
  else if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
  {
    sub_1006E19E8();
  }
}

- (void)updateProtectedCacheMetrics
{
  unsigned __int8 v3;
  NSObject *v4;
  unsigned int v5;
  unsigned int v6;
  NSObject *global_queue;
  _QWORD block[5];
  int v9;
  int v10;
  uint64_t v11;
  uint8_t buf[4];
  unsigned int v13;
  __int16 v14;
  unsigned int v15;

  v11 = 0;
  if (!-[LeDeviceCache readIntFromDatabase:statement:value:](self, "readIntFromDatabase:statement:value:", self->_otherDatabase, CFSTR("SELECT COUNT() FROM OtherDevices WHERE LastSeenTime > 0 AND LastConnectionTime = 0"), &self->_seenDeviceCount)&& os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
  {
    sub_1006E1A6C();
  }
  if (!-[LeDeviceCache readIntFromDatabase:statement:value:](self, "readIntFromDatabase:statement:value:", self->_otherDatabase, CFSTR("SELECT COUNT() FROM OtherDevices WHERE LastConnectionTime > 0"), &self->_connectedDeviceCount)&& os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
  {
    sub_1006E1A40();
  }
  if (!-[LeDeviceCache readIntFromDatabase:statement:value:](self, "readIntFromDatabase:statement:value:", self->_otherDatabase, CFSTR("SELECT MAX(LastSeenTime) FROM OtherDevices"), (char *)&v11 + 4)&& os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
  {
    sub_1006E1A14();
  }
  v3 = -[LeDeviceCache readIntFromDatabase:statement:value:](self, "readIntFromDatabase:statement:value:", self->_otherDatabase, CFSTR("SELECT MAX(LastConnectionTime) FROM OtherDevices"), &v11);
  v4 = qword_100999810;
  if ((v3 & 1) == 0 && os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to find the maximum last connected time", buf, 2u);
    v4 = qword_100999810;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[LeDeviceCache connectedDeviceCount](self, "connectedDeviceCount");
    v6 = -[LeDeviceCache seenDeviceCount](self, "seenDeviceCount");
    *(_DWORD *)buf = 67109376;
    v13 = v5;
    v14 = 1024;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unpaired device cache contains %d connected device(s) and %d seen device(s)", buf, 0xEu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100344898;
  block[3] = &unk_100918868;
  block[4] = self;
  v9 = HIDWORD(v11);
  v10 = v11;
  dispatch_async(global_queue, block);
}

- (BOOL)readIntFromDatabase:(sqlite3 *)a3 statement:(id)a4 value:(int *)a5
{
  id v7;
  BOOL v8;
  int v9;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v7 = objc_retainAutorelease(a4);
  if (sqlite3_prepare_v2(a3, (const char *)objc_msgSend(v7, "UTF8String"), -1, &ppStmt, 0))
  {
    v8 = 0;
  }
  else
  {
    v9 = sqlite3_step(ppStmt);
    v8 = v9 == 100;
    if (v9 == 100)
      *a5 = sqlite3_column_int(ppStmt, 0);
    sqlite3_finalize(ppStmt);
  }

  return v8;
}

- (vector<std::string,)findUUIDsWithCustomProperties:(LeDeviceCache *)self
{
  id v6;
  void *v7;
  sqlite3 *otherDatabase;
  sqlite3 *pairedDatabase;
  id v10;
  vector<std::string, std::allocator<std::string>> *result;
  const unsigned __int8 *v12;
  const unsigned __int8 *v13;
  void *v14;
  void *v15;
  char *var0;
  char *var1;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;
  char *v26;
  char *v27;
  char *v28;
  __int128 v29;
  int64x2_t v30;
  void *v31;
  void *v32;
  int v33;
  const unsigned __int8 *v34;
  const unsigned __int8 *v35;
  void *v36;
  void *v37;
  char *v38;
  char *v39;
  __int128 v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  char *v46;
  __int128 v47;
  char *v48;
  char *v49;
  char *v50;
  __int128 v51;
  int64x2_t v52;
  void *v53;
  void *v54;
  int v55;
  id v56;
  void *__p[2];
  uint64_t v58;
  sqlite3_stmt *ppStmt;
  uint64_t v60;
  int64x2_t v61;
  void *v62;
  __compressed_pair<std::string *, std::allocator<std::string>> *p_var2;

  v6 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT * FROM %s"), "CustomProperties"));
  ppStmt = 0;
  otherDatabase = self->_otherDatabase;
  v56 = objc_retainAutorelease(v7);
  if (!sqlite3_prepare_v2(otherDatabase, (const char *)objc_msgSend(v56, "UTF8String"), -1, &ppStmt, 0))
  {
    while (sqlite3_step(ppStmt) == 100)
    {
      v12 = sqlite3_column_text(ppStmt, 0);
      v13 = sqlite3_column_text(ppStmt, 1);
      if (v13 && v12)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v12));
        if (-[LeDeviceCache json:hasAnyProperty:](self, "json:hasAnyProperty:", v14, v6))
        {
          sub_100091AE8(__p, (char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
          var1 = (char *)retstr->var1;
          var0 = (char *)retstr->var2.var0;
          if (var1 >= var0)
          {
            v19 = 0xAAAAAAAAAAAAAAABLL * ((var1 - (char *)retstr->var0) >> 3);
            v20 = v19 + 1;
            if (v19 + 1 > 0xAAAAAAAAAAAAAAALL)
              abort();
            v21 = 0xAAAAAAAAAAAAAAABLL * ((var0 - (char *)retstr->var0) >> 3);
            if (2 * v21 > v20)
              v20 = 2 * v21;
            if (v21 >= 0x555555555555555)
              v22 = 0xAAAAAAAAAAAAAAALL;
            else
              v22 = v20;
            p_var2 = &retstr->var2;
            if (v22)
              v23 = (char *)sub_1002A479C((uint64_t)&retstr->var2, v22);
            else
              v23 = 0;
            v24 = &v23[24 * v19];
            v25 = *(_OWORD *)__p;
            *((_QWORD *)v24 + 2) = v58;
            *(_OWORD *)v24 = v25;
            __p[1] = 0;
            v58 = 0;
            __p[0] = 0;
            v27 = (char *)retstr->var0;
            v26 = (char *)retstr->var1;
            if (v26 == retstr->var0)
            {
              v30 = vdupq_n_s64((unint64_t)v26);
              v28 = &v23[24 * v19];
            }
            else
            {
              v28 = &v23[24 * v19];
              do
              {
                v29 = *(_OWORD *)(v26 - 24);
                *((_QWORD *)v28 - 1) = *((_QWORD *)v26 - 1);
                *(_OWORD *)(v28 - 24) = v29;
                v28 -= 24;
                *((_QWORD *)v26 - 2) = 0;
                *((_QWORD *)v26 - 1) = 0;
                *((_QWORD *)v26 - 3) = 0;
                v26 -= 24;
              }
              while (v26 != v27);
              v30 = *(int64x2_t *)&retstr->var0;
            }
            v31 = v24 + 24;
            retstr->var0 = v28;
            retstr->var1 = v24 + 24;
            v61 = v30;
            v32 = retstr->var2.var0;
            retstr->var2.var0 = &v23[24 * v22];
            v62 = v32;
            v60 = v30.i64[0];
            sub_1002A56A4((uint64_t)&v60);
            v33 = SHIBYTE(v58);
            retstr->var1 = v31;
            if (v33 < 0)
              operator delete(__p[0]);
          }
          else
          {
            v18 = *(_OWORD *)__p;
            *((_QWORD *)var1 + 2) = v58;
            *(_OWORD *)var1 = v18;
            retstr->var1 = var1 + 24;
          }
        }

      }
    }
  }
  pairedDatabase = self->_pairedDatabase;
  v10 = objc_retainAutorelease(v56);
  if (!sqlite3_prepare_v2(pairedDatabase, (const char *)objc_msgSend(v10, "UTF8String"), -1, &ppStmt, 0))
  {
    while (sqlite3_step(ppStmt) == 100)
    {
      v34 = sqlite3_column_text(ppStmt, 0);
      v35 = sqlite3_column_text(ppStmt, 1);
      if (v35 && v34)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v35));
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v34));
        if (-[LeDeviceCache json:hasAnyProperty:](self, "json:hasAnyProperty:", v36, v6))
        {
          sub_100091AE8(__p, (char *)objc_msgSend(objc_retainAutorelease(v37), "UTF8String"));
          v39 = (char *)retstr->var1;
          v38 = (char *)retstr->var2.var0;
          if (v39 >= v38)
          {
            v41 = 0xAAAAAAAAAAAAAAABLL * ((v39 - (char *)retstr->var0) >> 3);
            v42 = v41 + 1;
            if (v41 + 1 > 0xAAAAAAAAAAAAAAALL)
              abort();
            v43 = 0xAAAAAAAAAAAAAAABLL * ((v38 - (char *)retstr->var0) >> 3);
            if (2 * v43 > v42)
              v42 = 2 * v43;
            if (v43 >= 0x555555555555555)
              v44 = 0xAAAAAAAAAAAAAAALL;
            else
              v44 = v42;
            p_var2 = &retstr->var2;
            if (v44)
              v45 = (char *)sub_1002A479C((uint64_t)&retstr->var2, v44);
            else
              v45 = 0;
            v46 = &v45[24 * v41];
            v47 = *(_OWORD *)__p;
            *((_QWORD *)v46 + 2) = v58;
            *(_OWORD *)v46 = v47;
            __p[1] = 0;
            v58 = 0;
            __p[0] = 0;
            v49 = (char *)retstr->var0;
            v48 = (char *)retstr->var1;
            if (v48 == retstr->var0)
            {
              v52 = vdupq_n_s64((unint64_t)v48);
              v50 = &v45[24 * v41];
            }
            else
            {
              v50 = &v45[24 * v41];
              do
              {
                v51 = *(_OWORD *)(v48 - 24);
                *((_QWORD *)v50 - 1) = *((_QWORD *)v48 - 1);
                *(_OWORD *)(v50 - 24) = v51;
                v50 -= 24;
                *((_QWORD *)v48 - 2) = 0;
                *((_QWORD *)v48 - 1) = 0;
                *((_QWORD *)v48 - 3) = 0;
                v48 -= 24;
              }
              while (v48 != v49);
              v52 = *(int64x2_t *)&retstr->var0;
            }
            v53 = v46 + 24;
            retstr->var0 = v50;
            retstr->var1 = v46 + 24;
            v61 = v52;
            v54 = retstr->var2.var0;
            retstr->var2.var0 = &v45[24 * v44];
            v62 = v54;
            v60 = v52.i64[0];
            sub_1002A56A4((uint64_t)&v60);
            v55 = SHIBYTE(v58);
            retstr->var1 = v53;
            if (v55 < 0)
              operator delete(__p[0]);
          }
          else
          {
            v40 = *(_OWORD *)__p;
            *((_QWORD *)v39 + 2) = v58;
            *(_OWORD *)v39 = v40;
            retstr->var1 = v39 + 24;
          }
        }

      }
    }
  }

  return result;
}

- (vector<std::string,)findUUIDsWithAllCustomProperties:(LeDeviceCache *)self
{
  id v6;
  void *v7;
  sqlite3 *otherDatabase;
  sqlite3 *pairedDatabase;
  id v10;
  vector<std::string, std::allocator<std::string>> *result;
  const unsigned __int8 *v12;
  const unsigned __int8 *v13;
  void *v14;
  void *v15;
  char *var0;
  char *var1;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;
  char *v26;
  char *v27;
  char *v28;
  __int128 v29;
  int64x2_t v30;
  void *v31;
  void *v32;
  int v33;
  const unsigned __int8 *v34;
  const unsigned __int8 *v35;
  void *v36;
  void *v37;
  char *v38;
  char *v39;
  __int128 v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  char *v46;
  __int128 v47;
  char *v48;
  char *v49;
  char *v50;
  __int128 v51;
  int64x2_t v52;
  void *v53;
  void *v54;
  int v55;
  id v56;
  void *__p[2];
  uint64_t v58;
  sqlite3_stmt *ppStmt;
  uint64_t v60;
  int64x2_t v61;
  void *v62;
  __compressed_pair<std::string *, std::allocator<std::string>> *p_var2;

  v6 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT * FROM %s"), "CustomProperties"));
  ppStmt = 0;
  otherDatabase = self->_otherDatabase;
  v56 = objc_retainAutorelease(v7);
  if (!sqlite3_prepare_v2(otherDatabase, (const char *)objc_msgSend(v56, "UTF8String"), -1, &ppStmt, 0))
  {
    while (sqlite3_step(ppStmt) == 100)
    {
      v12 = sqlite3_column_text(ppStmt, 0);
      v13 = sqlite3_column_text(ppStmt, 1);
      if (v13 && v12)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v12));
        if (-[LeDeviceCache json:hasAllProperties:](self, "json:hasAllProperties:", v14, v6))
        {
          sub_100091AE8(__p, (char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
          var1 = (char *)retstr->var1;
          var0 = (char *)retstr->var2.var0;
          if (var1 >= var0)
          {
            v19 = 0xAAAAAAAAAAAAAAABLL * ((var1 - (char *)retstr->var0) >> 3);
            v20 = v19 + 1;
            if (v19 + 1 > 0xAAAAAAAAAAAAAAALL)
              abort();
            v21 = 0xAAAAAAAAAAAAAAABLL * ((var0 - (char *)retstr->var0) >> 3);
            if (2 * v21 > v20)
              v20 = 2 * v21;
            if (v21 >= 0x555555555555555)
              v22 = 0xAAAAAAAAAAAAAAALL;
            else
              v22 = v20;
            p_var2 = &retstr->var2;
            if (v22)
              v23 = (char *)sub_1002A479C((uint64_t)&retstr->var2, v22);
            else
              v23 = 0;
            v24 = &v23[24 * v19];
            v25 = *(_OWORD *)__p;
            *((_QWORD *)v24 + 2) = v58;
            *(_OWORD *)v24 = v25;
            __p[1] = 0;
            v58 = 0;
            __p[0] = 0;
            v27 = (char *)retstr->var0;
            v26 = (char *)retstr->var1;
            if (v26 == retstr->var0)
            {
              v30 = vdupq_n_s64((unint64_t)v26);
              v28 = &v23[24 * v19];
            }
            else
            {
              v28 = &v23[24 * v19];
              do
              {
                v29 = *(_OWORD *)(v26 - 24);
                *((_QWORD *)v28 - 1) = *((_QWORD *)v26 - 1);
                *(_OWORD *)(v28 - 24) = v29;
                v28 -= 24;
                *((_QWORD *)v26 - 2) = 0;
                *((_QWORD *)v26 - 1) = 0;
                *((_QWORD *)v26 - 3) = 0;
                v26 -= 24;
              }
              while (v26 != v27);
              v30 = *(int64x2_t *)&retstr->var0;
            }
            v31 = v24 + 24;
            retstr->var0 = v28;
            retstr->var1 = v24 + 24;
            v61 = v30;
            v32 = retstr->var2.var0;
            retstr->var2.var0 = &v23[24 * v22];
            v62 = v32;
            v60 = v30.i64[0];
            sub_1002A56A4((uint64_t)&v60);
            v33 = SHIBYTE(v58);
            retstr->var1 = v31;
            if (v33 < 0)
              operator delete(__p[0]);
          }
          else
          {
            v18 = *(_OWORD *)__p;
            *((_QWORD *)var1 + 2) = v58;
            *(_OWORD *)var1 = v18;
            retstr->var1 = var1 + 24;
          }
        }

      }
    }
  }
  pairedDatabase = self->_pairedDatabase;
  v10 = objc_retainAutorelease(v56);
  if (!sqlite3_prepare_v2(pairedDatabase, (const char *)objc_msgSend(v10, "UTF8String"), -1, &ppStmt, 0))
  {
    while (sqlite3_step(ppStmt) == 100)
    {
      v34 = sqlite3_column_text(ppStmt, 0);
      v35 = sqlite3_column_text(ppStmt, 1);
      if (v35 && v34)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v35));
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v34));
        if (-[LeDeviceCache json:hasAllProperties:](self, "json:hasAllProperties:", v36, v6))
        {
          sub_100091AE8(__p, (char *)objc_msgSend(objc_retainAutorelease(v37), "UTF8String"));
          v39 = (char *)retstr->var1;
          v38 = (char *)retstr->var2.var0;
          if (v39 >= v38)
          {
            v41 = 0xAAAAAAAAAAAAAAABLL * ((v39 - (char *)retstr->var0) >> 3);
            v42 = v41 + 1;
            if (v41 + 1 > 0xAAAAAAAAAAAAAAALL)
              abort();
            v43 = 0xAAAAAAAAAAAAAAABLL * ((v38 - (char *)retstr->var0) >> 3);
            if (2 * v43 > v42)
              v42 = 2 * v43;
            if (v43 >= 0x555555555555555)
              v44 = 0xAAAAAAAAAAAAAAALL;
            else
              v44 = v42;
            p_var2 = &retstr->var2;
            if (v44)
              v45 = (char *)sub_1002A479C((uint64_t)&retstr->var2, v44);
            else
              v45 = 0;
            v46 = &v45[24 * v41];
            v47 = *(_OWORD *)__p;
            *((_QWORD *)v46 + 2) = v58;
            *(_OWORD *)v46 = v47;
            __p[1] = 0;
            v58 = 0;
            __p[0] = 0;
            v49 = (char *)retstr->var0;
            v48 = (char *)retstr->var1;
            if (v48 == retstr->var0)
            {
              v52 = vdupq_n_s64((unint64_t)v48);
              v50 = &v45[24 * v41];
            }
            else
            {
              v50 = &v45[24 * v41];
              do
              {
                v51 = *(_OWORD *)(v48 - 24);
                *((_QWORD *)v50 - 1) = *((_QWORD *)v48 - 1);
                *(_OWORD *)(v50 - 24) = v51;
                v50 -= 24;
                *((_QWORD *)v48 - 2) = 0;
                *((_QWORD *)v48 - 1) = 0;
                *((_QWORD *)v48 - 3) = 0;
                v48 -= 24;
              }
              while (v48 != v49);
              v52 = *(int64x2_t *)&retstr->var0;
            }
            v53 = v46 + 24;
            retstr->var0 = v50;
            retstr->var1 = v46 + 24;
            v61 = v52;
            v54 = retstr->var2.var0;
            retstr->var2.var0 = &v45[24 * v44];
            v62 = v54;
            v60 = v52.i64[0];
            sub_1002A56A4((uint64_t)&v60);
            v55 = SHIBYTE(v58);
            retstr->var1 = v53;
            if (v55 < 0)
              operator delete(__p[0]);
          }
          else
          {
            v40 = *(_OWORD *)__p;
            *((_QWORD *)v39 + 2) = v58;
            *(_OWORD *)v39 = v40;
            retstr->var1 = v39 + 24;
          }
        }

      }
    }
  }

  return result;
}

- (id)customPropertiesJSONFromDevice:(const void *)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (id)a3;
  if (a3)
  {
    v4 = sub_10064E8D4((uint64_t)a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = v5;
    if (!v5 || !objc_msgSend(v5, "count"))
    {
      v3 = 0;
LABEL_23:

      return v3;
    }
    v7 = objc_opt_new(NSMutableDictionary);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v13 = sub_10064E900((uint64_t)v3, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          if (v14)
            -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v14, v12);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v7))
    {
      v15 = objc_alloc((Class)NSString);
      v19 = 0;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v7, 3, &v19));
      v17 = v19;
      v3 = objc_msgSend(v15, "initWithData:encoding:", v16, 4);

      if (!v17)
      {
        v6 = v8;
        goto LABEL_22;
      }
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
        sub_1006E1A98();

    }
    else if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
    {
      sub_1006E1B04();
    }
    v3 = 0;
LABEL_22:

    goto LABEL_23;
  }
  return v3;
}

- (BOOL)json:(id)a3 hasAnyProperty:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
    v23 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v7, 17, &v23));
    v9 = v23;

    if (v9)
    {
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
        sub_1006E1BD4();
    }
    else
    {
      v11 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
      {
        v9 = v8;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v12 = v6;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v20;
          while (2)
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v12);
              v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys", (_QWORD)v19));
              LOBYTE(v16) = objc_msgSend(v17, "containsObject:", v16);

              if ((v16 & 1) != 0)
              {

                v10 = 1;
                goto LABEL_19;
              }
            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
            if (v13)
              continue;
            break;
          }
        }

      }
      else if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
      {
        sub_1006E1B68();
      }
    }
    v10 = 0;
LABEL_19:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)json:(id)a3 hasAllProperties:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  unsigned __int8 v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
    v17 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v7, 17, &v17));
    v9 = v17;

    if (v9)
    {
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
        sub_1006E1CAC();
    }
    else
    {
      v11 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
      {
        v12 = v8;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allKeys"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
        v10 = objc_msgSend(v15, "isSubsetOfSet:", v14);

LABEL_11:
        goto LABEL_12;
      }
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
        sub_1006E1C40();
    }
    v10 = 0;
    goto LABEL_11;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (void)customPropertiesToDevice:(void *)a3 fromJSON:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];

  v5 = a4;
  v6 = v5;
  if (a3 && v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
    v22 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v7, 17, &v22));
    v17 = v22;

    if (v17 && os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
      sub_1006E1D84();
    v9 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      v10 = v8;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v15));
            sub_10064E988((uint64_t)a3, v15, v16);

          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v12);
      }

    }
    else if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
    {
      sub_1006E1D18();
    }

  }
}

- (void)writeCustomPropertiesJSONForDevice:(const void *)a3 inDatabase:(sqlite3 *)a4
{
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  sqlite3_stmt *v12;
  id v13;
  int v14;
  NSObject *v15;
  const char *v16;
  int v17;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

  if (a3 && a4)
  {
    v7 = *(id *)a3;
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[LeDeviceCache customPropertiesJSONFromDevice:](self, "customPropertiesJSONFromDevice:", a3));
      if (v8)
      {
        ppStmt = 0;
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO %s (%s, %s) VALUES (?1, ?2)"), "CustomProperties", "Uuid", "JSON")));
        if (sqlite3_prepare_v2(a4, (const char *)objc_msgSend(v9, "UTF8String"), -1, &ppStmt, 0))
        {
          if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
            sub_1006E1E1C();
        }
        else
        {
          v12 = ppStmt;
          v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString")));
          sqlite3_bind_text(v12, 1, (const char *)objc_msgSend(v13, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

          sqlite3_bind_text(ppStmt, 2, (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          v14 = sqlite3_step(ppStmt);
          if (v14 != 101)
          {
            v15 = qword_100999810;
            if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
            {
              v16 = sqlite3_errmsg(a4);
              v17 = sqlite3_extended_errcode(a4);
              *(_DWORD *)buf = 67109634;
              v20 = v14;
              v21 = 2082;
              v22 = v16;
              v23 = 1024;
              v24 = v17;
              _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to create prepared write statement for Custom Properties cache with error %d (%{public}s, %d)", buf, 0x18u);
            }
          }
          sqlite3_reset(ppStmt);
          sqlite3_clear_bindings(ppStmt);
          sqlite3_finalize(ppStmt);
        }

      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
        -[LeDeviceCache removeCustomPropertiesJSONForDeviceUUID:inDatabase:](self, "removeCustomPropertiesJSONForDeviceUUID:inDatabase:", v11, a4);

      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
    {
      sub_1006E1DF0();
    }

  }
  else
  {
    v10 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
      sub_1006E1E80(a3 != 0, a4 != 0, v10);
  }
}

- (void)removeCustomPropertiesJSONForDeviceUUID:(id)a3 inDatabase:(sqlite3 *)a4
{
  id v6;
  void *v7;
  id v8;
  int v9;
  NSObject *v10;
  id v11;
  const char *v12;
  int v13;
  int v14;
  NSObject *v15;
  id v16;
  const char *v17;
  int v18;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LeDeviceCache readCustomPropertiesJSONForDeviceUUID:inDatabase:](self, "readCustomPropertiesJSONForDeviceUUID:inDatabase:", v6, a4));

  if (v7)
  {
    ppStmt = 0;
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DELETE FROM %s WHERE %s = '%@'"), "CustomProperties", "Uuid", v6)));
    v9 = sqlite3_prepare_v2(a4, (const char *)objc_msgSend(v8, "UTF8String"), -1, &ppStmt, 0);
    if (v9)
    {
      v10 = qword_100999810;
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
      {
        v11 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        v12 = sqlite3_errmsg(a4);
        v13 = sqlite3_extended_errcode(a4);
        *(_DWORD *)buf = 136315906;
        v21 = v11;
        v22 = 1024;
        v23 = v9;
        v24 = 2082;
        v25 = v12;
        v26 = 1024;
        v27 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to prepare statement \"%s\" with error %d (%{public}s, %d)", buf, 0x22u);
      }
    }
    else
    {
      v14 = sqlite3_step(ppStmt);
      if (v14 != 101)
      {
        v15 = qword_100999810;
        if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
        {
          v16 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
          v17 = sqlite3_errmsg(a4);
          v18 = sqlite3_extended_errcode(a4);
          *(_DWORD *)buf = 136315906;
          v21 = v16;
          v22 = 1024;
          v23 = v14;
          v24 = 2082;
          v25 = v17;
          v26 = 1024;
          v27 = v18;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to execute statement \"%s\" with error %d (%{public}s, %d)", buf, 0x22u);
        }
      }
      sqlite3_finalize(ppStmt);
    }

  }
}

- (id)readCustomPropertiesJSONForDeviceUUID:(id)a3 inDatabase:(sqlite3 *)a4
{
  id v5;
  void *v6;
  id v7;
  int v8;
  NSObject *v9;
  int v10;
  const unsigned __int8 *v11;
  id v13;
  const char *v14;
  int v15;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

  v5 = a3;
  v6 = 0;
  if (v5 && a4)
  {
    ppStmt = 0;
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT * FROM %s WHERE %s = '%@'"), "CustomProperties", "Uuid", v5)));
    v8 = sqlite3_prepare_v2(a4, (const char *)objc_msgSend(v7, "UTF8String"), -1, &ppStmt, 0);
    if (v8)
    {
      v9 = qword_100999810;
      if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
      {
        v13 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
        v14 = sqlite3_errmsg(a4);
        v15 = sqlite3_extended_errcode(a4);
        *(_DWORD *)buf = 136315906;
        v18 = v13;
        v19 = 1024;
        v20 = v8;
        v21 = 2082;
        v22 = v14;
        v23 = 1024;
        v24 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to execute statement \"%s\" with error %d (%{public}s, %d)", buf, 0x22u);
      }
      v6 = 0;
      goto LABEL_15;
    }
    v10 = sqlite3_step(ppStmt);
    if (v10 != 101)
    {
      if (v10 == 100)
      {
        v11 = sqlite3_column_text(ppStmt, 1);
        if (v11)
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11));
LABEL_14:
          sqlite3_finalize(ppStmt);
LABEL_15:

          goto LABEL_16;
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
      {
        sub_1006E1F18();
      }
    }
    v6 = 0;
    goto LABEL_14;
  }
LABEL_16:

  return v6;
}

- (void)readCustomPropertiesJSONForDevice:(void *)a3 inDatabase:(sqlite3 *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3 && a4)
  {
    v7 = *(id *)a3;
    v8 = v7;
    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[LeDeviceCache readCustomPropertiesJSONForDeviceUUID:inDatabase:](self, "readCustomPropertiesJSONForDeviceUUID:inDatabase:", v9, a4));

      if (v10)
        -[LeDeviceCache customPropertiesToDevice:fromJSON:](self, "customPropertiesToDevice:fromJSON:", a3, v10);

    }
    else if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
    {
      sub_1006E1F78();
    }

  }
}

- (id)nameFromSanitizedName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("///900")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR("’")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("///901")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", CFSTR("'")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("///902")));

  return v8;
}

- (void)evictIfNeeded:(BOOL)a3
{
  int v4;
  const unsigned __int8 *v5;
  void *v6;
  int v7;
  const unsigned __int8 *v8;
  sqlite3 *otherDatabase;
  id v10;
  int v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  int v15;
  sqlite3 *v16;
  id v17;
  int v18;
  NSObject *v19;
  const char *v20;
  const char *v21;
  int v22;
  const char *v23;
  const char *v24;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const unsigned __int8 *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;

  ppStmt = 0;
  if (a3)
  {
    v4 = -[LeDeviceCache connectedDeviceCount](self, "connectedDeviceCount");
    if (v4 >= -[LeDeviceCache maxConnectedDevices](self, "maxConnectedDevices")
      && !sqlite3_prepare_v2(self->_otherDatabase, "SELECT Uuid FROM OtherDevices WHERE ROWID = (SELECT ROWID FROM OtherDevices WHERE LastConnectionTime != 0 ORDER BY LastConnectionTime ASC LIMIT 1)", -1, &ppStmt, 0))
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        v5 = sqlite3_column_text(ppStmt, 0);
        if (v5)
          v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5));
        else
          v6 = 0;
        otherDatabase = self->_otherDatabase;
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DELETE FROM OtherDevices WHERE Uuid = '%s'"), v5)));
        v11 = sqlite3_exec(otherDatabase, (const char *)objc_msgSend(v10, "UTF8String"), 0, 0, 0);

        v12 = qword_100999810;
        if (v11)
        {
          if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
          {
            v13 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1);
            v14 = sqlite3_errmsg(self->_otherDatabase);
            v15 = sqlite3_extended_errcode(self->_otherDatabase);
            *(_DWORD *)buf = 136447234;
            v27 = v5;
            v28 = 2082;
            v29 = v13;
            v30 = 1024;
            v31 = v11;
            v32 = 2082;
            v33 = v14;
            v34 = 1024;
            v35 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to delete the oldest connected device \"%{public}s\" from '%{public}s' cache with error %d (%{public}s, %d)", buf, 0x2Cu);
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_INFO))
          {
            v23 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1);
            *(_DWORD *)buf = 136446466;
            v27 = v5;
            v28 = 2082;
            v29 = v23;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Successfully evicted oldest connected device \"%{public}s\" from '%{public}s' cache", buf, 0x16u);
          }
          -[LeDeviceCache setConnectedDeviceCount:](self, "setConnectedDeviceCount:", -[LeDeviceCache connectedDeviceCount](self, "connectedDeviceCount") - 1);
        }
        if (v6)
        {
LABEL_24:
          -[LeDeviceCache removeCustomPropertiesJSONForDeviceUUID:inDatabase:](self, "removeCustomPropertiesJSONForDeviceUUID:inDatabase:", v6, self->_otherDatabase);
LABEL_34:

          goto LABEL_35;
        }
        if (!os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
          goto LABEL_34;
LABEL_33:
        sub_1006E20A4();
        goto LABEL_34;
      }
      goto LABEL_35;
    }
  }
  else
  {
    v7 = -[LeDeviceCache seenDeviceCount](self, "seenDeviceCount");
    if (v7 >= -[LeDeviceCache maxSeenDevices](self, "maxSeenDevices")
      && !sqlite3_prepare_v2(self->_otherDatabase, "SELECT Uuid FROM OtherDevices WHERE ROWID = (SELECT ROWID FROM OtherDevices WHERE LastConnectionTime = 0 ORDER BY LastSeenTime ASC LIMIT 1)", -1, &ppStmt, 0))
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        v8 = sqlite3_column_text(ppStmt, 0);
        if (v8)
          v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
        else
          v6 = 0;
        v16 = self->_otherDatabase;
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DELETE FROM OtherDevices WHERE Uuid = '%s'"), v8)));
        v18 = sqlite3_exec(v16, (const char *)objc_msgSend(v17, "UTF8String"), 0, 0, 0);

        v19 = qword_100999810;
        if (v18)
        {
          if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
          {
            v20 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1);
            v21 = sqlite3_errmsg(self->_otherDatabase);
            v22 = sqlite3_extended_errcode(self->_otherDatabase);
            *(_DWORD *)buf = 136447234;
            v27 = v8;
            v28 = 2082;
            v29 = v20;
            v30 = 1024;
            v31 = v18;
            v32 = 2082;
            v33 = v21;
            v34 = 1024;
            v35 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to delete the oldest seen device \"%{public}s\" from '%{public}s' cache with error %d (%{public}s, %d)", buf, 0x2Cu);
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_INFO))
          {
            v24 = -[LeDeviceCache friendlyNameForType:](self, "friendlyNameForType:", 1);
            *(_DWORD *)buf = 136446466;
            v27 = v8;
            v28 = 2082;
            v29 = v24;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Successfully evicted oldest seen device \"%{public}s\" from '%{public}s' cache", buf, 0x16u);
          }
          -[LeDeviceCache setSeenDeviceCount:](self, "setSeenDeviceCount:", -[LeDeviceCache seenDeviceCount](self, "seenDeviceCount") - 1);
        }
        if (v6)
          goto LABEL_24;
        if (!os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_ERROR))
          goto LABEL_34;
        goto LABEL_33;
      }
LABEL_35:
      sqlite3_finalize(ppStmt);
    }
  }
}

- (void)printDebug
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = qword_100999810;
  if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "statedump: ---------------- LE Device Database ----------------", v4, 2u);
  }
  -[LeDeviceCache printDatabase:](self, "printDatabase:", 0);
  -[LeDeviceCache printDatabase:](self, "printDatabase:", 1);
}

- (void)printDatabase:(unint64_t)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  sqlite3 *v8;
  id v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  NSNumber *v16;
  uint64_t v17;
  const unsigned __int8 *v18;
  void **v19;
  void *v20;
  void **v21;
  const char *v22;
  size_t v23;
  const char *v24;
  size_t v25;
  _QWORD *v26;
  const char *v27;
  size_t v28;
  _QWORD *v29;
  const char *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  const char *v35;
  size_t v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  const char *v41;
  size_t v42;
  _QWORD *v43;
  id v44;
  const char *v45;
  size_t v46;
  NSObject *v47;
  void *p_p;
  NSObject *v49;
  uint64_t v50;
  void *__p;
  char v52;
  sqlite3_stmt *ppStmt;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint8_t v64[4];
  void *v65;
  uint8_t buf[16];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  void *v70[2];
  __int128 v71;
  __int128 v72;
  _OWORD v73[9];
  uint64_t v74;
  _QWORD v75[10];

  v62 = 0;
  v63 = 0;
  v60 = 0;
  v61 = 0;
  v58 = 0;
  v59 = 0;
  v56 = 0;
  v57 = 0;
  v54 = 0;
  v55 = 0;
  v75[0] = &v63;
  v75[1] = &v62;
  v75[2] = &v57;
  v75[3] = &v61;
  v75[4] = &v60;
  v75[5] = &v56;
  v75[6] = &v55;
  v75[7] = &v54;
  v75[8] = &v59;
  v75[9] = &v58;
  v5 = qword_100999810;
  if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "Other devices";
    if (!a3)
      v6 = "Paired devices";
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump: %{public}s:", buf, 0xCu);
  }
  v7 = 24;
  if (!a3)
    v7 = 16;
  v8 = *(Class *)((char *)&self->super.isa + v7);
  if (v8)
  {
    ppStmt = 0;
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT * FROM %s"), -[LeDeviceCache tableNameForType:](self, "tableNameForType:", a3))));
    v10 = sqlite3_prepare_v2(v8, (const char *)objc_msgSend(v9, "UTF8String"), -1, &ppStmt, 0);

    if (!v10)
    {
      while (1)
      {
        if (sqlite3_step(ppStmt) != 100)
        {
          sqlite3_finalize(ppStmt);
          break;
        }
        v12 = objc_autoreleasePoolPush();
        for (i = 0; i != 10; ++i)
        {
          v14 = qword_1009993F0[i];
          if (v14 == objc_opt_class(NSString))
          {
            v18 = sqlite3_column_text(ppStmt, i);
            if (!v18)
            {
              v21 = (void **)v75[i];
              v20 = *v21;
              *v21 = &stru_100941758;
              goto LABEL_19;
            }
            v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v18));
          }
          else
          {
            v15 = qword_1009993F0[i];
            if (v15 != objc_opt_class(NSNumber))
              continue;
            v16 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", sqlite3_column_int(ppStmt, i));
            v17 = objc_claimAutoreleasedReturnValue(v16);
          }
          v19 = (void **)v75[i];
          v20 = *v19;
          *v19 = (void *)v17;
LABEL_19:

        }
        v74 = 0;
        v72 = 0u;
        memset(v73, 0, sizeof(v73));
        *(_OWORD *)v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        *(_OWORD *)buf = 0u;
        v67 = 0u;
        sub_100272ADC((uint64_t)buf);
        if (v63)
        {
          v22 = (const char *)objc_msgSend(objc_retainAutorelease(v63), "UTF8String");
          v23 = strlen(v22);
          sub_1002614D8(buf, (uint64_t)v22, v23);
        }
        sub_1002614D8(buf, (uint64_t)" → ", 5);
        if (objc_msgSend(v61, "length"))
        {
          v24 = (const char *)objc_msgSend(objc_retainAutorelease(v61), "UTF8String");
          v25 = strlen(v24);
          sub_1002614D8(buf, (uint64_t)v24, v25);
          if (objc_msgSend(v60, "length"))
          {
            if ((objc_msgSend(v61, "isEqualToString:", v60) & 1) == 0)
            {
              v26 = sub_1002614D8(buf, (uint64_t)" (", 2);
              v27 = (const char *)objc_msgSend(objc_retainAutorelease(v60), "UTF8String");
              v28 = strlen(v27);
              v29 = sub_1002614D8(v26, (uint64_t)v27, v28);
              sub_1002614D8(v29, (uint64_t)")", 1);
            }
          }
        }
        if (objc_msgSend(v62, "length"))
        {
          sub_1002614D8(buf, (uint64_t)", ", 2);
          if (objc_msgSend(v57, "intValue") == 2)
          {
            v30 = "GAP";
            v31 = 3;
            goto LABEL_35;
          }
          if (objc_msgSend(v57, "intValue") == 1)
          {
            v30 = "Adv.";
            goto LABEL_32;
          }
          if (objc_msgSend(v57, "intValue") == 4)
          {
            v30 = "FindMy";
            v31 = 6;
            goto LABEL_35;
          }
          if (objc_msgSend(v57, "intValue") == 3)
          {
            v30 = "User";
LABEL_32:
            v31 = 4;
LABEL_35:
            sub_1002614D8(buf, (uint64_t)v30, v31);
          }
          v32 = sub_1002614D8(buf, (uint64_t)"Name: ", 6);
          v33 = sub_1002614D8(v32, (uint64_t)"\", 1);
          v34 = sub_100027F68();
          v35 = "";
          if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v34 + 8))(v34))
            v35 = (const char *)objc_msgSend(objc_retainAutorelease(v62), "UTF8String");
          v36 = strlen(v35);
          v37 = sub_1002614D8(v33, (uint64_t)v35, v36);
          sub_1002614D8(v37, (uint64_t)"\", 1);
        }
        if (objc_msgSend(v56, "intValue"))
        {
          v38 = sub_1002614D8(buf, (uint64_t)", LastSeen: ", 12);
          std::ostream::operator<<(v38, objc_msgSend(v56, "intValue"));
        }
        if (objc_msgSend(v55, "intValue"))
        {
          v39 = sub_1002614D8(buf, (uint64_t)", LastConn: ", 12);
          std::ostream::operator<<(v39, objc_msgSend(v55, "intValue"));
        }
        if (objc_msgSend(v58, "length"))
        {
          v40 = sub_1002614D8(buf, (uint64_t)", iCloud: ", 10);
          v41 = (const char *)objc_msgSend(objc_retainAutorelease(v58), "UTF8String");
          v42 = strlen(v41);
          sub_1002614D8(v40, (uint64_t)v41, v42);
        }
        if (objc_msgSend(v54, "BOOLValue"))
          sub_1002614D8(buf, (uint64_t)", GATTServiceChangeNotify: enabled", 34);
        if (objc_msgSend(v59, "length"))
        {
          v43 = sub_1002614D8(buf, (uint64_t)", Tags: ", 8);
          v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), CFSTR(", "))));
          v45 = (const char *)objc_msgSend(v44, "UTF8String");
          v46 = strlen(v45);
          sub_1002614D8(v43, (uint64_t)v45, v46);

        }
        v47 = qword_100999810;
        if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
        {
          std::stringbuf::str(&buf[8]);
          p_p = &__p;
          if (v52 < 0)
            p_p = __p;
          *(_DWORD *)v64 = 136446210;
          v65 = p_p;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "statedump: %{public}s", v64, 0xCu);
          if (v52 < 0)
            operator delete(__p);
        }
        *(_QWORD *)buf = v11;
        *(_QWORD *)&buf[*(_QWORD *)(v11 - 24)] = v50;
        if (SHIBYTE(v71) < 0)
          operator delete(v70[1]);
        std::streambuf::~streambuf(&buf[8]);
        std::ios::~ios(v73);
        objc_autoreleasePoolPop(v12);
      }
    }
  }
  else
  {
    v49 = qword_100999810;
    if (os_log_type_enabled((os_log_t)qword_100999810, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "statedump:    Cache has not been loaded", buf, 2u);
    }
  }

}

- (int)maxSeenDevices
{
  return self->_maxSeenDevices;
}

- (int)maxConnectedDevices
{
  return self->_maxConnectedDevices;
}

- (int)seenDeviceCount
{
  return self->_seenDeviceCount;
}

- (void)setSeenDeviceCount:(int)a3
{
  self->_seenDeviceCount = a3;
}

- (int)connectedDeviceCount
{
  return self->_connectedDeviceCount;
}

- (void)setConnectedDeviceCount:(int)a3
{
  self->_connectedDeviceCount = a3;
}

@end
