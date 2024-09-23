@implementation BKStoreController

- (void)setLibraryAssetProvider:(id)a3
{
  objc_storeWeak((id *)&self->_libraryAssetProvider, a3);
}

- (void)setDownloadQueueManager:(id)a3
{
  objc_storeWeak((id *)&self->_downloadQueueManager, a3);
}

- (void)refreshUpdateCountAsync
{
  NSObject *updateQueue;
  _QWORD block[5];

  updateQueue = self->_updateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079070;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(updateQueue, block);
}

- (BKStoreController)initWithLibrary:(id)a3 downloadQueueManager:(id)a4
{
  id v6;
  id v7;
  BKStoreController *v8;
  BKStoreController *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *storeIDsWithAvailableUpdatesSync;
  dispatch_queue_t v12;
  OS_dispatch_queue *storeIDsWithAssetVersionUpdatePendingSync;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *bagSnapshotAccessQueue;
  dispatch_queue_attr_t v18;
  NSObject *v19;
  dispatch_queue_attr_t initially_inactive;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *updateQueue;
  NSArray *storeIDsCompletions;
  uint64_t v25;
  NSMutableSet *storeIDsWithAssetVersionUpdatePending;
  void *v27;
  void *v28;
  NSOperationQueue *v29;
  NSOperationQueue *operationQueue;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)BKStoreController;
  v8 = -[BKStoreController init](&v32, "init");
  v9 = v8;
  if (v8)
  {
    -[BKStoreController setLibraryAssetProvider:](v8, "setLibraryAssetProvider:", v6);
    v10 = dispatch_queue_create("BKStoreController.storeIDsWithAvailableUpdates", 0);
    storeIDsWithAvailableUpdatesSync = v9->_storeIDsWithAvailableUpdatesSync;
    v9->_storeIDsWithAvailableUpdatesSync = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("BKStoreController.storeIDsWithAssetVersionUpdatePendingSync", 0);
    storeIDsWithAssetVersionUpdatePendingSync = v9->_storeIDsWithAssetVersionUpdatePendingSync;
    v9->_storeIDsWithAssetVersionUpdatePendingSync = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("BKStoreController.bagSnapshotAccessQueue", v15);
    bagSnapshotAccessQueue = v9->_bagSnapshotAccessQueue;
    v9->_bagSnapshotAccessQueue = (OS_dispatch_queue *)v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    initially_inactive = dispatch_queue_attr_make_initially_inactive(v19);
    v21 = objc_claimAutoreleasedReturnValue(initially_inactive);
    v22 = dispatch_queue_create("BKStoreController.updateQueue", v21);
    updateQueue = v9->_updateQueue;
    v9->_updateQueue = (OS_dispatch_queue *)v22;

    storeIDsCompletions = v9->_storeIDsCompletions;
    v9->_storeIDsCompletions = (NSArray *)&__NSArray0__struct;

    v25 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    storeIDsWithAssetVersionUpdatePending = v9->_storeIDsWithAssetVersionUpdatePending;
    v9->_storeIDsWithAssetVersionUpdatePending = (NSMutableSet *)v25;

    -[BKStoreController _bagInvalidated:](v9, "_bagInvalidated:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v27, "addObserver:selector:name:object:", v9, "_bagInvalidated:", AMSBagInvalidatedNotification, 0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v28, "addObserver:selector:name:object:", v9, "libraryOperationDidComplete:", BKLibraryOperationCompleteNotification, 0);

    -[BKStoreController setDownloadQueueManager:](v9, "setDownloadQueueManager:", v7);
    v29 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v9->_operationQueue;
    v9->_operationQueue = v29;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v9->_operationQueue, "setMaxConcurrentOperationCount:", 1);
  }

  return v9;
}

- (void)downloadQueueReload
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKStoreController downloadQueueManager](self, "downloadQueueManager"));
  objc_msgSend(v2, "reloadDownloadQueue");

}

- (BKLibraryDownloadQueueManager)downloadQueueManager
{
  return (BKLibraryDownloadQueueManager *)objc_loadWeakRetained((id *)&self->_downloadQueueManager);
}

- (void)_bagInvalidated:(id)a3
{
  NSObject *bagSnapshotAccessQueue;
  _QWORD block[5];

  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E7FC;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(bagSnapshotAccessQueue, block);
}

