@implementation BKLibraryBookshelfBooksDataSource

- (BKLibraryBookshelfBooksDataSource)initWithSortModeProvider:(id)a3 isSeries:(BOOL)a4 providesReviewData:(BOOL)a5 providesProductInfoData:(BOOL)a6 productInfoFilter:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  BKLibraryBookshelfBooksDataSource *v14;
  void *v15;
  void *v16;
  void *v17;
  dispatch_queue_attr_t v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *extendedDataAccessQueue;
  dispatch_queue_attr_t v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *workerQueue;
  uint64_t v26;
  NSMutableDictionary *assetReviewData;
  uint64_t v28;
  NSMutableSet *checkedAssetIDs;
  uint64_t v30;
  NSMutableSet *checkedProductProfileIDs;
  uint64_t v32;
  NSMutableSet *checkedResourceIDs;
  NSObject *v34;
  void *v35;
  id v36;
  BUCoalescingCallBlock *v37;
  BUCoalescingCallBlock *coalescedReloadData;
  _QWORD v40[4];
  id v41;
  id location;
  _QWORD block[4];
  BKLibraryBookshelfBooksDataSource *v44;
  objc_super v45;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a7;
  kdebug_trace(725353716, 100, 0, 0, 0);
  v45.receiver = self;
  v45.super_class = (Class)BKLibraryBookshelfBooksDataSource;
  v14 = -[BKLibraryBookshelfBooksDataSource init](&v45, "init");
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    -[BKLibraryBookshelfBooksDataSource setLibraryManager:](v14, "setLibraryManager:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", v14, "_BCCloudAssetReviewManagerChanged:", BCCloudAssetReviewManagerChanged, 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "addObserver:selector:name:object:", v14, "_mocWillSave:", NSManagedObjectContextWillSaveNotification, 0);

    objc_storeWeak((id *)&v14->_sortModeProvider, v12);
    v14->_isSeries = a4;
    v14->_providesReviewData = v9;
    v14->_providesProductInfoData = v8;
    objc_storeStrong((id *)&v14->_productInfoFilter, a7);
    if (v9 || v8)
    {
      v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = dispatch_queue_create("BKLibraryBookshelfBooksDataSource.extendedDataAccessQueue.queue", v19);
      extendedDataAccessQueue = v14->_extendedDataAccessQueue;
      v14->_extendedDataAccessQueue = (OS_dispatch_queue *)v20;

      v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      v24 = dispatch_queue_create("BKLibraryBookshelfBooksDataSource.workerQueue.queue", v23);
      workerQueue = v14->_workerQueue;
      v14->_workerQueue = (OS_dispatch_queue *)v24;

    }
    if (v9)
    {
      v26 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      assetReviewData = v14->_assetReviewData;
      v14->_assetReviewData = (NSMutableDictionary *)v26;

      v28 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      checkedAssetIDs = v14->_checkedAssetIDs;
      v14->_checkedAssetIDs = (NSMutableSet *)v28;

      v30 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      checkedProductProfileIDs = v14->_checkedProductProfileIDs;
      v14->_checkedProductProfileIDs = (NSMutableSet *)v30;

      v32 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      checkedResourceIDs = v14->_checkedResourceIDs;
      v14->_checkedResourceIDs = (NSMutableSet *)v32;

    }
    if (v8)
    {
      v34 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource extendedDataAccessQueue](v14, "extendedDataAccessQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100162548;
      block[3] = &unk_1008E72C0;
      v44 = v14;
      dispatch_sync(v34, block);

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("expectedDate"), CFSTR("isSample"), CFSTR("state"), CFSTR("purchasedAndLocalParent"), CFSTR("seriesContainer"), CFSTR("sequenceDisplayName"), 0));
    -[BKLibraryBookshelfBooksDataSource setPropertiesOfInterest:](v14, "setPropertiesOfInterest:", v35);

    objc_initWeak(&location, v14);
    v36 = objc_alloc((Class)BUCoalescingCallBlock);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10016259C;
    v40[3] = &unk_1008E8718;
    objc_copyWeak(&v41, &location);
    v37 = (BUCoalescingCallBlock *)objc_msgSend(v36, "initWithNotifyBlock:blockDescription:", v40, CFSTR("BKLibraryBookshelfBooksDataSource"));
    coalescedReloadData = v14->_coalescedReloadData;
    v14->_coalescedReloadData = v37;

    -[BUCoalescingCallBlock setCoalescingDelay:](v14->_coalescedReloadData, "setCoalescingDelay:", 0.4);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  kdebug_trace(725353716, 101, 0, 0, 0);

  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, BCCloudAssetReviewManagerChanged, 0);

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfBooksDataSource;
  -[BKLibraryBookshelfBooksDataSource dealloc](&v4, "dealloc");
}

