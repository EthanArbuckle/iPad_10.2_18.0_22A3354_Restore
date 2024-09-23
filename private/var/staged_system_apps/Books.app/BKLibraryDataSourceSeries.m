@implementation BKLibraryDataSourceSeries

- (void)applicationDidBecomeActive
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  -[BKLibraryDataSourceSeries setWantsSeriesUpdated:](self, "setWantsSeriesUpdated:", 1);
  v3 = dispatch_time(0, 10000000000);
  v4 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014599C;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_after(v3, v4, block);

}

- (void)setWantsSeriesUpdated:(BOOL)a3
{
  self->_wantsSeriesUpdated = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BKLibraryDataSourceSeries)init
{
  BKLibraryDataSourceSeries *v3;
  BKLibraryDataSourceSeries *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  kdebug_trace(725353716, 36, 0, 0, 0);
  v19.receiver = self;
  v19.super_class = (Class)BKLibraryDataSourceSeries;
  v3 = -[BKLibraryDataSourceSeries init](&v19, "init");
  v4 = v3;
  if (v3)
  {
    v3->_didMigrateAudiobookSeriesOnce = 0;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);

    v9 = dispatch_queue_create("com.apple.BKLibraryDataSourceSeries.dispatchQueue", v8);
    -[BKLibraryDataSourceSeries setDispatchQueue:](v4, "setDispatchQueue:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v4, "_BCCloudStoreAssetManagerChanged:", BCCloudStoreAssetManagerChanged, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v4, "applicationDidBecomeActive", UIApplicationDidBecomeActiveNotification, v12);

    -[BKLibraryDataSourceSeries applicationDidBecomeActive](v4, "applicationDidBecomeActive");
    v13 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("series-artwork")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v17, "removeItemAtPath:error:", v16, 0);

  }
  kdebug_trace(725353716, 37, 0, 0, 0);
  return v4;
}

- (id)identifier
{
  return CFSTR("com.apple.ibooks.BKLibraryDataSourceSeries");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, BCCloudStoreAssetManagerChanged, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v4, "removeObserver:name:object:", self, UIApplicationDidBecomeActiveNotification, v5);

  v6.receiver = self;
  v6.super_class = (Class)BKLibraryDataSourceSeries;
  -[BKLibraryDataSourceSeries dealloc](&v6, "dealloc");
}

- (unint64_t)propagateDataProperties
{
  return 536858750;
}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a4)
  {
    v7 = a4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "assetID"));
    v12 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries _arrayOfSeriesAssetsFromAdamIDs:insertNullsForMissingAssets:](self, "_arrayOfSeriesAssetsFromAdamIDs:insertNullsForMissingAssets:", v9, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
    (*((void (**)(id, void *, _QWORD))a4 + 2))(v7, v11, 0);

  }
}

- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v5;
  id v6;

  v5 = objc_retainBlock(a5);
  if (v5)
  {
    v6 = v5;
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v5 + 2))(v5, 0, 0, 0);
    v5 = v6;
  }

}

- (int64_t)coverSourceRank
{
  return 4;
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  id v5;
  id v6;

  v5 = objc_retainBlock(a5);
  if (v5)
  {
    v6 = v5;
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v5 + 2))(v5, 0, 0, 0);
    v5 = v6;
  }

}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  kdebug_trace(725353716, 86, 0, 0, 0);
  if (!self->_listeningForLibraryUpdates)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v5 = BKLibraryOwnershipDidChangeNotification;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries libraryManager](self, "libraryManager"));
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "_ownershipDidChange:", v5, v6);

    self->_listeningForLibraryUpdates = 1;
  }
  v7 = v13;
  if (v13)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesManager sharedManager](BKSeriesManager, "sharedManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allSeriesItemAdamIds"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries _arrayOfAllSeriesContainerAssetIDs](self, "_arrayOfAllSeriesContainerAssetIDs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    objc_msgSend(v12, "addProductProfileIDs:priority:", v9, 3);

    kdebug_trace(725353716, 87, 0, 0, 0);
    (*((void (**)(id, void *, _QWORD))v13 + 2))(v13, v11, 0);

    v7 = v13;
  }

}

- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(id, id, _QWORD);
  id v9;

  v6 = a4;
  v7 = a3;
  kdebug_trace(725353716, 88, 0, 0, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries _arrayOfSeriesAssetsFromAdamIDs:insertNullsForMissingAssets:](self, "_arrayOfSeriesAssetsFromAdamIDs:insertNullsForMissingAssets:", v7, 1));

  kdebug_trace(725353716, 89, 0, 0, 0);
  v8 = (void (**)(id, id, _QWORD))objc_retainBlock(v6);

  if (v8)
    v8[2](v8, v9, 0);

}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
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
  unsigned __int8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "storeID"));
        if (v16)
        {
          v17 = v16;
          if (a4)
          {

          }
          else
          {
            v18 = objc_msgSend(v15, "isOwned");

            if ((v18 & 1) != 0)
              continue;
          }
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "storeID"));
          objc_msgSend(v9, "addObject:", v19);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "storeAssetManager"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10014493C;
    v24[3] = &unk_1008EA2C0;
    v25 = v8;
    objc_msgSend(v21, "deleteStoreItemsWithStoreIDs:completion:", v9, v24);

    v22 = v25;
  }
  else
  {
    v23 = objc_retainBlock(v8);
    v22 = v23;
    if (v23)
      (*((void (**)(id, uint64_t, _QWORD))v23 + 2))(v23, 1, 0);
  }

}

- (void)_ownershipDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BKLibraryDataSourceSeries *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries dispatchQueue](self, "dispatchQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100144A30;
  v7[3] = &unk_1008E7338;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_BCCloudStoreAssetManagerChanged:(id)a3
{
  id v4;
  id v5;
  NSObject *activity;
  _QWORD block[4];
  id v8;
  BKLibraryDataSourceSeries *v9;

  v4 = a3;
  activity = _os_activity_create((void *)&_mh_execute_header, "BCCloudStoreAssetManagerChanged Received Notification", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100144DC8;
  block[3] = &unk_1008E7338;
  v8 = v4;
  v9 = self;
  v5 = v4;
  os_activity_apply(activity, block);

}

- (void)storeItemsUpdatedWithCurrentCloudSyncVersions:(id)a3 updated:(id)a4 removed:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;

  v7 = a4;
  v8 = a5;
  v9 = BKLibraryDataSourceSeriesLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#storeItemsUpdatedWithCurrentCloudSyncVersions updated:(%@) remove:(%@) ", buf, 0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storeAssetManager"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100145298;
  v13[3] = &unk_1008EC058;
  v13[4] = self;
  objc_msgSend(v12, "fetchStoreItemsIncludingDeleted:completion:", 0, v13);

}

- (void)_updateSeriesManager
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[8];
  _QWORD v16[2];
  _QWORD v17[2];

  v3 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = BKLibraryDataSourceSeriesLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating series data for all store books and audiobooks", v15, 2u);
  }

  if (!self->_listeningForSeriesUpdates)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "_seriesUpdated:", BKSeriesManagerUpdatesSeriesNotificationName, 0);

    self->_listeningForSeriesUpdates = 1;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries libraryManager](self, "libraryManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetIDsOfStoreBookAssets"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries libraryManager](self, "libraryManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetIDsOfStoreAudiobookAssets"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesManager sharedManager](BKSeriesManager, "sharedManager"));
  v12 = &__NSArray0__struct;
  v16[0] = BKSeriesManagerAssetTypeBooks;
  v16[1] = BKSeriesManagerAssetTypeAudiobooks;
  if (v8)
    v13 = v8;
  else
    v13 = &__NSArray0__struct;
  if (v10)
    v12 = v10;
  v17[0] = v13;
  v17[1] = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
  objc_msgSend(v11, "updateSeriesForAssetAdamIDsWithTypes:forceCheck:", v14, 0);
  -[BKLibraryDataSourceSeries setWantsSeriesUpdated:](self, "setWantsSeriesUpdated:", 0);

}