- (void)dealloc
{
  void *v3;
  NSSet *storeIDsWithAvailableUpdates;
  NSObject *storeIDsWithAssetVersionUpdatePendingSync;
  objc_super v6;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  dispatch_sync((dispatch_queue_t)self->_storeIDsWithAvailableUpdatesSync, &stru_1008E7478);
  storeIDsWithAvailableUpdates = self->_storeIDsWithAvailableUpdates;
  self->_storeIDsWithAvailableUpdates = 0;

  storeIDsWithAssetVersionUpdatePendingSync = self->_storeIDsWithAssetVersionUpdatePendingSync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078F04;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_sync(storeIDsWithAssetVersionUpdatePendingSync, block);
  dispatch_activate((dispatch_object_t)self->_updateQueue);
  v6.receiver = self;
  v6.super_class = (Class)BKStoreController;
  -[BKStoreController dealloc](&v6, "dealloc");
}

- (void)startAllowingRefreshUpdateCount
{
  uint64_t updated;
  NSObject *v4;
  uint8_t v5[16];

  updated = BKStoreBookUpdateLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "startAllowingRefreshUpdateCount", v5, 2u);
  }

  dispatch_activate((dispatch_object_t)self->_updateQueue);
}

- (void)openEBookProductPageForStoreID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100079640;
  v6[3] = &unk_1008E7590;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "requestPrimaryScene:", v6);

}

- (id)bookUrlForStoreId:(id)a3
{
  id v4;
  NSObject *bagSnapshotAccessQueue;
  void *v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[6];
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
  v19 = sub_10004E310;
  v20 = sub_10004E208;
  v21 = 0;
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000797EC;
  block[3] = &unk_1008E75B8;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(bagSnapshotAccessQueue, block);
  v6 = (void *)v17[5];
  v7 = v4;
  v8 = v6;
  v9 = objc_msgSend(v7, "length");
  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v13 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absoluteString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("?id=%@"), v7));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));

  }
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (BOOL)isAssetDownloadableWithStoreId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKStoreController libraryAssetProvider](self, "libraryAssetProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "libraryAssetOnMainQueueWithStoreID:", v4));

  if (objc_msgSend(v5, "isDownloadableFromLibraryAsset:", v6))
    v7 = +[BKReachability isOffline](BKReachability, "isOffline") ^ 1;
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (void)startOrResumeDownloadingAssetWithStoreId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  id v23;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "statusForAssetID:", v4));

  v7 = objc_msgSend(v6, "canResume");
  if ((_DWORD)v7)
  {
    v10 = BCBookDownloadLog(v7, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Resuming download of asset with ID %{private}@", buf, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
    objc_msgSend(v12, "resumeDownloadOfAsset:", v4);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKStoreController libraryAssetProvider](self, "libraryAssetProvider"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "libraryAssetOnMainQueueWithStoreID:", v4));

    v17 = BCBookDownloadLog(v14, v15, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Requesting download of asset with ID %{private}@", buf, 0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKStoreController libraryAssetProvider](self, "libraryAssetProvider"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100079ACC;
    v20[3] = &unk_1008E75E0;
    v21 = v4;
    objc_msgSend(v19, "resolveLibraryAsset:completion:", v12, v20);

  }
}

- (void)cancelDownloadingAssetWithStoreId:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v7 = BCBookDownloadLog(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138477827;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cancelling download of asset with ID %{private}@", (uint8_t *)&v10, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
  objc_msgSend(v9, "cancelDownloadOfAsset:", v3);

}

- (id)assetDownloadProgressWithStoreId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _UNKNOWN **v6;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "statusForAssetID:", v3));

  if (objc_msgSend(v5, "state") == (id)4)
  {
    if (objc_msgSend(v5, "fileSize"))
      v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)objc_msgSend(v5, "bytesDownloaded")/ (double)(unint64_t)objc_msgSend(v5, "fileSize")));
    else
      v6 = &off_10092EBF8;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)coverForAssetWithStoreId:(id)a3 supplementalAssetID:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a5;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v8 = BCImageCacheLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10069C9AC(v9);

    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKStoreController.m", 252, "-[BKStoreController coverForAssetWithStoreId:supplementalAssetID:completion:]", "NO", CFSTR("Cover image block called from background thread"));
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100079E2C;
  v11[3] = &unk_1008E7608;
  v12 = v7;
  v10 = v7;
  +[BKLibraryManager fetchImageForAssetID:size:includeSpine:includeShadow:coverEffectsEnvironment:completion:](BKLibraryManager, "fetchImageForAssetID:size:includeSpine:includeShadow:coverEffectsEnvironment:completion:", v6, 1, 1, 0, v11, 256.0, 256.0);

}

