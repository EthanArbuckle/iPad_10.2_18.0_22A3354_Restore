@implementation GKSessionCache

- (GKSessionCache)init
{
  GKSessionCache *v2;
  uint64_t v3;
  NSMutableDictionary *bundleIDsByContainerName;
  uint64_t v5;
  NSMutableDictionary *bundleIDExpirations;
  dispatch_queue_t v7;
  OS_dispatch_queue *cacheQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *cacheUserQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GKSessionCache;
  v2 = -[GKSessionCache init](&v12, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    bundleIDsByContainerName = v2->_bundleIDsByContainerName;
    v2->_bundleIDsByContainerName = (NSMutableDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    bundleIDExpirations = v2->_bundleIDExpirations;
    v2->_bundleIDExpirations = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_create("com.apple.GameCenter.GKSessionCache", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    cacheQueue = v2->_cacheQueue;
    v2->_cacheQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.GameCenter.GKSessionCache.User", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    cacheUserQueue = v2->_cacheUserQueue;
    v2->_cacheUserQueue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

- (void)clearWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *cacheQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  if (os_log_type_enabled(os_log_GKAccount, OS_LOG_TYPE_DEBUG))
    sub_1000BA1A8();
  cacheQueue = self->_cacheQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B5ED0;
  v9[3] = &unk_1002BB758;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_barrier_async(cacheQueue, v9);

}

- (BOOL)isValid
{
  NSObject *cacheQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  cacheQueue = self->_cacheQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B5FD8;
  v5[3] = &unk_1002BE9C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsValid:(BOOL)a3
{
  NSObject *cacheQueue;
  _QWORD block[5];

  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B6078;
  block[3] = &unk_1002BBBD8;
  block[4] = self;
  dispatch_barrier_async(cacheQueue, block);
}

- (void)updateDatabasePath
{
  void *v3;
  uint64_t v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *databasePath;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionCache userRecordID](self, "userRecordID"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordName"));

  if (v10)
  {
    v4 = GKInsecureCacheRoot(v10);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sessions-%@"), v10));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](v5, "stringByAppendingPathComponent:", v6));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("db")));
    databasePath = self->_databasePath;
    self->_databasePath = v8;

    -[GKSessionCache createDatabaseIfNeeded](self, "createDatabaseIfNeeded");
  }
  else
  {
    v5 = self->_databasePath;
    self->_databasePath = 0;
  }

}

- (void)createDatabaseIfNeeded
{
  void *v3;
  uint64_t *p_databasePath;
  unsigned __int8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  p_databasePath = (uint64_t *)&self->_databasePath;
  v5 = objc_msgSend(v3, "fileExistsAtPath:", self->_databasePath);

  if ((v5 & 1) == 0)
  {
    v6 = -[GKSessionCache openDatabase](self, "openDatabase");
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CREATE TABLE %@ (ID INTEGER PRIMARY KEY, %@ INTEGER, %@ INTEGER, %@ REAL)"), CFSTR("USER"), CFSTR("HAS_SUBSCRIPTION"), CFSTR("NEEDS_FRIEND_UPDATE"), CFSTR("LAST_SAVE_DATE")));
      -[GKSessionCache executeStatement:](self, "executeStatement:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("INSERT INTO %@ (%@, %@, %@) VALUES (\"%d\", \"%d\", \"%f\")"), CFSTR("USER"), CFSTR("HAS_SUBSCRIPTION"), CFSTR("NEEDS_FRIEND_UPDATE"), CFSTR("LAST_SAVE_DATE"), 0, 0, 0));

      -[GKSessionCache executeStatement:](self, "executeStatement:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CREATE TABLE %@ (%@ TEXT PRIMARY KEY, %@ TEXT, %@ BLOB)"), CFSTR("SESSIONS"), CFSTR("IDENTIFIER"), CFSTR("CONTAINER"), CFSTR("ARCHIVE")));

      -[GKSessionCache executeStatement:](self, "executeStatement:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CREATE TABLE %@ (%@ TEXT PRIMARY KEY, %@ TEXT, %@ TEXT)"), CFSTR("FRIENDS"), CFSTR("IDENTIFIER"), CFSTR("NAME"), CFSTR("EMAIL")));

      -[GKSessionCache executeStatement:](self, "executeStatement:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CREATE TABLE %@ (ID INTEGER PRIMARY KEY, %@ TEXT, %@ TEXT, %@ BLOB)"), CFSTR("TOKENS"), CFSTR("CONTAINER"), CFSTR("OWNER"), CFSTR("ARCHIVE")));

      -[GKSessionCache executeStatement:](self, "executeStatement:", v11);
      v15 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CREATE UNIQUE INDEX token_idx ON %@ (%@, %@)"), CFSTR("TOKENS"), CFSTR("CONTAINER"), CFSTR("OWNER")));

      -[GKSessionCache executeStatement:](self, "executeStatement:", v15);
      -[GKSessionCache closeDatabase](self, "closeDatabase");

    }
    else
    {
      if (!os_log_GKGeneral)
        v12 = (id)GKOSLoggers(v6);
      v13 = os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_1000BA1D4(p_databasePath, v13, v14);
    }
  }
}

