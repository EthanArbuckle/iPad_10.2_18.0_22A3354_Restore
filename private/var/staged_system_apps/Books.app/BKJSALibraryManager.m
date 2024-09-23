@implementation BKJSALibraryManager

- (BKJSALibraryManager)initWithLibraryAssetProvider:(id)a3 presentersProvider:(id)a4 storeController:(id)a5
{
  id v8;
  id v9;
  id v10;
  BKJSALibraryManager *v11;
  BKJSALibraryManager *v12;
  uint64_t v13;
  NSObject *v14;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)BKJSALibraryManager;
  v11 = -[BKJSALibraryManager init](&v20, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_libraryAssetProvider, v8);
    objc_storeWeak((id *)&v12->_presentersProvider, v9);
    objc_storeStrong((id *)&v12->_storeController, a5);
    if (!v12->_storeController)
    {
      v13 = JSALog();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        sub_1006A2A3C(v14);

    }
    v15 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = dispatch_queue_create("BKJSALibraryManager.queue", v16);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v17;

  }
  return v12;
}

- (void)openAssetID:(id)a3 options:(id)a4 tracker:(id)a5 completionHandler:(id)a6
{
  -[BKJSALibraryManager _openAssetID:options:sampleURL:isSample:tracker:callback:](self, "_openAssetID:options:sampleURL:isSample:tracker:callback:", a3, a4, 0, 0, a5, a6);
}

- (void)sampleAssetID:(id)a3 url:(id)a4 options:(id)a5 tracker:(id)a6 completionHandler:(id)a7
{
  -[BKJSALibraryManager _openAssetID:options:sampleURL:isSample:tracker:callback:](self, "_openAssetID:options:sampleURL:isSample:tracker:callback:", a3, a5, a4, 1, a6, a7);
}

- (void)previewAssetID:(id)a3 asset:(id)a4 tracker:(id)a5 completionHandler:(id)a6
{
  -[BKJSALibraryManager _previewAssetID:asset:fullScreen:tracker:callback:](self, "_previewAssetID:asset:fullScreen:tracker:callback:", a3, a4, 0, a5, a6);
}

- (void)downloadAssetIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100167BB8;
  v7[3] = &unk_1008EB968;
  v8 = a4;
  v6 = v8;
  -[BKJSALibraryManager _downloadAssetIDs:callback:](self, "_downloadAssetIDs:callback:", a3, v7);

}

- (void)cancelDownloadForAssetID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BKJSALibraryManager *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSALibraryManager libraryAssetProvider](self, "libraryAssetProvider"));
  v16 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100167D08;
  v12[3] = &unk_1008ECAC8;
  v14 = self;
  v15 = v7;
  v13 = v6;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "fetchLibraryAssetsFromAssetIDs:handler:", v9, v12);

}

- (void)updateAssetIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100167E90;
  v7[3] = &unk_1008EB968;
  v8 = a4;
  v6 = v8;
  -[BKJSALibraryManager _updateAssetIDs:callback:](self, "_updateAssetIDs:callback:", a3, v7);

}

- (void)addAssetID:(id)a3 toCollectionID:(id)a4 tracker:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(objc_alloc((Class)BSUIAssetActionModifyRequest), "initWithStoreID:collectionID:tracker:", v13, v12, v11);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100167FAC;
  v16[3] = &unk_1008ECAF0;
  v17 = v10;
  v15 = v10;
  -[BKJSALibraryManager performAddRequest:completionHandler:](self, "performAddRequest:completionHandler:", v14, v16);

}

- (void)performAddRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[8];
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tracker"));

  v11 = objc_msgSend(objc_alloc((Class)BKCollectionControllerMemberManagingAddRequest), "initWithStoreID:collectionID:forceToTop:", v8, v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSALibraryManager libraryAssetProvider](self, "libraryAssetProvider"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionController"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10016813C;
  v15[3] = &unk_1008ECB18;
  v15[4] = self;
  v15[5] = v8;
  v15[6] = v10;
  v15[7] = v9;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v13, "performAddRequest:completion:", v11, v15);

}