- (void)bumpLastBookUpdateCheck
{
  NSObject *bagSnapshotAccessQueue;
  _QWORD block[5];

  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079EE8;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_sync(bagSnapshotAccessQueue, block);
}

- (unint64_t)lastBookUpdateCheck
{
  NSObject *bagSnapshotAccessQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100079FC4;
  v5[3] = &unk_1008E75B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(bagSnapshotAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setStoreIDsWithAvailableUpdates:(id)a3
{
  id v4;
  NSObject *storeIDsWithAvailableUpdatesSync;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t updated;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[5];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;

  v4 = a3;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_10004E310;
  v39 = sub_10004E208;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_10004E310;
  v33 = sub_10004E208;
  v34 = 0;
  storeIDsWithAvailableUpdatesSync = self->_storeIDsWithAvailableUpdatesSync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A2F4;
  block[3] = &unk_1008E7630;
  block[4] = self;
  v6 = v4;
  v25 = v6;
  v26 = &v41;
  v27 = &v35;
  v28 = &v29;
  dispatch_sync(storeIDsWithAvailableUpdatesSync, block);
  updated = BKStoreBookUpdateLog(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)v42 + 24)));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", ")));
    *(_DWORD *)buf = 138412546;
    v47 = v11;
    v48 = 2112;
    v49 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting storeIdsWithAvailableUpdates, changed=%@: [%@]", buf, 0x16u);

  }
  self->_hasSetStoreIDsWithAvailableUpdates = 1;
  if (*((_BYTE *)v42 + 24))
  {
    -[BKStoreController _notifyStoreIDsWithAvailableUpdatesChanged](self, "_notifyStoreIDsWithAvailableUpdatesChanged");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = (id)v30[5];
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v45, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          v18 = objc_retainBlock(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i));
          v19 = v18;
          if (v18)
            (*((void (**)(id, uint64_t))v18 + 2))(v18, v36[5]);

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v45, 16);
      }
      while (v15);
    }

  }
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

}

- (void)libraryOperationDidComplete:(id)a3
{
  id v4;
  NSObject *storeIDsWithAssetVersionUpdatePendingSync;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  BKStoreController *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  storeIDsWithAssetVersionUpdatePendingSync = self->_storeIDsWithAssetVersionUpdatePendingSync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A504;
  block[3] = &unk_1008E75B8;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(storeIDsWithAssetVersionUpdatePendingSync, block);
  if (*((_BYTE *)v17 + 24))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v6 = self->_storeIDsWithAssetVersionUpdatePendingSync;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10007A540;
    v7[3] = &unk_1008E7658;
    v8 = v4;
    v9 = self;
    v10 = &v11;
    dispatch_sync(v6, v7);
    if (*((_BYTE *)v12 + 24))
      -[BKStoreController refreshUpdateCountAsync](self, "refreshUpdateCountAsync");

    _Block_object_dispose(&v11, 8);
  }
  _Block_object_dispose(&v16, 8);

}

- (void)clearAvailableUpdatesForStoreIDAndRefreshUpdateCount:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t updated;
  NSObject *v11;
  NSObject *storeIDsWithAssetVersionUpdatePendingSync;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKStoreController storeIDsWithAvailableUpdates](self, "storeIDsWithAvailableUpdates"));
  v6 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObject:", v4);
  v7 = objc_msgSend(v6, "copy");
  -[BKStoreController setStoreIDsWithAvailableUpdates:](self, "setStoreIDsWithAvailableUpdates:", v7);

  updated = BKStoreBookUpdateLog(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removed %@ from storeIDsWithAvailableUpdates", buf, 0xCu);
  }

  storeIDsWithAssetVersionUpdatePendingSync = self->_storeIDsWithAssetVersionUpdatePendingSync;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007A818;
  v14[3] = &unk_1008E7338;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  dispatch_sync(storeIDsWithAssetVersionUpdatePendingSync, v14);

}

