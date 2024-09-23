@implementation BKLibraryCollectionManager

- (BKLibraryCollectionManager)initWithLibraryManager:(id)a3
{
  id v4;
  BKLibraryCollectionManager *v5;
  BKLibraryCollectionManager *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *enableCloudMergeQueue;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *getChangesQueue;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  BCCloudCollectionsManager *cloudCollectionsManager;
  id v22;
  id *v23;
  id v24;
  id v25;
  id v26;
  id *v27;
  id v28;
  id v29;
  void **v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *);
  void *v34;
  id *v35;
  _QWORD v36[4];
  id *v37;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BKLibraryCollectionManager;
  v5 = -[BKLibraryCollectionManager init](&v38, "init");
  v6 = v5;
  if (v5)
  {
    v5->_accessLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_libraryManager, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.iBooks.BKLibraryCollectionManager", v8);
    enableCloudMergeQueue = v6->_enableCloudMergeQueue;
    v6->_enableCloudMergeQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("com.apple.iBooks.BKLibraryCollectionManager.getChanges", v12);
    getChangesQueue = v6->_getChangesQueue;
    v6->_getChangesQueue = (OS_dispatch_queue *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v6, "mocDidSave:", NSManagedObjectContextDidSaveNotification, 0);

    if (BDSXPCNotificationsEnabled())
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v16, "addObserver:selector:name:object:", v6, "_BCCloudCollectionDetailManagerChanged:", BCCloudCollectionDetailManagerChanged, 0);

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v17, "addObserver:selector:name:object:", v6, "_BCCloudCollectionMemberManagerChanged:", BCCloudCollectionMemberManagerChanged, 0);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[BDSServiceNotificationCenter sharedInstance](BDSServiceNotificationCenter, "sharedInstance"));
      objc_msgSend(v18, "startMonitoring");
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
      objc_msgSend(v19, "addObserver:selector:name:object:", v6, "_BCCloudCollectionDetailManagerChanged:", BCCloudCollectionDetailManagerChanged, 0);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
      objc_msgSend(v18, "addObserver:selector:name:object:", v6, "_BCCloudCollectionMemberManagerChanged:", BCCloudCollectionMemberManagerChanged, 0);
    }

    v20 = objc_claimAutoreleasedReturnValue(+[BCCloudCollectionsManager sharedManager](BCCloudCollectionsManager, "sharedManager"));
    cloudCollectionsManager = v6->_cloudCollectionsManager;
    v6->_cloudCollectionsManager = (BCCloudCollectionsManager *)v20;

    v22 = objc_alloc((Class)BUCoalescingCallBlock);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_5B998;
    v36[3] = &unk_C2850;
    v23 = v6;
    v37 = v23;
    v24 = objc_msgSend(v22, "initWithNotifyBlock:blockDescription:", v36, CFSTR("BKLibraryCollectionManager resetAll"));
    v25 = v23[17];
    v23[17] = v24;

    objc_msgSend(v23[17], "setCoalescingDelay:", 0.1);
    v26 = objc_alloc((Class)BUCoalescingCallBlock);
    v31 = _NSConcreteStackBlock;
    v32 = 3221225472;
    v33 = sub_5BA54;
    v34 = &unk_C2850;
    v27 = v23;
    v35 = v27;
    v28 = objc_msgSend(v26, "initWithNotifyBlock:blockDescription:", &v31, CFSTR("BKLibraryCollectionManager resetChanged"));
    v29 = v27[18];
    v27[18] = v28;

    objc_msgSend(v27[18], "setCoalescingDelay:", 0.1, v31, v32, v33, v34);
  }

  return v6;
}

- (void)dealloc
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = (id *)NSNotificationCenter_ptr;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, NSManagedObjectContextDidSaveNotification, 0);

  if (!BDSXPCNotificationsEnabled())
    v3 = (id *)NSDistributedNotificationCenter_ptr;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v3, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, BCCloudCollectionDetailManagerChanged, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v3, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, BCCloudCollectionMemberManagerChanged, 0);

  objc_storeWeak((id *)&self->_libraryManager, 0);
  v7.receiver = self;
  v7.super_class = (Class)BKLibraryCollectionManager;
  -[BKLibraryCollectionManager dealloc](&v7, "dealloc");
}

- (void)setEnableCloudMerge:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager enableCloudMergeQueue](self, "enableCloudMergeQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_5BE38;
  v6[3] = &unk_C20B8;
  v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

- (id)p_allOrderedCollections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager defaultCollections](self, "defaultCollections"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager userCollectionsOnMainQueueWithError:](self, "userCollectionsOnMainQueueWithError:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v5));

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v4, "addObjectsFromArray:", v6);

  return v4;
}

- (id)defaultCollections
{
  return -[BKLibraryCollectionManager _defaultCollectionsIncludeAllBooks:](self, "_defaultCollectionsIncludeAllBooks:", 1);
}

- (id)selectableDefaultCollections
{
  return -[BKLibraryCollectionManager _defaultCollectionsIncludeAllBooks:](self, "_defaultCollectionsIncludeAllBooks:", 0);
}

- (id)_defaultCollectionsIncludeAllBooks:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager defaultAllBooksCollection](self, "defaultAllBooksCollection"));
    objc_msgSend(v5, "addObject:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager defaultWantToReadCollection](self, "defaultWantToReadCollection"));
  objc_msgSend(v5, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager defaultFinishedCollection](self, "defaultFinishedCollection"));
  objc_msgSend(v5, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager defaultBooksCollection](self, "defaultBooksCollection"));
  objc_msgSend(v5, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager defaultAudioBooksCollection](self, "defaultAudioBooksCollection"));
  objc_msgSend(v5, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager defaultPDFsCollection](self, "defaultPDFsCollection"));
  objc_msgSend(v5, "addObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager defaultSamplesCollection](self, "defaultSamplesCollection"));
  objc_msgSend(v5, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager defaultDownloadedCollection](self, "defaultDownloadedCollection"));
  objc_msgSend(v5, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));
  return v14;
}

- (id)collectionsWithCollectionIDs:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  return -[BKLibraryCollectionManager mutableCollectionsWithCollectionIDs:includeDeleted:inManagedObjectContext:error:](self, "mutableCollectionsWithCollectionIDs:includeDeleted:inManagedObjectContext:error:", a3, 0, a4, a5);
}

- (id)collectionOnMainQueueWithCollectionID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryCollectionManager.m", 297, "-[BKLibraryCollectionManager collectionOnMainQueueWithCollectionID:error:]", "[NSThread isMainThread]", CFSTR("Requesting collection not from the main queue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uiChildContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager collectionWithCollectionID:inManagedObjectContext:error:](self, "collectionWithCollectionID:inManagedObjectContext:error:", v6, v8, a4));

  return v9;
}

- (id)collectionWithCollectionID:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v8 = a3;
  v9 = a4;
  if (+[BKCollection isSeriesCollectionID:](BKCollection, "isSeriesCollectionID:", v8))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection seriesIDFromSeriesCollectionID:](BKCollection, "seriesIDFromSeriesCollectionID:", v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "libraryAssetOnMainQueueWithAssetID:", v10));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKUnsyncedSeriesCollection seriesCollectionWithSeriesID:name:](BKUnsyncedSeriesCollection, "seriesCollectionWithSeriesID:name:", v10, v13));

  }
  else
  {
    if (-[BKLibraryCollectionManager isAllBooksCollection:](self, "isAllBooksCollection:", v8))
      v15 = objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager defaultAllBooksCollection](self, "defaultAllBooksCollection"));
    else
      v15 = objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager mutableCollectionWithCollectionID:inManagedObjectContext:error:](self, "mutableCollectionWithCollectionID:inManagedObjectContext:error:", v8, v9, a5));
    v14 = (void *)v15;
  }

  return v14;
}

- (id)userCollectionsOnMainQueueWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryCollectionManager.m", 330, "-[BKLibraryCollectionManager userCollectionsOnMainQueueWithError:]", "[NSThread isMainThread]", CFSTR("Requesting collections not from the main queue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uiChildContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager userCollectionsInManagedObjectContext:withError:](self, "userCollectionsInManagedObjectContext:withError:", v6, a3));

  return v7;
}

- (id)userCollectionsInManagedObjectContext:(id)a3 withError:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v12;

  if (!a3)
    return 0;
  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection predicateForNonDeletedUserCollections](BKCollection, "predicateForNonDeletedUserCollections"));
  objc_msgSend(v6, "setPredicate:", v7);

  v8 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("sortKey"), 1);
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  objc_msgSend(v6, "setSortDescriptors:", v9);

  objc_msgSend(v6, "setReturnsObjectsAsFaults:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v6, a4));

  return v10;
}

- (id)defaultCollectionsInManagedObjectContext:(id)a3 withError:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v5 = a3;
    v6 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKCollection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection predicateForAllDefaultCollections](BKCollection, "predicateForAllDefaultCollections"));
    objc_msgSend(v6, "setPredicate:", v7);

    objc_msgSend(v6, "setReturnsObjectsAsFaults:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v6, a4));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)fetchDefaultBooksCollectionInUIMoc:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_5BC08;
  v17 = sub_5BC18;
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_5CC30;
  v9[3] = &unk_C32C0;
  objc_copyWeak(&v12, &location);
  v11 = &v13;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performBlockInUIContext:", v9);

  v7 = (id)v14[5];
  objc_destroyWeak(&v12);
  _Block_object_dispose(&v13, 8);

  objc_destroyWeak(&location);
  return v7;
}

- (id)_setupDefaultBooksCollection:(id)a3 moc:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager mutableCollectionWithCollectionID:inManagedObjectContext:error:](self, "mutableCollectionWithCollectionID:inManagedObjectContext:error:", v6, v7, &v17));
  if (v8
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection insertNewCollectionWithCollectionID:inManagedObjectContext:](BKCollection, "insertNewCollectionWithCollectionID:inManagedObjectContext:", v6, v7))) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));

    if (!v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[BCCollection titleForDefaultCollectionID:](BCCollection, "titleForDefaultCollectionID:", v6));
      objc_msgSend(v8, "setTitle:", v10);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortKey"));
    v12 = objc_msgSend(v11, "integerValue");

    if (!v12 && (id)kBKCollectionDefaultAll != v6)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[BCCollection sortKeyForDefaultCollectionID:](BCCollection, "sortKeyForDefaultCollectionID:", v6));
      objc_msgSend(v8, "setSortKey:", v13);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deletedFlag"));
    v15 = objc_msgSend(v14, "integerValue");

    if (v15)
      objc_msgSend(v8, "setDeletedFlag:", &off_C9F88);
  }

  return v8;
}

- (BKCollection)defaultAllBooksCollection
{
  BKCollection *defaultAllBooksCollection;
  void *v4;
  void *v5;

  defaultAllBooksCollection = self->_defaultAllBooksCollection;
  if (!defaultAllBooksCollection
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](defaultAllBooksCollection, "collectionID")),
        v4,
        !v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager fetchDefaultBooksCollectionInUIMoc:](self, "fetchDefaultBooksCollectionInUIMoc:", kBKCollectionDefaultAll));
    -[BKLibraryCollectionManager setDefaultAllBooksCollection:](self, "setDefaultAllBooksCollection:", v5);

  }
  return self->_defaultAllBooksCollection;
}

- (BKCollection)defaultBooksCollection
{
  BKCollection *defaultBooksCollection;
  void *v4;
  void *v5;

  defaultBooksCollection = self->_defaultBooksCollection;
  if (!defaultBooksCollection
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](defaultBooksCollection, "collectionID")),
        v4,
        !v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager fetchDefaultBooksCollectionInUIMoc:](self, "fetchDefaultBooksCollectionInUIMoc:", kBKCollectionDefaultIDBooks));
    -[BKLibraryCollectionManager setDefaultBooksCollection:](self, "setDefaultBooksCollection:", v5);

  }
  return self->_defaultBooksCollection;
}