- (void)_mocWillSave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  id v26;
  BKLibraryBookshelfBooksDataSource *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v4 = a3;
  v27 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchRequest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entityName"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("BKCollectionMember"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "updatedObjects"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    v12 = v10;
    if (v11)
    {
      v13 = v11;
      v25 = v9;
      v26 = v4;
      v14 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "entity"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
          v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("BKLibraryAsset"));

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "changedValues"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allKeys"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v21));
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource propertiesOfInterest](v27, "propertiesOfInterest"));
            v24 = objc_msgSend(v22, "intersectsSet:", v23);

            if (v24)
            {

              v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource coalescedReloadData](v27, "coalescedReloadData"));
              objc_msgSend(v12, "signalWithCompletion:", &stru_1008EC738);
              goto LABEL_13;
            }
          }
        }
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v13)
          continue;
        break;
      }
      v12 = v10;
LABEL_13:
      v9 = v25;
      v4 = v26;
    }

  }
}

- (BCCloudAssetReviewManager)assetReviewManager
{
  BCCloudAssetReviewManager *assetReviewManager;
  void *v4;

  assetReviewManager = self->_assetReviewManager;
  if (!assetReviewManager)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
    self->_assetReviewManager = (BCCloudAssetReviewManager *)objc_msgSend(v4, "assetReviewManager");

    assetReviewManager = self->_assetReviewManager;
  }
  return assetReviewManager;
}

- (void)_updateHasSeriesSequenceLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchedObjects"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchRequest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entityName"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("BKCollectionMember"));

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKeyPath:", CFSTR("asset")));

    v4 = (void *)v9;
  }
  self->_hasSeriesSequenceLabel = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "sequenceDisplayName", (_QWORD)v16));

        if (v15)
        {
          self->_hasSeriesSequenceLabel = 1;
          goto LABEL_13;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)_loadProductInfoData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, self);
    v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource workerQueue](self, "workerQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100162DD8;
    v9[3] = &unk_1008EC7B0;
    v10 = v6;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    dispatch_async(v8, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)_loadProductInfoData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchedObjects"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource productInfoFilter](self, "productInfoFilter"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entityName"));
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("BKCollectionMember"));

    if (v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKeyPath:", CFSTR("asset")));

      v14 = (id)v9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource productInfoFilter](self, "productInfoFilter"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filteredArrayUsingPredicate:", v10));

    v12 = (void *)v11;
  }
  else
  {
    v12 = v14;
  }
  v15 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForKeyPath:", CFSTR("assetID")));
  -[BKLibraryBookshelfBooksDataSource _loadProductInfoData:completion:](self, "_loadProductInfoData:completion:", v13, 0);

}

