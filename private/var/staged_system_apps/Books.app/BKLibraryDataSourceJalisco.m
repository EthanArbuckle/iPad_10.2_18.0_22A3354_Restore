@implementation BKLibraryDataSourceJalisco

+ (void)initialize
{
  void *v2;
  void *v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  id v6;

  if ((id)objc_opt_class(BKLibraryDataSourceJalisco) == a1)
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    objc_msgSend(v6, "setObject:forKey:", v2, CFSTR("BKShowAllPurchases"));

    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v3, "registerDefaults:", v6);

    global_queue = dispatch_get_global_queue(-2, 0);
    v5 = objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v5, &stru_1008EF4F8);

  }
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (int64_t)rank
{
  return self->_rank;
}

- (void)setLibraryManager:(id)a3
{
  objc_storeWeak((id *)&self->_libraryManager, a3);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BKLibraryDataSourceJalisco)initWithIdentifier:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  BKLibraryDataSourceJalisco *v9;
  BKLibraryDataSourceJalisco *v10;
  id v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *dispatchQueue;
  NSMutableArray *v14;
  NSMutableArray *monitoredStoreIDs;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  id v22;

  v5 = a3;
  v6 = kdebug_trace(725353716, 26, 0, 0, 0);
  v7 = BKLibraryDataSourceJaliscoLog(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[JaliscoDS] initWithIdentifier: %@", buf, 0xCu);
  }

  v20.receiver = self;
  v20.super_class = (Class)BKLibraryDataSourceJalisco;
  v9 = -[BKLibraryDataSourceJalisco init](&v20, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", CFSTR(".dispatchQueue"))));
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
    dispatchQueue = v10->_dispatchQueue;
    v10->_dispatchQueue = (OS_dispatch_queue *)v12;

    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    monitoredStoreIDs = v10->_monitoredStoreIDs;
    v10->_monitoredStoreIDs = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryDataSourceJaliscoDAAPClientProxy sharedproxy](BKLibraryDataSourceJaliscoDAAPClientProxy, "sharedproxy"));
    objc_msgSend(v16, "registerDataSource:", v10);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
    objc_msgSend(v17, "addObserver:forKeyPath:options:context:", v10, CFSTR("initiallyLoadingJalisco"), 0, off_1009CDAC0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
    objc_msgSend(v18, "addObserver:", v10);

  }
  kdebug_trace(725353716, 27, 0, 0, 0);

  return v10;
}

- (void)setShouldReloadAfterAssetAdded:(BOOL)a3
{
  self->_shouldReloadAfterAssetAdded = a3;
}

- (void)setPlistWriter:(id)a3
{
  objc_storeWeak((id *)&self->_plistWriter, a3);
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;

  v3 = BKLibraryDataSourceJaliscoLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco identifier](self, "identifier"));
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BKLibraryDataSourceJalisco identifier: %@ dealloc", buf, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryDataSourceJaliscoDAAPClientProxy sharedproxy](BKLibraryDataSourceJaliscoDAAPClientProxy, "sharedproxy"));
  objc_msgSend(v6, "unregisterDataSource:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
  objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("initiallyLoadingJalisco"), off_1009CDAC0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
  objc_msgSend(v8, "removeObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)BKLibraryDataSourceJalisco;
  -[BKLibraryDataSourceJalisco dealloc](&v9, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  BKLibraryDataSourceJalisco *v13;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_1009CDAC0 == a6)
  {
    v13 = self;
    objc_sync_enter(v13);
    -[BKLibraryDataSourceJalisco _updateProcessingAuthenticationState](v13, "_updateProcessingAuthenticationState");
    objc_sync_exit(v13);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BKLibraryDataSourceJalisco;
    -[BKLibraryDataSourceJalisco observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (BOOL)isEnabled
{
  return 1;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco identifier](self, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@=%p id=%@ rank=%ld>"), v5, self, v6, -[BKLibraryDataSourceJalisco rank](self, "rank")));

  return (NSString *)v7;
}

- (unint64_t)propagateDataProperties
{
  return 268370174;
}

- (void)fetchAssetIDsWithPredicate:(id)a3 bookletPredicate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001D48E4;
  v15[3] = &unk_1008EF520;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(dispatchQueue, v15);

}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  kdebug_trace(725353716, 74, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "predicateForItems:", 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "predicateForBookletItems:", 0));

  v10 = BKLibraryDataSourceJaliscoLog(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco identifier](self, "identifier"));
    *(_DWORD *)buf = 138412802;
    v17 = v12;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ [JaliscoDS] fetchAssetIDsWithCompletion: predicate %@. bookletPredicate %@", buf, 0x20u);

  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001D4FE8;
  v14[3] = &unk_1008E9D38;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  -[BKLibraryDataSourceJalisco fetchAssetIDsWithPredicate:bookletPredicate:completion:](self, "fetchAssetIDsWithPredicate:bookletPredicate:completion:", v6, v8, v14);

}

- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BKLibraryDataSourceJalisco *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  kdebug_trace(725353716, 76, 0, 0, 0);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D51E0;
  block[3] = &unk_1008E8898;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (int64_t)coverSourceRank
{
  return 3;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  NSObject *dispatchQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  unsigned __int8 v30;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "storeID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "storePlaylistID"));
  v15 = objc_msgSend(v10, "isSupplementalContent");

  dispatchQueue = self->_dispatchQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001D5AB8;
  v23[3] = &unk_1008E8F58;
  v23[4] = self;
  v24 = v12;
  v30 = v15;
  v25 = v13;
  v26 = v11;
  v27 = v14;
  v28 = v8;
  v29 = v9;
  v17 = v9;
  v18 = v8;
  v19 = v14;
  v20 = v11;
  v21 = v13;
  v22 = v12;
  dispatch_async(dispatchQueue, v23);

}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *dispatchQueue;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  BKLibraryDataSourceJalisco *v22;
  id v23;
  id v24;
  unsigned __int8 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
  v11 = objc_msgSend(v7, "isSupplementalContent");

  v13 = BKLibraryDataSourceJaliscoLog(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco identifier](self, "identifier"));
    *(_DWORD *)buf = 138412802;
    v27 = v15;
    v28 = 2112;
    v29 = v9;
    v30 = 2112;
    v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ assetForLibraryAsset: (assetID:%@, title:%@)", buf, 0x20u);

  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D66F4;
  block[3] = &unk_1008EE1B8;
  v25 = v11;
  v21 = v8;
  v22 = self;
  v23 = v10;
  v24 = v6;
  v17 = v10;
  v18 = v6;
  v19 = v8;
  dispatch_async(dispatchQueue, block);

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
  v7[2] = sub_1001D6B38;
  v7[3] = &unk_1008E9D10;
  v7[4] = self;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[BCStopWatch stopwatch](BCStopWatch, "stopwatch"));
  v9 = v4;
  v5 = v4;
  v6 = v8;
  -[BKLibraryDataSourceJalisco fetchAssetIDsWithCompletion:](self, "fetchAssetIDsWithCompletion:", v7);

}

- (void)hiddenAssetStoreIDsWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
  objc_msgSend(v4, "fetchAllHiddenItemStoreIDsWithCompletion:", v3);

}

- (void)downloadQueue:(id)a3 purchasedDidCompleteWithResponse:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;

  v5 = a4;
  v6 = BKLibraryDataSourceJaliscoLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco identifier](self, "identifier"));
    *(_DWORD *)buf = 138412546;
    v25 = v8;
    v26 = 2112;
    v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BKLibraryDataSourceJalisco %@ purchasedDidCompleteWithResponse: %@", buf, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
  v10 = objc_msgSend(v9, "newManagedObjectContext");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "purchaseParameters"));
  if (objc_msgSend(v12, "length"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fetchRequestForStoreID:", v12));
  }
  else
  {
    if (!objc_msgSend(v13, "length"))
    {
      v16 = 0;
      goto LABEL_14;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fetchRequestForBuyParameters:", v13));
  }
  v16 = (void *)v15;

  if (!v16)
  {
LABEL_14:
    v17 = 0;
    v18 = 0;
    goto LABEL_15;
  }
  v23 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "executeFetchRequest:error:", v16, &v23));
  v18 = v23;
  if (!objc_msgSend(v17, "count"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[BDSJaliscoDAAPClient sharedClient](BDSJaliscoDAAPClient, "sharedClient"));
    objc_msgSend(v19, "updatePolitely:reason:completion:", 0, 13, &stru_1008EF540);

    if (v18)
    {
      v21 = BKLibraryDataSourceJaliscoLog(v20);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_1006A5DF0();

    }
  }