- (CKRecordID)userRecordID
{
  NSObject *cacheUserQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1000B64B4;
  v10 = sub_1000B64C4;
  v11 = 0;
  cacheUserQueue = self->_cacheUserQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B64CC;
  v5[3] = &unk_1002BE9C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheUserQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CKRecordID *)v3;
}

- (GKCloudPlayer)userPlayer
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionCache userRecordID](self, "userRecordID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudPlayer playerWithRecordID:](GKCloudPlayer, "playerWithRecordID:", v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession localPlayerAlias](GKCloudGameSession, "localPlayerAlias"));
  objc_msgSend(v3, "setName:", v4);

  return (GKCloudPlayer *)v3;
}

- (void)updateUserWithHandler:(id)a3
{
  id v4;
  NSObject *cacheUserQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  cacheUserQueue = self->_cacheUserQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B65C8;
  v7[3] = &unk_1002BB758;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(cacheUserQueue, v7);

}

- (id)bundleIDsForContainerName:(id)a3
{
  id v4;
  void *v5;
  NSObject *cacheQueue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1000B64B4;
  v17 = sub_1000B64C4;
  v18 = 0;
  if (v4)
  {
    cacheQueue = self->_cacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B6BF0;
    block[3] = &unk_1002C15D0;
    block[4] = self;
    v11 = v4;
    v12 = &v13;
    dispatch_sync(cacheQueue, block);

    v7 = (void *)v14[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)updateBundleIDs:(id)a3 forContainerName:(id)a4
{
  id v6;
  id v7;
  NSObject *cacheQueue;
  _QWORD block[4];
  id v10;
  GKSessionCache *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    cacheQueue = self->_cacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B6D28;
    block[3] = &unk_1002BC380;
    v10 = v6;
    v11 = self;
    v12 = v7;
    dispatch_barrier_async(cacheQueue, block);

  }
}

- (id)bundleIDCacheURL
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = GKInsecureCacheRoot(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("sessions-bundleIDs")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("data")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v5));
  return v6;
}

- (void)readBundleIDsFromDisk
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionCache bundleIDCacheURL](self, "bundleIDCacheURL"));
  v11 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v3, 0, &v11));
  v5 = v11;

  if (v4)
  {
    v10 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v4, 1, 0, &v10));
    v7 = v10;

    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIDs")));
      -[GKSessionCache setBundleIDsByContainerName:](self, "setBundleIDsByContainerName:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("expirations")));
      -[GKSessionCache setBundleIDExpirations:](self, "setBundleIDExpirations:", v9);

    }
    v5 = v7;
  }

}

