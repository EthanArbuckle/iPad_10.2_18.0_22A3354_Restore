@implementation BKLibraryDataSourceUbiquityiOS

- (int64_t)rank
{
  return self->_rank;
}

- (BKLibraryDataSourceUbiquityiOS)initWithUbiquityStatusMonitor:(id)a3 assetMetadataCache:(id)a4 coverImageHelper:(id)a5 imageSource:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  BKLibraryDataSourceUbiquityiOS *v18;
  dispatch_queue_attr_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *ivarQueue;
  dispatch_queue_attr_t v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *uploadDownloadQueue;
  dispatch_queue_attr_t v27;
  NSObject *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *workQueue;
  dispatch_queue_attr_t v31;
  NSObject *v32;
  dispatch_queue_t v33;
  OS_dispatch_queue *updateAssetMetadataQueue;
  dispatch_queue_attr_t v35;
  NSObject *v36;
  dispatch_queue_t v37;
  OS_dispatch_queue *persistToDiskQueue;
  dispatch_queue_attr_t v39;
  NSObject *v40;
  dispatch_queue_t v41;
  OS_dispatch_queue *processMetadataQueryQueue;
  dispatch_queue_attr_t v43;
  NSObject *v44;
  dispatch_queue_t v45;
  OS_dispatch_queue *processUbiquityMetadataQueue;
  dispatch_queue_attr_t v47;
  NSObject *v48;
  dispatch_queue_t v49;
  OS_dispatch_queue *completionHandlerQueue;
  NSOperationQueue *v51;
  NSOperationQueue *uncompressQueue;
  void *v53;
  NSMutableDictionary *v54;
  NSMutableDictionary *iq_urlFromAssetID;
  NSMutableDictionary *v56;
  NSMutableDictionary *iq_counterpartURLFromAssetID;
  NSMutableDictionary *v58;
  NSMutableDictionary *iq_assetIDFromURL;
  NSMutableDictionary *v60;
  NSMutableDictionary *iq_assetFromAssetID;
  NSMutableDictionary *v62;
  NSMutableDictionary *iq_insertionDateFromAssetID;
  NSMutableSet *v64;
  NSMutableSet *iq_uploadingAssetIDs;
  NSMutableDictionary *v66;
  NSMutableDictionary *iq_downloadingProgressFromAssetID;
  NSMutableDictionary *v68;
  NSMutableDictionary *iq_downloadingAssetIDsFromParentAssetID;
  uint64_t v70;
  NSHashTable *cq_metadataQueryHandlingObservers;
  NSArray *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  NSURL *unzippedCounterpartCacheURL;
  void *v79;
  id v80;
  id *v81;
  id v82;
  id v83;
  void *v84;
  _QWORD v86[4];
  id *v87;
  objc_super v88;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = kdebug_trace(725353716, 38, 0, 0, 0);
  v16 = BKLibraryDataSourceUbiquityLog(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "initWithUbiquityStatusMonitor", buf, 2u);
  }

  v88.receiver = self;
  v88.super_class = (Class)BKLibraryDataSourceUbiquityiOS;
  v18 = -[BKLibraryDataSourceUbiquityiOS init](&v88, "init");
  if (v18)
  {
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = dispatch_queue_create("com.apple.ibooks.datasource.ubiquity.ivarQueue", v20);
    ivarQueue = v18->_ivarQueue;
    v18->_ivarQueue = (OS_dispatch_queue *)v21;

    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = dispatch_queue_create("com.apple.ibooks.datasource.ubiquity.uploadDownloadQueue", v24);
    uploadDownloadQueue = v18->_uploadDownloadQueue;
    v18->_uploadDownloadQueue = (OS_dispatch_queue *)v25;

    v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v29 = dispatch_queue_create("com.apple.ibooks.datasource.ubiquity.workQueue", v28);
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v29;

    v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v33 = dispatch_queue_create("com.apple.ibooks.datasource.ubiquity.updateAssetMetadataQueue", v32);
    updateAssetMetadataQueue = v18->_updateAssetMetadataQueue;
    v18->_updateAssetMetadataQueue = (OS_dispatch_queue *)v33;

    v35 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    v37 = dispatch_queue_create("com.apple.ibooks.datasource.ubiquity.persistToDiskQueue", v36);
    persistToDiskQueue = v18->_persistToDiskQueue;
    v18->_persistToDiskQueue = (OS_dispatch_queue *)v37;

    v39 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    v41 = dispatch_queue_create("com.apple.ibooks.datasource.ubiquity.processMetadataQueryQueue", v40);
    processMetadataQueryQueue = v18->_processMetadataQueryQueue;
    v18->_processMetadataQueryQueue = (OS_dispatch_queue *)v41;

    v43 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    v45 = dispatch_queue_create("com.apple.ibooks.datasource.ubiquity.processUbiquityMetadataQueue", v44);
    processUbiquityMetadataQueue = v18->_processUbiquityMetadataQueue;
    v18->_processUbiquityMetadataQueue = (OS_dispatch_queue *)v45;

    v47 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    v49 = dispatch_queue_create("com.apple.ibooks.datasource.ubiquity.completionHandlerQueue", v48);
    completionHandlerQueue = v18->_completionHandlerQueue;
    v18->_completionHandlerQueue = (OS_dispatch_queue *)v49;

    v51 = objc_opt_new(NSOperationQueue);
    uncompressQueue = v18->_uncompressQueue;
    v18->_uncompressQueue = v51;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v18->_uncompressQueue, "setMaxConcurrentOperationCount:", 1);
    objc_storeWeak((id *)&v18->_imageSource, v14);
    if (!v11)
      BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/datasources/BKLibraryDataSourceUbiquityiOS.m", 161, "-[BKLibraryDataSourceUbiquityiOS initWithUbiquityStatusMonitor:assetMetadataCache:coverImageHelper:imageSource:]", "ubiquityStatusMonitor", 0);
    objc_storeStrong((id *)&v18->_ubiquityStatusMonitor, a3);
    objc_msgSend(v11, "addObserver:", v18);
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v18->_skipThumbnailGeneration = objc_msgSend(v53, "BOOLForKey:", CFSTR("BKSkipUbiquityThumbnailing"));

    v54 = objc_opt_new(NSMutableDictionary);
    iq_urlFromAssetID = v18->_iq_urlFromAssetID;
    v18->_iq_urlFromAssetID = v54;

    v56 = objc_opt_new(NSMutableDictionary);
    iq_counterpartURLFromAssetID = v18->_iq_counterpartURLFromAssetID;
    v18->_iq_counterpartURLFromAssetID = v56;

    v58 = objc_opt_new(NSMutableDictionary);
    iq_assetIDFromURL = v18->_iq_assetIDFromURL;
    v18->_iq_assetIDFromURL = v58;

    v60 = objc_opt_new(NSMutableDictionary);
    iq_assetFromAssetID = v18->_iq_assetFromAssetID;
    v18->_iq_assetFromAssetID = v60;

    v62 = objc_opt_new(NSMutableDictionary);
    iq_insertionDateFromAssetID = v18->_iq_insertionDateFromAssetID;
    v18->_iq_insertionDateFromAssetID = v62;

    v64 = objc_opt_new(NSMutableSet);
    iq_uploadingAssetIDs = v18->_iq_uploadingAssetIDs;
    v18->_iq_uploadingAssetIDs = v64;

    v66 = objc_opt_new(NSMutableDictionary);
    iq_downloadingProgressFromAssetID = v18->_iq_downloadingProgressFromAssetID;
    v18->_iq_downloadingProgressFromAssetID = v66;

    v68 = objc_opt_new(NSMutableDictionary);
    iq_downloadingAssetIDsFromParentAssetID = v18->_iq_downloadingAssetIDsFromParentAssetID;
    v18->_iq_downloadingAssetIDsFromParentAssetID = v68;

    v70 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    cq_metadataQueryHandlingObservers = v18->_cq_metadataQueryHandlingObservers;
    v18->_cq_metadataQueryHandlingObservers = (NSHashTable *)v70;

    objc_storeWeak((id *)&v18->_assetMetadataCache, v12);
    objc_storeWeak((id *)&v18->_coverImageHelper, v13);
    v72 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "lastObject"));

    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "stringByAppendingPathComponent:", CFSTR("BKLibraryDataSourceUbiquityiOS")));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "stringByAppendingPathComponent:", CFSTR("unzipped-books")));

    v77 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v76));
    unzippedCounterpartCacheURL = v18->_unzippedCounterpartCacheURL;
    v18->_unzippedCounterpartCacheURL = (NSURL *)v77;

    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    if ((objc_msgSend(v79, "fileExistsAtPath:", v76) & 1) == 0)
    {
      v18->_emptyCacheDirectory = 1;
      objc_msgSend(v79, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v76, 1, 0, 0);
    }
    v80 = objc_alloc((Class)BUCoalescingCallBlock);
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_1000F2080;
    v86[3] = &unk_1008EAB80;
    v81 = v18;
    v87 = v81;
    v82 = objc_msgSend(v80, "initWithNotifyBlock:blockDescription:", v86, CFSTR("BKLibraryDataSourceUbiquityiOS"));
    v83 = v81[25];
    v81[25] = v82;

    objc_msgSend(v81[25], "setCoalescingDelay:", 0.5);
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v84, "addObserver:selector:name:object:", v81, "handleFileGenerationChangedNotification:", BCUbiqityFileGenerationDidChangeNotification, 0);

    objc_msgSend(v81, "_readPersistedInfoFromDisk");
    objc_msgSend(v81, "_loadCounterpartInfo");

  }
  kdebug_trace(725353716, 39, 0, 0, 0);

  return v18;
}

- (NSURL)unzippedCounterpartCacheURL
{
  return self->_unzippedCounterpartCacheURL;
}

