@implementation MBSQLiteDB

- (MBSQLiteDB)initWithPath:(id)a3 readOnly:(BOOL)a4 usePQLBatching:(BOOL)a5 schemaCurrentVersion:(int)a6 schemaMinDatabaseVersionForUpgrade:(int)a7 error:(id *)a8 schemaUpgrades:(id)a9
{
  id v15;
  id v16;
  MBSQLiteDB *v17;
  MBSQLiteDB *v18;
  NSString *v19;
  NSString *path;
  objc_class *v21;
  const char *Name;
  dispatch_queue_attr_t v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *sharedQueue;
  NSObject *v27;
  MBSQLiteDB *v28;
  int v29;
  MBSQLiteDB *v30;
  _QWORD v32[4];
  MBSQLiteDB *v33;
  uint64_t *v34;
  uint64_t *v35;
  BOOL v36;
  BOOL v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  objc_super v48;

  v15 = a3;
  v16 = a9;
  v48.receiver = self;
  v48.super_class = (Class)MBSQLiteDB;
  v17 = -[MBSQLiteDB init](&v48, "init");
  if (!v17)
  {
    v28 = 0;
LABEL_9:
    v28 = v28;
    v30 = v28;
    goto LABEL_10;
  }
  v18 = v17;
  v19 = (NSString *)objc_msgSend(v15, "copy");
  path = v18->_path;
  v18->_path = v19;

  v18->_schemaCurrentVersion = a6;
  v18->_schemaMinDatabaseVersionForUpgrade = a7;
  objc_storeStrong((id *)&v18->_schemaUpgrades, a9);
  v21 = (objc_class *)objc_opt_class(v18);
  Name = class_getName(v21);
  v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  v25 = dispatch_queue_create(Name, v24);
  sharedQueue = v18->_sharedQueue;
  v18->_sharedQueue = (OS_dispatch_queue *)v25;

  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_10004CA10;
  v42 = sub_10004CA20;
  v43 = 0;
  v27 = v18->_sharedQueue;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10004CA28;
  v32[3] = &unk_1000D9AB8;
  v36 = a4;
  v34 = &v44;
  v28 = v18;
  v37 = a5;
  v33 = v28;
  v35 = &v38;
  dispatch_sync(v27, v32);
  v29 = *((unsigned __int8 *)v45 + 24);
  if (!*((_BYTE *)v45 + 24))
  {
    if (a8)
      *a8 = objc_retainAutorelease((id)v39[5]);

    v28 = 0;
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
  if (v29)
    goto LABEL_9;
  v30 = 0;
LABEL_10:

  return v30;
}

- (id)openReadOnlyInstance:(id *)a3
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithPath:readOnly:usePQLBatching:schemaCurrentVersion:schemaMinDatabaseVersionForUpgrade:error:schemaUpgrades:", self->_path, 1, 0, self->_schemaCurrentVersion, self->_schemaMinDatabaseVersionForUpgrade, a3, 0);
}

