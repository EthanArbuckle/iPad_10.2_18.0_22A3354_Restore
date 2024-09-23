@implementation BKLibraryDataSourceMediaLibraryCloud

- (int64_t)rank
{
  return self->_rank;
}

- (void)mediaLibraryCacheAddedCloudAssets:(id)a3 updatedCloudAssets:(id)a4 removedCloudAssets:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = BKLibraryDataSourceMediaLibraryLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134218496;
    v20 = objc_msgSend(v8, "count");
    v21 = 2048;
    v22 = objc_msgSend(v10, "count");
    v23 = 2048;
    v24 = objc_msgSend(v9, "count");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Cloud library changed adding %lu, removing %lu, updating %lu audiobooks.", (uint8_t *)&v19, 0x20u);
  }

  if (objc_msgSend(v10, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryCloud libraryManager](self, "libraryManager"));
    objc_msgSend(v13, "libraryDataSource:removedAssets:", self, v10);

    -[BKLibraryDataSourceMediaLibraryCloud _removeAssetIDsFromCacheManager:](self, "_removeAssetIDsFromCacheManager:", v10);
  }
  if (objc_msgSend(v8, "count"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryCloud libraryManager](self, "libraryManager"));
    objc_msgSend(v14, "libraryDataSource:addedAssets:", self, v8);

    -[BKLibraryDataSourceMediaLibraryCloud _addAssetIDsToCacheManager:](self, "_addAssetIDsToCacheManager:", v8);
  }
  if (objc_msgSend(v9, "count"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("assetID")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));
    objc_msgSend(v15, "incrementVersionForIdentifiers:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryCloud libraryManager](self, "libraryManager"));
    objc_msgSend(v18, "libraryDataSource:updatedAssets:", self, v9);

  }
}

- (void)mediaLibraryCacheAddedBookletAssets:(id)a3 removedBookletAssets:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = BKLibraryDataSourceMediaLibraryLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134218240;
    v13 = objc_msgSend(v6, "count");
    v14 = 2048;
    v15 = objc_msgSend(v7, "count");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cloud library changed adding %lu, removing %lu booklets.", (uint8_t *)&v12, 0x16u);
  }

  if (objc_msgSend(v7, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryCloud libraryManager](self, "libraryManager"));
    objc_msgSend(v10, "libraryDataSource:removedAssets:", self, v7);

    -[BKLibraryDataSourceMediaLibraryCloud _removeAssetIDsFromCacheManager:](self, "_removeAssetIDsFromCacheManager:", v7);
  }
  if (objc_msgSend(v6, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryCloud libraryManager](self, "libraryManager"));
    objc_msgSend(v11, "libraryDataSource:addedAssets:", self, v6);

    -[BKLibraryDataSourceMediaLibraryCloud _addAssetIDsToCacheManager:](self, "_addAssetIDsToCacheManager:", v6);
  }

}

- (BKLibraryDataSourceMediaLibraryCloud)initWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  BKLibraryDataSourceMediaLibraryCloud *v8;
  NSString *v9;
  NSString *dataSourceIdentifier;
  uint64_t v11;
  BKMediaLibraryCache *mediaLibraryCache;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v5 = kdebug_trace(725353716, 30, 0, 0, 0);
  v6 = BKLibraryDataSourceMediaLibraryLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1006A1E5C((uint64_t)v4, v7);

  v16.receiver = self;
  v16.super_class = (Class)BKLibraryDataSourceMediaLibraryCloud;
  v8 = -[BKLibraryDataSourceMediaLibraryCloud init](&v16, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v4, "copy");
    dataSourceIdentifier = v8->_dataSourceIdentifier;
    v8->_dataSourceIdentifier = v9;

    v11 = objc_claimAutoreleasedReturnValue(+[BKMediaLibraryCache sharedCache](BKMediaLibraryCache, "sharedCache"));
    mediaLibraryCache = v8->_mediaLibraryCache;
    v8->_mediaLibraryCache = (BKMediaLibraryCache *)v11;

    -[BKMediaLibraryCache addObserver:](v8->_mediaLibraryCache, "addObserver:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[JSAAccountController sharedController](JSAAccountController, "sharedController"));
    objc_msgSend(v13, "addObserver:", v8);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v8, "_purchaseSucceeded:", BLDownloadQueuePurchaseSucceededNotification, 0);

  }
  kdebug_trace(725353716, 31, 0, 0, 0);

  return v8;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (void)setLibraryManager:(id)a3
{
  objc_storeWeak((id *)&self->_libraryManager, a3);
}

