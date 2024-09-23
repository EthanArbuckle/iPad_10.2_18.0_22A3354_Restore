@implementation BCBookReadingTimeTracker

+ (BCBookReadingTimeTracker)sharedInstance
{
  if (qword_3113F0 != -1)
    dispatch_once(&qword_3113F0, &stru_292228);
  return (BCBookReadingTimeTracker *)(id)qword_3113E8;
}

- (BCBookReadingTimeTracker)initWithPersistenStoreDirectory:(id)a3
{
  id v4;
  BCBookReadingTimeTracker *v5;
  NSBundle *v6;
  void *v7;
  BCBookReadingTimeTracker *v8;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *seedRecentQueue;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *accessQueue;
  uint64_t v19;
  NSHashTable *promotionObservers;
  uint64_t v21;
  NSHashTable *sessionObservers;
  void *v23;
  NSString *v24;
  NSString *overridePersistentDirectory;
  NSManagedObjectModel *v26;
  NSManagedObjectModel *model;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSPersistentStoreCoordinator *v32;
  NSPersistentStoreCoordinator *psc;
  void *v34;
  NSPersistentStoreCoordinator *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  NSManagedObjectContext *v40;
  NSManagedObjectContext *moc;
  id v42;
  NSObject *v43;
  id v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  NSPersistentStoreCoordinator *v49;
  id v50;
  NSObject *v51;
  id v52;
  id v53;
  id v55;
  id v56;
  objc_super v57;
  _QWORD v58[3];
  _QWORD v59[3];

  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)BCBookReadingTimeTracker;
  v5 = -[BCBookReadingTimeTracker init](&v57, "init");
  if (v5)
  {
    v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BCBookReadingTimeTracker));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (BCBookReadingTimeTracker *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLForResource:withExtension:", CFSTR("RecentlyOpenedBooksDB"), CFSTR("momd")));

    if (!v8)
    {
      v44 = BCBookPromotionLog();
      v16 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1B874C();
      v8 = v5;
      v5 = 0;
      goto LABEL_27;
    }
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("com.apple.iBooks.BCBookReadingTimeTracker.seedRecentQueue", v10);
    seedRecentQueue = v5->_seedRecentQueue;
    v5->_seedRecentQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INITIATED, 0);
    v16 = objc_claimAutoreleasedReturnValue(v15);

    v17 = dispatch_queue_create("com.apple.iBooks.BCBookReadingTimeTracker.accessQueue", v16);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v17;

    v19 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    promotionObservers = v5->_promotionObservers;
    v5->_promotionObservers = (NSHashTable *)v19;

    v21 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    sessionObservers = v5->_sessionObservers;
    v5->_sessionObservers = (NSHashTable *)v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v23, "addObserver:selector:name:object:", v5, "_BDSCloudGlobalMetadataManagerFetchedRecordsChanged:", BDSCloudGlobalMetadataManagerFetchedRecordsChanged, 0);

    v24 = (NSString *)objc_msgSend(v4, "copy");
    overridePersistentDirectory = v5->_overridePersistentDirectory;
    v5->_overridePersistentDirectory = v24;

    v26 = (NSManagedObjectModel *)objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", v8);
    model = v5->_model;
    v5->_model = v26;

    if (!v5->_model)
      BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/BookPromotionEngine/BCBookReadingTimeTracker.m", 148, (uint64_t)"-[BCBookReadingTimeTracker initWithPersistenStoreDirectory:]", (uint64_t)"_model", CFSTR("Failed to load the managed object model from url: %@"), v28, v29, v30, (uint64_t)v8);
    -[BCBookReadingTimeTracker _createPersistentDirectoryIfNeeded](v5, "_createPersistentDirectoryIfNeeded");
    v58[0] = NSMigratePersistentStoresAutomaticallyOption;
    v58[1] = NSInferMappingModelAutomaticallyOption;
    v59[0] = &__kCFBooleanTrue;
    v59[1] = &__kCFBooleanTrue;
    v58[2] = NSPersistentStoreFileProtectionKey;
    v59[2] = NSFileProtectionNone;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 3));
    v32 = (NSPersistentStoreCoordinator *)objc_msgSend(objc_alloc((Class)NSPersistentStoreCoordinator), "initWithManagedObjectModel:", v5->_model);
    psc = v5->_psc;
    v5->_psc = v32;

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker _persistentStoreURL](v5, "_persistentStoreURL"));
    v35 = v5->_psc;
    v56 = 0;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v35, "addPersistentStoreWithType:configuration:URL:options:error:", NSSQLiteStoreType, 0, v34, v31, &v56));
    v37 = v56;
    v38 = v37;
    if (v36)
    {
      v39 = v37;
LABEL_7:
      v40 = (NSManagedObjectContext *)objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
      moc = v5->_moc;
      v5->_moc = v40;

      -[NSManagedObjectContext setPersistentStoreCoordinator:](v5->_moc, "setPersistentStoreCoordinator:", v5->_psc);
      -[NSManagedObjectContext setUndoManager:](v5->_moc, "setUndoManager:", 0);
      -[NSManagedObjectContext setMergePolicy:](v5->_moc, "setMergePolicy:", NSMergeByPropertyStoreTrumpMergePolicy);
      if (v5->_moc)
      {
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      v42 = BCBookPromotionLog();
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        sub_1B8804();
LABEL_25:

      v5 = 0;
      goto LABEL_26;
    }
    v45 = BCBookPromotionLog();
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      sub_1B8890();

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker _persistentStoreDirectory](v5, "_persistentStoreDirectory"));
    objc_msgSend(v47, "removeItemAtURL:error:", v48, 0);

    if (-[BCBookReadingTimeTracker _createPersistentDirectoryIfNeeded](v5, "_createPersistentDirectoryIfNeeded"))
    {
      v49 = v5->_psc;
      v55 = v38;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v49, "addPersistentStoreWithType:configuration:URL:options:error:", NSSQLiteStoreType, 0, v34, v31, &v55));
      v39 = v55;

      if (v36)
        goto LABEL_7;
      v50 = BCBookPromotionLog();
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        sub_1B87A4();
    }
    else
    {
      v52 = BCBookPromotionLog();
      v51 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        sub_1B8864();
      v39 = v38;
    }

    v53 = BCBookPromotionLog();
    v43 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      sub_1B8778();
    v36 = 0;
    goto LABEL_25;
  }
