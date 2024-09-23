@implementation BKMediaLibraryCache

- (BKMediaLibraryCache)init
{
  BKMediaLibraryCache *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v7;
  NSHashTable *observers;
  BKMediaLibraryAssetCache *v9;
  BKMediaLibraryAssetCache *cloudAssetCache;
  BKMediaLibraryAssetCache *v11;
  BKMediaLibraryAssetCache *localAssetCache;
  BKMediaLibraryBookletAssetCache *v13;
  BKMediaLibraryBookletAssetCache *bookletAssetCache;
  id v15;
  BUCoalescingCallBlock *v16;
  BUCoalescingCallBlock *coalescedReload;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD block[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)BKMediaLibraryCache;
  v2 = -[BKMediaLibraryCache init](&v30, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.BKMediaLibraryCache.dispatchQueue", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v7;

    v9 = -[BKMediaLibraryAssetCache initWithDataSourceIdentifier:]([BKMediaLibraryAssetCache alloc], "initWithDataSourceIdentifier:", CFSTR("com.apple.ibooks.datasource.audiobooks.cloud"));
    cloudAssetCache = v2->_cloudAssetCache;
    v2->_cloudAssetCache = v9;

    v11 = -[BKMediaLibraryAssetCache initWithDataSourceIdentifier:]([BKMediaLibraryAssetCache alloc], "initWithDataSourceIdentifier:", CFSTR("com.apple.ibooks.datasource.audiobooks"));
    localAssetCache = v2->_localAssetCache;
    v2->_localAssetCache = v11;

    v13 = objc_alloc_init(BKMediaLibraryBookletAssetCache);
    bookletAssetCache = v2->_bookletAssetCache;
    v2->_bookletAssetCache = v13;

    objc_initWeak(&location, v2);
    v15 = objc_alloc((Class)BUCoalescingCallBlock);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100189760;
    v27[3] = &unk_1008E8718;
    objc_copyWeak(&v28, &location);
    v16 = (BUCoalescingCallBlock *)objc_msgSend(v15, "initWithNotifyBlock:blockDescription:", v27, CFSTR("BKMediaLibraryCache"));
    coalescedReload = v2->_coalescedReload;
    v2->_coalescedReload = v16;

    -[BUCoalescingCallBlock setCoalescingDelay:](v2->_coalescedReload, "setCoalescingDelay:", 10.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &off_10092EEF8, MPMediaItemPropertyMediaType));
    objc_msgSend(v18, "addLibraryFilterPredicate:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    +[MPMediaLibrary setRunLoopForNotifications:](MPMediaLibrary, "setRunLoopForNotifications:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v21, "addObserver:selector:name:object:", v2, "_mediaLibraryDidChange:", MPMediaLibraryDidChangeNotification, 0);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
    objc_msgSend(v22, "beginGeneratingLibraryChangeNotifications");

    v23 = v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001897A8;
    block[3] = &unk_1008E74C8;
    objc_copyWeak(&v26, &location);
    dispatch_async(v23, block);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dq_performInitialFetch
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  uint64_t v21;
  void *v22;
  _UNKNOWN **v23;
  _UNKNOWN **v24;
  void *v25;
  id v26;
  BKAudiobookCollection *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  uint64_t v36;
  BKMediaLibraryCache *v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];

  v3 = kdebug_trace(725353716, 50, 0, 0, 0);
  v4 = BKLibraryDataSourceMediaLibraryLog(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1006A3204(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_syncValidity"));
  -[BKMediaLibraryCache _recordSyncValidity:](self, "_recordSyncValidity:", v7);
  -[BKMediaLibraryCache dq_uncacheAllAssets](self, "dq_uncacheAllAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery bk_audiobooksQuery](MPMediaQuery, "bk_audiobooksQuery"));
  objc_msgSend(v8, "setIgnoreSystemFilterPredicates:", 1);
  if (v8)
  {
    v33 = v7;
    v34 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
    objc_msgSend(v8, "setGroupingType:", 1);
    v31 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v9, "currentEntityRevision")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));

    v32 = v8;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collections"));
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v38)
    {
      v36 = *(_QWORD *)v45;
      v37 = self;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v45 != v36)
            objc_enumerationMutation(obj);
          v39 = v11;
          v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary", v30));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bk_items"));
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v41;
            do
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(_QWORD *)v41 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
                v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bk_storeID"));
                v22 = (void *)v21;
                v23 = &off_10092EF10;
                if (v21)
                  v23 = (_UNKNOWN **)v21;
                v24 = v23;

                if (objc_msgSend(v20, "bk_isJaliscoAsset"))
                  v25 = v13;
                else
                  v25 = v14;
                v26 = v25;
                v27 = (BKAudiobookCollection *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v24));
                if (!v27)
                {
                  v27 = -[BKAudiobookCollection initWithStoreID:]([BKAudiobookCollection alloc], "initWithStoreID:", v24);
                  objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, v24);
                }
                -[BKAudiobookCollection addItem:](v27, "addItem:", v20);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            }
            while (v17);
          }

          self = v37;
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache cloudAssetCache](v37, "cloudAssetCache"));
          -[BKMediaLibraryCache dq_cacheAssetsFromSubCollection:assetCache:includeBooklets:](v37, "dq_cacheAssetsFromSubCollection:assetCache:includeBooklets:", v13, v28, 1);

          v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache localAssetCache](v37, "localAssetCache"));
          -[BKMediaLibraryCache dq_cacheAssetsFromSubCollection:assetCache:includeBooklets:](v37, "dq_cacheAssetsFromSubCollection:assetCache:includeBooklets:", v14, v29, 0);

          v11 = v39 + 1;
        }
        while ((id)(v39 + 1) != v38);
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v38);
    }

    v7 = v33;
    v6 = v34;
    v8 = v32;
    if (v30)
    {
      -[BKMediaLibraryCache _recordSyncAnchor:](self, "_recordSyncAnchor:", v30);

    }
  }
  kdebug_trace(725353716, 51, 0, 0, 0);

}

