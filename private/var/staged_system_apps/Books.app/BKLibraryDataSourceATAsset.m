@implementation BKLibraryDataSourceATAsset

- (int64_t)rank
{
  return self->_rank;
}

- (void)connection:(id)a3 updatedAssets:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v5, "count")));
  v7 = BKATAssetLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_1006A4290((uint64_t)v5, v8, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1001B913C;
  v36[3] = &unk_1008EE758;
  v36[4] = self;
  v14 = v12;
  v37 = v14;
  v15 = v6;
  v38 = v15;
  v16 = v10;
  v39 = v16;
  v17 = v13;
  v40 = v17;
  v18 = v11;
  v41 = v18;
  v28 = v5;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v36);
  if (objc_msgSend(v16, "isSubsetOfSet:", v17))
    objc_msgSend(v16, "minusSet:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v21 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceATAsset queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013CE0;
  block[3] = &unk_1008EE7D0;
  block[4] = self;
  v30 = v19;
  v31 = v18;
  v32 = v20;
  v33 = v16;
  v34 = v15;
  v35 = v14;
  v22 = v14;
  v23 = v15;
  v24 = v16;
  v25 = v20;
  v26 = v18;
  v27 = v19;
  dispatch_sync(v21, block);

}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (void)setLibraryManager:(id)a3
{
  objc_storeWeak((id *)&self->_libraryManager, a3);
}

- (void)setDataSourceAirTrafficEndedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setConnectionEstablished:(BOOL)a3
{
  self->_connectionEstablished = a3;
}

- (void)setAtAssetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_atAssetIDs, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isSyncing
{
  return self->_syncing;
}

- (BKLibraryDataSourceATAsset)init
{
  BKLibraryDataSourceATAsset *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  NSMutableSet *v8;
  NSMutableSet *atAssetIDs;
  NSMutableDictionary *v10;
  NSMutableDictionary *atAssetsInFlight;
  ATConnection *v12;
  ATConnection *connection;
  NSObject *v14;
  _QWORD block[4];
  BKLibraryDataSourceATAsset *v17;
  objc_super v18;

  kdebug_trace(725353716, 20, 0, 0, 0);
  v18.receiver = self;
  v18.super_class = (Class)BKLibraryDataSourceATAsset;
  v3 = -[BKLibraryDataSourceATAsset init](&v18, "init");
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("com.apple.ibooks.BKLibraryDataSourceATAssetQueue", v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    v8 = objc_opt_new(NSMutableSet);
    atAssetIDs = v3->_atAssetIDs;
    v3->_atAssetIDs = v8;

    v10 = objc_opt_new(NSMutableDictionary);
    atAssetsInFlight = v3->_atAssetsInFlight;
    v3->_atAssetsInFlight = v10;

    v12 = objc_opt_new(ATConnection);
    connection = v3->_connection;
    v3->_connection = v12;

    -[ATConnection setDelegate:](v3->_connection, "setDelegate:", v3);
    v14 = v3->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100063FC0;
    block[3] = &unk_1008E72C0;
    v17 = v3;
    dispatch_async(v14, block);

  }
  kdebug_trace(725353716, 21, 0, 0, 0);
  return v3;
}

- (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.ibooks.progress.airtraffic");
}

- (BOOL)connectionEstablished
{
  return self->_connectionEstablished;
}

- (void)connection:(id)a3 updatedProgress:(id)a4
{
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Dataclass")));
  v7 = -[BKLibraryDataSourceATAsset _supportsDataclass:assetType:](self, "_supportsDataclass:assetType:", v6, 0);
  v8 = BKATAssetLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_1006A416C(v5, v7, v9);

  if ((v7 & 1) != 0 || -[BKLibraryDataSourceATAsset isSyncing](self, "isSyncing"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Enabled")));
    v11 = objc_msgSend(v10, "BOOLValue");

    if ((_DWORD)v11 != -[BKLibraryDataSourceATAsset isSyncing](self, "isSyncing"))
    {
      -[BKLibraryDataSourceATAsset setSyncing:](self, "setSyncing:", v11);
      if ((_DWORD)v11)
        -[BKLibraryDataSourceATAsset _syncDidStart](self, "_syncDidStart");
      else
        -[BKLibraryDataSourceATAsset _syncDidFinish](self, "_syncDidFinish");
    }
  }

}

- (NSMutableSet)atAssetIDs
{
  return self->_atAssetIDs;
}

- (BOOL)_supportsDataclass:(id)a3 assetType:(id)a4
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("Book"), a4);
}

- (void)dealloc
{
  objc_super v3;

  -[ATConnection setDelegate:](self->_connection, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryDataSourceATAsset;
  -[BKLibraryDataSourceATAsset dealloc](&v3, "dealloc");
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)fetchAssetsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceATAsset queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001B8AA0;
  v7[3] = &unk_1008E7950;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (int64_t)coverSourceRank
{
  return 4;
}

- (void)pushCoverForAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetID", (_QWORD)v19));
        v12 = v11;
        if (v11)
          v13 = v11;
        else
          v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "temporaryAssetID"));
        v14 = v13;

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "atAsset"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "icon"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path"));

        if (v14 && objc_msgSend(v17, "length"))
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    objc_msgSend(v18, "addFilePaths:priority:quality:", v4, 3, 206);

  }
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

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  if (!a4)
  {
    v9 = BKATAssetLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1006A412C(v10);

  }
  v11 = objc_retainBlock(v8);
  v12 = v11;
  if (v11)
    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);

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

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "temporaryAssetID"));
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceATAsset queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001B8F0C;
    block[3] = &unk_1008E8898;
    block[4] = self;
    v12 = v7;
    v13 = v6;
    dispatch_async(v8, block);

  }
  else
  {
    v9 = objc_retainBlock(v6);
    v10 = v9;
    if (v9)
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);

  }
}

- (BOOL)prioritizeImport:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceATAsset queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B905C;
  block[3] = &unk_1008E8898;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

  return 1;
}

- (BOOL)canRedownloadAssets
{
  return 0;
}

- (BOOL)canMakeAssetsLocal
{
  return 0;
}

- (void)airTrafficEnded
{
  uint64_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = BKATAssetLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BKLibraryDataSourceATAsset-airTrafficEnded: scheduling a plist reload", buf, 2u);
  }

  v5 = dispatch_time(0, 1500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B9704;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_syncDidStart
{
  uint64_t v2;
  NSObject *v3;

  v2 = BKATAssetLog(self, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1006A4390(v3);

}

- (void)_syncDidFinish
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceATAsset queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B97EC;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BKLibraryManager)libraryManager
{
  return (BKLibraryManager *)objc_loadWeakRetained((id *)&self->_libraryManager);
}

- (id)dataSourceAirTrafficEndedHandler
{
  return self->_dataSourceAirTrafficEndedHandler;
}

- (ATConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)setSyncing:(BOOL)a3
{
  self->_syncing = a3;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)atAssetsInFlight
{
  return self->_atAssetsInFlight;
}

- (void)setAtAssetsInFlight:(id)a3
{
  objc_storeStrong((id *)&self->_atAssetsInFlight, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atAssetsInFlight, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_atAssetIDs, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_dataSourceAirTrafficEndedHandler, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
}

@end