LABEL_28:

  return v5;
}

- (id)_getAssetsToPurge:(unint64_t)a3 request:(id *)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v19;
  const __CFString *v20;

  v9 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BCAssetToPurge"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K >= %lu"), CFSTR("launches"), a3));
  objc_msgSend(v9, "setPredicate:", v10);

  v20 = CFSTR("assetID");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  objc_msgSend(v9, "setPropertiesToFetch:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
  v19 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "executeFetchRequest:error:", v9, &v19));
  v14 = v19;

  if (v14)
  {
    v15 = BCBookPromotionLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1B88F0((uint64_t)v14, a3, v16);
    v17 = 0;
  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", CFSTR("assetID")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bu_arrayByRemovingNSNulls](v16, "bu_arrayByRemovingNSNulls"));
  }

  if (a4)
    *a4 = objc_retainAutorelease(v9);
  if (a5)
    *a5 = objc_retainAutorelease(v14);

  return v17;
}

- (void)_stopTrackingAssetsToPurge:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BCBookReadingTimeTracker *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_13D2D0;
  v7[3] = &unk_28B808;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)scrubRecents
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  _QWORD v21[6];
  _QWORD v22[5];
  uint8_t buf[16];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_13D7B0;
  v28 = sub_13D7C0;
  v29 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v25[5], "objectForKey:", CFSTR("BCLastScrubRecentsDate")));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v6 = objc_msgSend(v4, "isDate:inSameDayAsDate:", v3, v5);

  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker libraryDelegate](self, "libraryDelegate"));
  if (v7)
    v8 = v6;
  else
    v8 = 1;

  if ((v8 & 1) == 0)
  {
    v9 = BCBookPromotionLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Purge Tracking: scrubRecents", buf, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BCJSConfiguration sharedInstance](BCJSConfiguration, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "oldestDateToKeepFinished"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker libraryDelegate](self, "libraryDelegate"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_13D7C8;
    v22[3] = &unk_292250;
    v22[4] = self;
    objc_msgSend(v13, "readingTimeTracker:cleanupBooksFinishedBefore:completion:", self, v12, v22);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BCJSConfiguration sharedInstance](BCJSConfiguration, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "oldestDateToAvoidPurgeOfSamples"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BCJSConfiguration sharedInstance](BCJSConfiguration, "sharedInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "oldestDateToAvoidPurgeOfBooks"));

    if (v15 && v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker libraryDelegate](self, "libraryDelegate"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_13D854;
      v21[3] = &unk_292278;
      v21[4] = self;
      v21[5] = &v24;
      objc_msgSend(v18, "recentsNotEngagedSinceDateForSamples:dateForNonSamples:completion:", v15, v17, v21);

    }
    else
    {
      v19 = BCBookPromotionLog();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_1B8A20();

    }
  }

  _Block_object_dispose(&v24, 8);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BCBookReadingTimeTracker;
  -[BCBookReadingTimeTracker dealloc](&v4, "dealloc");
}