- (void)dq_uncacheAllAssets
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache localAssetCache](self, "localAssetCache"));
  objc_msgSend(v3, "uncacheAllAssets");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache cloudAssetCache](self, "cloudAssetCache"));
  objc_msgSend(v4, "uncacheAllAssets");

}

- (id)_calcSyncAnchor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  __CFString *v9;
  uint64_t v11;
  NSObject *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache _syncValidity](self, "_syncValidity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_syncValidity"));
  v6 = v5;
  if (v4 && v5 && !objc_msgSend(v5, "compare:", v4))
  {
    v11 = BKLibraryDataSourceMediaLibraryLog(0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1006A36EC();

    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache _syncAnchor](self, "_syncAnchor"));
  }
  else
  {
    -[BKMediaLibraryCache _recordSyncValidity:](self, "_recordSyncValidity:", v6);
    v7 = BKLibraryDataSourceMediaLibraryLog(-[BKMediaLibraryCache _recordSyncAnchor:](self, "_recordSyncAnchor:", CFSTR("0")));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_1006A375C();

    v9 = CFSTR("0");
  }

  return v9;
}

- (id)_syncValidity
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringForKey:", CFSTR("LibraryDataSourceMediaLibrary.SyncValidity")));

  return v3;
}

- (id)_syncAnchor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringForKey:", CFSTR("LibraryDataSourceMediaLibrary.SyncAnchor")));

  return v3;
}