- (BKCollection)defaultAudioBooksCollection
{
  BKCollection *defaultAudioBooksCollection;
  void *v4;
  void *v5;

  defaultAudioBooksCollection = self->_defaultAudioBooksCollection;
  if (!defaultAudioBooksCollection
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](defaultAudioBooksCollection, "collectionID")),
        v4,
        !v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager fetchDefaultBooksCollectionInUIMoc:](self, "fetchDefaultBooksCollectionInUIMoc:", kBKCollectionDefaultIDAudiobooks));
    -[BKLibraryCollectionManager setDefaultAudioBooksCollection:](self, "setDefaultAudioBooksCollection:", v5);

  }
  return self->_defaultAudioBooksCollection;
}

- (BKCollection)defaultPDFsCollection
{
  BKCollection *defaultPDFsCollection;
  void *v4;
  BKCollection *v5;
  BKCollection *v6;

  defaultPDFsCollection = self->_defaultPDFsCollection;
  if (!defaultPDFsCollection
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](defaultPDFsCollection, "collectionID")),
        v4,
        !v4))
  {
    v5 = (BKCollection *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager fetchDefaultBooksCollectionInUIMoc:](self, "fetchDefaultBooksCollectionInUIMoc:", kBKCollectionDefaultIDPDFs));
    v6 = self->_defaultPDFsCollection;
    self->_defaultPDFsCollection = v5;

  }
  return self->_defaultPDFsCollection;
}

- (BKCollection)defaultDownloadedCollection
{
  BKCollection *defaultDownloadedCollection;
  void *v4;
  void *v5;

  defaultDownloadedCollection = self->_defaultDownloadedCollection;
  if (!defaultDownloadedCollection
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](defaultDownloadedCollection, "collectionID")),
        v4,
        !v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager fetchDefaultBooksCollectionInUIMoc:](self, "fetchDefaultBooksCollectionInUIMoc:", kBKCollectionDefaultIDDownloaded));
    -[BKLibraryCollectionManager setDefaultDownloadedCollection:](self, "setDefaultDownloadedCollection:", v5);

  }
  return self->_defaultDownloadedCollection;
}

- (BKCollection)defaultFinishedCollection
{
  BKCollection *defaultFinishedCollection;
  void *v4;
  void *v5;

  defaultFinishedCollection = self->_defaultFinishedCollection;
  if (!defaultFinishedCollection
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](defaultFinishedCollection, "collectionID")),
        v4,
        !v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager fetchDefaultBooksCollectionInUIMoc:](self, "fetchDefaultBooksCollectionInUIMoc:", kBKCollectionDefaultIDFinished));
    -[BKLibraryCollectionManager setDefaultFinishedCollection:](self, "setDefaultFinishedCollection:", v5);

  }
  return self->_defaultFinishedCollection;
}

- (BKCollection)defaultWantToReadCollection
{
  BKCollection *defaultWantToReadCollection;
  void *v4;
  void *v5;

  defaultWantToReadCollection = self->_defaultWantToReadCollection;
  if (!defaultWantToReadCollection
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](defaultWantToReadCollection, "collectionID")),
        v4,
        !v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager fetchDefaultBooksCollectionInUIMoc:](self, "fetchDefaultBooksCollectionInUIMoc:", kBKCollectionDefaultIDWantToRead));
    -[BKLibraryCollectionManager setDefaultWantToReadCollection:](self, "setDefaultWantToReadCollection:", v5);

  }
  return self->_defaultWantToReadCollection;
}

- (BKCollection)defaultSamplesCollection
{
  BKCollection *defaultSamplesCollection;
  void *v4;
  void *v5;

  defaultSamplesCollection = self->_defaultSamplesCollection;
  if (!defaultSamplesCollection
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](defaultSamplesCollection, "collectionID")),
        v4,
        !v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager fetchDefaultBooksCollectionInUIMoc:](self, "fetchDefaultBooksCollectionInUIMoc:", kBKCollectionDefaultIDSamples));
    -[BKLibraryCollectionManager setDefaultSamplesCollection:](self, "setDefaultSamplesCollection:", v5);

  }
  return self->_defaultSamplesCollection;
}

- (BOOL)isAllBooksCollection:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", kBKCollectionDefaultAll);
}

- (void)setupDefaultCollectionsInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *j;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unsigned int v28;
  void *v29;
  unsigned int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  void *v36;
  void *context;
  void *v38;
  id obj;
  uint64_t v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  _BYTE v51[128];
  _BYTE v52[128];

  v4 = a3;
  context = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection availableDefaultCollectionIDsForOS](BKCollection, "availableDefaultCollectionIDsForOS"));
  v50 = 0;
  v38 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager mutableCollectionsWithCollectionIDs:includeDeleted:inManagedObjectContext:error:](self, "mutableCollectionsWithCollectionIDs:includeDeleted:inManagedObjectContext:error:", v5, 1, v4, &v50));
  v7 = v50;
  if (v7)
  {
    v8 = BKLibraryCollectionLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_8385C();

  }
  v36 = v7;
  v10 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v6, "count"));
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "collectionID"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v13);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v5;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v41)
  {
    v40 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v41; j = (char *)j + 1)
      {
        if (*(_QWORD *)v43 != v40)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v19));
        if (!v20)
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection insertNewCollectionWithCollectionID:inManagedObjectContext:](BKCollection, "insertNewCollectionWithCollectionID:inManagedObjectContext:", v19, v38));
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "deletedFlag"));
        if (!v21
          || (v22 = (void *)v21,
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "deletedFlag")),
              v24 = objc_msgSend(v23, "BOOLValue"),
              v23,
              v22,
              v24))
        {
          objc_msgSend(v20, "setDeletedFlag:", &__kCFBooleanFalse);
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[BCCollection sortKeyForDefaultCollectionID:](BCCollection, "sortKeyForDefaultCollectionID:", v19));
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sortKey"));
        if (!v26
          || (v27 = (void *)v26,
              v28 = objc_msgSend(v25, "intValue"),
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sortKey")),
              v30 = objc_msgSend(v29, "intValue"),
              v29,
              v27,
              v28 != v30))
        {
          objc_msgSend(v20, "setSortKey:", v25);
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[BCCollection titleForDefaultCollectionID:](BCCollection, "titleForDefaultCollectionID:", v19));
        v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
        if (!v32
          || (v33 = (void *)v32,
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title")),
              v35 = objc_msgSend(v31, "isEqualToString:", v34),
              v34,
              v33,
              (v35 & 1) == 0))
        {
          objc_msgSend(v20, "setTitle:", v31);
        }

      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v41);
  }

  objc_autoreleasePoolPop(context);
}

- (void)mergeCurrentCollectionDetailsToCloudInMoc:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKCollection"));
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  v8 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeFetchRequest:error:", v5, &v8));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
  -[BKLibraryCollectionManager p_syncCollections:deletedCollections:inContext:](self, "p_syncCollections:deletedCollections:inContext:", v7, 0, v4);

}

- (void)mergeCurrentCollectionMembersToCloudInMoc:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKCollectionMember"));
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  v8 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeFetchRequest:error:", v5, &v8));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
  -[BKLibraryCollectionManager p_syncCollectionMembers:deletedCollectionMembers:inContext:](self, "p_syncCollectionMembers:deletedCollectionMembers:inContext:", v7, 0, v4);

}

- (id)insertNewCollectionSyncOnMainQueueWithCollectionID:(id)a3 newCollectionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
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
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_5BC08;
  v21 = sub_5BC18;
  v22 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_5D8AC;
  v13[3] = &unk_C3310;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v16 = &v17;
  objc_msgSend(v8, "performBlockInUIContext:", v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)mutableCollectionWithCollectionID:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  void *v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v5 = 0;
  if (a3 && a4)
  {
    v8 = a4;
    v9 = a3;
    v10 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKCollection"));
    objc_msgSend(v10, "setFetchLimit:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("collectionID"), v9));

    objc_msgSend(v10, "setPredicate:", v11);
    objc_msgSend(v10, "setReturnsObjectsAsFaults:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "executeFetchRequest:error:", v10, a5));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
  }
  return v5;
}

- (id)mutableCollectionsWithCollectionIDs:(id)a3 includeDeleted:(BOOL)a4 inManagedObjectContext:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v8 = a4;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    if (v8)
      v13 = objc_claimAutoreleasedReturnValue(+[BKCollection predicateForCollectionWithCollectionIDInList:](BKCollection, "predicateForCollectionWithCollectionIDInList:", v9));
    else
      v13 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("collectionID"), v9));
    v14 = (void *)v13;
    v15 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKCollection"));
    objc_msgSend(v15, "setPredicate:", v14);
    objc_msgSend(v15, "setReturnsObjectsAsFaults:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "executeFetchRequest:error:", v15, a6));

  }
  return v12;
}

- (BOOL)deleteCollectionWithCollectionID:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  BOOL v10;
  void *v11;

  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (a3 && v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager mutableCollectionWithCollectionID:inManagedObjectContext:error:](self, "mutableCollectionWithCollectionID:inManagedObjectContext:error:", a3, v8, a5));
    v10 = v11 != 0;
    if (v11)
      objc_msgSend(v9, "deleteObject:", v11);

  }
  return v10;
}

- (BOOL)deleteCollectionOnMainQueue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryCollectionManager.m", 656, "-[BKLibraryCollectionManager deleteCollectionOnMainQueue:]", "[NSThread isMainThread]", CFSTR("Deleting collection not from the main queue"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_5DD7C;
  v9[3] = &unk_C1F20;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performBlockInUIContext:", v9);

  v7 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)promoteSampleFromWantToReadForAssetID:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = kBKCollectionDefaultIDWantToRead;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5DE84;
  v7[3] = &unk_C3338;
  v8 = v4;
  v6 = v4;
  -[BKLibraryCollectionManager removeAssetID:fromCollectionID:completion:](self, "removeAssetID:fromCollectionID:completion:", v6, v5, v7);

}

- (void)markAssetsAsFinished:(id)a3 completion:(id)a4
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
  v11[2] = sub_5E034;
  v11[3] = &unk_C1A08;
  v12 = v6;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
  v14 = v7;
  v8 = v7;
  v9 = v13;
  v10 = v6;
  objc_msgSend(v9, "performBlockOnCollectionsWorkerQueue:", v11);

}

- (void)addBooks:(id)a3 toCollection:(id)a4 forceToTop:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v10 = a6;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "collectionID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("assetID")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("temporaryAssetID")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allObjects"));

  if (!objc_msgSend(v16, "count"))
  {

    v16 = 0;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_5E388;
  v21[3] = &unk_C3388;
  v21[4] = self;
  v22 = v12;
  v24 = v16;
  v25 = v10;
  v23 = v14;
  v26 = a5;
  v17 = v16;
  v18 = v10;
  v19 = v14;
  v20 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v21);

}

- (void)removeAssetID:(id)a3 fromCollectionID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  BKCollectionControllerMemberManagingRemoveRequest *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[BKCollectionControllerMemberManagingRemoveRequest initWithStoreID:collectionID:]([BKCollectionControllerMemberManagingRemoveRequest alloc], "initWithStoreID:collectionID:", v10, v9);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_5EA54;
  v13[3] = &unk_C33B0;
  v14 = v8;
  v12 = v8;
  -[BKLibraryCollectionManager performRemoveRequest:completion:](self, "performRemoveRequest:completion:", v11, v13);

}

- (void)performRemoveRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  void *v14;
  _QWORD v15[7];
  id v16;
  id v17;
  NSErrorUserInfoKey v18;
  const __CFString *v19;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionID"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
  v11 = v10;
  if (v10)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_5EC6C;
    v15[3] = &unk_C33D8;
    v15[4] = v9;
    v15[5] = v8;
    v15[6] = self;
    v16 = v10;
    v17 = v6;
    objc_msgSend(v16, "performBlockOnCollectionsWorkerQueue:", v15);

  }
  else
  {
    v12 = (void (**)(id, _QWORD, void *))objc_retainBlock(v6);
    if (v12)
    {
      v18 = NSLocalizedDescriptionKey;
      v19 = CFSTR("No library found.");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKLibraryCollectionManager"), 0, v13));
      v12[2](v12, 0, v14);

    }
  }

}

