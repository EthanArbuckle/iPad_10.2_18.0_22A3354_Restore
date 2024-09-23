@implementation AEAnnotationProvider

+ (AEAnnotationProvider)sharedInstance
{
  void *v2;
  _QWORD block[5];

  v2 = (void *)qword_30DC78;
  if (!qword_30DC78)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_CF388;
    block[3] = &unk_28B8C8;
    block[4] = a1;
    if (qword_30DC80 != -1)
      dispatch_once(&qword_30DC80, block);
    v2 = (void *)qword_30DC78;
  }
  return (AEAnnotationProvider *)v2;
}

- (AEAnnotationManagedObjectContext)uiManagedObjectContext
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  return self->_uiManagedObjectContext;
}

- (BOOL)iCloudEnabledInUserDefaults
{
  return 1;
}

- (AEAnnotationProvider)init
{
  AEAnnotationProvider *v2;
  AEAnnotationProvider *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AEAnnotationProvider;
  v2 = -[IMUbiquitousDataProvider init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend((id)objc_opt_class(v2), "storeName");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider localPersistentStoreLoader](v3, "localPersistentStoreLoader"));
    objc_msgSend(v6, "setStoreName:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider localPersistentStoreLoader](v3, "localPersistentStoreLoader"));
    objc_msgSend(v7, "setManagedObjectModelName:", CFSTR("AEAnnotation"));

    -[AEAnnotationProvider _commonInit](v3, "_commonInit");
  }
  return v3;
}

- (void)_commonInit
{
  NSMutableSet *v3;
  NSMutableSet *acknowledgedMismatchingAssetIDs;
  AEAnnotationManagedObjectContext *v5;
  AEAnnotationManagedObjectContext *privateUserEditMOC;
  AEAnnotationManagedObjectContext *v7;
  AEAnnotationManagedObjectContext *privateCloudSyncMOC;
  AEAnnotationManagedObjectContext *v9;
  AEAnnotationManagedObjectContext *uiManagedObjectContext;
  void *v11;
  NSObject *v12;
  NSObject *mocSaveObserver;
  _QWORD v14[4];
  id v15;
  id location;

  v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  acknowledgedMismatchingAssetIDs = self->_acknowledgedMismatchingAssetIDs;
  self->_acknowledgedMismatchingAssetIDs = v3;

  v5 = -[IMUbiquitousDataProvider newManagedObjectContextWithClass:concurrencyType:](self, "newManagedObjectContextWithClass:concurrencyType:", objc_opt_class(AEAnnotationManagedObjectContext), 1);
  privateUserEditMOC = self->_privateUserEditMOC;
  self->_privateUserEditMOC = v5;

  -[AEAnnotationManagedObjectContext setAnnotationProvider:](self->_privateUserEditMOC, "setAnnotationProvider:", self);
  -[AEAnnotationManagedObjectContext setSessionContextType:](self->_privateUserEditMOC, "setSessionContextType:", 0);
  v7 = -[IMUbiquitousDataProvider newManagedObjectContextWithClass:concurrencyType:](self, "newManagedObjectContextWithClass:concurrencyType:", objc_opt_class(AEAnnotationManagedObjectContext), 1);
  privateCloudSyncMOC = self->_privateCloudSyncMOC;
  self->_privateCloudSyncMOC = v7;

  -[AEAnnotationManagedObjectContext setAnnotationProvider:](self->_privateCloudSyncMOC, "setAnnotationProvider:", self);
  -[AEAnnotationManagedObjectContext setSessionContextType:](self->_privateCloudSyncMOC, "setSessionContextType:", 2);
  v9 = -[IMUbiquitousDataProvider newManagedObjectContextWithClass:concurrencyType:](self, "newManagedObjectContextWithClass:concurrencyType:", objc_opt_class(AEAnnotationManagedObjectContext), 2);
  uiManagedObjectContext = self->_uiManagedObjectContext;
  self->_uiManagedObjectContext = v9;

  -[AEAnnotationManagedObjectContext setAnnotationProvider:](self->_uiManagedObjectContext, "setAnnotationProvider:", self);
  -[AEAnnotationManagedObjectContext setSessionContextType:](self->_uiManagedObjectContext, "setSessionContextType:", 1);
  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_CF688;
  v14[3] = &unk_290B90;
  objc_copyWeak(&v15, &location);
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", NSManagedObjectContextDidSaveNotification, 0, 0, v14));
  mocSaveObserver = self->_mocSaveObserver;
  self->_mocSaveObserver = v12;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (AEAnnotationProvider)initWithPersistentStoreURL:(id)a3
{
  AEAnnotationProvider *v3;
  AEAnnotationProvider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AEAnnotationProvider;
  v3 = -[IMUbiquitousDataProvider initWithPersistentStoreURL:](&v6, "initWithPersistentStoreURL:", a3);
  v4 = v3;
  if (v3)
    -[AEAnnotationProvider _commonInit](v3, "_commonInit");
  return v4;
}

- (void)dealloc
{
  void *v3;
  NSObject *mocSaveObserver;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self->_mocSaveObserver);

  mocSaveObserver = self->_mocSaveObserver;
  self->_mocSaveObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)AEAnnotationProvider;
  -[AEAnnotationProvider dealloc](&v5, "dealloc");
}

