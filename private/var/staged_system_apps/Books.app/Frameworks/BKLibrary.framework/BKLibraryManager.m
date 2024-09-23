@implementation BKLibraryManager

+ (void)initialize
{
  id v2;

  if ((id)objc_opt_class(BKLibraryManager) == a1)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v2, "registerDefaults:", &off_C9D40);

  }
}

+ (id)defaultManager
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, const __CFString *);
  _Unwind_Exception *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  if (!qword_DE450)
  {
    v2 = BKLibraryLog(a1);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_80324();

    if (os_variant_has_internal_diagnostics("com.apple.iBooks"))
    {
      v4 = getpid();
      v9 = 0;
      v10 = &v9;
      v11 = 0x2020000000;
      v5 = (void (*)(uint64_t, uint64_t, const __CFString *))off_DE478;
      v12 = off_DE478;
      if (!off_DE478)
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_3A0E0;
        v8[3] = &unk_C1680;
        v8[4] = &v9;
        sub_3A0E0((uint64_t)v8);
        v5 = (void (*)(uint64_t, uint64_t, const __CFString *))v10[3];
      }
      _Block_object_dispose(&v9, 8);
      if (!v5)
      {
        v7 = (_Unwind_Exception *)sub_80304();
        _Block_object_dispose(&v9, 8);
        _Unwind_Resume(v7);
      }
      v5(v4, 3135106305, CFSTR("managerWithDataSources: initializer not called!"));
    }
  }
  return (id)qword_DE450;
}

+ (id)managerWithDataSources:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v8;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8338;
  block[3] = &unk_C1400;
  v8 = a3;
  v3 = qword_DE458;
  v4 = v8;
  if (v3 != -1)
    dispatch_once(&qword_DE458, block);
  v5 = (id)qword_DE450;

  return v5;
}

- (void)initializeMostRecentPurchaseDateCacheIfNeeded
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];

  v2 = objc_opt_class(NSDate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("BKMostRecentPurchaseDateKey")));
  v5 = BUDynamicCast(v2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("BKMostRecentPurchaseDateKey"));

    v10 = BKLibraryLog(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "MRP: initialized cached mrp", v12, 2u);
    }

  }
}

- (void)clearMostRecentPurchaseDateCache
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("BKMostRecentPurchaseDateKey"));

  v5 = BKLibraryLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "MRP: cleared cached mrp", v7, 2u);
  }

}

- (id)_updateMostRecentPurchaseDateCacheFromDataSources
{
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  dispatch_time_t v9;
  intptr_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id obj;
  _QWORD v22[5];
  NSObject *v23;
  uint64_t *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  _BYTE v37[128];

  obj = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources"));
  objc_sync_enter(obj);
  v3 = dispatch_group_create();
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_88C4;
  v33 = sub_88D4;
  v34 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "mostRecentPurchaseDate:") & 1) != 0)
        {
          dispatch_group_enter(v3);
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_88DC;
          v22[3] = &unk_C1568;
          v24 = &v29;
          v22[4] = v8;
          v23 = v3;
          objc_msgSend(v8, "mostRecentPurchaseDate:", v22);

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v5);
  }

  v9 = dispatch_time(0, 5000000000);
  v10 = dispatch_group_wait(v3, v9);
  if (v10)
  {
    v11 = BKLibraryLog(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_80350();

  }
  v13 = (id)v30[5];
  objc_sync_enter(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v14, "setObject:forKey:", v30[5], CFSTR("BKMostRecentPurchaseDateKey"));

  v16 = BKLibraryLog(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v30[5];
    *(_DWORD *)buf = 138412290;
    v36 = v18;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "MRP: update cached mrp = %@", buf, 0xCu);
  }

  v19 = (id)v30[5];
  objc_sync_exit(v13);

  _Block_object_dispose(&v29, 8);
  objc_sync_exit(obj);

  return v19;
}

- (void)updateMostRecentPurchaseDateCacheFromLibrary
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_8A8C;
  v2[3] = &unk_C1590;
  v2[4] = self;
  -[BKLibraryManager performBackgroundReadOnlyBlock:](self, "performBackgroundReadOnlyBlock:", v2);
}

- (NSDate)mostRecentPurchaseDate
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = objc_opt_class(NSDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("BKMostRecentPurchaseDateKey")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (!v7)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager _updateMostRecentPurchaseDateCacheFromDataSources](self, "_updateMostRecentPurchaseDateCacheFromDataSources"));
  if (+[BCPPTConfig usePPTLaunchContent](BCPPTConfig, "usePPTLaunchContent"))
  {
    if (+[BCPPTConfig isReturningUser](BCPPTConfig, "isReturningUser"))
      v8 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    else
      v8 = 0;

    v7 = (void *)v8;
  }
  return (NSDate *)v7;
}

+ (id)sampleDataSourceIdentifier
{
  return CFSTR("com.apple.ibooks.plugin.Bookshelf.platformDataSource.SampleBooks");
}

+ (BOOL)isDirectoryFileName:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pathExtension"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("epub")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ibooks"));

  return v4;
}

+ (BOOL)isTestClass
{
  return 0;
}

- (BKLibraryManager)init
{
  id v3;
  void *v4;
  void *v5;
  BKLibraryManager *v6;

  v3 = objc_msgSend((id)objc_opt_class(self), "persistentStoreURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_opt_new(BDSServiceProxy);
  v6 = -[BKLibraryManager initWithPersistentStoreURL:bdsPriceTracker:](self, "initWithPersistentStoreURL:bdsPriceTracker:", v4, v5);

  return v6;
}

- (BKLibraryManager)initWithPersistentStoreURL:(id)a3 bdsPriceTracker:(id)a4
{
  id v6;
  uint64_t v7;
  NSMutableDictionary *notifyBlocksForNewAssets;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  dispatch_queue_attr_t v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *migrationDispatchQueue;
  void *v26;
  unsigned __int8 v27;
  BKLibraryManager *v28;
  id *v29;
  void *v30;
  id v31;
  id v32;
  dispatch_queue_attr_t v33;
  NSObject *v34;
  dispatch_queue_t v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  BKLibraryPriceManager *v61;
  id v62;
  dispatch_queue_attr_t v63;
  NSObject *v64;
  dispatch_queue_attr_t initially_inactive;
  NSObject *v66;
  dispatch_queue_t v67;
  id v68;
  dispatch_queue_attr_t v69;
  NSObject *v70;
  dispatch_queue_t v71;
  id v72;
  dispatch_queue_t v73;
  id v74;
  id v75;
  id v76;
  id v77;
  NSMutableDictionary *v78;
  id v79;
  dispatch_queue_attr_t v80;
  NSObject *v81;
  dispatch_queue_t v82;
  id v83;
  BKLibraryAssetDetailsManager *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  BKLibraryPriceTracker *v92;
  id v93;
  unsigned int v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  BKLibraryManager *v101;
  _QWORD v102[4];
  id v103;
  id location;
  _QWORD v105[4];
  id *v106;
  _QWORD v107[4];
  BKLibraryManager *v108;
  _QWORD v109[4];
  BKLibraryManager *v110;
  objc_super v111;
  _QWORD v112[2];
  _QWORD v113[2];

  v6 = a3;
  v98 = a4;
  kdebug_trace(725353716, 6, 0, 0, 0);
  v111.receiver = self;
  v111.super_class = (Class)BKLibraryManager;
  v101 = -[BKLibraryManager initWithPersistentStoreURL:](&v111, "initWithPersistentStoreURL:", v6);
  if (v101)
  {
    v101->_notifyLockForNewAssets._os_unfair_lock_opaque = 0;
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    notifyBlocksForNewAssets = v101->_notifyBlocksForNewAssets;
    v101->_notifyBlocksForNewAssets = (NSMutableDictionary *)v7;

    v9 = objc_msgSend((id)objc_opt_class(v101), "persistentStoreURL");
    v99 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("BKLibraryPerformancePredicates"));

    if (v11)
      v101->_usePerformancePredicates = 1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("BKLibraryClearDatabaseOnRestart"));

    if (v13)
    {
      v15 = BKLibraryLog(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        sub_80408();

      objc_msgSend(v100, "removeItemAtURL:error:", v99, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v17, "removeObjectForKey:", CFSTR("BKLibraryClearDatabaseOnRestart"));

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v19 = objc_msgSend(v18, "BOOLForKey:", CFSTR("BKLibraryClearImageCacheOnRestart"));

    if (v19)
    {
      +[BCCacheManager clearCacheFiles](BCCacheManager, "clearCacheFiles");
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v20, "removeObjectForKey:", CFSTR("BKLibraryClearImageCacheOnRestart"));

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "path"));
    v95 = objc_msgSend(v100, "fileExistsAtPath:isDirectory:", v21, 0);

    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = dispatch_queue_create("com.apple.iBooks.reloadSingleDispatchQueue", v23);
    migrationDispatchQueue = v101->_migrationDispatchQueue;
    v101->_migrationDispatchQueue = (OS_dispatch_queue *)v24;

    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "URLByDeletingLastPathComponent"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "path"));
    v27 = objc_msgSend(v100, "fileExistsAtPath:isDirectory:", v26, 0);

    if ((v27 & 1) == 0)
      objc_msgSend(v100, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v96, 1, 0, 0);
    v109[0] = _NSConcreteStackBlock;
    v109[1] = 3221225472;
    v109[2] = sub_9AA8;
    v109[3] = &unk_C1400;
    v110 = v101;
    v107[0] = _NSConcreteStackBlock;
    v107[1] = 3221225472;
    v107[2] = sub_9AB0;
    v107[3] = &unk_C1400;
    v28 = v110;
    v108 = v28;
    -[BKLibraryManager loadCoreDataPersistentStoreInitializedHandler:migrationHandler:](v28, "loadCoreDataPersistentStoreInitializedHandler:migrationHandler:", v109, v107);
    -[BKLibraryManager _readLibraryVesionInfo](v28, "_readLibraryVesionInfo");
    -[BKLibraryManager createSeriesUpdaterMoc](v28, "createSeriesUpdaterMoc");
    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472;
    v105[2] = sub_9B20;
    v105[3] = &unk_C1590;
    v29 = v28;
    v106 = v29;
    objc_msgSend(v29, "performBlockOnCollectionsWorkerQueueAndWait:", v105);
    if (v95)
    {
      objc_msgSend(v29, "setResetSeriesOnAllBooks:", objc_msgSend(v29, "_compareVersionWith:", CFSTR("0.0")) == 0);
      objc_msgSend(v29, "setResetSeriesOnAllBooks:", objc_msgSend(v29, "resetSeriesOnAllBooks") | (objc_msgSend(v29, "_compareVersionWith:", CFSTR("1.3")) == (char *)&dword_0 + 1));
      objc_msgSend(v29, "setResetSeriesOnAllBooks:", objc_msgSend(v29, "resetSeriesOnAllBooks") | (objc_msgSend(v29, "_compareVersionWith:", CFSTR("2.0")) == (char *)&dword_0 + 1));
      objc_msgSend(v29, "setNeedsResetNilAuthorsOnAllSeries:", objc_msgSend(v29, "_compareVersionWith:", CFSTR("1.1")) == (char *)&dword_0 + 1);
      objc_msgSend(v29, "setNeedsResetNilAuthorsOnAllBooks:", objc_msgSend(v29, "_compareVersionWith:", CFSTR("1.2")) == (char *)&dword_0 + 1);
      objc_msgSend(v29, "setNeedsResetSeriesStacksAndCollectionMembershipOnAllBooks:", objc_msgSend(v29, "_compareVersionWith:", CFSTR("1.5")) == (char *)&dword_0 + 1);
      objc_msgSend(v29, "setNeedsDuplicateCollectionMembersRemoved:", objc_msgSend(v29, "_compareVersionWith:", CFSTR("1.9")) == (char *)&dword_0 + 1);
    }
    if (objc_msgSend(v29, "_compareVersionWith:", CFSTR("1.8")) == (char *)&dword_0 + 1)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
      objc_msgSend(v30, "clearLastUsedStoreAccountID");

    }
    v31 = objc_alloc_init((Class)NSMutableDictionary);
    v32 = v29[36];
    v29[36] = v31;

    v33 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    v35 = dispatch_queue_create("com.apple.BKLibrary.ownershipSync", v34);
    v36 = v29[37];
    v29[37] = v35;

    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != %@ AND %K != %@"), CFSTR("contentType"), &off_C9D90, CFSTR("state"), &off_C9D90));
    v37 = objc_alloc((Class)BCManagedObjectIDMonitor);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "persistentStoreCoordinator"));
    v113[0] = CFSTR("state");
    v113[1] = CFSTR("dataSourceIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v113, 2));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v39));
    v41 = objc_msgSend(v37, "initWithContext:coordinator:entityName:predicate:mapProperty:propertiesOfInterest:observer:", 0, v38, CFSTR("BKLibraryAsset"), v97, CFSTR("assetID"), v40, v29);
    v42 = v29[34];
    v29[34] = v41;

    v43 = objc_alloc((Class)BCManagedObjectIDMonitor);
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "persistentStoreCoordinator"));
    v112[0] = CFSTR("state");
    v112[1] = CFSTR("dataSourceIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v112, 2));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v45));
    v47 = objc_msgSend(v43, "initWithContext:coordinator:entityName:predicate:mapProperty:propertiesOfInterest:observer:", 0, v44, CFSTR("BKLibraryAsset"), v97, CFSTR("temporaryAssetID"), v46, v29);
    v48 = v29[35];
    v29[35] = v47;

    v49 = objc_alloc_init((Class)NSMutableSet);
    v50 = v29[25];
    v29[25] = v49;

    v51 = objc_alloc_init((Class)NSMutableDictionary);
    v52 = v29[26];
    v29[26] = v51;

    v53 = objc_alloc_init((Class)NSMutableSet);
    v54 = v29[27];
    v29[27] = v53;

    v55 = objc_alloc_init((Class)NSMutableSet);
    v56 = v29[28];
    v29[28] = v55;

    v57 = objc_alloc_init((Class)NSOperationQueue);
    v58 = v29[10];
    v29[10] = v57;

    objc_msgSend(v29[10], "setMaxConcurrentOperationCount:", 4);
    objc_msgSend(v29[10], "setQualityOfService:", 25);
    v59 = objc_alloc_init((Class)NSOperationQueue);
    v60 = v29[11];
    v29[11] = v59;

    objc_msgSend(v29[11], "setMaxConcurrentOperationCount:", 4);
    objc_msgSend(v29[11], "setQualityOfService:", 17);
    v61 = -[BKLibraryPriceManager initWithLibraryManager:]([BKLibraryPriceManager alloc], "initWithLibraryManager:", v29);
    v62 = v29[12];
    v29[12] = v61;

    v63 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v64 = objc_claimAutoreleasedReturnValue(v63);
    initially_inactive = dispatch_queue_attr_make_initially_inactive(v64);
    v66 = objc_claimAutoreleasedReturnValue(initially_inactive);
    v67 = dispatch_queue_create("com.apple.iBooks.updatesScheduleQueue", v66);
    v68 = v29[21];
    v29[21] = v67;

    v69 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v70 = objc_claimAutoreleasedReturnValue(v69);
    v71 = dispatch_queue_create("com.apple.iBooks.dqSyncQueue", v70);
    v72 = v29[23];
    v29[23] = v71;

    v73 = dispatch_queue_create("com.apple.iBooks.completionQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    v74 = v29[24];
    v29[24] = v73;

    objc_initWeak(&location, v29);
    v75 = objc_alloc((Class)BUCoalescingCallBlock);
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472;
    v102[2] = sub_9B6C;
    v102[3] = &unk_C15B8;
    objc_copyWeak(&v103, &location);
    v76 = objc_msgSend(v75, "initWithNotifyBlock:notifyTimeout:blockDescription:notifyTimeoutBlock:", v102, 360, CFSTR("BKLibraryManager reload"), &stru_C15F8);
    v77 = v29[30];
    v29[30] = v76;

    v78 = objc_opt_new(NSMutableDictionary);
    v79 = v29[31];
    v29[31] = v78;

    v80 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v81 = objc_claimAutoreleasedReturnValue(v80);
    v82 = dispatch_queue_create("com.apple.iBooks.coalescedDataSourceReloadByIdentifierSync", v81);
    v83 = v29[32];
    v29[32] = v82;

    v84 = -[BKLibraryAssetDetailsManager initWithLibraryManager:]([BKLibraryAssetDetailsManager alloc], "initWithLibraryManager:", v29);
    objc_msgSend(v29, "setAssetDetailsManager:", v84);

    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "metadataObjectForKey:", CFSTR("BKLibraryIsMigrating")));
    LOBYTE(v66) = objc_msgSend(v85, "BOOLValue");

    if ((v66 & 1) != 0)
    {
      v86 = 1;
    }
    else
    {
      objc_msgSend(v29, "loadCachedMigrationData");
      v86 = v95 ^ 1;
    }
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v88 = objc_msgSend(v87, "BOOLForKey:", CFSTR("BKLibraryTestMigration"));

    if (v88)
    {
      v90 = BKLibraryLog(v89);
      v91 = objc_claimAutoreleasedReturnValue(v90);
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
        sub_803DC();

      v86 = 1;
    }
    objc_msgSend(v29, "setNeedsMigration:", v86);
    objc_msgSend(v29, "_performInitialDataBaseMaintenance");
    objc_msgSend(v29, "resetNextCollectionSort");
    v92 = -[BKLibraryPriceTracker initWithLibraryManager:bdsPriceTracker:]([BKLibraryPriceTracker alloc], "initWithLibraryManager:bdsPriceTracker:", v29, v98);
    v93 = v29[14];
    v29[14] = v92;

    objc_destroyWeak(&v103);
    objc_destroyWeak(&location);

  }
  kdebug_trace(725353716, 7, 0, 0, 0);

  return v101;
}

- (void)tearDownPersistentStores
{
  void *v3;
  BKLibraryManagedObjectContext *workerChildContext;
  void *v5;
  BKLibraryManagedObjectContext *collectionsWorkerChildContext;
  void *v7;
  BKLibraryManagedObjectContext *uiChildContext;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  BKLibraryManager *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  _QWORD v54[2];
  _BYTE v55[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager workerChildContext](self, "workerChildContext"));
  workerChildContext = self->_workerChildContext;
  self->_workerChildContext = 0;

  v32 = v3;
  objc_msgSend(v3, "performBlockAndWait:", &stru_C1618);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionsWorkerChildContext](self, "collectionsWorkerChildContext"));
  collectionsWorkerChildContext = self->_collectionsWorkerChildContext;
  self->_collectionsWorkerChildContext = 0;

  v31 = v5;
  objc_msgSend(v5, "performBlockAndWait:", &stru_C1638);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
  uiChildContext = self->_uiChildContext;
  self->_uiChildContext = 0;

  v30 = v7;
  objc_msgSend(v7, "performBlockAndWait:", &stru_C1658);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v54[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager ui_persistentStoreCoordinator](self, "ui_persistentStoreCoordinator"));
  v54[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 2));

  obj = v11;
  v35 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v44;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v44 != v34)
          objc_enumerationMutation(obj);
        v36 = v12;
        v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v12);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "persistentStores"));
        v15 = objc_msgSend(v14, "copy");

        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v40;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v40 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v19);
              v38 = 0;
              objc_msgSend(v13, "removePersistentStore:error:", v20, &v38);
              v21 = v38;
              v22 = v21;
              if (v21)
              {
                v23 = BKLibraryLog(v21);
                v24 = objc_claimAutoreleasedReturnValue(v23);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager persistentStoreURL](self, "persistentStoreURL"));
                  *(_DWORD *)buf = 138412802;
                  v48 = self;
                  v49 = 2112;
                  v50 = v20;
                  v51 = 2112;
                  v52 = v25;
                  _os_log_error_impl(&dword_0, v24, OS_LOG_TYPE_ERROR, "%@: Error removing persistent store %@ for persistentStoreURL: %@", buf, 0x20u);

                }
              }

              v19 = (char *)v19 + 1;
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
          }
          while (v17);
        }

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager persistentStoreURL](self, "persistentStoreURL"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager _persistentStoreOptions](self, "_persistentStoreOptions"));
        v37 = 0;
        objc_msgSend(v13, "destroyPersistentStoreAtURL:withType:options:error:", v26, NSSQLiteStoreType, v27, &v37);
        v28 = v37;

        if (v28 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager persistentStoreURL](self, "persistentStoreURL"));
          *(_DWORD *)buf = 138412546;
          v48 = self;
          v49 = 2112;
          v50 = v29;
          _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%@: Error destroying persistentStoreURL: %@", buf, 0x16u);

        }
        v12 = v36 + 1;
      }
      while ((id)(v36 + 1) != v35);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    }
    while (v35);
  }

}

- (void)_performInitialDataBaseMaintenance
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_A0B0;
  v2[3] = &unk_C1590;
  v2[4] = self;
  -[BKLibraryManager performNamed:workerQueueBlockAndWait:](self, "performNamed:workerQueueBlockAndWait:", CFSTR("_performInitialDataBaseMaintenance"), v2);
}

- (void)_cleanUpOrphanedSampleAssets:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isSample == 1 AND collectionMembers.@count == 0")));
  objc_msgSend(v3, "setPredicate:", v4);

  v5 = objc_msgSend(objc_alloc((Class)NSBatchDeleteRequest), "initWithFetchRequest:", v3);
  v6 = objc_msgSend(v7, "executeRequest:error:", v5, 0);

}

- (id)_assetIDsForCollectionID:(id)a3 moc:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v17;
  id v18;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("collection.collectionID == %@ AND (asset.isHidden == NO OR asset.isHidden == NULL) AND (asset.isEphemeral == NO OR asset.isEphemeral == NULL) AND asset.state != %@"), a3, &off_C9D90));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKCollectionMember")));
  objc_msgSend(v7, "setPredicate:", v6);
  v8 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("sortKey"), 1);
  v18 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  objc_msgSend(v7, "setSortDescriptors:", v9);

  v17 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v7, &v17));

  v11 = v17;
  v12 = v11;
  if (v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", CFSTR("assetID")));
  }
  else
  {
    v14 = BKLibraryLog(v11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_804E8();

    v13 = 0;
  }

  return v13;
}

- (void)_removeAllMembersFromCollection:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKCollectionMember")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("collection.collectionID == %@"), v5));
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(v7, "setFetchBatchSize:", 32);
  v22 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v7, &v22));
  v10 = v22;
  v11 = v10;
  if (v9)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v9;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v6, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i));
        }
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v14);
    }
  }
  else
  {
    v17 = BKLibraryLog(v10);
    v12 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_804E8();
  }

}

- (void)_sortUserCollectionToTop:(id)a3 moc:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKCollection")));
  v9 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("sortKey"), 0);
  v19 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  objc_msgSend(v8, "setSortDescriptors:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection predicateForNonDeletedUserCollections](BKCollection, "predicateForNonDeletedUserCollections"));
  objc_msgSend(v8, "setPredicate:", v11);

  v18 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v8, &v18));

  v13 = v18;
  v14 = v13;
  if (v12)
  {
    v15 = objc_msgSend(v12, "mutableCopy");
    v16 = -[NSObject indexOfObject:](v15, "indexOfObject:", v6);
    if (v16 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSObject removeObjectAtIndex:](v15, "removeObjectAtIndex:", v16);
      -[NSObject addObject:](v15, "addObject:", v6);
      if (+[BKUserSortOrderManager resortDescendingSortKeyedObjects:](BKUserSortOrderManager, "resortDescendingSortKeyedObjects:", v15))
      {
        -[BKLibraryManager resetNextCollectionSort](self, "resetNextCollectionSort");
        -[BKLibraryManager saveMetaData](self, "saveMetaData");
      }
    }
  }
  else
  {
    v17 = BKLibraryLog(v13);
    v15 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_804E8();
  }

}

- (void)_persistentStoreDidMigrate
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  uint8_t buf[16];

  v3 = BKLibraryLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Library Persistent Store did migrate.", buf, 2u);
  }

  -[BKLibraryManager setDidMigrateFromITunesSyncToICloudSync:](self, "setDidMigrateFromITunesSyncToICloudSync:", (char *)-[BKLibraryManager _compareVersionWith:](self, "_compareVersionWith:", CFSTR("1.7")) == (char *)&dword_0 + 1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_A800;
  v6[3] = &unk_C1590;
  v6[4] = self;
  -[BKLibraryManager performBlockOnCollectionsWorkerQueue:](self, "performBlockOnCollectionsWorkerQueue:", v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_A84C;
  v5[3] = &unk_C1590;
  v5[4] = self;
  -[BKLibraryManager performBlockOnCollectionsWorkerQueue:](self, "performBlockOnCollectionsWorkerQueue:", v5);
}

- (void)migrateToMyBooksWithAssetIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *j;
  id v35;
  void *v36;
  char v37;
  void *v38;
  NSObject *v39;
  BKLibraryManager *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  id v55;
  __int16 v56;
  id v57;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager _assetIDsForCollectionID:moc:](self, "_assetIDsForCollectionID:moc:", kBKCollectionDefaultIDBooks, v7));
    v9 = objc_msgSend(v6, "isEqualToArray:", v8);
    v10 = (char)v9;
    v11 = BKLibraryLog(v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if ((v10 & 1) != 0)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "My Books: Migration not needed for Books collection - collections match", buf, 2u);
      }
    }
    else
    {
      if (v13)
      {
        *(_DWORD *)buf = 134218240;
        v55 = objc_msgSend(v6, "count");
        v56 = 2048;
        v57 = -[NSObject count](v8, "count");
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "My Books: Migrating items in Books collection (old: %lu new: %lu).", buf, 0x16u);
      }

      v12 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionController](self, "collectionController"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[BCCollection identifierForMyBooksCollection](BCCollection, "identifierForMyBooksCollection"));
      v15 = objc_claimAutoreleasedReturnValue(-[NSObject mutableCollectionWithCollectionID:inManagedObjectContext:error:](v12, "mutableCollectionWithCollectionID:inManagedObjectContext:error:"));
      v42 = v15;
      if (v15)
      {
        v16 = (void *)v15;
        v17 = BKLibraryLog(v15);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "My Books: Found collection", buf, 2u);
        }
        v41 = 0;
      }
      else
      {
        v40 = self;
        v39 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionProvider](self, "collectionProvider"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject userCollectionsInManagedObjectContext:withError:](v39, "userCollectionsInManagedObjectContext:withError:", v7, 0));
        v20 = objc_alloc_init((Class)NSMutableArray);
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v21 = v19;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(_QWORD *)v49 != v24)
                objc_enumerationMutation(v21);
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1)
                                                                                 + 8 * (_QWORD)i), "title"));
              if (v26)
                objc_msgSend(v20, "addObject:", v26);

            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
          }
          while (v23);
        }

        v27 = objc_claimAutoreleasedReturnValue(+[BCCollection uniqueTitleForMyBooksCollection:](BCCollection, "uniqueTitleForMyBooksCollection:", v20));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection insertNewCollectionWithCollectionID:inManagedObjectContext:](BKCollection, "insertNewCollectionWithCollectionID:inManagedObjectContext:", v43, v7));
        v28 = BKLibraryLog(objc_msgSend(v16, "setTitle:", v27));
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "My Books: Created collection", buf, 2u);
        }
        v41 = (void *)v27;

        v18 = v39;
        self = v40;
      }

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v30 = v6;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v45;
        do
        {
          for (j = 0; j != v32; j = (char *)j + 1)
          {
            if (*(_QWORD *)v45 != v33)
              objc_enumerationMutation(v30);
            v35 = objc_msgSend(v16, "addCollectionMemberAvoidingDupesWithAssetID:sortKey:forceToTop:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j), 0, 0);
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        }
        while (v32);
      }

      if (!v42)
      {
        -[BKLibraryManager _sortUserCollectionToTop:moc:](self, "_sortUserCollectionToTop:moc:", v16, v7);
        objc_msgSend(v16, "setLocalModDate:", 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager delegate](self, "delegate"));
        v37 = objc_opt_respondsToSelector(v36, "didMigrateBooksCollection:");

        if ((v37 & 1) != 0)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager delegate](self, "delegate"));
          objc_msgSend(v38, "didMigrateBooksCollection:", v41);

        }
      }

    }
  }
  else
  {
    v14 = BKLibraryLog(0);
    v8 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "My Books: Migration not needed for Books collection - no assetIDs", buf, 2u);
    }
  }

}

- (void)_updateRelationshipsInContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *k;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD block[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];

  v4 = a3;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager migrationDispatchQueue](self, "migrationDispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B378;
  block[3] = &unk_C1680;
  block[4] = &v42;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v43 + 24))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("seriesID != NULL AND contentType != %@ AND seriesContainer == NULL"), &off_C9D90));
    objc_msgSend(v6, "setPredicate:", v7);

    objc_msgSend(v6, "setFetchBatchSize:", 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeFetchRequest:error:", v6, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          -[BKLibraryManager updateSeriesRelationshipsForSeriesAsset:](self, "updateSeriesRelationshipsForSeriesAsset:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "seriesContainer"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "seriesID"));
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
      }
      while (v11);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v17 = v9;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j)));
          -[BKLibraryManager _updateAuthorForSeriesContainer:](self, "_updateAuthorForSeriesContainer:", v21);

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
      }
      while (v18);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("contentType != %@ AND storePlaylistID != NULL AND isSupplementalContent == YES AND supplementalContentParent == NULL"), &off_C9DA8));
    objc_msgSend(v22, "setPredicate:", v23);

    objc_msgSend(v22, "setFetchBatchSize:", 32);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeFetchRequest:error:", v22, 0));
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v46, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v30;
      do
      {
        for (k = 0; k != v25; k = (char *)k + 1)
        {
          if (*(_QWORD *)v30 != v26)
            objc_enumerationMutation(v24);
          -[BKLibraryManager updateSupplementalContentRelationship:](self, "updateSupplementalContentRelationship:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)k));
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v46, 16);
      }
      while (v25);
    }

    v28 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager migrationDispatchQueue](self, "migrationDispatchQueue"));
    dispatch_sync(v28, &stru_C16A0);

  }
  _Block_object_dispose(&v42, 8);

}

- (void)_readLibraryVesionInfo
{
  void *v3;
  void *v4;
  void *v5;
  char *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager metadataObjectForKey:](self, "metadataObjectForKey:", CFSTR("BKLibraryVersion_Key")));
  v4 = v3;
  self->_majorVersion = 0;
  self->_minorVersion = 0;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(".")));
    v6 = (char *)objc_msgSend(v5, "count");
    if (v6 == (_BYTE *)&dword_0 + 2)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
      self->_majorVersion = (unint64_t)objc_msgSend(v7, "integerValue");

      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 1));
      self->_minorVersion = (unint64_t)-[NSObject integerValue](v8, "integerValue");
    }
    else
    {
      v9 = BKLibraryLog(v6);
      v8 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_80548();
    }

  }
  if ((objc_msgSend(CFSTR("2.0"), "isEqualToString:", v4) & 1) == 0)
  {
    -[BKLibraryManager setMetadataObject:forKey:](self, "setMetadataObject:forKey:", CFSTR("2.0"), CFSTR("BKLibraryVersion_Key"));
    -[BKLibraryManager saveMetaData](self, "saveMetaData");
  }

}

- (int64_t)_compareVersionWith:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  int64_t v11;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(".")));
  v6 = (char *)objc_msgSend(v5, "count");
  if (v6 == (_BYTE *)&dword_0 + 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    v8 = objc_msgSend(v7, "integerValue");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 1));
    v10 = objc_msgSend(v9, "integerValue");

    if (v8 == (id)-[BKLibraryManager majorVersion](self, "majorVersion"))
    {
      if (v10 == (id)-[BKLibraryManager minorVersion](self, "minorVersion"))
      {
        v11 = 0;
        goto LABEL_13;
      }
      v14 = v10 >= (id)-[BKLibraryManager minorVersion](self, "minorVersion");
    }
    else
    {
      v14 = v8 >= (id)-[BKLibraryManager majorVersion](self, "majorVersion");
    }
    if (v14)
      v11 = 1;
    else
      v11 = -1;
  }
  else
  {
    v12 = BKLibraryLog(v6);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_805A8();

    v11 = -1;
  }
LABEL_13:

  return v11;
}

- (void)_scheduleOperationGroupWithName:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  BKLibraryUpdateGroup *v8;
  NSObject *v9;
  BKLibraryUpdateGroup *v10;
  _QWORD v11[5];
  _QWORD block[5];
  BKLibraryUpdateGroup *v13;
  id v14;

  v6 = a4;
  if (v6)
  {
    v7 = a3;
    v8 = -[BKLibraryUpdateGroup initWithName:]([BKLibraryUpdateGroup alloc], "initWithName:", v7);

    v9 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager updatesScheduleQueue](self, "updatesScheduleQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_B708;
    block[3] = &unk_C16C8;
    block[4] = self;
    v13 = v8;
    v14 = v6;
    v10 = v8;
    dispatch_async(v9, block);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_B74C;
    v11[3] = &unk_C1400;
    v11[4] = self;
    -[BKLibraryUpdateGroup executeWithCompletion:](v10, "executeWithCompletion:", v11);

  }
}

- (void)_setupUICoreDataStack
{
  BKLibraryManagedObjectContext *v3;
  BKLibraryManagedObjectContext *uiChildContext;
  void *v5;
  id v6;

  v3 = -[BKLibraryManagedObjectContext initWithConcurrencyType:]([BKLibraryManagedObjectContext alloc], "initWithConcurrencyType:", 2);
  uiChildContext = self->_uiChildContext;
  self->_uiChildContext = v3;

  -[BKLibraryManagedObjectContext setName:](self->_uiChildContext, "setName:", CFSTR("UI Child Context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager ui_persistentStoreCoordinator](self, "ui_persistentStoreCoordinator"));
  -[BKLibraryManagedObjectContext setPersistentStoreCoordinator:](self->_uiChildContext, "setPersistentStoreCoordinator:", v5);

  -[BKLibraryManagedObjectContext setUndoManager:](self->_uiChildContext, "setUndoManager:", 0);
  -[BKLibraryManagedObjectContext setMergePolicy:](self->_uiChildContext, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
  -[BKLibraryManagedObjectContext setSessionContextType:](self->_uiChildContext, "setSessionContextType:", 5);
  -[BKLibraryManagedObjectContext setLibraryManager:](self->_uiChildContext, "setLibraryManager:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "uiManagedObjectContextDidSaveNotification:", NSManagedObjectContextDidSaveNotification, self->_uiChildContext);

}

- (BKLibraryManagedObjectContext)uiChildContext
{
  BKLibraryManagedObjectContext *uiChildContext;

  uiChildContext = self->_uiChildContext;
  if (!uiChildContext)
  {
    -[BKLibraryManager _setupUICoreDataStack](self, "_setupUICoreDataStack");
    uiChildContext = self->_uiChildContext;
  }
  return uiChildContext;
}

- (NSPersistentStore)ui_persistentStore
{
  return self->_ui_persistentStore;
}

- (NSPersistentStoreCoordinator)ui_persistentStoreCoordinator
{
  return self->_ui_persistentStoreCoordinator;
}

- (void)_setupCoreDataStack
{
  id v3;
  void *v4;
  NSPersistentStoreCoordinator *v5;
  NSPersistentStoreCoordinator *ui_persistentStoreCoordinator;
  NSPersistentStoreCoordinator *v7;
  void *v8;
  void *v9;
  NSPersistentStore *v10;
  id v11;
  NSPersistentStore *ui_persistentStore;
  NSPersistentStore *v13;
  BKLibraryManagedObjectContext *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  BKLibraryManagedObjectContext *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  BKLibraryManagedObjectContext *v30;
  BKLibraryManagedObjectContext *readOnlyChildContext;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;

  BUIsRunningTests(self, a2);
  v3 = objc_alloc((Class)NSPersistentStoreCoordinator);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager managedObjectModel](self, "managedObjectModel"));
  v5 = (NSPersistentStoreCoordinator *)objc_msgSend(v3, "initWithManagedObjectModel:", v4);
  ui_persistentStoreCoordinator = self->_ui_persistentStoreCoordinator;
  self->_ui_persistentStoreCoordinator = v5;

  v7 = self->_ui_persistentStoreCoordinator;
  if (v7
    || (BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 1274, "-[BKLibraryManager _setupCoreDataStack]", "_ui_persistentStoreCoordinator", 0), (v7 = self->_ui_persistentStoreCoordinator) != 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager persistentStoreURL](self, "persistentStoreURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager _persistentStoreOptions](self, "_persistentStoreOptions"));
    v38 = 0;
    v10 = (NSPersistentStore *)objc_claimAutoreleasedReturnValue(-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v7, "addPersistentStoreWithType:configuration:URL:options:error:", NSSQLiteStoreType, 0, v8, v9, &v38));
    v11 = v38;
    ui_persistentStore = self->_ui_persistentStore;
    self->_ui_persistentStore = v10;

    v13 = self->_ui_persistentStore;
    if (!v13)
      BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 1280, "-[BKLibraryManager _setupCoreDataStack]", "_ui_persistentStore", 0);
  }
  v14 = -[BKLibraryManagedObjectContext initWithConcurrencyType:]([BKLibraryManagedObjectContext alloc], "initWithConcurrencyType:", 1);
  -[BKLibraryManager setWorkerChildContext:](self, "setWorkerChildContext:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager workerChildContext](self, "workerChildContext"));
  objc_msgSend(v15, "setName:", CFSTR("Worker Context"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager workerChildContext](self, "workerChildContext"));
  objc_msgSend(v17, "setPersistentStoreCoordinator:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager workerChildContext](self, "workerChildContext"));
  objc_msgSend(v18, "setUndoManager:", 0);

  v19 = NSMergeByPropertyObjectTrumpMergePolicy;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager workerChildContext](self, "workerChildContext"));
  objc_msgSend(v20, "setMergePolicy:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager workerChildContext](self, "workerChildContext"));
  objc_msgSend(v21, "setLibraryManager:", self);

  v22 = -[BKLibraryManagedObjectContext initWithConcurrencyType:]([BKLibraryManagedObjectContext alloc], "initWithConcurrencyType:", 1);
  -[BKLibraryManager setCollectionsWorkerChildContext:](self, "setCollectionsWorkerChildContext:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionsWorkerChildContext](self, "collectionsWorkerChildContext"));
  objc_msgSend(v23, "setName:", CFSTR("Collections Worker Context"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionsWorkerChildContext](self, "collectionsWorkerChildContext"));
  objc_msgSend(v25, "setPersistentStoreCoordinator:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionsWorkerChildContext](self, "collectionsWorkerChildContext"));
  objc_msgSend(v26, "setUndoManager:", 0);

  v27 = NSMergeByPropertyObjectTrumpMergePolicy;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionsWorkerChildContext](self, "collectionsWorkerChildContext"));
  objc_msgSend(v28, "setMergePolicy:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionsWorkerChildContext](self, "collectionsWorkerChildContext"));
  objc_msgSend(v29, "setLibraryManager:", self);

  v30 = -[BKLibraryManagedObjectContext initWithConcurrencyType:]([BKLibraryManagedObjectContext alloc], "initWithConcurrencyType:", 1);
  readOnlyChildContext = self->_readOnlyChildContext;
  self->_readOnlyChildContext = v30;

  -[BKLibraryManagedObjectContext setName:](self->_readOnlyChildContext, "setName:", CFSTR("Read-only Child Context"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  -[BKLibraryManagedObjectContext setPersistentStoreCoordinator:](self->_readOnlyChildContext, "setPersistentStoreCoordinator:", v32);

  -[BKLibraryManagedObjectContext setUndoManager:](self->_readOnlyChildContext, "setUndoManager:", 0);
  -[BKLibraryManagedObjectContext setMergePolicy:](self->_readOnlyChildContext, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);
  -[BKLibraryManagedObjectContext setLibraryManager:](self->_readOnlyChildContext, "setLibraryManager:", self);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_BD4C;
  v37[3] = &unk_C16F0;
  v37[4] = self;
  v33 = objc_msgSend(objc_alloc((Class)IMManagedObjectContextReadOnlyPool), "initWithContextProvider:", v37);
  -[BKLibraryManager setBackgroundReadOnlyContextPool:](self, "setBackgroundReadOnlyContextPool:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager workerChildContext](self, "workerChildContext"));
  objc_msgSend(v34, "addObserver:selector:name:object:", self, "workerManagedObjectContextDidSaveNotification:", NSManagedObjectContextDidSaveNotification, v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionsWorkerChildContext](self, "collectionsWorkerChildContext"));
  objc_msgSend(v34, "addObserver:selector:name:object:", self, "collectionsWorkerManagedObjectContextDidSaveNotification:", NSManagedObjectContextDidSaveNotification, v36);

  objc_msgSend(v34, "addObserver:selector:name:object:", self, "otherManagedObjectContextDidSaveNotification:", NSManagedObjectContextDidSaveNotification, 0);
}

- (void)dealloc
{
  NSOperationQueue *imageSourceOperationQueue;
  NSOperationQueue *imageSourceScalingOperationQueue;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  -[NSOperationQueue cancelAllOperations](self->_imageSourceOperationQueue, "cancelAllOperations");
  imageSourceOperationQueue = self->_imageSourceOperationQueue;
  self->_imageSourceOperationQueue = 0;

  -[NSOperationQueue cancelAllOperations](self->_imageSourceScalingOperationQueue, "cancelAllOperations");
  imageSourceScalingOperationQueue = self->_imageSourceScalingOperationQueue;
  self->_imageSourceScalingOperationQueue = 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:", self);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v11, "processingAuthentication") & 1) != 0)
          objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("processingAuthentication"), off_DCD38);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v12.receiver = self;
  v12.super_class = (Class)BKLibraryManager;
  -[BKLibraryManager dealloc](&v12, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  objc_super v12;

  v10 = a4;
  v11 = v10;
  if (off_DCD38 == a6)
  {
    if ((objc_opt_respondsToSelector(v10, "processingAuthentication") & 1) != 0)
    {
      if (objc_msgSend(v11, "processingAuthentication"))
        -[BKLibraryManager _updateProcessingAuthenticationStateImmediate](self, "_updateProcessingAuthenticationStateImmediate");
      else
        -[BKLibraryManager _updateProcessingAuthenticationStateDeferred](self, "_updateProcessingAuthenticationStateDeferred");
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)BKLibraryManager;
    -[BKLibraryManager observeValueForKeyPath:ofObject:change:context:](&v12, "observeValueForKeyPath:ofObject:change:context:", a3, v10, a5, a6);
  }

}

- (NSString)description
{
  NSMutableString *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = objc_opt_new(NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("<%@: %p dataSources=("), v6, self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v12);
        v14 = 1 << (char)v13;
        if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
          v14 = 0;
        -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%@ b=%#lx, "), v12, v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources"));
  v16 = objc_msgSend(v15, "count");

  if (v16)
    -[NSMutableString replaceCharactersInRange:withString:](v3, "replaceCharactersInRange:withString:", (char *)-[NSMutableString length](v3, "length") - 2, 2, &stru_C40E8);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(")>"));
  v17 = -[NSMutableString copy](v3, "copy");

  return (NSString *)v17;
}

- (NSString)debugDescription
{
  NSMutableString *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char *v20;
  char *v21;
  char *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char *v37;
  char *j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  void *v47;
  void *v48;
  BKLibraryManager *v49;
  void *v50;
  char *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  _BYTE v57[128];

  v3 = objc_opt_new(NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("<%@: %p dataSources=(\n"), v6, self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources"));
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v53 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v12);
        v14 = 1 << (char)v13;
        if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
          v14 = 0;
        -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%@ b=%#lx,\n"), v12, v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v9);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources"));
  v16 = objc_msgSend(v15, "count");

  if (v16)
    -[NSMutableString replaceCharactersInRange:withString:](v3, "replaceCharactersInRange:withString:", (char *)-[NSMutableString length](v3, "length") - 2, 2, &stru_C40E8);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(")>"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("assetUpdatesByIdentifier={\n"));
  v49 = self;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager assetUpdatesByIdentifier](self, "assetUpdatesByIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allKeys"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sortedArrayUsingSelector:", "compare:"));

  v20 = (char *)objc_msgSend(v19, "count");
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v51 = v20 - 1;
    do
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v22));
      v24 = v17;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v23));
      v26 = sub_C70C(objc_msgSend(v25, "dataSourcesBitmask"), v7);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
      v29 = (void *)v28;
      v30 = &stru_C40E8;
      if (v51 != v22)
        v30 = CFSTR(",");
      -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%@=%@ dataSource=%@%@\n"), v23, v25, v28, v30);

      v17 = v24;
      ++v22;
    }
    while (v21 != v22);
  }
  v47 = v19;
  v48 = v17;
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("}\n"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager unclaimedAssetIDs](v49, "unclaimedAssetIDs"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager unclaimedTemporaryAssetIDs](v49, "unclaimedTemporaryAssetIDs"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("unclaimedAssetIDs=%@\nunclaimedTemporaryAssetIDs=%@\n"), v31, v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  v56[0] = CFSTR("assetID");
  v56[1] = CFSTR("temporaryAssetID");
  v56[2] = CFSTR("title");
  v56[3] = CFSTR("dataSourceIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 4));
  objc_msgSend(v33, "setPropertiesToFetch:", v34);

  objc_msgSend(v33, "setResultType:", 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](v49, "uiChildContext"));
  v50 = v33;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "executeFetchRequest:error:", v33, 0));

  v37 = (char *)objc_msgSend(v36, "count");
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("BKLibraryAssets={\n"));
  if (v37)
  {
    for (j = 0; j != v37; ++j)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndexedSubscript:", j));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("assetID")));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("temporaryAssetID")));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("title")));
      v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("dataSourceIdentifier")));
      v44 = (void *)v43;
      v45 = &stru_C40E8;
      if (v37 - 1 != j)
        v45 = CFSTR(",");
      -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("id=%@ tid=%@ title='%@' dataSource=%@%@\n"), v40, v41, v42, v43, v45);

    }
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("} >"));

  return (NSString *)v3;
}

- (void)dq_sync:(id)a3
{
  id v4;
  NSObject *v5;

  if (a3)
  {
    v4 = a3;
    v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager dqSyncQueue](self, "dqSyncQueue"));
    dispatch_sync(v5, v4);

  }
}

- (void)uiManagedObjectContextDidSaveNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  BKLibraryManager *v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", NSInsertedObjectsKey));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", NSUpdatedObjectsKey));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", NSDeletedObjectsKey));

  if (objc_msgSend(v6, "count") || objc_msgSend(v8, "count") || objc_msgSend(v10, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager workerChildContext](self, "workerChildContext"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_C95C;
    v22[3] = &unk_C12F8;
    v22[4] = self;
    v12 = v4;
    v23 = v12;
    objc_msgSend(v11, "performBlock:", v22);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionsWorkerChildContext](self, "collectionsWorkerChildContext"));
    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_C99C;
    v19 = &unk_C12F8;
    v20 = self;
    v14 = v12;
    v21 = v14;
    objc_msgSend(v13, "performBlock:", &v16);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager backgroundReadOnlyContextPool](self, "backgroundReadOnlyContextPool", v16, v17, v18, v19, v20));
    objc_msgSend(v15, "remoteContextDidSave:", v14);

  }
}

- (void)workerManagedObjectContextDidSaveNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BKLibraryManagedObjectContext *uiChildContext;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  BKLibraryManager *v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", NSInsertedObjectsKey));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", NSUpdatedObjectsKey));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", NSDeletedObjectsKey));

  if (objc_msgSend(v6, "count") || objc_msgSend(v8, "count") || objc_msgSend(v10, "count"))
  {
    uiChildContext = self->_uiChildContext;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_CBA8;
    v22[3] = &unk_C12F8;
    v22[4] = self;
    v12 = v4;
    v23 = v12;
    -[BKLibraryManagedObjectContext performBlock:](uiChildContext, "performBlock:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionsWorkerChildContext](self, "collectionsWorkerChildContext"));
    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_CC5C;
    v19 = &unk_C12F8;
    v20 = self;
    v14 = v12;
    v21 = v14;
    objc_msgSend(v13, "performBlock:", &v16);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager backgroundReadOnlyContextPool](self, "backgroundReadOnlyContextPool", v16, v17, v18, v19, v20));
    objc_msgSend(v15, "remoteContextDidSave:", v14);

  }
}

- (void)collectionsWorkerManagedObjectContextDidSaveNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BKLibraryManagedObjectContext *uiChildContext;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  BKLibraryManager *v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", NSInsertedObjectsKey));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", NSUpdatedObjectsKey));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", NSDeletedObjectsKey));

  if (objc_msgSend(v6, "count") || objc_msgSend(v8, "count") || objc_msgSend(v10, "count"))
  {
    uiChildContext = self->_uiChildContext;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_CE68;
    v22[3] = &unk_C12F8;
    v22[4] = self;
    v12 = v4;
    v23 = v12;
    -[BKLibraryManagedObjectContext performBlock:](uiChildContext, "performBlock:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager workerChildContext](self, "workerChildContext"));
    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_CF1C;
    v19 = &unk_C12F8;
    v20 = self;
    v14 = v12;
    v21 = v14;
    objc_msgSend(v13, "performBlock:", &v16);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager backgroundReadOnlyContextPool](self, "backgroundReadOnlyContextPool", v16, v17, v18, v19, v20));
    objc_msgSend(v15, "remoteContextDidSave:", v14);

  }
}

- (void)otherManagedObjectContextDidSaveNotification:(id)a3
{
  id v4;
  BKLibraryManagedObjectContext *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BKLibraryManagedObjectContext *uiChildContext;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;

  v4 = a3;
  v5 = (BKLibraryManagedObjectContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  if (v5 != self->_uiChildContext)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager workerChildContext](self, "workerChildContext"));
    if (v5 == (BKLibraryManagedObjectContext *)v6)
    {

    }
    else
    {
      v7 = (void *)v6;
      v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionsWorkerChildContext](self, "collectionsWorkerChildContext"));
      if (v5 == (BKLibraryManagedObjectContext *)v8)
      {

LABEL_12:
        goto LABEL_13;
      }
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManagedObjectContext persistentStoreCoordinator](v5, "persistentStoreCoordinator"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager persistentStoreCoordinator](self, "persistentStoreCoordinator"));
      v12 = objc_msgSend(v10, "hasStoreInCommonWith:", v11);

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", NSInsertedObjectsKey));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", NSUpdatedObjectsKey));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", NSDeletedObjectsKey));

        if (objc_msgSend(v7, "count") || objc_msgSend(v15, "count") || objc_msgSend(v17, "count"))
        {
          uiChildContext = self->_uiChildContext;
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_D218;
          v29[3] = &unk_C12F8;
          v29[4] = self;
          v19 = v4;
          v30 = v19;
          -[BKLibraryManagedObjectContext performBlock:](uiChildContext, "performBlock:", v29);
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager workerChildContext](self, "workerChildContext"));
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_D2CC;
          v27[3] = &unk_C12F8;
          v27[4] = self;
          v21 = v19;
          v28 = v21;
          objc_msgSend(v20, "performBlock:", v27);

          v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionsWorkerChildContext](self, "collectionsWorkerChildContext"));
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_D30C;
          v25[3] = &unk_C12F8;
          v25[4] = self;
          v23 = v21;
          v26 = v23;
          objc_msgSend(v22, "performBlock:", v25);

          v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager backgroundReadOnlyContextPool](self, "backgroundReadOnlyContextPool"));
          objc_msgSend(v24, "remoteContextDidSave:", v23);

        }
        goto LABEL_12;
      }
    }
  }
LABEL_13:

}

- (void)performBlockOnCollectionsWorkerQueue:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  os_signpost_id_t v14;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    v5 = BCSignpostLibrary();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = os_signpost_id_generate(v6);

    v8 = BCSignpostLibrary();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v10, OS_SIGNPOST_EVENT, v7, "CollectionsQueueAsyncScheduled", ", buf, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionsWorkerChildContext](self, "collectionsWorkerChildContext"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_D45C;
    v12[3] = &unk_C1718;
    v14 = v7;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v11, "performBlock:", v12);

  }
}

- (void)performBlockOnCollectionsWorkerQueueAndWait:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  os_signpost_id_t v17;
  uint8_t buf[16];

  v4 = a3;
  v5 = +[NSThread isMainThread](NSThread, "isMainThread");
  if (v5)
  {
    v6 = BKLibraryLog(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_80608();

  }
  if (v4)
  {
    v8 = BCSignpostLibrary();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = os_signpost_id_generate(v9);

    v11 = BCSignpostLibrary();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v13, OS_SIGNPOST_EVENT, v10, "CollectionsQueueSyncScheduled", ", buf, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionsWorkerChildContext](self, "collectionsWorkerChildContext"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_D724;
    v15[3] = &unk_C1718;
    v17 = v10;
    v15[4] = self;
    v16 = v4;
    objc_msgSend(v14, "performBlockAndWait:", v15);

  }
}

- (void)performBlockOnWorkerQueue:(id)a3
{
  -[BKLibraryManager performNamed:workerQueueBlock:](self, "performNamed:workerQueueBlock:", CFSTR("<unspecified>"), a3);
}

- (void)performNamed:(id)a3 workerQueueBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  BKLibraryManager *v19;
  id v20;
  uint8_t buf[4];
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = BCSignpostLibrary();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_signpost_id_generate(v9);

  v11 = BCSignpostLibrary();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    _os_signpost_emit_with_name_impl(&dword_0, v13, OS_SIGNPOST_EVENT, v10, "WorkerQueueAsyncScheduled", "%{public}@", buf, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager workerChildContext](self, "workerChildContext"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_DA24;
  v17[3] = &unk_C16C8;
  v19 = self;
  v20 = v7;
  v18 = v6;
  v15 = v7;
  v16 = v6;
  objc_msgSend(v14, "performBlock:", v17);

}

- (void)performBlockOnWorkerQueueAndWait:(id)a3
{
  -[BKLibraryManager performNamed:workerQueueBlockAndWait:](self, "performNamed:workerQueueBlockAndWait:", CFSTR("<unspecified>"), a3);
}

- (void)performNamed:(id)a3 workerQueueBlockAndWait:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  BKLibraryManager *v22;
  id v23;
  uint8_t buf[4];
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = +[NSThread isMainThread](NSThread, "isMainThread");
  if (v8)
  {
    v9 = BKLibraryLog(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_80608();

  }
  v11 = BCSignpostLibrary();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_signpost_id_generate(v12);

  v14 = BCSignpostLibrary();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v6;
    _os_signpost_emit_with_name_impl(&dword_0, v16, OS_SIGNPOST_EVENT, v13, "WorkerQueueSyncScheduled", "%{public}@", buf, 0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager workerChildContext](self, "workerChildContext"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_DDA8;
  v20[3] = &unk_C16C8;
  v22 = self;
  v23 = v7;
  v21 = v6;
  v18 = v7;
  v19 = v6;
  objc_msgSend(v17, "performBlockAndWait:", v20);

}

- (void)performBlockInUIContext:(id)a3
{
  -[BKLibraryManager performBlockInUIContext:completion:](self, "performBlockInUIContext:completion:", a3, 0);
}

- (void)performBlockInUIContext:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a3;
  v6 = a4;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 1705, "-[BKLibraryManager performBlockInUIContext:completion:]", "[NSThread isMainThread]", CFSTR("only call from main thread"));
  if (v10)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
    v10[2](v10, v7);
  }
  else
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 1707, "-[BKLibraryManager performBlockInUIContext:completion:]", "block", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
  }
  if (objc_msgSend(v7, "hasChanges"))
  {
    objc_msgSend(v7, "setSaveContext:", 2);
    objc_msgSend(v7, "save:", 0);
  }
  v8 = objc_retainBlock(v6);
  v9 = v8;
  if (v8)
    (*((void (**)(id))v8 + 2))(v8);

}

- (void)performBackgroundReadOnlyBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager backgroundReadOnlyContextPool](self, "backgroundReadOnlyContextPool"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_E138;
    v6[3] = &unk_C1740;
    v7 = v4;
    objc_msgSend(v5, "performReadOnlyBlock:", v6);

  }
}

- (void)performBackgroundReadOnlyBlockAndWait:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  dispatch_semaphore_t v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v5 = dispatch_semaphore_create(0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager backgroundReadOnlyContextPool](self, "backgroundReadOnlyContextPool"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_E208;
    v8[3] = &unk_C1768;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    objc_msgSend(v6, "performReadOnlyBlock:", v8);

    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }

}

- (id)newManagedObjectContextWithClass:(Class)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryManager;
  return -[BKLibraryManager newManagedObjectContextWithClass:](&v4, "newManagedObjectContextWithClass:", a3);
}

- (BOOL)hasBooks
{
  void *v3;
  unint64_t v4;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 1757, "-[BKLibraryManager hasBooks]", "[NSThread isMainThread]", CFSTR("only call from main thread"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
  v4 = +[BKLibraryManager numberOfLibraryAssetsInManagdObjectContext:](BKLibraryManager, "numberOfLibraryAssetsInManagdObjectContext:", v3);

  return v4 != 0;
}

- (void)checkOwnedSingleBookSeriesWithManagedObjectContext:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *p_super;
  void *v30;
  void *v31;
  BKLibraryManager *v32;
  void *v33;
  void *v34;
  id v35;
  id obj;
  _QWORD v37[4];
  NSMutableArray *v38;
  NSMutableArray *v39;
  BKLibraryManager *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  _BYTE v48[128];

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  v32 = self;
  v6 = objc_msgSend((id)objc_opt_class(self), "predicateForOwnedSingleAssetSeries");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "setPredicate:", v7);

  objc_msgSend(v5, "setReturnsDistinctResults:", 1);
  v8 = objc_opt_new(NSMutableArray);
  v9 = objc_opt_new(NSMutableArray);
  v45 = 0;
  v33 = v5;
  v34 = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeFetchRequest:error:", v5, &v45));
  v35 = v45;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bu_arrayByRemovingNSNulls"));

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "seriesID", v32));

        if (v17)
        {
          v19 = objc_opt_class(BKLibraryAsset);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "seriesBooks"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "anyObject"));
          v22 = BUDynamicCast(v19, v21);
          v23 = objc_claimAutoreleasedReturnValue(v22);

          LODWORD(v21) = -[NSObject isAudiobook](v23, "isAudiobook");
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "seriesID"));
          if ((_DWORD)v21)
            v25 = v9;
          else
            v25 = v8;
          -[NSMutableArray addObject:](v25, "addObject:", v24);

        }
        else
        {
          v26 = BKLibraryLog(v18);
          v23 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v47 = v16;
            _os_log_debug_impl(&dword_0, v23, OS_LOG_TYPE_DEBUG, "Series with single asset has no seriesID: %@", buf, 0xCu);
          }
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v13);
  }

  if (v35)
  {
    v28 = BKLibraryLog(v27);
    p_super = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      sub_80634();
  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "seriesInfoUpdateIntervalEnabled"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_E668;
    v37[3] = &unk_C1790;
    v38 = v8;
    v39 = v9;
    v40 = v32;
    objc_msgSend(v31, "valueWithCompletion:", v37);

    p_super = &v38->super.super;
  }

}

- (void)checkNonSeriesAudiobooksWithManagedObjectContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  _QWORD v27[2];

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAssetsInCollectionID:allowExplicit:](BKLibraryManager, "predicateForAssetsInCollectionID:allowExplicit:", kBKCollectionDefaultIDAudiobooks, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL AND %K != %@ AND seriesContainer == NULL"), CFSTR("storeID"), CFSTR("contentType"), &off_C9D90));
  v27[0] = v6;
  v27[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v8));
  objc_msgSend(v5, "setPredicate:", v9);

  objc_msgSend(v5, "setReturnsDistinctResults:", 1);
  v26 = CFSTR("storeID");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  objc_msgSend(v5, "setPropertiesToFetch:", v10);

  objc_msgSend(v5, "setResultType:", 2);
  v23 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeFetchRequest:error:", v5, &v23));

  v12 = v23;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("storeID")));

  if (v12)
  {
    v15 = BKLibraryLog(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_806F4();
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v18 = objc_msgSend(v17, "integerForKey:", CFSTR("SeriesMigrationVersion"));

    v19 = v18 == 0;
    if (v13)
      v20 = v13;
    else
      v20 = &__NSArray0__struct;
    v24 = BKSeriesManagerAssetTypeAudiobooks;
    v25 = v20;
    v16 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager seriesManager](self, "seriesManager"));
    objc_msgSend(v21, "updateSeriesForAssetAdamIDsWithTypes:forceCheck:", v16, v19);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v22, "setInteger:forKey:", 1, CFSTR("SeriesMigrationVersion"));

  }
}

- (void)wq_dq_saveDatabaseContext:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  v5 = self->_dqSyncQueue;
  if (v5 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v5);

  -[BKLibraryManager _resetAuthorsAndStacksInContext:](self, "_resetAuthorsAndStacksInContext:", v4);
  v6 = objc_msgSend(v4, "hasChanges");
  if ((_DWORD)v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager wq_seriesIDsToResetWithLibraryManagedObjectContext:](self, "wq_seriesIDsToResetWithLibraryManagedObjectContext:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionController](self, "collectionController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "gatherChangedAssetsCollectionsWithLibraryMoc:", v4));
    -[BKLibraryManager saveManagedObjectContext:](self, "saveManagedObjectContext:", v4);
    v10 = BKLibraryLog(objc_msgSend(v8, "processGatheredChangedAssetsCollections:", v9));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bu_prettyDescription"));
      *(_DWORD *)buf = 138412546;
      v19 = v12;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "wq_dq_saveDatabaseContext: reseting %@ seriesIDs: %@", buf, 0x16u);

    }
    -[BKLibraryManager _resetSeriesIDs:](self, "_resetSeriesIDs:", v7);

  }
  else
  {
    v15 = BKLibraryLog(v6);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      sub_80754();

    if (-[BKLibraryManager resetSeriesOnAllBooks](self, "resetSeriesOnAllBooks"))
      -[BKLibraryManager _resetSeriesIDs:](self, "_resetSeriesIDs:", 0);
  }
  if (!-[BKLibraryManager hasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks](self, "hasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks"))
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_ED34;
    v17[3] = &unk_C1590;
    v17[4] = self;
    -[BKLibraryManager performBackgroundReadOnlyBlock:](self, "performBackgroundReadOnlyBlock:", v17);
    -[BKLibraryManager setHasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks:](self, "setHasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks:", 1);
  }

}

- (void)_updateAuthorForSeriesContainer:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = BKLibraryLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
    v14 = 141558274;
    v15 = 1752392040;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "_updateAuthorForSeriesContainer: %{mask.hash}@", (uint8_t *)&v14, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "seriesID"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager _rawSeriesAuthorForContainerID:context:](self, "_rawSeriesAuthorForContainerID:context:", v9, v8));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "seriesID"));
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager _rawSeriesSortAuthorForContainerID:context:](self, "_rawSeriesSortAuthorForContainerID:context:", v11, v8));

  if (!-[__CFString length](v12, "length") && -[__CFString length](v10, "length"))
    goto LABEL_13;
  if (-[__CFString length](v12, "length") && !-[__CFString length](v10, "length"))
  {
    v13 = v12;
    v12 = v10;
    goto LABEL_15;
  }
  if (!-[__CFString length](v12, "length") && !-[__CFString length](v10, "length"))
  {

    v12 = v10;
    v10 = CFSTR("UnknownAuthor");
    goto LABEL_16;
  }
  if (-[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("UnknownAuthor"))
    || -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("MultipleAuthors"))
    && (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("MultipleAuthors")) & 1) == 0)
  {
LABEL_13:
    v13 = v10;
LABEL_15:
    v10 = v13;
LABEL_16:

    v12 = v10;
  }
  objc_msgSend(v4, "setDifferentString:forKey:", v10, CFSTR("author"));
  objc_msgSend(v4, "setDifferentString:forKey:", v12, CFSTR("sortAuthor"));

}

- (void)_resetNilAuthorsOnAllBooksInContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("sortAuthor == %@ AND contentType != %@"), CFSTR("UnknownAuthor"), &off_C9D90));
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setFetchBatchSize:", 64);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, 0));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "author"));
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("UnknownAuthor"));

        if ((v13 & 1) == 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "author"));
          objc_msgSend(v11, "setSortAuthor:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void)_resetNilAuthorsOnAllSeriesInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  objc_msgSend(v4, "save:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("author == %@ AND contentType == %@"), CFSTR("UnknownAuthor"), &off_C9D90));
  objc_msgSend(v5, "setPredicate:", v6);

  objc_msgSend(v5, "setFetchBatchSize:", 64);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeFetchRequest:error:", v5, 0));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[BKLibraryManager _updateAuthorForSeriesContainer:](self, "_updateAuthorForSeriesContainer:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11));
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_resetAuthorsAndStacksInContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[BKLibraryManager needsResetNilAuthorsOnAllBooks](self, "needsResetNilAuthorsOnAllBooks"))
  {
    -[BKLibraryManager setNeedsResetNilAuthorsOnAllBooks:](self, "setNeedsResetNilAuthorsOnAllBooks:", 0);
    -[BKLibraryManager _resetNilAuthorsOnAllBooksInContext:](self, "_resetNilAuthorsOnAllBooksInContext:", v5);
  }
  if (-[BKLibraryManager needsResetNilAuthorsOnAllSeries](self, "needsResetNilAuthorsOnAllSeries"))
  {
    -[BKLibraryManager setNeedsResetNilAuthorsOnAllSeries:](self, "setNeedsResetNilAuthorsOnAllSeries:", 0);
    -[BKLibraryManager _resetNilAuthorsOnAllSeriesInContext:](self, "_resetNilAuthorsOnAllSeriesInContext:", v5);
  }
  if (-[BKLibraryManager needsResetSeriesStacksAndCollectionMembershipOnAllBooks](self, "needsResetSeriesStacksAndCollectionMembershipOnAllBooks"))
  {
    -[BKLibraryManager setNeedsResetSeriesStacksAndCollectionMembershipOnAllBooks:](self, "setNeedsResetSeriesStacksAndCollectionMembershipOnAllBooks:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionManager](self, "collectionManager"));
    objc_msgSend(v4, "resetCollections");

  }
  if (-[BKLibraryManager needsDuplicateCollectionMembersRemoved](self, "needsDuplicateCollectionMembersRemoved"))
  {
    -[BKLibraryManager setNeedsDuplicateCollectionMembersRemoved:](self, "setNeedsDuplicateCollectionMembersRemoved:", 0);
    -[BKLibraryManager _removeDuplicateCollectionMembers](self, "_removeDuplicateCollectionMembers");
  }

}

- (void)_removeDuplicateCollectionMembers
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_F41C;
  v2[3] = &unk_C1590;
  v2[4] = self;
  -[BKLibraryManager performBlockOnCollectionsWorkerQueue:](self, "performBlockOnCollectionsWorkerQueue:", v2);
}

- (id)wq_seriesIDsToResetWithLibraryManagedObjectContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "updatedObjects"));
  objc_msgSend(v4, "unionSet:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "insertedObjects"));
  objc_msgSend(v4, "unionSet:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deletedObjects"));
  objc_msgSend(v4, "unionSet:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v13);
        v15 = objc_opt_class(BKLibraryAsset);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "seriesID", (_QWORD)v19));

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "seriesID"));
            objc_msgSend(v8, "addObject:", v17);

          }
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v8;
}

- (void)_resetSeriesIDs:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager usq_moc](self, "usq_moc"));

  if (!v4)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 2078, "-[BKLibraryManager _resetSeriesIDs:]", "self.usq_moc", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager usq_moc](self, "usq_moc"));

  v6 = v7;
  if (v5)
  {
    -[BKLibraryManager seriesUpdaterResetWithIDs:](self, "seriesUpdaterResetWithIDs:", v7);
    v6 = v7;
  }

}

- (NSDictionary)_persistentStoreOptions
{
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = NSMigratePersistentStoresAutomaticallyOption;
  v3[1] = NSInferMappingModelAutomaticallyOption;
  v4[0] = &__kCFBooleanTrue;
  v4[1] = &__kCFBooleanTrue;
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2));
}

- (void)createSeriesUpdaterMoc
{
  BKLibraryManagedObjectContext *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_ui_persistentStoreCoordinator)
  {
    v3 = -[BKLibraryManagedObjectContext initWithConcurrencyType:]([BKLibraryManagedObjectContext alloc], "initWithConcurrencyType:", 1);
    -[BKLibraryManager setUsq_moc:](self, "setUsq_moc:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager usq_moc](self, "usq_moc"));
    if (!v4)
      BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 2096, "-[BKLibraryManager createSeriesUpdaterMoc]", "self.usq_moc", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager usq_moc](self, "usq_moc"));
    objc_msgSend(v5, "setName:", CFSTR("Series Updater Context"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager usq_moc](self, "usq_moc"));
    objc_msgSend(v6, "setPersistentStoreCoordinator:", self->_ui_persistentStoreCoordinator);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager usq_moc](self, "usq_moc"));
    objc_msgSend(v7, "setUndoManager:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager usq_moc](self, "usq_moc"));
    objc_msgSend(v8, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);

    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager usq_moc](self, "usq_moc"));
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "seriesUpdaterMocObjectsDidChange:", NSManagedObjectContextDidSaveNotification, v9);

  }
}

- (void)seriesUpdaterMocObjectsDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BKLibraryManagedObjectContext *v11;
  void *v12;
  void *v13;
  void *v14;
  BKLibraryManagedObjectContext *v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionsWorkerChildContext](self, "collectionsWorkerChildContext"));
  v17 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  +[NSManagedObjectContext mergeChangesFromRemoteContextSave:intoContexts:](NSManagedObjectContext, "mergeChangesFromRemoteContextSave:intoContexts:", v5, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager workerChildContext](self, "workerChildContext"));
  v16 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  +[NSManagedObjectContext mergeChangesFromRemoteContextSave:intoContexts:](NSManagedObjectContext, "mergeChangesFromRemoteContextSave:intoContexts:", v8, v10);

  v11 = self->_uiChildContext;
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v15 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    +[NSManagedObjectContext mergeChangesFromRemoteContextSave:intoContexts:](NSManagedObjectContext, "mergeChangesFromRemoteContextSave:intoContexts:", v12, v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager backgroundReadOnlyContextPool](self, "backgroundReadOnlyContextPool"));
  objc_msgSend(v14, "remoteContextDidSave:", v4);

}

- (void)seriesUpdaterResetWithIDs:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BKLibraryManager *v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = BKLibraryLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "StackLog: seriesUpdaterResetWithIDs: %lu", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager usq_moc](self, "usq_moc"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_FF98;
  v9[3] = &unk_C12F8;
  v10 = v4;
  v11 = self;
  v8 = v4;
  objc_msgSend(v7, "performBlock:", v9);

}

+ (id)persistentStoreURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication applicationDocumentsDirectory](UIApplication, "applicationDocumentsDirectory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "persistentStoreName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("BKLibrary")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6));
  if (!v7)
  {
    v8 = BKLibraryLog(0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_809EC();

    v11 = BKLibraryLog(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_8098C();

    v14 = BKLibraryLog(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_8092C();

    v17 = BKLibraryLog(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_808CC();

  }
  return v7;
}

+ (id)managedObjectModelName
{
  return CFSTR("BKLibrary");
}

+ (id)persistentStoreNameSeed
{
  return CFSTR("091020131601");
}

+ (id)persistentStoreVersion
{
  return CFSTR("1");
}

- (id)newPrivateQueueManagedObjectContext
{
  uint64_t v3;

  v3 = objc_opt_class(BKLibraryManagedObjectContext, a2);
  return -[BKLibraryManager newPrivateQueueManagedObjectContextWithClass:](self, "newPrivateQueueManagedObjectContextWithClass:", v3);
}

- (id)newManagedObjectContext
{
  uint64_t v3;
  NSObject *v4;
  id v5;

  v3 = BKLibraryLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_80A18();

  v5 = -[BKLibraryManager newManagedObjectContextWithClass:](self, "newManagedObjectContextWithClass:", objc_opt_class(BKLibraryManagedObjectContext));
  objc_msgSend(v5, "setLibraryManager:", self);
  return v5;
}

- (void)queryRootFolderShorthandsWithRegistrationBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "buildRootFolderShorthandMapCompletion:") & 1) != 0)
          objc_msgSend(v10, "buildRootFolderShorthandMapCompletion:", v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

+ (id)migrationService
{
  return 0;
}

- (void)triggerCloudSync:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  const __CFString *v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v7 = v5;
  if (v3)
    v6 = CFSTR("BKTriggerCloudSyncSetNotification");
  else
    v6 = CFSTR("BKTriggerCloudSyncGetNotification");
  objc_msgSend(v5, "postNotificationName:object:userInfo:", v6, self, 0);

}

- (void)logCounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKCollection")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  objc_msgSend(v3, "setPredicate:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  objc_msgSend(v5, "setPredicate:", v6);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_11C24;
  v9[3] = &unk_C17B8;
  v10 = v3;
  v11 = v5;
  v7 = v5;
  v8 = v3;
  -[BKLibraryManager performNamed:workerQueueBlock:](self, "performNamed:workerQueueBlock:", CFSTR("logCounts"), v9);

}

- (void)migrateLibraryIfNeeded
{
  if (-[BKLibraryManager needsMigration](self, "needsMigration"))
  {
    -[BKLibraryManager _migrateFromOldDatabase](self, "_migrateFromOldDatabase");
    -[BKLibraryManager setNeedsMigration:](self, "setNeedsMigration:", 0);
  }
}

- (void)cleanupDefaultCollections
{
  void *v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionController](self, "collectionController"));
  objc_msgSend(v3, "cleanupDefaultCollections");

  global_queue = dispatch_get_global_queue(-2, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_125B8;
  block[3] = &unk_C1400;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)cleanupDateFinished
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_12698;
  v2[3] = &unk_C1590;
  v2[4] = self;
  -[BKLibraryManager performBlockInUIContext:](self, "performBlockInUIContext:", v2);
}

- (void)reloadWithCompletion:(id)a3
{
  id v4;
  BUCoalescingCallBlock *coalescedLibraryReload;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  coalescedLibraryReload = self->_coalescedLibraryReload;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_12910;
  v7[3] = &unk_C17E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[BUCoalescingCallBlock signalWithCompletion:](coalescedLibraryReload, "signalWithCompletion:", v7);

}

- (void)_reloadWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (qword_DE470 != -1)
    dispatch_once(&qword_DE470, &stru_C1800);
  v5 = qword_DE468;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_12AAC;
  v7[3] = &unk_C1428;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_performReload
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  BKLibraryManager *v7;

  v3 = BKLibraryLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%p: Library Reload: Start", buf, 0xCu);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_12D1C;
  v5[3] = &unk_C1590;
  v5[4] = self;
  -[BKLibraryManager performNamed:workerQueueBlockAndWait:](self, "performNamed:workerQueueBlockAndWait:", CFSTR("reload"), v5);
}

- (id)assetIDsInDataSourceWithIdentifier:(id)a3 intersectingWithAssetIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v20;
  id v21;
  id obj;
  NSMutableArray *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = a3;
  v7 = a4;
  v23 = objc_opt_new(NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_dataSourcesByIdentifier, "objectForKeyedSubscript:", v6));
  if (v8)
  {
    v20 = v7;
    v21 = v6;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources", v20, v21));
          v15 = objc_msgSend(v14, "indexOfObjectIdenticalTo:", v8);
          if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
            v16 = 0;
          else
            v16 = 1 << (char)v15;

          v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager assetUpdatesByIdentifier](self, "assetUpdatesByIdentifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v13));

          if (((unint64_t)objc_msgSend(v18, "dataSourcesBitmask") & v16) != 0)
            -[NSMutableArray addObject:](v23, "addObject:", v13);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }

    v7 = v20;
    v6 = v21;
  }

  return v23;
}

- (void)setUIManagerProviderForAddingToWantToReadBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionManager](self, "collectionManager"));
  objc_msgSend(v5, "setUiManagerProviderForAddingToWantToRead:", v4);

}

- (void)_enumerateDataSources:(id)a3 intersectingWithAssetIDs:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v9 = a4;
  v8 = a5;
  if (v8)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_134B4;
    v10[3] = &unk_C1828;
    v10[4] = self;
    v11 = v9;
    v12 = v8;
    objc_msgSend(a3, "enumerateObjectsUsingBlock:", v10);

  }
}

- (void)reloadDataSource:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  BKLibraryManager *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_88C4;
  v18 = sub_88D4;
  v19 = 0;
  v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager coalescedDataSourceReloadByIdentifierSync](self, "coalescedDataSourceReloadByIdentifierSync"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_13788;
  block[3] = &unk_C1878;
  v9 = v6;
  v12 = self;
  v13 = &v14;
  v11 = v9;
  dispatch_sync(v8, block);

  objc_msgSend((id)v15[5], "signalWithCompletion:", v7);
  _Block_object_dispose(&v14, 8);

}

- (void)_reloadDataSource:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("reload(%@)"), v8));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_13AEC;
  v12[3] = &unk_C18A0;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[BKLibraryManager _scheduleOperationGroupWithName:block:](self, "_scheduleOperationGroupWithName:block:", v9, v12);

}

- (void)_performReloadDataSource:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BKLibraryManager *v10;
  id v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_13BA8;
  v8[3] = &unk_C1A08;
  v9 = a3;
  v10 = self;
  v11 = a4;
  v6 = v11;
  v7 = v9;
  -[BKLibraryManager performNamed:workerQueueBlock:](self, "performNamed:workerQueueBlock:", CFSTR("reloadDataSource"), v8);

}

- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "canImportURL:openInPlace:options:", v8, v6, v9) & 1) != 0)
        {
          v15 = 1;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (void)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  BKLibraryManager *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  unsigned __int8 v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  unsigned __int8 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v22 = a6;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
LABEL_3:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v17);
      if (objc_msgSend(v18, "canImportURL:openInPlace:options:", v10, v8, v11))
      {
        v19 = objc_msgSend(v10, "startAccessingSecurityScopedResource");
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1511C;
        v23[3] = &unk_C1A80;
        v23[4] = v12;
        v26 = v19;
        v20 = v10;
        v24 = v20;
        v25 = v22;
        v21 = objc_msgSend(v18, "importURL:openInPlace:options:completion:", v20, v8, v11, v23);

        if ((v21 & 1) != 0)
          break;
      }
      if (v15 == (id)++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v15)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)clearAgingDocumentInbox
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = BUProtocolCast(&OBJC_PROTOCOL___BKAssetImporting, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i));
        v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        if (v8)
        {
          v9 = v8;
          objc_msgSend(v8, "clearAgingDocumentInbox");

          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)earliestPurchaseTimestampWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1550C;
  v5[3] = &unk_C1AA8;
  v6 = a3;
  v4 = v6;
  -[BKLibraryManager performBlockOnWorkerQueue:](self, "performBlockOnWorkerQueue:", v5);

}

- (void)prioritizeImport:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_15974;
        v15[3] = &unk_C1AD0;
        v14 = v7;
        v15[4] = self;
        v16 = v14;
        LODWORD(v13) = objc_msgSend(v13, "prioritizeImport:completion:", v6, v15);

        if ((_DWORD)v13)
        {

          goto LABEL_12;
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (v7)
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
LABEL_12:

}

- (void)updateURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_15BAC;
      v14[3] = &unk_C1B48;
      v14[4] = self;
      v15 = v7;
      LOBYTE(v13) = objc_msgSend(v13, "updateURL:completion:", v6, v14);

      if ((v13 & 1) != 0)
        break;
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)updateAsset:(id)a3 fromURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  BKLibraryManager *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataSourceIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourceWithIdentifier:](self, "dataSourceWithIdentifier:", v11));

  if ((objc_opt_respondsToSelector(v12, "updateAsset:fromURL:completion:") & 1) == 0)
    goto LABEL_3;
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_15ED8;
  v17 = &unk_C1B48;
  v18 = self;
  v19 = v10;
  v13 = objc_msgSend(v12, "updateAsset:fromURL:completion:", v8, v9, &v14);

  if ((v13 & 1) == 0)
LABEL_3:
    -[BKLibraryManager updateURL:completion:](self, "updateURL:completion:", v9, v10, v14, v15, v16, v17, v18);

}

- (void)updateAsset:(id)a3 coverArt:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  _QWORD v18[5];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
      if ((objc_opt_respondsToSelector(v16, "updateAsset:coverArt:completion:") & 1) != 0)
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1629C;
        v18[3] = &unk_C1BC0;
        v18[4] = self;
        v19 = v10;
        v17 = objc_msgSend(v16, "updateAsset:coverArt:completion:", v8, v9, v18);

        if ((v17 & 1) != 0)
          break;
      }
      if (v13 == (id)++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v13)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)updateAssetWithID:(id)a3 url:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  BKLibraryManager *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_165A8;
  v7[3] = &unk_C1BE8;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[BKLibraryManager performBlockOnWorkerQueue:](v8, "performBlockOnWorkerQueue:", v7);

}

- (BOOL)examineURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  id v19;
  _BYTE v20[128];

  v6 = a3;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1678C;
  v18[3] = &unk_C1B48;
  v18[4] = self;
  v7 = a4;
  v19 = v7;
  v8 = objc_retainBlock(v18);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "examineURL:completion:", v6, v8) & 1) != 0)
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v10;
}

- (void)resolveLibraryAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  BKResolveLibraryAssetOptions *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(BKResolveLibraryAssetOptions);
  -[BKLibraryManager resolveLibraryAsset:options:completion:](self, "resolveLibraryAsset:options:completion:", v7, v8, v6);

}

- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void ***v11;
  void *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, char, void *);
  void *v17;
  BKLibraryManager *v18;
  id v19;

  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_169FC;
  v17 = &unk_C1C38;
  v18 = self;
  v19 = a5;
  v8 = v19;
  v9 = a4;
  v10 = a3;
  v11 = objc_retainBlock(&v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataSourceIdentifier", v14, v15, v16, v17, v18));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourceWithIdentifier:](self, "dataSourceWithIdentifier:", v12));

  objc_msgSend(v13, "resolveLibraryAsset:options:completion:", v10, v9, v11);
}

- (void)_addDataSourceIdentifierAndStateObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  BKLibraryManager *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager ownershipSync](self, "ownershipSync"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_16BB8;
  block[3] = &unk_C12F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)_removeDataSourceIdentifierAndStateObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  BKLibraryManager *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager ownershipSync](self, "ownershipSync"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_16D3C;
  block[3] = &unk_C12F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)_notifyDataSourceIdentifierAndStateObserversForAssetIDs:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSObject *v6;
  NSMutableDictionary *v7;
  id v8;
  _QWORD block[4];
  id v10;
  BKLibraryManager *v11;
  NSMutableDictionary *v12;

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v6 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager ownershipSync](self, "ownershipSync"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_16EA8;
  block[3] = &unk_C1918;
  v10 = v4;
  v11 = self;
  v12 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_sync(v6, block);

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", &stru_C1C78);
}

- (void)toggleDownloadPausedForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "isDownloading"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourcesConformingToProtocol:](self, "dataSourcesConformingToProtocol:", &OBJC_PROTOCOL___BKBookDownloadController));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetID"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "temporaryAssetID"));
          objc_msgSend(v11, "togglePausedForAssetID:orTemporaryAssetID:", v12, v13);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
}

- (void)cancelDownloadingAsset:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  if (objc_msgSend(v4, "isDownloading"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourcesConformingToProtocol:](self, "dataSourcesConformingToProtocol:", &OBJC_PROTOCOL___BKBookDownloadController));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "permanentOrTemporaryAssetID"));
          objc_msgSend(v10, "cancelDownloadForAssetID:", v11);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)resolveToLocalAssetWithAssetID:(id)a3 completion:(id)a4
{
  -[BKLibraryManager waitForAssetToFinishDownloadWithAssetID:resolveAsset:completion:](self, "waitForAssetToFinishDownloadWithAssetID:resolveAsset:completion:", a3, 1, a4);
}

- (void)waitForAssetToFinishDownloadWithAssetID:(id)a3 completion:(id)a4
{
  -[BKLibraryManager waitForAssetToFinishDownloadWithAssetID:resolveAsset:completion:](self, "waitForAssetToFinishDownloadWithAssetID:resolveAsset:completion:", a3, 0, a4);
}

- (void)waitForAssetToFinishDownloadWithAssetID:(id)a3 resolveAsset:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  BKLibraryDataSourceIdentifierAndStateObserver *v26;
  BKLibraryDataSourceIdentifierAndStateObserver *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  BKResolveLibraryAssetOptions *v32;
  _BOOL4 v33;
  id v34;
  _QWORD v35[4];
  NSObject *v36;
  _QWORD v37[4];
  id v38;
  NSObject *v39;
  _BYTE *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD block[4];
  id v47;
  id v48;
  id v49;
  id location;
  uint8_t v51[128];
  _BYTE buf[24];
  void *v53;
  __int16 v54;
  unsigned int v55;
  __int16 v56;
  unsigned int v57;
  __int16 v58;
  unsigned int v59;
  __int16 v60;
  unsigned int v61;
  __int16 v62;
  unsigned int v63;

  v33 = a4;
  v7 = a3;
  v8 = a5;
  v9 = BKLibraryLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558274;
    *(_QWORD *)&buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] waitForAssetToFinishDownloadWithAssetID", buf, 0x16u);
  }

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 3376, "-[BKLibraryManager waitForAssetToFinishDownloadWithAssetID:resolveAsset:completion:]", "[NSThread isMainThread]", CFSTR("only call from main thread"));
  objc_initWeak(&location, self);
  v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_179A0;
  block[3] = &unk_C1CC8;
  objc_copyWeak(&v49, &location);
  v12 = v7;
  v47 = v12;
  v34 = v8;
  v48 = v34;
  dispatch_group_notify(v11, (dispatch_queue_t)&_dispatch_main_q, block);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID:](self, "libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID:", v12));
  v14 = BKLibraryLog(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v13, "isCloud");
    v17 = objc_msgSend(v13, "isDownloading");
    v18 = objc_msgSend(v13, "isSeriesItem");
    v19 = objc_msgSend(v13, "isStoreItem");
    v20 = objc_msgSend(v13, "isLocal");
    *(_DWORD *)buf = 141559810;
    *(_QWORD *)&buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v53 = v13;
    v54 = 1024;
    v55 = v16;
    v56 = 1024;
    v57 = v17;
    v58 = 1024;
    v59 = v18;
    v60 = 1024;
    v61 = v19;
    v62 = 1024;
    v63 = v20;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] waitForAssetToFinishDownloadWithAssetID: libraryAsset=%@, isCloud=%d, isDownloading=%d, isSeriesItem=%d, isStoreItem=%d, isLocal=%d", buf, 0x3Eu);
  }

  if (!v13)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v53) = 0;
    dispatch_group_enter(v11);
LABEL_21:
    v26 = [BKLibraryDataSourceIdentifierAndStateObserver alloc];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_17AE0;
    v37[3] = &unk_C1D18;
    objc_copyWeak(&v41, &location);
    v38 = v12;
    v40 = buf;
    v39 = v11;
    v27 = -[BKLibraryDataSourceIdentifierAndStateObserver initWithAssetID:notify:](v26, "initWithAssetID:notify:", v38, v37);
    -[BKLibraryManager _addDataSourceIdentifierAndStateObserver:](self, "_addDataSourceIdentifierAndStateObserver:", v27);

    objc_destroyWeak(&v41);
    _Block_object_dispose(buf, 8);
    goto LABEL_22;
  }
  if ((objc_msgSend(v13, "isCloud") & 1) != 0
    || (objc_msgSend(v13, "isDownloading") & 1) != 0
    || (objc_msgSend(v13, "isSeriesItem") & 1) != 0
    || (v21 = objc_msgSend(v13, "isStoreItem"), (_DWORD)v21))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v53) = 0;
    dispatch_group_enter(v11);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v22 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourcesConformingToProtocol:](self, "dataSourcesConformingToProtocol:", &OBJC_PROTOCOL___BKBookDownloadController));
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v24)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i), "resumeDownloadForAssetID:", v12);
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v23);
    }

    goto LABEL_21;
  }
LABEL_22:
  if (v13 && v33)
  {
    v28 = BKLibraryLog(v21);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558274;
      *(_QWORD *)&buf[4] = 1752392040;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] waitForAssetToFinishDownloadWithAssetID : attempt to resolve asset", buf, 0x16u);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataSourceIdentifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourceWithIdentifier:](self, "dataSourceWithIdentifier:", v30));

    v32 = objc_alloc_init(BKResolveLibraryAssetOptions);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_17D04;
    v35[3] = &unk_C1D40;
    v36 = v11;
    objc_msgSend(v31, "resolveLibraryAsset:options:completion:", v13, v32, v35);

  }
  else
  {
    dispatch_group_leave(v11);
  }

  objc_destroyWeak(&v49);
  objc_destroyWeak(&location);

}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataSourceIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourceWithIdentifier:](self, "dataSourceWithIdentifier:", v8));

  if (v9
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataSourceIdentifier")),
        v11 = objc_msgSend(v10, "isEqual:", CFSTR("com.apple.ibooks.plugin.Bookshelf.platformDataSource.BookKit")), v10, v11)&& (v12 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourceWithIdentifier:](self, "dataSourceWithIdentifier:", CFSTR("com.apple.ibooks.datasource.BookKit"))), (v9 = (void *)v12) != 0))
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_17E74;
    v16[3] = &unk_C1B48;
    v16[4] = self;
    v17 = v7;
    objc_msgSend(v9, "assetForLibraryAsset:completion:", v6, v16);

  }
  else
  {
    v13 = BKLibraryLog(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_80D4C();

    v15 = objc_retainBlock(v7);
    v9 = v15;
    if (v15)
      (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, 0, 0);
  }

}

- (void)assetPartsForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  NSObject *v14;
  id v15;
  NSMutableDictionary *v16;
  void *v17;
  id v18;
  _QWORD block[4];
  NSMutableDictionary *v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  NSMutableDictionary *v24;
  void *v25;
  NSObject *v26;
  _QWORD *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  id v33;
  _BYTE v34[128];

  v18 = a3;
  v6 = a4;
  v7 = objc_opt_new(NSMutableDictionary);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_88C4;
  v32[4] = sub_88D4;
  v33 = 0;
  v8 = dispatch_group_create();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  v17 = v6;
  if (v10)
  {
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v13, "assetPartsForLibraryAsset:completion:") & 1) != 0)
        {
          dispatch_group_enter(v8);
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_18248;
          v23[3] = &unk_C1D90;
          v23[4] = self;
          v24 = v7;
          v25 = v13;
          v26 = v8;
          v27 = v32;
          objc_msgSend(v13, "assetPartsForLibraryAsset:completion:", v18, v23);

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v10);
  }

  v14 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager completionQueue](self, "completionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_183AC;
  block[3] = &unk_C1DB8;
  v20 = v7;
  v21 = v17;
  v22 = v32;
  v15 = v17;
  v16 = v7;
  dispatch_group_notify(v8, v14, block);

  _Block_object_dispose(v32, 8);
}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4
{
  -[BKLibraryManager deleteAssets:exhaustive:completion:](self, "deleteAssets:exhaustive:completion:", a3, a4, 0);
}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  char v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BOOL v20;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_18778;
  v16[3] = &unk_C1DE0;
  objc_copyWeak(&v19, &location);
  v10 = v9;
  v18 = v10;
  v11 = v8;
  v17 = v11;
  v20 = a4;
  v12 = objc_retainBlock(v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager delegate](self, "delegate"));
  v14 = objc_opt_respondsToSelector(v13, "willDeleteAssets:completion:");

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager delegate](self, "delegate"));
    objc_msgSend(v15, "willDeleteAssets:completion:", v11, v12);

  }
  else
  {
    ((void (*)(_QWORD *))v12[2])(v12);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)p_deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *k;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  _BYTE v55[128];
  _BYTE v56[128];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (!objc_msgSend(v8, "count"))
  {
LABEL_11:
    v15 = objc_retainBlock(v9);
    v16 = v15;
    if (v15)
      (*((void (**)(id))v15 + 2))(v15);

    goto LABEL_40;
  }
  if (v6)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v49 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i), "deleteAssets:exhaustive:completion:", v8, 1, 0);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v12);
    }

    goto LABEL_11;
  }
  v38 = v9;
  v17 = objc_alloc_init((Class)NSMutableDictionary);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v45 != v21)
          objc_enumerationMutation(v18);
        v23 = *(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v23, "isValid"))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dataSourceIdentifier"));
          if (v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v24));
            if (!v25)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
              objc_msgSend(v17, "setObject:forKey:", v25, v24);
            }
            objc_msgSend(v25, "addObject:", v23);

          }
          else
          {
            v26 = BKLibraryLog(0);
            v27 = objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v54 = v23;
              _os_log_debug_impl(&dword_0, v27, OS_LOG_TYPE_DEBUG, "Library asset has nil dataSourceIdentifier {%@}", buf, 0xCu);
            }

            objc_msgSend(v39, "addObject:", v23);
          }

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    }
    while (v20);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allKeys"));
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v30; k = (char *)k + 1)
      {
        if (*(_QWORD *)v41 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)k);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v33));
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourceWithIdentifier:](self, "dataSourceWithIdentifier:", v33));
        objc_msgSend(v35, "deleteAssets:exhaustive:completion:", v34, 0, 0);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v30);
  }

  -[BKLibraryManager p_deleteAssets:](self, "p_deleteAssets:", v39);
  v9 = v38;
  v36 = objc_retainBlock(v38);
  v37 = v36;
  if (v36)
    (*((void (**)(id))v36 + 2))(v36);

LABEL_40:
}

- (void)p_deleteAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("assetID")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("temporaryAssetID")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));

    if (!objc_msgSend(v7, "count"))
    {

      v7 = 0;
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_18CF0;
    v10[3] = &unk_C1BE8;
    v10[4] = self;
    v11 = v5;
    v12 = v7;
    v8 = v7;
    v9 = v5;
    -[BKLibraryManager performNamed:workerQueueBlock:](self, "performNamed:workerQueueBlock:", CFSTR("delete"), v10);

  }
}

- (void)managedBooksDidChange
{
  void *v3;
  id v4;
  id v5;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourceConformingToProtocol:](self, "dataSourceConformingToProtocol:", &OBJC_PROTOCOL___BKRespondsToManagedBooksChange));
  objc_initWeak(&location, v3);

  v4 = objc_loadWeakRetained(&location);
  if (v4)
  {
    v5 = objc_loadWeakRetained(&location);
    -[BKLibraryManager reloadDataSource:completion:](self, "reloadDataSource:completion:", v5, 0);

  }
  objc_destroyWeak(&location);
}

- (id)dataSourceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourcesByIdentifier](self, "dataSourcesByIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)dataSourceConformingToProtocol:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_19034;
  v7[3] = &unk_C1E08;
  v8 = a3;
  v4 = v8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager _dataSourceMatchingPredicate:](self, "_dataSourceMatchingPredicate:", v7));

  return v5;
}

- (id)dataSourcesConformingToProtocol:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_190C4;
  v7[3] = &unk_C1E08;
  v8 = a3;
  v4 = v8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager _dataSourcesMatchingPredicate:](self, "_dataSourcesMatchingPredicate:", v7));

  return v5;
}

- (void)dq_libraryDataSource:(id)a3 reconcileAssets:(id)a4 reason:(signed __int16)a5
{
  id v7;
  id v8;
  OS_dispatch_queue *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BKLibraryAssetUpdate *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  _BOOL4 v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  int v39;
  id obj;
  uint64_t v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;

  v39 = a5;
  v7 = a3;
  v8 = a4;
  v9 = self->_dqSyncQueue;
  if (v9 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v9);

  v11 = BKLibraryLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    *(_DWORD *)buf = 138412546;
    v49 = v13;
    v50 = 2112;
    v51 = v14;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "#datasource reconcileAssets: reconciling %@ assets for: %@", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager assetUpdatesByIdentifier](self, "assetUpdatesByIdentifier"));
  if ((objc_opt_respondsToSelector(v7, "propagateDataProperties") & 1) != 0)
    v37 = objc_msgSend(v7, "propagateDataProperties");
  else
    v37 = 0;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v8;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v42)
  {
    v41 = *(_QWORD *)v44;
    v36 = v15;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v44 != v41)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "assetID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "temporaryAssetID"));
        if (v18)
        {
          v20 = (BKLibraryAssetUpdate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v18));
          if (v20)
            goto LABEL_20;
        }
        else
        {
          v20 = 0;
        }
        if (v19)
          v20 = (BKLibraryAssetUpdate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v19));
LABEL_20:
        if (v18)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager unclaimedAssetIDs](self, "unclaimedAssetIDs"));
          objc_msgSend(v21, "removeObject:", v18);

          if (v19)
          {
LABEL_24:
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager unclaimedTemporaryAssetIDs](self, "unclaimedTemporaryAssetIDs"));
            objc_msgSend(v22, "removeObject:", v19);

          }
          v23 = 1;
          goto LABEL_26;
        }
        if (v19)
          goto LABEL_24;
        BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 3724, "-[BKLibraryManager dq_libraryDataSource:reconcileAssets:reason:]", "assetID || temporaryAssetID", CFSTR("Expecting assetID or temporaryAssetID"));
        v23 = 0;
LABEL_26:
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataSourceIdentifier"));

        if (v24)
        {
          if (!v23)
            goto LABEL_45;
        }
        else
        {
          BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 3725, "-[BKLibraryManager dq_libraryDataSource:reconcileAssets:reason:]", "asset.dataSourceIdentifier", CFSTR("Expecting a dataSourceIdentifier on the asset"));
          if (!v23)
            goto LABEL_45;
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources"));
        v26 = objc_msgSend(v25, "indexOfObjectIdenticalTo:", v7);
        if (v26 == (id)0x7FFFFFFFFFFFFFFFLL)
          v27 = 0;
        else
          v27 = 1 << (char)v26;

        if (v20)
        {
          v28 = v7;
          v29 = _bk_compareBitmaskPriority(v27, -[BKLibraryAssetUpdate dataSourcesBitmask](v20, "dataSourcesBitmask"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate asset](v20, "asset"));

          v32 = v39 == 4 && v30 == 0;
          if (v29 != -1 || v32)
            -[BKLibraryAssetUpdate setAsset:](v20, "setAsset:", v17);
          -[BKLibraryManager _addBitmask:toUpdate:inMethod:](self, "_addBitmask:toUpdate:inMethod:", v27, v20, a2);
          -[BKLibraryAssetUpdate setPropertiesToPropagate:](v20, "setPropertiesToPropagate:", v37);
          -[BKLibraryAssetUpdate propagateAdditionalDataWithAsset:](v20, "propagateAdditionalDataWithAsset:", v17);
          v7 = v28;
          v15 = v36;
          if (!v18)
            goto LABEL_43;
LABEL_42:
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, v18);
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager identifiersForAssetsNeedingReconcile](self, "identifiersForAssetsNeedingReconcile"));
          objc_msgSend(v33, "addObject:", v18);

          goto LABEL_43;
        }
        v20 = -[BKLibraryAssetUpdate initWithAsset:dataSource:dataSourceBitmask:]([BKLibraryAssetUpdate alloc], "initWithAsset:dataSource:dataSourceBitmask:", v17, v7, v27);
        if (v18)
          goto LABEL_42;
LABEL_43:
        if (v19)
        {
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, v19);
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager identifiersForAssetsNeedingReconcile](self, "identifiersForAssetsNeedingReconcile"));
          objc_msgSend(v34, "addObject:", v19);

        }
LABEL_45:

        v16 = (char *)v16 + 1;
      }
      while (v42 != v16);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      v42 = v35;
    }
    while (v35);
  }

}

- (void)dq_unclaimIdentifiers:(id)a3 forDataSourceBitmask:(unint64_t)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v7 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager assetUpdatesByIdentifier](self, "assetUpdatesByIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));

        -[BKLibraryManager _removeBitmask:fromUpdate:inMethod:](self, "_removeBitmask:fromUpdate:inMethod:", a4, v14, a2);
        if (!objc_msgSend(v14, "dataSourcesBitmask"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager unclaimedAssetIDs](self, "unclaimedAssetIDs"));
          objc_msgSend(v15, "addObject:", v12);

          v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager unclaimedTemporaryAssetIDs](self, "unclaimedTemporaryAssetIDs"));
          objc_msgSend(v16, "addObject:", v12);

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (void)libraryDataSource:(id)a3 removeImagesForAsset:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager imageSource](self, "imageSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "temporaryAssetID"));

  objc_msgSend(v6, "removeImagesForAssetID:temporaryAssetID:", v8, v7);
}

- (void)libraryDataSource:(id)a3 removedAssets:(id)a4 inGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  BKLibraryManager *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  kdebug_trace(725352876, 0, 0, 0, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_198CC;
  v13[3] = &unk_C1918;
  v14 = v9;
  v15 = self;
  v16 = v8;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "addOperationBlock:", v13);

}

- (void)libraryDataSource:(id)a3 removedAssetsWithAssetIDs:(id)a4 orTemporaryAssetIDs:(id)a5 inGroup:(id)a6
{
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_19A30;
  v12[3] = &unk_C1D68;
  v12[4] = self;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v9 = v15;
  v10 = v14;
  v11 = v13;
  objc_msgSend(a6, "addOperationBlock:", v12);

}

- (void)_addBitmask:(unint64_t)a3 toUpdate:(id)a4 inMethod:(SEL)a5
{
  id v6;

  v6 = a4;
  objc_msgSend(v6, "setDataSourcesBitmask:", (unint64_t)objc_msgSend(v6, "dataSourcesBitmask") | a3);

}

- (void)_removeBitmask:(unint64_t)a3 fromUpdate:(id)a4 inMethod:(SEL)a5
{
  id v6;

  v6 = a4;
  objc_msgSend(v6, "setDataSourcesBitmask:", (unint64_t)objc_msgSend(v6, "dataSourcesBitmask") & ~a3);

}

- (void)_libraryDataSource:(id)a3 removedAssetsWithAssetIDs:(id)a4 orTemporaryAssetIDs:(id)a5
{
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  BKLibraryManager *v16;
  SEL v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "count") || objc_msgSend(v11, "count"))
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_19BB0;
    v12[3] = &unk_C1E58;
    v13 = v10;
    v14 = v11;
    v15 = v9;
    v16 = self;
    v17 = a2;
    -[BKLibraryManager performNamed:workerQueueBlock:](self, "performNamed:workerQueueBlock:", CFSTR("removedAssets"), v12);

  }
}

- (void)libraryDataSource:(id)a3 updatedAssets:(id)a4 inGroup:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1A800;
  v9[3] = &unk_C1918;
  v9[4] = self;
  v10 = a3;
  v11 = a4;
  v7 = v11;
  v8 = v10;
  objc_msgSend(a5, "addOperationBlock:", v9);

}

- (void)_libraryDataSource:(id)a3 updatedAssets:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BKLibraryManager *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    kdebug_trace(725352868, 0, 0, 0, 0);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1A8DC;
    v8[3] = &unk_C1BE8;
    v9 = v7;
    v10 = self;
    v11 = v6;
    -[BKLibraryManager performNamed:workerQueueBlockAndWait:](self, "performNamed:workerQueueBlockAndWait:", CFSTR("updateAssets"), v8);

  }
}

- (void)libraryDataSource:(id)a3 notifyBlock:(id)a4 inGroup:(id)a5
{
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1D944;
    v9[3] = &unk_C1428;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(a5, "addOperationBlock:", v9);

  }
}

- (void)addCustomOperationBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1DA4C;
    v6[3] = &unk_C1EA8;
    v6[4] = self;
    v7 = v4;
    -[BKLibraryManager _scheduleOperationGroupWithName:block:](self, "_scheduleOperationGroupWithName:block:", CFSTR("custom-operation"), v6);

  }
}

- (void)libraryDataSource:(id)a3 addedAssets:(id)a4 inGroup:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1DBE8;
  v9[3] = &unk_C1918;
  v9[4] = self;
  v10 = a3;
  v11 = a4;
  v7 = v11;
  v8 = v10;
  objc_msgSend(a5, "addOperationBlock:", v9);

}

- (void)_libraryDataSource:(id)a3 addedAssets:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = BKLibraryLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_81024(v7, v9);

  if (objc_msgSend(v7, "count"))
  {
    kdebug_trace(725352872, 0, 0, 0, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1DCF8;
    v10[3] = &unk_C1BE8;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[BKLibraryManager performNamed:workerQueueBlock:](self, "performNamed:workerQueueBlock:", CFSTR("addedAssets"), v10);

  }
}

- (void)libraryDataSource:(id)a3 addedAsset:(id)a4 inGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  -[BKLibraryManager libraryDataSource:addedAssets:inGroup:](self, "libraryDataSource:addedAssets:inGroup:", v10, v11, v8, v12);
}

- (void)libraryDataSource:(id)a3 removedAsset:(id)a4 inGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  -[BKLibraryManager libraryDataSource:removedAssets:inGroup:](self, "libraryDataSource:removedAssets:inGroup:", v10, v11, v8, v12);
}

- (void)libraryDataSource:(id)a3 updatedAsset:(id)a4 inGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  -[BKLibraryManager libraryDataSource:updatedAssets:inGroup:](self, "libraryDataSource:updatedAssets:inGroup:", v10, v11, v8, v12);
}

- (void)libraryDataSource:(id)a3 reloadInGroup:(id)a4
{
  id v5;
  _QWORD v6[5];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1E114;
  v6[3] = &unk_C12F8;
  v6[4] = self;
  v7 = a3;
  v5 = v7;
  objc_msgSend(a4, "addOperationBlock:", v6);

}

- (void)libraryDataSource:(id)a3 updateWithName:(id)a4 block:(id)a5
{
  -[BKLibraryManager _scheduleOperationGroupWithName:block:](self, "_scheduleOperationGroupWithName:block:", a4, a5);
}

- (void)libraryDataSource:(id)a3 addedAssets:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  BKLibraryManager *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1E1E0;
  v7[3] = &unk_C1ED0;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[BKLibraryManager libraryDataSource:updateWithName:block:](v8, "libraryDataSource:updateWithName:block:", v6, CFSTR("addedAssets"), v7);

}

- (void)libraryDataSource:(id)a3 removedAssets:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  BKLibraryManager *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1E2A4;
  v7[3] = &unk_C1ED0;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[BKLibraryManager libraryDataSource:updateWithName:block:](v8, "libraryDataSource:updateWithName:block:", v6, CFSTR("removedAssets"), v7);

}

- (void)libraryDataSource:(id)a3 removedAssetsWithAssetIDs:(id)a4 orTemporaryAssetIDs:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  BKLibraryManager *v11;
  id v12;
  id v13;
  id v14;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1E388;
  v10[3] = &unk_C1EF8;
  v11 = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v7 = v14;
  v8 = v13;
  v9 = v12;
  -[BKLibraryManager libraryDataSource:updateWithName:block:](v11, "libraryDataSource:updateWithName:block:", v9, CFSTR("removedAssets"), v10);

}

- (void)libraryDataSource:(id)a3 updatedAssets:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  BKLibraryManager *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1E44C;
  v7[3] = &unk_C1ED0;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[BKLibraryManager libraryDataSource:updateWithName:block:](v8, "libraryDataSource:updateWithName:block:", v6, CFSTR("updatedAssets"), v7);

}

- (void)libraryDataSource:(id)a3 addedAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  -[BKLibraryManager libraryDataSource:addedAssets:](self, "libraryDataSource:addedAssets:", v7, v8, v9);
}

- (void)libraryDataSource:(id)a3 removedAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  -[BKLibraryManager libraryDataSource:removedAssets:](self, "libraryDataSource:removedAssets:", v7, v8, v9);
}

- (void)libraryDataSource:(id)a3 updatedAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  -[BKLibraryManager libraryDataSource:updatedAssets:](self, "libraryDataSource:updatedAssets:", v7, v8, v9);
}

- (void)_notifyLibraryOperationDone:(unint64_t)a3 assetIDs:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v6 = a4;
  if (!v6)
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v10[0] = CFSTR("BKLibraryOperationType");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v10[1] = CFSTR("BKLibraryOperationAssetIDs");
  v11[0] = v8;
  v11[1] = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("BKLibraryOperationCompleteNotification"), self, v9);

}

- (void)setCloudStateOnAssetWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = -[BKLibraryManager newManagedObjectContext](self, "newManagedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NewMOC 11 %s %@"), "-[BKLibraryManager setCloudStateOnAssetWithID:]", v4));
  objc_msgSend(v7, "setName:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager libraryMutableAssetWithAssetID:inManagedObjectContext:](self, "libraryMutableAssetWithAssetID:inManagedObjectContext:", v4, v7));
  if (v6)
  {
    if (objc_msgSend(v6, "state") != 3)
      objc_msgSend(v6, "setState:", 3);
    objc_msgSend(v6, "setDifferentObject:forKey:", 0, CFSTR("localOnlySeriesItemsParent"));
    objc_msgSend(v7, "saveLibrary");
  }

}

- (id)existingAssetIDsFromAssetIDs:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[4];
  BKLibraryManager *v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_88C4;
  v14 = sub_88D4;
  v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1E93C;
  v6[3] = &unk_C1F20;
  v9 = &v10;
  v7 = self;
  v3 = a3;
  v8 = v3;
  -[BKLibraryManager performBackgroundReadOnlyBlockAndWait:](v7, "performBackgroundReadOnlyBlockAndWait:", v6);
  v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (id)assetIDsOfStoreBookAssets
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@ || %K == %@"), CFSTR("contentType"), &off_C9DC0, CFSTR("contentType"), &off_C9DD8));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager assetIDsOfStoreAssetsWithPredicate:](self, "assetIDsOfStoreAssetsWithPredicate:", v3));

  return v4;
}

- (id)assetIDsOfStoreAudiobookAssets
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("contentType"), &off_C9DA8));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager assetIDsOfStoreAssetsWithPredicate:](self, "assetIDsOfStoreAssetsWithPredicate:", v3));

  return v4;
}

- (id)assetIDsOfStoreAssetsWithPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BKLibraryManagedObjectContext *readOnlyChildContext;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[2];
  const __CFString *v27;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  v27 = CFSTR("assetID");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
  objc_msgSend(v5, "setPropertiesToFetch:", v6);

  objc_msgSend(v5, "setResultType:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForDownloadableStoreLibraryAssets](BKLibraryManager, "predicateForDownloadableStoreLibraryAssets"));
  v26[0] = v7;
  v26[1] = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v8));
  objc_msgSend(v5, "setPredicate:", v9);

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_88C4;
  v24[4] = sub_88D4;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_88C4;
  v22 = sub_88D4;
  readOnlyChildContext = self->_readOnlyChildContext;
  v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1ECE4;
  v14[3] = &unk_C1F48;
  v14[4] = self;
  v11 = v5;
  v15 = v11;
  v16 = v24;
  v17 = &v18;
  -[BKLibraryManagedObjectContext performBlockAndWait:](readOnlyChildContext, "performBlockAndWait:", v14);
  v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v24, 8);

  return v12;
}

- (id)storeIDsOfStoreAssetsWithPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BKLibraryManagedObjectContext *readOnlyChildContext;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[2];
  const __CFString *v27;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  v27 = CFSTR("storeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
  objc_msgSend(v5, "setPropertiesToFetch:", v6);

  objc_msgSend(v5, "setResultType:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForDownloadableStoreLibraryAssets](BKLibraryManager, "predicateForDownloadableStoreLibraryAssets"));
  v26[0] = v7;
  v26[1] = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v8));
  objc_msgSend(v5, "setPredicate:", v9);

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_88C4;
  v24[4] = sub_88D4;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_88C4;
  v22 = sub_88D4;
  readOnlyChildContext = self->_readOnlyChildContext;
  v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1EFE0;
  v14[3] = &unk_C1F48;
  v14[4] = self;
  v11 = v5;
  v15 = v11;
  v16 = v24;
  v17 = &v18;
  -[BKLibraryManagedObjectContext performBlockAndWait:](readOnlyChildContext, "performBlockAndWait:", v14);
  v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v24, 8);

  return v12;
}

- (void)assetIDsOfPurchasedStoreAssets:(id)a3
{
  id v3;
  _QWORD v4[4];
  BKLibraryManager *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1F110;
  v4[3] = &unk_C1F70;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[BKLibraryManager performBackgroundReadOnlyBlock:](v5, "performBackgroundReadOnlyBlock:", v4);

}

- (void)storeAssetIDsOfWantToReadWithLimit:(int64_t)a3 completion:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;
  int64_t v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1F324;
  v7[3] = &unk_C1F98;
  v8 = a4;
  v9 = a3;
  v6 = v8;
  -[BKLibraryManager performBlockOnWorkerQueue:](self, "performBlockOnWorkerQueue:", v7);

}

- (id)storeAssetIDsOfWantToReadWithLimit:(int64_t)a3 inMoc:(id)a4
{
  return -[BKLibraryManager storeAssetIDsOfCollectionMembersWithLimit:collectionID:inMoc:](self, "storeAssetIDsOfCollectionMembersWithLimit:collectionID:inMoc:", a3, kBKCollectionDefaultIDWantToRead, a4);
}

- (id)storeAssetIDsOfFinishedCollectionWithLimit:(int64_t)a3 inMoc:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_msgSend((id)objc_opt_class(self), "predicateFor_All_Finished_LibraryAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager assetIDsOfStoreAssetsWithPredicate:](self, "assetIDsOfStoreAssetsWithPredicate:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v7));
  return v8;
}

- (id)storeAssetIDsOfSamplesCollectionWithLimit:(int64_t)a3 inMoc:(id)a4
{
  return -[BKLibraryManager storeAssetIDsOfCollectionMembersWithLimit:collectionID:inMoc:](self, "storeAssetIDsOfCollectionMembersWithLimit:collectionID:inMoc:", a3, kBKCollectionDefaultIDSamples, a4);
}

- (id)storeAssetIDsOfCollectionMembersWithLimit:(int64_t)a3 collectionID:(id)a4 inMoc:(id)a5
{
  id v7;
  id v8;
  id v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v33;
  _QWORD v34[4];
  _QWORD v35[2];
  const __CFString *v36;

  v7 = a5;
  v8 = a4;
  v9 = objc_alloc((Class)NSFetchRequest);
  v10 = (objc_class *)objc_opt_class(BKCollectionMember);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_msgSend(v9, "initWithEntityName:", v12);

  v36 = CFSTR("assetID");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
  objc_msgSend(v13, "setPropertiesToFetch:", v14);

  objc_msgSend(v13, "setResultType:", 2);
  objc_msgSend(v13, "setReturnsObjectsAsFaults:", 0);
  v15 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("sortKey"), 0);
  v35[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("assetID"), 0));
  v35[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));
  objc_msgSend(v13, "setSortDescriptors:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForCollectionMembersInCollectionID:hideUnownedItems:](BKLibraryManager, "predicateForCollectionMembersInCollectionID:hideUnownedItems:", v8, 0));
  v34[0] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingCollectionMembersWithSideloadedAssets](BKLibraryManager, "predicateForExcludingCollectionMembersWithSideloadedAssets"));
  v34[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingCollectionMembersWithContainerLibraryAssets](BKLibraryManager, "predicateForExcludingCollectionMembersWithContainerLibraryAssets"));
  v34[2] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeCollectionMembersForAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeCollectionMembersForAudiobookSupplementalContent"));
  v34[3] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 4));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v22));
  objc_msgSend(v13, "setPredicate:", v23);

  if (a3)
    objc_msgSend(v13, "setFetchLimit:", a3);
  v33 = 0;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v13, &v33));
  v25 = v33;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "valueForKey:", CFSTR("assetID")));
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bu_arrayByRemovingNSNulls"));
  v28 = (void *)v27;
  v29 = &__NSArray0__struct;
  if (v27)
    v29 = (void *)v27;
  v30 = v29;

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v30));
  return v31;
}

- (void)_sortAndInitializeDataSources:(id)a3
{
  NSArray *v4;
  NSArray *dataSources;
  id v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (!self->_dataSources)
  {
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "sortedArrayUsingComparator:", &stru_C1FD8));
    dataSources = self->_dataSources;
    self->_dataSources = v4;

    v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](self->_dataSources, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = self->_dataSources;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "setLibraryManager:", self, (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v13);

          if ((objc_opt_respondsToSelector(v12, "processingAuthentication") & 1) != 0)
            objc_msgSend(v12, "addObserver:forKeyPath:options:context:", self, CFSTR("processingAuthentication"), 0, off_DCD38);
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    v14 = objc_msgSend(v6, "copy");
    -[BKLibraryManager setDataSourcesByIdentifier:](self, "setDataSourcesByIdentifier:", v14);

  }
}

- (id)_dataSourceMatchingPredicate:(id)a3
{
  uint64_t (**v4)(id, void *);
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = (uint64_t (**)(id, void *))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((v4[2](v4, v9) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_dataSourcesMatchingPredicate:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  NSMutableArray *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = (unsigned int (**)(id, _QWORD))a3;
  v5 = objc_opt_new(NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (v4[2](v4, v11))
          -[NSMutableArray addObject:](v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)dq_unclaimAllLibraryAssetsWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf;
  char v34[15];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _BYTE v40[128];
  _QWORD v41[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager assetUpdatesByIdentifier](self, "assetUpdatesByIdentifier"));
  objc_msgSend(v5, "removeAllObjects");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager identifiersForAssetsNeedingReconcile](self, "identifiersForAssetsNeedingReconcile"));
  objc_msgSend(v6, "removeAllObjects");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  objc_msgSend(v7, "setResultType:", 2);
  objc_msgSend(v7, "setFetchBatchSize:", 128);
  v41[0] = CFSTR("objectID");
  v41[1] = CFSTR("assetID");
  v41[2] = CFSTR("temporaryAssetID");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 3));
  objc_msgSend(v7, "setPropertiesToFetch:", v8);

  v39 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeFetchRequest:error:", v7, &v39));
  v10 = v39;
  v11 = v10;
  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager unclaimedAssetIDs](self, "unclaimedAssetIDs"));
    objc_msgSend(v12, "removeAllObjects");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager unclaimedTemporaryAssetIDs](self, "unclaimedTemporaryAssetIDs"));
    objc_msgSend(v13, "removeAllObjects");

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v14 = v9;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (!v15)
      goto LABEL_21;
    v16 = v15;
    v29 = v11;
    v30 = v9;
    v31 = v7;
    v32 = v4;
    v17 = *(_QWORD *)v36;
    while (1)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "valueForKey:", CFSTR("assetID")));
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "valueForKey:", CFSTR("temporaryAssetID")));
        v22 = (void *)v21;
        if (v20)
        {
          v23 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager unclaimedAssetIDs](self, "unclaimedAssetIDs"));
          v24 = v23;
          v25 = v20;
LABEL_11:
          -[NSObject addObject:](v23, "addObject:", v25);
          goto LABEL_12;
        }
        if (v21)
        {
          v23 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager unclaimedTemporaryAssetIDs](self, "unclaimedTemporaryAssetIDs"));
          v24 = v23;
          v25 = v22;
          goto LABEL_11;
        }
        v26 = BKLibraryLog(0);
        v24 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          sub_81198(&buf, v34, v24);
LABEL_12:

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v27 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      v16 = v27;
      if (!v27)
      {
        v7 = v31;
        v4 = v32;
        v11 = v29;
        v9 = v30;
        goto LABEL_21;
      }
    }
  }
  if (v10)
  {
    v28 = BKLibraryLog(v10);
    v14 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_81138();
LABEL_21:

  }
}

- (id)dq_assetsToReconcile
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager assetUpdatesByIdentifier](self, "assetUpdatesByIdentifier"));
  v4 = objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager identifiersForAssetsNeedingReconcile](self, "identifiersForAssetsNeedingReconcile"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
  objc_msgSend(v6, "removeObjectsInArray:", v8);

  objc_msgSend(v4, "removeObjectsForKeys:", v6);
  return v4;
}

- (void)_removePossibleDupes:(id)a3 inMoc:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
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
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableSet);
  v8 = objc_alloc_init((Class)NSMutableSet);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "assetID"));
        v16 = objc_msgSend(v15, "length");

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "assetID"));
          objc_msgSend(v7, "addObject:", v17);

        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "temporaryAssetID"));
        v19 = objc_msgSend(v18, "length");

        if (v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "temporaryAssetID"));
          objc_msgSend(v8, "addObject:", v20);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v11);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K IN %@) OR (%K IN %@)"), CFSTR("assetID"), v22, CFSTR("temporaryAssetID"), v23));
  objc_msgSend(v21, "setPredicate:", v24);

  objc_msgSend(v21, "setFetchBatchSize:", 32);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v21, 0));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager _removeDupesByAssetID:inMoc:](self, "_removeDupesByAssetID:inMoc:", v25, v6));
  -[BKLibraryManager _removeDupesByTemporaryAssetID:inMoc:](self, "_removeDupesByTemporaryAssetID:inMoc:", v26, v6);

}

- (id)_removeDupesByAssetID:(id)a3 inMoc:(id)a4
{
  id v5;
  _UNKNOWN **v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *j;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *k;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  void *m;
  id v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  id v59;
  id v60;
  id obj;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  void *v67;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[4];
  uint64_t v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];

  v5 = a3;
  v59 = a4;
  v6 = &_s10Foundation12NotificationV6objectypSgvg_ptr;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v63 = objc_alloc_init((Class)NSMutableArray);
  v64 = objc_alloc_init((Class)NSMutableDictionary);
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v103, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v86 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetID", v59));
        if (objc_msgSend(v13, "length"))
        {
          v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "objectForKeyedSubscript:", v13));
          if (!v14)
          {
            v14 = objc_alloc_init((Class)v6[331]);
            objc_msgSend(v64, "setObject:forKeyedSubscript:", v14, v13);
          }
          objc_msgSend(v14, "addObject:", v12);

        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "temporaryAssetID"));
          v16 = objc_msgSend(v15, "length");

          if (v16)
          {
            v18 = v63;
          }
          else
          {
            v19 = BKLibraryLog(v17);
            v20 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "author"));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dataSourceIdentifier"));
              *(_DWORD *)buf = 138412802;
              v90 = (uint64_t)v21;
              v91 = 2112;
              v92 = v22;
              v93 = 2114;
              v94 = (uint64_t)v23;
              _os_log_error_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "_removeDupesByAssetID encountered asset without assetID and temporaryAssetID. title: %@, author: %@, dataSource: %{public}@.", buf, 0x20u);

              v6 = &_s10Foundation12NotificationV6objectypSgvg_ptr;
            }

            v18 = v7;
          }
          objc_msgSend(v18, "addObject:", v12);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v103, 16);
    }
    while (v9);
  }

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v60 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "allValues"));
  v66 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v81, v102, 16);
  if (v66)
  {
    v65 = *(_QWORD *)v82;
    v62 = v7;
    do
    {
      for (j = 0; j != v66; j = (char *)j + 1)
      {
        if (*(_QWORD *)v82 != v65)
          objc_enumerationMutation(v60);
        v25 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)j);
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v26 = v25;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v77, v101, 16);
        if (v27)
        {
          v28 = v27;
          v67 = j;
          v29 = 0;
          v30 = *(_QWORD *)v78;
          do
          {
            for (k = 0; k != v28; k = (char *)k + 1)
            {
              if (*(_QWORD *)v78 != v30)
                objc_enumerationMutation(v26);
              v32 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)k);
              if (v29)
              {
                v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourcesByIdentifier](self, "dataSourcesByIdentifier"));
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "dataSourceIdentifier"));
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", v34));

                v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourcesByIdentifier](self, "dataSourcesByIdentifier"));
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "dataSourceIdentifier"));
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", v37));

                v39 = objc_msgSend(v38, "rank");
                if ((uint64_t)v39 < (uint64_t)objc_msgSend(v35, "rank"))
                {
                  v40 = v32;

                  v29 = v40;
                }

              }
              else
              {
                v29 = v32;
              }
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v77, v101, 16);
          }
          while (v28);

          if (v29)
            objc_msgSend(v63, "addObject:", v29);
          v7 = v62;
          j = v67;
        }
        else
        {

          v29 = 0;
        }
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v41 = v26;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v73, v100, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v74;
          do
          {
            for (m = 0; m != v43; m = (char *)m + 1)
            {
              if (*(_QWORD *)v74 != v44)
                objc_enumerationMutation(v41);
              if (*(id *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)m) != v29)
                objc_msgSend(v7, "addObject:");
            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v73, v100, 16);
          }
          while (v43);
        }

      }
      v66 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v81, v102, 16);
    }
    while (v66);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v46 = v7;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v69, v99, 16);
  v48 = v59;
  if (v47)
  {
    v49 = v47;
    v50 = *(_QWORD *)v70;
    do
    {
      v51 = 0;
      do
      {
        if (*(_QWORD *)v70 != v50)
          objc_enumerationMutation(v46);
        v52 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v51);
        v53 = BKLibraryLog(v47);
        v54 = objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "assetID"));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "temporaryAssetID"));
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "dataSourceIdentifier"));
          *(_DWORD *)buf = 141559042;
          v90 = 1752392040;
          v91 = 2112;
          v92 = v55;
          v93 = 2160;
          v94 = 1752392040;
          v95 = 2112;
          v96 = v56;
          v97 = 2114;
          v98 = v57;
          _os_log_impl(&dword_0, v54, OS_LOG_TYPE_DEFAULT, "Delete Asset from BKLibraryManager (possibleDuplicateAssets) with duplicate assetID: %{mask.hash}@ [%{mask.hash}@], dataSource: %{public}@", buf, 0x34u);

          v48 = v59;
        }

        v47 = objc_msgSend(v48, "deleteObject:", v52);
        v51 = (char *)v51 + 1;
      }
      while (v49 != v51);
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v69, v99, 16);
      v49 = v47;
    }
    while (v47);
  }

  return v63;
}

- (void)_removeDupesByTemporaryAssetID:(id)a3 inMoc:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *k;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id obj;
  id v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t buf[4];
  uint64_t v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];

  v5 = a3;
  v63 = a4;
  v65 = objc_alloc_init((Class)NSMutableArray);
  v61 = objc_alloc_init((Class)NSMutableDictionary);
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v85 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "temporaryAssetID"));
        if (objc_msgSend(v11, "length"))
        {
          v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKeyedSubscript:", v11));
          if (!v12)
          {
            v12 = objc_alloc_init((Class)NSMutableArray);
            objc_msgSend(v61, "setObject:forKeyedSubscript:", v12, v11);
          }
          objc_msgSend(v12, "addObject:", v10);

        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetID"));
          v14 = objc_msgSend(v13, "length");

          if (!v14)
          {
            v16 = BKLibraryLog(v15);
            v17 = objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "author"));
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataSourceIdentifier"));
              *(_DWORD *)buf = 138412802;
              v89 = (uint64_t)v18;
              v90 = 2112;
              v91 = v19;
              v92 = 2114;
              v93 = (uint64_t)v20;
              _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "_removeDupesByTemporaryAssetID encountered asset without assetID and temporaryAssetID. title: %@, author: %@, dataSource: %{public}@.", buf, 0x20u);

            }
            objc_msgSend(v65, "addObject:", v10);
          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v102, 16);
    }
    while (v7);
  }

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v59 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "allValues"));
  v21 = v65;
  v64 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
  if (v64)
  {
    v62 = *(_QWORD *)v81;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v81 != v62)
          objc_enumerationMutation(v59);
        v23 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v22);
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v24 = v23;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v76, v100, 16);
        v66 = v22;
        if (!v25)
        {
          v27 = 0;
          goto LABEL_39;
        }
        v26 = v25;
        v27 = 0;
        v28 = *(_QWORD *)v77;
        do
        {
          for (j = 0; j != v26; j = (char *)j + 1)
          {
            if (*(_QWORD *)v77 != v28)
              objc_enumerationMutation(v24);
            v30 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)j);
            if (v27)
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1)
                                                                                 + 8 * (_QWORD)j), "assetID"));
              if (objc_msgSend(v31, "length"))
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "assetID"));
                v33 = objc_msgSend(v32, "length");

                if (!v33)
                {
                  v34 = v30;

                  v27 = v34;
                  continue;
                }
              }
              else
              {

              }
              v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourcesByIdentifier](self, "dataSourcesByIdentifier"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dataSourceIdentifier"));
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", v36));

              v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourcesByIdentifier](self, "dataSourcesByIdentifier"));
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "dataSourceIdentifier"));
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", v39));

              v41 = objc_msgSend(v40, "rank");
              if ((uint64_t)v41 < (uint64_t)objc_msgSend(v37, "rank"))
              {
                v42 = v30;

                v27 = v42;
              }

            }
            else
            {
              v27 = v30;
            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v76, v100, 16);
        }
        while (v26);
LABEL_39:

        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v43 = v24;
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v72, v99, 16);
        v21 = v65;
        if (v44)
        {
          v45 = v44;
          v46 = *(_QWORD *)v73;
          do
          {
            for (k = 0; k != v45; k = (char *)k + 1)
            {
              if (*(_QWORD *)v73 != v46)
                objc_enumerationMutation(v43);
              if (*(id *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)k) != v27)
                objc_msgSend(v65, "addObject:");
            }
            v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v72, v99, 16);
          }
          while (v45);
        }

        v22 = v66 + 1;
      }
      while ((id)(v66 + 1) != v64);
      v64 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
    }
    while (v64);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v48 = v21;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v68, v98, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v69;
    do
    {
      v52 = 0;
      do
      {
        if (*(_QWORD *)v69 != v51)
          objc_enumerationMutation(v48);
        v53 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)v52);
        v54 = BKLibraryLog(v49);
        v55 = objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "assetID"));
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "temporaryAssetID"));
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "dataSourceIdentifier"));
          *(_DWORD *)buf = 141559042;
          v89 = 1752392040;
          v90 = 2112;
          v91 = v56;
          v92 = 2160;
          v93 = 1752392040;
          v94 = 2112;
          v95 = v57;
          v96 = 2114;
          v97 = v58;
          _os_log_impl(&dword_0, v55, OS_LOG_TYPE_DEFAULT, "Delete Asset from BKLibraryManager (possibleDuplicateAssets) %{mask.hash}@ with duplicate temporaryAssetID: [%{mask.hash}@], dataSource: %{public}@", buf, 0x34u);

        }
        v49 = objc_msgSend(v63, "deleteObject:", v53);
        v52 = (char *)v52 + 1;
      }
      while (v50 != v52);
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v68, v98, 16);
      v50 = v49;
    }
    while (v49);
  }

}

- (void)wq_dq_integrateClaimedAssetsReason:(signed __int16)a3 context:(id)a4
{
  OS_dispatch_queue *v5;
  id v6;
  unsigned __int8 v7;
  uint64_t v8;
  NSObject *v9;
  const void *(__cdecl *v10)(CFAllocatorRef, const void *);
  CFStringRef (__cdecl *v11)(const void *);
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const void *(__cdecl *v17)(CFAllocatorRef, const void *);
  uint64_t v18;
  __int128 v19;
  void *i;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  _BOOL4 v38;
  void *v39;
  BOOL v40;
  void *v41;
  _BOOL4 v42;
  uint64_t v43;
  signed int v44;
  void *v45;
  signed int v46;
  void *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  void *j;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  __CFSet *v67;
  NSObject *v68;
  uint64_t v69;
  NSObject *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  void *v81;
  const void *(__cdecl *v82)(CFAllocatorRef, const void *);
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  void *k;
  id v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  const void *(__cdecl *v95)(CFAllocatorRef, const void *);
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  NSObject *v101;
  void *v102;
  NSObject *v103;
  uint64_t v104;
  NSObject *v105;
  void *v106;
  void *v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  NSObject *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  NSObject *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  NSObject *v120;
  const void *(__cdecl *v121)(CFAllocatorRef, const void *);
  void *v122;
  void *v123;
  id v124;
  void *v125;
  void *v126;
  NSMutableSet *v127;
  id v128;
  id v129;
  id v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  CFMutableSetRef v135;
  unsigned int v136;
  id v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  id obj;
  void *v144;
  NSObject *v145;
  id v146;
  id v147;
  id v148;
  id v149;
  void *v150;
  id v151;
  uint64_t v152;
  BKLibraryManager *v153;
  void *v154;
  _QWORD block[5];
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  id v160;
  _QWORD v161[4];
  __CFSet *v162;
  BKLibraryManager *v163;
  id v164;
  NSMutableSet *v165;
  NSObject *v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  _BYTE *v172;
  __int16 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  id v182;
  const __CFString *v183;
  id v184;
  _QWORD v185[3];
  _QWORD v186[3];
  _BYTE v187[128];
  _QWORD v188[2];
  uint8_t v189[4];
  const char *v190;
  __int16 v191;
  void *v192;
  _BYTE v193[24];
  uint64_t v194;
  _BYTE v195[128];
  _QWORD v196[5];
  _QWORD v197[5];
  _BYTE v198[128];
  CFSetCallBacks buf;
  _QWORD v200[2];

  v136 = a3;
  v146 = a4;
  v153 = self;
  v5 = self->_dqSyncQueue;
  v6 = &_dispatch_main_q;
  if (v5 == (OS_dispatch_queue *)&_dispatch_main_q)
  {
    v7 = +[NSThread isMainThread](NSThread, "isMainThread");

    if ((v7 & 1) != 0)
      goto LABEL_5;
  }
  else
  {

  }
  dispatch_assert_queue_V2((dispatch_queue_t)v5);
LABEL_5:

  v154 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dq_assetsToReconcile](v153, "dq_assetsToReconcile"));
  v8 = BKLibraryLog(v154);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (const void *(__cdecl *)(CFAllocatorRef, const void *))objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v136));
    v11 = (CFStringRef (__cdecl *)(const void *))objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v154, "count")));
    LODWORD(buf.version) = 136315650;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)"-[BKLibraryManager wq_dq_integrateClaimedAssetsReason:context:]";
    WORD2(buf.retain) = 2112;
    *(CFSetRetainCallBack *)((char *)&buf.retain + 6) = v10;
    HIWORD(buf.release) = 2112;
    buf.copyDescription = v11;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%s: reason=%@, assetsToReconcile=%@", (uint8_t *)&buf, 0x20u);

  }
  v134 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager unclaimedAssetIDs](v153, "unclaimedAssetIDs"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager unclaimedTemporaryAssetIDs](v153, "unclaimedTemporaryAssetIDs"));
  v149 = objc_alloc_init((Class)NSMutableArray);
  v130 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v154, "count"));
  v128 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v154, "count"));
  v127 = objc_opt_new(NSMutableSet);
  v12 = objc_msgSend(v154, "count");
  if (v12)
  {
    kdebug_trace(725352860, 0, 0, 0, 0);
    v129 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "allKeys"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForAssetIDsTaggedLibraryAssets:](v153, "predicateForAssetIDsTaggedLibraryAssets:", v125));
    v122 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForTemporaryAssetIDsTaggedLibraryAssets:](BKLibraryManager, "predicateForTemporaryAssetIDsTaggedLibraryAssets:", v125));
    v200[0] = v123;
    v200[1] = v122;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v200, 2));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v13));
    objc_msgSend(v129, "setPredicate:", v14);

    objc_msgSend(v129, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(v129, "setFetchBatchSize:", 25);
    v182 = 0;
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "executeFetchRequest:error:", v129, &v182));
    v124 = v182;
    v15 = BKLibraryLog(v124);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (const void *(__cdecl *)(CFAllocatorRef, const void *))objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v126, "count")));
      LODWORD(buf.version) = 136315394;
      *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)"-[BKLibraryManager wq_dq_integrateClaimedAssetsReason:context:]";
      WORD2(buf.retain) = 2112;
      *(CFSetRetainCallBack *)((char *)&buf.retain + 6) = v17;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%s: toBeUpdatedLibraryAssets=%@", (uint8_t *)&buf, 0x16u);

    }
    if (v126)
    {
      v131 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v154, "count"));
      v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v19 = *(_OWORD *)&kCFTypeSetCallBacks.release;
      *(_OWORD *)&buf.version = *(_OWORD *)&kCFTypeSetCallBacks.version;
      *(_OWORD *)&buf.release = v19;
      *(_OWORD *)&buf.equal = *(_OWORD *)&kCFTypeSetCallBacks.equal;
      buf.retain = 0;
      buf.release = 0;
      v135 = CFSetCreateMutable(kCFAllocatorDefault, 0, &buf);
      v137 = objc_alloc_init((Class)NSMutableSet);
      v180 = 0u;
      v181 = 0u;
      v178 = 0u;
      v179 = 0u;
      obj = v126;
      v151 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v178, v198, 16);
      if (!v151)
        goto LABEL_61;
      v150 = *(void **)v179;
      while (1)
      {
        for (i = 0; i != v151; i = (char *)i + 1)
        {
          if (*(void **)v179 != v150)
            objc_enumerationMutation(obj);
          v21 = *(id *)(*((_QWORD *)&v178 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v21, "isValid"))
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "assetID"));
            v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "temporaryAssetID"));
            v24 = (void *)v23;
            if (v22)
            {
              v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "objectForKeyedSubscript:", v22));
              v25 = (void *)v23;
              if (v23)
                goto LABEL_23;
            }
            else
            {
              v25 = 0;
            }
            if (v24)
            {
              v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "objectForKeyedSubscript:", v24));
              v25 = (void *)v23;
            }
LABEL_23:
            if (v25)
            {
              if (objc_msgSend(v25, "dataSourcesBitmask"))
              {
                -[__CFSet addObject:](v135, "addObject:", v25);
                v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dataSourceIdentifier"));
                v27 = objc_msgSend(v25, "dataSourcesBitmask");
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](v153, "dataSources"));
                v29 = sub_C70C(v27, v28);
                v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
                v147 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));

                v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourcesByIdentifier](v153, "dataSourcesByIdentifier"));
                v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v26));

                v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourcesByIdentifier](v153, "dataSourcesByIdentifier"));
                v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v147));

                if (v144)
                {
                  v33 = objc_msgSend(v144, "rank");
                  if ((uint64_t)v33 <= (uint64_t)objc_msgSend(v141, "rank") || v136 == 4 || v136 == 2)
                  {
                    v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "asset"));
                    v34 = objc_msgSend(v25, "dataSourcesBitmask");
                    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](v153, "dataSources"));
                    if (!sub_227C8((uint64_t)v34, v35))
                      goto LABEL_42;
                    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "asset"));
                    v37 = v36 != 0;

                    if (v139)
                      v38 = v37;
                    else
                      v38 = 0;
                    if (v38)
                    {
                      objc_msgSend(v131, "addObject:", v139);
                      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "storeID"));
                      if (v39 && (v40 = objc_msgSend(v139, "contentType") == 6, v39, !v40))
                      {
                        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "storeID"));
                        objc_msgSend(v130, "addObject:", v35);
LABEL_42:

                      }
                      else
                      {
                        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "assetID"));
                        if (v41)
                        {
                          v42 = objc_msgSend(v139, "state") == 1;

                          if (v42)
                          {
                            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "assetID"));
                            objc_msgSend(v128, "addObject:", v35);
                            goto LABEL_42;
                          }
                        }
                      }
                    }
                    v44 = objc_msgSend(v21, "state");
                    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "asset"));
                    v46 = objc_msgSend(v45, "state");

                    v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](v153, "dataSources"));
                    v48 = sub_1B244(v153, v21, v25, v136, v47);

                    if (v48)
                      objc_msgSend(v132, "addObject:", v21);
                    if ((-[NSObject isEqualToString:](v26, "isEqualToString:", v147) & 1) == 0)
                    {
                      v197[0] = v147;
                      v196[0] = CFSTR("BKLibraryOwnershipNewDatasource");
                      v196[1] = CFSTR("BKLibraryOwnershipNewState");
                      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v46));
                      v197[1] = v49;
                      v196[2] = CFSTR("BKLibraryOwnershipAssetIDKey");
                      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "permanentOrTemporaryAssetID"));
                      v197[2] = v50;
                      v197[3] = v26;
                      v196[3] = CFSTR("BKLibraryOwnershipOldDatasource");
                      v196[4] = CFSTR("BKLibraryOwnershipOldState");
                      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v44));
                      v197[4] = v51;
                      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v197, v196, 5));
                      objc_msgSend(v149, "addObject:", v52);

                    }
                  }
                }
                if (v22)
                  objc_msgSend(v134, "removeObject:", v22);
                if (v24)
                  objc_msgSend(v133, "removeObject:", v24);
                if (v22)
                  objc_msgSend(v137, "addObject:", v22);
                if (v24)
                  objc_msgSend(v137, "addObject:", v24);

LABEL_57:
              }

              goto LABEL_59;
            }
            v43 = BKLibraryLog(v23);
            v26 = objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v193 = 138412546;
              *(_QWORD *)&v193[4] = v22;
              *(_WORD *)&v193[12] = 2112;
              *(_QWORD *)&v193[14] = v24;
              _os_log_debug_impl(&dword_0, v26, OS_LOG_TYPE_DEBUG, "We should have had an update for %@ / %@", v193, 0x16u);
            }
            goto LABEL_57;
          }
LABEL_59:

        }
        v151 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v178, v198, 16);
        if (!v151)
        {
LABEL_61:

          v176 = 0u;
          v177 = 0u;
          v174 = 0u;
          v175 = 0u;
          v53 = v137;
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v174, v195, 16);
          if (v54)
          {
            v55 = *(_QWORD *)v175;
            do
            {
              for (j = 0; j != v54; j = (char *)j + 1)
              {
                if (*(_QWORD *)v175 != v55)
                  objc_enumerationMutation(v53);
                v57 = *(_QWORD *)(*((_QWORD *)&v174 + 1) + 8 * (_QWORD)j);
                v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "objectForKeyedSubscript:", v57));
                v59 = v58;
                if (v58)
                  objc_msgSend(v58, "postIntegrateCleanup");
                objc_msgSend(v154, "removeObjectForKey:", v57);

              }
              v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v174, v195, 16);
            }
            while (v54);
          }

          v61 = BKLibraryLog(v60);
          v62 = objc_claimAutoreleasedReturnValue(v61);
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v132, "count")));
            *(_DWORD *)v193 = 136315394;
            *(_QWORD *)&v193[4] = "-[BKLibraryManager wq_dq_integrateClaimedAssetsReason:context:]";
            *(_WORD *)&v193[12] = 2112;
            *(_QWORD *)&v193[14] = v63;
            _os_log_impl(&dword_0, v62, OS_LOG_TYPE_DEFAULT, "%s: _removePossibleDupes=%@", v193, 0x16u);

          }
          v64 = BKLibraryLog(-[BKLibraryManager _removePossibleDupes:inMoc:](v153, "_removePossibleDupes:inMoc:", v132, v146));
          v65 = objc_claimAutoreleasedReturnValue(v64);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v154, "count")));
            *(_DWORD *)v193 = 136315394;
            *(_QWORD *)&v193[4] = "-[BKLibraryManager wq_dq_integrateClaimedAssetsReason:context:]";
            *(_WORD *)&v193[12] = 2112;
            *(_QWORD *)&v193[14] = v66;
            _os_log_impl(&dword_0, v65, OS_LOG_TYPE_DEFAULT, "%s: addOtherAssets, total=%@", v193, 0x16u);

          }
          *(_QWORD *)v193 = 0;
          *(_QWORD *)&v193[8] = v193;
          *(_QWORD *)&v193[16] = 0x2020000000;
          v194 = 0;
          v161[0] = _NSConcreteStackBlock;
          v161[1] = 3221225472;
          v161[2] = sub_22880;
          v161[3] = &unk_C2000;
          v67 = v135;
          v172 = v193;
          v162 = v67;
          v163 = v153;
          v164 = v146;
          v173 = v136;
          v165 = v127;
          v68 = v131;
          v166 = v68;
          v167 = v130;
          v168 = v128;
          v169 = v149;
          v170 = v134;
          v171 = v133;
          v69 = BKLibraryLog(objc_msgSend(v154, "enumerateKeysAndObjectsUsingBlock:", v161));
          v70 = objc_claimAutoreleasedReturnValue(v69);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)&v193[8] + 24)));
            *(_DWORD *)v189 = 136315394;
            v190 = "-[BKLibraryManager wq_dq_integrateClaimedAssetsReason:context:]";
            v191 = 2112;
            v192 = v71;
            _os_log_impl(&dword_0, v70, OS_LOG_TYPE_DEFAULT, "%s: addOtherAssets, %@ processed", v189, 0x16u);

          }
          v73 = BKLibraryLog(v72);
          v74 = objc_claimAutoreleasedReturnValue(v73);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            v75 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager assetUpdatesByIdentifier](v153, "assetUpdatesByIdentifier"));
            v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v75, "count")));
            *(_DWORD *)v189 = 136315394;
            v190 = "-[BKLibraryManager wq_dq_integrateClaimedAssetsReason:context:]";
            v191 = 2112;
            v192 = v76;
            _os_log_impl(&dword_0, v74, OS_LOG_TYPE_DEFAULT, "%s: postIntegrateCleanup=%@", v189, 0x16u);

          }
          v77 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager assetUpdatesByIdentifier](v153, "assetUpdatesByIdentifier"));
          objc_msgSend(v77, "enumerateKeysAndObjectsUsingBlock:", &stru_C2040);

          _Block_object_dispose(v193, 8);
          goto LABEL_82;
        }
      }
    }
    v78 = BKLibraryLog(v18);
    v68 = objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      sub_8138C();
LABEL_82:

  }
  else
  {
    v124 = 0;
  }
  v79 = BKLibraryLog(v12);
  v80 = objc_claimAutoreleasedReturnValue(v79);
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
  {
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager assetUpdatesByIdentifier](v153, "assetUpdatesByIdentifier"));
    v82 = (const void *(__cdecl *)(CFAllocatorRef, const void *))objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v81, "count")));
    LODWORD(buf.version) = 136315394;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)"-[BKLibraryManager wq_dq_integrateClaimedAssetsReason:context:]";
    WORD2(buf.retain) = 2112;
    *(CFSetRetainCallBack *)((char *)&buf.retain + 6) = v82;
    _os_log_impl(&dword_0, v80, OS_LOG_TYPE_DEFAULT, "%s: purge=%@", (uint8_t *)&buf, 0x16u);

  }
  if (objc_msgSend(v134, "count") || objc_msgSend(v133, "count"))
  {
    v142 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
    objc_msgSend(v142, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(v142, "setFetchBatchSize:", 25);
    if (objc_msgSend(v134, "count") && objc_msgSend(v133, "count"))
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForAssetIDsTaggedLibraryAssets:](v153, "predicateForAssetIDsTaggedLibraryAssets:", v134));
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForTemporaryAssetIDsTaggedLibraryAssets:](BKLibraryManager, "predicateForTemporaryAssetIDsTaggedLibraryAssets:", v133));
      v188[0] = v83;
      v188[1] = v84;
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v188, 2));
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v85));
      objc_msgSend(v142, "setPredicate:", v86);

    }
    else if (objc_msgSend(v134, "count"))
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForAssetIDsTaggedLibraryAssets:](v153, "predicateForAssetIDsTaggedLibraryAssets:", v134));
      objc_msgSend(v142, "setPredicate:", v83);
    }
    else
    {
      if (!objc_msgSend(v133, "count"))
        BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 5053, "-[BKLibraryManager wq_dq_integrateClaimedAssetsReason:context:]", "unclaimedTemporaryAssetsIDs.count", CFSTR("Expected some temporaryAssetIDs"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForTemporaryAssetIDsTaggedLibraryAssets:](BKLibraryManager, "predicateForTemporaryAssetIDsTaggedLibraryAssets:", v133));
      objc_msgSend(v142, "setPredicate:", v83);
    }

    v160 = 0;
    v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "executeFetchRequest:error:", v142, &v160));
    v87 = v160;
    v138 = v87;
    if (v140)
    {
      v145 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager imageSource](v153, "imageSource"));
      v158 = 0u;
      v159 = 0u;
      v156 = 0u;
      v157 = 0u;
      v148 = v140;
      v88 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v156, v187, 16);
      if (v88)
      {
        v152 = *(_QWORD *)v157;
        do
        {
          for (k = 0; k != v88; k = (char *)k + 1)
          {
            if (*(_QWORD *)v157 != v152)
              objc_enumerationMutation(v148);
            v90 = *(id *)(*((_QWORD *)&v156 + 1) + 8 * (_QWORD)k);
            if (objc_msgSend(v90, "isValid"))
            {
              v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "assetID"));
              v92 = objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "temporaryAssetID"));
              v93 = (void *)v92;
              if (v91)
                v94 = v91;
              else
                v94 = (void *)v92;
              v95 = v94;
              v185[0] = CFSTR("BKLibraryOwnershipOldDatasource");
              v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "dataSourceIdentifier"));
              v97 = v96;
              if (!v96)
              {
                v150 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                v97 = v150;
              }
              v186[0] = v97;
              v185[1] = CFSTR("BKLibraryOwnershipOldState");
              v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)objc_msgSend(v90, "state")));
              v185[2] = CFSTR("BKLibraryOwnershipAssetIDKey");
              v186[1] = v98;
              v186[2] = v95;
              v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v186, v185, 3));
              objc_msgSend(v149, "addObject:", v99);

              if (!v96)
              v100 = BKLibraryLog(-[NSObject removeImagesForAssetID:temporaryAssetID:](v145, "removeImagesForAssetID:temporaryAssetID:", v91, v93));
              v101 = objc_claimAutoreleasedReturnValue(v100);
              if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
              {
                v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "title"));
                LODWORD(buf.version) = 138412546;
                *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v102;
                WORD2(buf.retain) = 2112;
                *(CFSetRetainCallBack *)((char *)&buf.retain + 6) = v95;
                _os_log_debug_impl(&dword_0, v101, OS_LOG_TYPE_DEBUG, "Delete Asset from BKLibraryManager (unclaimedLibraryAsset) %@ [%@]", (uint8_t *)&buf, 0x16u);

              }
              -[BKLibraryManager archiveTransientProperties:](v153, "archiveTransientProperties:", v90);
              objc_msgSend(v146, "deleteObject:", v90);

            }
          }
          v88 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v156, v187, 16);
        }
        while (v88);
      }

      objc_msgSend(v134, "removeAllObjects");
      objc_msgSend(v133, "removeAllObjects");
      v103 = v145;
    }
    else
    {
      v104 = BKLibraryLog(v87);
      v105 = objc_claimAutoreleasedReturnValue(v104);
      v103 = v105;
      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      {
        sub_8132C();
        v103 = v105;
      }
    }

  }
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager identifiersForAssetsNeedingReconcile](v153, "identifiersForAssetsNeedingReconcile"));
  objc_msgSend(v106, "removeAllObjects");

  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "insertedObjects"));
  v108 = objc_msgSend(v107, "count");
  LOBYTE(v108) = v108 == -[NSMutableSet count](v127, "count");

  if ((v108 & 1) == 0)
  {
    v110 = BKLibraryLog(v109);
    v111 = objc_claimAutoreleasedReturnValue(v110);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
      sub_81274((uint64_t)v127, v146, v111);

  }
  -[BKLibraryManager wq_dq_saveDatabaseContext:](v153, "wq_dq_saveDatabaseContext:", v146);
  if (objc_msgSend(v149, "count"))
  {
    v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v183 = CFSTR("BKLibraryOwnershipAssetsKey");
    v184 = v149;
    v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v184, &v183, 1));
    objc_msgSend(v112, "postNotificationName:object:userInfo:", CFSTR("BKLibraryOwnershipDidChangeNotification"), v153, v113);

    v115 = BKLibraryLog(v114);
    v116 = objc_claimAutoreleasedReturnValue(v115);
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
      sub_811D4((uint64_t)v149, v136, v116);

  }
  v117 = &_dispatch_main_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_22D44;
  block[3] = &unk_C1400;
  block[4] = v153;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  v119 = BKLibraryLog(v118);
  v120 = objc_claimAutoreleasedReturnValue(v119);
  if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
  {
    v121 = (const void *(__cdecl *)(CFAllocatorRef, const void *))objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v136));
    LODWORD(buf.version) = 136315394;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)"-[BKLibraryManager wq_dq_integrateClaimedAssetsReason:context:]";
    WORD2(buf.retain) = 2112;
    *(CFSetRetainCallBack *)((char *)&buf.retain + 6) = v121;
    _os_log_impl(&dword_0, v120, OS_LOG_TYPE_DEFAULT, "%s: reason=%@, done", (uint8_t *)&buf, 0x16u);

  }
}

- (void)wq_reconcileDataSourceAssetsForReason:(signed __int16)a3 context:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  dispatch_time_t v21;
  id v22;
  dispatch_time_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const __CFString *v27;
  int v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  char v32;
  _QWORD v33[4];
  id v34;
  char v35;
  _QWORD v36[6];
  id v37;
  NSObject *v38;
  __int16 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  const __CFString *v48;

  v28 = a3;
  v5 = BKLibraryLog(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v28 == 4)
      v7 = CFSTR("Reload");
    else
      v7 = CFSTR("Other");
    *(_DWORD *)buf = 136315394;
    v46 = "-[BKLibraryManager wq_reconcileDataSourceAssetsForReason:context:]";
    v47 = 2112;
    v48 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%s: reason=%@", buf, 0x16u);
  }

  kdebug_trace(725353720, 4, 0, 0, 0);
  v8 = dispatch_group_create();
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("identifier")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v10));

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        dispatch_group_enter(v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager completionQueue](self, "completionQueue"));
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_231D8;
        v36[3] = &unk_C2090;
        v36[4] = self;
        v36[5] = v16;
        v39 = v28;
        v37 = v29;
        v38 = v8;
        sub_14394(v16, v17, v36);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v13);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager delegate](self, "delegate"));
  v19 = objc_opt_respondsToSelector(v18, "initialDataSourceFetchInitiated");

  if ((v19 & 1) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager delegate](self, "delegate"));
    objc_msgSend(v20, "initialDataSourceFetchInitiated");

  }
  v21 = dispatch_time(0, 60000000000);
  if (dispatch_group_wait(v8, v21))
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_23450;
    v33[3] = &unk_C20B8;
    v35 = 0;
    v22 = v29;
    v34 = v22;
    -[BKLibraryManager dq_sync:](self, "dq_sync:", v33);
    v23 = dispatch_time(0, 120000000000);
    if (dispatch_group_wait(v8, v23))
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_2354C;
      v30[3] = &unk_C20B8;
      v32 = 0;
      v31 = v22;
      -[BKLibraryManager dq_sync:](self, "dq_sync:", v30);
      dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);

    }
  }
  v24 = kdebug_trace(725353720, 5, 0, 0, 0);
  v25 = BKLibraryLog(v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = CFSTR("Other");
    if (v28 == 4)
      v27 = CFSTR("Reload");
    *(_DWORD *)buf = 136315394;
    v46 = "-[BKLibraryManager wq_reconcileDataSourceAssetsForReason:context:]";
    v47 = 2112;
    v48 = v27;
    _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "%s: reason=%@, done", buf, 0x16u);
  }

}

- (id)metadataForAssetAtURL:(id)a3 needsCoordination:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  dispatch_semaphore_t v15;
  dispatch_time_t v16;
  id v17;
  _QWORD v19[5];
  id v20;
  NSObject *v21;
  _QWORD *v22;
  uint64_t *v23;
  _QWORD v24[5];
  id v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_88C4;
  v31 = sub_88D4;
  v32 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_238A4;
  v24[3] = &unk_C20E0;
  v24[4] = self;
  v26 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
  v25 = v7;
  v8 = objc_retainBlock(v24);
  if (v7)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("path"), v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
      v11 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:](self, "p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:", v7, v9, v10));

      v12 = ((uint64_t (*)(_QWORD *, NSObject *))v8[2])(v8, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)v28[5];
      v28[5] = v13;

    }
    else
    {
      v15 = dispatch_semaphore_create(0);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_23A7C;
      v19[3] = &unk_C2108;
      v19[4] = self;
      v20 = v7;
      v23 = &v27;
      v22 = v8;
      v11 = v15;
      v21 = v11;
      -[BKLibraryManager performBackgroundReadOnlyBlock:](self, "performBackgroundReadOnlyBlock:", v19);
      v16 = dispatch_time(0, 1000000000);
      dispatch_semaphore_wait(v11, v16);

    }
  }
  v17 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v17;
}

- (id)assetIDForAssetAtURLOnMainThread:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4 && +[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("path"), v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:](self, "p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:", v5, v7, v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "permanentOrTemporaryAssetID"));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)pageProgressionDirectionForAssetAtURLOnMainThread:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4 && +[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("path"), v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:](self, "p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:", v5, v7, v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pageProgressionDirection"));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)bookDescriptionForAssetID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_88C4;
  v17 = sub_88D4;
  v18 = 0;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager libraryAssetOnMainQueueWithAssetID:](self, "libraryAssetOnMainQueueWithAssetID:", v4));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bookDescription"));
    v7 = (void *)v14[5];
    v14[5] = v6;

  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_23E7C;
    v10[3] = &unk_C2130;
    v10[4] = self;
    v11 = v4;
    v12 = &v13;
    -[BKLibraryManager performBackgroundReadOnlyBlockAndWait:](self, "performBackgroundReadOnlyBlockAndWait:", v10);

  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)seriesTitleForAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_88C4;
  v20 = sub_88D4;
  v21 = 0;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager libraryAssetOnMainQueueWithAssetID:](self, "libraryAssetOnMainQueueWithAssetID:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "seriesID"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "seriesID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager libraryAssetOnMainQueueWithAssetID:](self, "libraryAssetOnMainQueueWithAssetID:", v7));

      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
      v10 = (void *)v17[5];
      v17[5] = v9;

    }
    else
    {
      v8 = v5;
    }

  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_24060;
    v13[3] = &unk_C2130;
    v13[4] = self;
    v14 = v4;
    v15 = &v16;
    -[BKLibraryManager performBackgroundReadOnlyBlockAndWait:](self, "performBackgroundReadOnlyBlockAndWait:", v13);

  }
  v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (void)deleteAssetIDs:(id)a3
{
  -[BKLibraryManager deleteAssets:exhaustive:](self, "deleteAssets:exhaustive:", a3, 0);
}

- (void)deleteAssetIDs:(id)a3 exhaustive:(BOOL)a4
{
  id v5;
  _QWORD v6[4];
  BKLibraryManager *v7;
  id v8;
  BOOL v9;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_241A4;
  v6[3] = &unk_C2158;
  v7 = self;
  v8 = a3;
  v9 = a4;
  v5 = v8;
  -[BKLibraryManager performBackgroundReadOnlyBlock:](v7, "performBackgroundReadOnlyBlock:", v6);

}

- (void)didHidePurchasedAssetID:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionController](self, "collectionController"));
    objc_msgSend(v5, "removeAssetID:fromCollectionID:completion:", v4, kBKCollectionDefaultIDWantToRead, 0);

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_242AC;
    v6[3] = &unk_C17B8;
    v6[4] = self;
    v7 = v4;
    -[BKLibraryManager performBlockOnWorkerQueue:](self, "performBlockOnWorkerQueue:", v6);

  }
}

- (id)entityName
{
  return CFSTR("BKLibraryAsset");
}

- (BOOL)isProcessing
{
  return -[BKLibraryManager isReloading](self, "isReloading");
}

+ (id)keyPathsForValuesAffectingIsProcessing
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("reloading"), 0);
}

- (BOOL)isExplicitMaterialAllowed
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  v3 = objc_msgSend(v2, "isExplicitContentAllowed");

  return v3;
}

- (unint64_t)countOfPurchasedBooks
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v12;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 5381, "-[BKLibraryManager countOfPurchasedBooks]", "[NSThread isMainThread]", CFSTR("only call from main thread"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForPurchasedBooksAssets](self, "predicateForPurchasedBooksAssets"));
  objc_msgSend(v3, "setPredicate:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
  v12 = 0;
  v6 = objc_msgSend(v5, "countForFetchRequest:error:", v3, &v12);
  v7 = v12;

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = BKLibraryLog(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_816B8();

    v6 = 0;
  }

  return (unint64_t)v6;
}

- (void)countOfSeriesLibraryAssetsWithSeriesID:(id)a3 total:(unint64_t *)a4 purchased:(unint64_t *)a5 context:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  unint64_t *v32;
  unint64_t *v33;
  id v34;
  id v35;
  _QWORD v36[4];

  v10 = a3;
  v11 = a6;
  if (v10 && a4 && a5)
  {
    v32 = a4;
    v33 = a5;
    v12 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForLibraryAssetsWithSeriesID:](self, "predicateForLibraryAssetsWithSeriesID:", v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
    objc_msgSend(v13, "setPredicate:", v12);
    v35 = 0;
    v14 = objc_msgSend(v11, "countForFetchRequest:error:", v13, &v35);
    v15 = v35;
    v16 = v15;
    if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = BKLibraryLog(v15);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_81778();

      v14 = 0;
    }
    v30 = v16;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeUnownedLibraryAssets](BKLibraryManager, "predicateToExcludeUnownedLibraryAssets"));
    v36[0] = v19;
    v36[1] = v12;
    v31 = (void *)v12;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForNotSamplesLibraryAssets](BKLibraryManager, "predicateForNotSamplesLibraryAssets"));
    v36[2] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager sampleDataSourceIdentifier](BKLibraryManager, "sampleDataSourceIdentifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("dataSourceIdentifier"), v21));
    v36[3] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 4));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v23));
    objc_msgSend(v13, "setPredicate:", v24);

    v34 = 0;
    v25 = objc_msgSend(v11, "countForFetchRequest:error:", v13, &v34);
    v26 = v34;
    v27 = v26;
    if (v25 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v28 = BKLibraryLog(v26);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_81718();

      v25 = 0;
    }
    *v32 = (unint64_t)v14;
    *v33 = (unint64_t)v25;

  }
}

- (void)countOfSeriesLibraryAssetsWithSeriesID:(id)a3 total:(unint64_t *)a4 finished:(unint64_t *)a5 context:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  unint64_t *v27;
  id v28;
  id v29;
  _QWORD v30[2];

  v10 = a3;
  v11 = a6;
  if (v10 && a4 && a5)
  {
    v27 = a5;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForLibraryAssetsWithSeriesID:](self, "predicateForLibraryAssetsWithSeriesID:", v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
    objc_msgSend(v13, "setPredicate:", v12);
    v29 = 0;
    v14 = objc_msgSend(v11, "countForFetchRequest:error:", v13, &v29);
    v15 = v29;
    v16 = v15;
    if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = BKLibraryLog(v15);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_81778();

      v14 = 0;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateFor_All_Finished_LibraryAssets](BKLibraryManager, "predicateFor_All_Finished_LibraryAssets"));
    v30[0] = v19;
    v30[1] = v12;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v20));
    objc_msgSend(v13, "setPredicate:", v21);

    v28 = 0;
    v22 = objc_msgSend(v11, "countForFetchRequest:error:", v13, &v28);
    v23 = v28;
    v24 = v23;
    if (v22 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = BKLibraryLog(v23);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_81718();

      v22 = 0;
    }
    *a4 = (unint64_t)v14;
    *v27 = (unint64_t)v22;

  }
}

- (void)countOfSeriesLibraryAssetsWithSeriesID:(id)a3 total:(unint64_t *)a4 markedFinished:(unint64_t *)a5 context:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  unint64_t *v27;
  id v28;
  id v29;
  _QWORD v30[2];

  v10 = a3;
  v11 = a6;
  if (v10 && a4 && a5)
  {
    v27 = a5;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForLibraryAssetsWithSeriesID:](self, "predicateForLibraryAssetsWithSeriesID:", v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
    objc_msgSend(v13, "setPredicate:", v12);
    v29 = 0;
    v14 = objc_msgSend(v11, "countForFetchRequest:error:", v13, &v29);
    v15 = v29;
    v16 = v15;
    if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = BKLibraryLog(v15);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_81778();

      v14 = 0;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateFor_All_Marked_As_Finished_LibraryAssets](BKLibraryManager, "predicateFor_All_Marked_As_Finished_LibraryAssets"));
    v30[0] = v19;
    v30[1] = v12;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v20));
    objc_msgSend(v13, "setPredicate:", v21);

    v28 = 0;
    v22 = objc_msgSend(v11, "countForFetchRequest:error:", v13, &v28);
    v23 = v28;
    v24 = v23;
    if (v22 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = BKLibraryLog(v23);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_81718();

      v22 = 0;
    }
    *a4 = (unint64_t)v14;
    *v27 = (unint64_t)v22;

  }
}

- (id)predicateForContainerLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("contentType"), &off_C9D90);
}

- (id)predicateForExcludingContainerLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("contentType"), &off_C9D90);
}

- (id)predicateForContainerWithSeriesIDLibraryAsset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("seriesID"), a3));
  v9[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForContainerLibraryAssets](self, "predicateForContainerLibraryAssets"));
  v9[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v6));
  return v7;
}

- (id)predicateForUnownedSeriesLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != 0 AND %K != NULL AND %K == %@"), CFSTR("storeID"), CFSTR("storeID"), CFSTR("state"), &off_C9D90);
}

- (id)predicateToExcludeUnownedLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("state"), &off_C9D90);
}

+ (id)predicateForInTheCloudLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("state"), &off_C9DF0);
}

- (id)predicateForDataSourceIdentifierTaggedLibraryAssets:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("dataSourceIdentifier"), a3);
}

- (id)predicateForAssetIDsTaggedLibraryAssets:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("assetID"), a3);
}

+ (id)predicateForTemporaryAssetIDsTaggedLibraryAssets:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("temporaryAssetID"), a3);
}

+ (id)predicateForCollectionIDTaggedLibraryAssets:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ANY collectionMembers.collection.collectionID == %@"), a3);
}

- (id)predicateForHighWaterMarkCapableLibraryAssets
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateToExcludeUnownedLibraryAssets](self, "predicateToExcludeUnownedLibraryAssets"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForExcludingContainerLibraryAssets](self, "predicateForExcludingContainerLibraryAssets", v3));
  v10[1] = v4;
  v5 = objc_msgSend((id)objc_opt_class(self), "predicateToExcludeAudiobookSupplementalContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v7));
  return v8;
}

- (id)predicateForIndexing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForLocalLibraryAssets](self, "predicateForLocalLibraryAssets"));
  v14[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAllOwnedAudiobooks](BKLibraryManager, "predicateForAllOwnedAudiobooks"));
  v14[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateToExcludeUnownedLibraryAssets](self, "predicateToExcludeUnownedLibraryAssets"));
  v13[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForExcludingContainerLibraryAssets](self, "predicateForExcludingContainerLibraryAssets"));
  v13[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
  v13[2] = v9;
  v13[3] = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 4));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v10));
  return v11;
}

+ (id)predicateForPersonalizationAffinityAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForDownloadableStoreLibraryAssets](BKLibraryManager, "predicateForDownloadableStoreLibraryAssets"));
  v9[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingContainerLibraryAssets](BKLibraryManager, "predicateForExcludingContainerLibraryAssets"));
  v9[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
  v9[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeUnownedLibraryAssets](BKLibraryManager, "predicateToExcludeUnownedLibraryAssets"));
  v9[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v6));

  return v7;
}

- (id)predicateForMatchingSearchStringLibraryAssets:(id)a3
{
  return +[BKLibraryManager predicateForMatchingSearchStringLibraryAssets:](BKLibraryManager, "predicateForMatchingSearchStringLibraryAssets:", a3);
}

- (id)predicateForSearchableLibraryAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 5));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("collectionMembers.@count > 0 OR (purchasedAndLocalParent != NULL AND purchasedAndLocalParent != 0)")));
  objc_msgSend(v3, "addObject:", v4);

  if (!-[BKLibraryManager isExplicitMaterialAllowed](self, "isExplicitMaterialAllowed"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent](BKLibraryManager, "predicateToExcludeLibraryAssetsWithExplicitContent"));
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v3));
  return v7;
}

- (id)predicateForSamples
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == 1)"), CFSTR("isSample")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("contentType"), &off_C9DA8));
  v11[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("state"), &off_C9DA8));
  v11[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v5));

  v10[0] = v2;
  v10[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v7));

  return v8;
}

- (id)_predicateForSearchText:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 6);
  if (objc_msgSend(v4, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForSearchableLibraryAssets](self, "predicateForSearchableLibraryAssets"));
    objc_msgSend(v5, "addObject:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForMatchingSearchStringLibraryAssets:](self, "predicateForMatchingSearchStringLibraryAssets:", v4));
    objc_msgSend(v5, "addObject:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v5));

  return v8;
}

- (id)_booksWithPredicate:(id)a3 sortDescriptors:(id)a4 context:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  objc_msgSend(v12, "setPredicate:", v11);

  objc_msgSend(v12, "setSortDescriptors:", v10);
  objc_msgSend(v12, "setReturnsObjectsAsFaults:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v12, a6));

  return v13;
}

+ (id)predicateToExcludeAssetsForSeriesAndStoreItems
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("state != %@ AND (state != %@ || contentType == %@)"), &off_C9DA8, &off_C9D90, &off_C9D90);
}

+ (id)predicateToExcludeAssetsForSeriesAndStoreItemsNotAddedToCollections
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateToExcludeAssetsForSeriesAndStoreItems"));
  v9[0] = v2;
  v8[0] = kBKCollectionDefaultAll;
  v8[1] = kBKCollectionDefaultIDBooks;
  v8[2] = kBKCollectionDefaultIDAudiobooks;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SUBQUERY(collectionMembers, $collectionMember, NOT $collectionMember.collection.collectionID IN %@).@count > 0"), v3));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v5));

  return v6;
}

+ (id)predicateToExcludeAssetsForUnpurchasedItemsInCollection:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = kBKCollectionDefaultIDAudiobooks;
  v4 = objc_msgSend(a3, "isEqualToString:", kBKCollectionDefaultIDAudiobooks);
  if ((_DWORD)v4)
    v5 = kBKCollectionDefaultIDBooks;
  else
    v5 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection contentTypesForDefaultCollectionWithID:](BKCollection, "contentTypesForDefaultCollectionWithID:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K = NULL OR %K = 0) AND !(%K IN %@) AND (%K != %@ AND (%K != %@ OR (%K == %@ AND seriesBooks.@count > 1 AND ANY seriesBooks.%K == %@)))"), CFSTR("isSample"), CFSTR("isSample"), CFSTR("contentType"), v6, CFSTR("state"), &off_C9DA8, CFSTR("state"), &off_C9D90, CFSTR("contentType"), &off_C9D90, CFSTR("isStoreAudiobook"), v7));

  return v8;
}

+ (id)predicateToExcludeAssetsInASeriesContainerWithOwnedBooks
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("contentType == %@ OR seriesContainer = NULL OR seriesContainer.purchasedAndLocalSeriesItems.@count == 0 OR seriesContainer.seriesBooks.@count == 1"), &off_C9D90);
}

+ (id)predicateToExcludeAssetsWithSeriesContainersWithNoOwnedBooks
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("contentType != %@ OR (purchasedAndLocalSeriesItems.@count != 0 AND seriesBooks.@count > 1)"), &off_C9D90);
}

+ (id)predicateForOwnedSingleAssetSeries
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("contentType == %@ AND purchasedAndLocalSeriesItems.@count != 0 AND seriesBooks.@count == 1"), &off_C9D90);
}

+ (id)predicateForAssetsInCollectionID:(id)a3 allowExplicit:(BOOL)a4
{
  return objc_msgSend(a1, "predicateForAssetsInCollectionID:allowExplicit:includeSeriesItems:", a3, a4, 0);
}

+ (id)predicateForAssetsInCollectionID:(id)a3 allowExplicit:(BOOL)a4 includeSeriesItems:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v31[2];
  _QWORD v32[2];

  v5 = a5;
  v8 = a3;
  if (!v8)
    v8 = kBKCollectionDefaultAll;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultManager"));
  v10 = objc_msgSend(v9, "usePerformancePredicates");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ANY collectionMembers.collection.collectionID == %@"), v8));
    objc_msgSend(v12, "addObject:", v13);

    if (!a4)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAssetsWithExplicitContent](BKLibraryManager, "predicateToExcludeAssetsWithExplicitContent"));
      objc_msgSend(v12, "addObject:", v14);

    }
    v15 = objc_msgSend(v8, "isEqualToString:", kBKCollectionDefaultAll);
    v16 = objc_msgSend(v8, "isEqualToString:", kBKCollectionDefaultIDBooks);
    v17 = objc_msgSend(v8, "isEqualToString:", kBKCollectionDefaultIDAudiobooks);
    v18 = v17;
    if ((v15 & 1) != 0 || (v16 & 1) != 0 || v17)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAssetsInASeriesContainerWithOwnedBooks](BKLibraryManager, "predicateToExcludeAssetsInASeriesContainerWithOwnedBooks"));
      objc_msgSend(v12, "addObject:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAssetsWithSeriesContainersWithNoOwnedBooks](BKLibraryManager, "predicateToExcludeAssetsWithSeriesContainersWithNoOwnedBooks"));
      objc_msgSend(v12, "addObject:", v20);

      if (v15)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAssetsForSeriesAndStoreItemsNotAddedToCollections](BKLibraryManager, "predicateToExcludeAssetsForSeriesAndStoreItemsNotAddedToCollections"));
        objc_msgSend(v12, "addObject:", v21);

      }
      if ((v16 | v18) == 1)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAssetsForUnpurchasedItemsInCollection:](BKLibraryManager, "predicateToExcludeAssetsForUnpurchasedItemsInCollection:", v8));
        objc_msgSend(v12, "addObject:", v22);

      }
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
    objc_msgSend(v12, "addObject:", v23);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v12));
    if (v5)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("ANY seriesContainer.collectionMembers.collection.collectionID == %@"), v8));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeUnownedLibraryAssets](BKLibraryManager, "predicateToExcludeUnownedLibraryAssets"));
      v32[0] = v24;
      v32[1] = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v26));

      v31[0] = v11;
      v31[1] = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 2));
      v29 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v28));

      v11 = (void *)v29;
    }

  }
  return v11;
}

+ (id)predicateToExcludeAssetsWithExplicitContent
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isExplicit == NO OR isExplicit == NULL"));
}

+ (id)predicateForAssetsWithLocalOrDownloadingLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("state != %@"), &off_C9DF0);
}

+ (id)predicateForSeriesItemsWithSeriesIDs:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@ AND (%K = NULL OR %K != %@)"), CFSTR("seriesID"), a3, CFSTR("state"), CFSTR("contentType"), &off_C9D90);
}

+ (id)predicateForAllOwnedBooks
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("state != %@ AND state != %@ AND contentType != %@"), &off_C9D90, &off_C9DA8, &off_C9D90));
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultManager"));
  v6 = objc_msgSend(v5, "isExplicitMaterialAllowed");

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isExplicit == NO OR isExplicit == NULL")));
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateToExcludeAudiobookSupplementalContent"));
  objc_msgSend(v3, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v3));
  return v9;
}

+ (id)predicateForAllOwnedAudiobooks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateForAllOwnedBooks"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateForAudiobooks", v3));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateForNonPreorders"));
  v9[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v6));

  return v7;
}

+ (id)predicateToExcludeCollectionMembersInASeriesContainerWithOwnedBooks
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset.contentType == %@ OR asset.seriesContainer == nil OR asset.seriesContainer.purchasedAndLocalSeriesItems.@count == 0 OR asset.seriesContainer.seriesBooks.@count == 1"), &off_C9D90);
}

+ (id)predicateToExcludeCollectionMembersWithSeriesContainersWithNoOwnedBooks
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset.contentType != %@ OR (asset.purchasedAndLocalSeriesItems.@count != 0 AND asset.seriesBooks.@count > 1)"), &off_C9D90);
}

+ (id)predicateForCollectionMembersInCollectionID:(id)a3 hideUnownedItems:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultManager"));
  v8 = objc_msgSend(v7, "isExplicitMaterialAllowed");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateForCollectionMembersInCollectionID:hideUnownedItems:allowExplicit:", v6, v4, v8));
  return v9;
}

+ (id)predicateForCollectionMembersInCollectionID:(id)a3 hideUnownedItems:(BOOL)a4 allowExplicit:(BOOL)a5
{
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v7 = a3;
  if (!v7)
    v7 = kBKCollectionDefaultAll;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultManager"));
  v9 = objc_msgSend(v8, "usePerformancePredicates");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("collection.collectionID == %@"), v7));
    objc_msgSend(v11, "addObject:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset != NULL")));
    objc_msgSend(v11, "addObject:", v13);

    if (!a5)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeCollectionMembersWithExplicitContent](BKLibraryManager, "predicateToExcludeCollectionMembersWithExplicitContent"));
      objc_msgSend(v11, "addObject:", v14);

    }
    v15 = objc_msgSend(v7, "isEqualToString:", kBKCollectionDefaultAll);
    v16 = objc_msgSend(v7, "isEqualToString:", kBKCollectionDefaultIDBooks);
    v17 = objc_msgSend(v7, "isEqualToString:", kBKCollectionDefaultIDAudiobooks);
    v18 = v17;
    if ((v15 & 1) != 0 || (v16 & 1) != 0 || v17)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeCollectionMembersInASeriesContainerWithOwnedBooks](BKLibraryManager, "predicateToExcludeCollectionMembersInASeriesContainerWithOwnedBooks"));
      objc_msgSend(v11, "addObject:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeCollectionMembersWithSeriesContainersWithNoOwnedBooks](BKLibraryManager, "predicateToExcludeCollectionMembersWithSeriesContainersWithNoOwnedBooks"));
      objc_msgSend(v11, "addObject:", v20);

      if (v15)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeCollectionMembersForSeriesAndStoreItemsNotAddedToCollections](BKLibraryManager, "predicateToExcludeCollectionMembersForSeriesAndStoreItemsNotAddedToCollections"));
        objc_msgSend(v11, "addObject:", v21);

      }
      if ((v16 | v18) == 1)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeCollectionMembersForUnpurchasedItemsInCollection:](BKLibraryManager, "predicateToExcludeCollectionMembersForUnpurchasedItemsInCollection:", v7));
        objc_msgSend(v11, "addObject:", v22);

      }
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeCollectionMembersForAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeCollectionMembersForAudiobookSupplementalContent"));
    objc_msgSend(v11, "addObject:", v23);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v11));
  }

  return v10;
}

+ (id)predicateToExcludeCollectionMembersWithExplicitContent
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset.isExplicit == NO OR asset.isExplicit == NULL"));
}

+ (id)predicateForCollectionMembersMatchingSearchStringLibraryAssets:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset.title contains[cd] %@ OR asset.author contains[cd] %@ OR asset.genre contains[cd] %@ OR asset.localOnlySeriesItemsParent.title CONTAINS[cd] %@"), v3, v3, v3, v3));
  else
    v4 = 0;

  return v4;
}

+ (id)predicateForCollectionMembersWithLocalAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset.state == %@ OR asset.state == %@ OR asset.state == %@"), &off_C9DC0, &off_C9E08, &off_C9DD8));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset.contentType == %@ AND asset.localOnlySeriesItems.@count > 0"), &off_C9D90));
  v8[0] = v2;
  v8[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeCollectionMembersForAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeCollectionMembersForAudiobookSupplementalContent"));
  v8[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v5));

  return v6;
}

+ (id)predicateToExcludeCollectionMembersWithUnownedLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset.state != %@ AND asset.state != %@"), &off_C9D90, &off_C9DA8);
}

+ (id)predicateForAllCollectionMembersExcludingSeriesLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(asset.contentType == %@) OR (asset.state != %@)"), &off_C9D90, &off_C9D90);
}

+ (id)predicateForCollectionMembersWithInTheCloudLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset.state == %@"), &off_C9DF0);
}

- (id)predicateForDownloadingStoreCollectionMembers
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset.state == %@ AND asset.storeID != NULL"), &off_C9E08);
}

+ (id)predicateForCollectionMembersWithLocalOrDownloadingLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset.state != %@"), &off_C9DF0);
}

+ (id)excludeCollectionMembersWithHiddenAssetsPredicate
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(asset.isHidden == NO OR asset.isHidden == NULL) AND (asset.isEphemeral == NO OR asset.isEphemeral == NULL)"));
}

+ (id)predicateForExcludingCollectionMembersWithContainerLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset.contentType != %@"), &off_C9D90);
}

+ (id)predicateForExcludingCollectionMembersWithSideloadedAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset.storeID != NULL"));
}

- (BKLibraryCollectionManager)collectionManager
{
  BKLibraryManager *v2;
  BKLibraryCollectionManager *v3;
  BKLibraryCollectionManager *collectionManager;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_collectionManager)
  {
    v3 = -[BKLibraryCollectionManager initWithLibraryManager:]([BKLibraryCollectionManager alloc], "initWithLibraryManager:", v2);
    collectionManager = v2->_collectionManager;
    v2->_collectionManager = v3;

  }
  objc_sync_exit(v2);

  return v2->_collectionManager;
}

- (void)_newAssetIDAdded:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD block[5];
  id v7;
  _QWORD v8[2];
  void (*v9)(uint64_t);
  void *v10;
  BKLibraryManager *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v9 = sub_266E8;
  v10 = &unk_C2180;
  v11 = self;
  v4 = a3;
  v12 = v4;
  v13 = &v14;
  v5 = v8;
  os_unfair_lock_lock(&self->_notifyLockForNewAssets);
  v9((uint64_t)v5);
  os_unfair_lock_unlock(&self->_notifyLockForNewAssets);

  if (*((_BYTE *)v15 + 24))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_26750;
    block[3] = &unk_C12F8;
    block[4] = self;
    v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  _Block_object_dispose(&v14, 8);

}

- (void)waitForAssetID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_26B38;
    v14[3] = &unk_C21D0;
    v14[4] = self;
    v8 = v6;
    v15 = v8;
    v16 = v7;
    os_unfair_lock_lock(&self->_notifyLockForNewAssets);
    sub_26B38((uint64_t)v14);
    os_unfair_lock_unlock(&self->_notifyLockForNewAssets);
    v17 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_26BDC;
    v12[3] = &unk_C21F8;
    v12[4] = self;
    v13 = v8;
    -[BKLibraryManager fetchLibraryAssetsFromAssetIDs:handler:](self, "fetchLibraryAssetsFromAssetIDs:handler:", v9, v12);

  }
  else
  {
    v10 = objc_retainBlock(v7);
    v11 = v10;
    if (v10)
      (*((void (**)(id))v10 + 2))(v10);

  }
}

- (id)libraryAssetsWithAssetIDsContainedInList:(id)a3 tempAssetIDs:(id)a4 inManagedObjectContext:(id)a5
{
  return +[BKLibraryManager libraryAssetsWithAssetIDsContainedInList:tempAssetIDs:inManagedObjectContext:](BKLibraryManager, "libraryAssetsWithAssetIDsContainedInList:tempAssetIDs:inManagedObjectContext:", a3, a4, a5);
}

- (id)insertNewLibraryAssetWithIdentifier:(id)a3 assetID:(id)a4 orTemporaryAssetID:(id)a5 type:(signed __int16)a6 inManagedObjectContext:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;

  v8 = a6;
  v12 = a4;
  v13 = a7;
  v14 = a5;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("BKLibraryAsset"), v13));
  objc_msgSend(v16, "setAssetID:", v12);
  objc_msgSend(v16, "setTemporaryAssetID:", v14);

  objc_msgSend(v16, "setDataSourceIdentifier:", v15);
  objc_msgSend(v16, "setContentType:", v8);
  objc_msgSend(v16, "setCreationDateToNow");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_26D44;
  v19[3] = &unk_C12F8;
  v19[4] = self;
  v20 = v12;
  v17 = v12;
  objc_msgSend(v13, "performBlock:", v19);

  return v16;
}

- (id)sortDescriptorsForMode:(unint64_t)a3 collectionID:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  id result;
  id v14;
  const __CFString *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[2];
  _QWORD v23[4];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionProvider](self, "collectionProvider"));
  v8 = objc_msgSend(v7, "isAllBooksCollection:", v6);

  switch(a3)
  {
    case 0uLL:
      v9 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("seriesSortKey"), 1);
      v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("sortKey"), 1);
      v11 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("creationDate"), 0);
      v26[0] = v9;
      v26[1] = v10;
      v26[2] = v11;
      v12 = v26;
      goto LABEL_15;
    case 1uLL:
      v18 = objc_alloc((Class)NSSortDescriptor);
      if (v8)
      {
        v9 = objc_msgSend(v18, "initWithKey:ascending:", CFSTR("lastOpenDate"), 0);
        v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("creationDate"), 0);
        v11 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("sortKey"), 0);
        v25[0] = v9;
        v25[1] = v10;
        v25[2] = v11;
        v12 = v25;
      }
      else
      {
        v9 = objc_msgSend(v18, "initWithKey:ascending:", CFSTR("sortKey"), 0);
        v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("creationDate"), 0);
        v11 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("seriesSortKey"), 1);
        v24[0] = v9;
        v24[1] = v10;
        v24[2] = v11;
        v12 = v24;
      }
      goto LABEL_15;
    case 2uLL:
      v9 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("creationDate"), 0);
      v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:selector:", CFSTR("sortTitle"), 1, "localizedStandardCompare:");
      v11 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("assetID"), 1);
      v14 = objc_alloc((Class)NSSortDescriptor);
      if (v8)
        v15 = CFSTR("lastOpenDate");
      else
        v15 = CFSTR("sortKey");
      v16 = objc_msgSend(v14, "initWithKey:ascending:", v15, 0);
      v23[0] = v16;
      v23[1] = v9;
      v23[2] = v10;
      v23[3] = v11;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));

      goto LABEL_16;
    case 3uLL:
      v9 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:selector:", CFSTR("sortTitle"), 1, "localizedStandardCompare:");
      v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("assetID"), 1);
      v22[0] = v9;
      v22[1] = v10;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
      goto LABEL_17;
    case 4uLL:
      v9 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:selector:", CFSTR("sortAuthor"), 1, "localizedStandardCompare:");
      v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:selector:", CFSTR("sortTitle"), 1, "localizedStandardCompare:");
      v11 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("assetID"), 1);
      v21[0] = v9;
      v21[1] = v10;
      v21[2] = v11;
      v12 = v21;
      goto LABEL_15;
    case 5uLL:
      v9 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:selector:", CFSTR("genre"), 1, "localizedCaseInsensitiveCompare:");
      v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:selector:", CFSTR("sortTitle"), 1, "localizedStandardCompare:");
      v11 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("assetID"), 1);
      v20[0] = v9;
      v20[1] = v10;
      v20[2] = v11;
      v12 = v20;
      goto LABEL_15;
    case 6uLL:
      v9 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("dateFinished"), 0);
      v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:selector:", CFSTR("sortTitle"), 1, "localizedStandardCompare:");
      v11 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("assetID"), 1);
      v19[0] = v9;
      v19[1] = v10;
      v19[2] = v11;
      v12 = v19;
LABEL_15:
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 3));
LABEL_16:

LABEL_17:
      result = v17;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)predicateForMostRecentBooksOpened
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[2];
  _QWORD v20[2];

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingContainerLibraryAssets](BKLibraryManager, "predicateForExcludingContainerLibraryAssets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForLocalLibraryAssets](self, "predicateForLocalLibraryAssets"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForContentType:](BKLibraryManager, "predicateForContentType:", 6));
  v20[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingUnownedAudiobookAssets](BKLibraryManager, "predicateForExcludingUnownedAudiobookAssets"));
  v20[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v6));

  if ((BLAudiobookStreamingEnabled() & 1) != 0)
  {
    v19[0] = v3;
    v19[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v8));

  }
  else
  {
    v9 = v3;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K != NULL) && (%K == NULL)"), CFSTR("lastOpenDate"), CFSTR("expectedDate")));
  if (-[BKLibraryManager isExplicitMaterialAllowed](self, "isExplicitMaterialAllowed"))
    v11 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  else
    v11 = objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent](BKLibraryManager, "predicateToExcludeLibraryAssetsWithExplicitContent"));
  v12 = (void *)v11;
  v18[0] = v9;
  v18[1] = v17;
  v18[2] = v10;
  v18[3] = v11;
  v18[4] = v16;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 5));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v13));

  return v14;
}

- (id)mostRecentlyOpenedBooks:(unint64_t)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  id v14;

  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  objc_msgSend(v7, "setFetchLimit:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForMostRecentBooksOpened](self, "predicateForMostRecentBooksOpened"));
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(v7, "setReturnsObjectsAsFaults:", 0);
  v9 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("lastOpenDate"), 0);
  v14 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  objc_msgSend(v7, "setSortDescriptors:", v10);

  v13 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v7, &v13));

  return v11;
}

- (id)mostRecentlyOpenedLibraryAssetWithTypes:(id)a3 inManagedObjectContext:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager mostRecentlyOpenedLibraryAssetsWithTypes:limit:inManagedObjectContext:](self, "mostRecentlyOpenedLibraryAssetsWithTypes:limit:inManagedObjectContext:", a3, 1, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  return v5;
}

- (id)mostRecentlyOpenedLibraryAssetsWithTypes:(id)a3 limit:(unint64_t)a4 inManagedObjectContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;
  id v20;
  _QWORD v21[2];

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForMostRecentBooksOpened](self, "predicateForMostRecentBooksOpened"));
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForContentTypes:](BKLibraryManager, "predicateForContentTypes:", v8));
    v21[0] = v10;
    v21[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
    v13 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v12));

    v10 = (void *)v13;
  }
  v14 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  objc_msgSend(v14, "setPredicate:", v10);
  objc_msgSend(v14, "setReturnsObjectsAsFaults:", 0);
  v15 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("lastOpenDate"), 0);
  v20 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  objc_msgSend(v14, "setSortDescriptors:", v16);

  if (a4)
    objc_msgSend(v14, "setFetchLimit:", a4);
  v19 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v14, &v19));

  return v17;
}

- (id)mostRecentlyEngagedLibraryAssetWithTypes:(id)a3 inManagedObjectContext:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager mostRecentlyEngagedLibraryAssetsWithTypes:limit:inManagedObjectContext:](self, "mostRecentlyEngagedLibraryAssetsWithTypes:limit:inManagedObjectContext:", a3, 1, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  return v5;
}

- (id)mostRecentlyEngagedLibraryAssetsWithTypes:(id)a3 limit:(unint64_t)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  id v19;
  _QWORD v20[2];

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager _recentlyEngagedPredicate](BKLibraryManager, "_recentlyEngagedPredicate"));
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForContentTypes:](BKLibraryManager, "predicateForContentTypes:", v7));
    v20[0] = v9;
    v20[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
    v12 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v11));

    v9 = (void *)v12;
  }
  v13 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  objc_msgSend(v13, "setPredicate:", v9);
  objc_msgSend(v13, "setReturnsObjectsAsFaults:", 0);
  v14 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("lastEngagedDate"), 0);
  v19 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  objc_msgSend(v13, "setSortDescriptors:", v15);

  if (a4)
    objc_msgSend(v13, "setFetchLimit:", a4);
  v18 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "executeFetchRequest:error:", v13, &v18));

  return v16;
}

- (id)libraryAssetsAsDictionaryWithProperties:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  BKLibraryManager *v12;
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_88C4;
  v19 = sub_88D4;
  v20 = 0;
  v5 = dispatch_semaphore_create(0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_27A74;
  v10[3] = &unk_C2220;
  v14 = &v15;
  v6 = v4;
  v11 = v6;
  v12 = self;
  v7 = v5;
  v13 = v7;
  -[BKLibraryManager performBackgroundReadOnlyBlock:](self, "performBackgroundReadOnlyBlock:", v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (id)predicateFor_AllBooks_LibraryAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager _predicateForBooksShownInAllBooks](BKLibraryManager, "_predicateForBooksShownInAllBooks"));
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAllBooksExceptSeriesLibraryAssets](BKLibraryManager, "predicateForAllBooksExceptSeriesLibraryAssets"));
  objc_msgSend(v3, "addObject:", v5);

  if (!-[BKLibraryManager isExplicitMaterialAllowed](self, "isExplicitMaterialAllowed"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeLibraryAssetsAndContainersWithExplicitContent](BKLibraryManager, "predicateToExcludeLibraryAssetsAndContainersWithExplicitContent"));
    objc_msgSend(v3, "addObject:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager excludeEphemeralAssetsPredicate](BKLibraryManager, "excludeEphemeralAssetsPredicate"));
  objc_msgSend(v3, "addObject:", v7);

  v8 = objc_msgSend((id)objc_opt_class(self), "predicateToExcludeAudiobookSupplementalContent");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v3));
  return v10;
}

+ (id)predicateForContentType:(signed __int16)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == %d)"), CFSTR("contentType"), a3);
}

+ (id)predicateForNotContentType:(signed __int16)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K != %d)"), CFSTR("contentType"), a3);
}

+ (id)predicateForContentTypes:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("contentType"), a3);
}

+ (id)predicateForNotContentTypes:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("contentType"), a3);
}

+ (id)predicateForAudiobooks
{
  return objc_msgSend(a1, "predicateForContentType:", 6);
}

+ (id)predicateForNonPreorders
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == nil)"), CFSTR("expectedDate"));
}

- (id)predicateFor_AllAudioBooks_LibraryAssets
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v3 = objc_msgSend((id)objc_opt_class(self), "predicateForContentType:", 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v9[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateFor_AllBooks_LibraryAssets](self, "predicateFor_AllBooks_LibraryAssets"));
  v9[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v6));

  return v7;
}

- (id)predicateFor_All_PDFs_LibraryAssets
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v3 = objc_msgSend((id)objc_opt_class(self), "predicateForContentType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v9[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateFor_AllBooks_LibraryAssets](self, "predicateFor_AllBooks_LibraryAssets"));
  v9[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v6));

  return v7;
}

- (id)predicateFor_All_Downloaded_LibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("state"), &off_C9DC0);
}

+ (id)predicateFor_All_Finished_LibraryAssets
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultManager"));
  v4 = objc_msgSend(v3, "isExplicitMaterialAllowed");

  return _objc_msgSend(a1, "predicateFor_All_Finished_LibraryAssetsAllowsExplicit:", v4);
}

+ (id)predicateFor_All_Finished_LibraryAssetsAllowsExplicit:(BOOL)a3
{
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  LODWORD(v6) = kAEAnnotationReadingLocationSignificantHighwaterMark;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isFinished == YES OR (bookHighWaterMarkProgress >= %@ AND (notFinished == NULL OR notFinished == NO) OR (dateFinished != NULL))"), v7));
  objc_msgSend(v5, "addObject:", v8);

  if (!a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent](BKLibraryManager, "predicateToExcludeLibraryAssetsWithExplicitContent"));
    objc_msgSend(v5, "addObject:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateToExcludeAudiobookSupplementalContent"));
  objc_msgSend(v5, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v5));
  return v11;
}

+ (id)predicateFor_All_Marked_As_Finished_LibraryAssets
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultManager"));
  v4 = objc_msgSend(v3, "isExplicitMaterialAllowed");

  return _objc_msgSend(a1, "predicateFor_All_Marked_As_Finished_LibraryAssetsAllowsExplicit:", v4);
}

+ (id)predicateFor_All_Marked_As_Finished_LibraryAssetsAllowsExplicit:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isFinished == YES")));
  objc_msgSend(v5, "addObject:", v6);

  if (!a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent](BKLibraryManager, "predicateToExcludeLibraryAssetsWithExplicitContent"));
    objc_msgSend(v5, "addObject:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateToExcludeAudiobookSupplementalContent"));
  objc_msgSend(v5, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v5));
  return v9;
}

+ (id)predicateFor_All_Marked_As_Finished_LibraryAssets_In_Year:(int64_t)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];

  v4 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager _dateComponentsForYear:](BKLibraryManager, "_dateComponentsForYear:", a3));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromComponents:", v21));
  v5 = a3 + 1;
  objc_msgSend(v21, "setYear:", a3 + 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromComponents:", v21));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("dateFinished >= %@ AND dateFinished < %@ AND finishedDateKind != %i"), v20, v19, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager _dateComponentsForYear:](BKLibraryManager, "_dateComponentsForYear:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", 0));
  objc_msgSend(v6, "setTimeZone:", v7);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromComponents:", v6));
  objc_msgSend(v6, "setYear:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromComponents:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("dateFinished >= %@ AND dateFinished < %@ AND finishedDateKind == %i"), v17, v8, 2));
  v23[0] = v16;
  v23[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v10));

  v22[0] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateFor_All_Marked_As_Finished_LibraryAssets"));
  v22[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v13));

  return v14;
}

+ (id)predicateFor_All_Marked_As_Finished_LibraryAssets_Prior_To_Year:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];

  v5 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager _dateComponentsForYear:](BKLibraryManager, "_dateComponentsForYear:", a3));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromComponents:", v19));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("dateFinished < %@ AND dateFinished > %@ AND finishedDateKind != %i"), v18, v6, 2));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager _dateComponentsForYear:](BKLibraryManager, "_dateComponentsForYear:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", 0));
  objc_msgSend(v8, "setTimeZone:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromComponents:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("dateFinished < %@ AND finishedDateKind == %i"), v10, 2));
  v21[0] = v7;
  v21[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v12));

  v20[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateFor_All_Marked_As_Finished_LibraryAssets"));
  v20[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v15));

  return v16;
}

+ (id)predicateFor_All_Marked_As_Finished_LibraryAssets_After_Year:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v5 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager _dateComponentsForYear:](BKLibraryManager, "_dateComponentsForYear:", a3 + 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromComponents:", v18));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("dateFinished >= %@ AND finishedDateKind != %i"), v17, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager _dateComponentsForYear:](BKLibraryManager, "_dateComponentsForYear:", a3 + 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", 0));
  objc_msgSend(v7, "setTimeZone:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromComponents:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("dateFinished >= %@ AND finishedDateKind == %i"), v9, 2));
  v20[0] = v6;
  v20[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v11));

  v19[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateFor_All_Marked_As_Finished_LibraryAssets"));
  v19[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v14));

  return v15;
}

+ (id)_dateComponentsForYear:(int64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  v5 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v5, "setYear:", a3);
  objc_msgSend(v5, "setDay:", 1);
  objc_msgSend(v5, "setMonth:", 1);
  objc_msgSend(v5, "setTimeZone:", v4);

  return v5;
}

- (id)predicateForLocalStoreAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL AND %K == %@"), CFSTR("storeID"), CFSTR("state"), &off_C9DC0);
}

+ (id)predicateForNotSamplesLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = NULL OR %K = 0"), CFSTR("isSample"), CFSTR("isSample"));
}

+ (id)predicateForNonEphemeralSamplesLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("            %K != %@ AND             %K = 1 AND             (%K = NULL OR %K = 0)"), CFSTR("contentType"), &off_C9D90, CFSTR("isSample"), CFSTR("isEphemeral"), CFSTR("isEphemeral"));
}

+ (id)predicateToExcludeCollectionMembersForSeriesAndStoreItems
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset.state != %@ AND (asset.state != %@ || asset.contentType == %@)"), &off_C9DA8, &off_C9D90, &off_C9D90);
}

+ (id)predicateToExcludeCollectionMembersForSeriesAndStoreItemsNotAddedToCollections
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateToExcludeCollectionMembersForSeriesAndStoreItems"));
  v9[0] = v2;
  v8[0] = kBKCollectionDefaultAll;
  v8[1] = kBKCollectionDefaultIDBooks;
  v8[2] = kBKCollectionDefaultIDAudiobooks;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SUBQUERY(asset.collectionMembers, $collectionMember, NOT $collectionMember.collection.collectionID IN %@).@count > 0"), v3));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v5));

  return v6;
}

+ (id)predicateToExcludeCollectionMembersForUnpurchasedItemsInCollection:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = kBKCollectionDefaultIDAudiobooks;
  v4 = objc_msgSend(a3, "isEqualToString:", kBKCollectionDefaultIDAudiobooks);
  if ((_DWORD)v4)
    v5 = kBKCollectionDefaultIDBooks;
  else
    v5 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection contentTypesForDefaultCollectionWithID:](BKCollection, "contentTypesForDefaultCollectionWithID:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(asset.%K = NULL OR asset.%K = 0) AND !(asset.%K IN %@) AND (asset.%K != %@ AND (asset.%K != %@ OR (asset.%K == %@ AND asset.seriesBooks.@count > 1 AND ANY asset.seriesBooks.%K == %@)))"), CFSTR("isSample"), CFSTR("isSample"), CFSTR("contentType"), v6, CFSTR("state"), &off_C9DA8, CFSTR("state"), &off_C9D90, CFSTR("contentType"), &off_C9D90, CFSTR("isStoreAudiobook"), v7));

  return v8;
}

+ (id)predicateToExcludeCollectionMembersForAudiobookSupplementalContent
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("asset.%K == NO OR asset.%K == NULL"), CFSTR("isSupplementalContent"), CFSTR("isSupplementalContent"));
}

- (id)predicateForLocalBooksWithSeriesID:(id)a3
{
  return -[BKLibraryManager contentPredicateForSeriesID:onlyPurchased:forceCloud:](self, "contentPredicateForSeriesID:onlyPurchased:forceCloud:", a3, 1, 0);
}

- (id)predicateForAllBooksWithSeriesID:(id)a3
{
  return -[BKLibraryManager contentPredicateForSeriesID:onlyPurchased:forceCloud:](self, "contentPredicateForSeriesID:onlyPurchased:forceCloud:", a3, 0, 0);
}

- (id)predicateForAllBooksWithSeriesID:(id)a3 forcefullyIncludePurchasedBooks:(BOOL)a4
{
  return -[BKLibraryManager contentPredicateForSeriesID:onlyPurchased:forceCloud:](self, "contentPredicateForSeriesID:onlyPurchased:forceCloud:", a3, 0, a4);
}

- (id)validLibraryAssetIDsOnMainQueueWithAssetIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  const __CFString *v13;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("assetID"), v4));
    objc_msgSend(v5, "setPredicate:", v6);

    objc_msgSend(v5, "setResultType:", 2);
    v13 = CFSTR("assetID");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    objc_msgSend(v5, "setPropertiesToFetch:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
    v12 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "executeFetchRequest:error:", v5, &v12));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKeyPath:", CFSTR("assetID")));
  }
  else
  {
    v10 = &__NSArray0__struct;
  }

  return v10;
}

- (id)libraryAssetOnMainQueueWithAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 6539, "-[BKLibraryManager libraryAssetOnMainQueueWithAssetID:]", "[NSThread isMainThread]", CFSTR("Requesting library asset not from the main queue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager libraryAssetWithAssetID:inManagedObjectContext:](self, "libraryAssetWithAssetID:inManagedObjectContext:", v4, v5));

  return v6;
}

- (id)libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 6547, "-[BKLibraryManager libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID:]", "[NSThread isMainThread]", CFSTR("Requesting library asset not from the main queue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager libraryAssetWithPermanentOrTemporaryAssetID:inManagedObjectContext:](self, "libraryAssetWithPermanentOrTemporaryAssetID:inManagedObjectContext:", v4, v5));

  return v6;
}

- (id)libraryAssetOnMainQueueWithAssetIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 6555, "-[BKLibraryManager libraryAssetOnMainQueueWithAssetIdentifier:]", "[NSThread isMainThread]", CFSTR("Requesting library asset not from the main queue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager libraryAssetWithAssetIdentifier:inManagedObjectContext:](self, "libraryAssetWithAssetIdentifier:inManagedObjectContext:", v4, v5));

  return v6;
}

- (id)libraryAssetOnMainQueueWithStoreID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 6563, "-[BKLibraryManager libraryAssetOnMainQueueWithStoreID:]", "[NSThread isMainThread]", CFSTR("Requesting library asset not from the main queue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("storeID"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:](self, "p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:", v4, v5, v6));

  return v7;
}

- (id)libraryAssetOnMainQueueWithEpubID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 6571, "-[BKLibraryManager libraryAssetOnMainQueueWithEpubID:]", "[NSThread isMainThread]", CFSTR("Requesting library asset not from the main queue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("epubID"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:](self, "p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:", v4, v5, v6));

  return v7;
}

- (id)libraryAssetOnMainQueueWithFilename:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 6579, "-[BKLibraryManager libraryAssetOnMainQueueWithFilename:]", "[NSThread isMainThread]", CFSTR("Requesting library asset not from the main queue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K CONTAINS %@"), CFSTR("path"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:](self, "p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:", v4, v5, v6));

  return v7;
}

- (id)libraryAssetWithAssetID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAssetIDTaggedLibraryAsset:](BKLibraryManager, "predicateForAssetIDTaggedLibraryAsset:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:](self, "p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:", v7, v8, v6));

  return v9;
}

- (id)libraryAssetsWithAssetIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  objc_msgSend(v7, "setReturnsObjectsAsFaults:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("assetID"), v5));
  objc_msgSend(v7, "setPredicate:", v8);

  v15 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v7, &v15));

  v10 = v15;
  v11 = v10;
  if (v10)
  {
    v12 = BKLibraryLog(v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_817D8();

  }
  return v9;
}

+ (id)stringByEscapingSearchString:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), CFSTR("\\\\"), 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("\\\"), 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("'"), CFSTR("\\'"), 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("*"), CFSTR("\\*"), 0, 0, objc_msgSend(v3, "length"));
  return v3;
}

+ (id)queryStringForSearchString:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend((id)objc_opt_class(a1), "stringByEscapingSearchString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_88C4;
  v23 = sub_88D4;
  v24 = objc_alloc_init((Class)NSMutableArray);
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_295B4;
  v16 = &unk_C2248;
  v10 = v9;
  v17 = v10;
  v18 = &v19;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v20[5], "componentsJoinedByString:", CFSTR(" || "), v13, v14, v15, v16));

  _Block_object_dispose(&v19, 8);
  return v11;
}

- (id)appIntentsLibraryAssetsWithTypes:(id)a3 searchTerm:(id)a4 inManagedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager _fetchLibraryAssetsWithTypes:searchTerm:inManagedObjectContext:](self, "_fetchLibraryAssetsWithTypes:searchTerm:inManagedObjectContext:", v8, v9, v10));
  if (!objc_msgSend(v11, "count"))
  {
    v12 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager _spotlightAssetsWithContentTypes:searchTerm:inManagedObjectContext:](self, "_spotlightAssetsWithContentTypes:searchTerm:inManagedObjectContext:", v8, v9, v10));

    v11 = (void *)v12;
  }

  return v11;
}

- (id)_fetchLibraryAssetsWithTypes:(id)a3 searchTerm:(id)a4 inManagedObjectContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v22;
  _QWORD v23[2];

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAssetsAvailableToAppIntentsWithTypes:](BKLibraryManager, "predicateForAssetsAvailableToAppIntentsWithTypes:", a3));
  if (objc_msgSend(v8, "length"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K contains[cd] %@ OR %K contains[cd] %@ OR %K contains[cd] %@"), CFSTR("title"), v8, CFSTR("purchasedAndLocalParent.title"), v8, CFSTR("author"), v8));
    v23[0] = v10;
    v23[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
    v13 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v12));

    v10 = (void *)v13;
  }
  v14 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  objc_msgSend(v14, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v14, "setPredicate:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager sortDescriptorsForMode:collectionID:](self, "sortDescriptorsForMode:collectionID:", 3, kBKCollectionDefaultAll));
  objc_msgSend(v14, "setSortDescriptors:", v15);

  v22 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v14, &v22));

  v17 = v22;
  v18 = v17;
  if (v17)
  {
    v19 = BKLibraryLog(v17);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_81838();

  }
  return v16;
}

- (id)_spotlightAssetsWithContentTypes:(id)a3 searchTerm:(id)a4 inManagedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  NSObject *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _BYTE v43[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init((Class)NSMutableArray);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_29C08;
  v41[3] = &unk_C2270;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v42 = v12;
  v32 = v8;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v41);
  v30 = v12;
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR(" || ")));
  v31 = v9;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager queryStringForSearchString:attributes:](BKLibraryManager, "queryStringForSearchString:attributes:", v9, &off_C9FD0));
  v29 = (void *)v13;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@) && (%@)"), v13, v28));
  v14 = objc_msgSend(objc_alloc((Class)CSSearchQuery), "initWithQueryString:attributes:", v27, &off_C9FE8);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_29C8C;
  v39[3] = &unk_C2298;
  v15 = objc_alloc_init((Class)NSMutableArray);
  v40 = v15;
  objc_msgSend(v14, "setFoundItemsHandler:", v39);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_29DA8;
  v37[3] = &unk_C22C0;
  v16 = dispatch_semaphore_create(0);
  v38 = v16;
  objc_msgSend(v14, "setCompletionHandler:", v37);
  v26 = v14;
  objc_msgSend(v14, "start");
  v25 = v16;
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[BKAssetID identifierWithAssetID:](BKAssetID, "identifierWithAssetID:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v21)));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager libraryAssetWithAssetIdentifier:inManagedObjectContext:](self, "libraryAssetWithAssetIdentifier:inManagedObjectContext:", v22, v10));

        if (v23)
          objc_msgSend(v11, "addObject:", v23);

        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v19);
  }

  return v11;
}

- (id)libraryAssetWithTemporaryAssetID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForTemporaryAssetIDTaggedLibraryAsset:](BKLibraryManager, "predicateForTemporaryAssetIDTaggedLibraryAsset:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:](self, "p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:", v7, v8, v6));

  return v9;
}

- (id)libraryAssetWithPermanentOrTemporaryAssetID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForPermanentOrTemporaryAssetIDTaggedLibraryAsset:](BKLibraryManager, "predicateForPermanentOrTemporaryAssetIDTaggedLibraryAsset:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:](self, "p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:", v7, v8, v6));

  return v9;
}

- (id)libraryAssetWithAssetIdentifier:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "permanentOrTemporaryAssetID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAssetIdentifierTaggedLibraryAsset:](BKLibraryManager, "predicateForAssetIdentifierTaggedLibraryAsset:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:](self, "p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:", v8, v9, v6));
  return v10;
}

- (id)p_libraryAssetWithIdentifier:(id)a3 predicate:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v18;

  v7 = a3;
  if (v7)
  {
    v8 = a5;
    v9 = a4;
    v10 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
    objc_msgSend(v10, "setReturnsObjectsAsFaults:", 0);
    objc_msgSend(v10, "setFetchLimit:", 1);
    objc_msgSend(v10, "setPredicate:", v9);

    v18 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "executeFetchRequest:error:", v10, &v18));

    v12 = v18;
    v13 = v12;
    if (v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
    }
    else
    {
      v15 = BKLibraryLog(v12);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_81898();

      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)libraryMutableAssetWithAssetID:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  id v24;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
    -[NSObject setReturnsObjectsAsFaults:](v8, "setReturnsObjectsAsFaults:", 0);
    -[NSObject setFetchLimit:](v8, "setFetchLimit:", 1);
    v24 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAssetIDsTaggedLibraryAssets:](BKLibraryManager, "predicateForAssetIDsTaggedLibraryAssets:", v9));
    -[NSObject setPredicate:](v8, "setPredicate:", v10);

    v19 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v8, &v19));
    v12 = v19;
    v13 = v12;
    if (v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
    }
    else
    {
      v16 = BKLibraryLog(v12);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v5;
        v22 = 2112;
        v23 = v13;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Failed to fetch LibraryAsset with AssetID {%@}{%@}", buf, 0x16u);
      }

      v14 = 0;
    }

  }
  else
  {
    v15 = BKLibraryLog(v6);
    v8 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_818F8();
    v14 = 0;
  }

  return v14;
}

- (id)libraryMutableAssetWithPermanentOrTemporaryAssetID:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
    -[NSObject setReturnsObjectsAsFaults:](v8, "setReturnsObjectsAsFaults:", 0);
    -[NSObject setFetchLimit:](v8, "setFetchLimit:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForPermanentOrTemporaryAssetIDTaggedLibraryAsset:](BKLibraryManager, "predicateForPermanentOrTemporaryAssetIDTaggedLibraryAsset:", v5));
    -[NSObject setPredicate:](v8, "setPredicate:", v9);

    v18 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v8, &v18));
    v11 = v18;
    v12 = v11;
    if (v10)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
    }
    else
    {
      v15 = BKLibraryLog(v11);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v5;
        v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Failed to fetch LibraryAsset with temporaryAssetID {%@}{%@}", buf, 0x16u);
      }

      v13 = 0;
    }

  }
  else
  {
    v14 = BKLibraryLog(v6);
    v8 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_818F8();
    v13 = 0;
  }

  return v13;
}

- (id)libraryMutableAssetWithAssetIdentifier:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
    -[NSObject setReturnsObjectsAsFaults:](v8, "setReturnsObjectsAsFaults:", 0);
    -[NSObject setFetchLimit:](v8, "setFetchLimit:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAssetIdentifierTaggedLibraryAsset:](BKLibraryManager, "predicateForAssetIdentifierTaggedLibraryAsset:", v5));
    -[NSObject setPredicate:](v8, "setPredicate:", v9);

    v18 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v8, &v18));
    v11 = v18;
    v12 = v11;
    if (v10)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
    }
    else
    {
      v15 = BKLibraryLog(v11);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v5;
        v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Failed to fetch LibraryAsset with assetIdentifier {%@}{%@}", buf, 0x16u);
      }

      v13 = 0;
    }

  }
  else
  {
    v14 = BKLibraryLog(v6);
    v8 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_81924();
    v13 = 0;
  }

  return v13;
}

+ (id)predicateForLocalAssetsNeedingFileSizeUpdates
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@ AND (%K == 0 OR %K == NULL OR %K == NULL)"), CFSTR("state"), &off_C9DC0, CFSTR("fileSize"), CFSTR("fileSize"), CFSTR("fileOnDiskLastTouchDate"));
}

+ (id)predicateForLocalAssetsNeedingEpubIDUpdates
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@ AND %K == NULL AND (%K == NULL OR %K == %@)"), CFSTR("state"), &off_C9DC0, CFSTR("epubID"), CFSTR("path"), CFSTR("path"), &stru_C40E8);
}

+ (id)predicateForLocalAssetsNeedingEpubIDUpdatesFromAssetIDs:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@ AND %K == %@ AND %K == NULL"), CFSTR("assetID"), a3, CFSTR("state"), &off_C9DC0, CFSTR("epubID"));
}

+ (id)predicateForAssetIDsTaggedLibraryAssets:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("assetID"), a3);
}

+ (id)predicateForAssetIDTaggedLibraryAsset:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("assetID"), a3);
}

+ (id)predicateForTemporaryAssetIDTaggedLibraryAsset:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("temporaryAssetID"), a3);
}

+ (id)predicateForPermanentOrTemporaryAssetIDTaggedLibraryAsset:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@ OR %K = %@"), CFSTR("assetID"), a3, CFSTR("temporaryAssetID"), a3);
}

+ (id)predicateForAssetIdentifierTaggedLibraryAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "permanentOrTemporaryAssetID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "permanentOrTemporaryAssetID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@ OR %K = %@"), CFSTR("assetID"), v4, CFSTR("temporaryAssetID"), v5));
  return v6;
}

+ (id)predicateForLibraryAssetWithValidAssetID
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL AND %K != 0"), CFSTR("assetID"), CFSTR("assetID"));
}

- (id)predicateForLibraryAssetsWithSeriesID:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v4 = a3;
  v5 = -[BKLibraryManager isExplicitMaterialAllowed](self, "isExplicitMaterialAllowed");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@ AND (%K = NULL OR %K != %@)"), CFSTR("seriesID"), v4, CFSTR("state"), CFSTR("contentType"), &off_C9D90));

  if ((v5 & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    v11[0] = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent](BKLibraryManager, "predicateToExcludeLibraryAssetsWithExplicitContent"));
    v11[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v9));

  }
  return v7;
}

+ (id)predicateForLibraryAssetsMarkedAsNew
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@ OR %K == %@)"), CFSTR("isNew"), &__kCFBooleanTrue, CFSTR("isSample"), v2, CFSTR("isSample"), &__kCFBooleanFalse));

  return v3;
}

+ (id)predicateForExcludingContainerLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("contentType"), &off_C9D90);
}

+ (id)predicateForExcludingUnownedAudiobookAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != %@ OR %K != %@"), CFSTR("contentType"), &off_C9DA8, CFSTR("state"), &off_C9DA8);
}

- (id)predicateForPurchasedBooksAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL AND %K != %@ AND %K != %@ AND isSample == NO"), CFSTR("storeID"), CFSTR("state"), &off_C9D90, CFSTR("state"), &off_C9DA8);
}

+ (id)predicateForAllStoreLibraryAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("storeID")));
  v7[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v4));

  return v5;
}

+ (id)predicateForAllStoreLibraryAssetsExcludingUnpurchasedSeriesAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL AND %K != %@ AND isSample == NO"), CFSTR("storeID"), CFSTR("state"), &off_C9D90));
  v7[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v4));

  return v5;
}

+ (id)predicateForPurchasedLibraryAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL AND %K != %@ AND isSample == NO AND %K != NULL"), CFSTR("storeID"), CFSTR("state"), &off_C9D90, CFSTR("purchaseDate")));
  v8[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateToExcludeAudiobookSupplementalContent"));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v5));

  return v6;
}

+ (id)predicateForDownloadableStoreLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != 0 AND %K != NULL"), CFSTR("storeID"), CFSTR("storeID"));
}

- (id)predicateForLocalLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("state"), &off_C9DC0);
}

- (id)predicateForDownloadingStoreLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@ AND %K != NULL"), CFSTR("state"), &off_C9E08, CFSTR("storeID"));
}

+ (id)predicateForLocalOrDownloadingLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == %@ OR %K == %@ OR %K == %@ OR %K == %@) AND isSample == NO"), CFSTR("state"), &off_C9DC0, CFSTR("state"), &off_C9E08, CFSTR("state"), &off_C9DD8, CFSTR("contentType"), &off_C9D90);
}

+ (id)predicateForLocalOrDownloadingLibraryAssetsIncludingSamples
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == %@ OR %K == %@ OR %K == %@ OR %K == %@)"), CFSTR("state"), &off_C9DC0, CFSTR("state"), &off_C9E08, CFSTR("state"), &off_C9DD8, CFSTR("contentType"), &off_C9D90);
}

+ (id)predicateForLocalOrDownloadingStoreAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL AND (%K == %@ OR %K == %@ OR %K == %@) AND isSample == NO"), CFSTR("storeID"), CFSTR("state"), &off_C9DC0, CFSTR("state"), &off_C9E08, CFSTR("state"), &off_C9DD8, CFSTR("contentType"));
}

+ (id)predicateForNonLocalAndNonDownloadingStoreAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL AND (%K != %@ AND %K != %@ AND %K != %@) AND isSample == NO"), CFSTR("storeID"), CFSTR("state"), &off_C9DC0, CFSTR("state"), &off_C9E08, CFSTR("state"), &off_C9DD8, CFSTR("contentType"));
}

+ (id)predicateForAllBooksExceptSeriesLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == %@) OR (%K != %@)"), CFSTR("contentType"), &off_C9D90, CFSTR("state"), &off_C9D90);
}

+ (id)_predicateForBooksShownInAllBooks
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K.%K.@count = 1 AND %K < %f) OR (%K = NULL AND %K != %@ AND %K != %@) OR (%K.@count > 1 OR (ANY %K.%K > %f))"), CFSTR("purchasedAndLocalParent"), CFSTR("purchasedAndLocalSeriesItems"), CFSTR("bookHighWaterMarkProgress"), 0x3FE99999A0000000, CFSTR("purchasedAndLocalParent"), CFSTR("contentType"), &off_C9D90, CFSTR("state"), &off_C9D90, CFSTR("purchasedAndLocalSeriesItems"), CFSTR("purchasedAndLocalSeriesItems"), CFSTR("bookHighWaterMarkProgress"), 0x3FE99999A0000000);
}

+ (id)predicateForBooksShownInAllBooks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_predicateForBooksShownInAllBooks"));
  v7[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v4));

  return v5;
}

+ (id)predicateToExcludeLibraryAssetsWithExplicitContent
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == NO OR %K == NULL"), CFSTR("isExplicit"), CFSTR("isExplicit"));
}

+ (id)predicateToExcludeLibraryAssetsAndAssetsInSeriesContainersWithExplicitContent
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == NO OR %K == NULL) AND (%K.%K == NO OR %K.%K == NULL)"), CFSTR("isExplicit"), CFSTR("isExplicit"), CFSTR("seriesContainer"), CFSTR("isExplicit"), CFSTR("seriesContainer"), CFSTR("isExplicit"));
}

+ (id)predicateToExcludeLibraryAssetsAndContainersWithExplicitContent
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == NO OR %K == NULL) AND (%K != %@ OR (ANY %K.%K = NO OR ANY %K.%K == NULL))"), CFSTR("isExplicit"), CFSTR("isExplicit"), CFSTR("contentType"), &off_C9D90, CFSTR("purchasedAndLocalSeriesItems"), CFSTR("isExplicit"), CFSTR("purchasedAndLocalSeriesItems"), CFSTR("isExplicit"));
}

+ (id)predicateForContentWithHighWaterMarkOrReadingProgressValue:(double)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K >= %@ OR %K >= %@)"), CFSTR("bookHighWaterMarkProgress"), v4, CFSTR("readingProgress"), v5));

  return v6;
}

+ (id)predicateForLastOpenedDateAfter:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K >= %@)"), CFSTR("lastOpenDate"), a3));
  else
    return 0;
}

+ (unint64_t)numberOfLibraryAssetsInManagdObjectContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v16;
  _QWORD v17[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeUnownedLibraryAssets](BKLibraryManager, "predicateToExcludeUnownedLibraryAssets"));
  v17[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
  v17[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v7));
  objc_msgSend(v4, "setPredicate:", v8);

  objc_msgSend(v4, "setResultType:", 4);
  v16 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &v16));

  v10 = v16;
  v11 = v10;
  if (v9)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
    v13 = -[NSObject unsignedIntegerValue](v12, "unsignedIntegerValue");
  }
  else
  {
    v14 = BKLibraryLog(v10);
    v12 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_81950();
    v13 = 0;
  }

  return (unint64_t)v13;
}

+ (id)predicateToExcludeSeriesLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("state"), &off_C9D90);
}

+ (id)predicateToExcludeUnownedLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != %@ AND %K != %@"), CFSTR("state"), &off_C9D90, CFSTR("state"), &off_C9DA8);
}

+ (id)excludeHiddenAssetsPredicate
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == NO OR %K == NULL) AND (%K == NO OR %K == NULL)"), CFSTR("isHidden"), CFSTR("isHidden"), CFSTR("isEphemeral"), CFSTR("isEphemeral"));
}

+ (id)hiddenAssetsPredicate
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == YES"), CFSTR("isHidden"));
}

+ (id)excludeEphemeralAssetsPredicate
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == NO OR %K == NULL"), CFSTR("isEphemeral"), CFSTR("isEphemeral"));
}

+ (id)ephemeralSamplesPredicate
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == YES) AND (%K == YES)"), CFSTR("isEphemeral"), CFSTR("isSample"));
}

+ (id)excludeAudiobooksPredicate
{
  return _objc_msgSend(a1, "predicateForNotContentType:", 6);
}

+ (id)predicateToExcludeAudiobookSupplementalContent
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == NO OR %K == NULL"), CFSTR("isSupplementalContent"), CFSTR("isSupplementalContent"));
}

+ (id)predicateForLocalOrDownloadingOrImportingLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@ OR %K == %@ OR %K == %@"), CFSTR("state"), &off_C9DC0, CFSTR("state"), &off_C9E08, CFSTR("state"), &off_C9DD8);
}

+ (id)predicateForLibraryAssetsRecentlyOpened
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("lastOpenDate"));
}

+ (id)_predicateForAssetsWithContentTypes:(id)a3
{
  return +[BKLibraryManager predicateForContentTypes:](BKLibraryManager, "predicateForContentTypes:", a3);
}

+ (id)predicateForAssetsAvailableToAppIntentsWithTypes:(id)a3
{
  _UNKNOWN **v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[2];
  _UNKNOWN **v28;
  _QWORD v29[2];
  _QWORD v30[2];

  v3 = (_UNKNOWN **)a3;
  if (!objc_msgSend(v3, "count"))
  {

    v3 = &off_CA000;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeUnownedLibraryAssets](BKLibraryManager, "predicateToExcludeUnownedLibraryAssets"));
  v30[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
  v30[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager _predicateForAssetsWithContentTypes:](BKLibraryManager, "_predicateForAssetsWithContentTypes:", v3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v8, v9, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v7));
  if (objc_msgSend(v3, "containsObject:", &off_C9DC0))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAssetsInCollectionID:allowExplicit:includeSeriesItems:](BKLibraryManager, "predicateForAssetsInCollectionID:allowExplicit:includeSeriesItems:", kBKCollectionDefaultIDSamples, 1, 0));
    v28 = &off_C9DC0;
    v29[0] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForContentTypes:](BKLibraryManager, "predicateForContentTypes:", v13));
    v29[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v15));

    objc_msgSend(v11, "addObject:", v16);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForLibraryAssetWithValidAssetID](BKLibraryManager, "predicateForLibraryAssetWithValidAssetID"));
  objc_msgSend(v10, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL AND %K != %@"), CFSTR("title"), CFSTR("title"), &stru_C40E8));
  objc_msgSend(v10, "addObject:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  v20 = objc_msgSend(v19, "isExplicitContentAllowed");

  if ((v20 & 1) == 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAssetsWithExplicitContent](BKLibraryManager, "predicateToExcludeAssetsWithExplicitContent"));
    objc_msgSend(v10, "addObject:", v21);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v11));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v10));
  v27[0] = v23;
  v27[1] = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v24));

  return v25;
}

+ (id)predicateForMatchingSearchStringLibraryAssets:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K contains[cd] %@ OR %K contains[cd] %@ OR %K contains[cd] %@ OR %K CONTAINS[cd] %@"), CFSTR("title"), v3, CFSTR("author"), v3, CFSTR("genre"), v3, CFSTR("localOnlySeriesItemsParent.title"), v3));
  else
    v4 = 0;

  return v4;
}

+ (id)predicateForLibraryAssetsNotMarkedAsOld
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("((%K == %@) OR (%K == %@)) AND (%K == %@ OR %K == %@)"), CFSTR("isNew"), v2, CFSTR("isNew"), &__kCFBooleanTrue, CFSTR("isSample"), v3, CFSTR("isSample"), &__kCFBooleanFalse));

  return v4;
}

+ (id)predicateForLibraryAssetsWithoutCoverURL
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == NULL OR %K == %@"), CFSTR("coverURL"), CFSTR("coverURL"), &stru_C40E8);
}

+ (id)predicateForLibraryAssetsMissingExplicitContentFlag
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == NULL"), CFSTR("isExplicit"));
}

+ (id)predicateForNextInSeriesLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL AND %K != 0"), CFSTR("seriesNextFlag"), CFSTR("seriesNextFlag"));
}

+ (id)predicateForUnownedSeriesLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != 0 AND %K != NULL AND %K == %@"), CFSTR("storeID"), CFSTR("storeID"), CFSTR("state"), &off_C9D90);
}

+ (id)predicateForUnownedStoreLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != 0 AND %K != NULL AND (%K == %@ OR %K == YES)"), CFSTR("storeID"), CFSTR("storeID"), CFSTR("state"), &off_C9DA8, CFSTR("isSample"));
}

+ (id)predicateForAllUnownedLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != 0 AND %K != NULL AND (%K == %@ OR %K == %@)"), CFSTR("storeID"), CFSTR("storeID"), CFSTR("state"), &off_C9D90, CFSTR("state"), &off_C9DA8);
}

+ (id)predicateForContainerLibraryAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("contentType"), &off_C9D90);
}

+ (id)predicateForHighWaterMarkCapableLibraryAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateToExcludeUnownedLibraryAssets"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateForExcludingContainerLibraryAssets", v3));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateToExcludeAudiobookSupplementalContent"));
  v9[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v6));
  return v7;
}

+ (id)predicateForSupplementalContentLibraryAssetsWithStorePlaylistID:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@ AND %K == YES"), CFSTR("storePlaylistID"), a3, CFSTR("isSupplementalContent"));
}

+ (id)predicateForSupplementalContentLibraryAssetsWithStorePlaylistIDs:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@ AND %K == YES"), CFSTR("storePlaylistID"), a3, CFSTR("isSupplementalContent"));
}

+ (id)libraryAssetsWithAssetIDsContainedInList:(id)a3 tempAssetIDs:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v22;
  _QWORD v23[2];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  objc_msgSend(v10, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v10, "setFetchBatchSize:", 32);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAssetIDsTaggedLibraryAssets:](BKLibraryManager, "predicateForAssetIDsTaggedLibraryAssets:", v7));
  objc_msgSend(v10, "setPredicate:", v11);

  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "predicate"));
    v23[0] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForTemporaryAssetIDsTaggedLibraryAssets:](BKLibraryManager, "predicateForTemporaryAssetIDsTaggedLibraryAssets:", v8));
    v23[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v14));
    objc_msgSend(v10, "setPredicate:", v15);

  }
  v22 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "executeFetchRequest:error:", v10, &v22));
  v17 = v22;
  v18 = v17;
  if (!v16)
  {
    v19 = BKLibraryLog(v17);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_819B0();

  }
  return v16;
}

+ (id)newestSeriesBookWithBasePredicate:(id)a3 forBook:(id)a4
{
  id v5;
  id v6;
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
  id v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "seriesID"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v29[0] = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "seriesID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "predicateForLibraryAssetsWithSeriesID:", v10));
    v29[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForLibraryAssetsMarkedAsNew](BKLibraryManager, "predicateForLibraryAssetsMarkedAsNew"));
    v29[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 3));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0));
    v28[0] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("seriesSortKey"), 0));
    v28[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 2));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
    objc_msgSend(v18, "setPredicate:", v14);
    objc_msgSend(v18, "setFetchLimit:", 1);
    objc_msgSend(v18, "setSortDescriptors:", v17);
    objc_msgSend(v18, "setReturnsObjectsAsFaults:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
    v27 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "executeFetchRequest:error:", v18, &v27));
    v21 = v27;

    if (!v20 || (v22 = objc_msgSend(v20, "count")) == 0)
    {
      v23 = BKLibraryLog(v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_81A10();

    }
    if (objc_msgSend(v20, "count"))
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndex:", 0));
    else
      v25 = 0;

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (id)mostRecentlyOpenedSeriesBookWithBasePredicate:(id)a3 forBook:(id)a4
{
  id v5;
  id v6;
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
  id v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v27;
  _QWORD v28[3];
  _QWORD v29[2];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "seriesID"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v29[0] = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "seriesID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "predicateForLibraryAssetsWithSeriesID:", v10));
    v29[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("lastOpenDate"), 0));
    v28[0] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0));
    v28[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("seriesSortKey"), 0));
    v28[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 3));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
    objc_msgSend(v18, "setPredicate:", v13);
    objc_msgSend(v18, "setFetchLimit:", 1);
    objc_msgSend(v18, "setSortDescriptors:", v17);
    objc_msgSend(v18, "setReturnsObjectsAsFaults:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
    v27 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "executeFetchRequest:error:", v18, &v27));
    v21 = v27;

    if (!v20 || (v22 = objc_msgSend(v20, "count")) == 0)
    {
      v23 = BKLibraryLog(v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_81A10();

    }
    if (objc_msgSend(v20, "count"))
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndex:", 0));
    else
      v25 = 0;

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)predicateForSeriesBooksIncludingNextForID:(id)a3 includeAllBooksInSeries:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  id v14;
  _QWORD v16[2];
  _QWORD v17[2];

  v4 = a4;
  v6 = a3;
  if (-[BKLibraryManager usePerformancePredicates](self, "usePerformancePredicates") || v4)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForAllBooksWithSeriesID:](self, "predicateForAllBooksWithSeriesID:", v6));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForAllBooksWithSeriesID:](self, "predicateForAllBooksWithSeriesID:", v6));
    v17[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForNextInSeriesLibraryAssets](BKLibraryManager, "predicateForNextInSeriesLibraryAssets"));
    v17[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForLocalBooksWithSeriesID:](self, "predicateForLocalBooksWithSeriesID:", v6));
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_msgSend(WeakRetained, "isStoreAllowed") & 1) != 0)
    {
      v16[0] = v10;
      v16[1] = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v13));

    }
    else
    {
      v14 = v11;
    }

  }
  return v14;
}

+ (id)adjacentSeriesBooksWithMaxCount:(unint64_t)a3 withSmallerSeriesSortKeys:(BOOL)a4 basePredicate:(id)a5 forBook:(id)a6 includeAllBooksInSeries:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v35;
  id v36;
  id v37;
  _QWORD v38[2];
  _QWORD v39[2];

  v7 = a7;
  v9 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "seriesID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "predicateForSeriesBooksIncludingNextForID:includeAllBooksInSeries:", v14, v7));

  v35 = v11;
  v39[0] = v11;
  v39[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 2));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "seriesSortKey"));
  if (v18)
  {
    if (v9)
      v19 = CFSTR("%K < %@");
    else
      v19 = CFSTR("%K > %@");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "seriesSortKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v19, CFSTR("seriesSortKey"), v20));

    v38[0] = v17;
    v38[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));
    v23 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v22));

    v17 = (void *)v23;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  objc_msgSend(v24, "setPredicate:", v17);
  objc_msgSend(v24, "setFetchLimit:", a3);
  v25 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("seriesSortKey"), !v9);
  v37 = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
  objc_msgSend(v24, "setSortDescriptors:", v26);

  objc_msgSend(v24, "setReturnsObjectsAsFaults:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "managedObjectContext"));
  v36 = 0;
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "executeFetchRequest:error:", v24, &v36));
  v29 = v36;

  if (v28)
  {
    if (!v9)
    {
      v33 = v11;
      goto LABEL_14;
    }
    v31 = objc_claimAutoreleasedReturnValue(-[NSObject bu_reversedArray](v28, "bu_reversedArray"));
  }
  else
  {
    v32 = BKLibraryLog(v30);
    v28 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_81A94();
    v31 = 0;
  }
  v33 = v35;

  v28 = v31;
LABEL_14:

  return v28;
}

- (unint64_t)countOfBooksInSeriesRelativeToBook:(id)a3 includeAllBooksInSeries:(BOOL)a4 relation:(int)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v25;
  _QWORD v26[2];

  v6 = a4;
  v8 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 7501, "-[BKLibraryManager countOfBooksInSeriesRelativeToBook:includeAllBooksInSeries:relation:]", "[NSThread isMainThread]", CFSTR("only call from main thread"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "seriesID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForSeriesBooksIncludingNextForID:includeAllBooksInSeries:](self, "predicateForSeriesBooksIncludingNextForID:includeAllBooksInSeries:", v10, v6));

  if (v8
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "seriesSortKey")), v12, v12))
  {
    if (a5 == 2)
      v13 = CFSTR("%K > %@");
    else
      v13 = CFSTR("%K < %@");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "seriesSortKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v13, CFSTR("seriesSortKey"), v14));

    v26[0] = v15;
    v26[1] = v11;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v16));

  }
  else
  {
    v17 = v11;
  }
  objc_msgSend(v9, "setPredicate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
  v25 = 0;
  v19 = objc_msgSend(v18, "countForFetchRequest:error:", v9, &v25);
  v20 = v25;

  if (v19 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = BKLibraryLog(v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_81AF4();

    v19 = 0;
  }

  return (unint64_t)v19;
}

- (id)seriesAuthorForContainerID:(id)a3 context:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager _rawSeriesAuthorForContainerID:context:](self, "_rawSeriesAuthorForContainerID:context:", a3, a4));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("MultipleAuthors")))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[BKLibraryAsset multipleAuthors](BKLibraryAsset, "multipleAuthors"));

    v4 = (void *)v5;
  }
  return v4;
}

- (id)_predicateForBooksInSeriesWithCorrectSortAuthorInfo:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("seriesID = %@ AND contentType != %@ AND state != %@ AND state != %@"), a3, &off_C9D90, &off_C9D90, &off_C9DA8);
}

- (id)_predicateForBooksInSeriesWithCorrectAuthorInfo:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("seriesID = %@ AND contentType != %@"), a3, &off_C9D90);
}

- (id)_rawSeriesAuthorForContainerID:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  __CFString *v15;
  void *v17;
  id v18;
  id v19;
  const __CFString *v20;
  const __CFString *v21;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager _predicateForBooksInSeriesWithCorrectAuthorInfo:](self, "_predicateForBooksInSeriesWithCorrectAuthorInfo:", v7));

  objc_msgSend(v8, "setPredicate:", v9);
  objc_msgSend(v8, "setResultType:", 2);
  v21 = CFSTR("author");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  objc_msgSend(v8, "setPropertiesToFetch:", v10);

  v20 = CFSTR("author");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  objc_msgSend(v8, "setPropertiesToGroupBy:", v11);

  v19 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v8, &v19));

  v13 = v19;
  if (!v12)
  {
    v17 = v8;
    v18 = v13;
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 7561, "-[BKLibraryManager _rawSeriesAuthorForContainerID:context:]", "results", CFSTR("Failed to Perform Fetch: %@ -- %@"));
  }
  if (objc_msgSend(v12, "count", v17, v18) == (char *)&dword_0 + 1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", CFSTR("author")));

  }
  else if ((unint64_t)objc_msgSend(v12, "count") <= 1)
  {
    v15 = 0;
  }
  else
  {
    v15 = CFSTR("MultipleAuthors");
  }

  return v15;
}

- (id)_rawSeriesSortAuthorForContainerID:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  __CFString *v15;
  void *v17;
  id v18;
  id v19;
  const __CFString *v20;
  const __CFString *v21;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager _predicateForBooksInSeriesWithCorrectSortAuthorInfo:](self, "_predicateForBooksInSeriesWithCorrectSortAuthorInfo:", v7));

  objc_msgSend(v8, "setPredicate:", v9);
  objc_msgSend(v8, "setResultType:", 2);
  v21 = CFSTR("sortAuthor");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  objc_msgSend(v8, "setPropertiesToFetch:", v10);

  v20 = CFSTR("sortAuthor");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  objc_msgSend(v8, "setPropertiesToGroupBy:", v11);

  v19 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v8, &v19));

  v13 = v19;
  if (!v12)
  {
    v17 = v8;
    v18 = v13;
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibraryManager.m", 7587, "-[BKLibraryManager _rawSeriesSortAuthorForContainerID:context:]", "results", CFSTR("Failed to Perform Fetch: %@ -- %@"));
  }
  if (objc_msgSend(v12, "count", v17, v18) == (char *)&dword_0 + 1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", CFSTR("sortAuthor")));

  }
  else if ((unint64_t)objc_msgSend(v12, "count") <= 1)
  {
    v15 = 0;
  }
  else
  {
    v15 = CFSTR("MultipleAuthors");
  }

  return v15;
}

- (id)localSeriesBooksForSeriesID:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForLocalBooksWithSeriesID:](self, "predicateForLocalBooksWithSeriesID:", v7));

  objc_msgSend(v8, "setPredicate:", v9);
  objc_msgSend(v8, "setReturnsObjectsAsFaults:", 0);
  v12 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v8, &v12));

  return v10;
}

+ (BOOL)hasAnySeriesStackBooksWithBasePredicate:(id)a3 forBook:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v18;
  _QWORD v19[2];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "seriesID"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v19[0] = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "seriesID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "predicateForLibraryAssetsWithSeriesID:", v10));
    v19[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
    objc_msgSend(v14, "setPredicate:", v13);
    objc_msgSend(v14, "setFetchLimit:", 1);
    objc_msgSend(v14, "setSortDescriptors:", 0);
    objc_msgSend(v14, "setReturnsObjectsAsFaults:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
    v18 = 0;
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "executeFetchRequest:error:", v14, &v18));

  }
  v16 = objc_msgSend(v8, "count") != 0;

  return v16;
}

- (id)contentPredicateForSeriesID:(id)a3 onlyPurchased:(BOOL)a4 forceCloud:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager contentPredicateForSeriesID:onlyPurchased:forceCloud:allowsExplicit:](self, "contentPredicateForSeriesID:onlyPurchased:forceCloud:allowsExplicit:", v8, v6, v5, -[BKLibraryManager isExplicitMaterialAllowed](self, "isExplicitMaterialAllowed")));

  return v9;
}

- (id)contentPredicateForSeriesID:(id)a3 onlyPurchased:(BOOL)a4 forceCloud:(BOOL)a5 allowsExplicit:(BOOL)a6
{
  _BOOL4 v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _UNKNOWN **v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[3];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];

  v8 = a4;
  v44 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForLibraryAssetsWithSeriesID:](self, "predicateForLibraryAssetsWithSeriesID:"));
  v51[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingContainerLibraryAssets](BKLibraryManager, "predicateForExcludingContainerLibraryAssets"));
  v51[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v12));

  if (v8 && !-[BKLibraryManager usePerformancePredicates](self, "usePerformancePredicates"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeUnownedLibraryAssets](BKLibraryManager, "predicateToExcludeUnownedLibraryAssets"));
    v50[0] = v13;
    v50[1] = v15;
    v16 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 2));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v16));

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    LOBYTE(v16) = objc_msgSend(WeakRetained, "isShowPurchasesEnabled");

    if ((v16 & 1) != 0 || a5)
    {
      v14 = &_s10Foundation12NotificationV6objectypSgvg_ptr;
    }
    else
    {
      v49[0] = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForLocalOrDownloadingLibraryAssets](BKLibraryManager, "predicateForLocalOrDownloadingLibraryAssets"));
      v49[1] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 2));
      v21 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v20));

      v14 = &_s10Foundation12NotificationV6objectypSgvg_ptr;
      v17 = (void *)v21;
    }

    v13 = v17;
  }
  else
  {
    v14 = &_s10Foundation12NotificationV6objectypSgvg_ptr;
  }
  if (!a6)
  {
    v22 = v14[313];
    v48[0] = v13;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent](BKLibraryManager, "predicateToExcludeLibraryAssetsWithExplicitContent"));
    v48[1] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 2));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "andPredicateWithSubpredicates:", v24));

    v13 = (void *)v25;
  }
  v26 = v14[313];
  v47[0] = v13;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager excludeEphemeralAssetsPredicate](BKLibraryManager, "excludeEphemeralAssetsPredicate"));
  v47[1] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
  v47[2] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 3));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "andPredicateWithSubpredicates:", v29));

  v31 = objc_loadWeakRetained((id *)&self->_delegate);
  v32 = objc_msgSend(v31, "isStoreAllowed");

  if (v32)
  {
    v33 = v14[313];
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForNextInSeriesLibraryAssets](BKLibraryManager, "predicateForNextInSeriesLibraryAssets"));
    v46[0] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v36 = v44;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "predicateForLibraryAssetsWithSeriesID:", v44));
    v46[1] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 2));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "andPredicateWithSubpredicates:", v38));

    v40 = v14[313];
    v45[0] = v30;
    v45[1] = v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 2));
    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "orPredicateWithSubpredicates:", v41));

    v30 = (void *)v42;
  }
  else
  {
    v36 = v44;
  }

  return v30;
}

+ (id)seriesStackBooksForBook:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BYTE *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  char *v47;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[3];
  _BYTE v62[128];

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 5));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesBooks"));
  if (!objc_msgSend(v5, "count"))
    goto LABEL_47;
  v50 = v4;
  v51 = v3;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v49 = v5;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  if (!v7)
  {
    v9 = 0;
    v53 = 0;
    v54 = 0;
    v52 = 0;
    goto LABEL_35;
  }
  v8 = v7;
  v9 = 0;
  v53 = 0;
  v54 = 0;
  v52 = 0;
  v10 = *(_QWORD *)v58;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v58 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
      if (!objc_msgSend(v12, "isValid"))
        continue;
      if (objc_msgSend(v12, "state") != 5 && objc_msgSend(v12, "state") != 6)
      {
        if (objc_msgSend(v12, "isNew"))
        {
          if (!v52
            || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "purchaseDate")),
                v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "purchaseDate")),
                v15 = objc_msgSend(v13, "compare:", v14),
                v14,
                v13,
                v15 == (id)-1))
          {
            v16 = v12;

            v52 = v16;
          }
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastOpenDate"));
        if (v17)
        {
          v18 = v17;
          if (!v53)
          {

LABEL_19:
            v22 = v12;

            v53 = v22;
            goto LABEL_20;
          }
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "lastOpenDate"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastOpenDate"));
          v21 = objc_msgSend(v19, "compare:", v20);

          if (v21 == (id)-1)
            goto LABEL_19;
        }
      }
LABEL_20:
      if (objc_msgSend(v12, "state") != 6
        || (v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "creationDate"))) == 0)
      {
LABEL_24:
        if (!v9)
          goto LABEL_30;
        goto LABEL_25;
      }
      v24 = v23;
      if (v54)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "creationDate"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "creationDate"));
        v27 = objc_msgSend(v25, "compare:", v26);

        if (v27 != (id)-1)
          goto LABEL_24;
      }
      else
      {

      }
      v33 = v12;

      v54 = v33;
      if (!v9)
        goto LABEL_30;
LABEL_25:
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "seriesSortKey"));
      if (v28)
      {
        v29 = (void *)v28;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "seriesSortKey"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "seriesSortKey"));
        v32 = (char *)objc_msgSend(v30, "compare:", v31);

        if (v32 == (_BYTE *)&dword_0 + 1)
        {
LABEL_30:
          v34 = v12;

          v9 = v34;
          continue;
        }
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  }
  while (v8);
LABEL_35:

  v35 = v53;
  if (!v53)
    v35 = v9;
  if (v52)
    v35 = v52;
  v36 = v35;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("seriesSortKey"), 1));
  v61[0] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("sequenceDisplayName"), 1));
  v61[1] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("assetID"), 1));
  v61[2] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v61, 3));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortedArrayUsingDescriptors:", v40));

  v42 = objc_msgSend(v41, "indexOfObjectIdenticalTo:", v36);
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "subarrayWithRange:", v42, (_BYTE *)objc_msgSend(v41, "count") - v42));
  objc_msgSend(v50, "addObjectsFromArray:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "subarrayWithRange:", 0, v42));
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_2DE58;
  v55[3] = &unk_C22E8;
  v4 = v50;
  v56 = v4;
  objc_msgSend(v44, "enumerateObjectsWithOptions:usingBlock:", 2, v55);
  if (objc_msgSend(v36, "isFinished"))
  {
    objc_msgSend(v4, "removeObjectAtIndex:", 0);
    objc_msgSend(v4, "addObject:", v36);
  }
  v3 = v51;
  if ((unint64_t)objc_msgSend(v4, "count") >= 6)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", 0, 5));
    v46 = objc_msgSend(v45, "mutableCopy");

    v4 = v46;
    v5 = v49;
  }
  else
  {
    v47 = (char *)objc_msgSend(v4, "count");
    v5 = v49;
    if (v47 == (_BYTE *)&dword_0 + 1)
      objc_msgSend(v4, "addObject:", v36);
  }

LABEL_47:
  return v4;
}

- (id)storeIDsForDownloadingBooks
{
  void *v3;
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
  v10 = sub_88C4;
  v11 = sub_88D4;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager workerChildContext](self, "workerChildContext"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2DF58;
  v6[3] = &unk_C2310;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)localNonSampleLibraryAssetStoreSummaries
{
  return -[BKLibraryManager localNonSampleLibraryAssetStoreSummariesExcludeAudiobooks:](self, "localNonSampleLibraryAssetStoreSummariesExcludeAudiobooks:", 0);
}

- (id)localNonSampleLibraryAssetStoreSummariesExcludeAudiobooks:(BOOL)a3
{
  NSMutableArray *v3;
  id v4;
  _QWORD v6[4];
  BKLibraryManager *v7;
  NSMutableArray *v8;
  BOOL v9;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2E19C;
  v6[3] = &unk_C2158;
  v9 = a3;
  v7 = self;
  v8 = objc_opt_new(NSMutableArray);
  v3 = v8;
  -[BKLibraryManager performBackgroundReadOnlyBlockAndWait:](v7, "performBackgroundReadOnlyBlockAndWait:", v6);
  v4 = -[NSMutableArray copy](v3, "copy");

  return v4;
}

- (void)fetchLibraryAssetFromStoreID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2E5A8;
  v8[3] = &unk_C1F70;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[BKLibraryManager performBackgroundReadOnlyBlock:](self, "performBackgroundReadOnlyBlock:", v8);

}

- (void)fetchLibraryAssetFromAssetID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2E76C;
  v8[3] = &unk_C1F70;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[BKLibraryManager performBackgroundReadOnlyBlock:](self, "performBackgroundReadOnlyBlock:", v8);

}

- (void)fetchLibraryAssetsFromStoreIDs:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2E930;
  v8[3] = &unk_C1F70;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[BKLibraryManager performBackgroundReadOnlyBlock:](self, "performBackgroundReadOnlyBlock:", v8);

}

- (void)fetchLibraryAssetsFromAssetIDs:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2EAC8;
  v8[3] = &unk_C1F70;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[BKLibraryManager performBackgroundReadOnlyBlock:](self, "performBackgroundReadOnlyBlock:", v8);

}

- (void)allUnownedStoreAssetIDs:(id)a3
{
  id v3;
  _QWORD v4[4];
  BKLibraryManager *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2EC38;
  v4[3] = &unk_C1F70;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[BKLibraryManager performBackgroundReadOnlyBlock:](v5, "performBackgroundReadOnlyBlock:", v4);

}

- (void)allUnownedIDs:(id)a3
{
  id v3;
  _QWORD v4[4];
  BKLibraryManager *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2EF14;
  v4[3] = &unk_C1F70;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[BKLibraryManager performBackgroundReadOnlyBlock:](v5, "performBackgroundReadOnlyBlock:", v4);

}

+ (id)searchFetchRequestWithText:(id)a3 entityType:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_predicateForSearchText:", v5));

  objc_msgSend(v7, "addObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
  objc_msgSend(v7, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAssetsWithSeriesContainersWithNoOwnedBooks](BKLibraryManager, "predicateToExcludeAssetsWithSeriesContainersWithNoOwnedBooks"));
  objc_msgSend(v7, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAssetsForSeriesAndStoreItemsNotAddedToCollections](BKLibraryManager, "predicateToExcludeAssetsForSeriesAndStoreItemsNotAddedToCollections"));
  objc_msgSend(v7, "addObject:", v11);

  switch(a4)
  {
    case 1:
      v13 = objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForNotContentTypes:](BKLibraryManager, "predicateForNotContentTypes:", &off_CA018));
      goto LABEL_5;
    case 2:
      v13 = objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForContentType:](BKLibraryManager, "predicateForContentType:", 6));
      goto LABEL_5;
    case 3:
      v13 = objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForContainerLibraryAssets](BKLibraryManager, "predicateForContainerLibraryAssets"));
LABEL_5:
      v14 = v13;
      objc_msgSend(v7, "addObject:", v13);
      goto LABEL_8;
    case 4:
      v15 = BKLibraryLog(v12);
      v14 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        sub_81C24(v14, v16, v17, v18, v19, v20, v21, v22);
LABEL_8:

      break;
    default:
      break;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager excludeEphemeralAssetsPredicate](BKLibraryManager, "excludeEphemeralAssetsPredicate"));
  objc_msgSend(v7, "addObject:", v23);

  v24 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortDescriptorsForMode:collectionID:", 3, kBKCollectionDefaultAll));
  objc_msgSend(v24, "setSortDescriptors:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v7));
  objc_msgSend(v24, "setPredicate:", v26);

  objc_msgSend(v24, "setReturnsObjectsAsFaults:", 0);
  return v24;
}

+ (id)_recentlyEngagedPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("lastEngagedDate")));
  v10[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == YES"), CFSTR("isTrackedAsRecent")));
  v10[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingUnownedAudiobookAssets](BKLibraryManager, "predicateForExcludingUnownedAudiobookAssets"));
  v10[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingContainerLibraryAssets](BKLibraryManager, "predicateForExcludingContainerLibraryAssets"));
  v10[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
  v10[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v7));

  return v8;
}

+ (id)_continueReadingPredicate
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  v4 = objc_msgSend(v3, "isExplicitContentAllowed");

  return _objc_msgSend(a1, "_continueReadingPredicateIncludingExplicitContent:", v4);
}

+ (id)_continueReadingPredicateIncludingExplicitContent:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  _UNKNOWN **v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("lastEngagedDate")));
  v16[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == YES"), CFSTR("isTrackedAsRecent")));
  v16[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingContainerLibraryAssets](BKLibraryManager, "predicateForExcludingContainerLibraryAssets"));
  v16[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
  v16[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 4));
  v9 = objc_msgSend(v8, "mutableCopy");

  if (!a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent](BKLibraryManager, "predicateToExcludeLibraryAssetsWithExplicitContent"));
    objc_msgSend(v9, "addObject:", v10);

  }
  if (+[BCPPTConfig usePPTLaunchContent](BCPPTConfig, "usePPTLaunchContent"))
  {
    objc_msgSend(v9, "removeAllObjects");
    v11 = +[BCPPTConfig shouldHaveContinueAndPreviousContent](BCPPTConfig, "shouldHaveContinueAndPreviousContent");
    v12 = (_UNKNOWN **)&__NSArray0__struct;
    if (v11)
      v12 = &off_CA060;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("assetID"), v12));
    objc_msgSend(v9, "addObject:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v9));

  return v14;
}

+ (id)_recentlyReadPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("lastOpenDate")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == NO"), CFSTR("isTrackedAsRecent"), v2));
  v9[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingContainerLibraryAssets](BKLibraryManager, "predicateForExcludingContainerLibraryAssets"));
  v9[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
  v9[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v6));

  return v7;
}

+ (id)_previouslyReadPredicate
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  _UNKNOWN **v12;
  void *v13;
  void *v14;
  _QWORD v16[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("lastEngagedDate")));
  v3 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == NULL OR %K == NO"), CFSTR("isTrackedAsRecent"), CFSTR("isTrackedAsRecent"), v2));
  v16[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingContainerLibraryAssets](BKLibraryManager, "predicateForExcludingContainerLibraryAssets"));
  v16[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
  v16[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeSeriesLibraryAssets](BKLibraryManager, "predicateToExcludeSeriesLibraryAssets"));
  v16[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 5));
  v8 = objc_msgSend(v7, "mutableCopy");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  LOBYTE(v3) = objc_msgSend(v9, "isExplicitContentAllowed");

  if ((v3 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent](BKLibraryManager, "predicateToExcludeLibraryAssetsWithExplicitContent"));
    objc_msgSend(v8, "addObject:", v10);

  }
  if (+[BCPPTConfig usePPTLaunchContent](BCPPTConfig, "usePPTLaunchContent"))
  {
    objc_msgSend(v8, "removeAllObjects");
    v11 = +[BCPPTConfig shouldHaveContinueAndPreviousContent](BCPPTConfig, "shouldHaveContinueAndPreviousContent");
    v12 = (_UNKNOWN **)&__NSArray0__struct;
    if (v11)
      v12 = &off_CA060;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("assetID"), v12));
    objc_msgSend(v8, "addObject:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v8));

  return v14;
}

+ (id)fetchRequestForRecentlyEngaged
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v8;

  v3 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  v4 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("lastEngagedDate"), 0);
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  objc_msgSend(v3, "setSortDescriptors:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_recentlyEngagedPredicate"));
  objc_msgSend(v3, "setPredicate:", v6);

  objc_msgSend(v3, "setReturnsObjectsAsFaults:", 0);
  return v3;
}

+ (id)fetchRequestForContinueReading
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v8;

  v3 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  v4 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("lastEngagedDate"), 0);
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  objc_msgSend(v3, "setSortDescriptors:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_continueReadingPredicate"));
  objc_msgSend(v3, "setPredicate:", v6);

  objc_msgSend(v3, "setReturnsObjectsAsFaults:", 0);
  return v3;
}

+ (id)fetchRequestForRecentlyRead
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v8;

  v3 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  v4 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("lastOpenDate"), 0);
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  objc_msgSend(v3, "setSortDescriptors:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_recentlyReadPredicate"));
  objc_msgSend(v3, "setPredicate:", v6);

  objc_msgSend(v3, "setReturnsObjectsAsFaults:", 0);
  return v3;
}

+ (id)fetchRequestForPreviouslyRead
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v8;

  v3 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  v4 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("lastEngagedDate"), 0);
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  objc_msgSend(v3, "setSortDescriptors:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_previouslyReadPredicate"));
  objc_msgSend(v3, "setPredicate:", v6);

  objc_msgSend(v3, "setReturnsObjectsAsFaults:", 0);
  return v3;
}

- (void)assetAccountIdentifiersForAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "purchasedDSID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "downloadedDSID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "familyID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataSourceIdentifier"));

  -[BKLibraryManager assetAccountIdentifiersForAssetID:path:storeID:purchasedDSID:downloadedDSID:familyID:dataSourceID:completion:](self, "assetAccountIdentifiersForAssetID:path:storeID:purchasedDSID:downloadedDSID:familyID:dataSourceID:completion:", v14, v8, v9, v10, v11, v12, v13, v6);
}

- (void)assetAccountIdentifiersForAssetID:(id)a3 path:(id)a4 storeID:(id)a5 purchasedDSID:(id)a6 downloadedDSID:(id)a7 familyID:(id)a8 dataSourceID:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  BKLibraryManagerAccountIdentifiers *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  BKLibraryManagerAccountIdentifiers *v31;
  id v32;

  v28 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = -[BKLibraryManagerAccountIdentifiers initWithPurchasedDSID:downloadedDSID:familyID:]([BKLibraryManagerAccountIdentifiers alloc], "initWithPurchasedDSID:downloadedDSID:familyID:", v22, v21, v20);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourceWithIdentifier:](self, "dataSourceWithIdentifier:", v19));
  if (v22 || (objc_opt_respondsToSelector(v24, "assetAccountIdentifiersForAssetID:path:storeID:completion:") & 1) == 0)
  {
    v26 = objc_retainBlock(v18);
    v27 = v26;
    if (v26)
      (*((void (**)(id, BKLibraryManagerAccountIdentifiers *, _QWORD))v26 + 2))(v26, v23, 0);

    v25 = v28;
  }
  else
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_3009C;
    v29[3] = &unk_C2338;
    v29[4] = self;
    v25 = v28;
    v30 = v28;
    v31 = v23;
    v32 = v18;
    objc_msgSend(v24, "assetAccountIdentifiersForAssetID:path:storeID:completion:", v30, v16, v17, v29);

  }
}

- (void)hiddenAssetStoreIDsWithCompletion:(id)a3
{
  dispatch_queue_attr_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  id v13;
  NSObject *queue;
  _QWORD block[4];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[4];
  NSObject *v20;
  NSObject *v21;
  _QWORD *v22;
  _QWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  NSMutableSet *v31;
  _BYTE v32[128];

  v13 = a3;
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  queue = dispatch_queue_create("com.apple.BKLibraryManager.hiddenAssetQueue", v5);

  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_88C4;
  v30[4] = sub_88D4;
  v31 = objc_opt_new(NSMutableSet);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_88C4;
  v28[4] = sub_88D4;
  v29 = 0;
  v6 = dispatch_group_create();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v11, "hiddenAssetStoreIDsWithCompletion:") & 1) != 0)
        {
          dispatch_group_enter(v6);
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_305F8;
          v19[3] = &unk_C2388;
          v20 = queue;
          v22 = v28;
          v23 = v30;
          v21 = v6;
          objc_msgSend(v11, "hiddenAssetStoreIDsWithCompletion:", v19);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v8);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_30724;
  block[3] = &unk_C23B0;
  v17 = v30;
  v18 = v28;
  v16 = v13;
  v12 = v13;
  dispatch_group_notify(v6, queue, block);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);

}

- (void)rawBookCoverForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[6];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataSourceIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourceWithIdentifier:](self, "dataSourceWithIdentifier:", v8));

  if (v9)
  {
    v14[0] = CFSTR("path");
    v14[1] = CFSTR("assetID");
    v14[2] = CFSTR("permlink");
    v14[3] = CFSTR("temporaryAssetID");
    v14[4] = CFSTR("title");
    v14[5] = CFSTR("storeID");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 6));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "propertiesForKeys:", v10));

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_30950;
    v12[3] = &unk_C23D8;
    v13 = v7;
    objc_msgSend(v9, "bookCoverForLibraryAssetProperties:size:completion:", v11, v12, 1.79769313e308, 1.79769313e308);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)readingTimeTracker:(id)a3 updateRecentBook:(id)a4 promoteIfNotTracked:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  _QWORD block[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  NSObject *v22;
  _QWORD *v23;
  BOOL v24;
  _QWORD v25[3];
  char v26;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v13 = dispatch_group_create();
  dispatch_group_enter(v13);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_30AD4;
  v20[3] = &unk_C2428;
  v20[4] = self;
  v14 = v11;
  v21 = v14;
  v24 = a5;
  v15 = v13;
  v22 = v15;
  v23 = v25;
  -[BKLibraryManager performBlockOnWorkerQueue:](self, "performBlockOnWorkerQueue:", v20);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_30E10;
  block[3] = &unk_C2450;
  v18 = v12;
  v19 = v25;
  v16 = v12;
  dispatch_group_notify(v15, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v25, 8);
}

- (unint64_t)wq_countOfBooksInContinueReadingIncludingExplicitContent:(BOOL)a3 limit:(unint64_t)a4 onWorkerQueue:(id)a5
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v13;

  v5 = a5;
  v6 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager _continueReadingPredicate](BKLibraryManager, "_continueReadingPredicate"));
  objc_msgSend(v6, "setPredicate:", v7);

  v13 = 0;
  v8 = objc_msgSend(v5, "countForFetchRequest:error:", v6, &v13);

  v9 = v13;
  if (v9)
  {
    v10 = BCBookPromotionLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_81CF4();

  }
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    v8 = 0;

  return (unint64_t)v8;
}

- (void)wq_seedRecentsListWithRecentlyOpenedBooksNoOlderThanDate:(id)a3 limit:(unint64_t)a4 onWorkerQueue:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *i;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  _BYTE v44[128];
  id v45;
  _QWORD v46[8];

  v7 = a3;
  v35 = a5;
  v8 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  objc_msgSend(v8, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v8, "setFetchLimit:", a4);
  v38 = v7;
  v9 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K > %@"), CFSTR("lastOpenDate"), v7));
  v10 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("lastEngagedDate")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForLibraryAssetsRecentlyOpened](BKLibraryManager, "predicateForLibraryAssetsRecentlyOpened"));
  v46[0] = v11;
  v46[1] = v10;
  v36 = (void *)v10;
  v37 = (void *)v9;
  v46[2] = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeAudiobookSupplementalContent](BKLibraryManager, "predicateToExcludeAudiobookSupplementalContent"));
  v46[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingContainerLibraryAssets](BKLibraryManager, "predicateForExcludingContainerLibraryAssets"));
  v46[4] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager excludeHiddenAssetsPredicate](BKLibraryManager, "excludeHiddenAssetsPredicate"));
  v46[5] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeSeriesLibraryAssets](BKLibraryManager, "predicateToExcludeSeriesLibraryAssets"));
  v46[6] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager excludeEphemeralAssetsPredicate](BKLibraryManager, "excludeEphemeralAssetsPredicate"));
  v46[7] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 8));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v17));
  objc_msgSend(v8, "setPredicate:", v18);

  v19 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("lastOpenDate"), 0);
  v45 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
  objc_msgSend(v8, "setSortDescriptors:", v20);

  v43 = 0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "executeFetchRequest:error:", v8, &v43));
  v22 = v43;
  v23 = v22;
  if (!v21 && v22)
  {
    v24 = ((uint64_t (*)(void))BCBookPromotionLog)();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_81DB4();

  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v26 = v21;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v27)
  {
    v28 = v27;
    v29 = 0;
    v30 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v30)
          objc_enumerationMutation(v26);
        v32 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v32, "isSupplementalContent") & 1) == 0)
        {
          objc_msgSend(v32, "setIsTrackedAsRecent:", 1);
          ++v29;
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v28);
  }

  v33 = BCBookPromotionLog(objc_msgSend(v35, "saveLibrary"));
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    sub_81D54();

}

- (void)seedRecentsListWithRecentlyOpenedBooksNoOlderThanDate:(id)a3 limit:(unint64_t)a4
{
  id v6;
  _QWORD v7[5];
  id v8;
  unint64_t v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_31364;
  v7[3] = &unk_C2478;
  v8 = a3;
  v9 = a4;
  v7[4] = self;
  v6 = v8;
  -[BKLibraryManager performBlockOnWorkerQueue:](self, "performBlockOnWorkerQueue:", v7);

}

- (void)purgeRecentsListFromAllBooksOlderThanDate:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_31540;
    v6[3] = &unk_C1590;
    v7 = v4;
    -[BKLibraryManager performBlockOnWorkerQueue:](self, "performBlockOnWorkerQueue:", v6);

  }
}

- (void)purgeRecentBooks:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_317F4;
    v10[3] = &unk_C1F70;
    v11 = v6;
    v12 = v7;
    -[BKLibraryManager performBlockOnWorkerQueue:](self, "performBlockOnWorkerQueue:", v10);

  }
  else
  {
    v8 = objc_retainBlock(v7);
    v9 = v8;
    if (v8)
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);

  }
}

- (void)readingTimeTrackerHasRecentAssets:(id)a3 completion:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_31B18;
  v6[3] = &unk_C1AA8;
  v7 = a4;
  v5 = v7;
  -[BKLibraryManager performBlockOnWorkerQueue:](self, "performBlockOnWorkerQueue:", v6);

}

- (void)isTrackedAsRecent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD *v13;
  _QWORD v14[4];
  void (**v15)(id, _QWORD, void *);
  id v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_31D74;
    v14[3] = &unk_C1F70;
    v15 = (void (**)(id, _QWORD, void *))v6;
    v16 = v7;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_31F28;
    v12[3] = &unk_C1F70;
    v12[4] = self;
    v13 = objc_retainBlock(v14);
    v8 = v13;
    -[BKLibraryManager performBlockOnCollectionsWorkerQueue:](self, "performBlockOnCollectionsWorkerQueue:", v12);

    v9 = v15;
  }
  else
  {
    v9 = (void (**)(id, _QWORD, void *))objc_retainBlock(v7);
    if (v9)
    {
      v17 = NSLocalizedDescriptionKey;
      v18 = CFSTR("No asset identifier.");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKLibraryErrorDomain"), 1, v10));
      v9[2](v9, 0, v11);

    }
  }

}

- (void)readingTimeTracker:(id)a3 isAssetTrackedAsRecent:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  NSErrorUserInfoKey v18;
  const __CFString *v19;

  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v7, "length"))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_320EC;
    v15[3] = &unk_C1F70;
    v16 = v7;
    v17 = v8;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_322FC;
    v13[3] = &unk_C1F70;
    v13[4] = self;
    v14 = objc_retainBlock(v15);
    v9 = v14;
    -[BKLibraryManager performBlockOnCollectionsWorkerQueue:](self, "performBlockOnCollectionsWorkerQueue:", v13);

    v10 = v16;
  }
  else
  {
    v10 = objc_retainBlock(v8);
    if (v10)
    {
      v18 = NSLocalizedDescriptionKey;
      v19 = CFSTR("No asset identifier.");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKLibraryErrorDomain"), 1, v11));
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, 0, 0, v12);

    }
  }

}

- (void)recentsNotEngagedSinceDateForSamples:(id)a3 dateForNonSamples:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  BKLibraryManager *v11;
  id v12;
  id v13;
  id v14;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_323CC;
  v10[3] = &unk_C24A0;
  v11 = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v7 = v14;
  v8 = v13;
  v9 = v12;
  -[BKLibraryManager performBackgroundReadOnlyBlock:](v11, "performBackgroundReadOnlyBlock:", v10);

}

- (void)readingTimeTracker:(id)a3 cleanupFinishedBooksExcluding:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  BKLibraryManager *v9;
  id v10;
  id v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3285C;
  v8[3] = &unk_C1A08;
  v9 = self;
  v10 = a4;
  v11 = a5;
  v6 = v11;
  v7 = v10;
  -[BKLibraryManager performBlockOnWorkerQueue:](v9, "performBlockOnWorkerQueue:", v8);

}

- (void)readingTimeTracker:(id)a3 cleanupBooksFinishedBefore:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  BKLibraryManager *v9;
  id v10;
  id v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_32C78;
  v8[3] = &unk_C1A08;
  v9 = self;
  v10 = a4;
  v11 = a5;
  v6 = v11;
  v7 = v10;
  -[BKLibraryManager performBlockOnWorkerQueue:](v9, "performBlockOnWorkerQueue:", v8);

}

- (BOOL)isDownloadableFromLibraryAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "permanentOrTemporaryAssetID"));
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "permanentOrTemporaryAssetID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "statusForAssetID:", v6));

  }
  else
  {
    v7 = 0;
  }

  v8 = objc_msgSend(v3, "canRedownload")
    && (objc_msgSend(v3, "isPreorderBook") & 1) == 0
    && (objc_msgSend(v3, "isLocal") & 1) == 0
    && objc_msgSend(v7, "state") != &dword_4;

  return v8;
}

- (BKSeriesManager)seriesManager
{
  return (BKSeriesManager *)+[BKSeriesManager sharedManager](BKSeriesManager, "sharedManager");
}

- (id)_updateLibraryAssetWithID:(id)a3 withLastOpenDate:(id)a4 withMoc:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  void *v33;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager libraryMutableAssetWithAssetID:inManagedObjectContext:](self, "libraryMutableAssetWithAssetID:inManagedObjectContext:", a3, a5));
  objc_msgSend(v9, "setLastOpenDate:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "seriesContainer"));
  objc_msgSend(v10, "setLastOpenDate:", v8);

  objc_msgSend(v9, "setModificationDate:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "seriesContainer"));
  objc_msgSend(v11, "setModificationDate:", v8);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeID"));
  if (objc_msgSend(v12, "longLongValue"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "purchasedAndLocalParent"));

    if (!v13)
    {
      v14 = objc_msgSend(v9, "isAudiobook");
      v15 = (id *)&BKSeriesManagerAssetTypeAudiobooks;
      if (!v14)
        v15 = (id *)&BKSeriesManagerAssetTypeBooks;
      v32 = *v15;
      v16 = v32;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeID"));
      v31 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
      v33 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager seriesManager](self, "seriesManager"));
      objc_msgSend(v20, "updateExpiredSeriesForAssetAdamIDsWithTypes:", v19);

    }
  }
  else
  {

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeID"));
  if (v21)
  {

  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "permlink"));
    v23 = objc_msgSend(v22, "length");

    if (!v23)
      return v9;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "permlink"));
  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "permlink"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v25));

  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", &stru_C40E8));
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[BLLibrary defaultBookLibrary](BLLibrary, "defaultBookLibrary"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeID"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v27, "_bookWasOpenedWithStoreID:permlink:date:", v28, v26, v29);

  return v9;
}

- (void)updateLibraryAssetWithID:(id)a3 withTitle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager libraryMutableAssetWithAssetID:inManagedObjectContext:](self, "libraryMutableAssetWithAssetID:inManagedObjectContext:", v14, v7));

  if (v8)
  {
    objc_msgSend(v8, "setTitle:", v6);
    objc_msgSend(v8, "setSortTitle:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
    objc_msgSend(v9, "setSaveContext:", 2);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager uiChildContext](self, "uiChildContext"));
    objc_msgSend(v10, "save:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataSourceIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSourceWithIdentifier:](self, "dataSourceWithIdentifier:", v11));

    if ((objc_opt_respondsToSelector(v12, "updateAsset:userEditedTitle:completion:") & 1) != 0)
      objc_msgSend(v12, "updateAsset:userEditedTitle:completion:", v8, v6, 0);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BCProgressKitController sharedController](BCProgressKitController, "sharedController"));
  objc_msgSend(v13, "updateBook:withTitle:completion:", v14, v6, 0);

}

- (void)updateLibraryAssetWithID:(id)a3 withLastOpenDate:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  BKLibraryManager *v11;
  id v12;
  id v13;
  id v14;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_3350C;
  v10[3] = &unk_C24A0;
  v11 = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v7 = v14;
  v8 = v13;
  v9 = v12;
  -[BKLibraryManager performBlockOnWorkerQueue:](v11, "performBlockOnWorkerQueue:", v10);

}

- (void)updateLibraryAssetWithID:(id)a3 isEphemeral:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  BKLibraryManager *v10;
  id v11;
  id v12;
  BOOL v13;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_33640;
  v9[3] = &unk_C24C8;
  v10 = self;
  v11 = a3;
  v13 = a4;
  v12 = a5;
  v7 = v12;
  v8 = v11;
  -[BKLibraryManager performBlockOnWorkerQueue:](v10, "performBlockOnWorkerQueue:", v9);

}

- (void)applyPendingUpdateForAssetID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  BKLibraryManager *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3394C;
  v7[3] = &unk_C1A08;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[BKLibraryManager performBackgroundReadOnlyBlock:](v8, "performBackgroundReadOnlyBlock:", v7);

}

- (BOOL)_shouldPropagateNilAssetIDForDataSourceWithIdentifier:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_dataSourcesByIdentifier, "objectForKeyedSubscript:", a3));
  if ((objc_opt_respondsToSelector(v3, "propagateNilAssetID") & 1) != 0)
    v4 = objc_msgSend(v3, "propagateNilAssetID");
  else
    v4 = 0;

  return v4;
}

- (void)didCloseLibraryAsset:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_33C80;
  v3[3] = &unk_C1590;
  v3[4] = self;
  -[BKLibraryManager performBackgroundReadOnlyBlock:](self, "performBackgroundReadOnlyBlock:", v3);
}

- (id)seriesBooksForSeriesID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForLibraryAssetsWithSeriesID:](self, "predicateForLibraryAssetsWithSeriesID:", a3));
  v15[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingContainerLibraryAssets](BKLibraryManager, "predicateForExcludingContainerLibraryAssets"));
  v15[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  objc_msgSend(v11, "setPredicate:", v10);
  v14 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v11, &v14));

  return v12;
}

- (id)seriesContainerForSeriesID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForContainerWithSeriesIDLibraryAsset:](self, "predicateForContainerWithSeriesIDLibraryAsset:", v7));

  objc_msgSend(v8, "setPredicate:", v9);
  objc_msgSend(v8, "setFetchLimit:", 1);
  v13 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v8, &v13));

  if (v10 && objc_msgSend(v10, "count"))
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  else
    v11 = 0;

  return v11;
}

- (void)updateSeriesContainerSeriesStackAssetIDs:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isContainer"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager seriesStackBooksForBook:](BKLibraryManager, "seriesStackBooksForBook:", v6));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", CFSTR("assetID")));
    if (objc_msgSend(v3, "count"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR(",")));
      objc_msgSend(v6, "setDifferentObject:forKey:", v5, CFSTR("seriesStackIDs"));

    }
  }

}

- (void)updateSupplementalContentRelationship:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  id v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];

  v3 = a3;
  if (objc_msgSend(v3, "isAudiobook"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetID"));
    v5 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForSupplementalContentLibraryAssetsWithStorePlaylistID:](BKLibraryManager, "predicateForSupplementalContentLibraryAssetsWithStorePlaylistID:", v4));
    objc_msgSend(v5, "setPredicate:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
    v38 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v5, &v38));
    v9 = v38;

    if (v9)
    {
      v11 = BKLibraryLog(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_81F80();
    }
    else
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v12 = v8;
      v24 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(_QWORD *)v35 != v26)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), "setDifferentObject:forKey:", v3, CFSTR("supplementalContentParent"));
          }
          v25 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
        }
        while (v25);
      }
    }
    goto LABEL_33;
  }
  v4 = v3;
  if (objc_msgSend(v4, "isSupplementalContent"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storePlaylistID"));

    if (v13)
    {
      v5 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storePlaylistID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAssetIDTaggedLibraryAsset:](BKLibraryManager, "predicateForAssetIDTaggedLibraryAsset:", v14));
      objc_msgSend(v5, "setPredicate:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
      v33 = 0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "executeFetchRequest:error:", v5, &v33));
      v9 = v33;

      if (v9)
      {
        v18 = BKLibraryLog(v17);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_8216C();

        objc_msgSend(v4, "setDifferentObject:forKey:", 0, CFSTR("supplementalContentParent"));
        goto LABEL_34;
      }
      if (objc_msgSend(v8, "count"))
      {
        v28 = objc_msgSend(v8, "count");
        if ((unint64_t)v28 < 2)
        {
LABEL_32:
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
          objc_msgSend(v4, "setDifferentObject:forKey:", v12, CFSTR("supplementalContentParent"));
LABEL_33:

LABEL_34:
          goto LABEL_35;
        }
        v29 = BKLibraryLog(v28);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          sub_820AC(v8, v4, v30);
      }
      else
      {
        v31 = BKLibraryLog(0);
        v30 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storePlaylistID"));
          *(_DWORD *)buf = 138412290;
          v40 = v32;
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "Fetched 0 audiobook libraryAsset with storePlaylistID %@ for supplemental content", buf, 0xCu);

        }
      }

      goto LABEL_32;
    }
  }
  if (objc_msgSend(v4, "isSupplementalContent"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storePlaylistID"));

    if (!v20)
    {
      v22 = BKLibraryLog(v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_82004(v4, v23);

    }
  }
  objc_msgSend(v4, "setDifferentObject:forKey:", 0, CFSTR("supplementalContentParent"));
LABEL_35:

}

- (void)updateIsDownloadingSupplementalContentAndCombinedState:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "supplementalContentAssets"));
  if (objc_msgSend(v4, "count"))
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "supplementalContentParent"));
  v6 = v5;

  if (v6)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "supplementalContentAssets", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11), "isDownloading") & 1) != 0)
          {

            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
            objc_msgSend(v6, "setDifferentValue:forKey:klass:", v14, CFSTR("isDownloadingSupplementalContent"), objc_opt_class(NSNumber));

            v13 = &dword_0 + 2;
            goto LABEL_15;
          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
          continue;
        break;
      }
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    objc_msgSend(v6, "setDifferentValue:forKey:klass:", v12, CFSTR("isDownloadingSupplementalContent"), objc_opt_class(NSNumber));

    v13 = objc_msgSend(v6, "state");
LABEL_15:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v13));
    objc_msgSend(v6, "setDifferentValue:forKey:klass:", v15, CFSTR("combinedState"), objc_opt_class(NSNumber));

  }
  if (v6 != v3)
  {
    if ((objc_msgSend(v3, "isDownloadingSupplementalContent") & 1) != 0)
      v16 = &dword_0 + 2;
    else
      v16 = objc_msgSend(v3, "state");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v16));
    objc_msgSend(v3, "setDifferentValue:forKey:klass:", v17, CFSTR("combinedState"), objc_opt_class(NSNumber));

  }
}

- (void)updateSeriesRelationshipsForSeriesAsset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "seriesID"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "seriesContainer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "seriesID"));
    v7 = objc_msgSend(v4, "isEqualToString:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "managedObjectContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager seriesContainerForSeriesID:inManagedObjectContext:](self, "seriesContainerForSeriesID:inManagedObjectContext:", v4, v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForPurchasedBooksAssets](self, "predicateForPurchasedBooksAssets"));
    v11 = objc_msgSend(v10, "evaluateWithObject:", v23);

    v12 = objc_msgSend((id)objc_opt_class(self), "predicateForLocalOrDownloadingLibraryAssets");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = objc_msgSend(v13, "evaluateWithObject:", v23);

    if (v7)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "seriesContainer"));

      if (!v15)
        objc_msgSend(v23, "setSeriesContainer:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "purchasedAndLocalParent"));
      v17 = v16 != 0;

      if (v11 != v17)
      {
        if (v11)
          v18 = v9;
        else
          v18 = 0;
        objc_msgSend(v23, "setPurchasedAndLocalParent:", v18);
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localOnlySeriesItemsParent"));
      v20 = v19 != 0;

      if (v14 == v20)
        goto LABEL_21;
    }
    else
    {
      objc_msgSend(v23, "setSeriesContainer:", v9);
      if (v11)
        v21 = v9;
      else
        v21 = 0;
      objc_msgSend(v23, "setPurchasedAndLocalParent:", v21);
    }
    if (v14)
      v22 = v9;
    else
      v22 = 0;
    objc_msgSend(v23, "setLocalOnlySeriesItemsParent:", v22);
LABEL_21:

    goto LABEL_22;
  }
  objc_msgSend(v23, "setDifferentObject:forKey:", 0, CFSTR("seriesContainer"));
  objc_msgSend(v23, "setDifferentObject:forKey:", 0, CFSTR("purchasedAndLocalParent"));
  objc_msgSend(v23, "setDifferentObject:forKey:", 0, CFSTR("localOnlySeriesItemsParent"));
LABEL_22:

}

- (void)updateSeriesRelationshipsForSeriesContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "seriesID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager seriesBooksForSeriesID:inManagedObjectContext:](self, "seriesBooksForSeriesID:inManagedObjectContext:", v14, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForPurchasedBooksAssets](self, "predicateForPurchasedBooksAssets"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager predicateForLocalLibraryAssets](self, "predicateForLocalLibraryAssets"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
  objc_msgSend(v4, "setValue:forKey:", v11, CFSTR("seriesBooks"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
  objc_msgSend(v4, "setValue:forKey:", v12, CFSTR("purchasedAndLocalSeriesItems"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));
  objc_msgSend(v4, "setValue:forKey:", v13, CFSTR("localOnlySeriesItems"));

  -[BKLibraryManager _updateAuthorForSeriesContainer:](self, "_updateAuthorForSeriesContainer:", v4);
}

- (void)checkDatabaseIntegrity
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionManager](self, "collectionManager"));
  objc_msgSend(v3, "fixCollectionMemberAssetLinks");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionManager](self, "collectionManager"));
  objc_msgSend(v4, "fixPDFCollectionIfNeeded");

}

- (void)_migrateFromOldDatabase
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_34AB4;
  v2[3] = &unk_C1590;
  v2[4] = self;
  -[BKLibraryManager performBlockOnCollectionsWorkerQueueAndWait:](self, "performBlockOnCollectionsWorkerQueueAndWait:", v2);
}

- (id)migrationOldDatabaseFolderPath
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("BKLibrary_database")));
  return v5;
}

- (id)migrationMoc
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v19;

  v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("iBooks_%@.sqlite"), CFSTR("v10252011_2152"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager migrationOldDatabaseFolderPath](self, "migrationOldDatabaseFolderPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathForResource:ofType:", CFSTR("LibraryInfo"), CFSTR("momd")));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v9));
      v11 = objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", v10);
      v12 = objc_msgSend(objc_alloc((Class)NSPersistentStoreCoordinator), "initWithManagedObjectModel:", v11);
      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 0));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", NSInferMappingModelAutomaticallyOption, &__kCFBooleanTrue, NSMigratePersistentStoresAutomaticallyOption, NSFileProtectionNone, NSPersistentStoreFileProtectionKey, 0));
        v19 = 0;
        v15 = objc_msgSend(v12, "addPersistentStoreWithType:configuration:URL:options:error:", NSSQLiteStoreType, 0, v13, v14, &v19);
        v16 = v19;
        v17 = objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
        objc_msgSend(v17, "setPersistentStoreCoordinator:", v12);
        objc_msgSend(v17, "setUndoManager:", 0);
        objc_msgSend(v17, "setMergePolicy:", NSMergeByPropertyObjectTrumpMergePolicy);

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)migrationCachePath
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("BKLibraryMigrationCache.plist")));
  return v5;
}

- (void)migrateDataSources:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "migrateWithMoc:") & 1) != 0)
          objc_msgSend(v10, "migrateWithMoc:", v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)migrateSortOrderKeys:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  BKLibraryManager *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_3518C;
  v5[3] = &unk_C12F8;
  v6 = a3;
  v7 = self;
  v4 = v6;
  objc_msgSend(v4, "performBlockAndWait:", v5);

}

- (void)bootstrapSamplesCollectionIfNeeded
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager metadataObjectForKey:](self, "metadataObjectForKey:", CFSTR("BKLibraryHasBootstrappedSamplesCollection")));
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("BKLibraryForceBootstrapSamplesCollection"));

  if (!v4 || v6)
  {
    v8 = BKLibraryLog(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Bootstrap Samples collection: Going to bootstrap Samples collection.", buf, 2u);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_355E4;
    v10[3] = &unk_C1590;
    v10[4] = self;
    -[BKLibraryManager performBlockOnCollectionsWorkerQueueAndWait:](self, "performBlockOnCollectionsWorkerQueueAndWait:", v10);
  }
}

- (void)saveCachedMigrationData
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager migrationDispatchQueue](self, "migrationDispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_35908;
  block[3] = &unk_C1400;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)q_removeOldMigrationData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager migratedSortOrderData](self, "migratedSortOrderData"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_35B10;
  v9[3] = &unk_C2510;
  v10 = v3;
  v8 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keysOfEntriesPassingTest:", v9));

  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager migratedSortOrderData](self, "migratedSortOrderData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
    objc_msgSend(v6, "removeObjectsForKeys:", v7);

    -[BKLibraryManager setMigratedPropertiesChanged:](self, "setMigratedPropertiesChanged:", 1);
  }

}

- (void)loadCachedMigrationData
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager migrationDispatchQueue](self, "migrationDispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_35BDC;
  block[3] = &unk_C1400;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (id)fetchMigratedProperties:(id)a3 deleteFoundAssets:(BOOL)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_88C4;
  v19 = sub_88D4;
  v20 = 0;
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager migrationDispatchQueue](self, "migrationDispatchQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_35DF0;
    v11[3] = &unk_C2538;
    v13 = &v15;
    v11[4] = self;
    v12 = v6;
    v14 = a4;
    dispatch_sync(v7, v11);

    v8 = (void *)v16[5];
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)adoptMigratedProperties:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
  v6 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager fetchMigratedProperties:deleteFoundAssets:](self, "fetchMigratedProperties:deleteFoundAssets:", v5, 1));
  if (v6)
  {
    v7 = (void *)v6;
  }
  else
  {
    if (!objc_msgSend(v5, "hasPrefix:", CFSTR("sha1-")))
      goto LABEL_19;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("sha1-"), CFSTR("sha1:")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager fetchMigratedProperties:deleteFoundAssets:](self, "fetchMigratedProperties:deleteFoundAssets:", v11, 1));
    v5 = (void *)v11;
    if (!v7)
      goto LABEL_19;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("validUntilKey")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("sortKey")));
  objc_msgSend(v4, "setSortKey:", v9);

  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("dateLastOpened")));
    objc_msgSend(v4, "nonUserUpdateLastOpenDateTo:", v10);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("isNew")));
    objc_msgSend(v4, "setIsNew:", objc_msgSend(v12, "BOOLValue"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("dateLastOpened")));
    objc_msgSend(v4, "nonUserUpdateLastOpenDateTo:", v13);

    if (objc_msgSend(v4, "titleEditsSavedInLibraryOnly"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("bookTitle")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
      v16 = objc_msgSend(v15, "isEqualToString:", v14);

      if ((v16 & 1) == 0)
        objc_msgSend(v4, "setTitle:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("sortTitle")));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortTitle"));
      v19 = objc_msgSend(v18, "isEqualToString:", v17);

      if ((v19 & 1) == 0)
        objc_msgSend(v4, "setSortTitle:", v17);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("dateAdded")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "earlierDate:", v20));

    if (v21)
      objc_msgSend(v4, "setCreationDate:", v10);
  }

  v23 = BKLibraryLog(v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortKey"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isNew")));
    v28 = 138412802;
    v29 = v25;
    v30 = 2112;
    v31 = v26;
    v32 = 2112;
    v33 = v27;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Migrating Library Asset ID: %@ newSortOrder: %@ newIsNew: %@", (uint8_t *)&v28, 0x20u);

  }
LABEL_19:

}

- (void)archiveTransientProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD v15[3];
  _QWORD v16[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastOpenDate"));

  if (v5 && v6)
  {
    v15[0] = CFSTR("sortKey");
    v15[1] = CFSTR("dateLastOpened");
    v16[0] = v6;
    v16[1] = v7;
    v15[2] = CFSTR("validUntilKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 2592000.0));
    v16[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));

    v10 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager migrationDispatchQueue](self, "migrationDispatchQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_36488;
    v12[3] = &unk_C1918;
    v12[4] = self;
    v13 = v9;
    v14 = v5;
    v11 = v9;
    dispatch_sync(v10, v12);

  }
}

- (void)migrateCollections:(id)a3 context:(id)a4
{
  NSMutableArray *v5;
  void *v6;
  NSMutableArray *v7;
  id v8;
  _QWORD v9[5];
  NSMutableArray *v10;
  _QWORD v11[4];
  id v12;
  BKLibraryManager *v13;
  NSMutableArray *v14;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_36600;
  v11[3] = &unk_C1918;
  v12 = a3;
  v13 = self;
  v5 = objc_opt_new(NSMutableArray);
  v14 = v5;
  v8 = v12;
  objc_msgSend(v8, "performBlockAndWait:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager collectionsWorkerChildContext](self, "collectionsWorkerChildContext"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_36B84;
  v9[3] = &unk_C12F8;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v9);

}

- (void)migrateMetaData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "persistentStoreCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "persistentStores"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "metadataForPersistentStore:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("BKDatabase-Metadata")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Collections-Generation-ClientSide")));
  -[BKLibraryManager setMetadataObject:forKey:](self, "setMetadataObject:forKey:", v8, CFSTR("Collections-Generation-ClientSide"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Collections-ServerSide-Dirty")));
  -[BKLibraryManager setMetadataObject:forKey:](self, "setMetadataObject:forKey:", v9, CFSTR("Collections-ServerSide-Dirty"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Collections-ServerSide-Generation")));
  -[BKLibraryManager setMetadataObject:forKey:](self, "setMetadataObject:forKey:", v10, CFSTR("Collections-ServerSide-Generation"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("JaliscoStatus-ServerSide-Generation")));
  -[BKLibraryManager setMetadataObject:forKey:](self, "setMetadataObject:forKey:", v11, CFSTR("JaliscoStatus-ServerSide-Generation"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("BKCollection-NextSortKey")));
  -[BKLibraryManager setMetadataObject:forKey:](self, "setMetadataObject:forKey:", v12, CFSTR("BKCollection-NextSortKey"));

  -[BKLibraryManager saveMetaData](self, "saveMetaData");
}

- (void)migratePurgeOldDatabases
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSArray *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("BKLibraryKeepMigrationData"));

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager migrationOldDatabaseFolderPath](self, "migrationOldDatabaseFolderPath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v17 = 0;
    v7 = objc_msgSend(v6, "removeItemAtPath:error:", v5, &v17);
    v8 = v17;

    if ((v7 & 1) == 0)
    {
      v10 = BKLibraryLog(v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_82328();

    }
    v12 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("iBooks_revision-two.sqlite-BKSortOrderMigrator_10152011.plist")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v16, "removeItemAtPath:error:", v15, 0);

  }
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  id v5;
  NSMutableSet *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSMutableSet *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[5];
  NSMutableSet *v19;
  _QWORD block[4];
  NSMutableSet *v21;
  BKLibraryManager *v22;

  v5 = a4;
  v6 = objc_opt_new(NSMutableSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addedObjects"));
  -[NSMutableSet addObjectsFromArray:](v6, "addObjectsFromArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updatedObjects"));
  -[NSMutableSet addObjectsFromArray:](v6, "addObjectsFromArray:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deletedObjects"));
  -[NSMutableSet addObjectsFromArray:](v6, "addObjectsFromArray:", v9);

  v11 = BKLibraryLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_823E8(v5);

  v13 = objc_claimAutoreleasedReturnValue(-[BKLibraryManager ownershipSync](self, "ownershipSync"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_374B4;
  block[3] = &unk_C12F8;
  v14 = v6;
  v21 = v14;
  v22 = self;
  dispatch_sync(v13, block);

  v16 = BKLibraryLog(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    sub_82388();

  if (-[NSMutableSet count](v14, "count"))
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_3752C;
    v18[3] = &unk_C12F8;
    v18[4] = self;
    v19 = v14;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);

  }
}

- (void)beginAuthentication:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "beginAuthentication:") & 1) != 0)
          objc_msgSend(v10, "beginAuthentication:", v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)finalizeAuthentication:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "finalizeAuthentication:") & 1) != 0)
          objc_msgSend(v10, "finalizeAuthentication:", v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_updateProcessingAuthenticationStateDeferred
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_37838;
  v3[3] = &unk_C2560;
  objc_copyWeak(&v4, &location);
  -[BKLibraryManager addCustomOperationBlock:](self, "addCustomOperationBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_updateProcessingAuthenticationStateImmediate
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v7, "processingAuthentication") & 1) != 0
          && (objc_msgSend(v7, "processingAuthentication") & 1) != 0)
        {
          v4 = &dword_0 + 1;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  -[BKLibraryManager setProcessingAuthentication:](self, "setProcessingAuthentication:", v4);
}

- (void)refreshFamily
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager dataSources](self, "dataSources", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v7, "refreshFamily") & 1) != 0)
          objc_msgSend(v7, "refreshFamily");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (BOOL)isFamilyPurchaseWithFamilyID:(id)a3 purchaserDSID:(id)a4 downloaderDSID:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  BOOL v18;
  BOOL v20;

  v7 = a5;
  v8 = a4;
  v9 = BUStoreIdStringFromObject(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v10, "integerValue");

  v12 = BUStoreIdStringFromObject(v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = objc_msgSend(v13, "integerValue");
  v15 = BUStoreIdStringFromObject(v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v17 = objc_msgSend(v16, "integerValue");
  if (v17)
    v18 = v14 == 0;
  else
    v18 = 1;
  v20 = !v18 && v14 != v17;
  return v11 || v20;
}

- (id)cloudSyncVersionsForDataType:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BCCloudSyncVersions"));
  objc_msgSend(v7, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v7, "setFetchLimit:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("dataType == %@"), v5));
  objc_msgSend(v7, "setPredicate:", v8);

  v16 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v7, &v16));
  v10 = v16;
  v11 = v10;
  if (v10)
  {
    v12 = BKLibraryLog(v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_82490();

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  if (!v14)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("BCCloudSyncVersions"), v6));
    objc_msgSend(v14, "setDataType:", v5);
  }

  return v14;
}

- (void)updateCloudVersionFromCloudSyncVersions:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataType"));
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryManager cloudSyncVersionsForDataType:inContext:](self, "cloudSyncVersionsForDataType:inContext:", v8, v6));

  objc_msgSend(v11, "setCloudVersion:", objc_msgSend(v7, "cloudVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "historyToken"));
  objc_msgSend(v11, "setHistoryToken:", v9);

  v10 = objc_msgSend(v7, "historyTokenOffset");
  objc_msgSend(v11, "setHistoryTokenOffset:", v10);

}

- (id)dragInfoFromLibraryAsset:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
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
  v4 = objc_alloc_init((Class)BCAssetDragInfo);
  v5 = (int)objc_msgSend(v3, "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetID"));
  objc_msgSend(v4, "setAssetID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storeID"));
  objc_msgSend(v4, "setStoreID:", v7);

  objc_msgSend(v4, "setContentType:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  objc_msgSend(v4, "setTitle:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayAuthor"));
  objc_msgSend(v4, "setAuthor:", v9);

  objc_msgSend(v4, "setFileSize:", objc_msgSend(v3, "fileSize"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modificationDate"));
  objc_msgSend(v4, "setModificationDate:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
  objc_msgSend(v4, "setStoreURL:", v11);

  if (objc_msgSend(v3, "contentType") == 3 && (objc_msgSend(v3, "isManagedBook") & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v13));
      objc_msgSend(v4, "setLocalFileURL:", v14);

    }
  }

  return v4;
}

- ($3F30F48CCF81742A7D163F96C13F4EE1)cacheManager:(SEL)a3 bookCoverInfoForIdentifier:(id)a4
{
  id v8;
  id v9;
  $3F30F48CCF81742A7D163F96C13F4EE1 *result;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  _OWORD v20[2];
  uint64_t v21;

  v8 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x5812000000;
  v17 = sub_38038;
  v18 = sub_3807C;
  v19 = 1024;
  memset(v20, 0, sizeof(v20));
  v21 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_380BC;
  v11[3] = &unk_C2130;
  v11[4] = self;
  v9 = a5;
  v12 = v9;
  v13 = &v14;
  -[BKLibraryManager performNamed:workerQueueBlockAndWait:](self, "performNamed:workerQueueBlockAndWait:", CFSTR("bookCoverInfoForIdentifier"), v11);
  sub_38388((uint64_t)retstr, (uint64_t)(v15 + 6));

  _Block_object_dispose(&v14, 8);
  sub_38084((id *)v20);

  return result;
}

- (void)cacheManager:(id)a3 explicitIdentifiersWithCompletion:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_38460;
  v6[3] = &unk_C1AA8;
  v7 = a4;
  v5 = v7;
  -[BKLibraryManager performBlockOnWorkerQueue:](self, "performBlockOnWorkerQueue:", v6);

}

- (void)resetCover:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager imageSource](self, "imageSource"));
    objc_msgSend(v4, "removeImagesForAssetID:temporaryAssetID:", v6, 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[BKLibraryManager updateLibraryAssetWithID:withLastOpenDate:completion:](self, "updateLibraryAssetWithID:withLastOpenDate:completion:", v6, v5, 0);

  }
}

+ (void)deleteCloudDataWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void (**v9)(id, BOOL, id);
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "persistentStoreURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByDeletingLastPathComponent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = 0;
  objc_msgSend(v7, "removeItemAtURL:error:", v6, &v10);
  v8 = v10;

  v9 = (void (**)(id, BOOL, id))objc_retainBlock(v4);
  if (v9)
    v9[2](v9, v8 == 0, v8);

}

- (void)collectionManagerDidModifyWantToReadCollection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = BKLibraryPriceTrackingLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "WTR collection changed, scheduling price tracking update", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryManager priceTracker](self, "priceTracker"));
  objc_msgSend(v6, "setNeedsConfigurationUpdate");

}

- (BKLibraryManagedObjectContext)readOnlyChildContext
{
  return self->_readOnlyChildContext;
}

- (BKLibraryDelegateProtocol)delegate
{
  return (BKLibraryDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BKLibraryImageSource)imageSource
{
  return self->_imageSource;
}

- (void)setImageSource:(id)a3
{
  objc_storeStrong((id *)&self->_imageSource, a3);
}

- (NSOperationQueue)imageSourceOperationQueue
{
  return self->_imageSourceOperationQueue;
}

- (void)setImageSourceOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_imageSourceOperationQueue, a3);
}

- (NSOperationQueue)imageSourceScalingOperationQueue
{
  return self->_imageSourceScalingOperationQueue;
}

- (void)setImageSourceScalingOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_imageSourceScalingOperationQueue, a3);
}

- (BKLibraryPriceManager)priceManager
{
  return self->_priceManager;
}

- (void)setPriceManager:(id)a3
{
  objc_storeStrong((id *)&self->_priceManager, a3);
}

- (BKLibraryAssetDetailsManager)assetDetailsManager
{
  return self->_assetDetailsManager;
}

- (void)setAssetDetailsManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetDetailsManager, a3);
}

- (BOOL)didMigrateFromITunesSyncToICloudSync
{
  return self->_didMigrateFromITunesSyncToICloudSync;
}

- (void)setDidMigrateFromITunesSyncToICloudSync:(BOOL)a3
{
  self->_didMigrateFromITunesSyncToICloudSync = a3;
}

- (BKLibraryPriceTracker)priceTracker
{
  return self->_priceTracker;
}

- (BOOL)processingAuthentication
{
  return self->_processingAuthentication;
}

- (void)setProcessingAuthentication:(BOOL)a3
{
  self->_processingAuthentication = a3;
}

- (BKLibraryManagedObjectContext)collectionsWorkerChildContext
{
  return self->_collectionsWorkerChildContext;
}

- (void)setCollectionsWorkerChildContext:(id)a3
{
  objc_storeStrong((id *)&self->_collectionsWorkerChildContext, a3);
}

- (BKLibraryManagedObjectContext)workerChildContext
{
  return self->_workerChildContext;
}

- (void)setWorkerChildContext:(id)a3
{
  objc_storeStrong((id *)&self->_workerChildContext, a3);
}

- (IMManagedObjectContextReadOnlyPool)backgroundReadOnlyContextPool
{
  return self->_backgroundReadOnlyContextPool;
}

- (void)setBackgroundReadOnlyContextPool:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundReadOnlyContextPool, a3);
}

- (BOOL)isReloading
{
  return self->_reloading;
}

- (void)setReloading:(BOOL)a3
{
  self->_reloading = a3;
}

- (BOOL)collectionsDirty
{
  return self->_collectionsDirty;
}

- (void)setCollectionsDirty:(BOOL)a3
{
  self->_collectionsDirty = a3;
}

- (BOOL)migratedPropertiesChanged
{
  return self->_migratedPropertiesChanged;
}

- (void)setMigratedPropertiesChanged:(BOOL)a3
{
  self->_migratedPropertiesChanged = a3;
}

- (NSMutableDictionary)migratedSortOrderData
{
  return self->_migratedSortOrderData;
}

- (void)setMigratedSortOrderData:(id)a3
{
  objc_storeStrong((id *)&self->_migratedSortOrderData, a3);
}

- (NSMutableDictionary)migratedSortOrderDataByPluginAssetID
{
  return self->_migratedSortOrderDataByPluginAssetID;
}

- (void)setMigratedSortOrderDataByPluginAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_migratedSortOrderDataByPluginAssetID, a3);
}

- (OS_dispatch_queue)migrationDispatchQueue
{
  return self->_migrationDispatchQueue;
}

- (void)setMigrationDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_migrationDispatchQueue, a3);
}

- (BOOL)needsMigration
{
  return self->_needsMigration;
}

- (void)setNeedsMigration:(BOOL)a3
{
  self->_needsMigration = a3;
}

- (OS_dispatch_queue)updatesScheduleQueue
{
  return self->_updatesScheduleQueue;
}

- (void)setUpdatesScheduleQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updatesScheduleQueue, a3);
}

- (BKLibraryManagedObjectContext)usq_moc
{
  return self->_usq_moc;
}

- (void)setUsq_moc:(id)a3
{
  objc_storeStrong((id *)&self->_usq_moc, a3);
}

- (OS_dispatch_queue)dqSyncQueue
{
  return self->_dqSyncQueue;
}

- (void)setDqSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dqSyncQueue, a3);
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (NSMutableSet)identifiersForAssetsNeedingReconcile
{
  return self->_identifiersForAssetsNeedingReconcile;
}

- (void)setIdentifiersForAssetsNeedingReconcile:(id)a3
{
  objc_storeStrong((id *)&self->_identifiersForAssetsNeedingReconcile, a3);
}

- (NSMutableDictionary)assetUpdatesByIdentifier
{
  return self->_assetUpdatesByIdentifier;
}

- (void)setAssetUpdatesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetUpdatesByIdentifier, a3);
}

- (NSMutableSet)unclaimedAssetIDs
{
  return self->_unclaimedAssetIDs;
}

- (void)setUnclaimedAssetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_unclaimedAssetIDs, a3);
}

- (NSMutableSet)unclaimedTemporaryAssetIDs
{
  return self->_unclaimedTemporaryAssetIDs;
}

- (void)setUnclaimedTemporaryAssetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_unclaimedTemporaryAssetIDs, a3);
}

- (void)setCollectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_collectionManager, a3);
}

- (BUCoalescingCallBlock)coalescedLibraryReload
{
  return self->_coalescedLibraryReload;
}

- (void)setCoalescedLibraryReload:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedLibraryReload, a3);
}

- (NSMutableDictionary)coalescedDataSourceReloadByIdentifier
{
  return self->_coalescedDataSourceReloadByIdentifier;
}

- (void)setCoalescedDataSourceReloadByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedDataSourceReloadByIdentifier, a3);
}

- (OS_dispatch_queue)coalescedDataSourceReloadByIdentifierSync
{
  return self->_coalescedDataSourceReloadByIdentifierSync;
}

- (void)setCoalescedDataSourceReloadByIdentifierSync:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedDataSourceReloadByIdentifierSync, a3);
}

- (NSDictionary)dataSourcesByIdentifier
{
  return self->_dataSourcesByIdentifier;
}

- (void)setDataSourcesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourcesByIdentifier, a3);
}

- (BCManagedObjectIDMonitor)dataSourceIdentifierAndStateMonitor
{
  return self->_dataSourceIdentifierAndStateMonitor;
}

- (void)setDataSourceIdentifierAndStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceIdentifierAndStateMonitor, a3);
}

- (BCManagedObjectIDMonitor)dataSourceIdentifierAndStateMonitorForTemporaryAssetIDs
{
  return self->_dataSourceIdentifierAndStateMonitorForTemporaryAssetIDs;
}

- (void)setDataSourceIdentifierAndStateMonitorForTemporaryAssetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceIdentifierAndStateMonitorForTemporaryAssetIDs, a3);
}

- (NSMutableDictionary)ownershipObservers
{
  return self->_ownershipObservers;
}

- (void)setOwnershipObservers:(id)a3
{
  objc_storeStrong((id *)&self->_ownershipObservers, a3);
}

- (OS_dispatch_queue)ownershipSync
{
  return self->_ownershipSync;
}

- (void)setOwnershipSync:(id)a3
{
  objc_storeStrong((id *)&self->_ownershipSync, a3);
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (BOOL)resetSeriesOnAllBooks
{
  return self->_resetSeriesOnAllBooks;
}

- (void)setResetSeriesOnAllBooks:(BOOL)a3
{
  self->_resetSeriesOnAllBooks = a3;
}

- (BOOL)needsResetNilAuthorsOnAllSeries
{
  return self->_needsResetNilAuthorsOnAllSeries;
}

- (void)setNeedsResetNilAuthorsOnAllSeries:(BOOL)a3
{
  self->_needsResetNilAuthorsOnAllSeries = a3;
}

- (BOOL)needsResetNilAuthorsOnAllBooks
{
  return self->_needsResetNilAuthorsOnAllBooks;
}

- (void)setNeedsResetNilAuthorsOnAllBooks:(BOOL)a3
{
  self->_needsResetNilAuthorsOnAllBooks = a3;
}

- (BOOL)needsResetSeriesStacksAndCollectionMembershipOnAllBooks
{
  return self->_needsResetSeriesStacksAndCollectionMembershipOnAllBooks;
}

- (void)setNeedsResetSeriesStacksAndCollectionMembershipOnAllBooks:(BOOL)a3
{
  self->_needsResetSeriesStacksAndCollectionMembershipOnAllBooks = a3;
}

- (BOOL)needsDuplicateCollectionMembersRemoved
{
  return self->_needsDuplicateCollectionMembersRemoved;
}

- (void)setNeedsDuplicateCollectionMembersRemoved:(BOOL)a3
{
  self->_needsDuplicateCollectionMembersRemoved = a3;
}

- (BOOL)usePerformancePredicates
{
  return self->_usePerformancePredicates;
}

- (void)setUsePerformancePredicates:(BOOL)a3
{
  self->_usePerformancePredicates = a3;
}

- (BOOL)hasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks
{
  return self->_hasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks;
}

- (void)setHasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks:(BOOL)a3
{
  self->_hasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks = a3;
}

- (os_unfair_lock_s)notifyLockForNewAssets
{
  return self->_notifyLockForNewAssets;
}

- (void)setNotifyLockForNewAssets:(os_unfair_lock_s)a3
{
  self->_notifyLockForNewAssets = a3;
}

- (NSMutableDictionary)notifyBlocksForNewAssets
{
  return self->_notifyBlocksForNewAssets;
}

- (void)setNotifyBlocksForNewAssets:(id)a3
{
  objc_storeStrong((id *)&self->_notifyBlocksForNewAssets, a3);
}

- (NSArray)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
  objc_storeStrong((id *)&self->_dataSources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_notifyBlocksForNewAssets, 0);
  objc_storeStrong((id *)&self->_ownershipSync, 0);
  objc_storeStrong((id *)&self->_ownershipObservers, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifierAndStateMonitorForTemporaryAssetIDs, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifierAndStateMonitor, 0);
  objc_storeStrong((id *)&self->_dataSourcesByIdentifier, 0);
  objc_storeStrong((id *)&self->_coalescedDataSourceReloadByIdentifierSync, 0);
  objc_storeStrong((id *)&self->_coalescedDataSourceReloadByIdentifier, 0);
  objc_storeStrong((id *)&self->_coalescedLibraryReload, 0);
  objc_storeStrong((id *)&self->_collectionManager, 0);
  objc_storeStrong((id *)&self->_unclaimedTemporaryAssetIDs, 0);
  objc_storeStrong((id *)&self->_unclaimedAssetIDs, 0);
  objc_storeStrong((id *)&self->_assetUpdatesByIdentifier, 0);
  objc_storeStrong((id *)&self->_identifiersForAssetsNeedingReconcile, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_dqSyncQueue, 0);
  objc_storeStrong((id *)&self->_usq_moc, 0);
  objc_storeStrong((id *)&self->_updatesScheduleQueue, 0);
  objc_storeStrong((id *)&self->_migrationDispatchQueue, 0);
  objc_storeStrong((id *)&self->_migratedSortOrderDataByPluginAssetID, 0);
  objc_storeStrong((id *)&self->_migratedSortOrderData, 0);
  objc_storeStrong((id *)&self->_backgroundReadOnlyContextPool, 0);
  objc_storeStrong((id *)&self->_workerChildContext, 0);
  objc_storeStrong((id *)&self->_collectionsWorkerChildContext, 0);
  objc_storeStrong((id *)&self->_priceTracker, 0);
  objc_storeStrong((id *)&self->_assetDetailsManager, 0);
  objc_storeStrong((id *)&self->_priceManager, 0);
  objc_storeStrong((id *)&self->_imageSourceScalingOperationQueue, 0);
  objc_storeStrong((id *)&self->_imageSourceOperationQueue, 0);
  objc_storeStrong((id *)&self->_imageSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_readOnlyChildContext, 0);
  objc_storeStrong((id *)&self->_uiChildContext, 0);
  objc_storeStrong((id *)&self->_ui_persistentStore, 0);
  objc_storeStrong((id *)&self->_ui_persistentStoreCoordinator, 0);
}

- (void)setCollectionsCloudGeneration:(id)a3
{
  -[BKLibraryManager setMetadataObject:forKey:](self, "setMetadataObject:forKey:", a3, CFSTR("Collections-ServerSide-Generation"));
}

- (id)collectionsCloudGeneration
{
  return -[BKLibraryManager metadataObjectForKey:](self, "metadataObjectForKey:", CFSTR("Collections-ServerSide-Generation"));
}

- (void)setJaliscoStatusCloudGeneration:(id)a3
{
  -[BKLibraryManager setMetadataObject:forKey:](self, "setMetadataObject:forKey:", a3, CFSTR("JaliscoStatus-ServerSide-Generation"));
}

- (id)jaliscoStatusCloudGeneration
{
  return -[BKLibraryManager metadataObjectForKey:](self, "metadataObjectForKey:", CFSTR("JaliscoStatus-ServerSide-Generation"));
}

- (void)resetNextCollectionSort
{
  -[BKLibraryManager setMetadataObject:forKey:](self, "setMetadataObject:forKey:", 0, CFSTR("BKCollection-NextSortKey"));
}

- (id)copyNextCollectionSortKey:(id)a3
{
  return -[BKLibraryManager copyNextSortValue:forKey:forEntityName:](self, "copyNextSortValue:forKey:forEntityName:", a3, CFSTR("BKCollection-NextSortKey"), CFSTR("BKCollection"));
}

+ (void)fetchImageShadowForAsset:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v12, objc_msgSend(a1, "processingOptionsFor:coverEffectsEnvironment:", v9, 0) | 0x10, width, height));

    objc_msgSend(v13, "setPriority:", 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_5A470;
    v16[3] = &unk_C3108;
    v17 = v11;
    objc_msgSend(v14, "fetchCGImageFor:forRequest:completion:", v13, v13, v16);

  }
  else
  {
    v15 = objc_retainBlock(v10);
    v13 = v15;
    if (v15)
      (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
  }

}

+ (void)fetchImageShadowForAssetID:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  CGFloat v17;
  CGFloat v18;
  id v19;

  height = a4.height;
  width = a4.width;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultManager"));
  v19 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_5A674;
  v14[3] = &unk_C3158;
  v17 = width;
  v18 = height;
  v15 = v9;
  v16 = a1;
  v13 = v9;
  objc_msgSend(v11, "fetchLibraryAssetsFromAssetIDs:handler:", v12, v14);

}

+ (void)fetchImageForAsset:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 includeShadow:(BOOL)a6 coverEffectsEnvironment:(id)a7 completion:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  double height;
  double width;
  id v15;
  _QWORD v16[4];
  id v17;

  v9 = a6;
  v10 = a5;
  height = a4.height;
  width = a4.width;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_5A864;
  v16[3] = &unk_C3130;
  v17 = a8;
  v15 = v17;
  objc_msgSend(a1, "_fetchImageForAsset:size:includeSpine:includeShadow:allowGeneric:coverEffectsEnvironment:completion:", a3, v10, v9, 0, a7, v16, width, height);

}

+ (void)_fetchImageForAsset:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 includeShadow:(BOOL)a6 allowGeneric:(BOOL)a7 coverEffectsEnvironment:(id)a8 completion:(id)a9
{
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  double height;
  double width;
  id v17;
  id v18;
  id v19;
  void *v20;
  unsigned int v21;
  id v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[4];
  id v31;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  height = a4.height;
  width = a4.width;
  v17 = a3;
  v18 = a8;
  v19 = a9;
  v20 = v19;
  if (v17)
  {
    if (v13)
      v21 = objc_msgSend(a1, "processingOptionsFor:coverEffectsEnvironment:", v17, v18);
    else
      v21 = 0;
    if (v21)
      v24 = v12;
    else
      v24 = 1;
    if (v24)
      v25 = v21;
    else
      v25 = v21 | 0x100;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "assetID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v26, v25, width, height));

    if (v11)
      v28 = 16;
    else
      v28 = 2;
    objc_msgSend(v27, "setRequestOptions:", v28);
    objc_msgSend(v27, "setPriority:", 5);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_5AAE4;
    v30[3] = &unk_C3108;
    v31 = v20;
    objc_msgSend(v29, "fetchCGImageFor:forRequest:completion:", v27, v27, v30);

  }
  else
  {
    v22 = objc_retainBlock(v19);
    v23 = v22;
    if (v22)
      (*((void (**)(id, _QWORD))v22 + 2))(v22, 0);

  }
}

+ (void)fetchImageForAssetID:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 includeShadow:(BOOL)a6 coverEffectsEnvironment:(id)a7 completion:(id)a8
{
  CGFloat height;
  CGFloat width;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  CGFloat v26;
  CGFloat v27;
  BOOL v28;
  BOOL v29;
  id v30;

  height = a4.height;
  width = a4.width;
  v15 = a8;
  v16 = a3;
  v17 = +[BKCapturedCoverEffectsEnvironment newCapturedEnvironment:](BKCapturedCoverEffectsEnvironment, "newCapturedEnvironment:", a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultManager"));
  v30 = v16;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_5ACB0;
  v22[3] = &unk_C3180;
  v24 = v15;
  v25 = a1;
  v26 = width;
  v27 = height;
  v28 = a5;
  v29 = a6;
  v23 = v17;
  v20 = v15;
  v21 = v17;
  objc_msgSend(v18, "fetchLibraryAssetsFromAssetIDs:handler:", v19, v22);

}

+ (id)fetchImageForAsset:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 coverEffectsEnvironment:(id)a6
{
  return _objc_msgSend(a1, "fetchImageForAsset:size:includeSpine:allowGeneric:coverEffectsEnvironment:timeout:", a3, a5, 0, a6, a4.width, a4.height, 2.0);
}

+ (id)fetchImageForAsset:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 allowGeneric:(BOOL)a6 coverEffectsEnvironment:(id)a7 timeout:(double)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  double height;
  double width;
  id v15;
  id v16;
  dispatch_semaphore_t v17;
  id v18;
  NSObject *v19;
  dispatch_time_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  NSObject *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[24];

  v10 = a6;
  v11 = a5;
  height = a4.height;
  width = a4.width;
  v15 = a3;
  v16 = a7;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_5B040;
  v35 = sub_5B050;
  v36 = 0;
  if (v15)
  {
    v17 = dispatch_semaphore_create(0);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_5B058;
    v27[3] = &unk_C31A8;
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assetID"));
    v28 = v18;
    v30 = &v31;
    v19 = v17;
    v29 = v19;
    objc_msgSend(a1, "_fetchImageForAsset:size:includeSpine:includeShadow:allowGeneric:coverEffectsEnvironment:completion:", v15, v11, 0, v10, v16, v27, width, height);
    v20 = dispatch_time(0, (uint64_t)(a8 * 1000000000.0));
    if (dispatch_semaphore_wait(v19, v20))
    {
      v21 = BCImageCacheLog();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assetID"));
        sub_8377C(v23, buf, v22);
      }

    }
    v24 = (void *)v32[5];
  }
  else
  {
    v24 = 0;
  }
  v25 = v24;
  _Block_object_dispose(&v31, 8);

  return v25;
}

+ (id)fetchImageForAssetID:(id)a3 size:(CGSize)a4 includeSpine:(BOOL)a5 coverEffectsEnvironment:(id)a6
{
  _BOOL8 v6;
  double height;
  double width;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;

  v6 = a5;
  height = a4.height;
  width = a4.width;
  v11 = a6;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultManager"));
  v14 = objc_msgSend(v13, "newManagedObjectContext");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NewMOC 1 %s %@"), "+[BKLibraryManager(BCCacheManager) fetchImageForAssetID:size:includeSpine:coverEffectsEnvironment:]", v12));
  objc_msgSend(v14, "setName:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultManager"));
  v22 = v12;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "libraryAssetsWithAssetIDsContainedInList:tempAssetIDs:inManagedObjectContext:", v17, 0, v14));
  if (objc_msgSend(v18, "count"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", 0));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchImageForAsset:size:includeSpine:coverEffectsEnvironment:", v19, v6, v11, width, height));

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (unsigned)processingOptionsFor:(id)a3 coverEffectsEnvironment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  __int16 v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unsigned __int16 v16;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isContainer"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "seriesBooks"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anyObject"));

    v9 = 32;
    if (v8)
    {
      if (objc_msgSend(v8, "isAudiobook"))
        v9 = 2080;
      else
        v9 = 32;
    }

  }
  else
  {
    v10 = objc_msgSend(v5, "contentType");
    if (v10 - 6 >= 0xE)
    {
      switch(v10)
      {
        case 0u:
          if (objc_msgSend(v5, "state") == 5
            || objc_msgSend(v5, "state") == 6
            || objc_msgSend(v5, "state") == 2)
          {
            goto LABEL_23;
          }
          goto LABEL_28;
        case 1u:
        case 4u:
LABEL_23:
          v9 = 2;
          break;
        case 2u:
        case 3u:
          v9 = 4;
          break;
        default:
LABEL_28:
          v9 = 0;
          break;
      }
    }
    else
    {
      v9 = 8;
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "coverEffectRTLOverride"));
  v12 = v11;
  if (v11)
  {
    if ((objc_msgSend(v11, "BOOLValue") & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isRightToLeft"))
LABEL_11:
    v9 |= 0x80u;
LABEL_12:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "isExplicit"));
  if ((objc_msgSend(v13, "BOOLValue") & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v15 = objc_msgSend(v14, "isExplicitMaterialAllowed");

    if (!v15)
      v9 |= 0x400u;
  }
  else
  {

  }
  if (objc_msgSend(v6, "coverEffectsNightMode"))
    v16 = v9 | 0x40;
  else
    v16 = v9;

  return v16;
}

@end
