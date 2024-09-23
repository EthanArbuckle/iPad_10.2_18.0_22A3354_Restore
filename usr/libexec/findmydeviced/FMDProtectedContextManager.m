@implementation FMDProtectedContextManager

+ (id)sharedManager
{
  if (qword_100306670 != -1)
    dispatch_once(&qword_100306670, &stru_1002C3B60);
  return (id)qword_100306668;
}

- (FMDProtectedContextManager)init
{
  FMDProtectedContextManager *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMDProtectedContextManager;
  v2 = -[FMDProtectedContextManager init](&v5, "init");
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)FMReadWriteLock), "initWithLockName:", CFSTR("com.apple.icloud.findmydeviced.FMDProtectedContextManager-Lock"));
    -[FMDProtectedContextManager setProtectedContextLock:](v2, "setProtectedContextLock:", v3);

  }
  return v2;
}

- (id)contextForKey:(id)a3 contextUUID:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  id v40;

  v8 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_1000646A8;
  v37 = sub_1000646B8;
  v38 = 0;
  if (v8)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = sub_1000646A8;
    v31 = sub_1000646B8;
    v32 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = sub_1000646A8;
    v25 = sub_1000646B8;
    v26 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContextManager protectedContextLock](self, "protectedContextLock"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000646C0;
    v16[3] = &unk_1002C3B88;
    v10 = v8;
    v17 = v10;
    v18 = &v21;
    v19 = &v33;
    v20 = &v27;
    objc_msgSend(v9, "performWithReadLock:", v16);

    if (a5)
      *a5 = objc_retainAutorelease((id)v28[5]);
    if (v28[5] || !v34[5])
    {
      v11 = sub_1000031B8();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "There was a file read error while getting the protected context %@.", buf, 0xCu);
      }

    }
    else if (a4)
    {
      *a4 = objc_retainAutorelease((id)v22[5]);
    }

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);

    v13 = (void *)v34[5];
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;
  _Block_object_dispose(&v33, 8);

  return v14;
}

- (id)saveContext:(id)a3 forContextKey:(id)a4 dataProtectionClass:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  FMDProtectedContext *v12;
  void *v13;
  FMDProtectedContext *v14;
  _QWORD v16[4];
  FMDProtectedContext *v17;
  id v18;
  id v19;
  int64_t v20;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v12 = -[FMDProtectedContext initWithContextKey:]([FMDProtectedContext alloc], "initWithContextKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContext contextUUID](v12, "contextUUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContextManager protectedContextLock](self, "protectedContextLock"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000648F4;
    v16[3] = &unk_1002C2218;
    v17 = v12;
    v20 = a5;
    v18 = v8;
    v19 = v10;
    v14 = v12;
    objc_msgSend(v13, "performWithWriteLock:", v16);

  }
  return v11;
}

- (void)saveContext:(id)a3 forContextKey:(id)a4
{
  id v4;

  v4 = -[FMDProtectedContextManager saveContext:forContextKey:dataProtectionClass:](self, "saveContext:forContextKey:dataProtectionClass:", a3, a4, 2);
}

- (BOOL)cleanupContextsForKey:(id)a3 contextUUID:(id)a4
{
  return -[FMDProtectedContextManager cleanupContextsForKey:contextUUID:obliterate:](self, "cleanupContextsForKey:contextUUID:obliterate:", a3, a4, 0);
}

- (BOOL)cleanupContextsForKey:(id)a3 contextUUID:(id)a4 obliterate:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  id v15;
  FMDProtectedContextManager *v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContextManager protectedContextLock](self, "protectedContextLock"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100064ACC;
    v13[3] = &unk_1002C3BB0;
    v14 = v8;
    v16 = self;
    v17 = &v19;
    v15 = v9;
    v18 = a5;
    objc_msgSend(v10, "performWithWriteLock:", v13);

    v11 = *((_BYTE *)v20 + 24) != 0;
  }
  else
  {
    v11 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v11;
}

- (BOOL)cleanupAllContextsForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  FMDProtectedContextManager *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContextManager protectedContextLock](self, "protectedContextLock"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100064D70;
  v8[3] = &unk_1002C3BD8;
  v6 = v4;
  v10 = self;
  v11 = &v12;
  v9 = v6;
  objc_msgSend(v5, "performWithWriteLock:", v8);

  LOBYTE(self) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)self;
}

- (void)cleanupEmptyFolders
{
  void *v3;
  void *v4;
  id v5;
  _QWORD *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContext unittestRootURL](FMDProtectedContext, "unittestRootURL"));
  if (v3)
  {

  }
  else if ((+[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("kFMDProtectedContextCleanedUpEmptyFolders"), kFMDNotBackedUpPrefDomain) & 1) != 0)
  {
    return;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.mobile.keybagd.lock_status"));
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100064F70;
  v10[3] = &unk_1002C11E8;
  objc_copyWeak(&v12, &location);
  v5 = v4;
  v11 = v5;
  v6 = objc_retainBlock(v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCNotificationsUtil sharedInstance](FMXPCNotificationsUtil, "sharedInstance"));
  v8 = objc_msgSend(v7, "isHandlerRegisteredForDarwinNotification:", v5);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCNotificationsUtil sharedInstance](FMXPCNotificationsUtil, "sharedInstance"));
    objc_msgSend(v9, "registerHandler:forDarwinNotification:", v6, v5);

  }
  ((void (*)(_QWORD *))v6[2])(v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (BOOL)_startCleaningEmptyFolders
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6;
  _QWORD v8[5];
  id v9;
  id location;
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  char v14;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDProtectedContextManager start cleaning up empty folders", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v12 = buf;
  v13 = 0x2020000000;
  v14 = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContextManager _emptyFolderURLs](self, "_emptyFolderURLs"));
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100065244;
  v8[3] = &unk_1002C3C00;
  v8[4] = buf;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  v6 = v12[24];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
  return v6;
}