- (void)_loadAndCacheResourcesForAssetIDs:(id)a3 audiobookAssetIDs:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001633E4;
  v12[3] = &unk_1008EC7D8;
  objc_copyWeak(&v14, &location);
  v11 = v10;
  v13 = v11;
  -[BKLibraryBookshelfBooksDataSource _loadResourcesForAssetIDs:audiobookAssetIDs:completionHandler:](self, "_loadResourcesForAssetIDs:audiobookAssetIDs:completionHandler:", v8, v9, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_loadAssetData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id location;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchedObjects"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource productInfoFilter](self, "productInfoFilter"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fetchRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "entityName"));
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("BKCollectionMember"));

    if (v9)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKeyPath:", CFSTR("asset")));

      v4 = (void *)v10;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource productInfoFilter](self, "productInfoFilter"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v11));

    v4 = (void *)v12;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = v4;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "assetID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "isStoreAudiobook"));
        v22 = objc_msgSend(v21, "BOOLValue");

        if (v22)
          v23 = v13;
        else
          v23 = v14;
        objc_msgSend(v23, "addObject:", v20);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);
  }

  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1001638C8;
  v24[3] = &unk_1008EC800;
  objc_copyWeak(&v25, &location);
  -[BKLibraryBookshelfBooksDataSource _loadAndCacheResourcesForAssetIDs:audiobookAssetIDs:completionHandler:](self, "_loadAndCacheResourcesForAssetIDs:audiobookAssetIDs:completionHandler:", v14, v13, v24);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

- (void)_loadAssetReviewData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeStoreAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_DSID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fetchedObjects"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKeyPath:", CFSTR("assetID")));

    if (objc_msgSend(v9, "count"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v22;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[BCAssetReview assetReviewIDWithUserID:assetID:](BCAssetReview, "assetReviewIDWithUserID:assetID:", v6, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v14)));
            objc_msgSend(v10, "addObject:", v15);

            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v12);
      }

      objc_initWeak(&location, self);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource assetReviewManager](self, "assetReviewManager"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100163BD0;
      v17[3] = &unk_1008EC828;
      objc_copyWeak(&v19, &location);
      v18 = v11;
      objc_msgSend(v16, "assetReviewsForAssetReviewIDs:completion:", v10, v17);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);

    }
  }

}

- (void)reloadData
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));

  if (!v3)
  {
    v4 = objc_alloc((Class)NSFetchedResultsController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource fetchRequest](self, "fetchRequest"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource libraryManager](self, "libraryManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uiChildContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource sortModeProvider](self, "sortModeProvider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentSortMode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sectionKeyPath"));
    v11 = objc_msgSend(v4, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v5, v7, v10, 0);
    -[BKLibraryBookshelfBooksDataSource setFrc:](self, "setFrc:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
    objc_msgSend(v12, "setDelegate:", self);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
    objc_msgSend(v13, "performFetch:", 0);

    if (-[BKLibraryBookshelfBooksDataSource isSeries](self, "isSeries"))
      -[BKLibraryBookshelfBooksDataSource _updateHasSeriesSequenceLabel](self, "_updateHasSeriesSequenceLabel");
    if (-[BKLibraryBookshelfBooksDataSource providesReviewData](self, "providesReviewData"))
      -[BKLibraryBookshelfBooksDataSource _loadAssetReviewData](self, "_loadAssetReviewData");
    if (-[BKLibraryBookshelfBooksDataSource providesProductInfoData](self, "providesProductInfoData"))
    {
      -[BKLibraryBookshelfBooksDataSource _loadProductInfoData](self, "_loadProductInfoData");
      -[BKLibraryBookshelfBooksDataSource _loadAssetData](self, "_loadAssetData");
    }
  }
}

- (id)productInfoForAssetID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10004E488;
  v16 = sub_10004E2B8;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource extendedDataAccessQueue](self, "extendedDataAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100164178;
  block[3] = &unk_1008E8848;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)cachedResourceForAssetID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10004E488;
  v16 = sub_10004E2B8;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource extendedDataAccessQueue](self, "extendedDataAccessQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100164308;
  block[3] = &unk_1008E8848;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)resourceForAssetID:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;
  _QWORD block[5];
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  id v37;
  id v38;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "length"))
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = sub_10004E488;
    v35 = sub_10004E2B8;
    v36 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v10 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource extendedDataAccessQueue](self, "extendedDataAccessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001646C4;
    block[3] = &unk_1008EAD38;
    v25 = &v31;
    block[4] = self;
    v11 = v8;
    v24 = v11;
    v26 = &v27;
    dispatch_sync(v10, block);

    if (v32[5] || *((_BYTE *)v28 + 24))
    {
      v12 = objc_retainBlock(v9);
      v13 = v12;
      if (v12)
        (*((void (**)(id, id, uint64_t, _QWORD))v12 + 2))(v12, v11, v32[5], 0);

    }
    else
    {
      objc_initWeak(&location, self);
      if (a4 == 1)
      {
        v37 = v11;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
        v16 = &__NSArray0__struct;
      }
      else if (a4)
      {
        v17 = &__NSArray0__struct;
        v16 = &__NSArray0__struct;
      }
      else
      {
        v38 = v11;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
        v17 = &__NSArray0__struct;
      }
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10016476C;
      v18[3] = &unk_1008EC850;
      objc_copyWeak(&v21, &location);
      v20 = v9;
      v19 = v11;
      -[BKLibraryBookshelfBooksDataSource _loadAndCacheResourcesForAssetIDs:audiobookAssetIDs:completionHandler:](self, "_loadAndCacheResourcesForAssetIDs:audiobookAssetIDs:completionHandler:", v16, v17, v18);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);

  }
  else
  {
    v14 = objc_retainBlock(v9);
    v15 = v14;
    if (v14)
      (*((void (**)(id, id, _QWORD, _QWORD))v14 + 2))(v14, v8, 0, 0);

  }
}