- (id)_mocq_promoteAssetImmediatelyAndSave:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;

  -[BCBookReadingTimeTracker _mocq_promoteAssetID:](self, "_mocq_promoteAssetID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
  if (objc_msgSend(v4, "hasChanges"))
  {
    v10 = 0;
    v5 = objc_msgSend(v4, "save:", &v10);
    v6 = v10;
    if ((v5 & 1) == 0)
    {
      v7 = BCBookPromotionLog();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1B8AE0();

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_handleReadingWithAssetID:(id)a3 sessionID:(id)a4 sessionEvent:(int64_t)a5 trackerEventType:(unint64_t)a6 readingFeatureFlags:(int64_t)a7 successCompletion:(id)a8 failureCompletion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void (**v21)(id, _QWORD, void *);
  void *v22;
  void *v23;
  void (**v24)(id, _QWORD, void *);
  void *v25;
  void *v26;
  void (**v27)(id, _QWORD, void *);
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35[4];
  id location;
  NSErrorUserInfoKey v37;
  const __CFString *v38;
  NSErrorUserInfoKey v39;
  const __CFString *v40;
  NSErrorUserInfoKey v41;
  const __CFString *v42;

  v15 = a3;
  v16 = a4;
  v17 = a8;
  v18 = a9;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker libraryDelegate](self, "libraryDelegate"));

  if (v19)
  {
    if (objc_msgSend(v15, "length"))
    {
      if (v16)
      {
        objc_initWeak(&location, self);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker libraryDelegate](self, "libraryDelegate"));
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_13E048;
        v30[3] = &unk_2922C8;
        objc_copyWeak(v35, &location);
        v35[1] = (id)a5;
        v33 = v18;
        v31 = v16;
        v35[2] = (id)a6;
        v32 = v15;
        v35[3] = (id)a7;
        v34 = v17;
        objc_msgSend(v20, "readingTimeTracker:isAssetTrackedAsRecent:completion:", self, v32, v30);

        objc_destroyWeak(v35);
        objc_destroyWeak(&location);
      }
      else
      {
        v27 = (void (**)(id, _QWORD, void *))objc_retainBlock(v18);
        if (v27)
        {
          v37 = NSLocalizedDescriptionKey;
          v38 = CFSTR("No session identifier.");
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BCBookReadingTimeTracker"), -3000, v28));
          v27[2](v27, 0, v29);

        }
      }
    }
    else
    {
      v24 = (void (**)(id, _QWORD, void *))objc_retainBlock(v18);
      if (v24)
      {
        v39 = NSLocalizedDescriptionKey;
        v40 = CFSTR("No asset identifier.");
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BCBookReadingTimeTracker"), -2000, v25));
        v24[2](v24, 0, v26);

      }
    }
  }
  else
  {
    v21 = (void (**)(id, _QWORD, void *))objc_retainBlock(v18);
    if (v21)
    {
      v41 = NSLocalizedDescriptionKey;
      v42 = CFSTR("No library delegate.");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BCBookReadingTimeTracker"), -1000, v22));
      v21[2](v21, 0, v23);

    }
  }

}