LABEL_15:

}

- (id)_serverItemForStoreID:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fetchRequestForStoreID:", v6));

  v12 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v8, &v12));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  return v10;
}

- (id)_bookletItemForStoreID:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fetchRequestForBookletItems:", v8));
  v13 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v9, &v13));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  return v11;
}

- (id)_serverItemsForStoreIDSet:(id)a3 moc:(id)a4 dedupe:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fetchRequestForStoreIDs:", v8));

  v14 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v10, &v14));

  if (v5)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bu_arrayByRemovingItemsWithDuplicateValuesForKey:", CFSTR("storeID")));

    v11 = (void *)v12;
  }

  return v11;
}

- (id)_bookletItemsForStoreIDSet:(id)a3 moc:(id)a4 dedupe:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fetchRequestForBookletItems:", v8));

  v14 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v10, &v14));

  if (v5)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bu_arrayByRemovingItemsWithDuplicateValuesForKey:", CFSTR("storeID")));

    v11 = (void *)v12;
  }

  return v11;
}

- (id)_jaliscoAssetsForStoreIDs:(id)a3 moc:(id)a4 dedupe:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  BKLibraryDataSourceJalisco *v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco _serverItemsForStoreIDSet:moc:dedupe:](self, "_serverItemsForStoreIDSet:moc:dedupe:", v10, v9, v5));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001D7620;
    v15[3] = &unk_1008EF568;
    v13 = v11;
    v16 = v13;
    v17 = self;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_supplementalAssetsForBookletStoreIDs:(id)a3 moc:(id)a4 dedupe:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  BKLibraryDataSourceJalisco *v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco _bookletItemsForStoreIDSet:moc:dedupe:](self, "_bookletItemsForStoreIDSet:moc:dedupe:", v10, v9, v5));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001D77B4;
    v15[3] = &unk_1008EF590;
    v13 = v11;
    v16 = v13;
    v17 = self;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_supplementalAssetFromServerBookletItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco identifier](self, "identifier"));
    v7 = +[BKJaliscoAsset newAssetFromServerItem:dataSourceIdentifier:](BKJaliscoAsset, "newAssetFromServerItem:dataSourceIdentifier:", v5, v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoBookletItem itemWithServerBookletItem:](BLJaliscoBookletItem, "itemWithServerBookletItem:", v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco identifier](self, "identifier"));
    v10 = +[BKLibrarySupplementalAsset newAssetFromJaliscoBookletItem:parentAsset:dataSourceIdentifier:](BKLibrarySupplementalAsset, "newAssetFromJaliscoBookletItem:parentAsset:dataSourceIdentifier:", v8, v7, v9);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_supplementalAssetForStoreID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
  v6 = objc_msgSend(v5, "newManagedObjectContext");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco _bookletItemForStoreID:moc:](self, "_bookletItemForStoreID:moc:", v4, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco _supplementalAssetFromServerBookletItem:](self, "_supplementalAssetFromServerBookletItem:", v7));

  return v8;
}

- (void)beginAuthentication:(id)a3
{
  BKLibraryDataSourceJalisco *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", BKLibraryAuthenticationServiceStore))
  {
    v4 = self;
    objc_sync_enter(v4);
    v4->_requestedAuthentication = 1;
    -[BKLibraryDataSourceJalisco _updateProcessingAuthenticationState](v4, "_updateProcessingAuthenticationState");
    objc_sync_exit(v4);

  }
}