- (BOOL)close:(id *)a3
{
  NSObject *sharedQueue;
  int v6;
  BOOL v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_sharedQueue);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_10004CA10;
  v18 = sub_10004CA20;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  sharedQueue = self->_sharedQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CCD4;
  block[3] = &unk_1000D9AE0;
  block[4] = self;
  block[5] = &v10;
  block[6] = &v14;
  dispatch_sync(sharedQueue, block);
  v6 = *((unsigned __int8 *)v11 + 24);
  if (a3 && !*((_BYTE *)v11 + 24))
  {
    *a3 = objc_retainAutorelease((id)v15[5]);
    v6 = *((unsigned __int8 *)v11 + 24);
  }
  v7 = v6 != 0;
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (BOOL)_invalidate:(id *)a3
{
  PQLConnection *pdb;
  PQLConnection *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  MBSQLiteDB *v16;
  uint64_t v17;
  BOOL v18;
  _QWORD block[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  PQLConnection *v36;
  uint8_t buf[4];
  MBSQLiteDB *v38;
  __int16 v39;
  uint64_t v40;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  pdb = self->_pdb;
  if (!pdb)
    return 1;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_10004CA10;
  v35 = sub_10004CA20;
  v36 = pdb;
  v6 = self->_pdb;
  self->_pdb = 0;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10004CA10;
  v29 = sub_10004CA20;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v9 = MBGetDefaultLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v38 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Invalidating cache connection %p", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "Invalidating cache connection %p", self);
  }

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v32[5], "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004D034;
  block[3] = &unk_1000D9B08;
  block[4] = &v31;
  block[5] = &v21;
  block[6] = &v25;
  dispatch_sync(v11, block);

  if (!*((_BYTE *)v22 + 24))
  {
    v14 = MBGetDefaultLog(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (MBSQLiteDB *)v32[5];
      v17 = v26[5];
      *(_DWORD *)buf = 134218242;
      v38 = v16;
      v39 = 2112;
      v40 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to close the PQL connection %p: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "Failed to close the PQL connection %p: %@", v32[5], v26[5]);
    }

    if (a3)
      *a3 = objc_retainAutorelease((id)v26[5]);
  }
  v18 = *((_BYTE *)v22 + 24) != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v18;
}

- (void)dealloc
{
  PQLConnection *pdb;
  PQLConnection *v4;
  PQLConnection *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSString *path;
  NSObject *v11;
  PQLConnection *v12;
  objc_super v13;
  _QWORD block[4];
  PQLConnection *v15;
  uint8_t buf[4];
  NSString *v17;

  pdb = self->_pdb;
  if (pdb)
  {
    v4 = pdb;
    v5 = self->_pdb;
    self->_pdb = 0;

    v8 = MBGetDefaultLog(v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      *(_DWORD *)buf = 138412290;
      v17 = path;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Database (%@) should be closed before dealloc", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "Database (%@) should be closed before dealloc", self->_path);
    }

    v11 = objc_claimAutoreleasedReturnValue(-[PQLConnection serialQueue](v4, "serialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004D2B0;
    block[3] = &unk_1000D9890;
    v15 = v4;
    v12 = v4;
    dispatch_async(v11, block);

  }
  v13.receiver = self;
  v13.super_class = (Class)MBSQLiteDB;
  -[MBSQLiteDB dealloc](&v13, "dealloc");
}

- (void)_removeCorruptDatabaseWithError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *sharedQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  sharedQueue = self->_sharedQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004D364;
  block[3] = &unk_1000D9B30;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(sharedQueue, block);

}

- (void)_removeCorruptDatabaseWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  unsigned __int8 v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;

  v4 = a3;
  if (!v4)
    sub_100088328();
  v5 = v4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  v6 = objc_claimAutoreleasedReturnValue(-[MBSQLiteDB path](self, "path"));
  if (!v6)
    sub_100088350();
  v8 = (void *)v6;
  v9 = MBGetDefaultLog(v6, v7);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v47 = v8;
    v48 = 2112;
    v49 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "The database at %@ is corrupted and will be removed: %@", buf, 0x16u);
    _MBLog(CFSTR("ERROR"), "The database at %@ is corrupted and will be removed: %@", v8, v5);
  }

  if (sub_100081D30())
  {
    v11 = objc_claimAutoreleasedReturnValue(-[NSString stringByDeletingLastPathComponent](self->_path, "stringByDeletingLastPathComponent"));
    if (!v11)
      sub_100088378();
    v12 = (void *)v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](self->_path, "lastPathComponent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByDeletingPathExtension"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_corrupted.db"), v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", v15));

    if (!v16)
      sub_1000883A0();
    v45 = 0;
    v17 = +[MBSQLiteFileHandle copySQLiteFileAtPath:toPath:error:](MBSQLiteFileHandle, "copySQLiteFileAtPath:toPath:error:", v8, v16, &v45);
    v18 = v45;
    v20 = v18;
    if ((v17 & 1) == 0)
    {
      v21 = MBGetDefaultLog(v18, v19);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v47 = v8;
        v48 = 2112;
        v49 = v20;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to copy the SQLite file at %@: %@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Failed to copy the SQLite file at %@: %@", v8, v20);
      }

    }
  }
  v44 = 0;
  v23 = -[MBSQLiteDB _removeDatabaseAtPath:error:](self, "_removeDatabaseAtPath:error:", v8, &v44);
  v24 = v44;
  v26 = v24;
  if ((v23 & 1) == 0)
  {
    v41 = MBGetDefaultLog(v24, v25);
    v34 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v47 = v8;
      v48 = 2112;
      v49 = v26;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to delete the database at %@: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), "Failed to delete the database at %@: %@", v8, v26);
    }
    goto LABEL_21;
  }
  if (sub_100081D30())
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    v28 = objc_msgSend(v27, "isEqualToString:", PQLSqliteErrorDomain);

    if (!v28)
    {
      v42 = MBGetDefaultLog(v29, v30);
      v34 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v5;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "Removed database, error: %@", buf, 0xCu);
        _MBLog(CFSTR("FAULT"), "Removed database, error: %@", v5, v43);
      }
      goto LABEL_21;
    }
    v31 = objc_msgSend(v5, "code");
    if (v31 != (id)13)
    {
      v33 = MBGetDefaultLog(v31, v32);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        v35 = objc_msgSend(v5, "code");
        v36 = objc_msgSend(v5, "extendedSqliteCode");
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
        *(_DWORD *)buf = 134218498;
        v47 = v35;
        v48 = 2048;
        v49 = v36;
        v50 = 2112;
        v51 = v37;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "Removed database, code:%ld, extendedCode:%ld, description:\"%@\", buf, 0x20u);

        v38 = objc_msgSend(v5, "code");
        v39 = objc_msgSend(v5, "extendedSqliteCode");
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
        _MBLog(CFSTR("FAULT"), "Removed database, code:%ld, extendedCode:%ld, description:\"%@\", v38, v39, v40);

      }
LABEL_21:

    }
  }

}