- (id)assetReviewForAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v13;
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
  v18 = sub_10004E488;
  v19 = sub_10004E2B8;
  v20 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeStoreAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_DSID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource extendedDataAccessQueue](self, "extendedDataAccessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100164984;
    block[3] = &unk_1008E8848;
    v14 = &v15;
    block[4] = self;
    v13 = v4;
    dispatch_sync(v9, block);

  }
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (id)assetReviewForAssetID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id location;
  _QWORD block[5];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v6 = a3;
  v7 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_10004E488;
  v37 = sub_10004E2B8;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeStoreAccount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ams_DSID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));

  if (v11)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource extendedDataAccessQueue](self, "extendedDataAccessQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100164C8C;
    block[3] = &unk_1008EAD38;
    v27 = &v33;
    block[4] = self;
    v13 = v6;
    v26 = v13;
    v28 = &v29;
    dispatch_sync(v12, block);

    if (!v34[5] && !*((_BYTE *)v30 + 24))
    {
      objc_initWeak(&location, self);
      v14 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource extendedDataAccessQueue](self, "extendedDataAccessQueue"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100164D0C;
      v19[3] = &unk_1008EAE70;
      objc_copyWeak(&v23, &location);
      v20 = v11;
      v21 = v13;
      v22 = v7;
      dispatch_async(v14, v19);

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }

  }
  else
  {
    v15 = objc_retainBlock(v7);
    v16 = v15;
    if (v15)
      (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, 0, 0);

  }
  v17 = (id)v34[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

- (id)currentCollection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fetchedObjects"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collection"));
  return v5;
}

- (void)invalidateFRC
{
  -[BKLibraryBookshelfBooksDataSource setFrc:](self, "setFrc:", 0);
}

- (int64_t)numberOfSections
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sections"));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sections"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));
  v7 = objc_msgSend(v6, "numberOfObjects");

  return (int64_t)v7;
}

- (int64_t)totalNumberOfItems
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  int64_t v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sections"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += (int64_t)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "numberOfObjects");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)representedObjectForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sections"));

  v7 = objc_msgSend(v4, "section");
  if (v7 >= objc_msgSend(v6, "count"))
    v8 = 0;
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "section")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objects"));
  v10 = objc_msgSend(v4, "item");
  if (v10 >= objc_msgSend(v9, "count"))
    v11 = 0;
  else
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v4, "item")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource sortModeProvider](self, "sortModeProvider"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentSortMode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entityName"));
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("BKLibraryAsset"));

  if (v15)
  {
    v16 = v11;
  }
  else
  {
    v17 = objc_opt_class(BKCollectionMember);
    v18 = BUDynamicCast(v17, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "asset"));

  }
  return v16;
}