- (void)_seriesUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  BKLibraryDataSourceSeries *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", BKSeriesManagerUpdatesSeriesNotificationUserInfoAdamIDsAddedKey));
  if (objc_msgSend(v5, "count"))
  {
    v39 = v5;
    v40 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries _arrayOfSeriesAssetsFromAdamIDs:insertNullsForMissingAssets:](self, "_arrayOfSeriesAssetsFromAdamIDs:insertNullsForMissingAssets:", v5, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("assetID")));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bu_arrayByRemovingNSNulls"));

    v38 = self;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries libraryManager](self, "libraryManager"));
    v37 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "existingAssetIDsFromAssetIDs:", v8));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "assetID"));
          v20 = objc_msgSend(v10, "containsObject:", v19);

          if (v20)
          {
            objc_msgSend(v12, "addObject:", v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "assetID"));
            objc_msgSend(v41, "addObject:", v21);

          }
          else
          {
            objc_msgSend(v11, "addObject:", v18);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v15);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("assetID")));
    objc_msgSend(v22, "addProductProfileIDs:priority:", v23, 3);

    self = v38;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries libraryManager](v38, "libraryManager"));
    objc_msgSend(v24, "libraryDataSource:addedAssets:", v38, v11);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries libraryManager](v38, "libraryManager"));
    objc_msgSend(v25, "libraryDataSource:updatedAssets:", v38, v12);

    v5 = v39;
    v4 = v40;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", BKSeriesManagerUpdatesSeriesNotificationUserInfoAdamIDsRemovedKey));
  if (objc_msgSend(v26, "count"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bu_arrayByRemovingDuplicates"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries _arrayOfSeriesAssetsFromAdamIDs:insertNullsForMissingAssets:](self, "_arrayOfSeriesAssetsFromAdamIDs:insertNullsForMissingAssets:", v27, 0));
    if (objc_msgSend(v28, "count"))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "valueForKey:", CFSTR("assetID")));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bu_arrayByRemovingNSNulls"));

      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bu_arrayByRemovingObjectsInArray:", v30));
      v27 = (void *)v31;
    }
    else
    {
      v30 = 0;
    }

    v26 = v27;
  }
  else
  {
    v30 = 0;
  }
  if (objc_msgSend(v26, "count"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries libraryManager](self, "libraryManager"));
    objc_msgSend(v32, "libraryDataSource:removedAssetsWithAssetIDs:orTemporaryAssetIDs:", self, v26, 0);

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", BKSeriesManagerUpdatesSeriesNotificationUserInfoAdamIDsUpdatedKey));
  if (objc_msgSend(v30, "count"))
  {
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "arrayByAddingObjectsFromArray:", v30));

    v33 = (void *)v34;
  }
  if (objc_msgSend(v33, "count"))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries _arrayOfSeriesAssetsFromAdamIDs:insertNullsForMissingAssets:](self, "_arrayOfSeriesAssetsFromAdamIDs:insertNullsForMissingAssets:", v33, 0));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries libraryManager](self, "libraryManager"));
    objc_msgSend(v36, "libraryDataSource:updatedAssets:", self, v35);

  }
}

- (id)_arrayOfSeriesAssetsFromAdamIDs:(id)a3 insertNullsForMissingAssets:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BKSeriesAsset *v14;
  void *v15;
  BKSeriesAsset *v16;
  void *v18;
  void *v19;
  _BOOL4 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v20 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesManager sharedManager](BKSeriesManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = v6;
  v19 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "seriesItemsWithAdamIds:", v5));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesInfo seriesInfoWithDictionary:](BKSeriesInfo, "seriesInfoWithDictionary:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v12)));
        if (!v13
          || (v14 = [BKSeriesAsset alloc],
              v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries identifier](self, "identifier")),
              v16 = -[BKSeriesAsset initWithSeriesInfo:dataSourceIdentifier:](v14, "initWithSeriesInfo:dataSourceIdentifier:", v13, v15), v15, !v16))
        {
          if (!v20)
            goto LABEL_11;
          v16 = (BKSeriesAsset *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        }
        objc_msgSend(v7, "addObject:", v16);

LABEL_11:
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_arrayOfAllSeriesContainerAssetIDs
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesManager sharedManager](BKSeriesManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allSeriesContainerIds"));

  return v3;
}

- (id)_latestOpenedLibraryAssetForSeriesID:(id)a3 inMOC:(id)a4
{
  id v6;
  id v7;
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
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[2];

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries libraryManager](self, "libraryManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "predicateForLibraryAssetsWithSeriesID:", v7));

  v23[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceSeries libraryManager](self, "libraryManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "predicateForLocalLibraryAssets"));
  v23[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v13));
  objc_msgSend(v8, "setPredicate:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("lastOpenDate"), 0));
  v22[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("seriesSortKey"), 1));
  v22[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
  objc_msgSend(v8, "setSortDescriptors:", v17);

  objc_msgSend(v8, "setFetchLimit:", 1);
  objc_msgSend(v8, "setReturnsObjectsAsFaults:", 0);
  v21 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v8, &v21));

  if (v18)
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));
  else
    v19 = 0;

  return v19;
}

- (BOOL)wantsSeriesUpdated
{
  return self->_wantsSeriesUpdated;
}

- (BOOL)didMigrateAudiobookSeriesOnce
{
  return self->_didMigrateAudiobookSeriesOnce;
}

- (void)setDidMigrateAudiobookSeriesOnce:(BOOL)a3
{
  self->_didMigrateAudiobookSeriesOnce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
