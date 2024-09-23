@implementation BKLibraryAssetDetailsManager

- (BKLibraryAssetDetailsManager)initWithLibraryManager:(id)a3
{
  id v4;
  BKLibraryAssetDetailsManager *v5;
  BKLibraryAssetDetailsManager *v6;
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
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BKLibraryAssetDetailsManager;
  v5 = -[BKLibraryAssetDetailsManager init](&v22, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_libraryManager, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.iBooks.BKLibraryAssetDetailsManager", v8);
    enableCloudMergeQueue = v6->_enableCloudMergeQueue;
    v6->_enableCloudMergeQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("com.apple.iBooks.BKLibraryAssetDetailsManager.getChanges", v12);
    getChangesQueue = v6->_getChangesQueue;
    v6->_getChangesQueue = (OS_dispatch_queue *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v6, "_BCCloudAssetDetailManagerChanged:", BCCloudAssetDetailManagerChanged, 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", v6, "_BCCloudReadingNowDetailManagerChanged:", BCCloudReadingNowDetailManagerChanged, 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "assetDetailManager"));
    objc_storeWeak((id *)&v6->_cloudAssetDetailManager, v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "readingNowDetailManager"));
    objc_storeWeak((id *)&v6->_cloudReadingNowDetailManager, v20);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, BCCloudAssetDetailManagerChanged, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, BCCloudReadingNowDetailManagerChanged, 0);

  objc_storeWeak((id *)&self->_libraryManager, 0);
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryAssetDetailsManager;
  -[BKLibraryAssetDetailsManager dealloc](&v5, "dealloc");
}

- (void)setEnableCloudMerge:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetDetailsManager enableCloudMergeQueue](self, "enableCloudMergeQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_448EC;
  v6[3] = &unk_C20B8;
  v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

- (void)setEnableReadingNowSync:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_enableReadingNowSync != a3)
  {
    self->_enableReadingNowSync = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetDetailsManager libraryManager](self, "libraryManager"));
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_44FDC;
      v5[3] = &unk_C1590;
      v5[4] = self;
      objc_msgSend(v4, "performNamed:workerQueueBlockAndWait:", CFSTR("setEnableReadingNowSync"), v5);

    }
  }
}

- (void)p_syncAllAssetDetailChangesToCloudInMOC:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingContainerLibraryAssets](BKLibraryManager, "predicateForExcludingContainerLibraryAssets"));
  objc_msgSend(v5, "setPredicate:", v6);

  v11 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeFetchRequest:error:", v5, &v11));
  v8 = v11;
  if (v8)
  {
    v9 = BKLibraryAssetDetailsLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_8276C();

  }
  else
  {
    -[BKLibraryAssetDetailsManager p_syncAssetDetailsForAssets:inMOC:](self, "p_syncAssetDetailsForAssets:inMOC:", v7, v4);
  }

}

- (void)p_syncAssetDetailsForAssets:(id)a3 inMOC:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  BKLibraryAssetDetailsManager *v31;
  id v32;
  _QWORD v33[6];
  _QWORD v34[4];
  id v35;
  BKLibraryAssetDetailsManager *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  id v44;
  _BYTE v45[128];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v31 = self;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetDetailsManager libraryManager](self, "libraryManager"));
    v32 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cloudSyncVersionsForDataType:inContext:", CFSTR("BCAssetDetail"), v7));

    objc_msgSend(v9, "setLocalVersion:", (char *)objc_msgSend(v9, "localVersion") + 1);
    v30 = objc_msgSend(v9, "localVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v16, "hasImportantAssetDetails"))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetDetailRepresentation"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetID"));

            if (v18)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetID"));
              objc_msgSend(v10, "setObject:forKey:", v17, v19);

            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v13);
    }

    if (objc_msgSend(v10, "count"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
      v21 = objc_msgSend(v20, "verboseLoggingEnabled");

      if (v21)
      {
        v22 = BKLibraryAssetDetailsDevelopmentLog();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = objc_msgSend(v10, "count");
          *(_DWORD *)buf = 134217984;
          v44 = v24;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "\"\\\"BCAssetDetail found %lu details to sync\\\"\", buf, 0xCu);
        }

      }
    }
    if (objc_msgSend(v10, "count"))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation predicateForGlobalAnnotationsWithAssetIDs:](AEAnnotation, "predicateForGlobalAnnotationsWithAssetIDs:", v25));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetDetailsManager annotationProvider](v31, "annotationProvider"));
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_45474;
      v34[3] = &unk_C2A70;
      v35 = v10;
      v36 = v31;
      v37 = v25;
      v38 = v30;
      v28 = v25;
      objc_msgSend(v27, "onAnnotationsMatchingPredicate:performBlock:", v26, v34);

    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetDetailsManager libraryManager](v31, "libraryManager"));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_45C84;
      v33[3] = &unk_C2A20;
      v33[4] = v31;
      v33[5] = v30;
      objc_msgSend(v29, "performBlockOnWorkerQueue:", v33);

    }
    v7 = v32;

  }
}