- (BOOL)_openWithFlags:(int)a3 usePQLBatching:(BOOL)a4 error:(id *)a5
{
  uint64_t v5;
  id v7;
  char v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSString *path;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  _BOOL4 v43;
  _BOOL4 v44;
  void *v45;
  NSString *v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  _BYTE v51[24];
  _QWORD v52[2];
  _QWORD v53[2];

  v43 = a4;
  v5 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  v46 = self->_path;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByDeletingLastPathComponent](v46, "stringByDeletingLastPathComponent"));
  v7 = 0;
  v44 = v5 & 1;
  v8 = 1;
  v9 = PQLSqliteErrorDomain;
  while (1)
  {
    v10 = v8;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v52[0] = NSFileOwnerAccountName;
    v52[1] = NSFileGroupOwnerAccountName;
    v53[0] = CFSTR("mobile");
    v53[1] = CFSTR("mobile");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v53, v52, 2));
    v49 = 0;
    v13 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v45, 1, v12, &v49);
    v14 = v49;

    if ((v13 & 1) == 0)
    {
      v29 = MBGetDefaultLog(v15, v16);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        path = self->_path;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v51 = path;
        *(_WORD *)&v51[8] = 2112;
        *(_QWORD *)&v51[10] = v14;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to create the directory at %@: %@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Failed to create the directory at %@: %@", self->_path, v14);
      }

      v7 = v14;
      goto LABEL_34;
    }
    v48 = v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MBSQLiteDB _makePQLConnectionWithFlags:usePQLBatching:error:](self, "_makePQLConnectionWithFlags:usePQLBatching:error:", v5, v43, &v48));
    v7 = v48;

    if (v17 || v44)
      break;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    if (objc_msgSend(v19, "isEqualToString:", v9))
    {
      v20 = objc_msgSend(v7, "code") == (id)13;

      if (v20)
      {
        v38 = MBGetDefaultLog(v21, v22);
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v51 = 30;
          *(_WORD *)&v51[4] = 2114;
          *(_QWORD *)&v51[6] = v7;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Sleeping for %d seconds: %{public}@", buf, 0x12u);
          _MBLog(CFSTR("ERROR"), "Sleeping for %d seconds: %{public}@", 30, v7);
        }

        sleep(0x1Eu);
        goto LABEL_34;
      }
    }
    else
    {

    }
    v47 = 0;
    v23 = -[MBSQLiteDB _removeDatabaseAtPath:error:](self, "_removeDatabaseAtPath:error:", v46, &v47);
    v24 = v47;
    v26 = v24;
    if ((v23 & 1) == 0)
    {
      v27 = MBGetDefaultLog(v24, v25);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v51 = v46;
        *(_WORD *)&v51[8] = 2112;
        *(_QWORD *)&v51[10] = v26;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to remove the db at %@: %@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), "Failed to remove the db at %@: %@", v46, v26);
      }

    }
    if (!v7)
      sub_1000883F0();

    v8 = 0;
    if ((v10 & 1) == 0)
      goto LABEL_35;
  }
  if (!v17)
  {
LABEL_34:
    if (!v7)
      sub_1000883C8();
LABEL_35:
    if (a5)
    {
      v7 = objc_retainAutorelease(v7);
      v17 = 0;
      *a5 = v7;
    }
    else
    {
      v17 = 0;
    }
    goto LABEL_38;
  }
  self->_readOnly = v44;
  objc_storeStrong((id *)&self->_pdb, v17);
  v34 = MBGetDefaultLog(v32, v33);
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    if ((v5 & 1) != 0)
      v36 = 111;
    else
      v36 = 119;
    *(_DWORD *)v51 = v36;
    *(_WORD *)&v51[4] = 2112;
    *(_QWORD *)&v51[6] = v17;
    *(_WORD *)&v51[14] = 2112;
    *(_QWORD *)&v51[16] = v46;
    if ((v5 & 1) != 0)
      v37 = 111;
    else
      v37 = 119;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Opened r/%c PQL connection %@ at path %@", buf, 0x1Cu);
    _MBLog(CFSTR("INFO"), "Opened r/%c PQL connection %@ at path %@", v37, v17, v46);
  }