- (NSString)identifier
{
  return self->_dataSourceIdentifier;
}

+ (id)cloudAudiobooksDataSource
{
  return -[BKLibraryDataSourceMediaLibraryCloud initWithIdentifier:]([BKLibraryDataSourceMediaLibraryCloud alloc], "initWithIdentifier:", CFSTR("com.apple.ibooks.datasource.audiobooks.cloud"));
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  objc_super v6;

  v3 = BKLibraryDataSourceMediaLibraryLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1006A37E0();

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, BLDownloadQueuePurchaseSucceededNotification, 0);

  v6.receiver = self;
  v6.super_class = (Class)BKLibraryDataSourceMediaLibraryCloud;
  -[BKLibraryDataSourceMediaLibraryCloud dealloc](&v6, "dealloc");
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)mostRecentPurchaseDate:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001977F4;
  v7[3] = &unk_1008E9D10;
  v7[4] = self;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[BCStopWatch stopwatch](BCStopWatch, "stopwatch"));
  v9 = v4;
  v5 = v4;
  v6 = v8;
  -[BKLibraryDataSourceMediaLibraryCloud fetchAssetIDsWithCompletion:](self, "fetchAssetIDsWithCompletion:", v7);

}

- (void)mediaLibraryCacheRequestsReload:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryCloud libraryManager](self, "libraryManager"));
  objc_msgSend(v5, "reloadDataSource:completion:", self, v4);

}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryCloud mediaLibraryCache](self, "mediaLibraryCache"));
  objc_msgSend(v5, "fetchAssetIDsOfType:includeBooklets:completion:", 1, 1, v4);

}

- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryCloud mediaLibraryCache](self, "mediaLibraryCache"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100197CC8;
  v10[3] = &unk_1008E9D38;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "fetchAssetsWithIDs:type:includeBooklets:completion:", v7, 1, 1, v10);

}

- (void)fetchAssetsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryCloud mediaLibraryCache](self, "mediaLibraryCache"));
  objc_msgSend(v5, "fetchAssetsOfType:includeBooklets:completion:", 1, 1, v4);

}

- (void)_addAssetIDsToCacheManager:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetID", (_QWORD)v17));
        if (v12)
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetID"));
        else
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "temporaryAssetID"));
        v14 = (void *)v13;

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKCoverCacheURLSchemeHandler urlStringForAssetID:dataSourceID:](BKCoverCacheURLSchemeHandler, "urlStringForAssetID:dataSourceID:", v14, self->_dataSourceIdentifier));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    objc_msgSend(v16, "addURLs:priority:quality:expiresAfter:", v5, 3, 202, 0);

  }
}

- (void)_removeAssetIDsFromCacheManager:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetID", (_QWORD)v17));
        if (v12)
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetID"));
        else
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "temporaryAssetID"));
        v14 = (void *)v13;

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKCoverCacheURLSchemeHandler urlStringForAssetID:dataSourceID:](BKCoverCacheURLSchemeHandler, "urlStringForAssetID:dataSourceID:", v14, self->_dataSourceIdentifier));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    objc_msgSend(v16, "removeURLs:priority:quality:", v5, 3, 202);

  }
}

- (int64_t)coverSourceRank
{
  return 3;
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryCloud mediaLibraryCache](self, "mediaLibraryCache"));
  objc_msgSend(v9, "bookCoverForLibraryAssetProperties:type:completion:", v8, 1, v7);

}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  id v5;
  id v6;

  v5 = objc_retainBlock(a5);
  if (v5)
  {
    v6 = v5;
    (*((void (**)(id, uint64_t, _QWORD))v5 + 2))(v5, 1, 0);
    v5 = v6;
  }

}

- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5
{
  return 0;
}

- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  return 0;
}

- (BOOL)updateURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)examineURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  BKLibraryDataSourceMediaLibraryCloud *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = BKLibraryDataSourceMediaLibraryLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_1006A380C();

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryCloud mediaLibraryCache](self, "mediaLibraryCache"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001982E8;
  v17[3] = &unk_1008EDB18;
  v18 = v8;
  v19 = self;
  v20 = v9;
  v21 = v10;
  v14 = v9;
  v15 = v10;
  v16 = v8;
  objc_msgSend(v13, "assetForLibraryAsset:type:completion:", v16, 1, v17);

}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceMediaLibraryCloud mediaLibraryCache](self, "mediaLibraryCache"));
  objc_msgSend(v8, "assetForLibraryAsset:type:completion:", v7, 1, v6);

}

- (BOOL)prioritizeImport:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)canRedownloadAssets
{
  return 1;
}

- (BOOL)canMakeAssetsLocal
{
  return 1;
}

- (void)_purchaseSucceeded:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _UNKNOWN **v15;
  _UNKNOWN **v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  int v22;
  _UNKNOWN **v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = v3;
  if (v3)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BLDownloadQueuePropertyIsPurchase));
    v7 = objc_opt_class(NSNumber);
    v8 = BUDynamicCast(v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (objc_msgSend(v9, "BOOLValue"))
    {
      v10 = objc_opt_class(NSNumber);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BLDownloadQueuePropertyStoreItemIdentifier));
      v12 = BUDynamicCast(v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)v13;
      v15 = &off_10092EF40;
      if (v13)
        v15 = (_UNKNOWN **)v13;
      v16 = v15;

      v18 = BKLibraryDataSourceMediaLibraryLog(v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138412290;
        v23 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Purchased completed, updating media library jalisco with adamId %@", (uint8_t *)&v22, 0xCu);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController"));
      objc_msgSend(v20, "updateJaliscoMediaLibraryWithReason:completionHandler:", 1, &stru_1008EDB38);

    }
  }
  else
  {
    v21 = BKLibraryItemStateProviderLog(0, v4);
    v6 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1006A38C0();
  }

}

- (void)accountControllerDidAttemptToRedeemCode:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController", a3));
  objc_msgSend(v3, "updateJaliscoMediaLibraryWithReason:completionHandler:", 1, &stru_1008EDB58);

}

- (void)fetchReadyPurchaseItemStoreIDs:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];

  v5 = a3;
  v17 = a4;
  v6 = objc_alloc_init((Class)NSMutableSet);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v13 = BUStoreIdFromObject(v12);
        if (v13)
        {
          v14 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v13));
          objc_msgSend(v6, "addObject:", v14);
        }
        else
        {
          v15 = BKLibraryDataSourceMediaLibraryLog(0);
          v14 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 141558274;
            v25 = 1752392040;
            v26 = 2112;
            v27 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "fetchReadyPurchaseItemStoreIDs - Failed to parse '%{mask.hash}@'", buf, 0x16u);
          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v9);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100198E74;
  v18[3] = &unk_1008EDB80;
  v19 = v17;
  v16 = v17;
  +[BKMusicLibraryUtilities storeIDsWithNonEmptyPurchasedToken:completion:](BKMusicLibraryUtilities, "storeIDsWithNonEmptyPurchasedToken:completion:", v6, v18);

}

- (void)updatePurchaseItemsWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100199064;
  v6[3] = &unk_1008E7B98;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "updateJaliscoMediaLibraryWithReason:completionHandler:", 1, v6);

}

- (BKLibraryManager)libraryManager
{
  return (BKLibraryManager *)objc_loadWeakRetained((id *)&self->_libraryManager);
}

- (NSString)dataSourceIdentifier
{
  return self->_dataSourceIdentifier;
}

- (void)setDataSourceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceIdentifier, a3);
}

- (BKMediaLibraryCache)mediaLibraryCache
{
  return self->_mediaLibraryCache;
}

- (void)setMediaLibraryCache:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibraryCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibraryCache, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
}

@end