- (void)dq_processChangesSince:(id)a3 completion:(id)a4
{
  uint64_t v6;
  NSObject *v7;
  BKMediaLibraryChangeCollector *v8;
  void *v9;
  BKMediaLibraryChangeCollector *v10;
  BKMediaLibraryChangeCollector *v11;
  void *v12;
  BKMediaLibraryChangeCollector *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  id v25;
  void *k;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *m;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];
  id v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];

  v40 = a3;
  v39 = a4;
  v6 = BKLibraryDataSourceMediaLibraryLog(v39);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1006A3244();

  v8 = [BKMediaLibraryChangeCollector alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache cloudAssetCache](self, "cloudAssetCache"));
  v10 = -[BKMediaLibraryChangeCollector initWithAssetCache:](v8, "initWithAssetCache:", v9);

  v11 = [BKMediaLibraryChangeCollector alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache localAssetCache](self, "localAssetCache"));
  v13 = -[BKMediaLibraryChangeCollector initWithAssetCache:](v11, "initWithAssetCache:", v12);

  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = sub_10004E4A8;
  v69 = sub_10004E2C8;
  v70 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10018B704;
  v62[3] = &unk_1008ED6C0;
  v62[4] = self;
  v17 = v14;
  v63 = v17;
  v64 = &v65;
  objc_msgSend(v16, "enumerateEntityChangesAfterSyncAnchor:usingBlock:", v40, v62);
  v37 = v16;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v17;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v59 != v19)
          objc_enumerationMutation(obj);
        -[BKMediaLibraryCache dq_processEntity:cloudChangeCollector:localChangeCollector:](self, "dq_processEntity:cloudChangeCollector:localChangeCollector:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i), v10, v13);
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
    }
    while (v18);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v44 = v15;
  v21 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v55 != v22)
          objc_enumerationMutation(v44);
        -[BKMediaLibraryCache dq_processEntity:cloudChangeCollector:localChangeCollector:](self, "dq_processEntity:cloudChangeCollector:localChangeCollector:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)j), v10, v13);
      }
      v21 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
    }
    while (v21);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery bk_audiobooksQuery](MPMediaQuery, "bk_audiobooksQuery"));
  objc_msgSend(v24, "setIgnoreSystemFilterPredicates:", 1);
  v38 = v24;
  if (v24)
  {
    objc_msgSend(v24, "setGroupingType:", 1);
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v41 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "collections"));
    v25 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v50, v72, 16);
    if (v25)
    {
      v42 = *(_QWORD *)v51;
      do
      {
        v43 = v25;
        for (k = 0; k != v43; k = (char *)k + 1)
        {
          if (*(_QWORD *)v51 != v42)
            objc_enumerationMutation(v41);
          v27 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)k);
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "items"));
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v71, 16);
          if (v29)
          {
            v30 = *(_QWORD *)v47;
            do
            {
              for (m = 0; m != v29; m = (char *)m + 1)
              {
                if (*(_QWORD *)v47 != v30)
                  objc_enumerationMutation(v28);
                v32 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)m);
                v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache _cacheID:](self, "_cacheID:", v32));
                if (objc_msgSend(v32, "bk_isJaliscoAsset"))
                  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryChangeCollector afterChangesCacheIDSet](v10, "afterChangesCacheIDSet"));
                else
                  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryChangeCollector afterChangesCacheIDSet](v13, "afterChangesCacheIDSet"));
                objc_msgSend(v34, "addObject:", v33);

              }
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v71, 16);
            }
            while (v29);
          }

        }
        v25 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v50, v72, 16);
      }
      while (v25);
    }

    -[BKMediaLibraryChangeCollector finalizeChangeProcessing](v10, "finalizeChangeProcessing");
    -[BKMediaLibraryChangeCollector finalizeChangeProcessing](v13, "finalizeChangeProcessing");

  }
  if (v66[5])
    -[BKMediaLibraryCache _recordSyncAnchor:](self, "_recordSyncAnchor:");
  v35 = objc_retainBlock(v39);
  v36 = v35;
  if (v35)
    (*((void (**)(id, BKMediaLibraryChangeCollector *, BKMediaLibraryChangeCollector *, _QWORD))v35 + 2))(v35, v10, v13, 0);

  _Block_object_dispose(&v65, 8);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (BKMediaLibraryAssetCache)localAssetCache
{
  return self->_localAssetCache;
}

- (BKMediaLibraryAssetCache)cloudAssetCache
{
  return self->_cloudAssetCache;
}

- (void)_mediaLibraryDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache dispatchQueue](self, "dispatchQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057A30;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache dispatchQueue](self, "dispatchQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100010B20;
    v6[3] = &unk_1008E7338;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_recordSyncValidity:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;

  v3 = a3;
  v4 = BKLibraryDataSourceMediaLibraryLog(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1006A368C();

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "setObject:forKey:", v3, CFSTR("LibraryDataSourceMediaLibrary.SyncValidity"));

}

- (void)_recordSyncAnchor:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;

  v3 = a3;
  v4 = BKLibraryDataSourceMediaLibraryLog(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1006A362C();

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "setObject:forKey:", v3, CFSTR("LibraryDataSourceMediaLibrary.SyncAnchor"));

}