- (void)finalizeAuthentication:(id)a3
{
  BKLibraryDataSourceJalisco *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", BKLibraryAuthenticationServiceStore))
  {
    v4 = self;
    objc_sync_enter(v4);
    v4->_requestedAuthentication = 0;
    -[BKLibraryDataSourceJalisco _updateProcessingAuthenticationState](v4, "_updateProcessingAuthenticationState");
    objc_sync_exit(v4);

  }
}

- (void)_updateProcessingAuthenticationState
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D7AB4;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BKLibraryDataSourceJalisco *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D7BC0;
  block[3] = &unk_1008E7928;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)managedObjectBackgroundMonitor:(id)a3 fetchNotify:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  BKLibraryDataSourceJalisco *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = BKLibraryDataSourceJaliscoLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco identifier](self, "identifier"));
    *(_DWORD *)buf = 138412546;
    v19 = v10;
    v20 = 2112;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ managedObjectBackgroundMonitor called with monitor: %@", buf, 0x16u);

  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D7F2C;
  block[3] = &unk_1008E7928;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_processLibraryAssetChanges:(id)a3 bookletItems:(BOOL)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  NSMutableArray *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSMutableArray *v32;
  id v33;
  NSMutableArray *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  _BOOL4 v73;
  _QWORD v74[4];
  id v75;
  id v76;
  NSMutableArray *v77;
  _QWORD v78[4];
  id v79;
  NSMutableArray *v80;
  BKLibraryDataSourceJalisco *v81;
  BOOL v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  id v86;
  __int16 v87;
  void *v88;

  v73 = a4;
  v5 = a3;
  v6 = BKLibraryDataSourceJaliscoLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco identifier](self, "identifier"));
    *(_DWORD *)buf = 138412546;
    v84 = v8;
    v85 = 2112;
    v86 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ _processLibraryAssetChanges %@", buf, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deletedObjects"));
  if (objc_msgSend(v9, "count"))
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deletedObjects"));
  else
    v10 = 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addedObjects"));
  if (objc_msgSend(v11, "count"))
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addedObjects"));
  else
    v12 = 0;

  v71 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
  v13 = objc_msgSend(v71, "newManagedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v10));
  objc_msgSend(v14, "addObjectsFromArray:", v12);
  v70 = v14;
  if (v73)
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco _bookletItemsForStoreIDSet:moc:dedupe:](self, "_bookletItemsForStoreIDSet:moc:dedupe:", v14, v13, 0));
  else
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco _serverItemsForStoreIDSet:moc:dedupe:](self, "_serverItemsForStoreIDSet:moc:dedupe:", v14, v13, 0));
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForKey:", CFSTR("storeID")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet setWithArray:](NSCountedSet, "setWithArray:", v17));

  v72 = v13;
  if (objc_msgSend(v10, "count"))
  {
    v19 = objc_opt_new(NSMutableArray);
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_1001D8DB4;
    v78[3] = &unk_1008EF5B8;
    v79 = v18;
    v82 = v73;
    v20 = v19;
    v80 = v20;
    v81 = self;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v78);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKey:](v20, "valueForKey:", CFSTR("storeID")));
    v22 = BKLibraryDataSourceJaliscoLog(v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v68 = v5;
      v24 = v18;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco identifier](self, "identifier"));
      v26 = v12;
      v27 = v10;
      v28 = -[NSMutableArray count](v20, "count");
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", ")));
      *(_DWORD *)buf = 138412802;
      v84 = v25;
      v85 = 2048;
      v86 = v28;
      v10 = v27;
      v12 = v26;
      v13 = v72;
      v87 = 2112;
      v88 = v29;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@ Telling library to remove %ld assets:[%@]", buf, 0x20u);

      v18 = v24;
      v5 = v68;

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco libraryManager](self, "libraryManager"));
    objc_msgSend(v30, "libraryDataSource:removedAssets:", self, v20);

  }
  if (objc_msgSend(v12, "count"))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet setWithArray:](NSCountedSet, "setWithArray:", v12));
    v32 = objc_opt_new(NSMutableArray);
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_1001D8E90;
    v74[3] = &unk_1008EF5E0;
    v69 = v18;
    v75 = v18;
    v33 = v31;
    v76 = v33;
    v34 = v32;
    v77 = v34;
    objc_msgSend(v33, "enumerateObjectsUsingBlock:", v74);
    if (v73)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco _supplementalAssetsForBookletStoreIDs:moc:dedupe:](self, "_supplementalAssetsForBookletStoreIDs:moc:dedupe:", v34, v13, 1));
      v36 = BKLibraryDataSourceJaliscoLog(v35);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco identifier](self, "identifier"));
        v39 = v10;
        v40 = objc_msgSend(v35, "count");
        v66 = v12;
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v34, "componentsJoinedByString:", CFSTR(", ")));
        *(_DWORD *)buf = 138412802;
        v84 = v38;
        v85 = 2048;
        v86 = v40;
        v10 = v39;
        v13 = v72;
        v87 = 2112;
        v88 = v41;
        v42 = "%@ Telling library we added %ld booklet assets, storeIDs=[%@]";
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v42, buf, 0x20u);

        v12 = v66;
      }
    }
    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco _jaliscoAssetsForStoreIDs:moc:dedupe:](self, "_jaliscoAssetsForStoreIDs:moc:dedupe:", v34, v13, 1));
      v43 = BKLibraryDataSourceJaliscoLog(v35);
      v37 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco identifier](self, "identifier"));
        v44 = v10;
        v45 = objc_msgSend(v35, "count");
        v66 = v12;
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v34, "componentsJoinedByString:", CFSTR(", ")));
        *(_DWORD *)buf = 138412802;
        v84 = v38;
        v85 = 2048;
        v86 = v45;
        v10 = v44;
        v13 = v72;
        v87 = 2112;
        v88 = v41;
        v42 = "%@ Telling library we added %ld assets, storeIDs=[%@]";
        goto LABEL_22;
      }
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    objc_msgSend(v46, "addProductProfileIDs:priority:", v34, 3);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco libraryManager](self, "libraryManager"));
    objc_msgSend(v47, "libraryDataSource:addedAssets:", self, v35);

    if (-[BKLibraryDataSourceJalisco shouldReloadAfterAssetAdded](self, "shouldReloadAfterAssetAdded"))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco libraryManager](self, "libraryManager"));
      objc_msgSend(v48, "reloadDataSource:completion:", self, 0);

    }
    v18 = v69;
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updatedObjects", v66));
  if (objc_msgSend(v49, "count"))
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updatedObjects"));
  else
    v50 = 0;

  if (objc_msgSend(v50, "count"))
  {
    v67 = v10;
    if (v73)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco _supplementalAssetsForBookletStoreIDs:moc:dedupe:](self, "_supplementalAssetsForBookletStoreIDs:moc:dedupe:", v50, v72, 1));
      v52 = BKLibraryDataSourceJaliscoLog(v51);
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco identifier](self, "identifier"));
        v55 = objc_msgSend(v51, "count");
        v56 = v5;
        v57 = v18;
        v58 = v12;
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "componentsJoinedByString:", CFSTR(", ")));
        *(_DWORD *)buf = 138412802;
        v84 = v54;
        v85 = 2048;
        v86 = v55;
        v87 = 2112;
        v88 = v59;
        v60 = "%@ Telling library we updated %ld booklet assets, storeIDs=[%@]";
