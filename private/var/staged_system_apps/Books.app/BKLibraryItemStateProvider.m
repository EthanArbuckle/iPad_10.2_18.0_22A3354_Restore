@implementation BKLibraryItemStateProvider

- (BKLibraryItemStateProvider)initWithLibraryManager:(id)a3
{
  id v5;
  BKLibraryItemStateProvider *v6;
  BKLibraryItemStateProvider *v7;
  BSUILibraryItemStateCenter *v8;
  BSUILibraryItemStateCenter *stateCenter;
  uint64_t v10;
  NSSet *storeIDsWithAvailableUpdates;
  uint64_t v12;
  NSMutableSet *storeIDsPurchasing;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BCManagedObjectIDMonitor *v18;
  BCManagedObjectIDMonitor *monitor;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BKLibraryItemStateProvider;
  v6 = -[BKLibraryItemStateProvider init](&v29, "init");
  v7 = v6;
  if (v6)
  {
    v6->_accessLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_libraryManager, a3);
    v8 = (BSUILibraryItemStateCenter *)objc_msgSend(objc_alloc((Class)BSUILibraryItemStateCenter), "initWithProvider:", v7);
    stateCenter = v7->_stateCenter;
    v7->_stateCenter = v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    storeIDsWithAvailableUpdates = v7->_storeIDsWithAvailableUpdates;
    v7->_storeIDsWithAvailableUpdates = (NSSet *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    storeIDsPurchasing = v7->_storeIDsPurchasing;
    v7->_storeIDsPurchasing = (NSMutableSet *)v12;

    v14 = objc_alloc((Class)BCManagedObjectIDMonitor);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentStoreCoordinator"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingContainerLibraryAssets](BKLibraryManager, "predicateForExcludingContainerLibraryAssets"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryItemStateProvider _propertiesToMonitor](BKLibraryItemStateProvider, "_propertiesToMonitor"));
    v18 = (BCManagedObjectIDMonitor *)objc_msgSend(v14, "initWithContext:coordinator:entityName:predicate:mapProperty:propertiesOfInterest:observer:", 0, v15, CFSTR("BKLibraryAsset"), v16, CFSTR("assetID"), v17, v7);
    monitor = v7->_monitor;
    v7->_monitor = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "addObserver:selector:name:object:", v7, "_minifiedAssetPresentersChangedNotification:", CFSTR("BKMnifiedPresentersUpdatedNotification"), 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v7, "_storeAvailableUpdatesChangedNotification:", kAEStoreNumberOfUpdatesAvailableChangedNotification, 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v7, "_mediaLibraryDidChange:", MPMediaLibraryDidChangeNotification, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
    objc_msgSend(v21, "addObserver:", v7);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    objc_initWeak(&location, v7);
    v23 = BLDownloadQueuePurchaseFailedNotification;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000A1948;
    v26[3] = &unk_1008E8B70;
    objc_copyWeak(&v27, &location);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "addObserverForName:object:queue:usingBlock:", v23, 0, v22, v26));
    -[BKLibraryItemStateProvider setPurchaseObserver:](v7, "setPurchaseObserver:", v24);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
  return v7;
}

- (NSMutableSet)storeIDsPurchasing
{
  return self->_storeIDsPurchasing;
}

- (BSUILibraryItemStateCenter)stateCenter
{
  return self->_stateCenter;
}

- (void)setPurchaseObserver:(id)a3
{
  objc_storeStrong(&self->_purchaseObserver, a3);
}

- (void)_mediaLibraryDidChange:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryItemStateProvider storeIDsPurchasing](self, "storeIDsPurchasing", a3));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));

  if (objc_msgSend(v5, "count"))
    -[BKLibraryItemStateProvider _updateItemStatesForAssetIDs:](self, "_updateItemStatesForAssetIDs:", v5);

}

+ (id)_propertiesToMonitor
{
  void *v2;
  void *v3;
  _QWORD v5[9];

  v5[0] = CFSTR("combinedState");
  v5[1] = CFSTR("collectionMembers");
  v5[2] = CFSTR("dateFinished");
  v5[3] = CFSTR("expectedDate");
  v5[4] = CFSTR("isFinished");
  v5[5] = CFSTR("isSample");
  v5[6] = CFSTR("isTrackedAsRecent");
  v5[7] = CFSTR("readingProgress");
  v5[8] = CFSTR("storeID");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 9));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryItemStateProvider purchaseObserver](self, "purchaseObserver"));
  objc_msgSend(v4, "removeObserver:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
  objc_msgSend(v6, "removeObserver:", self);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_audiobookStatusMap, "allValues"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11), "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusIsPlaying"), off_1009C9338);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  v12.receiver = self;
  v12.super_class = (Class)BKLibraryItemStateProvider;
  -[BKLibraryItemStateProvider dealloc](&v12, "dealloc");
}