- (void)p_syncAllReadingNowChangesToCloudInMOC:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingContainerLibraryAssets](BKLibraryManager, "predicateForExcludingContainerLibraryAssets"));
  objc_msgSend(v5, "setPredicate:", v6);

  v12 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executeFetchRequest:error:", v5, &v12));
  v8 = v12;
  v9 = BKLibraryAssetDetailsLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_8276C();

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_828D8();

    -[BKLibraryAssetDetailsManager p_syncReadingNowDetailsForAssets:inMOC:](self, "p_syncReadingNowDetailsForAssets:inMOC:", v7, v4);
  }

}

- (void)p_syncReadingNowDetailsForAssets:(id)a3 inMOC:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *activity;
  _QWORD block[4];
  id v12;
  BKLibraryAssetDetailsManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  activity = _os_activity_create(&dword_0, "Books/sync-ReadingNow", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_45EEC;
  block[3] = &unk_C1918;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  os_activity_apply(activity, block);

}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;

  v5 = a4;
  v6 = objc_opt_class(BKLibraryManagedObjectContext);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "context"));
  v8 = BUDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = BKLibraryAssetDetailsLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_82BF8();

  if (!v9
    || objc_msgSend(v9, "sessionContextType") == 2
    || objc_msgSend(v9, "sessionContextType") == 3
    || objc_msgSend(v9, "sessionContextType") == 1
    || (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "persistentStoreCoordinator")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetDetailsManager libraryManager](self, "libraryManager")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "persistentStoreCoordinator")),
        v15 = objc_msgSend(v12, "hasStoreInCommonWith:", v14),
        v14,
        v13,
        v12,
        !v15))
  {
    v17 = BKLibraryAssetDetailsLog();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      sub_82ADC(v9, self, v18);

  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetDetailsManager enableCloudMergeQueue](self, "enableCloudMergeQueue"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_466D4;
    v19[3] = &unk_C12F8;
    v19[4] = self;
    v20 = v5;
    dispatch_async(v16, v19);

  }
}

- (void)_BCCloudAssetDetailManagerChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetDetailsManager getChangesQueue](self, "getChangesQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_474DC;
  block[3] = &unk_C1400;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_updateAssetDetailCloudVersionFromCloudSyncVersions:(id)a3 inMOC:(id)a4 fetchAgain:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetDetailsManager libraryManager](self, "libraryManager"));
  objc_msgSend(v10, "updateCloudVersionFromCloudSyncVersions:inContext:", v9, v8);

  if (v5)
  {
    -[BKLibraryAssetDetailsManager _checkForChangesFromCloudAssetDetailManagerInMOC:reason:](self, "_checkForChangesFromCloudAssetDetailManagerInMOC:reason:", v8, CFSTR("fetchAgain"));
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetDetailsManager getChangesQueue](self, "getChangesQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_47740;
    block[3] = &unk_C1400;
    block[4] = self;
    dispatch_async(v11, block);

  }
}

- (void)_updateGlobalAnnotationsFromDetails:(id)a3 annotationProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bu_dictionaryUsingPropertyAsKey:", CFSTR("assetID")));
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
    v9 = objc_msgSend(v8, "verboseLoggingEnabled");

    if (v9)
    {
      v10 = BKLibraryAssetDetailsDevelopmentLog();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v5;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "\"\\\"_updateGlobalAnnotationsFromDetails with assetDetails: %@\\\"\", buf, 0xCu);
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_47A20;
    v13[3] = &unk_C2B10;
    v14 = v7;
    objc_msgSend(v6, "modifyGlobalAnnotationsWithAssetIDs:type:performBlock:", v12, 2, v13);

  }
}

- (void)_checkForChangesFromCloudAssetDetailManagerInMOC:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetDetailsManager libraryManager](self, "libraryManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetDetailsManager annotationProvider](self, "annotationProvider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cloudSyncVersionsForDataType:inContext:", CFSTR("BCAssetDetail"), v7));

  v11 = objc_msgSend(v10, "mutableCopy");
  v12 = BKLibraryAssetDetailsLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v11;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "_checkForChangesFromCloudAssetDetailManagerInMOC cloudSyncVersions:%{public}@, reason:%{public}@", buf, 0x16u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetDetailsManager cloudAssetDetailManager](self, "cloudAssetDetailManager"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_485FC;
  v17[3] = &unk_C2B88;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v14, "getAssetDetailChangesSince:completion:", v11, v17);

}