+ (BKMediaLibraryCache)sharedCache
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018973C;
  block[3] = &unk_1008E7458;
  block[4] = a1;
  if (qword_1009F5170 != -1)
    dispatch_once(&qword_1009F5170, block);
  return (BKMediaLibraryCache *)(id)qword_1009F5168;
}

- (id)_assetCacheForType:(unint64_t)a3
{
  void *v3;

  if (a3 == 1)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache cloudAssetCache](self, "cloudAssetCache"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache localAssetCache](self, "localAssetCache"));
  return v3;
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache dispatchQueue](self, "dispatchQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10018989C;
    v6[3] = &unk_1008E7338;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (void)fetchAssetIDsOfType:(unint64_t)a3 completion:(id)a4
{
  -[BKMediaLibraryCache fetchAssetIDsOfType:includeBooklets:completion:](self, "fetchAssetIDsOfType:includeBooklets:completion:", a3, 0, a4);
}

- (void)fetchAssetIDsOfType:(unint64_t)a3 includeBooklets:(BOOL)a4 completion:(id)a5
{
  id v8;
  NSObject *dispatchQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  BOOL v14;

  v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001899BC;
  v11[3] = &unk_1008ED620;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v10 = v8;
  dispatch_async(dispatchQueue, v11);

}

- (id)allBookletAssetIDs
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache bookletAssetCache](self, "bookletAssetCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allBookletAssetIDs"));

  return v3;
}

- (void)fetchAssetsWithIDs:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100189BA8;
  v13[3] = &unk_1008EABA8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

- (void)fetchAssetsWithIDs:(id)a3 type:(unint64_t)a4 includeBooklets:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *dispatchQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  unint64_t v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100189CDC;
  block[3] = &unk_1008ED648;
  block[4] = self;
  v16 = v10;
  v19 = a5;
  v17 = v11;
  v18 = a4;
  v13 = v11;
  v14 = v10;
  dispatch_async(dispatchQueue, block);

}

- (void)fetchAssetsOfType:(unint64_t)a3 includeBooklets:(BOOL)a4 completion:(id)a5
{
  id v8;
  NSObject *dispatchQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  BOOL v14;

  v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100189FC0;
  v11[3] = &unk_1008ED620;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v10 = v8;
  dispatch_async(dispatchQueue, v11);

}

- (void)fetchAssetsOfType:(unint64_t)a3 completion:(id)a4
{
  -[BKMediaLibraryCache fetchAssetIDsOfType:includeBooklets:completion:](self, "fetchAssetIDsOfType:includeBooklets:completion:", a3, 0, a4);
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10018A180;
  v13[3] = &unk_1008EABA8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

- (void)deleteAssets:(id)a3 type:(unint64_t)a4 exhaustive:(BOOL)a5 completion:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *dispatchQueue;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  unint64_t v22;
  BOOL v23;

  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", CFSTR("assetID")));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bu_arrayByRemovingNSNulls"));
  v13 = (void *)v12;
  v14 = &__NSArray0__struct;
  if (v12)
    v14 = (void *)v12;
  v15 = v14;

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018A2C8;
  block[3] = &unk_1008ED648;
  block[4] = self;
  v20 = v15;
  v23 = a5;
  v21 = v10;
  v22 = a4;
  v17 = v10;
  v18 = v15;
  dispatch_async(dispatchQueue, block);

}

- (void)assetForLibraryAsset:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  unsigned __int8 v15;
  NSObject *dispatchQueue;
  __CFString *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  __CFString *v22;
  id v23;
  unint64_t v24;
  unsigned __int8 v25;

  v8 = a5;
  v9 = a3;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetID"));
  v11 = (void *)v10;
  v12 = &stru_10091C438;
  if (v10)
    v12 = (__CFString *)v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeID"));
  v15 = objc_msgSend(v9, "isSupplementalContent");

  dispatchQueue = self->_dispatchQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10018A434;
  v20[3] = &unk_1008ED670;
  v25 = v15;
  v20[4] = self;
  v21 = v14;
  v23 = v8;
  v24 = a4;
  v22 = v13;
  v17 = v13;
  v18 = v8;
  v19 = v14;
  dispatch_async(dispatchQueue, v20);

}