- (void)_notifyStoreIDsWithAvailableUpdatesChanged
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007A87C;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (NSSet)storeIDsWithAvailableUpdates
{
  NSObject *storeIDsWithAvailableUpdatesSync;
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
  v9 = sub_10004E310;
  v10 = sub_10004E208;
  v11 = 0;
  storeIDsWithAvailableUpdatesSync = self->_storeIDsWithAvailableUpdatesSync;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007A980;
  v5[3] = &unk_1008E75B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(storeIDsWithAvailableUpdatesSync, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (void)getStoreIDsWithAvailableUpdatesWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *storeIDsWithAvailableUpdatesSync;
  uint64_t v8;
  uint64_t v9;
  uint64_t updated;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  _QWORD block[6];
  uint8_t v22[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  void *v29;

  v4 = a3;
  v6 = v4;
  if (self->_hasSetStoreIDsWithAvailableUpdates)
  {
    if (v4)
    {
      *(_QWORD *)v22 = 0;
      v23 = v22;
      v24 = 0x3032000000;
      v25 = sub_10004E310;
      v26 = sub_10004E208;
      v27 = 0;
      storeIDsWithAvailableUpdatesSync = self->_storeIDsWithAvailableUpdatesSync;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007AC0C;
      block[3] = &unk_1008E75B8;
      block[4] = self;
      block[5] = v22;
      dispatch_sync(storeIDsWithAvailableUpdatesSync, block);
      updated = BKStoreBookUpdateLog(v8, v9);
      v11 = objc_claimAutoreleasedReturnValue(updated);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v23 + 5), "allObjects"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", ")));
        *(_DWORD *)buf = 138412290;
        v29 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Returning these items with update: [%@]", buf, 0xCu);

      }
      v14 = objc_retainBlock(v6);
      v15 = v14;
      if (v14)
        (*((void (**)(id, _QWORD))v14 + 2))(v14, *((_QWORD *)v23 + 5));

      _Block_object_dispose(v22, 8);
    }
  }
  else
  {
    v16 = BKStoreBookUpdateLog(v4, v5);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Fetching updated items before they were ready, queued up in _storeIDsCompletions.", v22, 2u);
    }

    v18 = self->_storeIDsWithAvailableUpdatesSync;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10007AC44;
    v19[3] = &unk_1008E7680;
    v19[4] = self;
    v20 = v6;
    dispatch_sync(v18, v19);

  }
}

- (void)_operationDidFinish:(id)a3 result:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t updated;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  BKStoreController *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  BKStoreController *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_updateQueue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  if (objc_msgSend(v5, "count"))
  {
    -[BKStoreController bumpLastBookUpdateCheck](self, "bumpLastBookUpdateCheck");
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("items")));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    if (v9)
    {
      v10 = v9;
      v35 = self;
      v36 = v5;
      v11 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", CFSTR("item-id"), v35, v36));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "adamIDStringValue"));
          v16 = (void *)v14;
          if (v14)
          {
            updated = BKStoreBookUpdateLog(v14, v15);
            v18 = objc_claimAutoreleasedReturnValue(updated);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v16;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Adding storeId (%@) from server response to storeIdsWithAvailableUpdates", buf, 0xCu);
            }

            objc_msgSend(v6, "addObject:", v16);
          }

        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      }
      while (v10);
      self = v35;
      v5 = v36;
    }
  }
  else
  {
    v19 = BKStoreBookUpdateLog(0, v7);
    v8 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No results", buf, 2u);
    }
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKStoreController libraryAssetProvider](self, "libraryAssetProvider"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "storeIDsForDownloadingBooks"));

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v22 = v21;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(_QWORD *)v41 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v6, "removeObject:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v24);
  }

  v29 = BKStoreBookUpdateLog(v27, v28);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "componentsJoinedByString:", CFSTR(", ")));
    *(_DWORD *)buf = 138412290;
    v50 = v32;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Fetching items to filter out unowned ones: [%@]", buf, 0xCu);

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10007B064;
  v37[3] = &unk_1008E76A8;
  v38 = v6;
  v39 = self;
  v34 = v6;
  objc_msgSend(v33, "fetchItemsForStoreIDs:completion:", v34, v37);

}