- (void)writeBundleIDsToDisk
{
  NSMutableDictionary *bundleIDExpirations;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[2];
  _QWORD v12[2];

  v11[0] = CFSTR("bundleIDs");
  v11[1] = CFSTR("expirations");
  bundleIDExpirations = self->_bundleIDExpirations;
  v12[0] = self->_bundleIDsByContainerName;
  v12[1] = bundleIDExpirations;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
  v10 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v4, 200, 0, &v10));
  v6 = v10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionCache bundleIDCacheURL](self, "bundleIDCacheURL"));
  v9 = v6;
  objc_msgSend(v5, "writeToURL:options:error:", v7, 1, &v9);
  v8 = v9;

}

- (void)readUserInfoFromDatabase
{
  void *v3;
  _QWORD v4[5];

  if (-[GKSessionCache openDatabase](self, "openDatabase"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT %@, %@, %@ FROM %@"), CFSTR("HAS_SUBSCRIPTION"), CFSTR("NEEDS_FRIEND_UPDATE"), CFSTR("LAST_SAVE_DATE"), CFSTR("USER")));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000B7124;
    v4[3] = &unk_1002C15F8;
    v4[4] = self;
    -[GKSessionCache stepStatement:parameters:rowHandler:](self, "stepStatement:parameters:rowHandler:", v3, 0, v4);
    -[GKSessionCache closeDatabase](self, "closeDatabase");

  }
}

- (BOOL)saveUserInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v13[3];

  if (!-[GKSessionCache openDatabase](self, "openDatabase"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UPDATE %@ SET %@=?, %@=?, %@=?"), CFSTR("USER"), CFSTR("HAS_SUBSCRIPTION"), CFSTR("NEEDS_FRIEND_UPDATE"), CFSTR("LAST_SAVE_DATE")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_userHasSubscription));
  v13[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_friendRecordNeedsUpdate));
  v13[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDecimalNumber numberWithDouble:](NSDecimalNumber, "numberWithDouble:", self->_lastSaveTimeStamp));
  v13[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 3));
  v8 = -[GKSessionCache stepStatement:parameters:rowHandler:](self, "stepStatement:parameters:rowHandler:", v3, v7, 0);

  if (!v8)
  {
    if (!os_log_GKGeneral)
      v10 = (id)GKOSLoggers(v9);
    v11 = (void *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_1000BA364((uint64_t)self, v11);
  }
  -[GKSessionCache closeDatabase](self, "closeDatabase");

  return v8;
}

- (BOOL)userHasSubscription
{
  NSObject *cacheQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  cacheQueue = self->_cacheQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B73D8;
  v5[3] = &unk_1002BE9C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setUserHasSubscription:(BOOL)a3
{
  NSObject *cacheQueue;
  _QWORD v4[5];
  BOOL v5;

  cacheQueue = self->_cacheQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B7448;
  v4[3] = &unk_1002BCAF8;
  v4[4] = self;
  v5 = a3;
  dispatch_barrier_async(cacheQueue, v4);
}

- (BOOL)friendRecordNeedsUpdate
{
  NSObject *cacheQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  cacheQueue = self->_cacheQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B74FC;
  v5[3] = &unk_1002BE9C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setFriendRecordNeedsUpdate:(BOOL)a3
{
  NSObject *cacheQueue;
  _QWORD v4[5];
  BOOL v5;

  cacheQueue = self->_cacheQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B756C;
  v4[3] = &unk_1002BCAF8;
  v4[4] = self;
  v5 = a3;
  dispatch_barrier_async(cacheQueue, v4);
}

- (double)lastSaveTimeStamp
{
  NSObject *cacheQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  cacheQueue = self->_cacheQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B7620;
  v5[3] = &unk_1002BE9C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setLastSaveTimeStamp:(double)a3
{
  NSObject *cacheQueue;
  _QWORD v4[6];

  cacheQueue = self->_cacheQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000B7690;
  v4[3] = &unk_1002C1620;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_barrier_async(cacheQueue, v4);
}

- (id)tokenFromData:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v3, 0);

  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(CKServerChangeToken, v5), NSKeyedArchiveRootObjectKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "finishDecoding");

  return v7;
}