- (void)setUploadReporter:(id)a3
{
  objc_storeStrong((id *)&self->_uploadReporter, a3);
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (void)setMadeUbiquitousNotifyBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setLibraryManager:(id)a3
{
  objc_storeWeak((id *)&self->_libraryManager, a3);
}

- (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.ibooks.datasource.ubiquity");
}

- (void)addMetadataQueryHandlingObserver:(id)a3
{
  id v4;
  NSObject *completionHandlerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  completionHandlerQueue = self->_completionHandlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063878;
  block[3] = &unk_1008E7338;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(completionHandlerQueue, block);

}

- (void)_readPersistedInfoFromDisk
{
  NSObject *ivarQueue;
  _QWORD block[5];

  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BC14;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_sync(ivarQueue, block);
}

- (id)_persistedInfoURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 9, 1, 0, 1, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("BKLibraryDataSourceUbiquityiOS"), 0));
  return v4;
}

- (void)_loadCounterpartInfo
{
  NSObject *ivarQueue;
  _QWORD block[5];

  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000167BC;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(ivarQueue, block);
}

- (void)dealloc
{
  void *v3;
  IMUbiquityDocumentsObserver *ubiquityDocumentsObserver;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[IMUbiquityDocumentsObserver tearDownQuery](self->_ubiquityDocumentsObserver, "tearDownQuery");
  ubiquityDocumentsObserver = self->_ubiquityDocumentsObserver;
  self->_ubiquityDocumentsObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryDataSourceUbiquityiOS;
  -[BKLibraryDataSourceUbiquityiOS dealloc](&v5, "dealloc");
}

- (void)removeMetadataQueryHandlingObserver:(id)a3
{
  id v4;
  NSObject *completionHandlerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  completionHandlerQueue = self->_completionHandlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F222C;
  block[3] = &unk_1008E7338;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(completionHandlerQueue, block);

}

- (BOOL)isEnabled
{
  return -[IMUbiquityStatusMonitor isICloudDriveEnabled](self->_ubiquityStatusMonitor, "isICloudDriveEnabled");
}

- (unint64_t)propagateDataProperties
{
  return 0x2000;
}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  id v4;
  NSObject *ivarQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  kdebug_trace(725353716, 92, 0, 0, 0);
  ivarQueue = self->_ivarQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F22EC;
  v7[3] = &unk_1008E7680;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(ivarQueue, v7);

}

- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *ivarQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BKLibraryDataSourceUbiquityiOS *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  kdebug_trace(725353716, 94, 0, 0, 0);
  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F2554;
  block[3] = &unk_1008E8898;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(ivarQueue, block);

}

- (int64_t)coverSourceRank
{
  return 3;
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *ivarQueue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  BKLibraryDataSourceUbiquityiOS *v19;
  id v20;
  id v21;
  CGFloat v22;
  CGFloat v23;

  height = a4.height;
  width = a4.width;
  v9 = a5;
  v10 = a3;
  kdebug_trace(725352480, 0, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("assetID")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("title")));

  ivarQueue = self->_ivarQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000F29D4;
  v17[3] = &unk_1008EAC20;
  v18 = v11;
  v19 = self;
  v22 = width;
  v23 = height;
  v20 = v12;
  v21 = v9;
  v14 = v9;
  v15 = v12;
  v16 = v11;
  dispatch_async(ivarQueue, v17);

}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *workQueue;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  BKLibraryDataSourceUbiquityiOS *v19;
  id v20;
  BOOL v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  _BOOL4 v25;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = BKLibraryDataSourceUbiquityLog(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v23 = objc_msgSend(v8, "count");
    v24 = 1024;
    v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "deleteAssets: count: %ld exhaustive: %d", buf, 0x12u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("assetID")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bu_arrayByRemovingNSNulls"));

  workQueue = self->_workQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000F2F50;
  v17[3] = &unk_1008E96C0;
  v18 = v13;
  v19 = self;
  v21 = v6;
  v20 = v9;
  v15 = v9;
  v16 = v13;
  dispatch_async(workQueue, v17);

}

- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *ivarQueue;
  uint64_t v12;
  NSObject *v13;
  void (**v14)(id, _QWORD, uint64_t, void *);
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v7 = a5;
  v8 = a3;
  kdebug_trace(725352488, 0, 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));

  if (objc_msgSend(v9, "length"))
  {
    ivarQueue = self->_ivarQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000F3488;
    v16[3] = &unk_1008E8EE0;
    v16[4] = self;
    v17 = v9;
    v18 = v10;
    v19 = v7;
    dispatch_async(ivarQueue, v16);

  }
  else
  {
    v12 = BKLibraryDataSourceUbiquityLog(0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1006A0204();

    v14 = (void (**)(id, _QWORD, uint64_t, void *))objc_retainBlock(v7);
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kBKLibraryDataSourceDomain, kBKLibraryDataSourceErrorInvalidAssetError, 0));
      v14[2](v14, 0, 1, v15);

    }
  }

}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *ivarQueue;
  uint64_t v9;
  NSObject *v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "assetID"));
  if (objc_msgSend(v7, "length"))
  {
    ivarQueue = self->_ivarQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F4118;
    block[3] = &unk_1008E8898;
    block[4] = self;
    v14 = v7;
    v15 = v6;
    dispatch_async(ivarQueue, block);

  }
  else
  {
    v9 = BKLibraryDataSourceUbiquityLog(0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1006A03D8();

    v11 = (void (**)(id, _QWORD, void *))objc_retainBlock(v6);
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kBKLibraryDataSourceDomain, kBKLibraryDataSourceErrorInvalidAssetError, 0));
      v11[2](v11, 0, v12);

    }
  }

}

- (void)updateAsset:(id)a3 userEditedTitle:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  NSObject *ivarQueue;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "assetID"));
  if (objc_msgSend(v8, "length"))
  {
    ivarQueue = self->_ivarQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F44D8;
    block[3] = &unk_1008E7928;
    block[4] = self;
    v13 = v8;
    v14 = v7;
    dispatch_async(ivarQueue, block);

  }
  else
  {
    v10 = BKLibraryDataSourceUbiquityLog(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1006A046C();

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

- (void)ubiquityStatusChangedToAvailableWithNewIdentity:(id)a3 oldIdentity:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *completionHandlerQueue;
  _QWORD block[5];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = BKLibraryDataSourceUbiquityLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ubiquityStatusChangedToAvailableWithNewIdentity: %{public}@ oldIdentity: %{public}@", buf, 0x16u);
  }

  completionHandlerQueue = self->_completionHandlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F47C8;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(completionHandlerQueue, block);

}

- (void)ubiquityDocumentsObserver:(id)a3 didLoadWithItems:(id)a4
{
  id v5;
  NSObject *processMetadataQueryQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  BKLibraryDataSourceUbiquityiOS *v10;

  v5 = a4;
  kdebug_trace(725352472, 0, 0, 0, 0);
  processMetadataQueryQueue = self->_processMetadataQueryQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F4A64;
  v8[3] = &unk_1008E7338;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(processMetadataQueryQueue, v8);

}

- (void)ubiquityDocumentsObserver:(id)a3 itemsDidBecomeAvailable:(id)a4
{
  id v5;
  NSObject *processMetadataQueryQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  BKLibraryDataSourceUbiquityiOS *v10;

  v5 = a4;
  processMetadataQueryQueue = self->_processMetadataQueryQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F4FE4;
  v8[3] = &unk_1008E7338;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(processMetadataQueryQueue, v8);

}

- (void)ubiquityDocumentsObserver:(id)a3 itemsDidBecomeUnavailable:(id)a4
{
  id v5;
  NSObject *processMetadataQueryQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  BKLibraryDataSourceUbiquityiOS *v10;

  v5 = a4;
  processMetadataQueryQueue = self->_processMetadataQueryQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F5110;
  v8[3] = &unk_1008E7338;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(processMetadataQueryQueue, v8);

}

- (void)ubiquityDocumentsObserver:(id)a3 itemsDidChange:(id)a4
{
  id v5;
  NSObject *processMetadataQueryQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  BKLibraryDataSourceUbiquityiOS *v10;

  v5 = a4;
  processMetadataQueryQueue = self->_processMetadataQueryQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F525C;
  v8[3] = &unk_1008E7338;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(processMetadataQueryQueue, v8);

}

- (id)umq_metadataDictsFromUbiquityDocumentItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = a3;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    v7 = BCMetadataXattrAssetID;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "url", v19));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[BCUbiquityMetadataHelper ubiquityMetadataForURL:options:needsCoordination:](BCUbiquityMetadataHelper, "ubiquityMetadataForURL:options:needsCoordination:", v10, -262145, 1));
        v12 = objc_msgSend(v11, "mutableCopy");

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v7));
        v14 = v13;
        if (v12 && objc_msgSend(v13, "length"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v9, "isLocal")));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("isLocal"));

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentChangedDate"));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("contentChangedDate"));

          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentFileSize"));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("contentFileSize"));

          objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("itemURL"));
          objc_msgSend(v19, "addObject:", v12);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  return v19;
}

- (void)mq_itemsDidBecomeAvailable:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "count");
  if (v4)
  {
    v5 = (unint64_t)v4;
    v6 = 0;
    v7 = (unint64_t)v4;
    do
    {
      v8 = v7 - 64;
      if (v7 >= 0x40)
        v9 = 64;
      else
        v9 = v7;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subarrayWithRange:", v6, v9));
      -[BKLibraryDataSourceUbiquityiOS mq_batchOfItemsDidBecomeAvailable:](self, "mq_batchOfItemsDidBecomeAvailable:", v10);

      v6 += 64;
      v7 = v8;
    }
    while (v6 < v5);
  }

}