- (id)indexPathForRepresentedObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource sortModeProvider](self, "sortModeProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentSortMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entityName"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("BKLibraryAsset"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "indexPathForObject:", v4));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource currentCollection](self, "currentCollection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("collection == %@"), v11));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionMembers"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredSetUsingPredicate:", v9));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "anyObject"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "indexPathForObject:", v4));

  }
  return v10;
}

- (id)representedObjectsInSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sections"));

  if ((unint64_t)objc_msgSend(v6, "count") <= a3)
    v7 = 0;
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objects"));
  if (v8
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource sortModeProvider](self, "sortModeProvider")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentSortMode")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "entityName")),
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("BKLibraryAsset")),
        v11,
        v10,
        v9,
        !v12))
  {
    v13 = objc_msgSend(v8, "mutableCopy");
    if (objc_msgSend(v13, "count"))
    {
      v14 = 0;
      do
      {
        v15 = objc_opt_class(BKCollectionMember);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v14));
        v17 = BUDynamicCast(v15, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "asset"));
        objc_msgSend(v13, "setObject:atIndexedSubscript:", v19, v14);

        ++v14;
      }
      while (v14 < (unint64_t)objc_msgSend(v13, "count"));
    }
  }
  else
  {
    v13 = v8;
  }

  return v13;
}

- (id)fetchRequest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc((Class)NSFetchRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource sortModeProvider](self, "sortModeProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSortMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entityName"));
  v7 = objc_msgSend(v3, "initWithEntityName:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource sortModeProvider](self, "sortModeProvider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentSortMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "predicate"));
  objc_msgSend(v7, "setPredicate:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource sortModeProvider](self, "sortModeProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentSortMode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sortDescriptors"));
  objc_msgSend(v7, "setSortDescriptors:", v13);

  objc_msgSend(v7, "setFetchBatchSize:", 32);
  return v7;
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  -[BKLibraryBookshelfBooksDataSource setInsertedSectionIndexes:](self, "setInsertedSectionIndexes:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  -[BKLibraryBookshelfBooksDataSource setDeletedSectionIndexes:](self, "setDeletedSectionIndexes:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[BKLibraryBookshelfBooksDataSource setDeletedItemIndexPaths:](self, "setDeletedItemIndexPaths:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[BKLibraryBookshelfBooksDataSource setInsertedItemIndexPaths:](self, "setInsertedItemIndexPaths:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[BKLibraryBookshelfBooksDataSource setUpdatedItemIndexPaths:](self, "setUpdatedItemIndexPaths:", v9);

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fetchedObjects"));
  -[BKLibraryBookshelfBooksDataSource setNumItemsBeforeChange:](self, "setNumItemsBeforeChange:", objc_msgSend(v10, "count"));

}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  id v28;

  v28 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  switch(a6)
  {
    case 1uLL:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource insertedSectionIndexes](self, "insertedSectionIndexes"));
      v16 = objc_msgSend(v15, "containsIndex:", objc_msgSend(v14, "section"));

      if ((v16 & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource insertedItemIndexPaths](self, "insertedItemIndexPaths"));
        v18 = v17;
        v19 = v14;
        goto LABEL_9;
      }
      goto LABEL_14;
    case 2uLL:
      goto LABEL_6;
    case 3uLL:
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource insertedSectionIndexes](self, "insertedSectionIndexes"));
      v21 = objc_msgSend(v20, "containsIndex:", objc_msgSend(v14, "section"));

      if ((v21 & 1) == 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource insertedItemIndexPaths](self, "insertedItemIndexPaths"));
        objc_msgSend(v22, "addObject:", v14);

      }
LABEL_6:
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource deletedSectionIndexes](self, "deletedSectionIndexes"));
      v24 = objc_msgSend(v23, "containsIndex:", objc_msgSend(v13, "section"));

      if ((v24 & 1) != 0)
        goto LABEL_14;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource deletedItemIndexPaths](self, "deletedItemIndexPaths"));
      goto LABEL_8;
    case 4uLL:
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource deletedSectionIndexes](self, "deletedSectionIndexes"));
      if ((objc_msgSend(v18, "containsIndex:", objc_msgSend(v13, "section")) & 1) != 0)
        goto LABEL_13;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource deletedItemIndexPaths](self, "deletedItemIndexPaths"));
      if (objc_msgSend(v25, "containsObject:", v13))
      {

LABEL_13:
        goto LABEL_14;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource updatedItemIndexPaths](self, "updatedItemIndexPaths"));
      v27 = objc_msgSend(v26, "containsObject:", v13);

      if ((v27 & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource updatedItemIndexPaths](self, "updatedItemIndexPaths"));