- (void)markAsFinishedStoreID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)BCMutableStoreItem), "initWithStoreID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeAssetManager"));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_5F170;
  v18[3] = &unk_C3400;
  v11 = v6;
  v19 = v11;
  v20 = v7;
  v12 = v7;
  objc_msgSend(v10, "addStoreItem:completion:", v8, v18);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_5F214;
  v15[3] = &unk_C12F8;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
  v17 = v11;
  v13 = v11;
  v14 = v16;
  objc_msgSend(v14, "waitForAssetID:completion:", v13, v15);

}

- (void)addStoreID:(id)a3 toCollectionID:(id)a4 forceToTop:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  BKCollectionControllerMemberManagingAddRequest *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[BKCollectionControllerMemberManagingAddRequest initWithStoreID:collectionID:forceToTop:]([BKCollectionControllerMemberManagingAddRequest alloc], "initWithStoreID:collectionID:forceToTop:", v12, v11, v6);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_5F3B8;
  v15[3] = &unk_C33B0;
  v16 = v10;
  v14 = v10;
  -[BKLibraryCollectionManager performAddRequest:completion:](self, "performAddRequest:completion:", v13, v15);

}

- (void)performAddRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  unsigned int v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[7];
  id v23;
  unsigned __int8 v24;
  char v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionID"));
  v10 = objc_msgSend(v7, "forceToTop");

  v11 = objc_msgSend(v9, "isEqualToString:", kBKCollectionDefaultIDWantToRead);
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("BKLibraryAssetAddToWTRCollectionNotification"), self, 0);

  }
  if (objc_msgSend(v9, "isEqualToString:", kBKCollectionDefaultIDFinished))
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_5F6B4;
    v26[3] = &unk_C3428;
    v27 = v6;
    -[BKLibraryCollectionManager markAsFinishedStoreID:completion:](self, "markAsFinishedStoreID:completion:", v8, v26);
    v14 = v27;
LABEL_9:

    goto LABEL_10;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));

  if (v15)
  {
    v16 = BKLibraryCollectionLog();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v8;
      v30 = 2112;
      v31 = v9;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Adding storeIDs: %@ to collection %@", buf, 0x16u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_5F764;
    v22[3] = &unk_C34A0;
    v22[4] = self;
    v22[5] = v9;
    v22[6] = v8;
    v24 = v10;
    v25 = v12;
    v23 = v6;
    objc_msgSend(v18, "performBlockOnCollectionsWorkerQueue:", v22);

    v14 = v23;
    goto LABEL_9;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKLibraryErrorDomain"), 2, 0));
  v20 = objc_retainBlock(v6);
  v21 = v20;
  if (v20)
    (*((void (**)(id, _QWORD, void *))v20 + 2))(v20, 0, v19);

LABEL_10:
}

- (BOOL)allowsAutoDownloadOfSamplesToWantToRead
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = objc_opt_class(NSNumber);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BCRCDataContainer defaultContainer](BCRCDataContainer, "defaultContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKeyPath:", BRCBooksDefaultsKeyReadingNowWtrSimpleModeEnabled));
  v6 = BUDynamicCast(v2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  LOBYTE(v3) = objc_msgSend(v7, "BOOLValue") ^ 1;
  return (char)v3;
}

- (void)p_downloadSampleBook:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AEUserPublishing sharedInstance](AEUserPublishing, "sharedInstance"));
  v10 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_5FE24;
  v8[3] = &unk_C34F0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "lockupProfilesForStoreIDs:completion:", v6, v8);

}

- (void)removeBook:(id)a3 fromCollections:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
  v12 = (void *)v11;
  if (v8 && v11 && objc_msgSend(v9, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
    v14 = objc_opt_class(NSSet);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("collectionID")));
    v16 = BUDynamicCast(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_603EC;
    v22[3] = &unk_C3540;
    v22[4] = self;
    v23 = v8;
    v24 = v17;
    v25 = v13;
    v26 = v12;
    v27 = v10;
    v18 = v13;
    v19 = v17;
    objc_msgSend(v26, "performBlockOnCollectionsWorkerQueue:", v22);

  }
  else
  {
    v20 = objc_retainBlock(v10);
    v21 = v20;
    if (v20)
      (*((void (**)(id, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);

  }
}

- (void)removeBooks:(id)a3 fromCollection:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
  if (v11 && objc_msgSend(v9, "deleteRemovesFromCollection"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("assetID")));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_6082C;
    v18[3] = &unk_C3540;
    v18[4] = self;
    v19 = v8;
    v20 = v12;
    v21 = v13;
    v22 = v11;
    v23 = v10;
    v14 = v13;
    v15 = v12;
    objc_msgSend(v22, "performBlockOnCollectionsWorkerQueue:", v18);

  }
  else
  {
    v16 = objc_retainBlock(v10);
    v17 = v16;
    if (v16)
      (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);

  }
}

- (void)cleanupDefaultCollections
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
  objc_msgSend(v2, "performBlockOnCollectionsWorkerQueueAndWait:", &stru_C3580);

}

- (BOOL)p_shouldDeleteAsset:(id)a3 removingFromCollectionIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _BYTE *v8;
  _BYTE *v9;
  int64_t v10;
  void *v11;
  void *v12;
  BOOL v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionMembers"));
  v8 = objc_msgSend(v7, "count");
  v9 = objc_msgSend(v6, "count");

  if (objc_msgSend(v5, "isSample")
    && objc_msgSend(v5, "isLocal")
    && ((v10 = v8 - v9, ((v8 - v9) & 0xFFFFFFFFFFFFFFFELL) == 2)
     || objc_msgSend(v6, "containsObject:", kBKCollectionDefaultIDSamples)))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionMembers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKeyPath:", CFSTR("collectionID")));

    v13 = objc_msgSend(v6, "isSubsetOfSet:", v12)
       && objc_msgSend(v12, "containsObject:", kBKCollectionDefaultAll)
       && ((objc_msgSend(v12, "containsObject:", kBKCollectionDefaultIDBooks) & 1) != 0
        || objc_msgSend(v12, "containsObject:", kBKCollectionDefaultIDAudiobooks))
       && (v10 == 2 || objc_msgSend(v12, "containsObject:", kBKCollectionDefaultIDDownloaded));

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)p_assetsRequiringDeletion:(id)a3 removingFromCollectionIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (-[BKLibraryCollectionManager p_shouldDeleteAsset:removingFromCollectionIDs:](self, "p_shouldDeleteAsset:removingFromCollectionIDs:", v14, v7, (_QWORD)v16))
        {
          objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)fetchWTRMembersInContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKCollectionMember"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForCollectionMembersInCollectionID:hideUnownedItems:](BKLibraryManager, "predicateForCollectionMembersInCollectionID:hideUnownedItems:", kBKCollectionDefaultIDWantToRead, 0));
  v14[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingCollectionMembersWithSideloadedAssets](BKLibraryManager, "predicateForExcludingCollectionMembersWithSideloadedAssets"));
  v14[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v7));
  objc_msgSend(v4, "setPredicate:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, 0));
  if (v9)
    v10 = v9;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));
  return v12;
}

- (void)p_syncCollections:(id)a3 deletedCollections:(id)a4 inContext:(id)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  unsigned int v23;
  id v24;
  void *v25;
  void *v26;
  unsigned int v27;
  id v28;
  NSObject *v29;
  void *v30;
  unsigned int v31;
  id v32;
  NSObject *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *j;
  void *v38;
  _QWORD *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  unsigned int v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  unsigned int v52;
  id v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  dispatch_queue_global_t global_queue;
  NSObject *v59;
  id v60;
  id v61;
  void *v63;
  id obj;
  _QWORD block[6];
  _QWORD v66[4];
  id v67;
  NSObject *v68;
  _QWORD v69[4];
  id v70;
  NSObject *v71;
  uint8_t v72[16];
  _QWORD v73[6];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 buf;
  uint64_t v83;
  uint64_t v84;
  _BYTE v85[128];
  _BYTE v86[128];

  v7 = a3;
  v60 = a4;
  v61 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v79 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deletedFlag", v60));
        v14 = objc_msgSend(v13, "BOOLValue");

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
          v16 = objc_msgSend(v15, "verboseLoggingEnabled");

          if (v16)
          {
            v17 = BKLibraryCollectionDevelopmentLog();
            v18 = objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v12;
              _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "\"\\\"collection marked deleted: %@\\\"\", (uint8_t *)&buf, 0xCu);
            }

          }
          v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionID"));
          if (v19)
          {
            objc_msgSend(v8, "addObject:", v19);
          }
          else
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
            v27 = objc_msgSend(v26, "verboseLoggingEnabled");

            if (v27)
            {
              v28 = BKLibraryAssetDetailsDevelopmentLog();
              v29 = objc_claimAutoreleasedReturnValue(v28);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v12;
                _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "\"\\\"collection marked as deleted but has no collectionID: %@\\\"\", (uint8_t *)&buf, 0xCu);
              }

            }
          }
        }
        else
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeholder"));
          v21 = objc_msgSend(v20, "BOOLValue");

          if ((v21 & 1) != 0)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
            v23 = objc_msgSend(v22, "verboseLoggingEnabled");

            if (!v23)
              continue;
            v24 = BKLibraryCollectionDevelopmentLog();
            v19 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v12;
              _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "\"\\\"collection marked placeholder: %@\\\"\", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionDetailRepresentation"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject collectionID](v19, "collectionID"));
            if (v25)
            {
              objc_msgSend(v63, "setObject:forKey:", v19, v25);
            }
            else
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
              v31 = objc_msgSend(v30, "verboseLoggingEnabled");

              if (v31)
              {
                v32 = BKLibraryAssetDetailsDevelopmentLog();
                v33 = objc_claimAutoreleasedReturnValue(v32);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(buf) = 138412290;
                  *(_QWORD *)((char *)&buf + 4) = v12;
                  _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "\"\\\"Collection detail representation has no collectionID: %@\\\"\", (uint8_t *)&buf, 0xCu);
                }

              }
            }

          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
    }
    while (v9);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v34 = v60;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v75;
    do
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(_QWORD *)v75 != v36)
          objc_enumerationMutation(v34);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)j), "collectionID", v60));
        if (v38)
          objc_msgSend(v8, "addObject:", v38);

      }
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
    }
    while (v35);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v83 = 0x2020000000;
  v84 = 0;
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_61724;
  v73[3] = &unk_C35A8;
  v73[4] = self;
  v73[5] = &buf;
  v39 = objc_retainBlock(v73);
  v40 = v39;
  if (v61)
  {
    ((void (*)(_QWORD *))v39[2])(v39);
  }
  else
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
    objc_msgSend(v41, "performBlockOnCollectionsWorkerQueue:", v40);

  }
  v42 = dispatch_group_create();
  if (objc_msgSend(v63, "count"))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
    v44 = objc_msgSend(v43, "verboseLoggingEnabled");

    if (v44)
    {
      v45 = BKLibraryCollectionDevelopmentLog();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v72 = 0;
        _os_log_impl(&dword_0, v46, OS_LOG_TYPE_DEFAULT, "\"\\\"Collections Inserted or Updated\\\"\", v72, 2u);
      }

    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "allKeys", v60));
    dispatch_group_enter(v42);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager cloudCollectionsManager](self, "cloudCollectionsManager"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "collectionDetailManager"));
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_617B8;
    v69[3] = &unk_C35D0;
    v50 = v47;
    v70 = v50;
    v71 = v42;
    objc_msgSend(v49, "setCollectionDetails:completion:", v63, v69);

  }
  if (objc_msgSend(v8, "count", v60))
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
    v52 = objc_msgSend(v51, "verboseLoggingEnabled");

    if (v52)
    {
      v53 = BKLibraryCollectionDevelopmentLog();
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v72 = 0;
        _os_log_impl(&dword_0, v54, OS_LOG_TYPE_DEFAULT, "\"\\\"Collections Deleted\\\"\", v72, 2u);
      }

    }
    dispatch_group_enter(v42);
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager cloudCollectionsManager](self, "cloudCollectionsManager"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "collectionDetailManager"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_61924;
    v66[3] = &unk_C2958;
    v67 = v8;
    v68 = v42;
    objc_msgSend(v56, "deleteCollectionDetailForCollectionIDs:completion:", v57, v66);

  }
  global_queue = dispatch_get_global_queue(0, 0);
  v59 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_61A34;
  block[3] = &unk_C2310;
  block[4] = self;
  block[5] = &buf;
  dispatch_group_notify(v42, v59, block);

  _Block_object_dispose(&buf, 8);
}