- (void)_mocqSessionID:(id)a3 sessionEvent:(int64_t)a4 trackerEventType:(unint64_t)a5 asset:(id)a6 assetID:(id)a7 isTrackedAsRecent:(BOOL)a8 canBePromoted:(BOOL)a9 isSample:(BOOL)a10 readingFeatureFlags:(int64_t)a11 successCompletion:(id)a12 failureCompletion:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  id v41;
  NSObject *v42;
  id v43;
  void *v44;
  id v45;
  NSObject *v46;
  id v47;
  void *v48;
  id v49;
  NSObject *v50;
  _QWORD *v51;
  id v52;
  void *v53;
  void (**v54)(void);
  void (**v55)(void);
  void (*v56)(void);
  void (**v57)(void);
  id v58;
  id v59;
  id v60;
  id v61;
  _BOOL4 v62;
  id v63;
  _QWORD block[5];
  _QWORD v65[4];
  id v66;
  BCBookReadingTimeTracker *v67;
  id v68;
  unint64_t v69;
  int64_t v70;
  BOOL v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  id v78;
  __int16 v79;
  id v80;
  _BYTE v81[128];

  v62 = a8;
  v18 = a3;
  v19 = a6;
  v20 = a7;
  v21 = a12;
  v22 = a13;
  v23 = v22;
  if (a4 != 2)
  {
    if (a4 != 1)
    {
      v24 = v20;
      if (!a4)
      {
        v59 = v22;
        v60 = v21;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker sessionObservers](self, "sessionObservers"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allObjects"));

        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v74;
          do
          {
            for (i = 0; i != v28; i = (char *)i + 1)
            {
              if (*(_QWORD *)v74 != v29)
                objc_enumerationMutation(v26);
              objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i), "timeTracker:didBeginTrackingSession:trackerEventType:asset:readingFeatureFlags:", self, v18, a5, v19, a11);
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
          }
          while (v28);
        }

        v31 = BCBookPromotionLog();
        v32 = objc_claimAutoreleasedReturnValue(v31);
        v24 = v20;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v78 = v18;
          v79 = 2112;
          v80 = v20;
          _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "Beginning tracking session %{public}@ for asset %@.", buf, 0x16u);
        }

        v72 = 0;
        -[BCBookReadingTimeTracker _mocq_trackSessionBegin:assetID:error:](self, "_mocq_trackSessionBegin:assetID:error:", v18, v20, &v72);
        v58 = v72;
        if (v62)
        {
          v23 = v59;
          if (a5 != 4)
          {
            v33 = BCBookPromotionLog();
            v34 = objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v78 = v20;
              _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "Updating asset %@ right away since it's already promoted", buf, 0xCu);
            }

            -[BCBookReadingTimeTracker promoteTrackedAsset:promoteIfNotTracked:](self, "promoteTrackedAsset:promoteIfNotTracked:", v20, 1);
          }
          v35 = v60;
          v36 = objc_retainBlock(v60);
          v37 = v36;
          if (v36)
            (*((void (**)(id, uint64_t, id))v36 + 2))(v36, 1, v19);
        }
        else
        {
          v65[0] = _NSConcreteStackBlock;
          v65[1] = 3221225472;
          v65[2] = sub_13E92C;
          v65[3] = &unk_28FB20;
          v66 = v20;
          v67 = self;
          v71 = a10;
          v68 = v18;
          v69 = a5;
          v70 = a11;
          v51 = objc_retainBlock(v65);
          ((void (*)(void))v51[2])();
          v35 = v60;
          v52 = objc_retainBlock(v60);
          v53 = v52;
          v23 = v59;
          if (v52)
            (*((void (**)(id, _QWORD, id))v52 + 2))(v52, 0, v19);

          v37 = v66;
        }

        v21 = v35;
      }
      goto LABEL_50;
    }
    v61 = v21;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_13EA0C;
    block[3] = &unk_28B960;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v41 = BCBookPromotionLog();
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v78 = v18;
      v79 = 2112;
      v80 = v20;
      _os_log_impl(&dword_0, v42, OS_LOG_TYPE_DEFAULT, "Ending tracking session %{public}@ for asset %@.", buf, 0x16u);
    }

    v63 = 0;
    -[BCBookReadingTimeTracker _mocq_trackSessionEnd:assetID:error:](self, "_mocq_trackSessionEnd:assetID:error:", v18, v20, &v63);
    v43 = v63;
    v44 = v43;
    if (v62)
    {
      if (a5 - 4 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v45 = BCBookPromotionLog();
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v78 = v20;
          _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "Updating asset %@ right away since it's already promoted", buf, 0xCu);
        }

        -[BCBookReadingTimeTracker promoteTrackedAsset:promoteIfNotTracked:](self, "promoteTrackedAsset:promoteIfNotTracked:", v20, 1);
      }
      v47 = objc_retainBlock(v61);
      v48 = v47;
      if (v47)
        (*((void (**)(id, BOOL, id))v47 + 2))(v47, a9, v19);

      v24 = v20;
      goto LABEL_48;
    }
    if (a9)
    {
      v49 = BCBookPromotionLog();
      v50 = objc_claimAutoreleasedReturnValue(v49);
      v24 = v20;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        sub_1B8BF4();

      v21 = v61;
      -[BCBookReadingTimeTracker _mocq_runBookPromotionAlgorithmForAssetID:libraryAsset:isSample:successCompletion:failureCompletion:](self, "_mocq_runBookPromotionAlgorithmForAssetID:libraryAsset:isSample:successCompletion:failureCompletion:", v20, v19, a10, v61, v23);
      goto LABEL_49;
    }
    v24 = v20;
    if (v43)
    {
      v54 = objc_retainBlock(v23);
      v55 = v54;
      if (v54)
      {
        v56 = v54[2];
LABEL_46:
        v56();
      }
    }
    else
    {
      v57 = (void (**)(void))objc_retainBlock(v61);
      v55 = v57;
      if (v57)
      {
        v56 = v57[2];
        goto LABEL_46;
      }
    }

LABEL_48:
    v21 = v61;
LABEL_49:

    goto LABEL_50;
  }
  v38 = v21;
  v39 = BCBookPromotionLog();
  v40 = objc_claimAutoreleasedReturnValue(v39);
  v24 = v20;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v78 = v18;
    v79 = 2112;
    v80 = v20;
    _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "Updating session %{public}@ for untracked asset %@.", buf, 0x16u);
  }

  -[BCBookReadingTimeTracker _mocq_trackSessionUpdate:assetID:error:](self, "_mocq_trackSessionUpdate:assetID:error:", v18, v20, 0);
  v21 = v38;
  -[BCBookReadingTimeTracker _mocq_runBookPromotionAlgorithmForAssetID:libraryAsset:isSample:successCompletion:failureCompletion:](self, "_mocq_runBookPromotionAlgorithmForAssetID:libraryAsset:isSample:successCompletion:failureCompletion:", v20, v19, a10, v38, v23);