LABEL_38:
  return v17 != 0;
}

- (id)_makePQLConnectionWithFlags:(int)a3 usePQLBatching:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  uint64_t v7;
  id v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  sqlite3 *v16;
  sqlite3 *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  unsigned __int8 v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  unsigned int v32;
  void *v33;
  NSArray *schemaUpgrades;
  void *v35;
  double v36;
  double v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v42;
  int v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  _BYTE v47[10];
  __int16 v48;
  const char *v49;

  if (!a5)
    sub_100088418();
  v6 = a4;
  v7 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MBSQLiteDB _openPQLConnectionWithFlags:error:](self, "_openPQLConnectionWithFlags:error:", v7, a5));
  if (!v9)
    goto LABEL_28;
  v10 = -[MBSQLiteDB schemaMinDatabaseVersionForUpgrade](self, "schemaMinDatabaseVersionForUpgrade");
  if (v10 > -[MBSQLiteDB schemaCurrentVersion](self, "schemaCurrentVersion"))
    sub_100088440();
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userVersion"));
  v12 = objc_msgSend(v11, "unsignedIntValue");

  if ((v12 & 0x80000000) == 0
    && (int)v12 < -[MBSQLiteDB schemaMinDatabaseVersionForUpgrade](self, "schemaMinDatabaseVersionForUpgrade"))
  {
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v9, "close:", 0);
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Can't upgrade RO database")));
      goto LABEL_29;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "url"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));

    if (!v15)
      sub_100088468();
    v16 = (sqlite3 *)objc_msgSend(v9, "dbHandle");
    if (!v16)
      sub_100088490();
    v17 = v16;
    v43 = 61;
    v18 = sqlite3_file_control(v16, 0, 101, &v43);
    v20 = MBGetDefaultLog(v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = v21;
    if ((_DWORD)v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v23 = sqlite3_extended_errcode(v17);
        v24 = sqlite3_errmsg(v17);
        *(_DWORD *)buf = 138413058;
        v45 = v15;
        v46 = 1024;
        *(_DWORD *)v47 = v18;
        *(_WORD *)&v47[4] = 1024;
        *(_DWORD *)&v47[6] = v23;
        v48 = 2080;
        v49 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to truncate the database at %@: %d(%d): %s", buf, 0x22u);
        v25 = sqlite3_extended_errcode(v17);
        v26 = sqlite3_errmsg(v17);
        _MBLog(CFSTR("ERROR"), "Failed to truncate the database at %@: %d(%d): %s", v15, v18, v25, v26);
      }

      objc_msgSend(v9, "close:", 0);
      v42 = 0;
      v27 = -[MBSQLiteDB _removeDatabaseAtPath:error:](self, "_removeDatabaseAtPath:error:", v15, &v42);
      v28 = v42;
      v9 = v28;
      if ((v27 & 1) == 0)
      {
        v30 = MBGetDefaultLog(v28, v29);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v45 = v15;
          v46 = 2112;
          *(_QWORD *)v47 = v9;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to remove the database at %@: %@", buf, 0x16u);
          _MBLog(CFSTR("ERROR"), "Failed to remove the database at %@: %@", v15, v9);
        }

      }
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v32 = -[MBSQLiteDB schemaMinDatabaseVersionForUpgrade](self, "schemaMinDatabaseVersionForUpgrade");
        *(_DWORD *)buf = 138412802;
        v45 = v15;
        v46 = 1024;
        *(_DWORD *)v47 = (_DWORD)v12;
        *(_WORD *)&v47[4] = 1024;
        *(_DWORD *)&v47[6] = v32;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Truncated the database at %@, databaseVersion:%d, minDatabaseVersionForUpgrade:%d", buf, 0x18u);
        _MBLog(CFSTR("DEFAULT"), "Truncated the database at %@, databaseVersion:%d, minDatabaseVersionForUpgrade:%d", v15, v12, -[MBSQLiteDB schemaMinDatabaseVersionForUpgrade](self, "schemaMinDatabaseVersionForUpgrade"));
      }

      objc_msgSend(v9, "close:", 0);
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MBSQLiteDB _openPQLConnectionWithFlags:error:](self, "_openPQLConnectionWithFlags:error:", v7, a5));
    v9 = v33;
    if (!v33)
    {

LABEL_28:
      v13 = 0;
      goto LABEL_29;
    }
    objc_msgSend(v33, "setUserVersion:", 0);

  }
  schemaUpgrades = self->_schemaUpgrades;
  if (schemaUpgrades
    && !objc_msgSend(v9, "performSchemaUpgrades:isReadOnly:error:", schemaUpgrades, v7 & 1, a5))
  {
    goto LABEL_28;
  }
  if (v6)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[MBBehaviorOptions sharedOptions](MBBehaviorOptions, "sharedOptions"));
    objc_msgSend(v35, "sqlBatchTime");
    v37 = v36;

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[MBBehaviorOptions sharedOptions](MBBehaviorOptions, "sharedOptions"));
    v39 = objc_msgSend(v38, "sqlBatchCount");

    objc_msgSend(v9, "useBatchingWithDelay:changeCount:", v39, v37);
  }
  objc_msgSend(v9, "useSerialQueue");
  v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serialQueue"));
  dispatch_queue_set_specific(v40, self, self, 0);

  v9 = v9;
  v13 = v9;