- (void)_notifyObserversOfReload:(id)a3
{
  id v4;
  dispatch_group_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[5];
  dispatch_group_t v13;

  v4 = a3;
  v5 = dispatch_group_create();
  v6 = objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018A5D4;
  block[3] = &unk_1008E7338;
  block[4] = self;
  v13 = v5;
  v7 = v5;
  dispatch_async(v6, block);

  v8 = objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache dispatchQueue](self, "dispatchQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10018A734;
  v10[3] = &unk_1008E7818;
  v11 = v4;
  v9 = v4;
  dispatch_group_notify(v7, v8, v10);

}

- (void)dq_cacheAssetsFromSubCollection:(id)a3 assetCache:(id)a4 includeBooklets:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  id v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  uint64_t v67;
  _BYTE v68[128];

  v5 = a5;
  v8 = a4;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allValues"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v56;
    v47 = MPMediaItemPropertyBooklets;
    *(_QWORD *)&v11 = 138412290;
    v42 = v11;
    v46 = *(_QWORD *)v56;
    v45 = v5;
    v44 = v9;
    do
    {
      v14 = 0;
      v48 = v12;
      do
      {
        if (*(_QWORD *)v56 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "items", v42));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));

        v18 = objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache _cacheID:](self, "_cacheID:", v17));
        v19 = (void *)v18;
        if (v18)
        {
          v49 = (void *)v18;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "items"));
          v21 = -[BKMediaLibraryCache _processAudiobookCollection:fromMediaLibraryChangedNotification:](self, "_processAudiobookCollection:fromMediaLibraryChangedNotification:", v20, 0);

          v50 = v17;
          if (v21)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataSourceIdentifier"));
            v24 = +[BKMediaLibraryAsset newAssetFromRepresentativeMediaItem:withDataSourceIdentifier:](BKMediaLibraryAsset, "newAssetFromRepresentativeMediaItem:withDataSourceIdentifier:", v17, v23);

            v26 = BKLibraryDataSourceMediaLibraryLog(v25);
            v27 = objc_claimAutoreleasedReturnValue(v26);
            v28 = v27;
            if (v24)
            {
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject assetID](v24, "assetID"));
                v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject title](v24, "title"));
                v40 = objc_claimAutoreleasedReturnValue(-[NSObject dataSourceIdentifier](v24, "dataSourceIdentifier"));
                *(_DWORD *)buf = 138413058;
                v61 = v49;
                v62 = 2112;
                v63 = v43;
                v64 = 2112;
                v65 = v39;
                v66 = 2112;
                v67 = v40;
                v41 = (void *)v40;
                _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "item added on fetch (cacheID: %@, assetID: %@, title: %@ ds:%@)", buf, 0x2Au);

                v12 = v48;
              }

              v19 = v49;
              -[BKMediaLibraryCache dq_cacheAsset:cacheID:](self, "dq_cacheAsset:cacheID:", v24, v49);
              if (v5)
              {
                v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "valueForProperty:", v47));
                v51 = 0u;
                v52 = 0u;
                v53 = 0u;
                v54 = 0u;
                v29 = -[NSObject countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
                if (v29)
                {
                  v30 = v29;
                  v31 = *(_QWORD *)v52;
                  do
                  {
                    for (i = 0; i != v30; i = (char *)i + 1)
                    {
                      if (*(_QWORD *)v52 != v31)
                        objc_enumerationMutation(v28);
                      v33 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
                      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataSourceIdentifier"));
                      -[BKMediaLibraryCache dq_processAndCacheBookletItem:parentItem:dataSourceIdentifier:](self, "dq_processAndCacheBookletItem:parentItem:dataSourceIdentifier:", v33, v24, v34);

                    }
                    v30 = -[NSObject countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
                  }
                  while (v30);
                  v5 = v45;
                  v9 = v44;
                  v13 = v46;
                  v12 = v48;
                }
                goto LABEL_24;
              }
LABEL_26:

              v17 = v50;
              goto LABEL_27;
            }
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v42;
              v61 = v49;
              _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Unable to create asset for (cacheID: %@)", buf, 0xCu);
            }