- (void)p_syncCollectionMembers:(id)a3 deletedCollectionMembers:(id)a4 inContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  unsigned int v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  unsigned int v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  dispatch_queue_global_t global_queue;
  NSObject *v50;
  id v51;
  void *v53;
  void *v54;
  id obj;
  _QWORD block[6];
  _QWORD v57[4];
  id v58;
  NSObject *v59;
  _QWORD v60[4];
  NSObject *v61;
  id v62;
  uint8_t buf[16];
  _QWORD v64[6];
  _QWORD v65[4];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v8;
  v51 = v9;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v71 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collection"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "collectionID"));
        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "assetID"));
          if (v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collection"));
            v19 = objc_msgSend(v18, "shouldSyncCollectionMembers");

            if (!v19)
              continue;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collectionMemberRepresentation"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "collectionMemberID"));
            objc_msgSend(v54, "setObject:forKey:", v15, v16);
          }

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    }
    while (v11);
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v20 = v10;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (!v21)
    goto LABEL_26;
  v22 = *(_QWORD *)v67;
  do
  {
    for (j = 0; j != v21; j = (char *)j + 1)
    {
      if (*(_QWORD *)v67 != v22)
        objc_enumerationMutation(v20);
      v24 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)j);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "collectionID"));
      if (v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "assetID"));
        if (v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "collectionID"));
          v28 = +[BKCollection shouldSyncCollectionID:](BKCollection, "shouldSyncCollectionID:", v27);

          if (!v28)
            continue;
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "collectionID"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "assetID"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[BCCollectionMember collectionMemberIDWithCollectionID:assetID:](BCCollectionMember, "collectionMemberIDWithCollectionID:assetID:", v29, v30));

          objc_msgSend(v53, "addObject:", v25);
        }

      }
    }
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  }
  while (v21);
LABEL_26:

  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  v65[3] = 0;
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_62198;
  v64[3] = &unk_C35A8;
  v64[4] = self;
  v64[5] = v65;
  v31 = objc_retainBlock(v64);
  v32 = v31;
  if (v51)
  {
    ((void (*)(_QWORD *))v31[2])(v31);
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
    objc_msgSend(v33, "performBlockOnCollectionsWorkerQueue:", v32);

  }
  v34 = dispatch_group_create();
  if (objc_msgSend(v54, "count"))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
    v36 = objc_msgSend(v35, "verboseLoggingEnabled");

    if (v36)
    {
      v37 = BKLibraryCollectionDevelopmentLog();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "\"\\\"Collection Members Inserted or Updated\\\"\", buf, 2u);
      }

    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "allKeys"));
    dispatch_group_enter(v34);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager cloudCollectionsManager](self, "cloudCollectionsManager"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "collectionMemberManager"));
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_6222C;
    v60[3] = &unk_C35D0;
    v61 = v34;
    v42 = v39;
    v62 = v42;
    objc_msgSend(v41, "setCollectionMembers:completion:", v54, v60);

  }
  if (objc_msgSend(v53, "count"))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
    v44 = objc_msgSend(v43, "verboseLoggingEnabled");

    if (v44)
    {
      v45 = BKLibraryCollectionDevelopmentLog();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v46, OS_LOG_TYPE_DEFAULT, "\"\\\"Collection Members Deleted\\\"\", buf, 2u);
      }

    }
    dispatch_group_enter(v34);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager cloudCollectionsManager](self, "cloudCollectionsManager"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "collectionMemberManager"));
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_62398;
    v57[3] = &unk_C2958;
    v58 = v53;
    v59 = v34;
    objc_msgSend(v48, "deleteCollectionMemberForCollectionMemberIDs:completion:", v58, v57);

  }
  global_queue = dispatch_get_global_queue(0, 0);
  v50 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_62484;
  block[3] = &unk_C2310;
  block[4] = self;
  block[5] = v65;
  dispatch_group_notify(v34, v50, block);

  _Block_object_dispose(v65, 8);
}

- (void)mocDidSave:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  NSPredicate *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  NSPredicate *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  id v33;
  NSPredicate *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD block[6];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;

  v4 = a3;
  v5 = BKLibraryCollectionLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_83B84(v4);

  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v7 = objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager enableCloudMergeQueue](self, "enableCloudMergeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_62C14;
  block[3] = &unk_C31D0;
  block[4] = self;
  block[5] = &v49;
  dispatch_sync(v7, block);

  v8 = objc_opt_class(BKLibraryManagedObjectContext);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v10 = BUDynamicCast(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = objc_msgSend(v11, "sessionContextType") == 5
     && objc_msgSend(v11, "saveContext") == 1;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", NSUpdatedObjectsKey));

  if (v11)
  {
    v15 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self isKindOfClass:%@ AND self.collectionID == %@"), objc_opt_class(BKCollection), kBKCollectionDefaultIDWantToRead);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filteredSetUsingPredicate:", v16));
    if (objc_msgSend(v17, "count"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
      objc_msgSend(v18, "collectionManagerDidModifyWantToReadCollection:", self);

    }
    if (!v12
      && objc_msgSend(v11, "sessionContextType") != 2
      && objc_msgSend(v11, "sessionContextType") != 3
      && objc_msgSend(v11, "sessionContextType") != 1)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistentStoreCoordinator"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "persistentStoreCoordinator"));
      v22 = objc_msgSend(v19, "hasStoreInCommonWith:", v21);

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", NSInsertedObjectsKey));

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", NSDeletedObjectsKey));

        if (*((_BYTE *)v50 + 24)
          && (objc_msgSend(v47, "count") || objc_msgSend(v14, "count") || objc_msgSend(v46, "count")))
        {
          v25 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self isKindOfClass: %@"), objc_opt_class(BKCollection));
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "filteredSetUsingPredicate:", v26));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filteredSetUsingPredicate:", v26));
          if (objc_msgSend(v44, "count"))
            objc_msgSend(v27, "unionSet:", v44);
          if (objc_msgSend(v43, "count"))
            objc_msgSend(v27, "unionSet:", v43);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "filteredSetUsingPredicate:", v26));
          v29 = objc_msgSend(v28, "mutableCopy");

          if (objc_msgSend(v27, "count") || objc_msgSend(v29, "count"))
          {
            v30 = BKLibraryCollectionLog();
            v31 = objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              v32 = objc_msgSend(v27, "count");
              v33 = objc_msgSend(v29, "count");
              *(_DWORD *)buf = 134218498;
              v54 = v32;
              v55 = 2048;
              v56 = v33;
              v57 = 2114;
              v58 = v11;
              _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "Saving collections: %lu inserts/updates, %lu deletes (due to moc save: %{public}@)", buf, 0x20u);
            }

            -[BKLibraryCollectionManager p_syncCollections:deletedCollections:inContext:](self, "p_syncCollections:deletedCollections:inContext:", v27, v29, 0);
          }

          v34 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self isKindOfClass: %@"), objc_opt_class(BKCollectionMember));
          v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "filteredSetUsingPredicate:", v35));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filteredSetUsingPredicate:", v35));
          if (objc_msgSend(v45, "count"))
            objc_msgSend(v36, "unionSet:", v45);
          if (objc_msgSend(v37, "count"))
            objc_msgSend(v36, "unionSet:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "filteredSetUsingPredicate:", v35));
          if (objc_msgSend(v36, "count") || objc_msgSend(v38, "count"))
          {
            v39 = BKLibraryCollectionLog();
            v40 = objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              v41 = objc_msgSend(v36, "count");
              v42 = objc_msgSend(v38, "count");
              *(_DWORD *)buf = 134218498;
              v54 = v41;
              v55 = 2048;
              v56 = v42;
              v57 = 2114;
              v58 = v11;
              _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "Saving collection members: %lu inserts/updates, %lu deletes (due to moc save: %{public}@)", buf, 0x20u);
            }

            -[BKLibraryCollectionManager p_syncCollectionMembers:deletedCollectionMembers:inContext:](self, "p_syncCollectionMembers:deletedCollectionMembers:inContext:", v36, v38, 0);
          }

        }
      }
    }
  }

  _Block_object_dispose(&v49, 8);
}

- (void)_BCCloudCollectionDetailManagerChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager getChangesQueue](self, "getChangesQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_62CB0;
  block[3] = &unk_C1400;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_checkForChangesFromCloudCollectionDetailManagerInMOC:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cloudSyncVersionsForDataType:inContext:", CFSTR("BCCollectionDetail"), v7));

  v10 = objc_msgSend(v9, "mutableCopy");
  v11 = BKLibraryCollectionLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = v10;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "_checkForChangesFromCloudCollectionDetailManagerInMOC cloudSyncVersions:%{public}@, reason:%{public}@", buf, 0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager cloudCollectionsManager](self, "cloudCollectionsManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collectionDetailManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_62FB0;
  v15[3] = &unk_C35F8;
  v15[4] = self;
  objc_msgSend(v14, "getCollectionDetailChangesSince:completion:", v10, v15);

}

- (void)_BCCloudCollectionMemberManagerChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager getChangesQueue](self, "getChangesQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_63A5C;
  block[3] = &unk_C1400;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_checkForChangesFromCloudCollectionMemberManagerInMOC:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cloudSyncVersionsForDataType:inContext:", CFSTR("BCCollectionMember"), v7));

  v10 = objc_msgSend(v9, "mutableCopy");
  v11 = BKLibraryCollectionLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = v10;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "_checkForChangesFromCloudCollectionMemberManagerInMOC cloudSyncVersions:%{public}@, reason:%{public}@", buf, 0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager cloudCollectionsManager](self, "cloudCollectionsManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collectionMemberManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_63D5C;
  v15[3] = &unk_C35F8;
  v15[4] = self;
  objc_msgSend(v14, "getCollectionMemberChangesSince:completion:", v10, v15);

}

- (id)p_fetchOrCreatePlaceholderCollectionForCollectionID:(id)a3 moc:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager mutableCollectionWithCollectionID:inManagedObjectContext:error:](self, "mutableCollectionWithCollectionID:inManagedObjectContext:error:", v6, v7, &v15));
  v9 = v15;
  v10 = v9;
  if (!v8 || v9)
  {
    v11 = BKLibraryCollectionLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v6;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Creating a new placeholder collection for member insertion collectionID:%{public}@", buf, 0xCu);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection insertNewCollectionWithCollectionID:inManagedObjectContext:](BKCollection, "insertNewCollectionWithCollectionID:inManagedObjectContext:", v6, v7));
    objc_msgSend(v13, "setTitle:", CFSTR("Sync Placeholder"));
    objc_msgSend(v13, "setLocalModDate:", 0);
    objc_msgSend(v13, "setPlaceholder:", &__kCFBooleanTrue);
    v8 = v13;
  }

  return v8;
}