- (id)tokenForZoneID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "zoneName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ownerName"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionCache tokenForContainerName:ownerName:](self, "tokenForContainerName:ownerName:", v5, v6));
  return v7;
}

- (void)setToken:(id)a3 forZoneID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ownerName"));

  -[GKSessionCache setToken:forContainerName:ownerName:](self, "setToken:forContainerName:ownerName:", v7, v9, v8);
}

- (CKServerChangeToken)privateDBToken
{
  return (CKServerChangeToken *)-[GKSessionCache tokenForContainerName:ownerName:](self, "tokenForContainerName:ownerName:", CFSTR("com.apple.socialgaming.privateToken"), &stru_1002CE2A8);
}

- (void)setPrivateDBToken:(id)a3
{
  -[GKSessionCache setToken:forContainerName:ownerName:](self, "setToken:forContainerName:ownerName:", a3, CFSTR("com.apple.socialgaming.privateToken"), &stru_1002CE2A8);
}

- (CKServerChangeToken)sharedDBToken
{
  return (CKServerChangeToken *)-[GKSessionCache tokenForContainerName:ownerName:](self, "tokenForContainerName:ownerName:", CFSTR("com.apple.socialgaming.sharedToken"), &stru_1002CE2A8);
}

- (void)setSharedDBToken:(id)a3
{
  -[GKSessionCache setToken:forContainerName:ownerName:](self, "setToken:forContainerName:ownerName:", a3, CFSTR("com.apple.socialgaming.sharedToken"), &stru_1002CE2A8);
}

- (id)tokenForContainerName:(id)a3 ownerName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *cacheQueue;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = sub_1000B64B4;
    v21 = sub_1000B64C4;
    v22 = 0;
    cacheQueue = self->_cacheQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B79D8;
    v13[3] = &unk_1002C1670;
    v13[4] = self;
    v14 = v6;
    v15 = v8;
    v16 = &v17;
    dispatch_barrier_sync(cacheQueue, v13);
    v10 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    if (!os_log_GKGeneral)
      v11 = (id)GKOSLoggers(v7);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_1000BA3D0();
    v10 = 0;
  }

  return v10;
}

- (void)setToken:(id)a3 forContainerName:(id)a4 ownerName:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *cacheQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  cacheQueue = self->_cacheQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B7C30;
  v15[3] = &unk_1002BC3F8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_barrier_async(cacheQueue, v15);

}

- (void)updateWithChangedTokens:(id)a3 removedTokenZoneIDs:(id)a4
{
  id v6;
  id v7;
  NSObject *cacheQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B7D1C;
  block[3] = &unk_1002BC380;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(cacheQueue, block);

}

- (void)_setToken:(id)a3 forContainerName:(id)a4 ownerName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  id v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO %@ (%@, %@, %@) VALUES (?, ?, ?)"), CFSTR("TOKENS"), CFSTR("CONTAINER"), CFSTR("OWNER"), CFSTR("ARCHIVE")));
      v18[0] = v9;
      v18[1] = v10;
      v18[2] = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 3));
    }
    else
    {
      v13 = 0;
      v12 = 0;
    }

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@=? AND %@=?"), CFSTR("TOKENS"), CFSTR("CONTAINER"), CFSTR("OWNER")));
    v17[0] = v9;
    v17[1] = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
  }
  v14 = -[GKSessionCache stepStatement:parameters:rowHandler:](self, "stepStatement:parameters:rowHandler:", v12, v13, 0);
  if (!v14)
  {
    if (!os_log_GKGeneral)
      v15 = (id)GKOSLoggers(v14);
    v16 = (void *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_1000BA44C((uint64_t)self, v16);
  }

}

