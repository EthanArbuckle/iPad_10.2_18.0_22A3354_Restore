@implementation BCReadingStatisticsSyncManager

+ (id)sharedInstance
{
  if (qword_30DC30 != -1)
    dispatch_once(&qword_30DC30, &stru_2903E8);
  return (id)qword_30DC28;
}

- (BCReadingStatisticsSyncManager)init
{
  id v2;
  uint64_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  id v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)BCReadingStatisticsSyncManager;
  v2 = -[BCReadingStatisticsSyncManager init](&v18, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    *((_BYTE *)v2 + 16) = 0;
    v5 = dispatch_queue_create("com.apple.BCReadingStasticsSyncManager", 0);
    v6 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BDSApplication applicationCacheDirectory](BDSApplication, "applicationCacheDirectory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("BCReadingStatisticsSyncManagerAssetCache")));
    v9 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8));
    v10 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v12 = *((_QWORD *)v2 + 9);
    v17 = 0;
    objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v17);
    v13 = v17;

    if (v13)
    {
      v14 = BCReadingStatisticsLog();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1B6798((uint64_t *)v2 + 9, (uint64_t)v13, v15);

    }
  }
  return (BCReadingStatisticsSyncManager *)v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudKitController sharedInstance](BCCloudKitController, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "privateCloudDatabaseController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager syncManager](self, "syncManager"));
  objc_msgSend(v4, "removeObserver:recordType:", v5, CFSTR("assetReadingStatistics"));

  -[BCCloudDataSyncManager setDelegate:](self->_syncManager, "setDelegate:", 0);
  v6.receiver = self;
  v6.super_class = (Class)BCReadingStatisticsSyncManager;
  -[BCReadingStatisticsSyncManager dealloc](&v6, "dealloc");
}

- (void)setupWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  BCCloudChangeTokenController *changeTokenController;
  void *v34;
  void *v35;
  BDSSaltVersionIdentifierManager *v36;
  BDSSaltVersionIdentifierManager *saltVersionIdentifierManager;
  id v38;
  void *v39;
  id v40;

  v40 = a3;
  v4 = objc_alloc((Class)BCCloudDataSource);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager _managedObjectModel](self, "_managedObjectModel"));
  v6 = objc_msgSend(v4, "initWithManagedObjectModel:nameOnDisk:", v5, CFSTR("BCReadingStatisticsSync"));
  -[BCReadingStatisticsSyncManager setReadingStatisticsDataSource:](self, "setReadingStatisticsDataSource:", v6);

  v7 = objc_alloc((Class)BCCloudDataSyncManager);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudKitController sharedInstance](BCCloudKitController, "sharedInstance"));
  v9 = objc_msgSend(v7, "initWithCloudKitController:", v8);
  -[BCReadingStatisticsSyncManager setSyncManager:](self, "setSyncManager:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager syncManager](self, "syncManager"));
  objc_msgSend(v10, "setDelegate:", self);

  if (-[BCReadingStatisticsSyncManager enableCloudSync](self, "enableCloudSync"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudKitController sharedInstance](BCCloudKitController, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateCloudDatabaseController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager syncManager](self, "syncManager"));
    objc_msgSend(v12, "addObserver:recordType:", v13, CFSTR("assetReadingStatistics"));

  }
  v14 = objc_alloc((Class)BCCloudDataManager);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager readingStatisticsDataSource](self, "readingStatisticsDataSource"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager entityName](self, "entityName"));
  v17 = objc_opt_class(BCReadingStatisticsSync);
  v18 = objc_opt_class(BCMutableReadingStatisticsSync);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager syncManager](self, "syncManager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudKitController sharedInstance](BCCloudKitController, "sharedInstance"));
  v21 = objc_msgSend(v14, "initWithCloudDataSource:entityName:notificationName:immutableClass:mutableClass:syncManager:cloudKitController:", v15, v16, 0, v17, v18, v19, v20);
  -[BCReadingStatisticsSyncManager setDataManager:](self, "setDataManager:", v21);

  v22 = objc_alloc((Class)BCCloudChangeTokenController);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager readingStatisticsDataSource](self, "readingStatisticsDataSource"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "managedObjectContext"));
  v25 = kBCCloudKitZoneReadingStatistics;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudKitController sharedInstance](BCCloudKitController, "sharedInstance"));
  v27 = objc_msgSend(v22, "initWithMOC:zoneName:cloudKitController:", v24, v25, v26);
  -[BCReadingStatisticsSyncManager setChangeTokenController:](self, "setChangeTokenController:", v27);

  if (-[BCReadingStatisticsSyncManager enableCloudSync](self, "enableCloudSync"))
  {
    v28 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", v25, CKCurrentUserDefaultName);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudKitController sharedInstance](BCCloudKitController, "sharedInstance"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "privateCloudDatabaseController"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager changeTokenController](self, "changeTokenController"));
    objc_msgSend(v30, "registerServerChangeTokenStore:forZoneID:", v31, v28);

    v32 = objc_alloc((Class)BDSSaltVersionIdentifierManager);
    changeTokenController = self->_changeTokenController;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudKitController sharedInstance](BCCloudKitController, "sharedInstance"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "privateCloudDatabaseController"));
    v36 = (BDSSaltVersionIdentifierManager *)objc_msgSend(v32, "initWithZoneDataManager:tokenController:databaseController:", self, changeTokenController, v35);
    saltVersionIdentifierManager = self->_saltVersionIdentifierManager;
    self->_saltVersionIdentifierManager = v36;

  }
  v38 = objc_retainBlock(v40);
  v39 = v38;
  if (v38)
    (*((void (**)(id, _QWORD))v38 + 2))(v38, 0);

}