- (void)mq_batchOfItemsDidBecomeAvailable:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *processUbiquityMetadataQueue;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;

  v4 = a3;
  v5 = kdebug_trace(725352496, 0, 0, 0, 0);
  v6 = BKLibraryDataSourceUbiquityLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v4, "count");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("url")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bu_prettyDescription"));
    *(_DWORD *)buf = 134218242;
    v16 = v8;
    v17 = 2112;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "mq_batchOfItemsDidBecomeAvailable: count:%ld itemURLs:(%@)", buf, 0x16u);

  }
  -[BKLibraryDataSourceUbiquityiOS _reportProgressWithItems:](self, "_reportProgressWithItems:", v4);
  processUbiquityMetadataQueue = self->_processUbiquityMetadataQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000F5754;
  v13[3] = &unk_1008E7338;
  v13[4] = self;
  v14 = v4;
  v12 = v4;
  dispatch_async(processUbiquityMetadataQueue, v13);

}

- (void)mq_itemsDidBecomeUnavailable:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *ivarQueue;
  id v9;
  id v10;
  NSObject *completionHandlerQueue;
  _QWORD v12[4];
  id v13;
  BKLibraryDataSourceUbiquityiOS *v14;
  _QWORD block[4];
  id v16;
  BKLibraryDataSourceUbiquityiOS *v17;
  id v18;
  uint8_t buf[4];
  id v20;

  v4 = a3;
  v5 = BKLibraryDataSourceUbiquityLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "mq_itemsDidBecomeUnavailable: %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F5DD8;
  block[3] = &unk_1008E7928;
  v9 = v4;
  v16 = v9;
  v17 = self;
  v10 = v7;
  v18 = v10;
  dispatch_sync(ivarQueue, block);
  if (objc_msgSend(v10, "count"))
  {
    completionHandlerQueue = self->_completionHandlerQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000F5F80;
    v12[3] = &unk_1008E7338;
    v13 = v10;
    v14 = self;
    dispatch_async(completionHandlerQueue, v12);

  }
}

- (void)mq_itemsDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = BKLibraryDataSourceUbiquityLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v4, "count");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("url")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bu_prettyDescription"));
    v17 = 134218242;
    v18 = v7;
    v19 = 2112;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "mq_itemsDidChange: count: %lu, items:%@", (uint8_t *)&v17, 0x16u);

  }
  v10 = objc_msgSend(v4, "count");
  if (v10)
  {
    v11 = (unint64_t)v10;
    v12 = 0;
    v13 = (unint64_t)v10;
    do
    {
      v14 = v13 - 64;
      if (v13 >= 0x40)
        v15 = 64;
      else
        v15 = v13;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", v12, v15));
      -[BKLibraryDataSourceUbiquityiOS mq_batchOfItemsDidChange:](self, "mq_batchOfItemsDidChange:", v16);

      v12 += 64;
      v13 = v14;
    }
    while (v12 < v11);
  }

}

- (void)mq_batchOfItemsDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *processUbiquityMetadataQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;

  v4 = a3;
  v5 = kdebug_trace(725352504, 0, 0, 0, 0);
  v6 = BKLibraryDataSourceUbiquityLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("url")));
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "mq_batchOfItemsDidChange: %@", buf, 0xCu);

  }
  -[BKLibraryDataSourceUbiquityiOS _reportProgressWithItems:](self, "_reportProgressWithItems:", v4);
  processUbiquityMetadataQueue = self->_processUbiquityMetadataQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F62D8;
  v11[3] = &unk_1008E7338;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(processUbiquityMetadataQueue, v11);

}

- (BOOL)_assetHasChanged:(id)a3 updatedAsset:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  id v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "generation") == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v6, "generation");
    v7 = (uint64_t)v8 > (uint64_t)objc_msgSend(v5, "generation");
  }

  return v7;
}

- (void)_requestReOpenWithConflictDictionary:(id)a3 requestOpenAssetIDs:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F774C;
  block[3] = &unk_1008E7928;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v12 = v6;
  v13 = v5;
  v7 = v5;
  v8 = v6;
  v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_reportProgressWithItems:(id)a3
{
  id v4;
  NSObject *uploadDownloadQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  BKLibraryDataSourceUbiquityiOS *v9;

  v4 = a3;
  kdebug_trace(725352528, 0, 0, 0, 0);
  uploadDownloadQueue = self->_uploadDownloadQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F7830;
  v7[3] = &unk_1008E7338;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(uploadDownloadQueue, v7);

}

- (BOOL)iq_downloadingAssetID:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_downloadingProgressFromAssetID, "objectForKeyedSubscript:", a3));
  v4 = v3 != 0;

  return v4;
}

- (void)iq_addOrUpdateDownloadingAssetID:(id)a3 progressValue:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  NSMutableSet *v9;
  NSMutableDictionary *iq_downloadingAssetIDsFromParentAssetID;
  id v11;

  v11 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iq_downloadingProgressFromAssetID, "setObject:forKeyedSubscript:", v6, v11);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_assetFromAssetID, "objectForKeyedSubscript:", v11));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storePlaylistID"));

  if (v8)
  {
    v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_downloadingAssetIDsFromParentAssetID, "objectForKeyedSubscript:", v8));
    if (!v9)
    {
      iq_downloadingAssetIDsFromParentAssetID = self->_iq_downloadingAssetIDsFromParentAssetID;
      v9 = objc_opt_new(NSMutableSet);
      -[NSMutableDictionary setObject:forKeyedSubscript:](iq_downloadingAssetIDsFromParentAssetID, "setObject:forKeyedSubscript:", v9, v8);
    }
    -[NSMutableSet addObject:](v9, "addObject:", v11);

  }
}

- (void)iq_removeDownloadingAssetID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NSMutableDictionary removeObjectForKey:](self->_iq_downloadingProgressFromAssetID, "removeObjectForKey:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_assetFromAssetID, "objectForKeyedSubscript:", v8));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storePlaylistID"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_downloadingAssetIDsFromParentAssetID, "objectForKeyedSubscript:", v5));
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "removeObject:", v8);
      if (!objc_msgSend(v7, "count"))
        -[NSMutableDictionary removeObjectForKey:](self->_iq_downloadingAssetIDsFromParentAssetID, "removeObjectForKey:", v5);
    }

  }
}

- (id)iq_overallDownloadProgressValueForAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  void *i;
  void *v13;
  void *v14;
  float v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_downloadingProgressFromAssetID, "objectForKeyedSubscript:", v4));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_downloadingAssetIDsFromParentAssetID, "objectForKeyedSubscript:", v4));
    if (objc_msgSend(v6, "count"))
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        v11 = 0.0;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_downloadingProgressFromAssetID, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), (_QWORD)v17));
            v14 = v13;
            if (v13)
            {
              objc_msgSend(v13, "floatValue");
              v11 = v11 + v15;
            }

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v9);
      }
      else
      {
        v11 = 0.0;
      }

      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11 / (double)(unint64_t)objc_msgSend(v7, "count")));
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)iq_downloadProgressStatusesWithAssetID:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  float v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  float v21;
  double v22;
  BKLibraryDataSourceUbiquityiOS *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *i;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  id v49;
  _BYTE v50[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "isDownloading");
  v9 = objc_msgSend(v7, "isLocal");
  v42 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "downloadingPercent"));
  objc_msgSend(v10, "floatValue");
  v12 = (float)(v11 / 100.0);

  v13 = 7;
  if (v9)
    v13 = 5;
  v14 = 1.0;
  if (!v9)
    v14 = v12;
  if (v8)
    v15 = 4;
  else
    v15 = v13;
  if (!v8)
    v12 = v14;
  -[BKLibraryDataSourceUbiquityiOS iq_addOrUpdateDownloadingAssetID:progressValue:](self, "iq_addOrUpdateDownloadingAssetID:progressValue:", v6, v12);
  v16 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 2);
  v17 = objc_msgSend(objc_alloc((Class)BKLibraryDownloadStatus), "initWithAssetID:state:progressValue:timeRemaining:bytesDownloaded:fileSize:", v6, v15, -1, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, v12);
  objc_msgSend(v16, "addObject:", v17);
  v43 = v6;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_assetFromAssetID, "objectForKeyedSubscript:", v6));
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "storePlaylistID"));

  v40 = (void *)v19;
  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceUbiquityiOS iq_overallDownloadProgressValueForAssetID:](self, "iq_overallDownloadProgressValueForAssetID:", v19, v19));
    objc_msgSend(v20, "floatValue");
    v22 = v21;

    v23 = self;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_downloadingAssetIDsFromParentAssetID, "objectForKeyedSubscript:", v19));
    if ((unint64_t)objc_msgSend(v24, "count") > 1)
      v15 = 4;
    v25 = objc_msgSend(objc_alloc((Class)BKLibraryDownloadStatus), "initWithAssetID:supplementalContentState:progressValue:timeRemaining:bytesDownloaded:fileSize:", v19, v15, -1, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, v22);

    objc_msgSend(v16, "addObject:", v25);
    v41 = v25;
  }
  else
  {
    v41 = v17;
    v23 = self;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v26 = v16;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v45;
    v30 = BSUIUbiquityDownloadStatusNotification;
    v31 = BSUIUbiquityDownloadProgressKey;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v29)
          objc_enumerationMutation(v26);
        v33 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
        v34 = objc_alloc_init((Class)BSUIUbiquityDownloadProgress);
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "assetID"));
        objc_msgSend(v34, "setAssetIdentifier:", v35);

        objc_msgSend(v33, "progressValue");
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        objc_msgSend(v34, "setProgress:", v36);

        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v48 = v31;
        v49 = v34;
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
        objc_msgSend(v37, "postNotificationName:object:userInfo:", v30, v23, v38);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v28);
  }

  return v26;
}