- (NSArray)friendPlayers
{
  NSObject *cacheQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1000B64B4;
  v11 = sub_1000B64C4;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  cacheQueue = self->_cacheQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B8208;
  v6[3] = &unk_1002BC800;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_barrier_sync(cacheQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSDictionary)friendEmailsByID
{
  NSObject *cacheQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1000B64B4;
  v11 = sub_1000B64C4;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  cacheQueue = self->_cacheQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B8434;
  v6[3] = &unk_1002BC800;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_barrier_sync(cacheQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)setFriendPlayers:(id)a3 withEmails:(id)a4
{
  id v6;
  id v7;
  NSObject *cacheQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B8624;
  block[3] = &unk_1002BC380;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(cacheQueue, block);

}

- (void)updateWithChangedSessions:(id)a3 removedSessions:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unsigned int v31;
  void *v32;
  NSObject *cacheQueue;
  void *v34;
  void *v35;
  GKSessionCache *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id obj;
  uint64_t v42;
  void *v43;
  id v44;
  _QWORD block[5];
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionCache userPlayer](self, "userPlayer"));
  if (v11)
  {
    if (objc_msgSend(v8, "count"))
    {
      v37 = v11;
      v38 = v10;
      v39 = v9;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionCache friendPlayers](self, "friendPlayers"));
      v13 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));

      v36 = self;
      v14 = objc_claimAutoreleasedReturnValue(-[GKSessionCache friendEmailsByID](self, "friendEmailsByID"));
      v35 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v13));
      v34 = (void *)v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v14));
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v40 = v8;
      obj = v8;
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      if (v44)
      {
        v42 = *(_QWORD *)v54;
        v43 = v15;
        do
        {
          for (i = 0; i != v44; i = (char *)i + 1)
          {
            if (*(_QWORD *)v54 != v42)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "playersByIdentifier"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allValues"));
            objc_msgSend(v15, "addObjectsFromArray:", v20);

            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "playersByIdentifier"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allKeys"));

            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v50;
              do
              {
                for (j = 0; j != v24; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v50 != v25)
                    objc_enumerationMutation(v22);
                  v27 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)j);
                  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "emailsByCKID"));
                  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v27));

                  if (v29)
                    objc_msgSend(v16, "setObject:forKeyedSubscript:", v29, v27);

                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
              }
              while (v24);
            }

            v15 = v43;
          }
          v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        }
        while (v44);
      }

      v11 = v37;
      objc_msgSend(v15, "removeObject:", v37);
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "identifier"));
      objc_msgSend(v16, "removeObjectForKey:", v30);

      v31 = objc_msgSend(v15, "isEqualToSet:", v35);
      LOBYTE(v30) = v31;
      self = v36;
      -[GKSessionCache setFriendRecordNeedsUpdate:](v36, "setFriendRecordNeedsUpdate:", v31 ^ 1);
      if ((v30 & 1) == 0)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allObjects"));
        -[GKSessionCache setFriendPlayers:withEmails:](v36, "setFriendPlayers:withEmails:", v32, v16);

      }
      v9 = v39;
      v8 = v40;
      v10 = v38;
    }
    cacheQueue = self->_cacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B8D4C;
    block[3] = &unk_1002BB518;
    block[4] = self;
    v46 = v9;
    v47 = v8;
    v48 = v10;
    dispatch_barrier_async(cacheQueue, block);

  }
}

- (id)sessionFromData:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v3, 0);

  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GKCloudGameSession, v5), NSKeyedArchiveRootObjectKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "finishDecoding");

  return v7;
}

- (id)sessionWithRecordID:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession sessionIdentifierForRecordID:](GKCloudGameSession, "sessionIdentifierForRecordID:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKSessionCache sessionWithIdentifier:](self, "sessionWithIdentifier:", v4));

  return v5;
}