LABEL_50:

}

- (void)trackReadingSessionBeganWithAssetID:(id)a3 sessionID:(id)a4 trackerEventType:(unint64_t)a5 readingFeatureFlags:(int64_t)a6 completion:(id)a7
{
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_13EAFC;
  v15[3] = &unk_2922F0;
  v16 = a7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_13EB48;
  v13[3] = &unk_290528;
  v14 = v16;
  v12 = v16;
  -[BCBookReadingTimeTracker _handleReadingWithAssetID:sessionID:sessionEvent:trackerEventType:readingFeatureFlags:successCompletion:failureCompletion:](self, "_handleReadingWithAssetID:sessionID:sessionEvent:trackerEventType:readingFeatureFlags:successCompletion:failureCompletion:", a3, a4, 0, a5, a6, v15, v13);

}

- (void)trackReadingSessionEndedWithAssetID:(id)a3 sessionID:(id)a4 trackerEventType:(unint64_t)a5 readingFeatureFlags:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  int64_t v26;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_13ECF0;
  v21[3] = &unk_292318;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v25 = a5;
  v26 = a6;
  v24 = v14;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_13EFE8;
  v18[3] = &unk_292340;
  v19 = v23;
  v20 = v24;
  v15 = v24;
  v16 = v23;
  v17 = v12;
  -[BCBookReadingTimeTracker _handleReadingWithAssetID:sessionID:sessionEvent:trackerEventType:readingFeatureFlags:successCompletion:failureCompletion:](self, "_handleReadingWithAssetID:sessionID:sessionEvent:trackerEventType:readingFeatureFlags:successCompletion:failureCompletion:", v17, v16, 1, a5, a6, v21, v18);

}

- (void)_readingTimeTrackerGetAssetDetailsForAssetID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker libraryDelegate](self, "libraryDelegate"));

  if (!v8)
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/BookPromotionEngine/BCBookReadingTimeTracker.m", 585, (uint64_t)"-[BCBookReadingTimeTracker _readingTimeTrackerGetAssetDetailsForAssetID:completion:]", (uint64_t)"self.libraryDelegate", 0, v9, v10, v11, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker libraryDelegate](self, "libraryDelegate"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker libraryDelegate](self, "libraryDelegate"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_13F1C0;
    v17[3] = &unk_292368;
    v19 = v7;
    v17[4] = self;
    v18 = v6;
    objc_msgSend(v13, "readingTimeTracker:isAssetTrackedAsRecent:completion:", self, v18, v17);

  }
  else
  {
    v14 = objc_retainBlock(v7);
    v15 = v14;
    if (v14)
      (*((void (**)(id, _QWORD, _QWORD, double))v14 + 2))(v14, 0, 0, 0.0);

  }
}

- (void)purgeRecentBooks
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_13F6C0;
  block[3] = &unk_28B960;
  block[4] = self;
  if (qword_3113F8 != -1)
    dispatch_once(&qword_3113F8, block);
}

- (void)_purgeRecentBooksList:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_13F888;
  v9[3] = &unk_2923D0;
  v11 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performBlock:", v9);

}

- (BOOL)_readyToCheck
{
  _BOOL4 v3;

  v3 = -[BCBookReadingTimeTracker readyToSeedRecentBooksList](self, "readyToSeedRecentBooksList");
  if (v3)
    LOBYTE(v3) = -[BCBookReadingTimeTracker globalMetadataFetched](self, "globalMetadataFetched");
  return v3;
}

- (void)_BDSCloudGlobalMetadataManagerFetchedRecordsChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker seedRecentQueue](self, "seedRecentQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_13FEB0;
  block[3] = &unk_28B960;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)seedRecentBooksList:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker seedRecentQueue](self, "seedRecentQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_13FF54;
  v6[3] = &unk_28B938;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)_seedRecentBooksList
{
  void *v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  BCBookReadingTimeTracker *v11;

  if (-[BCBookReadingTimeTracker _readyToCheck](self, "_readyToCheck"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker libraryDelegate](self, "libraryDelegate"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_140078;
    v8[3] = &unk_292438;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[BDSCloudGlobalMetadataManager sharedManager](BDSCloudGlobalMetadataManager, "sharedManager"));
    v10 = v3;
    v11 = self;
    v4 = v3;
    v5 = v9;
    objc_msgSend(v5, "metadataValueForKey:completion:", CFSTR("BCDeviceWasSeededWithARecentsList"), v8);
    if (!v5)
    {
      v6 = BCBookPromotionLog();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1B90A4();

    }
  }
}