- (id)udq_reportDownloadProgressIfNeeded:(id)a3
{
  id v4;
  void *v5;
  NSObject *ivarQueue;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD block[5];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_10004E390;
  v34 = sub_10004E248;
  v35 = 0;
  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F8618;
  block[3] = &unk_1008E8848;
  v29 = &v30;
  block[4] = self;
  v7 = v5;
  v28 = v7;
  dispatch_sync(ivarQueue, block);
  if (objc_msgSend((id)v31[5], "length"))
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = sub_10004E390;
    v25 = sub_10004E248;
    v26 = 0;
    if (objc_msgSend(v4, "isDownloading"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "downloadingPercent"));
      if (v8)
      {
        v9 = self->_ivarQueue;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1000F8654;
        v17[3] = &unk_1008EACE8;
        v19 = &v21;
        v17[4] = self;
        v20 = &v30;
        v18 = v4;
        dispatch_sync(v9, v17);

      }
    }
    else
    {
      v11 = self->_ivarQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000F869C;
      v13[3] = &unk_1008EAD10;
      v13[4] = self;
      v15 = &v30;
      v14 = v4;
      v16 = &v21;
      dispatch_sync(v11, v13);

    }
    v10 = (id)v22[5];
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(&v30, 8);
  return v10;
}

- (void)udq_reportUploadProgressIfNeeded:(id)a3 completedAssetIDs:(id)a4 failedAssets:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *ivarQueue;
  id v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  void *v17;
  void *v18;
  NSObject *workQueue;
  NSObject *v20;
  id v21;
  char v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  _QWORD v39[6];
  _QWORD v40[5];
  id v41;
  id v42;
  uint64_t *v43;
  _BYTE *v44;
  _QWORD v45[6];
  _QWORD v46[5];
  id v47;
  uint64_t *v48;
  _QWORD v49[6];
  _QWORD v50[7];
  _QWORD v51[6];
  _QWORD v52[4];
  id v53;
  BKLibraryDataSourceUbiquityiOS *v54;
  uint64_t *v55;
  _QWORD block[5];
  id v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _BYTE buf[24];
  uint64_t v71;
  __int128 v72;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "url"));
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = sub_10004E390;
  v68 = sub_10004E248;
  v69 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F8DC0;
  block[3] = &unk_1008EAD38;
  v58 = &v64;
  block[4] = self;
  v13 = v11;
  v57 = v13;
  v59 = &v60;
  dispatch_sync(ivarQueue, block);
  if (objc_msgSend((id)v65[5], "length"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uploadingError"));
    v15 = objc_msgSend(v8, "isUploading");
    if (v14)
      v16 = 0;
    else
      v16 = v15;
    if (v16 == 1)
    {
      if (!*((_BYTE *)v61 + 24))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uploadingPercent"));
        v18 = v17;
        if (v17)
        {
          workQueue = self->_workQueue;
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472;
          v52[2] = sub_1000F8E24;
          v52[3] = &unk_1008E99E8;
          v54 = self;
          v55 = &v64;
          v53 = v17;
          dispatch_async(workQueue, v52);

        }
        v20 = self->_ivarQueue;
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_1000F8F6C;
        v51[3] = &unk_1008E76D0;
        v51[4] = self;
        v51[5] = &v64;
        dispatch_sync(v20, v51);

      }
    }
    else
    {
      v21 = objc_msgSend(v8, "isUploaded");
      if (v14)
        v22 = (char)v21;
      else
        v22 = 1;
      if ((v22 & 1) != 0)
      {
        v23 = BKLibraryDataSourceUbiquityLog(v21);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = v65[5];
          *(_DWORD *)buf = 141558786;
          *(_QWORD *)&buf[4] = 1752392040;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v25;
          *(_WORD *)&buf[22] = 2160;
          v71 = 1752392040;
          LOWORD(v72) = 2112;
          *(_QWORD *)((char *)&v72 + 2) = v13;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "udq_reportUploadProgressIfNeeded: Item is now local. assetID: %{mask.hash}@ url: %{mask.hash}@", buf, 0x2Au);
        }

        if (*((_BYTE *)v61 + 24))
        {
          v26 = self->_workQueue;
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = sub_1000F90F0;
          v46[3] = &unk_1008E8848;
          v48 = &v64;
          v46[4] = self;
          v47 = v13;
          dispatch_async(v26, v46);
          v27 = self->_ivarQueue;
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472;
          v45[2] = sub_1000F92A4;
          v45[3] = &unk_1008E76D0;
          v45[4] = self;
          v45[5] = &v64;
          dispatch_sync(v27, v45);
          objc_msgSend(v9, "addObject:", v65[5]);

        }
        else
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v71 = (uint64_t)sub_10004E390;
          *(_QWORD *)&v72 = sub_10004E248;
          *((_QWORD *)&v72 + 1) = 0;
          v37 = self->_ivarQueue;
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_1000F9304;
          v40[3] = &unk_1008EAD60;
          v40[4] = self;
          v43 = &v64;
          v41 = v13;
          v44 = buf;
          v42 = v8;
          dispatch_sync(v37, v40);
          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            v38 = self->_workQueue;
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472;
            v39[2] = sub_1000F9434;
            v39[3] = &unk_1008E76D0;
            v39[4] = self;
            v39[5] = buf;
            dispatch_async(v38, v39);
          }

          _Block_object_dispose(buf, 8);
        }
      }
      else
      {
        v28 = BKLibraryDataSourceUbiquityLog(v21);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          sub_1006A05A8();

        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "unresolvedConflict"));
        v31 = v30;
        if (v30)
        {
          v32 = objc_msgSend(v30, "BOOLValue");
          if ((_DWORD)v32)
          {
            v33 = BKLibraryDataSourceUbiquityLog(v32);
            v34 = objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              sub_1006A053C();

          }
        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v71 = (uint64_t)sub_10004E390;
        *(_QWORD *)&v72 = sub_10004E248;
        *((_QWORD *)&v72 + 1) = 0;
        v35 = self->_ivarQueue;
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_1000F8F80;
        v50[3] = &unk_1008E8AD0;
        v50[4] = self;
        v50[5] = buf;
        v50[6] = &v64;
        dispatch_sync(v35, v50);
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40) && objc_msgSend(v14, "code") == (id)4354)
        {
          objc_msgSend(v10, "addObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          v36 = self->_workQueue;
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_1000F8FC8;
          v49[3] = &unk_1008E75B8;
          v49[4] = self;
          v49[5] = &v64;
          dispatch_async(v36, v49);
        }
        _Block_object_dispose(buf, 8);

      }
    }

  }
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);

}

- (BOOL)iq_updateThumbnailIfNeededForAssetID:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = v4;
  if (v4)
  {
    v6 = BKLibraryDataSourceUbiquityLog(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 141558274;
      v11 = 1752392040;
      v12 = 2112;
      v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "iq_updateThumbnailIfNeededForAssetID: Refreshing imageCache. assetID: %{mask.hash}@", (uint8_t *)&v10, 0x16u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    objc_msgSend(v8, "incrementVersionForIdentifier:", v3);

  }
  return v5 != 0;
}

- (id)_counterpartURLForURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));

  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceUbiquityiOS unzippedCounterpartCacheURL](self, "unzippedCounterpartCacheURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:", v5));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_removeCounterpartsForAssetIDs:(id)a3
{
  id v4;
  void *v5;
  NSObject *ivarQueue;
  id v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  __int128 v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD block[4];
  id v28;
  BKLibraryDataSourceUbiquityiOS *v29;
  id v30;
  uint8_t buf[4];
  id v32;
  _BYTE v33[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F98B0;
  block[3] = &unk_1008E7928;
  v7 = v4;
  v28 = v7;
  v29 = self;
  v8 = v5;
  v30 = v8;
  dispatch_sync(ivarQueue, block);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v24;
    *(_QWORD *)&v11 = 138412290;
    v21 = v11;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager", v21));
        v22 = 0;
        objc_msgSend(v16, "removeItemAtURL:error:", v15, &v22);
        v17 = v22;

        if (v17)
        {
          v19 = BKLibraryDataSourceUbiquityLog(v18);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            v32 = v17;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "\"_removeCounterpartForAssetID: removeItemAtURL failed. error: %@\", buf, 0xCu);
          }

        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v12);
  }

}

- (void)iq_purgeUnzippedBooksCacheIfNeededExceptURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  BKLibraryDataSourceUbiquityiOS *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v34 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceUbiquityiOS unzippedCounterpartCacheURL](self, "unzippedCounterpartCacheURL"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v35 = v5;
  v33 = (void *)v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enumeratorAtPath:", v7));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v9)
  {
    v10 = v9;
    v32 = v4;
    v11 = 0;
    v12 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i)));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "attributesOfItemAtPath:error:", v14, 0));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", NSFileSize));
        v17 = objc_msgSend(v16, "longValue");

        v11 += (unint64_t)v17;
        if (v11 > 0x3200000)
        {

          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lastPathComponent"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceUbiquityiOS unzippedCounterpartCacheURL](v34, "unzippedCounterpartCacheURL"));
          v40 = 0;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v18, 0, 0, &v40));
          v31 = v40;

          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v20 = v19;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v37;
            v24 = BCMetadataXattrAssetID;
            do
            {
              for (j = 0; j != v22; j = (char *)j + 1)
              {
                if (*(_QWORD *)v37 != v23)
                  objc_enumerationMutation(v20);
                v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j);
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "path"));
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lastPathComponent"));
                v29 = objc_msgSend(v28, "isEqualToString:", v8);

                if ((v29 & 1) == 0)
                {
                  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bu_extendedAttributeNamed:iCloudSyncable:", v24, 1));
                  if (objc_msgSend(v30, "length"))
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v34->_iq_counterpartURLFromAssetID, "setObject:forKeyedSubscript:", 0, v30);
                  objc_msgSend(v35, "removeItemAtURL:error:", v26, 0);

                }
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
            }
            while (v22);
          }

          goto LABEL_22;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v10)
        continue;
      break;
    }