- (void)removeAssetID:(id)a3 fromCollectionID:(id)a4 tracker:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(objc_alloc((Class)BSUIAssetActionModifyRequest), "initWithStoreID:collectionID:tracker:", v13, v12, v11);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100168428;
  v16[3] = &unk_1008ECAF0;
  v17 = v10;
  v15 = v10;
  -[BKJSALibraryManager performRemoveRequest:completionHandler:](self, "performRemoveRequest:completionHandler:", v14, v16);

}

- (void)performRemoveRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[8];
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tracker"));

  v11 = objc_msgSend(objc_alloc((Class)BKCollectionControllerMemberManagingRemoveRequest), "initWithStoreID:collectionID:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSALibraryManager libraryAssetProvider](self, "libraryAssetProvider"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionController"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001685B4;
  v15[3] = &unk_1008ECB18;
  v15[4] = self;
  v15[5] = v8;
  v15[6] = v10;
  v15[7] = v9;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v13, "performRemoveRequest:completion:", v11, v15);

}

- (void)_fetchFinishedLibraryAssetWithAssetID:(id)a3 waitForNewAssetIfNeeded:(BOOL)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BKJSALibraryManager *v16;
  id v17;
  BOOL v18;

  v8 = a3;
  v9 = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100168858;
  v13[3] = &unk_1008ECB40;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v15 = v8;
  v18 = a4;
  v16 = self;
  v17 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v14;
  objc_msgSend(v12, "performBlockOnWorkerQueue:", v13);

}

- (void)setFinishedDateForAssetID:(id)a3 toDate:(id)a4 tracker:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  BKJSALibraryManager *v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100168B68;
  v17[3] = &unk_1008ECB68;
  v21 = v10;
  v22 = a6;
  v18 = v11;
  v19 = v12;
  v20 = self;
  v13 = v10;
  v14 = v12;
  v15 = v22;
  v16 = v11;
  -[BKJSALibraryManager _fetchFinishedLibraryAssetWithAssetID:waitForNewAssetIfNeeded:callback:](self, "_fetchFinishedLibraryAssetWithAssetID:waitForNewAssetIfNeeded:callback:", v13, 1, v17);

}

- (void)setFinishedYearForAssetID:(id)a3 toYearOfDate:(id)a4 tracker:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  BKJSALibraryManager *v21;
  id v22;
  id v23;
  NSErrorUserInfoKey v24;
  const __CFString *v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (_os_feature_enabled_impl("Books", "fuzzyFinishedDate"))
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100168ED0;
    v18[3] = &unk_1008ECB68;
    v19 = v11;
    v23 = v13;
    v20 = v12;
    v21 = self;
    v22 = v10;
    -[BKJSALibraryManager _fetchFinishedLibraryAssetWithAssetID:waitForNewAssetIfNeeded:callback:](self, "_fetchFinishedLibraryAssetWithAssetID:waitForNewAssetIfNeeded:callback:", v22, 1, v18);

    v14 = v19;
  }
  else
  {
    v24 = NSLocalizedDescriptionKey;
    v25 = CFSTR("Set finished year feature is not enabled");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKJSALibraryManager"), -1, v15));

    v16 = objc_retainBlock(v13);
    v17 = v16;
    if (v16)
      (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v14);

  }
}

- (void)unsetFinishedDateForAssetID:(id)a3 callback:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001690FC;
  v7[3] = &unk_1008ECB90;
  v8 = a4;
  v6 = v8;
  -[BKJSALibraryManager _fetchFinishedLibraryAssetWithAssetID:waitForNewAssetIfNeeded:callback:](self, "_fetchFinishedLibraryAssetWithAssetID:waitForNewAssetIfNeeded:callback:", a3, 1, v7);

}

- (void)getVersion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _UNKNOWN **v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v6 = &off_10092F548;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  objc_msgSend(v4, "enqueueValueCall:arguments:file:line:", v3, v5, CFSTR("BKJSALibraryManager.m"), 304);

}

- (id)mostRecentPurchaseDate
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mostRecentPurchaseDate"));

  v7 = JSALog(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MRP: JS get mrp = %@", (uint8_t *)&v10, 0xCu);
  }

  return v3;
}