- (void)updateInterest:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v4;
  _QWORD v5[5];
  id v6;

  p_accessLock = &self->_accessLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A1C20;
  v5[3] = &unk_1008E7338;
  v5[4] = self;
  v6 = a3;
  v4 = v6;
  os_unfair_lock_lock_with_options(p_accessLock, 0x10000);
  sub_1000A1C20((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);

}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  id v5;
  NSMutableSet *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  id (*v18)(uint64_t);
  void *v19;
  NSMutableSet *v20;
  BKLibraryItemStateProvider *v21;

  v5 = a4;
  v6 = objc_opt_new(NSMutableSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addedObjects"));
  -[NSMutableSet addObjectsFromArray:](v6, "addObjectsFromArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deletedObjects"));
  -[NSMutableSet addObjectsFromArray:](v6, "addObjectsFromArray:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updatedObjects"));
  -[NSMutableSet addObjectsFromArray:](v6, "addObjectsFromArray:", v9);

  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1000A1D98;
  v19 = &unk_1008E7338;
  v10 = v6;
  v20 = v10;
  v21 = self;
  os_unfair_lock_lock_with_options(&self->_accessLock, 0x10000);
  sub_1000A1D98((uint64_t)&v16);
  os_unfair_lock_unlock(&self->_accessLock);
  v13 = BKLibraryItemStateProviderLog(v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    sub_10069E328(v5, (uint64_t)v10, v14);

  if (-[NSMutableSet count](v10, "count", v16, v17))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v10, "allObjects"));
    -[BKLibraryItemStateProvider _updateItemStatesForAssetIDs:](self, "_updateItemStatesForAssetIDs:", v15);

  }
}

- (void)_storeAvailableUpdatesChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  BKLibraryItemStateProvider *v13;
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeIDsWithAvailableUpdates"));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A1EC4;
  v11[3] = &unk_1008E7928;
  v12 = v4;
  v13 = self;
  v14 = v7;
  v8 = v7;
  v9 = v4;
  os_unfair_lock_lock_with_options(&self->_accessLock, 0x10000);
  sub_1000A1EC4((uint64_t)v11);
  os_unfair_lock_unlock(&self->_accessLock);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
  -[BKLibraryItemStateProvider _updateItemStatesForAssetIDs:](self, "_updateItemStatesForAssetIDs:", v10);

}

- (void)_minifiedAssetPresentersChangedNotification:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSMutableDictionary *audiobookStatusMap;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  NSMutableDictionary *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSMutableDictionary *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v4 = a3;
  v5 = objc_opt_class(BKMinifiedFlowController);
  v36 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v35 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "minifiedAssetPresenters"));
  audiobookStatusMap = self->_audiobookStatusMap;
  if (!audiobookStatusMap)
  {
    v11 = objc_opt_new(NSMutableDictionary);
    v12 = self->_audiobookStatusMap;
    self->_audiobookStatusMap = v11;

    audiobookStatusMap = self->_audiobookStatusMap;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](audiobookStatusMap, "allValues"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i), "removeObserver:forKeyPath:context:", self, CFSTR("assetAudiobookStatusIsPlaying"), off_1009C9338);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v15);
  }

  v18 = objc_opt_new(NSMutableDictionary);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v19 = v9;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "minifiedAssetPresenterAssetID"));
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "minifiedAssetStatus"));
        v27 = (void *)v26;
        if (v25)
          v28 = v26 == 0;
        else
          v28 = 1;
        if (!v28)
        {
          -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v26, v25);
          objc_msgSend(v27, "addObserver:forKeyPath:options:context:", self, CFSTR("assetAudiobookStatusIsPlaying"), 0, off_1009C9338);
        }

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v21);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v18, "allKeys"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v29));

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_audiobookStatusMap, "allKeys"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v31));

  objc_msgSend(v30, "unionSet:", v32);
  v33 = self->_audiobookStatusMap;
  self->_audiobookStatusMap = v18;

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "allObjects"));
  -[BKLibraryItemStateProvider _updateItemStatesForAssetIDs:](self, "_updateItemStatesForAssetIDs:", v34);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v17;

  if (off_1009C9338 == a6)
  {
    v11 = a4;
    v12 = objc_opt_class(NSObject);
    v13 = BUDynamicCast(v12, v11);
    v16 = (id)objc_claimAutoreleasedReturnValue(v13);

    v14 = v16;
    if (v16)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](self->_audiobookStatusMap, "allKeysForObject:", v16));
      -[BKLibraryItemStateProvider _updateItemStatesForAssetIDs:](self, "_updateItemStatesForAssetIDs:", v15);

      v14 = v16;
    }

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)BKLibraryItemStateProvider;
    v10 = a4;
    -[BKLibraryItemStateProvider observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", a3, v10, a5, a6);

  }
}