LABEL_8:
        v18 = v17;
        v19 = v13;
LABEL_9:
        objc_msgSend(v17, "addObject:", v19);
        goto LABEL_13;
      }
LABEL_14:

      return;
    default:
      goto LABEL_14;
  }
}

- (void)controller:(id)a3 didChangeSection:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v10 = a3;
  v11 = a4;
  if (a6 == 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource deletedSectionIndexes](self, "deletedSectionIndexes"));
    objc_msgSend(v13, "addIndex:", a5);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource deletedItemIndexPaths](self, "deletedItemIndexPaths"));
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v20, "section") == (id)a5)
            objc_msgSend(v14, "addObject:", v20);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v17);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource deletedItemIndexPaths](self, "deletedItemIndexPaths"));
    objc_msgSend(v21, "removeObjectsInArray:", v14);

    objc_msgSend(v14, "removeAllObjects");
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource updatedItemIndexPaths](self, "updatedItemIndexPaths", 0));
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(_QWORD *)v30 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
          if (objc_msgSend(v27, "section") == (id)a5)
            objc_msgSend(v14, "addObject:", v27);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v24);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource updatedItemIndexPaths](self, "updatedItemIndexPaths"));
    objc_msgSend(v28, "removeObjectsInArray:", v14);

  }
  else if (a6 == 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource insertedSectionIndexes](self, "insertedSectionIndexes"));
    objc_msgSend(v12, "addIndex:", a5);

  }
}

- (void)clearChanges
{
  -[BKLibraryBookshelfBooksDataSource setInsertedSectionIndexes:](self, "setInsertedSectionIndexes:", 0);
  -[BKLibraryBookshelfBooksDataSource setDeletedSectionIndexes:](self, "setDeletedSectionIndexes:", 0);
  -[BKLibraryBookshelfBooksDataSource setDeletedItemIndexPaths:](self, "setDeletedItemIndexPaths:", 0);
  -[BKLibraryBookshelfBooksDataSource setInsertedItemIndexPaths:](self, "setInsertedItemIndexPaths:", 0);
  -[BKLibraryBookshelfBooksDataSource setUpdatedItemIndexPaths:](self, "setUpdatedItemIndexPaths:", 0);
}

- (void)controllerDidChangeContent:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  if (!-[BKLibraryBookshelfBooksDataSource suppressChangeNotification](self, "suppressChangeNotification"))
  {
    if (-[BKLibraryBookshelfBooksDataSource numItemsBeforeChange](self, "numItemsBeforeChange"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fetchedObjects"));
      v5 = objc_msgSend(v4, "count") == 0;

    }
    else
    {
      v5 = 1;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource delegate](self, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource insertedSectionIndexes](self, "insertedSectionIndexes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource deletedSectionIndexes](self, "deletedSectionIndexes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource insertedItemIndexPaths](self, "insertedItemIndexPaths"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource deletedItemIndexPaths](self, "deletedItemIndexPaths"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource updatedItemIndexPaths](self, "updatedItemIndexPaths"));
    LOBYTE(v14) = v5;
    objc_msgSend(v6, "booksDataSource:insertedSections:deletedSections:insertedItems:deletedItems:updatedItems:mayHaveZeroObjects:", self, v7, v8, v9, v10, v11, v14);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource insertedItemIndexPaths](self, "insertedItemIndexPaths"));
    v13 = objc_msgSend(v12, "count");

    if (v13)
      -[BKLibraryBookshelfBooksDataSource _loadProductInfoData](self, "_loadProductInfoData");
  }
  -[BKLibraryBookshelfBooksDataSource clearChanges](self, "clearChanges");

}

- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfBooksDataSource frc](self, "frc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fetchedObjects"));
  v18 = objc_msgSend(v9, "mutableCopy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v7, "row")));
  v11 = objc_msgSend(v7, "row");

  objc_msgSend(v18, "removeObjectAtIndex:", v11);
  v12 = objc_msgSend(v6, "row");

  objc_msgSend(v18, "insertObject:atIndex:", v10, v12);
  if (+[BKUserSortOrderManager resortDescendingSortKeyedObjects:](BKUserSortOrderManager, "resortDescendingSortKeyedObjects:", v18))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uiChildContext"));
    v15 = objc_msgSend(v14, "hasChanges");

    if (v15)
    {
      -[BKLibraryBookshelfBooksDataSource setSuppressChangeNotification:](self, "setSuppressChangeNotification:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uiChildContext"));
      objc_msgSend(v16, "setSaveContext:", 2);

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uiChildContext"));
      objc_msgSend(v17, "save:", 0);

      -[BKLibraryBookshelfBooksDataSource setSuppressChangeNotification:](self, "setSuppressChangeNotification:", 0);
    }

  }
}

- (BKLibraryBookshelfBooksDataSourceDelegate)delegate
{
  return (BKLibraryBookshelfBooksDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)extendedDataAccessQueue
{
  return self->_extendedDataAccessQueue;
}

- (void)setExtendedDataAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_extendedDataAccessQueue, a3);
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workerQueue, a3);
}

- (NSMutableDictionary)assetReviewData
{
  return self->_assetReviewData;
}

- (void)setAssetReviewData:(id)a3
{
  objc_storeStrong((id *)&self->_assetReviewData, a3);
}

- (NSMutableDictionary)productInfoData
{
  return self->_productInfoData;
}

- (void)setProductInfoData:(id)a3
{
  objc_storeStrong((id *)&self->_productInfoData, a3);
}

- (NSMutableDictionary)resourceCache
{
  return self->_resourceCache;
}

- (void)setResourceCache:(id)a3
{
  objc_storeStrong((id *)&self->_resourceCache, a3);
}

- (NSMutableSet)checkedAssetIDs
{
  return self->_checkedAssetIDs;
}

- (void)setCheckedAssetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_checkedAssetIDs, a3);
}

- (NSMutableSet)checkedProductProfileIDs
{
  return self->_checkedProductProfileIDs;
}

- (void)setCheckedProductProfileIDs:(id)a3
{
  objc_storeStrong((id *)&self->_checkedProductProfileIDs, a3);
}

- (NSMutableSet)checkedResourceIDs
{
  return self->_checkedResourceIDs;
}

- (void)setCheckedResourceIDs:(id)a3
{
  objc_storeStrong((id *)&self->_checkedResourceIDs, a3);
}

- (BKLibraryManager)libraryManager
{
  return (BKLibraryManager *)objc_loadWeakRetained((id *)&self->_libraryManager);
}

- (void)setLibraryManager:(id)a3
{
  objc_storeWeak((id *)&self->_libraryManager, a3);
}

- (NSFetchedResultsController)frc
{
  return self->_frc;
}

- (void)setFrc:(id)a3
{
  objc_storeStrong((id *)&self->_frc, a3);
}

- (BKLibraryBookshelfSortModeProviding)sortModeProvider
{
  return (BKLibraryBookshelfSortModeProviding *)objc_loadWeakRetained((id *)&self->_sortModeProvider);
}

- (void)setSortModeProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sortModeProvider, a3);
}

- (NSMutableIndexSet)insertedSectionIndexes
{
  return self->_insertedSectionIndexes;
}

- (void)setInsertedSectionIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_insertedSectionIndexes, a3);
}

- (NSMutableIndexSet)deletedSectionIndexes
{
  return self->_deletedSectionIndexes;
}

- (void)setDeletedSectionIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_deletedSectionIndexes, a3);
}

- (NSMutableArray)deletedItemIndexPaths
{
  return self->_deletedItemIndexPaths;
}

- (void)setDeletedItemIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_deletedItemIndexPaths, a3);
}