- (void)openBook:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v10 = JSALog(v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136446466;
    v13 = "-[BKJSALibraryManager openBook:options:]";
    v14 = 2112;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s assetID=%@", (uint8_t *)&v12, 0x16u);
  }

  -[BKJSALibraryManager _openAssetID:options:sampleURL:isSample:tracker:callback:](self, "_openAssetID:options:sampleURL:isSample:tracker:callback:", v6, v7, 0, 0, 0, &stru_1008ECBB0);
}

- (void)openBook:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  v16 = JSALog(v13, v14, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v24 = "-[BKJSALibraryManager openBook::::]";
    v25 = 2112;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s assetID=%@", buf, 0x16u);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100169580;
  v20[3] = &unk_1008E73F0;
  v21 = v10;
  v22 = v11;
  v18 = v11;
  v19 = v10;
  -[BKJSALibraryManager _openAssetID:options:sampleURL:isSample:tracker:callback:](self, "_openAssetID:options:sampleURL:isSample:tracker:callback:", v19, v13, 0, 0, v12, v20);

}

- (void)downloadBooks:(id)a3 :(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v10 = JSALog(v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", ")));
    *(_DWORD *)buf = 136446466;
    v17 = "-[BKJSALibraryManager downloadBooks::]";
    v18 = 2112;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s assetIDs=[%@]", buf, 0x16u);

  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10016985C;
  v14[3] = &unk_1008EB480;
  v15 = v7;
  v13 = v7;
  -[BKJSALibraryManager _downloadAssetIDs:callback:](self, "_downloadAssetIDs:callback:", v6, v14);

}

- (void)downloadBookWithRedownloadParameters:(id)a3 :(BOOL)a4 :(id)a5 :(id)a6 :(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  id v34;

  v7 = a7;
  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BLUtilities storeIDFromBuyParameters:](BLUtilities, "storeIDFromBuyParameters:", v12));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));

  v20 = JSALog(v17, v18, v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    v26 = "-[BKJSALibraryManager downloadBookWithRedownloadParameters:::::]";
    v27 = 2112;
    v28 = v16;
    v29 = 1024;
    v30 = v10;
    v31 = 1024;
    v32 = v7;
    v33 = 2112;
    v34 = v12;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s assetID=%@ isAudiobook=%{BOOL}d, hasRacSupport=%{BOOL}d, params=%@", buf, 0x2Cu);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100169BA0;
  v23[3] = &unk_1008E77C8;
  v24 = v13;
  v22 = v13;
  -[BKJSALibraryManager _downloadAssetID:redownloadParameters:isAudiobook:hasRacSupport:tracker:callback:](self, "_downloadAssetID:redownloadParameters:isAudiobook:hasRacSupport:tracker:callback:", v16, v12, v10, v7, v14, v23);

}

- (void)cancelDownloadForBook:(id)a3 :(id)a4 :(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;

  v7 = a3;
  v8 = a5;
  v11 = JSALog(v8, v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v19 = "-[BKJSALibraryManager cancelDownloadForBook:::]";
    v20 = 2112;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s assetID=%@", buf, 0x16u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100169DAC;
  v15[3] = &unk_1008E73F0;
  v16 = v7;
  v17 = v8;
  v13 = v8;
  v14 = v7;
  -[BKJSALibraryManager cancelDownloadForAssetID:completionHandler:](self, "cancelDownloadForAssetID:completionHandler:", v14, v15);

}

- (void)updateBooks:(id)a3 :(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v10 = JSALog(v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", ")));
    *(_DWORD *)buf = 136446466;
    v17 = "-[BKJSALibraryManager updateBooks::]";
    v18 = 2112;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s assetIDs=[%@]", buf, 0x16u);

  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10016A0C0;
  v14[3] = &unk_1008EB480;
  v15 = v7;
  v13 = v7;
  -[BKJSALibraryManager _updateAssetIDs:callback:](self, "_updateAssetIDs:callback:", v6, v14);

}