- (NSURL)bookmarkGetAllUrl
{
  NSObject *bagSnapshotAccessQueue;
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
  v9 = sub_10004E310;
  v10 = sub_10004E208;
  v11 = 0;
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007B284;
  v5[3] = &unk_1008E75B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(bagSnapshotAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

- (NSURL)bookmarkSetAllUrl
{
  NSObject *bagSnapshotAccessQueue;
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
  v9 = sub_10004E310;
  v10 = sub_10004E208;
  v11 = 0;
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007B394;
  v5[3] = &unk_1008E75B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(bagSnapshotAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

- (BOOL)allowCitationForProtectedBooks
{
  NSObject *bagSnapshotAccessQueue;
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
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007B480;
  v5[3] = &unk_1008E75B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(bagSnapshotAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isReportConcernEnabled
{
  NSObject *bagSnapshotAccessQueue;
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
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007B570;
  v5[3] = &unk_1008E76D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(bagSnapshotAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)storesAllowingCitation
{
  NSObject *bagSnapshotAccessQueue;
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
  v9 = sub_10004E310;
  v10 = sub_10004E208;
  v11 = 0;
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007B6A0;
  v5[3] = &unk_1008E75B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(bagSnapshotAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)citationAllowedForStoreFrontID:(unint64_t)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKStoreController storesAllowingCitation](self, "storesAllowingCitation"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = -[BKStoreController allowCitationForProtectedBooks](self, "allowCitationForProtectedBooks");
  }

  return v7;
}

- (void)canCheckForBookUpdatesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  dispatch_queue_global_t global_queue;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;

  v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_10004E310;
  v27[4] = sub_10004E208;
  v28 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "availableBookUpdatesReloadFrequency"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10007B9D8;
  v24[3] = &unk_1008E76F8;
  v26 = v27;
  v8 = v5;
  v25 = v8;
  objc_msgSend(v7, "valueWithCompletion:", v24);

  dispatch_group_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSNetworkConstraints networkConstraintsForMediaType:withBag:](AMSNetworkConstraints, "networkConstraintsForMediaType:withBag:", CFSTR("ebook"), v9));

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_10004E310;
  v22[4] = sub_10004E208;
  v23 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10007BA68;
  v19[3] = &unk_1008E7720;
  v21 = v22;
  v11 = v8;
  v20 = v11;
  objc_msgSend(v10, "addFinishBlock:", v19);
  global_queue = dispatch_get_global_queue(17, 0);
  v13 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007BAB4;
  block[3] = &unk_1008E7748;
  v17 = v22;
  v18 = v27;
  block[4] = self;
  v16 = v4;
  v14 = v4;
  dispatch_group_notify(v11, v13, block);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v27, 8);

}

- (NSURL)tellAFriendEmailBodyURLBase
{
  NSObject *bagSnapshotAccessQueue;
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
  v9 = sub_10004E310;
  v10 = sub_10004E208;
  v11 = 0;
  bagSnapshotAccessQueue = self->_bagSnapshotAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007BC54;
  v5[3] = &unk_1008E75B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(bagSnapshotAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  return (BKLibraryAssetProvider *)objc_loadWeakRetained((id *)&self->_libraryAssetProvider);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (BKLibraryBookUpdateCountOperation)updateCountOperation
{
  return self->_updateCountOperation;
}

- (void)setUpdateCountOperation:(id)a3
{
  objc_storeStrong((id *)&self->_updateCountOperation, a3);
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_updateCountOperation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_downloadQueueManager);
  objc_destroyWeak((id *)&self->_libraryAssetProvider);
  objc_storeStrong((id *)&self->_snapshotBag, 0);
  objc_storeStrong((id *)&self->_bagSnapshotAccessQueue, 0);
  objc_storeStrong((id *)&self->_storeIDsWithAssetVersionUpdatePendingSync, 0);
  objc_storeStrong((id *)&self->_storeIDsWithAssetVersionUpdatePending, 0);
  objc_storeStrong((id *)&self->_storeIDsWithAvailableUpdatesSync, 0);
  objc_storeStrong((id *)&self->_storeIDsCompletions, 0);
  objc_storeStrong((id *)&self->_storeIDsWithAvailableUpdates, 0);
}

@end