- (void)deleteAnnotation:(id)a3
{
  objc_msgSend(a3, "setAnnotationDeleted:", 1);
}

- (BOOL)exportAnnotationsMatchingPredicate:(id)a3 toURL:(id)a4 withType:(int)a5 error:(id *)a6
{
  id v9;
  id v10;
  AEAnnotationProvider *v11;
  void *v12;
  void *v13;

  if (!a5)
  {
    v9 = a4;
    v10 = a3;
    v11 = -[AEAnnotationProvider initWithPersistentStoreURL:]([AEAnnotationProvider alloc], "initWithPersistentStoreURL:", v9);

    -[IMUbiquitousDataProvider loadCoreData](v11, "loadCoreData");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider persistentStoreCoordinator](self, "persistentStoreCoordinator"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider persistentStoreCoordinator](v11, "persistentStoreCoordinator"));
    -[AEAnnotationProvider migrateFromPersistentStoreCoordinator:toPersistentStoreCoordinator:withPredicate:](self, "migrateFromPersistentStoreCoordinator:toPersistentStoreCoordinator:withPredicate:", v12, v13, v10);

  }
  return a5 == 0;
}

- (BOOL)acknowledgeMergingAnnotationsWithAssetVersionMismatch:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider delegate](self, "delegate"));
    v9 = objc_opt_respondsToSelector(v8, "annotationProvider:acknowledgeMergingAnnotationsWithAssetVersionMismatch:assetID:");

    if ((v9 & 1) != 0)
    {
      if (v6)
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(":%@"), v6));
      else
        v10 = v7;
      v12 = v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider acknowledgedMismatchingAssetIDs](self, "acknowledgedMismatchingAssetIDs"));
      objc_sync_enter(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider acknowledgedMismatchingAssetIDs](self, "acknowledgedMismatchingAssetIDs"));
      v15 = objc_msgSend(v14, "containsObject:", v12);

      objc_sync_exit(v13);
      if ((v15 & 1) == 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider delegate](self, "delegate"));
        v17 = objc_msgSend(v16, "annotationProvider:acknowledgeMergingAnnotationsWithAssetVersionMismatch:assetID:", self, v6, v7);

        if (!v17)
        {
          v11 = 0;
          goto LABEL_12;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider acknowledgedMismatchingAssetIDs](self, "acknowledgedMismatchingAssetIDs"));
        objc_sync_enter(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider acknowledgedMismatchingAssetIDs](self, "acknowledgedMismatchingAssetIDs"));
        objc_msgSend(v19, "addObject:", v12);

        objc_sync_exit(v18);
      }
      v11 = 1;
LABEL_12:

      goto LABEL_13;
    }
  }
  v11 = 1;
LABEL_13:

  return v11;
}

+ (id)cacheKeyForService:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DatabaseBackupFileService")) & 1) != 0)
  {
    v4 = CFSTR("BKBookmark-Generation");
  }
  else
  {
    if (objc_msgSend(v3, "length"))
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v3, kMaxModificationTimeIntervalSince1970));
    else
      v5 = kMaxModificationTimeIntervalSince1970;
    v4 = v5;
  }

  return v4;
}

- (void)onAnnotationsMatchingPredicate:(id)a3 performBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_CFB4C;
  v11[3] = &unk_28B750;
  v12 = v6;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider privateUserEditMOC](self, "privateUserEditMOC"));
  v14 = v7;
  v8 = v7;
  v9 = v13;
  v10 = v6;
  objc_msgSend(v9, "performBlock:", v11);

}