LABEL_29:

  return v13;
}

- (id)_openPQLConnectionWithFlags:(int)a3 error:(id *)a4
{
  uint64_t v5;
  NSString *v7;
  NSString *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSString *v12;
  void *v13;
  id v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  const char *v22;
  int v23;
  void *v24;
  unsigned int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v30;
  _QWORD v31[4];
  NSString *v32;
  id v33;
  id location;

  if (!a4)
    sub_1000884B8();
  v5 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  v7 = self->_path;
  if (!v7)
    sub_1000884E0();
  v8 = v7;
  v9 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7));
  if (!v9)
    sub_100088508();
  v10 = (void *)v9;
  objc_initWeak(&location, self);
  v11 = objc_alloc_init((Class)PQLConnection);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10004E594;
  v31[3] = &unk_1000D9B78;
  objc_copyWeak(&v33, &location);
  v12 = v8;
  v32 = v12;
  objc_msgSend(v11, "setSqliteErrorHandler:", v31);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sqliteErrorHandler"));
  objc_msgSend(v11, "setAutoRollbackHandler:", v13);

  v14 = objc_alloc((Class)NSString);
  v15 = (objc_class *)objc_opt_class(self);
  v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@-%p"), v17, self);
  objc_msgSend(v11, "setLabel:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MBBehaviorOptions sharedOptions](MBBehaviorOptions, "sharedOptions"));
  objc_msgSend(v11, "setTraced:", objc_msgSend(v19, "sqlTrace"));

  objc_msgSend(v11, "setCrashIfUsedAfterClose:", 1);
  objc_msgSend(v11, "setStatementCacheMaxCount:", 30);
  v30 = 0;
  LOBYTE(v18) = objc_msgSend(v11, "openAtURL:withFlags:error:", v10, v5, &v30);
  v20 = v30;
  v21 = v20;
  if ((v18 & 1) == 0)
  {
    if (!v20)
    {
      v22 = "localError";
      v23 = 353;
      goto LABEL_25;
    }
    if ((v5 & 1) != 0 && objc_msgSend(v20, "code") == (id)14)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "domain"));
      v25 = objc_msgSend(v24, "isEqualToString:", PQLSqliteErrorDomain);

      if (v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MBSQLiteDB path](self, "path"));
        v27 = objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 4, v21, CFSTR("Can't find the database: %@"), v26));

        v21 = (id)v27;
      }
    }