LABEL_24:

          }
          else
          {
            v35 = BKLibraryDataSourceMediaLibraryLog(v22);
            v24 = objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "bk_assetID"));
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "albumTitle"));
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataSourceIdentifier"));
              *(_DWORD *)buf = 138413058;
              v19 = v49;
              v61 = v49;
              v62 = 2112;
              v63 = v36;
              v64 = 2112;
              v65 = v37;
              v66 = 2112;
              v67 = (uint64_t)v38;
              _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Skipping partial asset that is not entirely local (cacheID: %@, assetID: %@, title: %@ ds:%@)", buf, 0x2Au);

              v13 = v46;
              v12 = v48;
              goto LABEL_26;
            }
          }
          v19 = v49;
          goto LABEL_26;
        }
LABEL_27:

        v14 = (char *)v14 + 1;
      }
      while (v14 != v12);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    }
    while (v12);
  }

}

- (void)dq_processAndCacheBookletItem:(id)a3 parentItem:(id)a4 dataSourceIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BKLibrarySupplementalAsset *v12;
  void *v13;
  void *v14;
  void *v15;
  BKLibrarySupplementalAsset *v16;
  void *v17;
  id v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v10, "storeItemID")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v10, "fileSize")));
  v12 = [BKLibrarySupplementalAsset alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "redownloadParams"));

  v16 = -[BKLibrarySupplementalAsset initWithParentAsset:dataSourceIdentifier:storeID:title:downloadParams:size:](v12, "initWithParentAsset:dataSourceIdentifier:storeID:title:downloadParams:size:", v9, v8, v13, v14, v15, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache bookletAssetCache](self, "bookletAssetCache"));
  objc_msgSend(v17, "addBookletAsset:", v16);

}

- (void)dq_processEntity:(id)a3 cloudChangeCollector:(id)a4 localChangeCollector:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL4 v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  _BOOL4 v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entity"));
  v12 = objc_opt_class(MPMediaItemCollection);
  v13 = BUDynamicCast(v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = objc_opt_class(MPMediaItem);
  v16 = BUDynamicCast(v15, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v14)
    v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "representativeItem"));
  else
    v19 = v17;
  v20 = v19;
  if (v19)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache _cacheID:](self, "_cacheID:", v19));
    if (objc_msgSend(v20, "bk_isJaliscoAsset"))
      v22 = v9;
    else
      v22 = v10;
    v23 = v22;
    if (!objc_msgSend(v21, "longLongValue"))
    {
      v30 = BKLibraryDataSourceMediaLibraryLog(0);
      v29 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_1006A32A4(v29);
      goto LABEL_26;
    }
    v50 = objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache dq_assetFromCacheID:cloudAsset:](self, "dq_assetFromCacheID:cloudAsset:", v21, objc_msgSend(v20, "bk_isJaliscoAsset")));
    v51 = v23;
    if (objc_msgSend(v8, "deletionType"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "updated"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v21));

      if (v25)
      {
        v27 = BKLibraryDataSourceMediaLibraryLog(v26);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        v29 = v50;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          sub_1006A35CC();
      }
      else
      {
        v34 = BKLibraryDataSourceMediaLibraryLog(v26);
        v28 = objc_claimAutoreleasedReturnValue(v34);
        v35 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
        v29 = v50;
        if (v50)
        {
          if (v35)
            sub_1006A3538();

          v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "updated"));
          -[NSObject setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v50, v21);
        }
        else if (v35)
        {
          sub_1006A34D8();
        }
      }
      goto LABEL_25;
    }
    v49 = v9;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "added"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v21));
    if (v32)
    {

    }
    else
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "updated"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", v21));

      if (!v36)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "assetCache"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "dataSourceIdentifier"));
        v28 = +[BKMediaLibraryAsset newAssetFromRepresentativeMediaItem:withDataSourceIdentifier:](BKMediaLibraryAsset, "newAssetFromRepresentativeMediaItem:withDataSourceIdentifier:", v20, v46);

        v9 = v49;
        if (v28)
        {
          v40 = BKLibraryDataSourceMediaLibraryLog(v39);
          v47 = objc_claimAutoreleasedReturnValue(v40);
          v41 = os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG);
          if (v50)
          {
            if (v41)
              sub_1006A33E4();

            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "updated"));
          }
          else
          {
            if (v41)
              sub_1006A3350();

            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "added"));
          }
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v28, v21, v42);

          -[BKMediaLibraryCache dq_cacheAsset:cacheID:](self, "dq_cacheAsset:cacheID:", v28, v21);
        }
        else
        {
          v43 = BKLibraryDataSourceMediaLibraryLog(v39);
          v44 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            sub_1006A32E4();

        }
        goto LABEL_24;
      }
    }
    v37 = BKLibraryDataSourceMediaLibraryLog(v33);
    v28 = objc_claimAutoreleasedReturnValue(v37);
    v9 = v49;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      sub_1006A3478();