- (void)_updateItemStatesForAssetIDs:(id)a3
{
  id v4;
  id v5;
  BKLibraryManager *libraryManager;
  id v7;
  _QWORD v8[4];
  id v9;
  BKLibraryItemStateProvider *v10;
  id v11;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_msgSend(v4, "mutableCopy");
    libraryManager = self->_libraryManager;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000A2404;
    v8[3] = &unk_1008E8B98;
    v9 = v4;
    v10 = self;
    v11 = v5;
    v7 = v5;
    -[BKLibraryManager fetchLibraryAssetsFromAssetIDs:handler:](libraryManager, "fetchLibraryAssetsFromAssetIDs:handler:", v9, v8);

  }
}

- (id)_stateForItemIdentifier:(id)a3 libraryAsset:(id)a4
{
  id v6;
  id v7;
  BKLibraryItemState *v8;
  uint64_t v9;
  uint64_t (*__ptr32 *v10)();
  uint64_t v11;
  BKLibraryItemState *v12;
  uint64_t v13;
  BKLibraryItemState *v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *i;
  void *v37;
  void *v38;
  unsigned int v39;
  NSMutableDictionary *audiobookStatusMap;
  void *v41;
  void *v42;
  uint64_t v43;
  os_unfair_lock_s *p_accessLock;
  BKLibraryItemState *v45;
  id v46;
  BKLibraryItemState *v47;
  BKLibraryItemState *v48;
  _BOOL8 v50;
  uint64_t v51;
  uint64_t v52;
  _BOOL8 v53;
  _BOOL4 v54;
  uint64_t v55;
  uint64_t v56;
  _BOOL4 v57;
  BKLibraryItemStateProvider *v58;
  void *v59;
  _QWORD v60[5];
  id v61;
  BKLibraryItemState *v62;
  _QWORD v63[4];
  BKLibraryItemState *v64;
  BKLibraryItemStateProvider *v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[128];
  uint8_t buf[4];
  id v73;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new(BKLibraryItemState);
  -[BKLibraryItemState setItemIdentifier:](v8, "setItemIdentifier:", v6);
  if (-[NSMutableSet containsObject:](self->_storeIDsPurchasing, "containsObject:", v6))
    v9 = 2;
  else
    v9 = 0;
  -[BKLibraryItemState setLibrary:](v8, "setLibrary:", v9);
  -[BKLibraryItemState setDownload:](v8, "setDownload:", 0);
  -[BKLibraryItemState setIsInSamples:](v8, "setIsInSamples:", 0);
  -[BKLibraryItemState setIsSample:](v8, "setIsSample:", 0);
  -[BKLibraryItemState setWantToRead:](v8, "setWantToRead:", 0);
  -[BKLibraryItemState setStreamable:](v8, "setStreamable:", 0);
  -[BKLibraryItemState setUpdateAvailable:](v8, "setUpdateAvailable:", 0);
  -[BKLibraryItemState setPlay:](v8, "setPlay:", 0);
  -[BKLibraryItemState setSeriesType:](v8, "setSeriesType:", 0);
  -[BKLibraryItemState setFinished:](v8, "setFinished:", objc_msgSend(v7, "isFinished"));
  -[BKLibraryItemState setHasSpecifiedFinishedDate:](v8, "setHasSpecifiedFinishedDate:", objc_msgSend(v7, "hasSpecifiedFinishedDate"));
  -[BKLibraryItemState setTrackedAsRecent:](v8, "setTrackedAsRecent:", objc_msgSend(v7, "isTrackedAsRecent"));
  -[BKLibraryItemState setIsPurchased:](v8, "setIsPurchased:", 0);
  -[BKLibraryItemState setAssetIsPreorderable:](v8, "setAssetIsPreorderable:", objc_msgSend(v7, "isPreorderBook"));
  v10 = &off_10070C000;
  if (!v7)
    goto LABEL_61;
  if ((objc_msgSend(v7, "isCloud") & 1) != 0)
  {
    v11 = 0;
  }
  else if ((objc_msgSend(v7, "isLocal") & 1) != 0)
  {
    v11 = 2;
  }
  else
  {
    if (!objc_msgSend(v7, "isDownloading"))
      goto LABEL_12;
    v11 = 1;
  }
  -[BKLibraryItemState setDownload:](v8, "setDownload:", v11);
LABEL_12:
  if (objc_msgSend(v7, "isPreorderBook"))
  {
    v12 = v8;
    v13 = 3;
LABEL_14:
    -[BKLibraryItemState setLibrary:](v12, "setLibrary:", v13);
    -[BKLibraryItemState setIsPurchased:](v8, "setIsPurchased:", 1);
    goto LABEL_23;
  }
  if (objc_msgSend(v7, "isStoreItem"))
  {
    v14 = v8;
    v15 = 1;
LABEL_22:
    -[BKLibraryItemState setLibrary:](v14, "setLibrary:", v15);
    goto LABEL_23;
  }
  if (objc_msgSend(v7, "isStore")
    && (objc_msgSend(v7, "isSeriesItem") & 1) == 0
    && (objc_msgSend(v7, "isSample") & 1) == 0)
  {
    v12 = v8;
    v13 = 4;
    goto LABEL_14;
  }
  if ((objc_msgSend(v7, "isStore") & 1) == 0)
  {
    v14 = v8;
    v15 = 5;
    goto LABEL_22;
  }
LABEL_23:
  v16 = objc_msgSend(v7, "seriesType");
  if (v16 <= 3)
    -[BKLibraryItemState setSeriesType:](v8, "setSeriesType:", v16);
  -[BKLibraryItemState setIsInSamples:](v8, "setIsInSamples:", objc_msgSend(v7, "isInSamples"));
  -[BKLibraryItemState setIsSample:](v8, "setIsSample:", objc_msgSend(v7, "isSample"));
  if (!objc_msgSend(v7, "streamable"))
  {
    if (((objc_msgSend(v7, "isAudiobook") & 1) != 0
       || (id)-[BKLibraryItemState library](v8, "library") != (id)4)
      && (id)-[BKLibraryItemState library](v8, "library") != (id)3)
    {
      goto LABEL_43;
    }
    goto LABEL_36;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryItemStateProvider storeIDsPurchasing](self, "storeIDsPurchasing"));
  v18 = objc_msgSend(v17, "containsObject:", v6);

  if (!v18)
  {
    -[BKLibraryItemState setStreamable:](v8, "setStreamable:", 1);
    goto LABEL_43;
  }
  v19 = -[BKLibraryItemStateProvider _updateItemStateFieldsFromMediaLibrary:](self, "_updateItemStateFieldsFromMediaLibrary:", v8);
  if (!v19)
  {
    v26 = BKLibraryItemStateProviderLog(v19, v20);
    v23 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v73 = v6;
      v27 = "Set item (%@) to purchasing state as it had not landed in media library";
LABEL_41:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
    }