- (void)addPromotionObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_140380;
  block[3] = &unk_28BD80;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)removePromotionObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_140484;
  block[3] = &unk_28BD80;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)addSessionObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_140588;
  block[3] = &unk_28BD80;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)removeSessionObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_14068C;
  block[3] = &unk_28BD80;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_persistentStoreURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker _persistentStoreDirectory](self, "_persistentStoreDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("BCRecentlyOpenedBooksDB.sqlite")));

  return v3;
}

- (id)_persistentStoreDirectory
{
  void *v3;
  void *v4;
  NSArray *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker overridePersistentDirectory](self, "overridePersistentDirectory"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker overridePersistentDirectory](self, "overridePersistentDirectory"));
  }
  else
  {
    v5 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("BCRecentlyOpenedBooksDB")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v7, 1));

  return v8;
}

- (BOOL)_createPersistentDirectoryIfNeeded
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  id v6;
  NSObject *v7;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker _persistentStoreDirectory](self, "_persistentStoreDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = 0;
  v4 = objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v9);
  v5 = v9;

  if ((v4 & 1) == 0)
  {
    v6 = BCBookPromotionLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1B90D0();

  }
  return v4;
}

- (id)_fetchRequestForReadingSession:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BCAssetReadingSession"));
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("assetID"), v3));

  objc_msgSend(v4, "setPredicate:", v5);
  return v4;
}

- (void)_cleanupFinishedBooksFromLibraryExcluding:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker libraryDelegate](self, "libraryDelegate"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1409A4;
  v6[3] = &unk_292250;
  v6[4] = self;
  objc_msgSend(v5, "readingTimeTracker:cleanupFinishedBooksExcluding:completion:", self, v4, v6);

}

- (void)_cleanupBooksMarkedAsFinished:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BCBookReadingTimeTracker *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_140AC8;
  v7[3] = &unk_28B808;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)promoteTrackedAsset:(id)a3 promoteIfNotTracked:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BCBookReadingTimeTracker *v11;
  BOOL v12;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker libraryDelegate](self, "libraryDelegate"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_140EC0;
  v9[3] = &unk_292460;
  v12 = v4;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v7, "readingTimeTracker:updateRecentBook:promoteIfNotTracked:completion:", self, v8, v4, v9);

}

- (id)_mocq_readingSessionWithAssetID:(id)a3 sessionID:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v18;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BCAssetReadingSession"));
  objc_msgSend(v8, "setReturnsObjectsAsFaults:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@ && %K == %@"), CFSTR("assetID"), v7, CFSTR("sessionID"), v9));
  objc_msgSend(v8, "setPredicate:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
  v18 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "executeFetchRequest:error:", v8, &v18));
  v13 = v18;

  if (!v12 && v13)
  {
    v14 = BCBookPromotionLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1B9258();

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

  return v16;
}

- (void)_mocq_promoteAssetID:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  v5 = BCBookPromotionLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Promoting %@ to recent books list.", (uint8_t *)&v10, 0xCu);
  }

  if (BUIsRunningTests())
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("BCTrackedAsset"), v7));

    objc_msgSend(v8, "setAssetID:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v8, "setLastOpenedDate:", v9);

  }
  -[BCBookReadingTimeTracker promoteTrackedAsset:promoteIfNotTracked:](self, "promoteTrackedAsset:promoteIfNotTracked:", v4, 1);

}

- (void)_mocq_runBookPromotionAlgorithmForAssetID:(id)a3 libraryAsset:(id)a4 isSample:(BOOL)a5 successCompletion:(id)a6 failureCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *activity;
  _QWORD block[4];
  id v22;
  BCBookReadingTimeTracker *v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  activity = _os_activity_create(&dword_0, "Books/reading-promotion-readingNow", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_141734;
  block[3] = &unk_292488;
  v27 = a5;
  v22 = v12;
  v23 = self;
  v25 = v15;
  v26 = v14;
  v24 = v13;
  v16 = v13;
  v17 = v14;
  v18 = v15;
  v19 = v12;
  os_activity_apply(activity, block);

}

- (id)mq_trackedAssetForAssetID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BCTrackedAsset"));
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v5, "setFetchLimit:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("assetID"), v4));

  objc_msgSend(v5, "setPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
  v14 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v5, &v14));
  v9 = v14;

  if (!v8 && v9)
  {
    v10 = BCBookPromotionLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1B9378();

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  return v12;
}

- (BOOL)_mocq_trackSessionBegin:(id)a3 assetID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  NSObject *v22;

  v8 = a3;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker _mocq_readingSessionWithAssetID:sessionID:](self, "_mocq_readingSessionWithAssetID:sessionID:", v9, v8));
  if (v10)
  {
    v11 = (void *)v10;
    v12 = BCBookPromotionLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1B9438();

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v11, "setTimeOpened:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    objc_msgSend(v11, "setSessionID:", v15);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("BCAssetReadingSession"), v16));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v11, "setTimeOpened:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    objc_msgSend(v11, "setSessionID:", v18);

    objc_msgSend(v11, "setAssetID:", v9);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
  v20 = objc_msgSend(v19, "save:", a5);

  if ((v20 & 1) == 0)
  {
    v21 = BCBookPromotionLog();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1B93D8();

  }
  return v20;
}