- (id)sessionsInContainer:(id)a3
{
  return -[GKSessionCache sessionsInContainer:ownerName:](self, "sessionsInContainer:ownerName:", a3, 0);
}

- (id)sessionsInContainer:(id)a3 ownerName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *cacheQueue;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    cacheQueue = self->_cacheQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000B955C;
    v16[3] = &unk_1002BC3F8;
    v16[4] = self;
    v17 = v6;
    v18 = v8;
    v11 = v9;
    v19 = v11;
    dispatch_barrier_sync(cacheQueue, v16);
    v12 = v19;
    v13 = v11;

  }
  else
  {
    if (!os_log_GKGeneral)
      v14 = (id)GKOSLoggers(v7);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_1000BA5B4();
    v13 = &__NSArray0__struct;
  }

  return v13;
}

- (id)sessionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *cacheQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = sub_1000B64B4;
    v17 = sub_1000B64C4;
    v18 = 0;
    cacheQueue = self->_cacheQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B9880;
    block[3] = &unk_1002C15D0;
    block[4] = self;
    v11 = v4;
    v12 = &v13;
    dispatch_barrier_sync(cacheQueue, block);
    v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    if (!os_log_GKGeneral)
      v8 = (id)GKOSLoggers(0);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_1000BA5E0();
    v7 = 0;
  }

  return v7;
}

- (BOOL)openDatabase
{
  return sqlite3_open(-[NSString UTF8String](self->_databasePath, "UTF8String"), &self->_database) == 0;
}

- (void)closeDatabase
{
  sqlite3_close(self->_database);
  self->_database = 0;
}

- (BOOL)executeStatement:(id)a3
{
  uint64_t v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  char *errmsg;

  if (!a3)
    return 0;
  errmsg = 0;
  v3 = sqlite3_exec(self->_database, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 0, 0, &errmsg);
  v4 = (_DWORD)v3 == 0;
  if (errmsg)
  {
    if (!os_log_GKGeneral)
      v5 = (id)GKOSLoggers(v3);
    v6 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_1000BA60C((uint64_t *)&errmsg, v6, v7);
    sqlite3_free(errmsg);
  }
  return v4;
}

- (sqlite3_stmt)prepareStatementWithSQL:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  sqlite3 **p_database;
  uint64_t v9;
  id v10;
  void *v11;
  sqlite3_stmt *v12;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  sqlite3_stmt *ppStmt;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