LABEL_42:

    -[BKLibraryItemState setLibrary:](v8, "setLibrary:", 2);
    goto LABEL_43;
  }
  if ((id)-[BKLibraryItemState download](v8, "download") != (id)2)
  {
    v50 = -[BKLibraryItemState isFamilyPurchase](v8, "isFamilyPurchase");
    if (v50)
    {
      v52 = BKLibraryItemStateProviderLog(v50, v51);
      v25 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v73 = v6;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Item (%@) belongs to a family member, allow download progress and no streaming", buf, 0xCu);
      }
      goto LABEL_37;
    }
    v53 = -[BKLibraryItemState isStreamable](v8, "isStreamable");
    v54 = v53;
    v56 = BKLibraryItemStateProviderLog(v53, v55);
    v23 = objc_claimAutoreleasedReturnValue(v56);
    v57 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v54)
    {
      if (!v57)
        goto LABEL_32;
      *(_DWORD *)buf = 138412290;
      v73 = v6;
      v24 = "Removing item (%@) from purchasing store IDs as it is streamable in the media library";
      goto LABEL_31;
    }
    if (v57)
    {
      *(_DWORD *)buf = 138412290;
      v73 = v6;
      v27 = "Set item (%@) to purchasing state as it is not yet playable and is not a family purchase";
      goto LABEL_41;
    }
    goto LABEL_42;
  }
  v22 = BKLibraryItemStateProviderLog(2, v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v73 = v6;
    v24 = "Removing item (%@) from purchasing store IDs as it is local in the media library";
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
  }