- (void)onAnnotationsMatchingPredicate:(id)a3 performBlockAndWait:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_CFCD0;
  v11[3] = &unk_28B750;
  v12 = v6;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider privateUserEditMOC](self, "privateUserEditMOC"));
  v14 = v7;
  v8 = v7;
  v9 = v13;
  v10 = v6;
  objc_msgSend(v9, "performBlockAndWait:", v11);

}

- (void)onGlobalAnnotationsForAssetIDs:(id)a3 performBlockAndWait:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_CFE54;
  v11[3] = &unk_28B750;
  v12 = v6;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider privateUserEditMOC](self, "privateUserEditMOC"));
  v14 = v7;
  v8 = v7;
  v9 = v13;
  v10 = v6;
  objc_msgSend(v9, "performBlockAndWait:", v11);

}

- (void)modifyAnnotationsWithUUIDs:(id)a3 type:(int)a4 performBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  if (a4 == 2)
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider privateCloudSyncMOC](self, "privateCloudSyncMOC"));
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider privateUserEditMOC](self, "privateUserEditMOC"));
  v11 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_D0178;
  v15[3] = &unk_28B750;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v11;
  v14 = v8;
  objc_msgSend(v13, "performBlock:", v15);

}

- (void)modifyGlobalAnnotationsWithAssetIDs:(id)a3 type:(int)a4 performBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  if (a4 == 2)
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider privateCloudSyncMOC](self, "privateCloudSyncMOC"));
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider privateUserEditMOC](self, "privateUserEditMOC"));
  v11 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_D05E8;
  v15[3] = &unk_28B750;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v11;
  v14 = v8;
  objc_msgSend(v13, "performBlock:", v15);

}

- (void)performBlockOnUserSideQueue:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10[5];
  id v11;

  v7 = a3;
  if (!v7)
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationProvider.m", 374, (uint64_t)"-[AEAnnotationProvider performBlockOnUserSideQueue:]", (uint64_t)"block", 0, v4, v5, v6, v10[0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider privateUserEditMOC](self, "privateUserEditMOC"));
  v10[0] = (uint64_t)_NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = (uint64_t)sub_D0BF0;
  v10[3] = (uint64_t)&unk_28C388;
  v10[4] = (uint64_t)self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "performBlock:", v10);

}

- (void)performBlockOnUserSideQueueAndWait:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v7 = a3;
  if (!v7)
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationProvider.m", 393, (uint64_t)"-[AEAnnotationProvider performBlockOnUserSideQueueAndWait:]", (uint64_t)"block", 0, v4, v5, v6, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider privateUserEditMOC](self, "privateUserEditMOC"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_D0D84;
  v11[3] = &unk_28C388;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v8, "performBlockAndWait:", v11);

}

- (void)cloudSyncVersionsForDataType:(id)a3 performBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_D0F20;
  v11[3] = &unk_28B750;
  v12 = v6;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider privateCloudSyncMOC](self, "privateCloudSyncMOC"));
  v14 = v7;
  v8 = v7;
  v9 = v13;
  v10 = v6;
  objc_msgSend(v9, "performBlock:", v11);

}

- (void)migrateFromPersistentStoreCoordinator:(id)a3 toPersistentStoreCoordinator:(id)a4 withPredicate:(id)a5
{
  id v8;
  id v9;
  id v10;
  AEAnnotationManagedObjectContext *v11;
  id v12;
  id v13;
  id v14;
  AEAnnotationManagedObjectContext *v15;
  _QWORD v16[4];
  AEAnnotationManagedObjectContext *v17;
  id v18;
  id v19;
  id v20;
  AEAnnotationProvider *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[AEAnnotationManagedObjectContext initWithConcurrencyType:]([AEAnnotationManagedObjectContext alloc], "initWithConcurrencyType:", 1);
  -[AEAnnotationManagedObjectContext setSessionContextType:](v11, "setSessionContextType:", 3);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_D12AC;
  v16[3] = &unk_28F550;
  v17 = v11;
  v18 = v8;
  v19 = v10;
  v20 = v9;
  v21 = self;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  v15 = v11;
  -[AEAnnotationManagedObjectContext performBlockAndWait:](v15, "performBlockAndWait:", v16);

}