LABEL_24:
    v29 = v50;
LABEL_25:

    v23 = v51;
LABEL_26:

  }
}

- (BOOL)_processAudiobookCollection:(id)a3 fromMediaLibraryChangedNotification:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  BOOL v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    v10 = MPMediaItemPropertyIsLocal;
    v11 = !v4;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v13, "bk_isJaliscoAsset", (_QWORD)v21) & 1) == 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForProperty:", v10));
          if (v14)
          {
            v15 = v14;
            v16 = objc_msgSend(v14, "BOOLValue");
            if (((v16 | v11) & 1) == 0)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache coalescedReload](self, "coalescedReload"));
              objc_msgSend(v19, "signalWithCompletion:", &stru_1008ED6E0);

LABEL_14:
              v18 = 0;
              goto LABEL_15;
            }
            v17 = v16;

            if (!v17)
              goto LABEL_14;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_15:

  return v18;
}

- (id)_cacheID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bk_storeID"));
  if (!objc_msgSend(v4, "longLongValue"))
  {
    v5 = objc_opt_class(NSNumber);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForProperty:", MPMediaItemPropertyAlbumPersistentID));
    v7 = BUDynamicCast(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);

    v4 = (void *)v8;
  }

  return v4;
}

- (id)dq_assetFromCacheID:(id)a3 cloudAsset:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (a4)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache cloudAssetCache](self, "cloudAssetCache"));
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache localAssetCache](self, "localAssetCache"));
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetFromCacheID:", v6));

  return v9;
}

- (void)dq_cacheAsset:(id)a3 cacheID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  if ((objc_msgSend(v7, "isCloudAsset") & 1) != 0)
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache cloudAssetCache](self, "cloudAssetCache"));
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache localAssetCache](self, "localAssetCache"));
  v9 = v8;
  objc_msgSend(v8, "cacheAsset:cacheID:", v7, v6);

}

- (void)dq_uncacheAsset:(id)a3 cacheID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  if ((objc_msgSend(v7, "isCloudAsset") & 1) != 0)
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache cloudAssetCache](self, "cloudAssetCache"));
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache localAssetCache](self, "localAssetCache"));
  v9 = v8;
  objc_msgSend(v8, "uncacheAsset:cacheID:", v7, v6);

}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache localAssetCache](self, "localAssetCache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMediaLibraryCache cloudAssetCache](self, "cloudAssetCache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%p) localAudiobookCache=%@ cloudAudiobookCache=%@>"), v5, self, v6, v7));

  return v8;
}

- (void)setLocalAssetCache:(id)a3
{
  objc_storeStrong((id *)&self->_localAssetCache, a3);
}

- (void)setCloudAssetCache:(id)a3
{
  objc_storeStrong((id *)&self->_cloudAssetCache, a3);
}

- (BKMediaLibraryBookletAssetCache)bookletAssetCache
{
  return self->_bookletAssetCache;
}

- (void)setBookletAssetCache:(id)a3
{
  objc_storeStrong((id *)&self->_bookletAssetCache, a3);
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BUCoalescingCallBlock)coalescedReload
{
  return self->_coalescedReload;
}

- (void)setCoalescedReload:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedReload, a3);
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_coalescedReload, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_bookletAssetCache, 0);
  objc_storeStrong((id *)&self->_cloudAssetCache, 0);
  objc_storeStrong((id *)&self->_localAssetCache, 0);
}

@end