- (void)setEnableCloudSync:(BOOL)a3
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  _BOOL8 v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  __int16 v19;
  uint8_t buf[2];
  __int16 v21;

  if (self->_enableCloudSync == a3)
  {
    if (self->_enableCloudSync)
      return;
    v3 = BCReadingStatisticsLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 0;
      v5 = "Request to disable CloudSync, but already disabled";
      v6 = (uint8_t *)&v19;
LABEL_10:
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else
  {
    v7 = a3;
    self->_enableCloudSync = a3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager changeTokenController](self, "changeTokenController"));
    objc_msgSend(v9, "setEnableCloudSync:", v7);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudKitController sharedInstance](BCCloudKitController, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "privateCloudDatabaseController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager syncManager](self, "syncManager"));
    if (v7)
    {
      objc_msgSend(v11, "addObserver:recordType:", v12, CFSTR("assetReadingStatistics"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudKitController sharedInstance](BCCloudKitController, "sharedInstance"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transactionManager"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager entityName](self, "entityName"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager syncManager](self, "syncManager"));
      objc_msgSend(v14, "signalSyncToCKTransactionForEntityName:syncManager:", v15, v16);

      v17 = BCReadingStatisticsLog();
      v4 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 0;
        v5 = "Enabling CloudSync";
        v6 = (uint8_t *)&v21;
        goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(v11, "removeObserver:recordType:", v12, CFSTR("assetReadingStatistics"));

      v18 = BCReadingStatisticsLog();
      v4 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v5 = "Disabling CloudSync";
        v6 = buf;
        goto LABEL_10;
      }
    }
  }

}

- (id)fileURLForCachingCKAssetWithAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager ckAssetStoreDirectory](self, "ckAssetStoreDirectory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bu_md5"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", v7));

  return v8;
}

- (void)hasSaltChangedWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager dataManager](self, "dataManager"));
  objc_msgSend(v5, "hasSaltChangedWithCompletion:", v4);

}

- (void)dissociateCloudDataFromSyncWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager dataManager](self, "dataManager"));
  objc_msgSend(v5, "dissociateCloudDataFromSyncWithCompletion:", v4);

}

- (void)registerReadingStatisticsController:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_ADE40;
    v7[3] = &unk_28B808;
    v7[4] = self;
    v8 = v4;
    dispatch_async(accessQueue, v7);

  }
}

- (void)unregisterReadingStatisticsController:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  _QWORD v7[4];
  id v8;
  BCReadingStatisticsSyncManager *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_ADF1C;
    v7[3] = &unk_28B808;
    v8 = v4;
    v9 = self;
    dispatch_async(accessQueue, v7);

  }
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  +[BCCloudDataSource deleteCloudDataWithCompletion:](BCCloudDataSource, "deleteCloudDataWithCompletion:", a3);
}

- (void)readingStatisticsDidChangeOnController:(id)a3 changes:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  BCReadingStatisticsProtoBook *v11;
  _QWORD v12[4];
  BCReadingStatisticsProtoBook *v13;
  id v14;
  BCReadingStatisticsSyncManager *v15;
  id v16;
  id v17;

  v6 = a4;
  v7 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_AE090;
  v12[3] = &unk_290410;
  v13 = objc_alloc_init(BCReadingStatisticsProtoBook);
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
  v15 = self;
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bookVersionString"));
  v17 = v6;
  v8 = v6;
  v9 = v16;
  v10 = v14;
  v11 = v13;
  objc_msgSend(v7, "_setOfReadRangesWithCompletion:", v12);

}