- (NSMutableArray)insertedItemIndexPaths
{
  return self->_insertedItemIndexPaths;
}

- (void)setInsertedItemIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_insertedItemIndexPaths, a3);
}

- (NSMutableArray)updatedItemIndexPaths
{
  return self->_updatedItemIndexPaths;
}

- (void)setUpdatedItemIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_updatedItemIndexPaths, a3);
}

- (BOOL)isSeries
{
  return self->_isSeries;
}

- (void)setIsSeries:(BOOL)a3
{
  self->_isSeries = a3;
}

- (BOOL)hasSeriesSequenceLabel
{
  return self->_hasSeriesSequenceLabel;
}

- (void)setHasSeriesSequenceLabel:(BOOL)a3
{
  self->_hasSeriesSequenceLabel = a3;
}

- (BOOL)providesReviewData
{
  return self->_providesReviewData;
}

- (void)setProvidesReviewData:(BOOL)a3
{
  self->_providesReviewData = a3;
}

- (BOOL)providesProductInfoData
{
  return self->_providesProductInfoData;
}

- (void)setProvidesProductInfoData:(BOOL)a3
{
  self->_providesProductInfoData = a3;
}

- (BOOL)suppressChangeNotification
{
  return self->_suppressChangeNotification;
}

- (void)setSuppressChangeNotification:(BOOL)a3
{
  self->_suppressChangeNotification = a3;
}

- (NSPredicate)productInfoFilter
{
  return self->_productInfoFilter;
}

- (void)setProductInfoFilter:(id)a3
{
  objc_storeStrong((id *)&self->_productInfoFilter, a3);
}

- (void)setAssetReviewManager:(id)a3
{
  self->_assetReviewManager = (BCCloudAssetReviewManager *)a3;
}

- (int64_t)numItemsBeforeChange
{
  return self->_numItemsBeforeChange;
}

- (void)setNumItemsBeforeChange:(int64_t)a3
{
  self->_numItemsBeforeChange = a3;
}

- (BCMutableCloudSyncVersions)currentCloudSyncVersions
{
  return self->_currentCloudSyncVersions;
}

- (void)setCurrentCloudSyncVersions:(id)a3
{
  objc_storeStrong((id *)&self->_currentCloudSyncVersions, a3);
}

- (BUCoalescingCallBlock)coalescedReloadData
{
  return self->_coalescedReloadData;
}

- (void)setCoalescedReloadData:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedReloadData, a3);
}

- (NSSet)propertiesOfInterest
{
  return self->_propertiesOfInterest;
}

- (void)setPropertiesOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_propertiesOfInterest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesOfInterest, 0);
  objc_storeStrong((id *)&self->_coalescedReloadData, 0);
  objc_storeStrong((id *)&self->_currentCloudSyncVersions, 0);
  objc_storeStrong((id *)&self->_productInfoFilter, 0);
  objc_storeStrong((id *)&self->_updatedItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_insertedItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_deletedItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_deletedSectionIndexes, 0);
  objc_storeStrong((id *)&self->_insertedSectionIndexes, 0);
  objc_destroyWeak((id *)&self->_sortModeProvider);
  objc_storeStrong((id *)&self->_frc, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
  objc_storeStrong((id *)&self->_checkedResourceIDs, 0);
  objc_storeStrong((id *)&self->_checkedProductProfileIDs, 0);
  objc_storeStrong((id *)&self->_checkedAssetIDs, 0);
  objc_storeStrong((id *)&self->_resourceCache, 0);
  objc_storeStrong((id *)&self->_productInfoData, 0);
  objc_storeStrong((id *)&self->_assetReviewData, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_extendedDataAccessQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_loadResourcesForAssetIDs:(NSArray *)a3 audiobookAssetIDs:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSArray *v17;
  NSArray *v18;
  BKLibraryBookshelfBooksDataSource *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_100908F08, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_100908F30, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1009E5560;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_100908F58, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1009D76E0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_1005D61EC((uint64_t)v11, (uint64_t)&unk_1009E5570, (uint64_t)v16);
  swift_release(v20);
}

@end