LABEL_17:

    if (v21)
    {
      v21 = objc_retainAutorelease(v21);
      v11 = 0;
      *a4 = v21;
      goto LABEL_19;
    }
    v22 = "pdb || localError";
    v23 = 368;
LABEL_25:
    __assert_rtn("-[MBSQLiteDB _openPQLConnectionWithFlags:error:]", "MBSQLiteDB.m", v23, v22);
  }
  if ((v5 & 1) == 0 && (objc_msgSend(v11, "setupPragmas") & 1) == 0)
  {
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastError"));

    v21 = (id)v28;
    if (!v28)
      v21 = (id)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("setupPragmas failed")));
    objc_msgSend(v11, "close:", 0);
    goto LABEL_17;
  }
  if (!v11)
  {
    v22 = "pdb";
    v23 = 364;
    goto LABEL_25;
  }
LABEL_19:

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  return v11;
}

- (BOOL)_removeDatabaseAtPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  unsigned __int8 v14;
  id v15;
  uint64_t v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;
  NSObject *v20;
  BOOL v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  unsigned __int8 v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  unsigned __int8 v34;
  uint64_t v35;
  NSObject *v36;
  id *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;

  v6 = a3;
  if (!v6)
    sub_100088530();
  if (!a4)
    sub_100088558();
  v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sharedQueue);
  v10 = MBGetDefaultLog(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removing the db at %@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Removing the db at %@", v7);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v13 = objc_msgSend(v12, "fileExistsAtPath:", v7);
  if ((_DWORD)v13)
  {
    v44 = 0;
    v14 = objc_msgSend(v12, "removeItemAtPath:error:", v7, &v44);
    v13 = v44;
    v15 = v13;
    if ((v14 & 1) == 0)
    {
      v13 = objc_msgSend(v13, "code");
      if (v13 != (id)4
        || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domain")),
            v18 = objc_msgSend(v17, "isEqualToString:", NSCocoaErrorDomain),
            v17,
            (v18 & 1) == 0))
      {
        v19 = MBGetDefaultLog(v13, v16);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v47 = v7;
          v48 = 2112;
          v49 = v15;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to delete %@: %@", buf, 0x16u);
          _MBLog(CFSTR("ERROR"), "Failed to delete %@: %@", v7, v15);
        }

        v15 = objc_retainAutorelease(v15);
        v21 = 0;
        *a4 = v15;
        goto LABEL_31;
      }
    }
  }
  else
  {
    v15 = 0;
  }
  v22 = MBSQLiteJournalSuffixes(v13);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v23 = (id)objc_claimAutoreleasedReturnValue(v22);
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v24)
  {
    v25 = v24;
    v38 = a4;
    v26 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i)));

        if (objc_msgSend(v12, "fileExistsAtPath:", v28))
        {
          v39 = 0;
          v29 = objc_msgSend(v12, "removeItemAtPath:error:", v28, &v39);
          v30 = v39;
          v15 = v30;
          if ((v29 & 1) == 0)
          {
            v31 = objc_msgSend(v30, "code");
            if (v31 != (id)4
              || (v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domain")),
                  v34 = objc_msgSend(v33, "isEqualToString:", NSCocoaErrorDomain),
                  v33,
                  (v34 & 1) == 0))
            {
              v35 = MBGetDefaultLog(v31, v32);
              v36 = objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v47 = v28;
                v48 = 2112;
                v49 = v15;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to delete %@: %@", buf, 0x16u);
                _MBLog(CFSTR("ERROR"), "Failed to delete %@: %@", v28, v15);
              }

              v15 = objc_retainAutorelease(v15);
              *v38 = v15;

              v21 = 0;
              goto LABEL_30;
            }
          }
        }
        else
        {
          v15 = 0;
        }

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v25)
        continue;
      break;
    }
  }
  v21 = 1;