- (void)addBookToWantToReadCollection:(id)a3 :(id)a4 :(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13 = JSALog(v10, v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "-[BKJSALibraryManager addBookToWantToReadCollection:::]";
    v21 = 2112;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s assetID=%@", buf, 0x16u);
  }

  v15 = kBKCollectionDefaultIDWantToRead;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10016A3AC;
  v17[3] = &unk_1008E7418;
  v18 = v9;
  v16 = v9;
  -[BKJSALibraryManager addAssetID:toCollectionID:tracker:completionHandler:](self, "addAssetID:toCollectionID:tracker:completionHandler:", v8, v15, v10, v17);

}

- (void)removeBookFromWantToReadCollection:(id)a3 :(id)a4 :(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13 = JSALog(v10, v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "-[BKJSALibraryManager removeBookFromWantToReadCollection:::]";
    v21 = 2112;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s assetID=%@", buf, 0x16u);
  }

  v15 = kBKCollectionDefaultIDWantToRead;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10016A64C;
  v17[3] = &unk_1008E7418;
  v18 = v9;
  v16 = v9;
  -[BKJSALibraryManager removeAssetID:fromCollectionID:tracker:completionHandler:](self, "removeAssetID:fromCollectionID:tracker:completionHandler:", v8, v15, v10, v17);

}

- (void)showCollection:(id)a3 :(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v10 = JSALog(v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v18 = "-[BKJSALibraryManager showCollection::]";
    v19 = 2112;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s collectionID=%@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016A8A0;
  block[3] = &unk_1008E7928;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)openSampleBook:(id)a3 downloadSampleURL:(id)a4 options:(id)a5 callback:(id)a6 tracker:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v19 = JSALog(v16, v17, v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[BKJSALibraryManager openSampleBook:downloadSampleURL:options:callback:tracker:]";
    v29 = 2112;
    v30 = v13;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s url=%@", buf, 0x16u);
  }

  if (objc_msgSend(v13, "length"))
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));
  else
    v21 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10016AB94;
  v24[3] = &unk_1008E73F0;
  v25 = v12;
  v26 = v15;
  v22 = v15;
  v23 = v12;
  -[BKJSALibraryManager _openAssetID:options:sampleURL:isSample:tracker:callback:](self, "_openAssetID:options:sampleURL:isSample:tracker:callback:", v23, v14, v21, 1, v16, v24);

}

- (void)previewAudiobook:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  char v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  v16 = JSALog(v13, v14, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v38 = "-[BKJSALibraryManager previewAudiobook::::]";
    v39 = 2112;
    v40 = v10;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s assetID=%@", buf, 0x16u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("storeAsset")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BCMAssetWrapper assetWithData:](BCMAssetWrapper, "assetWithData:", v18));
  v20 = objc_opt_class(NSNumber);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("fullScreen")));

  v22 = BUDynamicCast(v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  LOBYTE(v20) = objc_msgSend(v23, "BOOLValue");

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSALibraryManager libraryAssetProvider](self, "libraryAssetProvider"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "collectionController"));
  v26 = kBKCollectionDefaultIDSamples;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10016AF88;
  v31[3] = &unk_1008ECC00;
  v31[4] = self;
  v32 = v10;
  v33 = v12;
  v34 = v19;
  v36 = v20;
  v35 = v11;
  v27 = v11;
  v28 = v19;
  v29 = v12;
  v30 = v10;
  objc_msgSend(v25, "addStoreID:toCollectionID:forceToTop:completion:", v30, v26, 0, v31);

}

- (void)markBookAsFinished:(id)a3 :(BOOL)a4 :(id)a5 :(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  BOOL v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  _BOOL4 v30;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v15 = JSALog(v12, v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v26 = "-[BKJSALibraryManager markBookAsFinished::::]";
    v27 = 2112;
    v28 = v10;
    v29 = 1024;
    v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s adamID=%@, isFinished=%{BOOL}d", buf, 0x1Cu);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10016B4F4;
  v20[3] = &unk_1008ECC28;
  v20[4] = self;
  v21 = v10;
  v24 = v8;
  v22 = v12;
  v23 = v11;
  v17 = v11;
  v18 = v12;
  v19 = v10;
  -[BKJSALibraryManager _markAsset:asFinished:completion:](self, "_markAsset:asFinished:completion:", v19, v8, v20);

}

- (void)_displayStoreConnectionErrorAlert:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    if (v3)
      v6 = CFSTR("Apple Books couldn’t connect to the Book Store. Check your Internet connection, then try again.");
    else
      v6 = CFSTR("Apple Books couldn’t connect to iCloud. Check your Internet connection, then try again.");
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_10091C438, 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Couldn’t Connect"), &stru_10091C438, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, v14, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10091C438, 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 1, 0));
    objc_msgSend(v9, "addAction:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate currentSceneController](BKAppDelegate, "currentSceneController"));
    objc_msgSend(v13, "presentViewController:animated:completion:", v9, 1, 0);

  }
}