- (void)p_updateAssetInMembers:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *k;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  void *m;
  void *v50;
  void *v51;
  NSObject *v52;
  id v53;
  id v54;
  uint64_t v55;
  void *n;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unsigned int v62;
  id v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  unsigned int v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  uint8_t v102[128];
  uint8_t buf[4];
  id v104;
  __int16 v105;
  void *v106;
  _BYTE v107[128];

  v5 = a3;
  v76 = a4;
  v6 = BKLibraryCollectionLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_83CC0(v5);

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection availableDefaultCollectionIDsForOS](BKCollection, "availableDefaultCollectionIDsForOS"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v96 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("collectionID == %@"), v13));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v14));
        v16 = objc_msgSend(v15, "count");

        if (v16)
        {
          v17 = BKLibraryCollectionLog();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218242;
            v104 = v16;
            v105 = 2112;
            v106 = v13;
            _os_log_debug_impl(&dword_0, v18, OS_LOG_TYPE_DEBUG, "├─ %lu %@ BKCollectionMembers don't have asset link", buf, 0x16u);
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
    }
    while (v10);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v21 = v5;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v92;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(_QWORD *)v92 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)j);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "assetID"));
        if (v27)
          objc_msgSend(v19, "addObject:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "temporaryAssetID"));
        if (v28)
          objc_msgSend(v20, "addObject:", v28);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
    }
    while (v23);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v70 = v19;
  v71 = v20;
  v72 = v21;
  if (objc_msgSend(v19, "count"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("assetID IN %@"), v70));
    objc_msgSend(v30, "setPredicate:", v31);
    v90 = 0;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "executeFetchRequest:error:", v30, &v90));
    v33 = v90;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v34 = v32;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v87;
      do
      {
        for (k = 0; k != v36; k = (char *)k + 1)
        {
          if (*(_QWORD *)v87 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)k);
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "assetID"));
          objc_msgSend(v29, "setObject:forKey:", v39, v40);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
      }
      while (v36);
    }

    v20 = v71;
    v21 = v72;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (objc_msgSend(v20, "count"))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("temporaryAssetID IN %@"), v20));
    objc_msgSend(v42, "setPredicate:", v43);
    v85 = 0;
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "executeFetchRequest:error:", v42, &v85));
    v73 = v85;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v45 = v44;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v81, v100, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v82;
      do
      {
        for (m = 0; m != v47; m = (char *)m + 1)
        {
          if (*(_QWORD *)v82 != v48)
            objc_enumerationMutation(v45);
          v50 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)m);
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "temporaryAssetID"));
          objc_msgSend(v41, "setObject:forKey:", v50, v51);

        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v81, v100, 16);
      }
      while (v47);
    }

    v20 = v71;
    v21 = v72;
  }
  v74 = v41;
  if (objc_msgSend(v29, "count") || objc_msgSend(v41, "count"))
  {
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v52 = v21;
    v53 = -[NSObject countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v77, v99, 16);
    if (!v53)
      goto LABEL_64;
    v54 = v53;
    v55 = *(_QWORD *)v78;
    while (1)
    {
      for (n = 0; n != v54; n = (char *)n + 1)
      {
        if (*(_QWORD *)v78 != v55)
          objc_enumerationMutation(v52);
        v57 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)n);
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "assetID"));
        if (v58)
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", v58));
          if (v59)
            goto LABEL_52;
        }
        else
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "temporaryAssetID"));
          if (v60)
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKey:", v60));
          else
            v59 = 0;

          if (v59)
          {
LABEL_52:
            -[BKLibraryCollectionManager p_updateAsset:inCollectionMember:withMOC:](self, "p_updateAsset:inCollectionMember:withMOC:", v59, v57, v76);
            goto LABEL_61;
          }
        }
        v61 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
        v62 = objc_msgSend(v61, "verboseLoggingEnabled");

        if (v62)
        {
          v63 = BKLibraryCollectionDevelopmentLog();
          v64 = objc_claimAutoreleasedReturnValue(v63);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "collection"));
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "title"));
            *(_DWORD *)buf = 138412546;
            v104 = v58;
            v105 = 2112;
            v106 = v66;
            _os_log_impl(&dword_0, v64, OS_LOG_TYPE_DEFAULT, "\"\\\"Did not find asset assetID %@ in Collection: %@ \\\"\", buf, 0x16u);

          }
        }
LABEL_61:

      }
      v54 = -[NSObject countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v77, v99, 16);
      if (!v54)
      {
        v20 = v71;
        v21 = v72;
        goto LABEL_64;
      }
    }
  }
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
  v68 = objc_msgSend(v67, "verboseLoggingEnabled");

  if (v68)
  {
    v69 = BKLibraryCollectionDevelopmentLog();
    v52 = objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v104 = v70;
      v105 = 2112;
      v106 = v20;
      _os_log_impl(&dword_0, v52, OS_LOG_TYPE_DEFAULT, "\"\\\"Did not find any assets for assetIDs: %@, temporaryAssetID: %@\\\"\", buf, 0x16u);
    }
LABEL_64:

    v41 = v74;
  }

}

- (void)p_updateAsset:(id)a3 inCollectionMember:(id)a4 withMOC:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  unsigned int v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  unsigned int v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  unsigned int v59;
  id v60;
  int v61;
  void *v62;
  __int16 v63;
  void *v64;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "setAsset:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
  v10 = objc_msgSend(v9, "verboseLoggingEnabled");

  if (v10)
  {
    v11 = BKLibraryCollectionDevelopmentLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collection"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asset"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
      v61 = 138412546;
      v62 = v14;
      v63 = 2112;
      v64 = v16;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "\"\\\"Initializing asset link for Collection: %@ Asset: %@\\\"\", (uint8_t *)&v61, 0x16u);

    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager upgradeAssetSortKeys](self, "upgradeAssetSortKeys"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "permanentOrTemporaryAssetID"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v18));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortKey"));
  if (!v20)
  {
LABEL_17:
    objc_msgSend(v7, "setSortKey:", v19);
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortKey"));
    if (!v38
      || (v39 = (void *)v38,
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortKey")),
          v41 = objc_msgSend(v40, "integerValue"),
          v40,
          v39,
          !v41))
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collection"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[BKUserSortOrderManager nextSortKeyForCollection:](BKUserSortOrderManager, "nextSortKeyForCollection:", v45));
      objc_msgSend(v7, "setSortKey:", v46);

      v47 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
      LODWORD(v45) = objc_msgSend(v47, "verboseLoggingEnabled");

      if ((_DWORD)v45)
      {
        v48 = BKLibraryCollectionDevelopmentLog();
        v49 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collection"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "title"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asset"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "title"));
          v61 = 138412546;
          v62 = v51;
          v63 = 2112;
          v64 = v53;
          _os_log_impl(&dword_0, v49, OS_LOG_TYPE_DEFAULT, "\"\\\"#sortKey Did not find sort key in collection member or asset, assigned next sort key - Collection: %@ Asset: %@\\\"\", (uint8_t *)&v61, 0x16u);

        }
      }
      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collection"));
      -[NSObject updateMaxSortKeyWithMember:](v32, "updateMaxSortKeyWithMember:", v7);
      goto LABEL_32;
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
    v43 = objc_msgSend(v42, "verboseLoggingEnabled");

    if (v43)
    {
      v44 = BKLibraryCollectionDevelopmentLog();
      v32 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collection"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "title"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asset"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "title"));
        v61 = 138412546;
        v62 = v34;
        v63 = 2112;
        v64 = v36;
        v37 = "\"\\\"#sortKey Adopted sort key from asset - Collection: %@ Asset: %@\\\"\";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  v21 = (void *)v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortKey"));
  if (!objc_msgSend(v22, "integerValue"))
  {

    goto LABEL_17;
  }
  if (v19 && objc_msgSend(v19, "integerValue"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortKey"));
    v24 = objc_msgSend(v23, "isEqual:", v19);

    if ((v24 & 1) == 0)
      goto LABEL_17;
  }
  else
  {

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortKey"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asset"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "sortKey"));
  v28 = objc_msgSend(v25, "isEqual:", v27);

  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
    v30 = objc_msgSend(v29, "verboseLoggingEnabled");

    if (v30)
    {
      v31 = BKLibraryCollectionDevelopmentLog();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collection"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "title"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asset"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "title"));
        v61 = 138412546;
        v62 = v34;
        v63 = 2112;
        v64 = v36;
        v37 = "\"\\\"#sortKey Identical asset and member sort key - Collection: %@ Asset: %@\\\"\";
LABEL_31:
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, v37, (uint8_t *)&v61, 0x16u);

      }
LABEL_32:

    }
  }
  else
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortKey"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asset"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "sortKey"));
    v57 = objc_msgSend(v54, "isEqual:", v56);

    if ((v57 & 1) == 0)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
      v59 = objc_msgSend(v58, "verboseLoggingEnabled");

      if (v59)
      {
        v60 = BKLibraryCollectionDevelopmentLog();
        v32 = objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collection"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "title"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asset"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "title"));
          v61 = 138412546;
          v62 = v34;
          v63 = 2112;
          v64 = v36;
          v37 = "\"\\\"#sortKey SortKey mismatch! - Collection: %@ Asset: %@\\\"\";
          goto LABEL_31;
        }
        goto LABEL_32;
      }
    }
  }
LABEL_33:

}

- (void)updateCollectionMemberAssetLinksInMOCForUpgrade:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  objc_msgSend(v5, "setPropertiesToFetch:", &off_CA0F0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("sortKey != NULL")));
  objc_msgSend(v5, "setPredicate:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeFetchRequest:error:", v5, 0));
  if (objc_msgSend(v7, "count"))
  {
    v23 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v7, "count")));
    -[BKLibraryCollectionManager setUpgradeAssetSortKeys:](self, "setUpgradeAssetSortKeys:", v8);

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sortKey"));
          v16 = objc_msgSend(v15, "integerValue");

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "permanentOrTemporaryAssetID"));
            if (v17)
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager upgradeAssetSortKeys](self, "upgradeAssetSortKeys"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sortKey"));
              objc_msgSend(v18, "setObject:forKey:", v19, v17);

            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

    v4 = v23;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKCollectionMember")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset == NULL")));
  objc_msgSend(v20, "setPredicate:", v21);

  objc_msgSend(v20, "setFetchBatchSize:", 32);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeFetchRequest:error:", v20, 0));
  if (objc_msgSend(v22, "count"))
    -[BKLibraryCollectionManager p_updateAssetInMembers:moc:](self, "p_updateAssetInMembers:moc:", v22, v4);

}

- (void)clearSortKeysFromAssetsInMOCForUpgrade:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  objc_msgSend(v5, "setPropertiesToFetch:", &off_CA108);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("sortKey != NULL")));
  objc_msgSend(v5, "setPredicate:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeFetchRequest:error:", v5, 0));
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v7, "count")));
    -[BKLibraryCollectionManager setUpgradeAssetSortKeys:](self, "setUpgradeAssetSortKeys:", v8);

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), "setSortKey:", 0, (_QWORD)v14);
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
  -[BKLibraryCollectionManager setUpgradeAssetSortKeys:](self, "setUpgradeAssetSortKeys:", 0, (_QWORD)v14);

}

- (void)updateCollectionMemberAssetLinksForAssetIDs:(id)a3 temporaryAssetIDs:(id)a4 moc:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKCollectionMember")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset == NULL AND (assetID IN %@ OR temporaryAssetID IN %@)"), v9, v8));

  objc_msgSend(v10, "setPredicate:", v11);
  objc_msgSend(v10, "setFetchBatchSize:", 32);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "executeFetchRequest:error:", v10, 0));
  if (objc_msgSend(v12, "count"))
    -[BKLibraryCollectionManager p_updateAssetInMembers:moc:](self, "p_updateAssetInMembers:moc:", v12, v13);

}