LABEL_22:
    v4 = v32;
  }

}

- (id)iq_createUbiquityAssetFromMetadataDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  unsigned int v22;
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", BCMetadataXattrAssetID));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemURL")));
  if (v6 && objc_msgSend(v5, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLocal")));
    v22 = objc_msgSend(v7, "BOOLValue");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentChangedDate")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentFileSize")));
    v23 = objc_msgSend(v9, "longLongValue");

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iq_urlFromAssetID, "setObject:forKeyedSubscript:", v6, v5);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iq_assetIDFromURL, "setObject:forKeyedSubscript:", v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_insertionDateFromAssetID, "objectForKeyedSubscript:", v5));

    if (!v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iq_insertionDateFromAssetID, "setObject:forKeyedSubscript:", v11, v5);

    }
    v12 = -[BKLibraryDataSourceUbiquityiOS iq_downloadingAssetID:](self, "iq_downloadingAssetID:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_insertionDateFromAssetID, "objectForKeyedSubscript:", v5));
    v14 = objc_opt_class(NSDate);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentChangedDate")));
    v16 = BUDynamicCast(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceUbiquityiOS identifier](self, "identifier"));
    v19 = +[BKUbiquityAsset newAssetFromMetadata:url:downloaded:downloading:filesize:dataSourceIdentifier:insertionDate:updateDate:](BKUbiquityAsset, "newAssetFromMetadata:url:downloaded:downloading:filesize:dataSourceIdentifier:insertionDate:updateDate:", v4, v6, v22, v12, 0x7FFFFFFFFFFFFFFFLL, v18, v13, v17);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_counterpartURLFromAssetID, "objectForKeyedSubscript:", v5));
    if (v20)
      objc_msgSend(v19, "setUrl:", v20);
    if (v8)
      objc_msgSend(v19, "setUpdateDate:", v8);
    if (v23 != (id)-1)
      objc_msgSend(v19, "setFileSize:");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iq_assetFromAssetID, "setObject:forKeyedSubscript:", v19, v5);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)iq_createTempUbiquityAssetFromMetadataDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v23;
  id v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", BCMetadataXattrAssetID));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("itemURL")));
  if (v6 && objc_msgSend(v5, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLocal")));
    v23 = objc_msgSend(v7, "BOOLValue");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentChangedDate")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentFileSize")));
    v24 = objc_msgSend(v9, "longLongValue");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_insertionDateFromAssetID, "objectForKeyedSubscript:", v5));
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v14 = v12;

    v15 = -[BKLibraryDataSourceUbiquityiOS iq_downloadingAssetID:](self, "iq_downloadingAssetID:", v5);
    v16 = objc_opt_class(NSDate);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentChangedDate")));
    v18 = BUDynamicCast(v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceUbiquityiOS identifier](self, "identifier"));
    v13 = +[BKUbiquityAsset newAssetFromMetadata:url:downloaded:downloading:filesize:dataSourceIdentifier:insertionDate:updateDate:](BKUbiquityAsset, "newAssetFromMetadata:url:downloaded:downloading:filesize:dataSourceIdentifier:insertionDate:updateDate:", v4, v6, v23, v15, 0x7FFFFFFFFFFFFFFFLL, v20, v14, v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_counterpartURLFromAssetID, "objectForKeyedSubscript:", v5));
    if (v21)
      objc_msgSend(v13, "setUrl:", v21);
    if (v8)
      objc_msgSend(v13, "setUpdateDate:", v8);
    if (v24 != (id)-1)
      objc_msgSend(v13, "setFileSize:");

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)iq_clearCachesForAssetIDs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_urlFromAssetID, "objectForKeyedSubscript:", v9));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iq_urlFromAssetID, "setObject:forKeyedSubscript:", 0, v9);
        if (v10)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iq_assetIDFromURL, "setObject:forKeyedSubscript:", 0, v10);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iq_assetFromAssetID, "setObject:forKeyedSubscript:", 0, v9);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iq_insertionDateFromAssetID, "setObject:forKeyedSubscript:", 0, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  if (objc_msgSend(v4, "count"))
    -[BKLibraryDataSourceUbiquityiOS p_schedulePersistInfoToDisk](self, "p_schedulePersistInfoToDisk");

}

- (void)_unclaimAssetIDs:(id)a3
{
  id v4;
  NSObject *ivarQueue;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FA3D0;
  block[3] = &unk_1008E7338;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(ivarQueue, block);
  -[BKLibraryDataSourceUbiquityiOS _removeCounterpartsForAssetIDs:](self, "_removeCounterpartsForAssetIDs:", v7);
  -[BKLibraryDataSourceUbiquityiOS _removeAssetIDsFromCoverCacheManager:](self, "_removeAssetIDsFromCoverCacheManager:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceUbiquityiOS libraryManager](self, "libraryManager"));
  objc_msgSend(v6, "libraryDataSource:removedAssetsWithAssetIDs:orTemporaryAssetIDs:", self, v7, 0);

}

- (BOOL)_deleteFromAllDevicesURL:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  uint64_t v10;
  _QWORD v11[6];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;

  v3 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (v3)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = sub_10004E390;
    v17 = sub_10004E248;
    v18 = 0;
    v12 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000FA5E4;
    v11[3] = &unk_1008EACC0;
    v11[4] = &v19;
    v11[5] = &v13;
    +[NSURL coordinateWritingItemAtURL:options:error:byAccessor:](NSURL, "coordinateWritingItemAtURL:options:error:byAccessor:", v3, 1, &v12, v11);
    v4 = v12;
    v5 = v4;
    if (v4 || v14[5])
    {
      v6 = BKLibraryDataSourceUbiquityLog(v4);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v10 = v14[5];
        *(_DWORD *)buf = 141558786;
        v24 = 1752392040;
        v25 = 2112;
        v26 = v3;
        v27 = 2112;
        v28 = v5;
        v29 = 2112;
        v30 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "_deleteFromAllDevicesURL: removeItemAtURL failed. url: %{mask.hash}@ coordinateError: %@ removeError: %@", buf, 0x2Au);
      }

    }
    _Block_object_dispose(&v13, 8);

    v8 = *((_BYTE *)v20 + 24) != 0;
  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v8;
}

- (BOOL)_evictFromDeviceURL:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v20 = 0;
    v9 = objc_msgSend(v8, "evictUbiquitousItemAtURL:error:", v6, &v20);
    v10 = v20;

    if (v9)
    {
      v12 = objc_msgSend(objc_alloc((Class)BKLibraryDownloadStatus), "initWithAssetID:state:progressValue:timeRemaining:bytesDownloaded:fileSize:", v7, 0, -1, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, 0.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v14 = BKLibraryDownloadStatusNotification;
      v22 = BKLibraryDownloadStatusKey;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v12));
      v23 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
      objc_msgSend(v13, "postNotificationName:object:userInfo:", v14, self, v16);

      v21 = v7;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
      -[BKLibraryDataSourceUbiquityiOS _removeCounterpartsForAssetIDs:](self, "_removeCounterpartsForAssetIDs:", v17);

    }
    else
    {
      v18 = BKLibraryDataSourceUbiquityLog(v11);
      v12 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1006A06B4();
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)_triggerDownload:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSFileCoordinator *v18;
  void *v19;
  NSOperationQueue *v20;
  _QWORD v21[4];
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = BKLibraryDataSourceUbiquityLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558274;
      v27 = 1752392040;
      v28 = 2112;
      v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "_triggerDownload: url: %{mask.hash}@", buf, 0x16u);
    }

    if (v7)
    {
      v12 = objc_msgSend(objc_alloc((Class)BKLibraryDownloadStatus), "initWithAssetID:state:progressValue:timeRemaining:bytesDownloaded:fileSize:", v7, 2, -1, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, 0.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v14 = BKLibraryDownloadStatusNotification;
      v24 = BKLibraryDownloadStatusKey;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v12));
      v25 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
      objc_msgSend(v13, "postNotificationName:object:userInfo:", v14, self, v16);

    }
    else
    {
      v17 = BKLibraryDataSourceUbiquityLog(v11);
      v12 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1006A0748();
    }

    v10 = objc_claimAutoreleasedReturnValue(+[NSFileAccessIntent readingIntentWithURL:options:](NSFileAccessIntent, "readingIntentWithURL:options:", v6, 0));
    v18 = objc_opt_new(NSFileCoordinator);
    v23 = v10;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v20 = objc_opt_new(NSOperationQueue);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000FAB1C;
    v21[3] = &unk_1008E8948;
    v22 = v6;
    -[NSFileCoordinator coordinateAccessWithIntents:queue:byAccessor:](v18, "coordinateAccessWithIntents:queue:byAccessor:", v19, v20, v21);

  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_1006A071C();
  }

}