- (void)_BCCloudReadingNowDetailManagerChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = _os_activity_create(&dword_0, "Books/process-ReadingNowDetailManagerChanged", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_48B44;
  block[3] = &unk_C1400;
  block[4] = self;
  os_activity_apply(v4, block);

}

- (void)_checkForChangesFromCloudReadingNowDetailManagerInMOC:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *activity;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity = _os_activity_create(&dword_0, "Books/BKLibrary-checkForReadingNowChange", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_48D88;
  block[3] = &unk_C1918;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  os_activity_apply(activity, block);

}

- (void)updateAssetDetailsWithGlobalAnnotations:(id)a3 completion:(id)a4
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetDetailsManager libraryManager](self, "libraryManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_49530;
  v11[3] = &unk_C1A08;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlockOnWorkerQueue:", v11);

}

- (void)managedBooksMapWithAssetIDs:(id)a3 completion:(id)a4
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetDetailsManager libraryManager](self, "libraryManager"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_49DF8;
  v11[3] = &unk_C1A08;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlockOnWorkerQueue:", v11);

}

- (BOOL)enableCloudMerge
{
  return self->_enableCloudMerge;
}

- (BOOL)enableReadingNowSync
{
  return self->_enableReadingNowSync;
}

- (AEAnnotationProvider)annotationProvider
{
  return (AEAnnotationProvider *)objc_loadWeakRetained((id *)&self->_annotationProvider);
}

- (void)setAnnotationProvider:(id)a3
{
  objc_storeWeak((id *)&self->_annotationProvider, a3);
}

- (BKLibraryManager)libraryManager
{
  return (BKLibraryManager *)objc_loadWeakRetained((id *)&self->_libraryManager);
}

- (void)setLibraryManager:(id)a3
{
  objc_storeWeak((id *)&self->_libraryManager, a3);
}

- (BCCloudAssetDetailManager)cloudAssetDetailManager
{
  return (BCCloudAssetDetailManager *)objc_loadWeakRetained((id *)&self->_cloudAssetDetailManager);
}

- (void)setCloudAssetDetailManager:(id)a3
{
  objc_storeWeak((id *)&self->_cloudAssetDetailManager, a3);
}

- (BCCloudReadingNowDetailManager)cloudReadingNowDetailManager
{
  return (BCCloudReadingNowDetailManager *)objc_loadWeakRetained((id *)&self->_cloudReadingNowDetailManager);
}

- (void)setCloudReadingNowDetailManager:(id)a3
{
  objc_storeWeak((id *)&self->_cloudReadingNowDetailManager, a3);
}

- (BCManagedObjectIDMonitor)libraryAssetMonitor
{
  return self->_libraryAssetMonitor;
}

- (void)setLibraryAssetMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_libraryAssetMonitor, a3);
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

- (BOOL)processingAssetDetailChanges
{
  return self->_processingAssetDetailChanges;
}

- (void)setProcessingAssetDetailChanges:(BOOL)a3
{
  self->_processingAssetDetailChanges = a3;
}

- (BOOL)receivedAssetDetailChangesNotification
{
  return self->_receivedAssetDetailChangesNotification;
}

- (void)setReceivedAssetDetailChangesNotification:(BOOL)a3
{
  self->_receivedAssetDetailChangesNotification = a3;
}

- (BOOL)processingReadingNowChanges
{
  return self->_processingReadingNowChanges;
}

- (void)setProcessingReadingNowChanges:(BOOL)a3
{
  self->_processingReadingNowChanges = a3;
}

- (BOOL)receivedReadingNowChangesNotification
{
  return self->_receivedReadingNowChangesNotification;
}

- (void)setReceivedReadingNowChangesNotification:(BOOL)a3
{
  self->_receivedReadingNowChangesNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getChangesQueue, 0);
  objc_storeStrong((id *)&self->_enableCloudMergeQueue, 0);
  objc_storeStrong((id *)&self->_libraryAssetMonitor, 0);
  objc_destroyWeak((id *)&self->_cloudReadingNowDetailManager);
  objc_destroyWeak((id *)&self->_cloudAssetDetailManager);
  objc_destroyWeak((id *)&self->_libraryManager);
  objc_destroyWeak((id *)&self->_annotationProvider);
}

@end