LABEL_32:

LABEL_36:
  v25 = objc_claimAutoreleasedReturnValue(-[BKLibraryItemStateProvider storeIDsPurchasing](self, "storeIDsPurchasing"));
  -[NSObject removeObject:](v25, "removeObject:", v6);
LABEL_37:

LABEL_43:
  v59 = v6;
  if (objc_msgSend(v7, "isDownloadingSupplementalContent", self))
    -[BKLibraryItemState setDownload:](v8, "setDownload:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "readingProgress"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString bc_formattedReadingProgress:isFinished:](NSString, "bc_formattedReadingProgress:isFinished:", v28, objc_msgSend(v7, "isFinished")));
  -[BKLibraryItemState setReadingProgress:](v8, "setReadingProgress:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "readingProgress"));
  objc_msgSend(v30, "doubleValue");
  -[BKLibraryItemState setReadingProgressValue:](v8, "setReadingProgressValue:");

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionMembers"));
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v68;
    v35 = kBKCollectionDefaultIDWantToRead;
    while (2)
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(_QWORD *)v68 != v34)
          objc_enumerationMutation(v31);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i), "collection"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "collectionID"));
        v39 = objc_msgSend(v38, "isEqualToString:", v35);

        if (v39)
        {
          -[BKLibraryItemState setWantToRead:](v8, "setWantToRead:", 1);
          goto LABEL_55;
        }
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      if (v33)
        continue;
      break;
    }
  }
LABEL_55:

  self = v58;
  audiobookStatusMap = v58->_audiobookStatusMap;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](audiobookStatusMap, "objectForKeyedSubscript:", v41));

  if (v42)
  {
    if (objc_msgSend(v42, "assetAudiobookStatusIsPlaying"))
      v43 = 1;
    else
      v43 = 2;
    -[BKLibraryItemState setPlay:](v8, "setPlay:", v43);
  }
  v63[0] = _NSConcreteStackBlock;
  v10 = &off_10070C000;
  v63[1] = 3221225472;
  v63[2] = sub_1000A2E00;
  v63[3] = &unk_1008E7928;
  v64 = v8;
  v65 = v58;
  v6 = v59;
  v66 = v59;
  os_unfair_lock_lock_with_options(&v58->_accessLock, 0x10000);
  sub_1000A2E00((uint64_t)v63);
  os_unfair_lock_unlock(&v58->_accessLock);

LABEL_61:
  p_accessLock = &self->_accessLock;
  v60[0] = _NSConcreteStackBlock;
  v60[1] = *((_QWORD *)v10 + 187);
  v60[2] = sub_1000A2E30;
  v60[3] = &unk_1008E7928;
  v60[4] = self;
  v61 = v6;
  v45 = v8;
  v62 = v45;
  v46 = v6;
  os_unfair_lock_lock_with_options(p_accessLock, 0x10000);
  sub_1000A2E30((uint64_t)v60);
  os_unfair_lock_unlock(p_accessLock);
  v47 = v62;
  v48 = v45;

  return v48;
}

- (id)itemsOfInterest
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  BKLibraryItemStateProvider *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10004E350;
  v15 = sub_10004E228;
  v16 = 0;
  p_accessLock = &self->_accessLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v7 = sub_1000A2FA4;
  v8 = &unk_1008E75B8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock_with_options(p_accessLock, 0x10000);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_accessLock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v4;
}

- (id)itemStateWithIdentifier:(id)a3
{
  id v4;
  _QWORD *v5;
  unsigned int v6;
  BKLibraryManager *libraryManager;
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

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10004E350;
  v17 = sub_10004E228;
  v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A3108;
  v10[3] = &unk_1008E8BC0;
  v12 = &v13;
  v10[4] = self;
  v4 = a3;
  v11 = v4;
  v5 = objc_retainBlock(v10);
  v6 = +[NSThread isMainThread](NSThread, "isMainThread");
  libraryManager = self->_libraryManager;
  if (v6)
    -[BKLibraryManager performBlockInUIContext:](libraryManager, "performBlockInUIContext:", v5);
  else
    -[BKLibraryManager performBackgroundReadOnlyBlockAndWait:](libraryManager, "performBackgroundReadOnlyBlockAndWait:", v5);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)updateStateToPurchasingForIdentifier:(id)a3
{
  id v4;
  BKLibraryManager *libraryManager;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  libraryManager = self->_libraryManager;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A3234;
  v7[3] = &unk_1008E8398;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[BKLibraryManager performBlockOnWorkerQueue:](libraryManager, "performBlockOnWorkerQueue:", v7);

}