- (void)iq_setUbiquityDocumentMonitoringEnabled:(BOOL)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t buf[16];

  if (a3
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceUbiquityiOS ubiquityStatusMonitor](self, "ubiquityStatusMonitor")),
        v5 = objc_msgSend(v4, "isICloudDriveEnabled"),
        v4,
        v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceUbiquityiOS ubiquityDocumentsObserver](self, "ubiquityDocumentsObserver"));

    v8 = BKLibraryDataSourceUbiquityLog(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "iq_setUbiquityDocumentMonitoringEnabled: Restarting query.", buf, 2u);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceUbiquityiOS ubiquityDocumentsObserver](self, "ubiquityDocumentsObserver"));
      objc_msgSend(v11, "restartQuery");

    }
    else
    {
      if (v10)
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "iq_setUbiquityDocumentMonitoringEnabled: Creating new observer.", v19, 2u);
      }

      v15 = objc_alloc((Class)IMUbiquityDocumentsObserver);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceUbiquityiOS ubiquityStatusMonitor](self, "ubiquityStatusMonitor"));
      v17 = objc_msgSend(v15, "initWithDelegate:ubquityStatusMonitor:directoriesSubpath:", self, v16, 0);
      -[BKLibraryDataSourceUbiquityiOS setUbiquityDocumentsObserver:](self, "setUbiquityDocumentsObserver:", v17);

    }
  }
  else
  {
    v12 = BKLibraryDataSourceUbiquityLog(self);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "iq_setUbiquityDocumentMonitoringEnabled: Shutting down observer.", v18, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceUbiquityiOS ubiquityDocumentsObserver](self, "ubiquityDocumentsObserver"));
    objc_msgSend(v14, "tearDownQuery");

    -[BKLibraryDataSourceUbiquityiOS setUbiquityDocumentsObserver:](self, "setUbiquityDocumentsObserver:", 0);
  }
}

- (void)iq_clearAllCachesAndPersistentInfoFromDisk
{
  void *v3;
  id v4;

  -[NSMutableDictionary removeAllObjects](self->_iq_urlFromAssetID, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_iq_assetFromAssetID, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_iq_assetIDFromURL, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_iq_insertionDateFromAssetID, "removeAllObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceUbiquityiOS _persistedInfoURL](self, "_persistedInfoURL"));
  objc_msgSend(v4, "removeItemAtURL:error:", v3, 0);

}

- (void)p_schedulePersistInfoToDisk
{
  -[BUCoalescingCallBlock signalWithCompletion:](self->_coalescedPersistCachedValues, "signalWithCompletion:", &stru_1008EAD80);
}

- (void)cb_persistInfoToDisk
{
  NSObject *ivarQueue;
  NSObject *persistToDiskQueue;
  _QWORD v5[6];
  _QWORD block[6];
  _QWORD v7[5];
  id v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_10004E390;
  v7[4] = sub_10004E248;
  v8 = 0;
  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FAF2C;
  block[3] = &unk_1008E76D0;
  block[4] = self;
  block[5] = v7;
  dispatch_sync(ivarQueue, block);
  persistToDiskQueue = self->_persistToDiskQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000FB0E8;
  v5[3] = &unk_1008E75B8;
  v5[4] = self;
  v5[5] = v7;
  dispatch_async(persistToDiskQueue, v5);
  _Block_object_dispose(v7, 8);

}

- (void)iq_populateAssetIDFromURLDictionary
{
  NSMutableDictionary *iq_urlFromAssetID;
  _QWORD v3[5];

  iq_urlFromAssetID = self->_iq_urlFromAssetID;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000FB1D8;
  v3[3] = &unk_1008EADA8;
  v3[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](iq_urlFromAssetID, "enumerateKeysAndObjectsUsingBlock:", v3);
}

- (void)_addLocalAssetsForURLs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *processUbiquityMetadataQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BKLibraryDataSourceUbiquityiOS *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  processUbiquityMetadataQueue = self->_processUbiquityMetadataQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FB294;
  block[3] = &unk_1008E8898;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(processUbiquityMetadataQueue, block);

}

- (void)handleFileGenerationChangedNotification:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *ivarQueue;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;

  v4 = a3;
  v5 = BKLibraryDataSourceUbiquityLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "handleFileGenerationChangedNotification: %@", buf, 0xCu);
  }

  v7 = objc_opt_class(NSDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v9 = BUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = objc_opt_class(NSURL);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", BCUbiqityFileChangedKeyURL));
  v13 = BUDynamicCast(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = objc_opt_class(NSNumber);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", BCUbiqityFileChangedKeyGeneration));
  v17 = BUDynamicCast(v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FB8A0;
  block[3] = &unk_1008E7928;
  block[4] = self;
  v23 = v18;
  v24 = v14;
  v20 = v14;
  v21 = v18;
  dispatch_sync(ivarQueue, block);

}

- (void)iq_updateCachedAssetGeneration:(id)a3 url:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *completionHandlerQueue;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_assetIDFromURL, "objectForKeyedSubscript:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iq_assetFromAssetID, "objectForKeyedSubscript:", v7));
  if (v8)
  {
    objc_msgSend(v8, "setGeneration:", objc_msgSend(v6, "longLongValue"));
    -[BKLibraryDataSourceUbiquityiOS p_schedulePersistInfoToDisk](self, "p_schedulePersistInfoToDisk");
    completionHandlerQueue = self->_completionHandlerQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000FB994;
    v10[3] = &unk_1008E7338;
    v10[4] = self;
    v11 = v8;
    dispatch_async(completionHandlerQueue, v10);

  }
}

- (void)_updateUbiquityAssetID:(id)a3 withMetadata:(id)a4
{
  id v6;
  id v7;
  NSObject *updateAssetMetadataQueue;
  _QWORD block[4];
  id v10;
  BKLibraryDataSourceUbiquityiOS *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    updateAssetMetadataQueue = self->_updateAssetMetadataQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000FBAE4;
    block[3] = &unk_1008E7928;
    v10 = v7;
    v11 = self;
    v12 = v6;
    dispatch_async(updateAssetMetadataQueue, block);

  }
}

- (void)_addAssetsToCoverCacheManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bu_arrayByRemovingNSNulls"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("assetID")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceUbiquityiOS _coverCacheURLsForAssetIDs:](self, "_coverCacheURLsForAssetIDs:", v7));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    objc_msgSend(v6, "addURLs:priority:quality:expiresAfter:", v5, 3, 202, 0);

  }
}

- (void)_removeAssetIDsFromCoverCacheManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceUbiquityiOS _coverCacheURLsForAssetIDs:](self, "_coverCacheURLsForAssetIDs:", a3));
  if (objc_msgSend(v6, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    objc_msgSend(v3, "removeURLs:priority:quality:", v6, 3, 206);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
    objc_msgSend(v3, "incrementVersionForIdentifiers:", v5);

  }
}

- (id)_coverCacheURLsForAssetIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKCoverCacheURLSchemeHandler urlStringForAssetID:dataSourceID:](BKCoverCacheURLSchemeHandler, "urlStringForAssetID:dataSourceID:", v10, CFSTR("com.apple.ibooks.datasource.ubiquity"), (_QWORD)v14));
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = objc_msgSend(v4, "copy");
  return v12;
}

- (void)makeBooksUbiquitous:(id)a3 completion:(id)a4
{
  -[BKLibraryDataSourceUbiquityiOS _makeBooksUbiquitous:completion:](self, "_makeBooksUbiquitous:completion:", a3, a4);
}

- (void)fetchAllUbiquitousBooksWithCompletion:(id)a3
{
  id v3;
  _QWORD v4[4];
  BKLibraryDataSourceUbiquityiOS *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000FBF00;
  v4[3] = &unk_1008E9D38;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[BKLibraryDataSourceUbiquityiOS fetchAssetIDsWithCompletion:](v5, "fetchAssetIDsWithCompletion:", v4);

}

- (void)_makeBooksUbiquitous:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = BKLibraryBookImportLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v17 = objc_msgSend(v6, "count");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_makeBooksUbiquitous: count: %ld", buf, 0xCu);
  }

  if (objc_msgSend(v6, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceUbiquityiOS libraryManager](self, "libraryManager"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000FC150;
    v13[3] = &unk_1008E8B20;
    v13[4] = self;
    v14 = v6;
    v15 = v7;
    objc_msgSend(v10, "performBackgroundReadOnlyBlock:", v13);

  }
  else
  {
    v11 = objc_retainBlock(v7);
    v12 = v11;
    if (v11)
      (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);

  }
}

- (void)_addSupplementalContentMetadataFromAsset:(id)a3 toExistingAsset:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;

  v5 = a3;
  v6 = a4;
  if (v6 && objc_msgSend(v5, "isSupplementalContent"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeID"));
    if (objc_msgSend(v8, "length"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storePlaylistID"));
      if (objc_msgSend(v9, "length"))
      {
        v10 = objc_msgSend(v6, "isSupplementalContent");

        if ((v10 & 1) != 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID"));
          if (!objc_msgSend(v12, "length"))
          {
LABEL_17:

            goto LABEL_18;
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storePlaylistID"));
          v14 = objc_msgSend(v13, "length");

          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storePlaylistID"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storePlaylistID"));
            v17 = objc_msgSend(v15, "isEqual:", v16);

            if ((v17 & 1) == 0)
            {
              v35 = BKLibraryBookImportLog(v18);
              v24 = objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storePlaylistID"));
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storePlaylistID"));
                v36 = 141559298;
                v37 = 1752392040;
                v38 = 2112;
                v39 = v7;
                v40 = 2160;
                v41 = 1752392040;
                v42 = 2112;
                v43 = v25;
                v44 = 2160;
                v45 = 1752392040;
                v46 = 2112;
                v47 = v26;
                v27 = "_addSupplementalContentMetadata: Will repair asset %{mask.hash}@ for different storePlaylistID (ol"
                      "d=%{mask.hash}@, new=%{mask.hash}@)";
                goto LABEL_22;
              }
LABEL_16:

              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storePlaylistID"));
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID"));
              objc_msgSend(v6, "setSupplementalContent:playlistID:storeID:", 1, v29, v30);

              v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKUbiquityMetadataHelper sharedInstance](BKUbiquityMetadataHelper, "sharedInstance"));
              v31 = objc_msgSend(v5, "isSupplementalContent");
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storePlaylistID"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID"));
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "url"));
              objc_msgSend(v12, "setUbiquityMetadataIsSupplemental:playlistID:storeID:forURL:", v31, v32, v33, v34);

              goto LABEL_17;
            }
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeID"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID"));
            v21 = objc_msgSend(v19, "isEqual:", v20);

            if ((v21 & 1) == 0)
            {
              v23 = BKLibraryBookImportLog(v22);
              v24 = objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeID"));
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID"));
                v36 = 141559298;
                v37 = 1752392040;
                v38 = 2112;
                v39 = v7;
                v40 = 2160;
                v41 = 1752392040;
                v42 = 2112;
                v43 = v25;
                v44 = 2160;
                v45 = 1752392040;
                v46 = 2112;
                v47 = v26;
                v27 = "_addSupplementalContentMetadata: Will repair asset %{mask.hash}@ for different storeID (old=%{mask"
                      ".hash}@, new=%{mask.hash}@";
LABEL_22:
                _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v36, 0x3Eu);

                goto LABEL_16;
              }
              goto LABEL_16;
            }
          }