LABEL_30:

LABEL_31:
  return v21;
}

- (BOOL)performWithConnection:(id)a3 error:(id *)a4
{
  id v5;
  BOOL v6;
  _QWORD v8[4];
  MBSQLiteDB *v9;
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10004CA10;
  v17 = sub_10004CA20;
  v18 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004EDF4;
  v8[3] = &unk_1000D9BA0;
  v9 = self;
  v11 = &v13;
  v12 = &v19;
  v5 = a3;
  v10 = v5;
  -[MBSQLiteDB _perform:](v9, "_perform:", v8);
  if (a4 && !*((_BYTE *)v20 + 24))
    *a4 = objc_retainAutorelease((id)v14[5]);
  v6 = v14[5] == 0;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v6;
}

- (void)_perform:(id)a3
{
  MBSQLiteDB *specific;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void (**block)(void);

  block = (void (**)(void))a3;
  specific = (MBSQLiteDB *)dispatch_get_specific(self);
  v5 = objc_claimAutoreleasedReturnValue(-[PQLConnection serialQueue](self->_pdb, "serialQueue"));
  v6 = v5;
  if (specific == self)
  {
    dispatch_assert_queue_V2(v5);

    v8 = objc_autoreleasePoolPush();
    block[2]();
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    dispatch_assert_queue_not_V2(v5);

    v7 = objc_claimAutoreleasedReturnValue(-[PQLConnection serialQueue](self->_pdb, "serialQueue"));
    dispatch_sync(v7, block);

  }
}

- (BOOL)groupInTransaction:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004EFDC;
  v8[3] = &unk_1000D9BC8;
  v9 = a3;
  v6 = v9;
  LOBYTE(a4) = -[MBSQLiteDB performWithConnection:error:](self, "performWithConnection:error:", v8, a4);

  return (char)a4;
}

- (id)_invalidatedError
{
  NSString *path;
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  path = self->_path;
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 16, path, CFSTR("%@ database is closed"), v5));

  return v6;
}