- (void)updateStateToPurchaseFailedForIdentifier:(id)a3
{
  id v4;
  BKLibraryManager *libraryManager;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  libraryManager = self->_libraryManager;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A3344;
  v7[3] = &unk_1008E8398;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[BKLibraryManager performBlockOnWorkerQueue:](libraryManager, "performBlockOnWorkerQueue:", v7);

}

- (void)updateStateToDownloadFailedForIdentifier:(id)a3
{
  id v4;
  BKLibraryManager *libraryManager;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  libraryManager = self->_libraryManager;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A3454;
  v7[3] = &unk_1008E8398;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[BKLibraryManager performBlockOnWorkerQueue:](libraryManager, "performBlockOnWorkerQueue:", v7);

}

- (BOOL)_updateItemStateFieldsFromMediaLibrary:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  BOOL v52;
  uint64_t v53;
  uint64_t v54;
  void *v56;
  void *v57;
  void *v58;
  id obj;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v71;
  uint64_t v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  _BOOL4 v84;
  __int16 v85;
  int v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _QWORD v89[2];

  v71 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "itemIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery bk_audiobooksQuery](MPMediaQuery, "bk_audiobooksQuery"));
  if (v4 && objc_msgSend(v3, "length"))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v3, MPMediaItemPropertyStorePlaylistID));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v3, MPMediaItemPropertyStoreID));
    v57 = (void *)v5;
    v89[0] = v5;
    v89[1] = v56;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v89, 2));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaCompoundAnyPredicate predicateMatchingPredicates:](MPMediaCompoundAnyPredicate, "predicateMatchingPredicates:", v6));
    objc_msgSend(v4, "addFilterPredicate:", v7);

    objc_msgSend(v4, "setGroupingType:", 1);
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v58 = v4;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collections"));
    v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
    v8 = 0;
    if (v61)
    {
      v60 = *(_QWORD *)v80;
      v69 = MPMediaItemPropertyStoreFamilyAccountID;
      v68 = MPMediaItemPropertyStoreDownloaderAccountID;
      v67 = MPMediaItemPropertyStoreAccountID;
      v64 = MPMediaItemPropertyIsLocal;
      v63 = MPMediaItemPropertyHLSPlaylistURL;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v80 != v60)
            objc_enumerationMutation(obj);
          v62 = v9;
          v10 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v9);
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          v78 = 0u;
          v74 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "items"));
          v11 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
          if (v11)
          {
            v12 = v11;
            v66 = 0;
            v65 = 0;
            v13 = *(_QWORD *)v76;
            v72 = *(_QWORD *)v76;
            do
            {
              v14 = 0;
              v73 = v12;
              do
              {
                if (*(_QWORD *)v76 != v13)
                  objc_enumerationMutation(v74);
                v15 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)v14);
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bk_storeID"));
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringValue"));
                v18 = objc_msgSend(v3, "isEqualToString:", v17);

                if (v18)
                {
                  v19 = v3;
                  v20 = objc_opt_class(NSNumber);
                  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForProperty:", MPMediaItemPropertyIsCloudItem));
                  v22 = BUDynamicCast(v20, v21);
                  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

                  v24 = objc_opt_class(NSNumber);
                  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForProperty:", v69));
                  v26 = BUDynamicCast(v24, v25);
                  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

                  v28 = objc_opt_class(NSNumber);
                  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForProperty:", v68));
                  v30 = BUDynamicCast(v28, v29);
                  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

                  v32 = objc_opt_class(NSNumber);
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForProperty:", v67));
                  v34 = BUDynamicCast(v32, v33);
                  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

                  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryItemStateProvider libraryManager](self, "libraryManager"));
                  v37 = objc_msgSend(v36, "isFamilyPurchaseWithFamilyID:purchaserDSID:downloaderDSID:", v27, v35, v31);

                  if (objc_msgSend(v23, "BOOLValue"))
                  {
                    v38 = objc_opt_class(NSString);
                    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForProperty:", v63));
                    v40 = BUDynamicCast(v38, v39);
                    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

                    v42 = objc_msgSend(v41, "length");
                    v43 = BLAudiobookStreamingEnabled();
                    if (v42)
                      v45 = v43;
                    else
                      v45 = 0;
                    LOBYTE(v66) = v45;
                    v46 = BKLibraryItemStateProviderLog(v43, v44);
                    v47 = objc_claimAutoreleasedReturnValue(v46);
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 67109376;
                      v84 = v42 != 0;
                      v85 = 1024;
                      v86 = (int)v37;
                      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Found a cloud audiobook media item with a valid playlist? %d, is family? %d.", buf, 0xEu);
                    }
                  }
                  else
                  {
                    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForProperty:", v64));
                    v48 = objc_msgSend(v41, "BOOLValue");
                    BYTE4(v66) = v48 ^ 1;
                    v50 = BKLibraryItemStateProviderLog(v48, v49);
                    v47 = objc_claimAutoreleasedReturnValue(v50);
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                    {
                      v51 = objc_msgSend(v41, "BOOLValue");
                      *(_DWORD *)buf = 67109376;
                      v84 = v51;
                      v85 = 1024;
                      v86 = (int)v37;
                      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Found a non-cloud audiobook media item that is local? %d, is family? %d.", buf, 0xEu);
                    }
                    v65 = 1;
                  }
                  v3 = v19;

                  objc_msgSend(v71, "setFamilyPurchase:", v37);
                  v8 = 1;
                  v13 = v72;
                  v12 = v73;
                }
                v14 = (char *)v14 + 1;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
            }
            while (v12);
          }
          else
          {
            v66 = 0;
            v65 = 0;
          }

          if ((v8 & 1) != 0)
          {
            objc_msgSend(v71, "setStreamable:", v66 & 1);
            v53 = 1;
            if ((v66 & 0x100000000) == 0)
              v53 = 2;
            if ((v65 & 1) != 0)
              v54 = v53;
            else
              v54 = 0;
            objc_msgSend(v71, "setDownload:", v54);
            goto LABEL_39;
          }
          v9 = v62 + 1;
        }
        while ((id)(v62 + 1) != v61);
        v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
        if (v61)
          continue;
        break;
      }
    }