LABEL_18:

          goto LABEL_19;
        }
LABEL_14:
        v28 = BKLibraryBookImportLog(v11);
        v24 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v36 = 141558274;
          v37 = 1752392040;
          v38 = 2112;
          v39 = v7;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "_addSupplementalContentMetadata: Will repair asset %{mask.hash}@ for missing supplemental content properties", (uint8_t *)&v36, 0x16u);
        }
        goto LABEL_16;
      }

    }
    goto LABEL_14;
  }
LABEL_19:

}

- (id)p_moveToUbiquityItemAtURL:(id)a3 preferredFileNameWithoutPathExtension:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10004E390;
  v21 = sub_10004E248;
  v22 = 0;
  v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceUbiquityiOS workQueue](self, "workQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000FD3EC;
  v13[3] = &unk_1008E9440;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (BOOL)_isFileExistsError:(id)a3
{
  id v3;
  NSErrorDomain v4;
  BOOL v5;
  void *v6;
  void *v7;
  NSString *v8;

  v3 = a3;
  v4 = (NSErrorDomain)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));

  if (v4 == NSCocoaErrorDomain)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", NSUnderlyingErrorKey));

    v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    v5 = v8 == NSPOSIXErrorDomain && objc_msgSend(v7, "code") == (id)17;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)coverWritingModeLanguageAndPageProgressionDirectionFromAssetID:(id)a3
{
  return 0;
}

- (id)plistEntryAsDictionaryFromAssetID:(id)a3 path:(id)a4 needsCoordination:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *ivarQueue;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length"))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = sub_10004E390;
    v23 = sub_10004E248;
    v24 = 0;
    ivarQueue = self->_ivarQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000FDD1C;
    block[3] = &unk_1008E8848;
    v18 = &v19;
    block[4] = self;
    v17 = v8;
    dispatch_sync(ivarQueue, block);
    v11 = v20[5];
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[BCUbiquityMetadataHelper ubiquityMetadataForURL:options:needsCoordination:](BCUbiquityMetadataHelper, "ubiquityMetadataForURL:options:needsCoordination:", v11, -262145, v5));
      v13 = objc_msgSend((id)objc_opt_class(self), "mapUbiquityMetadataToPlistMetadata:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    }
    else
    {
      v14 = 0;
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)mapUbiquityMetadataToPlistMetadata:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v3, "count")));
    v5 = objc_opt_class(NSString);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCMetadataXattrAssetID));
    v7 = BUDynamicCast(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (objc_msgSend(v8, "length"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForUniqueId](IMLibraryPlist, "keyNameForUniqueId"));
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

    }
    v10 = objc_opt_class(NSString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCMetadataXattrTitle));
    v12 = BUDynamicCast(v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (objc_msgSend(v13, "length"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForTitle](IMLibraryPlist, "keyNameForTitle"));
      objc_msgSend(v4, "setObject:forKey:", v13, v14);

    }
    v15 = objc_opt_class(NSString);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCMetadataXattrSortTitle));
    v17 = BUDynamicCast(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    if (objc_msgSend(v18, "length"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForSortTitle](IMLibraryPlist, "keyNameForSortTitle"));
      objc_msgSend(v4, "setObject:forKey:", v18, v19);

    }
    v20 = objc_opt_class(NSString);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCMetadataXattrAuthor));
    v22 = BUDynamicCast(v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAsset actualAuthorFromMetedata:](BKLibraryAsset, "actualAuthorFromMetedata:", v23));
    if (objc_msgSend(v24, "length"))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForAuthor](IMLibraryPlist, "keyNameForAuthor"));
      objc_msgSend(v4, "setObject:forKey:", v24, v25);

    }
    v102 = v24;
    v26 = objc_opt_class(NSString);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCMetadataXattrSortAuthor));
    v28 = BUDynamicCast(v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

    if (objc_msgSend(v29, "length"))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForSortAuthor](IMLibraryPlist, "keyNameForSortAuthor"));
      objc_msgSend(v4, "setObject:forKey:", v29, v30);

    }
    v31 = objc_opt_class(NSString);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCMetadataXattrGenre));
    v33 = BUDynamicCast(v31, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

    v35 = v34;
    if (objc_msgSend(v34, "length"))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForGenre](IMLibraryPlist, "keyNameForGenre"));
      objc_msgSend(v4, "setObject:forKey:", v35, v36);

    }
    v100 = v35;
    v37 = objc_opt_class(NSString);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCMetadataXattrComments));
    v39 = BUDynamicCast(v37, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

    v41 = v40;
    if (objc_msgSend(v40, "length"))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForComments](IMLibraryPlist, "keyNameForComments"));
      objc_msgSend(v4, "setObject:forKey:", v41, v42);

    }
    v99 = v41;
    v43 = objc_opt_class(NSString);
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCMetadataXattrBookDescription));
    v45 = BUDynamicCast(v43, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);

    v47 = v46;
    if (objc_msgSend(v46, "length"))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForBookDescription](IMLibraryPlist, "keyNameForBookDescription"));
      objc_msgSend(v4, "setObject:forKey:", v47, v48);

    }
    v98 = v47;
    v105 = v8;
    v49 = objc_opt_class(NSString);
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCMetadataXattrYear));
    v51 = BUDynamicCast(v49, v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);

    if (objc_msgSend(v52, "length"))
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForYear](IMLibraryPlist, "keyNameForYear"));
      objc_msgSend(v4, "setObject:forKey:", v52, v53);

    }
    v97 = v52;
    v54 = objc_opt_class(NSString);
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCMetadataXattrExplicit));
    v56 = BUDynamicCast(v54, v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);

    v106 = v57;
    if (v57)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v57, "BOOLValue", v97, v98, v99, v100)));
      if (v58)
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForExplicitContent](IMLibraryPlist, "keyNameForExplicitContent"));
        objc_msgSend(v4, "setObject:forKey:", v58, v59);

      }
    }
    v104 = v13;
    v60 = objc_opt_class(NSDate);
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCMetadataXattrLastOpened));
    v62 = BUDynamicCast(v60, v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);

    if (v63)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForLastOpened](IMLibraryPlist, "keyNameForLastOpened"));
      objc_msgSend(v4, "setObject:forKey:", v63, v64);

    }
    v103 = v18;
    v65 = objc_opt_class(NSDate);
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCMetadataXattrFirstOpened));
    v67 = BUDynamicCast(v65, v66);
    v68 = (void *)objc_claimAutoreleasedReturnValue(v67);

    if (v68)
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForFirstOpened](IMLibraryPlist, "keyNameForFirstOpened"));
      objc_msgSend(v4, "setObject:forKey:", v68, v69);

    }
    v101 = v29;
    v70 = objc_opt_class(NSNumber);
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCMetadataXattrRating));
    v72 = BUDynamicCast(v70, v71);
    v73 = (void *)objc_claimAutoreleasedReturnValue(v72);

    if (v73)
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForRating](IMLibraryPlist, "keyNameForRating"));
      objc_msgSend(v4, "setObject:forKey:", v73, v74);

    }
    v75 = objc_opt_class(NSNumber);
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCMetadataXattrGeneration));
    v77 = BUDynamicCast(v75, v76);
    v78 = (void *)objc_claimAutoreleasedReturnValue(v77);

    if (v78)
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForGeneration](IMLibraryPlist, "keyNameForGeneration"));
      objc_msgSend(v4, "setObject:forKey:", v78, v79);

    }
    v80 = objc_opt_class(NSString);
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCMetadataXattrIsSupplementalContent));
    v82 = BUDynamicCast(v80, v81);
    v83 = (void *)objc_claimAutoreleasedReturnValue(v82);

    if (v83)
    {
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v106, "BOOLValue")));
      if (v84)
      {
        v85 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForIsSupplementalContent](IMLibraryPlist, "keyNameForIsSupplementalContent"));
        objc_msgSend(v4, "setObject:forKey:", v84, v85);

      }
    }
    v86 = objc_opt_class(NSString);
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCMetadataXattrStoreID));
    v88 = BUDynamicCast(v86, v87);
    v89 = (void *)objc_claimAutoreleasedReturnValue(v88);

    if (objc_msgSend(v89, "length"))
    {
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForStoreId](IMLibraryPlist, "keyNameForStoreId"));
      objc_msgSend(v4, "setObject:forKey:", v89, v90);

    }
    v91 = objc_opt_class(NSString);
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BCMetadataXattrStorePlaylistID));
    v93 = BUDynamicCast(v91, v92);
    v94 = (void *)objc_claimAutoreleasedReturnValue(v93);

    if (objc_msgSend(v94, "length"))
    {
      v95 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForStorePlaylistId](IMLibraryPlist, "keyNameForStorePlaylistId"));
      objc_msgSend(v4, "setObject:forKey:", v94, v95);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)extractOperationDidFinish:(id)a3
{
  void *v4;
  NSObject *ivarQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userContext"));
  ivarQueue = self->_ivarQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FE6D4;
  v7[3] = &unk_1008E7338;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(ivarQueue, v7);

}