LABEL_7:
    v12 = 0;
    goto LABEL_11;
  }
  ppStmt = 0;
  p_database = &self->_database;
  v9 = sqlite3_prepare_v2(self->_database, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, &ppStmt, 0);
  if ((_DWORD)v9)
  {
    if (!os_log_GKGeneral)
      v10 = (id)GKOSLoggers(v9);
    v11 = (void *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_1000BA678(p_database, v11);
    goto LABEL_7;
  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B9C98;
  v14[3] = &unk_1002C16C0;
  v14[5] = &v15;
  v14[6] = ppStmt;
  v14[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);
  v12 = ppStmt;
  if (!*((_BYTE *)v16 + 24))
  {
    sqlite3_finalize(ppStmt);
    v12 = 0;
  }
  _Block_object_dispose(&v15, 8);
LABEL_11:

  return v12;
}

- (BOOL)bindStatement:(sqlite3_stmt *)a3 withParameter:(id)a4 atPosition:(int)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t isKindOfClass;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  id v24;
  void *v25;

  v7 = a4;
  v9 = objc_opt_class(NSString, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    v11 = sqlite3_bind_text(a3, a5, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
LABEL_9:
    v22 = v11 == 0;
    goto LABEL_10;
  }
  v12 = objc_opt_class(NSDecimalNumber, v10);
  if ((objc_opt_isKindOfClass(v7, v12) & 1) != 0)
  {
    objc_msgSend(v7, "doubleValue");
    v11 = sqlite3_bind_double(a3, a5, v14);
    goto LABEL_9;
  }
  v15 = objc_opt_class(NSNumber, v13);
  if ((objc_opt_isKindOfClass(v7, v15) & 1) != 0)
  {
    v11 = sqlite3_bind_int(a3, a5, (int)objc_msgSend(v7, "intValue"));
    goto LABEL_9;
  }
  v17 = objc_opt_class(NSData, v16);
  isKindOfClass = objc_opt_isKindOfClass(v7, v17);
  if ((isKindOfClass & 1) != 0)
  {
    v19 = objc_retainAutorelease(v7);
    v20 = objc_msgSend(v19, "bytes");
    v21 = objc_msgSend(v19, "length");

    v11 = sqlite3_bind_blob64(a3, a5, v20, (sqlite3_uint64)v21, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_9;
  }
  if (!os_log_GKGeneral)
    v24 = (id)GKOSLoggers(isKindOfClass);
  v25 = (void *)os_log_GKError;
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    sub_1000BA778(v25, (uint64_t)v7);
  v22 = 0;
LABEL_10:

  return v22;
}

- (BOOL)stepStatement:(id)a3 parameters:(id)a4 rowHandler:(id)a5
{
  void (**v8)(id, sqlite3_stmt *);
  sqlite3_stmt *v9;
  sqlite3_stmt *v10;
  uint64_t v11;
  BOOL v12;
  id v13;
  void *v14;

  v8 = (void (**)(id, sqlite3_stmt *))a5;
  v9 = -[GKSessionCache prepareStatementWithSQL:parameters:](self, "prepareStatementWithSQL:parameters:", a3, a4);
  if (v9)
  {
    v10 = v9;
    while (1)
    {
      v11 = sqlite3_step(v10);
      if ((_DWORD)v11 != 100)
        break;
      if (v8)
        v8[2](v8, v10);
    }
    v12 = (_DWORD)v11 == 101;
    if ((_DWORD)v11 != 101)
    {
      if (!os_log_GKGeneral)
        v13 = (id)GKOSLoggers(v11);
      v14 = (void *)os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_1000BA800((uint64_t)self, v14);
    }
    sqlite3_finalize(v10);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)dataFromRowStatement:(sqlite3_stmt *)a3 column:(int)a4
{
  const void *v6;

  v6 = sqlite3_column_blob(a3, a4);
  return +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v6, sqlite3_column_bytes(a3, a4));
}

- (id)stringFromRowStatement:(sqlite3_stmt *)a3 column:(int)a4
{
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sqlite3_column_text(a3, a4));
}

- (int)intFromRowStatement:(sqlite3_stmt *)a3 column:(int)a4
{
  return sqlite3_column_int(a3, a4);
}

- (double)doubleFromRowStatement:(sqlite3_stmt *)a3 column:(int)a4
{
  return sqlite3_column_double(a3, a4);
}

- (void)setUserRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_userRecordID, a3);
}

- (NSMutableDictionary)bundleIDsByContainerName
{
  return self->_bundleIDsByContainerName;
}

- (void)setBundleIDsByContainerName:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDsByContainerName, a3);
}

- (NSMutableDictionary)bundleIDExpirations
{
  return self->_bundleIDExpirations;
}

- (void)setBundleIDExpirations:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDExpirations, a3);
}

- (sqlite3)database
{
  return self->_database;
}

- (void)setDatabase:(sqlite3 *)a3
{
  self->_database = a3;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void)setDatabasePath:(id)a3
{
  objc_storeStrong((id *)&self->_databasePath, a3);
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
  objc_storeStrong((id *)&self->_expiration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_bundleIDExpirations, 0);
  objc_storeStrong((id *)&self->_bundleIDsByContainerName, 0);
  objc_storeStrong((id *)&self->_userRecordID, 0);
  objc_storeStrong((id *)&self->_cacheUserQueue, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

@end