- (void)syncManager:(id)a3 startSyncToCKWithCompletion:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void (**v12)(_QWORD);
  uint8_t v13[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = -[BCReadingStatisticsSyncManager enableCloudSync](self, "enableCloudSync");
  v9 = BCReadingStatisticsLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Attempting sync of data to CK", buf, 2u);
    }

    v12 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager dataManager](self, "dataManager"));
    objc_msgSend(v12, "startSyncToCKWithSyncManager:completion:", v6, v7);

  }
  else
  {
    if (v11)
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Skipping sync of data to CK - cloudSync not enabled", v13, 2u);
    }

    v12 = (void (**)(_QWORD))objc_retainBlock(v7);
    if (v12)
      v12[2](v12);
  }

}

- (void)signalSyncToCKForSyncManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[BCReadingStatisticsSyncManager enableCloudSync](self, "enableCloudSync", a3))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[BCCloudKitController sharedInstance](BCCloudKitController, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transactionManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager entityName](self, "entityName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager syncManager](self, "syncManager"));
    objc_msgSend(v4, "signalSyncToCKTransactionForEntityName:syncManager:", v5, v6);

  }
}

- (void)syncManager:(id)a3 updateSyncGenerationFromCloudData:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v7, "count")));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assetID"));
        objc_msgSend(v9, "setObject:forKey:", v15, v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager dataManager](self, "dataManager"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("assetID IN %@"), v18));
  objc_msgSend(v17, "updateSyncGenerationFromCloudData:predicate:propertyIDKey:completion:", v9, v19, CFSTR("assetID"), v8);

}

- (void)syncManager:(id)a3 resolveConflictsForRecords:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  id v19;

  v7 = a4;
  v8 = a5;
  v9 = -[BCReadingStatisticsSyncManager enableCloudSync](self, "enableCloudSync");
  v10 = BCReadingStatisticsLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Resolving conflicts for records:%@", buf, 0xCu);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager dataManager](self, "dataManager"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_AE8D4;
    v16[3] = &unk_290500;
    v16[4] = self;
    v17 = v8;
    objc_msgSend(v13, "resolveConflictsForRecords:completion:", v7, v16);

  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Skipping resolution of records from CK - cloudSync not enabled", buf, 2u);
    }

    v14 = objc_retainBlock(v8);
    v15 = v14;
    if (v14)
      (*((void (**)(id, _QWORD, _QWORD))v14 + 2))(v14, 0, 0);

  }
}

- (void)syncManager:(id)a3 failedRecordIDs:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a4;
  v8 = a5;
  if (-[BCReadingStatisticsSyncManager enableCloudSync](self, "enableCloudSync"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSyncManager dataManager](self, "dataManager"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_AF454;
    v12[3] = &unk_290528;
    v13 = v8;
    objc_msgSend(v9, "failedRecordIDs:completion:", v7, v12);

  }
  else
  {
    v10 = objc_retainBlock(v8);
    v11 = v10;
    if (v10)
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);

  }
}

- (id)entityName
{
  return CFSTR("BCReadingStatisticsSync");
}

- (id)_managedObjectModel
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("BCReadingStatisticsSync"), CFSTR("momd")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 1));
  v6 = objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", v5);

  return v6;
}

- (id)_appVersion
{
  if (qword_30DC40 != -1)
    dispatch_once(&qword_30DC40, &stru_290548);
  return (id)qword_30DC38;
}

- (BOOL)enableCloudSync
{
  return self->_enableCloudSync;
}

- (NSMapTable)controllers
{
  return self->_controllers;
}

- (void)setControllers:(id)a3
{
  objc_storeStrong((id *)&self->_controllers, a3);
}

- (BCCloudDataSource)readingStatisticsDataSource
{
  return self->_readingStatisticsDataSource;
}

- (void)setReadingStatisticsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_readingStatisticsDataSource, a3);
}

- (BCCloudDataSyncManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
  objc_storeStrong((id *)&self->_syncManager, a3);
}

- (BCCloudDataManager)dataManager
{
  return self->_dataManager;
}

- (void)setDataManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataManager, a3);
}

- (BCCloudChangeTokenController)changeTokenController
{
  return self->_changeTokenController;
}

- (void)setChangeTokenController:(id)a3
{
  objc_storeStrong((id *)&self->_changeTokenController, a3);
}

- (BDSSaltVersionIdentifierManager)saltVersionIdentifierManager
{
  return self->_saltVersionIdentifierManager;
}

- (void)setSaltVersionIdentifierManager:(id)a3
{
  objc_storeStrong((id *)&self->_saltVersionIdentifierManager, a3);
}

- (NSURL)ckAssetStoreDirectory
{
  return self->_ckAssetStoreDirectory;
}

- (void)setCkAssetStoreDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_ckAssetStoreDirectory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckAssetStoreDirectory, 0);
  objc_storeStrong((id *)&self->_saltVersionIdentifierManager, 0);
  objc_storeStrong((id *)&self->_changeTokenController, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_readingStatisticsDataSource, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