- (void)updateiTunesUCollectionMembersForAssetIDs:(id)a3 temporaryAssetIDs:(id)a4 moc:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned __int8 v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  void *k;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id obj;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[4];
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t v83[128];
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  void *v95;
  _BYTE v96[128];
  _BYTE v97[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKCollectionMember")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset.permlink != NULL AND (assetID IN %@ OR temporaryAssetID IN %@)"), v7, v8));
  objc_msgSend(v10, "setPredicate:", v11);

  objc_msgSend(v10, "setFetchBatchSize:", 32);
  v67 = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v10, 0));
  if (objc_msgSend(v12, "count"))
  {
    v62 = v10;
    v63 = v8;
    v64 = v7;
    v13 = BKLibraryCollectionLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v85 = (uint64_t)objc_msgSend(v12, "count");
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "updateiTunesUCollectionMembers: processing %ld iTunesU collection members.", buf, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v61 = v12;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v79, v97, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v80 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "collectionID"));
          if (v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v22));

            if (!v23)
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, v22);

            }
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v22));
            objc_msgSend(v25, "addObject:", v21);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v79, v97, 16);
      }
      while (v18);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_665A0;
    v76[3] = &unk_C3620;
    v65 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v77 = v65;
    v27 = v26;
    v78 = v27;
    v60 = v15;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v76);
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v28 = v27;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v72, v96, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v73;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(_QWORD *)v73 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)j);
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "asset"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "assetID"));

          if (v35)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "assetID"));
            v37 = objc_msgSend(v35, "isEqualToString:", v36);

            if ((v37 & 1) == 0)
            {
              v38 = BKLibraryCollectionLog();
              v39 = objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "temporaryAssetID"));
                v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "collectionID"));
                *(_DWORD *)buf = 141559298;
                v85 = 1752392040;
                v86 = 2112;
                v87 = v35;
                v88 = 2160;
                v89 = 1752392040;
                v90 = 2112;
                v91 = v40;
                v92 = 2160;
                v93 = 1752392040;
                v94 = 2112;
                v95 = v41;
                _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "updateiTunesUCollectionMembers: Updated collection member. new asestID: %{mask.hash}@ tempopraryAsestID: %{mask.hash}@ collectionID: %{mask.hash}@", buf, 0x3Eu);

              }
              objc_msgSend(v33, "setAssetID:", v35);
            }
          }
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "asset"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "temporaryAssetID"));

          if (v43)
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "temporaryAssetID"));
            v45 = objc_msgSend(v43, "isEqualToString:", v44);

            if ((v45 & 1) == 0)
            {
              v46 = BKLibraryCollectionLog();
              v47 = objc_claimAutoreleasedReturnValue(v46);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "temporaryAssetID"));
                v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "collectionID"));
                *(_DWORD *)buf = 141559298;
                v85 = 1752392040;
                v86 = 2112;
                v87 = v35;
                v88 = 2160;
                v89 = 1752392040;
                v90 = 2112;
                v91 = v48;
                v92 = 2160;
                v93 = 1752392040;
                v94 = 2112;
                v95 = v49;
                _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "updateiTunesUCollectionMembers: Updated collection member. asestID: %{mask.hash}@ new tempopraryAsestID: %{mask.hash}@ collectionID: %{mask.hash}@", buf, 0x3Eu);

              }
              objc_msgSend(v33, "setTemporaryAssetID:", v43);
            }
          }

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v72, v96, 16);
      }
      while (v30);
    }

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = v65;
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v69;
      do
      {
        for (k = 0; k != v51; k = (char *)k + 1)
        {
          if (*(_QWORD *)v69 != v52)
            objc_enumerationMutation(obj);
          v54 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)k);
          v55 = BKLibraryCollectionLog();
          v56 = objc_claimAutoreleasedReturnValue(v55);
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "assetID"));
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "temporaryAssetID"));
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "collectionID"));
            *(_DWORD *)buf = 141559298;
            v85 = 1752392040;
            v86 = 2112;
            v87 = v57;
            v88 = 2160;
            v89 = 1752392040;
            v90 = 2112;
            v91 = v58;
            v92 = 2160;
            v93 = 1752392040;
            v94 = 2112;
            v95 = v59;
            _os_log_impl(&dword_0, v56, OS_LOG_TYPE_DEFAULT, "updateiTunesUCollectionMembers: Deleted collection member. asestID: %{mask.hash}@ tempopraryAsestID: %{mask.hash}@ collectionID: %{mask.hash}@", buf, 0x3Eu);

          }
          objc_msgSend(v67, "deleteObject:", v54);
        }
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
      }
      while (v51);
    }

    v8 = v63;
    v7 = v64;
    v12 = v61;
    v10 = v62;
  }

}

- (void)fixCollectionMemberAssetLinks
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_66A64;
  v4[3] = &unk_C1590;
  v4[4] = self;
  objc_msgSend(v3, "performBlockOnCollectionsWorkerQueueAndWait:", v4);

}

- (void)fixPDFCollectionIfNeeded
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_66D14;
  v4[3] = &unk_C1590;
  v4[4] = self;
  objc_msgSend(v3, "performBlockOnCollectionsWorkerQueue:", v4);

}

- (void)_addMemberWithAsset:(id)a3 toCollection:(id)a4 moc:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortKey"));
  if (!objc_msgSend(v11, "integerValue"))
  {

    v11 = 0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager upgradeAssetSortKeys](self, "upgradeAssetSortKeys"));

  if (v12)
  {
    v13 = objc_msgSend(v8, "isContainer");
    if (!v11)
    {
      if (v13)
      {
        v28 = v10;
        v29 = v9;
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "purchasedAndLocalSeriesItems"));
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v15)
        {
          v16 = v15;
          v11 = 0;
          v17 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(_QWORD *)v31 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
              v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager upgradeAssetSortKeys](self, "upgradeAssetSortKeys"));
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "assetID"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", v21));

              v23 = objc_msgSend(v22, "integerValue");
              if ((uint64_t)v23 > (uint64_t)objc_msgSend(v11, "integerValue"))
              {
                v24 = v22;

                v11 = v24;
              }

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          }
          while (v16);
        }
        else
        {
          v11 = 0;
        }

        v10 = v28;
        v9 = v29;
      }
    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "temporaryAssetID"));
  v27 = objc_msgSend(v9, "addCollectionMemberAvoidingDupesWithAsset:assetID:temporaryAssetID:sortKey:forceToTop:", v8, v25, v26, v11, 0);

}

- (void)resetCollections
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager coalescedResetAllCollections](self, "coalescedResetAllCollections"));
  objc_msgSend(v2, "signalWithCompletion:", &stru_C3640);

}

- (void)resetAllAssetsCollectionsWithLibraryManagedObjectContext:(id)a3 completion:(id)a4
{
  -[BKLibraryCollectionManager _performResetCollectionsInMoc:changeSet:completion:](self, "_performResetCollectionsInMoc:changeSet:completion:", a3, 0, a4);
}

- (void)resetCollectionsForAssetIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_67518;
  v11[3] = &unk_C1A08;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlockOnCollectionsWorkerQueue:", v11);

}

- (void)processGatheredChangedAssetsCollections:(id)a3
{
  id v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  BKLibraryCollectionManager *v10;
  id v11;

  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_675E4;
  v9 = &unk_C12F8;
  v10 = self;
  v11 = a3;
  v4 = v11;
  os_unfair_lock_lock_with_options(&v10->_accessLock, 0x10000);
  sub_675E4((uint64_t)&v6);
  os_unfair_lock_unlock(&self->_accessLock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager coalescedResetChangedCollections](self, "coalescedResetChangedCollections", v6, v7));
  objc_msgSend(v5, "signalWithCompletion:", &stru_C3660);

}

- (id)gatherChangedAssetsCollectionsWithLibraryMoc:(id)a3
{
  id v3;
  NSPredicate *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v24;
  _QWORD v25[4];
  id v26;

  v3 = a3;
  v4 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self isKindOfClass: %@ AND (assetID != NULL OR temporaryAssetID != NULL)"), objc_opt_class(BKLibraryAsset));
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("contentType"), CFSTR("state"), CFSTR("isSample"), CFSTR("localOnlySeriesItemsParent"), CFSTR("purchasedAndLocalParent"), CFSTR("purchasedAndLocalSeriesItems"), CFSTR("path"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "updatedObjects"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_67910;
  v25[3] = &unk_C3688;
  v8 = v6;
  v26 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectsPassingTest:", v25));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "insertedObjects"));

  objc_msgSend(v10, "unionSet:", v11);
  objc_msgSend(v10, "unionSet:", v9);
  v24 = (void *)v5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filteredSetUsingPredicate:", v5));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("assetID")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bu_arrayByRemovingNSNulls"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("temporaryAssetID")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bu_arrayByRemovingNSNulls"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "setByAddingObjectsFromSet:", v19));
  v21 = BKLibraryLog(v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    sub_83E0C(v20);

  return v20;
}

- (void)_performResetCollectionsInMoc:(id)a3 changeSet:(id)a4 completion:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *i;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  unsigned int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  unsigned __int8 v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  unsigned __int8 v72;
  void *v73;
  char v74;
  char v75;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  void *k;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  uint64_t v88;
  void *m;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  id v97;
  uint64_t v98;
  void *n;
  uint64_t v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  id v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  char *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  uint64_t v121;
  void *v122;
  unsigned int v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  id v128;
  id v129;
  uint64_t v130;
  void *ii;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  NSObject *v136;
  void *v137;
  void *v138;
  unsigned int v139;
  unsigned int v140;
  unsigned int v141;
  id v142;
  id v143;
  void *v144;
  uint64_t v145;
  NSObject *v146;
  uint64_t v147;
  NSObject *v148;
  void *v149;
  id v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  id v158;
  id v159;
  void *v160;
  void *v161;
  id v162;
  id obj;
  void *v164;
  void *v165;
  uint64_t v166;
  void *v167;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  void *v171;
  uint64_t v172;
  id v173;
  id v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  unsigned int v184;
  void *v185;
  uint64_t v186;
  void *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  unsigned int v191;
  uint64_t v192;
  id v193;
  uint64_t v194;
  void *v195;
  unsigned int v197;
  id v198;
  id v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  _QWORD v224[5];
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  uint8_t buf[4];
  id v234;
  __int16 v235;
  id v236;
  __int16 v237;
  void *v238;
  __int16 v239;
  unsigned int v240;
  __int16 v241;
  unsigned int v242;
  __int16 v243;
  unsigned int v244;
  _BYTE v245[128];
  _QWORD v246[3];
  _BYTE v247[128];
  _BYTE v248[128];
  _BYTE v249[128];
  _BYTE v250[128];
  _BYTE v251[128];
  _BYTE v252[128];
  _BYTE v253[128];

  v198 = a3;
  v159 = a4;
  v158 = a5;
  v7 = kdebug_trace(725353716, 10, 0, 0, 0);
  v8 = BKLibraryLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v159, "count")));
    *(_DWORD *)buf = 138412290;
    v234 = v10;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "#resetCollections: start for changeSet of size %@", buf, 0xCu);

  }
  v11 = objc_claimAutoreleasedReturnValue(+[BKCollection predicateForAllDefaultCollections](BKCollection, "predicateForAllDefaultCollections"));
  v12 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKCollection"));
  v157 = (void *)v11;
  objc_msgSend(v12, "setPredicate:", v11);
  v156 = v12;
  v229 = 0u;
  v230 = 0u;
  v231 = 0u;
  v232 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "executeFetchRequest:error:", v12, 0));
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v229, v253, 16);
  if (!v13)
  {
    v176 = 0;
    v177 = 0;
    v182 = 0;
    v164 = 0;
    v165 = 0;
    v175 = 0;
    goto LABEL_26;
  }
  v14 = v13;
  v176 = 0;
  v177 = 0;
  v182 = 0;
  v164 = 0;
  v165 = 0;
  v175 = 0;
  v15 = *(_QWORD *)v230;
  v16 = kBKCollectionDefaultAll;
  v17 = kBKCollectionDefaultIDBooks;
  v18 = kBKCollectionDefaultIDPDFs;
  v192 = kBKCollectionDefaultIDAudiobooks;
  v189 = kBKCollectionDefaultIDDownloaded;
  v186 = kBKCollectionDefaultIDSamples;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(_QWORD *)v230 != v15)
        objc_enumerationMutation(obj);
      v20 = *(id *)(*((_QWORD *)&v229 + 1) + 8 * (_QWORD)i);
      if ((objc_msgSend(v20, "isDeleted") & 1) == 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "collectionID"));
        if ((objc_msgSend(v21, "isEqualToString:", v16) & 1) != 0)
        {
          v23 = v176;
          v22 = v177;
          v176 = v20;
          goto LABEL_20;
        }
        if ((objc_msgSend(v21, "isEqualToString:", v17) & 1) != 0)
        {
          v23 = v175;
          v22 = v177;
          v175 = v20;
          goto LABEL_20;
        }
        if ((objc_msgSend(v21, "isEqualToString:", v18) & 1) != 0)
        {
          v23 = v165;
          v22 = v177;
          v165 = v20;
          goto LABEL_20;
        }
        if ((objc_msgSend(v21, "isEqualToString:", v192) & 1) != 0)
        {
          v23 = v164;
          v22 = v177;
          v164 = v20;
          goto LABEL_20;
        }
        if ((objc_msgSend(v21, "isEqualToString:", v189) & 1) != 0)
        {
          v23 = v182;
          v22 = v177;
          v182 = v20;
          goto LABEL_20;
        }
        v23 = v177;
        v22 = v20;
        if (objc_msgSend(v21, "isEqualToString:", v186))
        {
LABEL_20:
          v24 = v20;

          v177 = v22;
        }

      }
    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v229, v253, 16);
  }
  while (v14);