LABEL_35:
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, v60, buf, 0x20u);

        v12 = v58;
        v18 = v57;
        v5 = v56;
      }
    }
    else
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco _jaliscoAssetsForStoreIDs:moc:dedupe:](self, "_jaliscoAssetsForStoreIDs:moc:dedupe:", v50, v72, 1));
      v61 = BKLibraryDataSourceJaliscoLog(v51);
      v53 = objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco identifier](self, "identifier"));
        v62 = objc_msgSend(v51, "count");
        v56 = v5;
        v57 = v18;
        v58 = v12;
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "componentsJoinedByString:", CFSTR(", ")));
        *(_DWORD *)buf = 138412802;
        v84 = v54;
        v85 = 2048;
        v86 = v62;
        v87 = 2112;
        v88 = v59;
        v60 = "%@ Telling library we updated %ld assets, storeIDs=[%@]";
        goto LABEL_35;
      }
    }

    v63 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v50));
    objc_msgSend(v63, "incrementVersionForIdentifiers:", v64);

    v65 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco libraryManager](self, "libraryManager"));
    objc_msgSend(v65, "libraryDataSource:updatedAssets:", self, v51);

    v10 = v67;
    v13 = v72;
  }

}

- (void)clientDetectedStoreChange:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;

  v4 = BKLibraryDataSourceJaliscoLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco identifier](self, "identifier"));
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ clientDetectedStoreChange triggering reload of jalisco datasource", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco libraryManager](self, "libraryManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001D904C;
  v8[3] = &unk_1008E72C0;
  v8[4] = self;
  objc_msgSend(v7, "reloadDataSource:completion:", self, v8);

}