- (void)_openAssetID:(id)a3 options:(id)a4 sampleURL:(id)a5 isSample:(BOOL)a6 tracker:(id)a7 callback:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSALibraryManager libraryAssetProvider](self, "libraryAssetProvider"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10016BA20;
  v25[3] = &unk_1008ECCE8;
  v25[4] = self;
  v26 = v15;
  v31 = a6;
  v27 = v14;
  v28 = v17;
  v29 = v16;
  v30 = v18;
  v20 = v16;
  v21 = v17;
  v22 = v14;
  v23 = v15;
  v24 = v18;
  objc_msgSend(v19, "fetchLibraryAssetFromAssetID:handler:", v22, v25);

}

- (void)_openSample:(id)a3 options:(id)a4 sampleURL:(id)a5 contentData:(id)a6 tracker:(id)a7 callback:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10016C27C;
  v31[3] = &unk_1008ECD10;
  v31[4] = self;
  v20 = v17;
  v32 = v20;
  v21 = v18;
  v33 = v21;
  v22 = v19;
  v36 = v22;
  v23 = v15;
  v34 = v23;
  v24 = v14;
  v35 = v24;
  v25 = objc_retainBlock(v31);
  v26 = v25;
  if (v16)
  {
    ((void (*)(_QWORD *, id))v25[2])(v25, v16);
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIItemDescriptionCache sharedInstance](BSUIItemDescriptionCache, "sharedInstance"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10016C9DC;
    v28[3] = &unk_1008ECD38;
    v29 = v26;
    v30 = v22;
    objc_msgSend(v27, "sampleDownloadURLForAssetID:completion:", v24, v28);

  }
}

- (void)_previewAssetID:(id)a3 asset:(id)a4 fullScreen:(BOOL)a5 tracker:(id)a6 callback:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v18 = JSALog(v15, v16, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v33 = "-[BKJSALibraryManager _previewAssetID:asset:fullScreen:tracker:callback:]";
    v34 = 2112;
    v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s assetID=%@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSALibraryManager libraryAssetProvider](self, "libraryAssetProvider"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10016CC0C;
  v25[3] = &unk_1008ECDD8;
  objc_copyWeak(&v30, (id *)buf);
  v21 = v12;
  v26 = v21;
  v22 = v14;
  v27 = v22;
  v23 = v15;
  v29 = v23;
  v24 = v13;
  v28 = v24;
  v31 = a5;
  objc_msgSend(v20, "fetchLibraryAssetFromAssetID:handler:", v21, v25);

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);

}

- (void)_markAsset:(id)a3 asFinished:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  BOOL v14;
  NSErrorUserInfoKey v15;
  const __CFString *v16;

  v7 = a3;
  v8 = a5;
  if (v7)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10016D2BC;
    v11[3] = &unk_1008E7388;
    v12 = v7;
    v14 = a4;
    v13 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

    v9 = v12;
  }
  else
  {
    v15 = NSLocalizedDescriptionKey;
    v16 = CFSTR("Asset ID required. Cannot mark as finished");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKJSALibraryManager"), -1, v10));

    if (v8)
      (*((void (**)(id, void *))v8 + 2))(v8, v9);
  }

}