- (BOOL)executeWithError:(id *)a3 sql:(id)a4
{
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t **v10;
  uint64_t *v11;
  uint64_t v12;

  v11 = &v12;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004F0F8;
  v8[3] = &unk_1000D9BF0;
  v9 = a4;
  v10 = &v11;
  v6 = v9;
  LOBYTE(a3) = -[MBSQLiteDB performWithConnection:error:](self, "performWithConnection:error:", v8, a3);

  return (char)a3;
}

- (id)fetchObjectOfClass:(Class)a3 error:(id *)a4 sql:(id)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  Class v14;
  uint64_t **v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10004CA10;
  v21 = sub_10004CA20;
  v22 = 0;
  v16 = &v23;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004F274;
  v11[3] = &unk_1000D9C18;
  v13 = &v17;
  v14 = a3;
  v7 = a5;
  v12 = v7;
  v15 = &v16;
  if (-[MBSQLiteDB performWithConnection:error:](self, "performWithConnection:error:", v11, a4))
    v8 = (void *)v18[5];
  else
    v8 = 0;
  v9 = v8;

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (unint64_t)fetchCountWithError:(id *)a3 sql:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void **v10;
  uint64_t v11;
  BOOL (*v12)(uint64_t, void *, _QWORD *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t **v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_10004CA10;
  v22 = sub_10004CA20;
  v23 = 0;
  v17 = &v24;
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_10004F43C;
  v13 = &unk_1000D9C40;
  v15 = &v18;
  v6 = a4;
  v14 = v6;
  v16 = &v17;
  if (-[MBSQLiteDB performWithConnection:error:](self, "performWithConnection:error:", &v10, a3)
    && (v7 = (void *)v19[5]) != 0)
  {
    v8 = (unint64_t)objc_msgSend(v7, "unsignedIntegerValue", v10, v11, v12, v13);
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  _Block_object_dispose(&v18, 8);
  return v8;
}

- (BOOL)executeStatements:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004F56C;
  v8[3] = &unk_1000D9C68;
  v9 = a3;
  v6 = v9;
  LOBYTE(a4) = -[MBSQLiteDB performWithConnection:error:](self, "performWithConnection:error:", v8, a4);

  return (char)a4;
}

- (id)fetchSQL:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  MBSQLiteResultSet *v8;
  id v9;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t **v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10004CA10;
  v21 = sub_10004CA20;
  v22 = 0;
  v16 = &v23;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004F6C0;
  v12[3] = &unk_1000D9C40;
  v14 = &v17;
  v4 = a3;
  v13 = v4;
  v15 = &v16;
  v11 = 0;
  v5 = -[MBSQLiteDB performWithConnection:error:](self, "performWithConnection:error:", v12, &v11);
  v6 = v11;
  if ((v5 & 1) == 0)
  {
    v7 = (void *)v18[5];
    v18[5] = 0;

  }
  v8 = [MBSQLiteResultSet alloc];
  v9 = -[MBSQLiteResultSet _initWithDatabase:creationError:resultSet:](v8, "_initWithDatabase:creationError:resultSet:", self, v6, v18[5]);

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (NSString)path
{
  return self->_path;
}

- (int)schemaCurrentVersion
{
  return self->_schemaCurrentVersion;
}

- (int)schemaMinDatabaseVersionForUpgrade
{
  return self->_schemaMinDatabaseVersionForUpgrade;
}

- (NSArray)schemaUpgrades
{
  return self->_schemaUpgrades;
}

- (PQLConnection)pdb
{
  return self->_pdb;
}

- (void)setPdb:(id)a3
{
  objc_storeStrong((id *)&self->_pdb, a3);
}

- (OS_dispatch_queue)sharedQueue
{
  return self->_sharedQueue;
}

- (void)setSharedQueue:(id)a3
{
  objc_storeStrong((id *)&self->_sharedQueue, a3);
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedQueue, 0);
  objc_storeStrong((id *)&self->_pdb, 0);
  objc_storeStrong((id *)&self->_schemaUpgrades, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