- (void)clientDetectedPredicateChange:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = BKLibraryDataSourceJaliscoLog(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco identifier](self, "identifier"));
    v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ clientDetectedPredicateChange triggering reload of jalisco datasource", (uint8_t *)&v8, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco libraryManager](self, "libraryManager"));
  objc_msgSend(v7, "reloadDataSource:completion:", self, 0);

}

+ (BOOL)isShowPurchasesEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("BKShowAllPurchases"));

  return v3;
}

+ (void)setShowPurchasesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("BKShowAllPurchases"));

}

- (void)fetchReadyPurchaseItemStoreIDs:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001D931C;
  v9[3] = &unk_1008EDB80;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "storeIDsWithNonEmptyPurchasedToken:completion:", v6, v9);

}

- (void)updatePurchaseItemsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceJalisco libraryManager](self, "libraryManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001D9414;
  v7[3] = &unk_1008E7818;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "reloadDataSource:completion:", self, v7);

}

- (void)reloadPurchaseItemStoreIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BDSJaliscoDAAPClient sharedClient](BDSJaliscoDAAPClient, "sharedClient"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001D9500;
  v10[3] = &unk_1008E8058;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "resetPurchasedTokenForStoreIDs:completion:", v7, v10);

}

- (BKLibraryManager)libraryManager
{
  return (BKLibraryManager *)objc_loadWeakRetained((id *)&self->_libraryManager);
}

- (BOOL)shouldReloadAfterAssetAdded
{
  return self->_shouldReloadAfterAssetAdded;
}

- (BKLibraryDataSourcePlistWriting)plistWriter
{
  return (BKLibraryDataSourcePlistWriting *)objc_loadWeakRetained((id *)&self->_plistWriter);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BCRemoteManagedObjectIDMonitor)libraryAssetMonitor
{
  return self->_libraryAssetMonitor;
}

- (void)setLibraryAssetMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_libraryAssetMonitor, a3);
}

- (BCRemoteManagedObjectIDMonitor)bookletAssetMonitor
{
  return self->_bookletAssetMonitor;
}

- (void)setBookletAssetMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_bookletAssetMonitor, a3);
}

- (NSMutableArray)monitoredStoreIDs
{
  return self->_monitoredStoreIDs;
}

- (void)setMonitoredStoreIDs:(id)a3
{
  objc_storeStrong((id *)&self->_monitoredStoreIDs, a3);
}

- (NSPredicate)bookletItemsPredicate
{
  return self->_bookletItemsPredicate;
}

- (void)setBookletItemsPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_bookletItemsPredicate, a3);
}

- (id)fetchCompletion
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setFetchCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (BOOL)processingAuthentication
{
  return self->_processingAuthentication;
}

- (void)setProcessingAuthentication:(BOOL)a3
{
  self->_processingAuthentication = a3;
}

- (BOOL)requestedAuthentication
{
  return self->_requestedAuthentication;
}

- (void)setRequestedAuthentication:(BOOL)a3
{
  self->_requestedAuthentication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchCompletion, 0);
  objc_storeStrong((id *)&self->_bookletItemsPredicate, 0);
  objc_storeStrong((id *)&self->_monitoredStoreIDs, 0);
  objc_storeStrong((id *)&self->_bookletAssetMonitor, 0);
  objc_storeStrong((id *)&self->_libraryAssetMonitor, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_plistWriter);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
}

@end