- (void)_downloadAssetID:(id)a3 redownloadParameters:(id)a4 isAudiobook:(BOOL)a5 hasRacSupport:(BOOL)a6 tracker:(id)a7 callback:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;
  BOOL v31;
  id location;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSALibraryManager libraryItemStateProvider](self, "libraryItemStateProvider"));
  objc_msgSend(v18, "updateStateToPurchasingForIdentifier:", v14);

  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10016D6DC;
  v24[3] = &unk_1008ECE50;
  v19 = v15;
  v25 = v19;
  v20 = v14;
  v26 = v20;
  v30 = a5;
  v21 = v16;
  v27 = v21;
  v31 = a6;
  objc_copyWeak(&v29, &location);
  v22 = v17;
  v28 = v22;
  v23 = objc_retainBlock(v24);
  ((void (*)(void))v23[2])();

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

- (void)_downloadAssetIDs:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD v9[5];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10016DA5C;
  v9[3] = &unk_1008ECEA0;
  v9[4] = self;
  v6 = a4;
  v7 = a3;
  v8 = objc_retainBlock(v9);
  -[BKJSALibraryManager _processAssets:processor:callback:](self, "_processAssets:processor:callback:", v7, v8, v6);

}

- (void)_updateAssetIDs:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void ***v8;
  void **v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *);
  void *v12;
  BKJSALibraryManager *v13;
  id v14;

  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10016DD04;
  v12 = &unk_1008ECF18;
  v13 = self;
  v14 = a3;
  v6 = v14;
  v7 = a4;
  v8 = objc_retainBlock(&v9);
  -[BKJSALibraryManager _processAssets:processor:callback:](self, "_processAssets:processor:callback:", v6, v8, v7, v9, v10, v11, v12, v13);

}

- (void)_processAssets:(id)a3 processor:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  BKJSALibraryManager *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSALibraryManager libraryAssetProvider](self, "libraryAssetProvider"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10016E0D4;
  v15[3] = &unk_1008ECF68;
  v16 = v8;
  v17 = self;
  v18 = v10;
  v19 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  objc_msgSend(v11, "fetchLibraryAssetsFromAssetIDs:handler:", v13, v15);

}

- (void)getCollectionNameForCollectionID:(id)a3 :(id)a4
{
  id v5;
  id v6;
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

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isObject"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BCCollection titleForDefaultCollectionID:](BCCollection, "titleForDefaultCollectionID:", v5));
    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uiChildContext"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mutableCollectionWithCollectionID:inManagedObjectContext:error:", v5, v11, 0));

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedTitle"));
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
    v14 = v13;
    if (v7)
    {
      v16 = v7;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
      objc_msgSend(v14, "enqueueValueCall:arguments:file:line:", v6, v15, CFSTR("BKJSALibraryManager.m"), 968);

    }
    else
    {
      objc_msgSend(v13, "enqueueValueCall:arguments:file:line:", v6, 0, CFSTR("BKJSALibraryManager.m"), 968);
    }

  }
}

- (void)getStoreIDsWithAvailableUpdatesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSALibraryManager storeController](self, "storeController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016E4DC;
  v7[3] = &unk_1008ECF90;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getStoreIDsWithAvailableUpdatesWithCompletion:", v7);

}

- (void)filterPurchasedBooks:(id)a3 callback:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isArray"))
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "toArray"));
  else
    v7 = &__NSArray0__struct;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10016E6C8;
  v12[3] = &unk_1008E76A8;
  v13 = v8;
  v14 = v6;
  v10 = v6;
  v11 = v8;
  objc_msgSend(v9, "assetIDsOfPurchasedStoreAssets:", v12);

}

- (id)_transactionFromOptions:(id)a3
{
  return objc_msgSend(a3, "objectForKeyedSubscript:", BCTransactionOptionsTransactionKey);
}

- (id)_transactionFromOptionsForShowAsset:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD block[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10004E498;
  v15 = sub_10004E2C0;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[BKJSALibraryManager _transactionFromOptions:](self, "_transactionFromOptions:", v4));
  if (!v12[5])
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate currentSceneController](BKAppDelegate, "currentSceneController"));
      v6 = objc_msgSend(v5, "newShowAssetTransaction");
      v7 = (void *)v12[5];
      v12[5] = (uint64_t)v6;

    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10016E948;
      block[3] = &unk_1008E7BE8;
      block[4] = &v11;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (int64_t)_contentTypeForContentID:(id)a3 withLibraryAsset:(id)a4
{
  if (a4)
    return (int64_t)+[BAUtilities contentTypeFromAssetType:](BAUtilities, "contentTypeFromAssetType:", (int)objc_msgSend(a4, "contentType", a3));
  else
    return 0;
}