- (void)extractOperationDidFail:(id)a3
{
  id v4;
  NSObject *ivarQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  BKLibraryDataSourceUbiquityiOS *v9;

  v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FE9C4;
  v7[3] = &unk_1008E7338;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(ivarQueue, v7);

}

- (BKLibraryManager)libraryManager
{
  return (BKLibraryManager *)objc_loadWeakRetained((id *)&self->_libraryManager);
}

- (BKUbiquitousBooksUploadReporting)uploadReporter
{
  return self->_uploadReporter;
}

- (id)madeUbiquitousNotifyBlock
{
  return self->_madeUbiquitousNotifyBlock;
}

- (OS_dispatch_queue)ivarQueue
{
  return self->_ivarQueue;
}

- (void)setIvarQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ivarQueue, a3);
}

- (NSMutableDictionary)iq_urlFromAssetID
{
  return self->_iq_urlFromAssetID;
}

- (void)setIq_urlFromAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_iq_urlFromAssetID, a3);
}

- (NSMutableDictionary)iq_counterpartURLFromAssetID
{
  return self->_iq_counterpartURLFromAssetID;
}

- (void)setIq_counterpartURLFromAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_iq_counterpartURLFromAssetID, a3);
}

- (NSMutableDictionary)iq_assetIDFromURL
{
  return self->_iq_assetIDFromURL;
}

- (void)setIq_assetIDFromURL:(id)a3
{
  objc_storeStrong((id *)&self->_iq_assetIDFromURL, a3);
}

- (NSMutableDictionary)iq_assetFromAssetID
{
  return self->_iq_assetFromAssetID;
}

- (void)setIq_assetFromAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_iq_assetFromAssetID, a3);
}

- (NSMutableDictionary)iq_insertionDateFromAssetID
{
  return self->_iq_insertionDateFromAssetID;
}

- (void)setIq_insertionDateFromAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_iq_insertionDateFromAssetID, a3);
}

- (NSMutableSet)iq_uploadingAssetIDs
{
  return self->_iq_uploadingAssetIDs;
}

- (void)setIq_uploadingAssetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_iq_uploadingAssetIDs, a3);
}

- (NSMutableSet)iq_downloadingAssetIDs
{
  return self->_iq_downloadingAssetIDs;
}

- (void)setIq_downloadingAssetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_iq_downloadingAssetIDs, a3);
}

- (NSMutableDictionary)iq_downloadingProgressFromAssetID
{
  return self->_iq_downloadingProgressFromAssetID;
}

- (void)setIq_downloadingProgressFromAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_iq_downloadingProgressFromAssetID, a3);
}

- (NSMutableDictionary)iq_downloadingAssetIDsFromParentAssetID
{
  return self->_iq_downloadingAssetIDsFromParentAssetID;
}

- (void)setIq_downloadingAssetIDsFromParentAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_iq_downloadingAssetIDsFromParentAssetID, a3);
}

- (OS_dispatch_queue)completionHandlerQueue
{
  return self->_completionHandlerQueue;
}

- (void)setCompletionHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlerQueue, a3);
}

- (NSHashTable)cq_metadataQueryHandlingObservers
{
  return self->_cq_metadataQueryHandlingObservers;
}

- (void)setCq_metadataQueryHandlingObservers:(id)a3
{
  objc_storeStrong((id *)&self->_cq_metadataQueryHandlingObservers, a3);
}

- (OS_dispatch_queue)uploadDownloadQueue
{
  return self->_uploadDownloadQueue;
}

- (void)setUploadDownloadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_uploadDownloadQueue, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_dispatch_queue)updateAssetMetadataQueue
{
  return self->_updateAssetMetadataQueue;
}

- (void)setUpdateAssetMetadataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updateAssetMetadataQueue, a3);
}

- (OS_dispatch_queue)processUbiquityMetadataQueue
{
  return self->_processUbiquityMetadataQueue;
}

- (void)setProcessUbiquityMetadataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processUbiquityMetadataQueue, a3);
}

- (OS_dispatch_queue)processMetadataQueryQueue
{
  return self->_processMetadataQueryQueue;
}

- (void)setProcessMetadataQueryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processMetadataQueryQueue, a3);
}

- (OS_dispatch_queue)persistToDiskQueue
{
  return self->_persistToDiskQueue;
}

- (void)setPersistToDiskQueue:(id)a3
{
  objc_storeStrong((id *)&self->_persistToDiskQueue, a3);
}

- (NSOperationQueue)uncompressQueue
{
  return self->_uncompressQueue;
}

- (void)setUncompressQueue:(id)a3
{
  objc_storeStrong((id *)&self->_uncompressQueue, a3);
}

- (BUCoalescingCallBlock)coalescedPersistCachedValues
{
  return self->_coalescedPersistCachedValues;
}

- (void)setCoalescedPersistCachedValues:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedPersistCachedValues, a3);
}

- (IMUbiquityDocumentsObserver)ubiquityDocumentsObserver
{
  return self->_ubiquityDocumentsObserver;
}

- (void)setUbiquityDocumentsObserver:(id)a3
{
  objc_storeStrong((id *)&self->_ubiquityDocumentsObserver, a3);
}

- (IMUbiquityStatusMonitor)ubiquityStatusMonitor
{
  return self->_ubiquityStatusMonitor;
}

- (void)setUbiquityStatusMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_ubiquityStatusMonitor, a3);
}

- (BOOL)handledInitialMetadataQuery
{
  return self->_handledInitialMetadataQuery;
}

- (void)setHandledInitialMetadataQuery:(BOOL)a3
{
  self->_handledInitialMetadataQuery = a3;
}

- (BKAssetMetadataCaching)assetMetadataCache
{
  return (BKAssetMetadataCaching *)objc_loadWeakRetained((id *)&self->_assetMetadataCache);
}

- (void)setAssetMetadataCache:(id)a3
{
  objc_storeWeak((id *)&self->_assetMetadataCache, a3);
}

- (BKAssetCoverImageHelping)coverImageHelper
{
  return (BKAssetCoverImageHelping *)objc_loadWeakRetained((id *)&self->_coverImageHelper);
}

- (void)setCoverImageHelper:(id)a3
{
  objc_storeWeak((id *)&self->_coverImageHelper, a3);
}

- (BKLibraryImageSource)imageSource
{
  return (BKLibraryImageSource *)objc_loadWeakRetained((id *)&self->_imageSource);
}

- (void)setImageSource:(id)a3
{
  objc_storeWeak((id *)&self->_imageSource, a3);
}

- (BOOL)shouldArchivePathFixupRevision
{
  return self->_shouldArchivePathFixupRevision;
}

- (void)setShouldArchivePathFixupRevision:(BOOL)a3
{
  self->_shouldArchivePathFixupRevision = a3;
}

- (BOOL)skipThumbnailGeneration
{
  return self->_skipThumbnailGeneration;
}

- (void)setSkipThumbnailGeneration:(BOOL)a3
{
  self->_skipThumbnailGeneration = a3;
}

- (BOOL)emptyCacheDirectory
{
  return self->_emptyCacheDirectory;
}

- (void)setEmptyCacheDirectory:(BOOL)a3
{
  self->_emptyCacheDirectory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unzippedCounterpartCacheURL, 0);
  objc_destroyWeak((id *)&self->_imageSource);
  objc_destroyWeak((id *)&self->_coverImageHelper);
  objc_destroyWeak((id *)&self->_assetMetadataCache);
  objc_storeStrong((id *)&self->_ubiquityStatusMonitor, 0);
  objc_storeStrong((id *)&self->_ubiquityDocumentsObserver, 0);
  objc_storeStrong((id *)&self->_coalescedPersistCachedValues, 0);
  objc_storeStrong((id *)&self->_uncompressQueue, 0);
  objc_storeStrong((id *)&self->_persistToDiskQueue, 0);
  objc_storeStrong((id *)&self->_processMetadataQueryQueue, 0);
  objc_storeStrong((id *)&self->_processUbiquityMetadataQueue, 0);
  objc_storeStrong((id *)&self->_updateAssetMetadataQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_uploadDownloadQueue, 0);
  objc_storeStrong((id *)&self->_cq_metadataQueryHandlingObservers, 0);
  objc_storeStrong((id *)&self->_completionHandlerQueue, 0);
  objc_storeStrong((id *)&self->_iq_downloadingAssetIDsFromParentAssetID, 0);
  objc_storeStrong((id *)&self->_iq_downloadingProgressFromAssetID, 0);
  objc_storeStrong((id *)&self->_iq_downloadingAssetIDs, 0);
  objc_storeStrong((id *)&self->_iq_uploadingAssetIDs, 0);
  objc_storeStrong((id *)&self->_iq_insertionDateFromAssetID, 0);
  objc_storeStrong((id *)&self->_iq_assetFromAssetID, 0);
  objc_storeStrong((id *)&self->_iq_assetIDFromURL, 0);
  objc_storeStrong((id *)&self->_iq_counterpartURLFromAssetID, 0);
  objc_storeStrong((id *)&self->_iq_urlFromAssetID, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong(&self->_madeUbiquitousNotifyBlock, 0);
  objc_storeStrong((id *)&self->_uploadReporter, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
}

@end