LABEL_39:

    v52 = v8 & 1;
    v4 = v58;
  }
  else
  {
    v52 = 0;
  }

  return v52;
}

- (id)_simulateAssetIDFromItemIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  os_unfair_lock_s *p_accessLock;
  _QWORD *v11;
  id v12;
  _QWORD v14[2];
  void (*v15)(uint64_t);
  void *v16;
  BKLibraryItemStateProvider *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_10004E350;
  v23 = sub_10004E228;
  v5 = objc_opt_class(NSString);
  v6 = BUDynamicCast(v5, v4);
  v24 = (id)objc_claimAutoreleasedReturnValue(v6);
  if (!v20[5] && (objc_opt_respondsToSelector(v4, "stringValue") & 1) != 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
    v8 = (void *)v20[5];
    v20[5] = v7;

  }
  v9 = (void *)v20[5];
  if (!v9)
  {
    p_accessLock = &self->_accessLock;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v15 = sub_1000A3CA0;
    v16 = &unk_1008E76D0;
    v17 = self;
    v18 = &v19;
    v11 = v14;
    os_unfair_lock_lock_with_options(p_accessLock, 0x10000);
    v15((uint64_t)v11);
    os_unfair_lock_unlock(p_accessLock);

    v9 = (void *)v20[5];
  }
  v12 = v9;
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (void)_simulatedUpdateItems:(id)a3
{
  id v4;
  BKLibraryManager *libraryManager;
  id v6;
  _QWORD v7[4];
  id v8;
  BKLibraryItemStateProvider *v9;

  v4 = a3;
  libraryManager = self->_libraryManager;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A3D78;
  v7[3] = &unk_1008E8398;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[BKLibraryManager performBlockOnWorkerQueue:](libraryManager, "performBlockOnWorkerQueue:", v7);

}

- (void)simulateLibrary:(id)a3 :(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryItemStateProvider _simulateAssetIDFromItemIdentifier:](self, "_simulateAssetIDFromItemIdentifier:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10092F3B8, "objectForKeyedSubscript:", v6));

  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  if (v7)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000A4014;
    v12[3] = &unk_1008E8BE8;
    v12[4] = self;
    v14 = v9;
    v10 = v7;
    v13 = v10;
    os_unfair_lock_lock_with_options(&self->_accessLock, 0x10000);
    sub_1000A4014(v12);
    os_unfair_lock_unlock(&self->_accessLock);
    v15 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    -[BKLibraryItemStateProvider _simulatedUpdateItems:](self, "_simulatedUpdateItems:", v11);

  }
}