- (id)_contentDataForContentID:(id)a3 tracker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSALibraryManager _libraryAssetWithContentID:](self, "_libraryAssetWithContentID:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSALibraryManager _contentDataForLibraryAsset:contentID:tracker:](self, "_contentDataForLibraryAsset:contentID:tracker:", v8, v7, v6));

  return v9;
}

- (id)_contentDataForLibraryAsset:(id)a3 contentID:(id)a4 tracker:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  uint64_t v29;
  int64_t v30;
  void *v31;
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentPrivateIDForContentID:", v12));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentUserIDForContentID:", v12));

    v30 = -[BKJSALibraryManager _contentTypeForContentID:withLibraryAsset:](self, "_contentTypeForContentID:withLibraryAsset:", v12, v8);
    if (objc_msgSend(v8, "isOwned"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storeID"));
      v16 = objc_msgSend(v15, "length");
      v17 = 1;
      if (!v16)
        v17 = 2;
      v29 = v17;

    }
    else
    {
      v29 = 0;
    }
    v31 = (void *)v14;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
    v28 = objc_msgSend(v19, "seriesTypeForContentID:", v12);

    v32 = v9;
    if (objc_msgSend(v8, "isAudiobook"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hasRACSupport"));
      if (objc_msgSend(v20, "BOOLValue"))
        v21 = 1;
      else
        v21 = 2;

    }
    else
    {
      v21 = 0;
    }
    v22 = objc_alloc((Class)BAContentData);
    v23 = objc_msgSend(v8, "contentType");
    if (v23 == 3)
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v8, "pageCount")));
    else
      v24 = 0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "supplementalContentAssets"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "count")));
    v18 = objc_msgSend(v22, "initWithContentID:contentType:contentPrivateID:contentUserID:contentAcquisitionType:contentSubType:contentLength:supplementalContentCount:seriesType:productionType:isUnified:contentKind:", v12, v30, v13, v31, v29, 0, v24, v26, v28, v21, 0, 0);

    if (v23 == 3)
    v9 = v32;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentPrivateIDForContentID:", v9));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentUserIDForContentID:", v9));

    v18 = objc_msgSend(objc_alloc((Class)BAContentData), "initWithContentID:contentType:contentPrivateID:contentUserID:contentAcquisitionType:contentSubType:contentLength:supplementalContentCount:seriesType:productionType:isUnified:contentKind:", v9, 0, v12, v13, 0, 0, 0, 0, 0, 0, 0, 0);
  }

  return v18;
}

- (id)_libraryAssetWithContentID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "libraryAssetProvider"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "libraryAssetOnMainQueueWithAssetID:", v3));
  return v6;
}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  return (BKLibraryAssetProvider *)objc_loadWeakRetained((id *)&self->_libraryAssetProvider);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BKLibraryItemStateProvider)libraryItemStateProvider
{
  return (BKLibraryItemStateProvider *)objc_loadWeakRetained((id *)&self->_libraryItemStateProvider);
}

- (void)setLibraryItemStateProvider:(id)a3
{
  objc_storeWeak((id *)&self->_libraryItemStateProvider, a3);
}

- (BKPresentersProvider)presentersProvider
{
  return (BKPresentersProvider *)objc_loadWeakRetained((id *)&self->_presentersProvider);
}

- (void)setPresentersProvider:(id)a3
{
  objc_storeWeak((id *)&self->_presentersProvider, a3);
}

- (BKStoreController)storeController
{
  return self->_storeController;
}

- (void)setStoreController:(id)a3
{
  objc_storeStrong((id *)&self->_storeController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeController, 0);
  objc_destroyWeak((id *)&self->_presentersProvider);
  objc_destroyWeak((id *)&self->_libraryItemStateProvider);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_libraryAssetProvider);
}

@end