- (BOOL)_mocq_trackSessionEnd:(id)a3 assetID:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker _mocq_readingSessionWithAssetID:sessionID:](self, "_mocq_readingSessionWithAssetID:sessionID:", v8, a3));
  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v9, "setTimeClosed:", v10);
  }
  else
  {
    v11 = BCBookPromotionLog();
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1B94FC();
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
  v13 = objc_msgSend(v12, "save:", a5);

  if ((v13 & 1) == 0)
  {
    v14 = BCBookPromotionLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1B9498();

  }
  return v13;
}

- (BOOL)_mocq_trackSessionUpdate:(id)a3 assetID:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker _mocq_readingSessionWithAssetID:sessionID:](self, "_mocq_readingSessionWithAssetID:sessionID:", v8, a3));
  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v9, "setTimeUpdated:", v10);
  }
  else
  {
    v11 = BCBookPromotionLog();
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1B94FC();
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
  v13 = objc_msgSend(v12, "save:", a5);

  if ((v13 & 1) == 0)
  {
    v14 = BCBookPromotionLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1B9498();

  }
  return v13;
}

- (void)_mq_startBookPromotionTimerForSession:(id)a3 assetID:(id)a4 isSample:(BOOL)a5 trackerEventType:(unint64_t)a6 readingFeatureFlags:(int64_t)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  BCBookReadingTimeTracker *v25;
  id v26;
  int64_t v27;
  unint64_t v28;

  v12 = a3;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker bookPromotionTimer](self, "bookPromotionTimer"));
  objc_msgSend(v14, "invalidate");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BCJSConfiguration sharedInstance](BCJSConfiguration, "sharedInstance"));
  v16 = v15;
  if (a5)
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timeThresholdForSamplePromotion"));
  else
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timeThresholdForPromotion"));
  v18 = v17;
  v19 = objc_msgSend(v17, "longLongValue");

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_142338;
  v22[3] = &unk_2924D8;
  v23 = v12;
  v24 = v13;
  v25 = self;
  v26 = v19;
  v27 = a7;
  v28 = a6;
  v20 = v13;
  v21 = v12;
  -[BCBookReadingTimeTracker _readingTimeTrackerGetAssetDetailsForAssetID:completion:](self, "_readingTimeTrackerGetAssetDetailsForAssetID:completion:", v20, v22);

}

- (void)_handledUpdateReadingSessionTimer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SessionID")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AssetID")));

  v8 = objc_opt_class(NSNumber);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ReadingFeatureFlagsKey")));
  v11 = BUDynamicCast(v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_msgSend(v12, "integerValue");

  -[BCBookReadingTimeTracker _mq_clearBookPromotionTimer](self, "_mq_clearBookPromotionTimer");
  -[BCBookReadingTimeTracker _handleReadingWithAssetID:sessionID:sessionEvent:trackerEventType:readingFeatureFlags:successCompletion:failureCompletion:](self, "_handleReadingWithAssetID:sessionID:sessionEvent:trackerEventType:readingFeatureFlags:successCompletion:failureCompletion:", v7, v14, 2, 8, v13, 0, 0);

}

- (void)_mq_clearBookPromotionTimer
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker bookPromotionTimer](self, "bookPromotionTimer"));
  objc_msgSend(v3, "invalidate");

  -[BCBookReadingTimeTracker setBookPromotionTimer:](self, "setBookPromotionTimer:", 0);
}

- (int64_t)_mocq_deleteSessionsForAsset:(id)a3 beforeTime:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BCAssetReadingSession"));
  objc_msgSend(v8, "setReturnsObjectsAsFaults:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@ && %K <= %@"), CFSTR("assetID"), v6, CFSTR("timeOpened"), v7));

  objc_msgSend(v8, "setPredicate:", v9);
  v10 = objc_msgSend(objc_alloc((Class)NSBatchDeleteRequest), "initWithFetchRequest:", v8);
  objc_msgSend(v10, "setResultType:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
  v24 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "executeRequest:error:", v10, &v24));
  v13 = v24;

  v14 = objc_opt_class(NSNumber);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "result"));
  v16 = BUDynamicCast(v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = objc_msgSend(v17, "integerValue");

  v19 = BCBookPromotionLog();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v26 = v18;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Deleted %{public}ld rows for asset: %@", buf, 0x16u);
  }

  if (v13)
  {
    v21 = BCBookPromotionLog();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1B9528();

  }
  return (int64_t)v18;
}

- (id)_mocq_assetToPurgeForAssetID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BCAssetToPurge"));
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v5, "setFetchLimit:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("assetID"), v4));

  objc_msgSend(v5, "setPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
  v14 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v5, &v14));
  v9 = v14;

  if (v9)
  {
    v10 = BCBookPromotionLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1B9588();

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  return v12;
}