LABEL_26:

  v25 = v159;
  if (objc_msgSend(v159, "count"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionManager libraryManager](self, "libraryManager"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "libraryAssetsWithAssetIDsContainedInList:tempAssetIDs:inManagedObjectContext:", v159, v159, v198));

    v160 = v27;
    v28 = objc_msgSend(v27, "count");
    v29 = (uint64_t)v28;
  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("assetID != NULL OR temporaryAssetID != NULL")));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
    objc_msgSend(v31, "setPredicate:", v30);
    v29 = 32;
    objc_msgSend(v31, "setFetchBatchSize:", 32);
    v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "executeFetchRequest:error:", v31, 0));

    v25 = v159;
  }
  v32 = BKLibraryLog(v28);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = objc_msgSend(v25, "count");
    v35 = objc_msgSend(v160, "count");
    *(_DWORD *)buf = 134218240;
    v234 = v34;
    v235 = 2048;
    v236 = v35;
    _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "#resetCollections: _performResetCollectionsInMoc changed: %lu toCheck: %lu", buf, 0x16u);
  }

  if (objc_msgSend(v160, "count"))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v225 = 0u;
    v226 = 0u;
    v227 = 0u;
    v228 = 0u;
    v173 = v160;
    v193 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v225, v252, 16);
    if (v193)
    {
      v190 = 0;
      v183 = *(_QWORD *)v226;
      v187 = v36;
      v185 = v37;
      do
      {
        for (j = 0; j != v193; j = (char *)j + 1)
        {
          if (*(_QWORD *)v226 != v183)
            objc_enumerationMutation(v173);
          v39 = *(void **)(*((_QWORD *)&v225 + 1) + 8 * (_QWORD)j);
          if (!(((uint64_t)j + v190) % v29) && (objc_msgSend(v36, "count") || objc_msgSend(v37, "count")))
          {
            -[BKLibraryCollectionManager updateCollectionMemberAssetLinksForAssetIDs:temporaryAssetIDs:moc:](self, "updateCollectionMemberAssetLinksForAssetIDs:temporaryAssetIDs:moc:", v36, v37, v198);
            objc_msgSend(v36, "removeAllObjects");
            objc_msgSend(v37, "removeAllObjects");
          }
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "assetID"));

          if (v40)
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "assetID"));
            objc_msgSend(v36, "addObject:", v41);

          }
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "temporaryAssetID"));

          if (v42)
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "temporaryAssetID"));
            objc_msgSend(v37, "addObject:", v43);

          }
          v44 = objc_msgSend(v39, "contentType");
          v45 = objc_msgSend(v39, "state");
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "collectionMembers"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "allObjects"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "valueForKey:", CFSTR("collection")));

          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localOnlySeriesItemsParent"));
          if (v49)
          {
            v50 = 0;
            v51 = 0;
            if ((_DWORD)v44 == 5)
              goto LABEL_63;
            goto LABEL_56;
          }
          v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "purchasedAndLocalParent"));
          if (v180 || v45 == 5)
          {
            v50 = 0;
            v51 = 0;
            if ((_DWORD)v44 == 5)
              goto LABEL_62;
LABEL_56:
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "seriesContainer"));
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "seriesBooks"));
            v51 = objc_msgSend(v53, "count") != (char *)&dword_0 + 1;

            if ((v50 & 1) == 0)
              goto LABEL_58;
            goto LABEL_57;
          }
          v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "seriesID"));
          if (!v178)
            goto LABEL_61;
          v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "seriesContainer"));
          if (!v171)
          {
            v171 = 0;
LABEL_61:

            v51 = 0;
            v180 = 0;
LABEL_62:

            goto LABEL_63;
          }
          v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "seriesContainer"));
          v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "purchasedAndLocalSeriesItems"));
          v51 = 0;
          v180 = 0;
          if (objc_msgSend(v167, "count") && (_DWORD)v44 != 5)
          {
            v50 = 1;
            goto LABEL_56;
          }
LABEL_57:

LABEL_58:
          if (!v49)
            goto LABEL_62;
LABEL_63:

          if (v176
            && (objc_msgSend(v48, "containsObject:", v176) & 1) == 0
            && ((_DWORD)v44 == 5 || !v51 && (objc_msgSend(v39, "isStoreItem") & 1) == 0))
          {
            -[BKLibraryCollectionManager _addMemberWithAsset:toCollection:moc:](self, "_addMemberWithAsset:toCollection:moc:", v39, v176, v198);
          }
          if (v182
            && objc_msgSend(v39, "shouldBeInDownloadedCollection")
            && (objc_msgSend(v48, "containsObject:", v182) & 1) == 0)
          {
            -[BKLibraryCollectionManager _addMemberWithAsset:toCollection:moc:](self, "_addMemberWithAsset:toCollection:moc:", v39, v182, v198);
          }
          if (v177
            && objc_msgSend(v39, "shouldBeInMySamplesCollection")
            && (objc_msgSend(v48, "containsObject:", v177) & 1) == 0)
          {
            -[BKLibraryCollectionManager _addMemberWithAsset:toCollection:moc:](self, "_addMemberWithAsset:toCollection:moc:", v39, v177, v198);
            v54 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
            v55 = objc_msgSend(v54, "verboseLoggingEnabled");

            if (v55)
            {
              v57 = BKLibraryLog(v56);
              v58 = objc_claimAutoreleasedReturnValue(v57);
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v234 = v39;
                _os_log_impl(&dword_0, v58, OS_LOG_TYPE_DEFAULT, "\"\\\"Adding Asset to sample collection:%@\\\"\", buf, 0xCu);
              }

            }
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "storeID"));

            if (v59)
            {
              v60 = objc_alloc((Class)BCMutableStoreItem);
              v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "storeID"));
              v62 = objc_msgSend(v60, "initWithStoreID:", v61);

              v63 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
              v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "storeAssetManager"));

              v224[0] = _NSConcreteStackBlock;
              v224[1] = 3221225472;
              v224[2] = sub_68F0C;
              v224[3] = &unk_C36B0;
              v224[4] = v39;
              objc_msgSend(v64, "addStoreItem:completion:", v62, v224);

            }
          }
          if (objc_msgSend(v39, "state") == 2)
            v65 = +[BKAssetUtilities isAudiobookTrackContentType:](BKAssetUtilities, "isAudiobookTrackContentType:", v44);
          else
            v65 = 0;
          v66 = objc_opt_class(BKLibraryAsset);
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "seriesBooks"));
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "anyObject"));
          v69 = BUDynamicCast(v66, v68);
          v70 = (void *)objc_claimAutoreleasedReturnValue(v69);

          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "isStoreAudiobook"));
          v72 = objc_msgSend(v71, "BOOLValue");

          if (v175)
          {
            if (v44 <= 4 && ((1 << (char)v44) & 0x16) != 0
              || ((_DWORD)v44 != 5 ? (v74 = 1) : (v74 = v72), (v74 & 1) == 0))
            {
              if (((objc_msgSend(v48, "containsObject:", v175) | v51) & 1) == 0)
              {
                v73 = v175;
                if (!objc_msgSend(v39, "isStoreItem"))
                  goto LABEL_107;
              }
            }
          }
          if (v165)
          {
            if ((_DWORD)v44 == 3)
            {
              v73 = v165;
              if (!objc_msgSend(v48, "containsObject:", v165))
                goto LABEL_107;
            }
          }
          if (v164)
          {
            v75 = v72 ^ 1;
            if ((_DWORD)v44 != 5)
              v75 = 1;
            if (((v65 & 1) != 0 || (_DWORD)v44 == 6 || (v75 & 1) == 0)
              && ((objc_msgSend(v48, "containsObject:", v164) | v51) & 1) == 0
              && (objc_msgSend(v39, "isStoreItem") & 1) == 0)
            {
              v73 = v164;
              if ((objc_msgSend(v39, "isSample") & 1) == 0)
LABEL_107:
                -[BKLibraryCollectionManager _addMemberWithAsset:toCollection:moc:](self, "_addMemberWithAsset:toCollection:moc:", v39, v73, v198);
            }
          }

          v36 = v187;
          v37 = v185;
        }
        v190 += (uint64_t)v193;
        v193 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v225, v252, 16);
      }
      while (v193);
    }

    if (objc_msgSend(v36, "count") || objc_msgSend(v37, "count"))
    {
      -[BKLibraryCollectionManager updateCollectionMemberAssetLinksForAssetIDs:temporaryAssetIDs:moc:](self, "updateCollectionMemberAssetLinksForAssetIDs:temporaryAssetIDs:moc:", v36, v37, v198);
      -[BKLibraryCollectionManager updateiTunesUCollectionMembersForAssetIDs:temporaryAssetIDs:moc:](self, "updateiTunesUCollectionMembersForAssetIDs:temporaryAssetIDs:moc:", v36, v37, v198);
    }

  }
  if (v182)
  {
    v222 = 0u;
    v223 = 0u;
    v220 = 0u;
    v221 = 0u;
    v76 = v160;
    v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v220, v251, 16);
    if (v77)
    {
      v78 = v77;
      v79 = *(_QWORD *)v221;
      v194 = *(_QWORD *)v221;
      do
      {
        for (k = 0; k != v78; k = (char *)k + 1)
        {
          if (*(_QWORD *)v221 != v79)
            objc_enumerationMutation(v76);
          v81 = *(void **)(*((_QWORD *)&v220 + 1) + 8 * (_QWORD)k);
          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "collectionMembers"));
          v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "allObjects"));
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "valueForKey:", CFSTR("collection")));

          if (objc_msgSend(v81, "shouldBeInDownloadedCollection")
            && (objc_msgSend(v84, "containsObject:", v182) & 1) == 0)
          {
            -[BKLibraryCollectionManager _addMemberWithAsset:toCollection:moc:](self, "_addMemberWithAsset:toCollection:moc:", v81, v182, v198);
          }
          if ((objc_msgSend(v81, "shouldBeInDownloadedCollection") & 1) == 0
            && objc_msgSend(v84, "containsObject:", v182))
          {
            v218 = 0u;
            v219 = 0u;
            v216 = 0u;
            v217 = 0u;
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "collectionMembers"));
            v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v216, v250, 16);
            if (v86)
            {
              v87 = v86;
              v88 = *(_QWORD *)v217;
              while (2)
              {
                for (m = 0; m != v87; m = (char *)m + 1)
                {
                  if (*(_QWORD *)v217 != v88)
                    objc_enumerationMutation(v85);
                  v90 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * (_QWORD)m);
                  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "collection"));

                  if (v91 == v182)
                  {
                    objc_msgSend(v198, "deleteObject:", v90);
                    goto LABEL_135;
                  }
                }
                v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v216, v250, 16);
                if (v87)
                  continue;
                break;
              }
            }
LABEL_135:

            v79 = v194;
          }

        }
        v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v220, v251, 16);
      }
      while (v78);
    }

  }
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKCollectionMember")));
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("collection == NULL")));
  objc_msgSend(v92, "setPredicate:", v93);

  objc_msgSend(v92, "setFetchBatchSize:", 32);
  v155 = v92;
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "executeFetchRequest:error:", v92, 0));
  if (objc_msgSend(v94, "count"))
  {
    v214 = 0u;
    v215 = 0u;
    v212 = 0u;
    v213 = 0u;
    v95 = v94;
    v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v212, v249, 16);
    if (v96)
    {
      v97 = v96;
      v98 = *(_QWORD *)v213;
      do
      {
        for (n = 0; n != v97; n = (char *)n + 1)
        {
          if (*(_QWORD *)v213 != v98)
            objc_enumerationMutation(v95);
          objc_msgSend(v198, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v212 + 1) + 8 * (_QWORD)n));
        }
        v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v212, v249, 16);
      }
      while (v97);
    }

  }
  v154 = v94;
  v170 = kBKCollectionDefaultIDAudiobooks;
  v172 = kBKCollectionDefaultIDBooks;
  v100 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(collection.collectionID == %@ OR collection.collectionID == %@ OR collection.collectionID == %@) AND asset.seriesID != NULL AND asset.contentType != %@ AND (asset.state == %@ OR asset.purchasedAndLocalParent != nil)"), kBKCollectionDefaultAll, kBKCollectionDefaultIDBooks, kBKCollectionDefaultIDAudiobooks, &off_C9FB8, &off_C9FB8));
  v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKCollectionMember")));
  v153 = (void *)v100;
  objc_msgSend(v101, "setPredicate:", v100);
  v152 = v101;
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "executeFetchRequest:error:", v101, 0));
  v208 = 0u;
  v209 = 0u;
  v210 = 0u;
  v211 = 0u;
  v103 = v102;
  v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v208, v248, 16);
  v161 = v103;
  if (v104)
  {
    v105 = v104;
    v106 = *(_QWORD *)v209;
    do
    {
      v107 = 0;
      do
      {
        if (*(_QWORD *)v209 != v106)
          objc_enumerationMutation(v103);
        v108 = *(void **)(*((_QWORD *)&v208 + 1) + 8 * (_QWORD)v107);
        v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "asset"));
        v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "seriesContainer"));
        v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "seriesBooks"));
        v112 = (char *)objc_msgSend(v111, "count");

        if (v112 != (_BYTE *)&dword_0 + 1)
        {
          v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "localOnlySeriesItemsParent"));
          if (v113
            || (v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "purchasedAndLocalParent"))) != 0)
          {

LABEL_157:
            objc_msgSend(v198, "deleteObject:", v108);
            goto LABEL_158;
          }
          v114 = objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "seriesID"));
          if (v114)
          {
            v115 = (void *)v114;
            v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "seriesContainer"));
            if (v116)
            {
              v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "seriesContainer"));
              v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "purchasedAndLocalSeriesItems"));
              v119 = objc_msgSend(v118, "count");

              v103 = v161;
              if (v119)
                goto LABEL_157;
            }
            else
            {

            }
          }
        }