- (id)_emptyFolderURLs
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContext rootDirectoryURL](FMDProtectedContext, "rootDirectoryURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContextManager _enumeratorForDirectoryURL:](self, "_enumeratorForDirectoryURL:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000653CC;
  v11[3] = &unk_1002C3C28;
  v11[4] = self;
  v7 = v3;
  v12 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

- (id)contextKeysForType:(id)a3
{
  return -[FMDProtectedContextManager contextKeysForType:enumerationOption:](self, "contextKeysForType:enumerationOption:", a3, 0);
}

- (id)contextKeysForType:(id)a3 enumerationOption:(unint64_t)a4
{
  id v6;
  void *v7;
  CFArrayRef v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  void **v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  unint64_t v34;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = CFPreferencesCopyKeyList(kFMDNotBackedUpPrefDomain, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  if (v8)
    objc_msgSend(v7, "addObjectsFromArray:", v8);
  v9 = sub_1000031B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v7;
    v33 = 2048;
    v34 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMDProtectedContextManager obtaining list of context keys %@ with Type:%lu", buf, 0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContext rootDirectoryURL](FMDProtectedContext, "rootDirectoryURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContextManager _directoryNamesWithURL:enumerationOption:](self, "_directoryNamesWithURL:enumerationOption:", v11, a4));
  v13 = sub_1000031B8();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v12;
    v33 = 2048;
    v34 = a4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FMDProtectedContextManager obtaining list directories on disk %@ with Type:%lu", buf, 0x16u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
  objc_msgSend(v7, "addObjectsFromArray:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v25 = _NSConcreteStackBlock;
  v26 = 3221225472;
  v27 = sub_100065710;
  v28 = &unk_1002C2E80;
  v17 = v6;
  v29 = v17;
  v18 = v16;
  v30 = v18;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v25);
  v19 = sub_1000031B8();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_msgSend(v18, "count", v25, v26, v27, v28, v29);
    *(_DWORD *)buf = 134218242;
    v32 = v21;
    v33 = 2112;
    v34 = (unint64_t)v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "FMDProtectedContextManager %lu context keys for Type %@", buf, 0x16u);
  }

  v22 = v30;
  v23 = v18;

  return v23;
}

- (id)_directoryNamesWithURL:(id)a3 enumerationOption:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  FMDProtectedContextManager *v14;
  unint64_t v15;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  if (a4 != 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDProtectedContextManager _enumeratorForDirectoryURL:](self, "_enumeratorForDirectoryURL:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100065840;
    v12[3] = &unk_1002C3C50;
    v15 = a4;
    v13 = v7;
    v14 = self;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  }
  v10 = objc_msgSend(v7, "copy");

  return v10;
}

- (id)_enumeratorForDirectoryURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000659B4;
  v8[3] = &unk_1002C3C78;
  v9 = v3;
  v5 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, 0, 1, v8));

  return v6;
}

- (BOOL)deleteFilesAtURLs:(id)a3
{
  id v3;
  id v4;
  char v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100065B68;
  v7[3] = &unk_1002C3CA0;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  v5 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (BOOL)cleanOutCurrentContextDirectoryURL:(id)a3 preservingContextUUID:(id)a4 obliterateDirectory:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  _QWORD v22[4];
  id v23;
  id v24;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    v24 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
    v11 = -[FMDProtectedContextManager deleteFilesAtURLs:](self, "deleteFilesAtURLs:", v10);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100065E90;
    v22[3] = &unk_1002C3C78;
    v23 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v23, 0, 1, v22));
    v13 = v12;
    if (v9)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nextObject"));
      if (v16)
      {
        v17 = (void *)v16;
        do
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastPathComponent"));
          v19 = objc_msgSend(v18, "isEqualToString:", v15);

          if ((v19 & 1) == 0)
            objc_msgSend(v14, "addObject:", v17);
          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nextObject"));

          v17 = (void *)v20;
        }
        while (v20);
      }
      v11 = -[FMDProtectedContextManager deleteFilesAtURLs:](self, "deleteFilesAtURLs:", v14);

    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
      v11 = -[FMDProtectedContextManager deleteFilesAtURLs:](self, "deleteFilesAtURLs:", v14);
    }

  }
  return v11;
}

- (FMReadWriteLock)protectedContextLock
{
  return self->_protectedContextLock;
}

- (void)setProtectedContextLock:(id)a3
{
  objc_storeStrong((id *)&self->_protectedContextLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedContextLock, 0);
}

@end