- (void)migrateFromPersistentStoreCoordinator:(id)a3 toPersistentStoreCoordinator:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  -[AEAnnotationProvider migrateFromPersistentStoreCoordinator:toPersistentStoreCoordinator:withPredicate:](self, "migrateFromPersistentStoreCoordinator:toPersistentStoreCoordinator:withPredicate:", v7, v6, v8);

}

+ (id)ubiquityPeerIDOverride
{
  return 0;
}

+ (id)managedObjectModelName
{
  return CFSTR("AEAnnotation");
}

+ (id)managedObjectModelBundle
{
  return +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(AEAnnotationProvider));
}

+ (id)storeName
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("AEAnnotation"), CFSTR("v10312011_1727"));
}

- (void)upgradeAnnotationsIfNeeded
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  AEAnnotationProvider *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider metadataObjectForKey:](self, "metadataObjectForKey:", CFSTR("Annotations-Update-Version")));
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "unsignedIntegerValue");
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_D18F4;
    v6[3] = &unk_28B808;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider privateUserEditMOC](self, "privateUserEditMOC"));
    v8 = self;
    v4 = v7;
    objc_msgSend(v4, "performBlockAndWait:", v6);

  }
}

- (void)_mocDidSave:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  id v10;
  AEAnnotationManagedObjectContext *v11;
  id v12;
  id v13;
  AEAnnotationManagedObjectContext *v14;
  _QWORD v15[4];
  AEAnnotationManagedObjectContext *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  objc_initWeak(location, v5);

  WeakRetained = objc_loadWeakRetained(location);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "persistentStoreCoordinator"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquitousDataProvider persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  if (v7 == v8)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider privateCloudSyncMOC](self, "privateCloudSyncMOC"));
    v10 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotationProvider privateUserEditMOC](self, "privateUserEditMOC"));
    v11 = self->_uiManagedObjectContext;
    v12 = objc_loadWeakRetained(location);

    if (v12 != v9)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_D1DD8;
      v21[3] = &unk_28B808;
      v22 = v9;
      v23 = v4;
      objc_msgSend(v22, "performBlock:", v21);

    }
    v13 = objc_loadWeakRetained(location);

    if (v13 != v10)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_D1DE4;
      v18[3] = &unk_28B808;
      v19 = v10;
      v20 = v4;
      objc_msgSend(v19, "performBlock:", v18);

    }
    v14 = (AEAnnotationManagedObjectContext *)objc_loadWeakRetained(location);

    if (v14 != v11)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        -[AEAnnotationManagedObjectContext mergeChangesFromContextDidSaveNotification:](v11, "mergeChangesFromContextDidSaveNotification:", v4);
      }
      else
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_D1DF0;
        v15[3] = &unk_28B808;
        v16 = v11;
        v17 = v4;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

      }
    }

  }
  objc_destroyWeak(location);

}

- (NSMutableSet)acknowledgedMismatchingAssetIDs
{
  return self->_acknowledgedMismatchingAssetIDs;
}

- (void)setAcknowledgedMismatchingAssetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_acknowledgedMismatchingAssetIDs, a3);
}

- (AEAnnotationProviderDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (AEAnnotationProviderDelegate *)a3;
}

- (AEAnnotationManagedObjectContext)privateUserEditMOC
{
  return self->_privateUserEditMOC;
}

- (void)setPrivateUserEditMOC:(id)a3
{
  objc_storeStrong((id *)&self->_privateUserEditMOC, a3);
}

- (AEAnnotationManagedObjectContext)privateCloudSyncMOC
{
  return self->_privateCloudSyncMOC;
}

- (void)setPrivateCloudSyncMOC:(id)a3
{
  objc_storeStrong((id *)&self->_privateCloudSyncMOC, a3);
}

- (NSObject)mocSaveObserver
{
  return self->_mocSaveObserver;
}

- (void)setMocSaveObserver:(id)a3
{
  objc_storeStrong((id *)&self->_mocSaveObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mocSaveObserver, 0);
  objc_storeStrong((id *)&self->_privateCloudSyncMOC, 0);
  objc_storeStrong((id *)&self->_privateUserEditMOC, 0);
  objc_storeStrong((id *)&self->_uiManagedObjectContext, 0);
  objc_storeStrong((id *)&self->_acknowledgedMismatchingAssetIDs, 0);
}

@end