LABEL_158:

        v107 = (char *)v107 + 1;
      }
      while (v105 != v107);
      v120 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v208, v248, 16);
      v105 = v120;
    }
    while (v120);
  }

  v206 = 0u;
  v207 = 0u;
  v204 = 0u;
  v205 = 0u;
  v246[0] = v172;
  v246[1] = v170;
  v168 = kBKCollectionDefaultIDPDFs;
  v246[2] = kBKCollectionDefaultIDPDFs;
  v162 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v246, 3));
  v174 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v204, v247, 16);
  if (!v174)
    goto LABEL_193;
  v166 = *(_QWORD *)v205;
  while (2)
  {
    v121 = 0;
    while (2)
    {
      if (*(_QWORD *)v205 != v166)
        objc_enumerationMutation(v162);
      v181 = v121;
      v122 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * v121);
      v123 = objc_msgSend(v122, "isEqualToString:", v172);
      v197 = objc_msgSend(v122, "isEqualToString:", v170);
      v184 = objc_msgSend(v122, "isEqualToString:", v168);
      v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKCollectionMember")));
      v195 = v122;
      v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("collection.collectionID == %@"), v122));
      objc_msgSend(v124, "setPredicate:", v125);

      v179 = v124;
      v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "executeFetchRequest:error:", v124, 0));
      v200 = 0u;
      v201 = 0u;
      v202 = 0u;
      v203 = 0u;
      v127 = v126;
      v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v200, v245, 16);
      if (v128)
      {
        v129 = v128;
        v130 = *(_QWORD *)v201;
        v191 = v123;
        v188 = *(_QWORD *)v201;
        do
        {
          for (ii = 0; ii != v129; ii = (char *)ii + 1)
          {
            if (*(_QWORD *)v201 != v130)
              objc_enumerationMutation(v127);
            v132 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * (_QWORD)ii);
            v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "asset"));
            v134 = v133;
            if (v133)
            {
              if (v123)
              {
                if ((objc_msgSend(v133, "isAudiobook") & 1) == 0
                  && objc_msgSend(v134, "contentType") != 3)
                {
                  goto LABEL_189;
                }
              }
              else if (v197)
              {
                if ((objc_msgSend(v133, "isBook") & 1) == 0)
                  goto LABEL_189;
              }
              else if (!v184 || objc_msgSend(v133, "contentType") == 3)
              {
                goto LABEL_189;
              }
              v135 = BKLibraryCollectionLog();
              v136 = objc_claimAutoreleasedReturnValue(v135);
              if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
              {
                v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "title"));
                v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "assetID"));
                v139 = objc_msgSend(v134, "isBook");
                v140 = objc_msgSend(v134, "isAudiobook");
                v141 = objc_msgSend(v134, "contentType");
                *(_DWORD *)buf = 138413570;
                v234 = v137;
                v235 = 2112;
                v236 = v195;
                v237 = 2112;
                v238 = v138;
                v239 = 1024;
                v240 = v139;
                v241 = 1024;
                v242 = v140;
                v243 = 1024;
                v244 = v141;
                _os_log_impl(&dword_0, v136, OS_LOG_TYPE_DEFAULT, "Removing '%@' from %@: id %@, isBook %d, isAudiobook %d, contentType %d ", buf, 0x32u);

                v123 = v191;
                v130 = v188;
              }

              objc_msgSend(v198, "deleteObject:", v132);
            }
LABEL_189:

          }
          v129 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v200, v245, 16);
        }
        while (v129);
      }

      v121 = v181 + 1;
      if ((id)(v181 + 1) != v174)
        continue;
      break;
    }
    v174 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v204, v247, 16);
    if (v174)
      continue;
    break;
  }
LABEL_193:

  v142 = objc_msgSend(v198, "hasChanges");
  if ((_DWORD)v142)
  {
    v199 = 0;
    objc_msgSend(v198, "save:", &v199);
    v143 = v199;
    v144 = v143;
    if (v143)
    {
      v145 = BKLibraryLog(v143);
      v146 = objc_claimAutoreleasedReturnValue(v145);
      if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
        sub_83E78();

    }
  }
  v147 = BKLibraryLog(v142);
  v148 = objc_claimAutoreleasedReturnValue(v147);
  if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
  {
    v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v159, "count")));
    *(_DWORD *)buf = 138412290;
    v234 = v149;
    _os_log_impl(&dword_0, v148, OS_LOG_TYPE_DEFAULT, "#resetCollections: done for changeSet of size %@", buf, 0xCu);

  }
  v150 = objc_retainBlock(v158);
  v151 = v150;
  if (v150)
    (*((void (**)(id))v150 + 2))(v150);

  kdebug_trace(725353716, 11, 0, 0, 0);
}

- (id)_defaultManagerAssetsForDefaultCollectionWithID:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection contentTypesForDefaultCollectionWithID:](BKCollection, "contentTypesForDefaultCollectionWithID:", a3));
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
    objc_msgSend(v7, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(v7, "setFetchBatchSize:", 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForContentTypes:](BKLibraryManager, "predicateForContentTypes:", v6));
    objc_msgSend(v7, "setPredicate:", v8);

    v14 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v7, &v14));
    v10 = v14;
    if (!v9)
    {
      v11 = BKLibraryCollectionLog();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_83F5C();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)enableCloudMerge
{
  return self->_enableCloudMerge;
}

- (id)uiManagerProviderForAddingToWantToRead
{
  return self->_uiManagerProviderForAddingToWantToRead;
}

- (void)setUiManagerProviderForAddingToWantToRead:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BKLibraryManager)libraryManager
{
  return (BKLibraryManager *)objc_loadWeakRetained((id *)&self->_libraryManager);
}

- (void)setLibraryManager:(id)a3
{
  objc_storeWeak((id *)&self->_libraryManager, a3);
}

- (BOOL)supportsAudioBooks
{
  return self->_supportsAudioBooks;
}

- (void)setDefaultAllBooksCollection:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAllBooksCollection, a3);
}

- (void)setDefaultBooksCollection:(id)a3
{
  objc_storeStrong((id *)&self->_defaultBooksCollection, a3);
}

- (void)setDefaultAudioBooksCollection:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAudioBooksCollection, a3);
}

- (void)setDefaultPDFsCollection:(id)a3
{
  objc_storeStrong((id *)&self->_defaultPDFsCollection, a3);
}

- (void)setDefaultDownloadedCollection:(id)a3
{
  objc_storeStrong((id *)&self->_defaultDownloadedCollection, a3);
}

- (void)setDefaultFinishedCollection:(id)a3
{
  objc_storeStrong((id *)&self->_defaultFinishedCollection, a3);
}

- (void)setDefaultWantToReadCollection:(id)a3
{
  objc_storeStrong((id *)&self->_defaultWantToReadCollection, a3);
}

- (void)setDefaultSamplesCollection:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSamplesCollection, a3);
}

- (BCCloudCollectionsManager)cloudCollectionsManager
{
  return self->_cloudCollectionsManager;
}

- (void)setCloudCollectionsManager:(id)a3
{
  objc_storeStrong((id *)&self->_cloudCollectionsManager, a3);
}

- (OS_dispatch_queue)enableCloudMergeQueue
{
  return self->_enableCloudMergeQueue;
}

- (void)setEnableCloudMergeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_enableCloudMergeQueue, a3);
}

- (OS_dispatch_queue)getChangesQueue
{
  return self->_getChangesQueue;
}

- (void)setGetChangesQueue:(id)a3
{
  objc_storeStrong((id *)&self->_getChangesQueue, a3);
}

- (BOOL)processingCollectionDetailChanges
{
  return self->_processingCollectionDetailChanges;
}

- (void)setProcessingCollectionDetailChanges:(BOOL)a3
{
  self->_processingCollectionDetailChanges = a3;
}

- (BOOL)receivedCollectionDetailChangesNotification
{
  return self->_receivedCollectionDetailChangesNotification;
}

- (void)setReceivedCollectionDetailChangesNotification:(BOOL)a3
{
  self->_receivedCollectionDetailChangesNotification = a3;
}

- (BOOL)processingCollectionMemberChanges
{
  return self->_processingCollectionMemberChanges;
}

- (void)setProcessingCollectionMemberChanges:(BOOL)a3
{
  self->_processingCollectionMemberChanges = a3;
}

- (BOOL)receivedCollectionMemberChangesNotification
{
  return self->_receivedCollectionMemberChangesNotification;
}

- (void)setReceivedCollectionMemberChangesNotification:(BOOL)a3
{
  self->_receivedCollectionMemberChangesNotification = a3;
}

- (NSMutableDictionary)upgradeAssetSortKeys
{
  return self->_upgradeAssetSortKeys;
}

- (void)setUpgradeAssetSortKeys:(id)a3
{
  objc_storeStrong((id *)&self->_upgradeAssetSortKeys, a3);
}

- (BUCoalescingCallBlock)coalescedResetAllCollections
{
  return self->_coalescedResetAllCollections;
}

- (void)setCoalescedResetAllCollections:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedResetAllCollections, a3);
}

- (BUCoalescingCallBlock)coalescedResetChangedCollections
{
  return self->_coalescedResetChangedCollections;
}

- (void)setCoalescedResetChangedCollections:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedResetChangedCollections, a3);
}

- (NSSet)resetCollectionsChangeSet
{
  return self->_resetCollectionsChangeSet;
}

- (void)setResetCollectionsChangeSet:(id)a3
{
  objc_storeStrong((id *)&self->_resetCollectionsChangeSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetCollectionsChangeSet, 0);
  objc_storeStrong((id *)&self->_coalescedResetChangedCollections, 0);
  objc_storeStrong((id *)&self->_coalescedResetAllCollections, 0);
  objc_storeStrong((id *)&self->_upgradeAssetSortKeys, 0);
  objc_storeStrong((id *)&self->_getChangesQueue, 0);
  objc_storeStrong((id *)&self->_enableCloudMergeQueue, 0);
  objc_storeStrong((id *)&self->_cloudCollectionsManager, 0);
  objc_storeStrong((id *)&self->_defaultSamplesCollection, 0);
  objc_storeStrong((id *)&self->_defaultWantToReadCollection, 0);
  objc_storeStrong((id *)&self->_defaultFinishedCollection, 0);
  objc_storeStrong((id *)&self->_defaultDownloadedCollection, 0);
  objc_storeStrong((id *)&self->_defaultPDFsCollection, 0);
  objc_storeStrong((id *)&self->_defaultAudioBooksCollection, 0);
  objc_storeStrong((id *)&self->_defaultBooksCollection, 0);
  objc_storeStrong((id *)&self->_defaultAllBooksCollection, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
  objc_storeStrong(&self->_uiManagerProviderForAddingToWantToRead, 0);
}

@end