- (void)_mocq_deleteAssetToPurgeForAssetID:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;

  v4 = a3;
  v5 = BCBookPromotionLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Purge Tracking: delete asset=%@", buf, 0xCu);
  }

  v7 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BCTrackedAsset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("assetID"), v4));
  objc_msgSend(v7, "setPredicate:", v8);

  v9 = objc_msgSend(objc_alloc((Class)NSBatchDeleteRequest), "initWithFetchRequest:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker psc](self, "psc"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
  v16 = 0;
  v12 = objc_msgSend(v10, "executeRequest:withContext:error:", v9, v11, &v16);
  v13 = v16;

  if (v13)
  {
    v14 = BCBookPromotionLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1B95E8();

  }
}

- (BOOL)_mocq_updateLaunchTrackingForAssets:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  id v23;
  NSObject *v24;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];

  v5 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker _mocq_assetToPurgeForAssetID:](self, "_mocq_assetToPurgeForAssetID:", v10));
        if (v11)
        {
          v12 = v11;
          v13 = objc_msgSend(v11, "launches") + 1;
          v14 = v12;
        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("BCAssetToPurge"), v15));

          objc_msgSend(v12, "setAssetID:", v10);
          v14 = v12;
          v13 = 1;
        }
        objc_msgSend(v14, "setLaunches:", v13);
        v16 = BCBookPromotionLog();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v12, "launches")));
          *(_DWORD *)buf = 138412546;
          v33 = v18;
          v34 = 2112;
          v35 = v19;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Purge Tracking: asset=%@ launches=%@", buf, 0x16u);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v7);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
  v27 = 0;
  v21 = objc_msgSend(v20, "save:", &v27);
  v22 = v27;

  if ((v21 & 1) == 0)
  {
    v23 = BCBookPromotionLog();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_1B9648();

  }
  if (a4)
    *a4 = objc_retainAutorelease(v22);

  return v22 == 0;
}

- (void)_fetchBookStatusWithAssetID:(id)a3 completion:(id)a4
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_142F1C;
  v11[3] = &unk_28B750;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)_fetchRecentBooksList:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1432C8;
  v7[3] = &unk_28C080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)_sessionExistsForSessionID:(id)a3 assetID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookReadingTimeTracker moc](self, "moc"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1435FC;
  v15[3] = &unk_28C190;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  objc_msgSend(v11, "performBlock:", v15);

}

- (BCBookReadingTimeTrackerLibraryDelegate)libraryDelegate
{
  return (BCBookReadingTimeTrackerLibraryDelegate *)objc_loadWeakRetained((id *)&self->_libraryDelegate);
}

- (void)setLibraryDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_libraryDelegate, a3);
}

- (NSManagedObjectModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSPersistentStoreCoordinator)psc
{
  return self->_psc;
}

- (void)setPsc:(id)a3
{
  objc_storeStrong((id *)&self->_psc, a3);
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void)setMoc:(id)a3
{
  objc_storeStrong((id *)&self->_moc, a3);
}

- (NSString)overridePersistentDirectory
{
  return self->_overridePersistentDirectory;
}

- (void)setOverridePersistentDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (OS_dispatch_queue)seedRecentQueue
{
  return self->_seedRecentQueue;
}

- (void)setSeedRecentQueue:(id)a3
{
  objc_storeStrong((id *)&self->_seedRecentQueue, a3);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (BOOL)globalMetadataFetched
{
  return self->_globalMetadataFetched;
}

- (void)setGlobalMetadataFetched:(BOOL)a3
{
  self->_globalMetadataFetched = a3;
}

- (BOOL)readyToSeedRecentBooksList
{
  return self->_readyToSeedRecentBooksList;
}

- (void)setReadyToSeedRecentBooksList:(BOOL)a3
{
  self->_readyToSeedRecentBooksList = a3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (NSTimer)bookPromotionTimer
{
  return self->_bookPromotionTimer;
}

- (void)setBookPromotionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_bookPromotionTimer, a3);
}

- (NSHashTable)promotionObservers
{
  return self->_promotionObservers;
}

- (void)setPromotionObservers:(id)a3
{
  objc_storeStrong((id *)&self->_promotionObservers, a3);
}

- (NSHashTable)sessionObservers
{
  return self->_sessionObservers;
}

- (void)setSessionObservers:(id)a3
{
  objc_storeStrong((id *)&self->_sessionObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionObservers, 0);
  objc_storeStrong((id *)&self->_promotionObservers, 0);
  objc_storeStrong((id *)&self->_bookPromotionTimer, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_seedRecentQueue, 0);
  objc_storeStrong((id *)&self->_overridePersistentDirectory, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_psc, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_libraryDelegate);
}

@end