- (void)simulateDownload:(id)a3 :(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryItemStateProvider _simulateAssetIDFromItemIdentifier:](self, "_simulateAssetIDFromItemIdentifier:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10092F3E0, "objectForKeyedSubscript:", v6));

  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  if (v7)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000A41DC;
    v12[3] = &unk_1008E8BE8;
    v12[4] = self;
    v14 = v9;
    v10 = v7;
    v13 = v10;
    os_unfair_lock_lock_with_options(&self->_accessLock, 0x10000);
    sub_1000A41DC(v12);
    os_unfair_lock_unlock(&self->_accessLock);
    v15 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    -[BKLibraryItemStateProvider _simulatedUpdateItems:](self, "_simulatedUpdateItems:", v11);

  }
}

- (void)simulateClear:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  BKLibraryItemStateProvider *v12;
  id v13;
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryItemStateProvider _simulateAssetIDFromItemIdentifier:](self, "_simulateAssetIDFromItemIdentifier:", a3));
  v5 = v4;
  if (v4)
  {
    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_1000A4360;
    v11 = &unk_1008E7338;
    v12 = self;
    v6 = v4;
    v13 = v6;
    os_unfair_lock_lock_with_options(&self->_accessLock, 0x10000);
    sub_1000A4360((uint64_t)&v8);
    os_unfair_lock_unlock(&self->_accessLock);
    v14 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1, v8, v9));
    -[BKLibraryItemStateProvider _simulatedUpdateItems:](self, "_simulatedUpdateItems:", v7);

  }
}

- (void)simulateClearAll
{
  _QWORD *v3;
  void *v4;
  _QWORD v5[2];
  void (*v6)(uint64_t);
  void *v7;
  BKLibraryItemStateProvider *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  NSMutableSet *v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10004E350;
  v14 = sub_10004E228;
  v15 = objc_opt_new(NSMutableSet);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v6 = sub_1000A44F4;
  v7 = &unk_1008E75B8;
  v8 = self;
  v9 = &v10;
  v3 = v5;
  os_unfair_lock_lock_with_options(&self->_accessLock, 0x10000);
  v6((uint64_t)v3);
  os_unfair_lock_unlock(&self->_accessLock);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v11[5], "allObjects"));
  -[BKLibraryItemStateProvider _simulatedUpdateItems:](self, "_simulatedUpdateItems:", v4);

  _Block_object_dispose(&v10, 8);
}

- (void)downloadQueue:(id)a3 purchaseAttemptForRequest:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "storeIdentifier", a3));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));

  if (v7)
  {
    -[BKLibraryItemStateProvider updateStateToPurchasingForIdentifier:](self, "updateStateToPurchasingForIdentifier:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryItemStateProvider storeIDsPurchasing](self, "storeIDsPurchasing"));
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v7 = a4;
  v8 = a5;
  if (v8)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v7);
          -[BKLibraryItemStateProvider _handleDownloadError:downloadStatus:](self, "_handleDownloadError:downloadStatus:", v8, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12));
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }
  }

}

- (void)_handleDownloadError:(id)a3 downloadStatus:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storePlaylistID"));
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storeID"));
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
  if (v9)
  {
    -[BKLibraryItemStateProvider updateStateToDownloadFailedForIdentifier:](self, "updateStateToDownloadFailedForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryItemStateProvider storeIDsPurchasing](self, "storeIDsPurchasing"));
    objc_msgSend(v10, "removeObject:", v9);

  }
}

- (BKLibraryManager)libraryManager
{
  return self->_libraryManager;
}

- (void)setStoreIDsPurchasing:(id)a3
{
  objc_storeStrong((id *)&self->_storeIDsPurchasing, a3);
}

- (id)purchaseObserver
{
  return self->_purchaseObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_purchaseObserver, 0);
  objc_storeStrong((id *)&self->_storeIDsPurchasing, 0);
  objc_storeStrong((id *)&self->_libraryManager, 0);
  objc_storeStrong((id *)&self->_stateCenter, 0);
  objc_storeStrong((id *)&self->_storeIDsWithAvailableUpdates, 0);
  objc_storeStrong((id *)&self->_audiobookStatusMap, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_simulatedDownload, 0);
  objc_storeStrong((id *)&self->_simulatedLibrary, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
}

@end
