@implementation BKUbiquitousDocumentsController

- (BKUbiquitousDocumentsController)initWithUbiquityStatusMonitor:(id)a3 ubiquitousBooksPlistHost:(id)a4 ubiquityEligibleBooksProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  BKUbiquitousDocumentsController *v11;
  BKUbiquitousDocumentsController *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *migrationQueue;
  NSOperationQueue *v15;
  NSOperationQueue *bookOperationsQueue;
  NSMutableSet *v17;
  NSMutableSet *booksThatEncounteredUploadError;
  IMUbiquityQuotaFetcher *v19;
  IMUbiquityQuotaFetcher *quotaFetcher;
  NSMutableArray *v21;
  NSMutableArray *pendingQuotaFetchMigrationBlocks;
  NSMutableDictionary *v23;
  NSMutableDictionary *assetIDToFileSizeMapPendingUpload;
  NSMutableDictionary *v25;
  NSMutableDictionary *assetIDToFileSizeMapUploadedSinceLastQuotaReceived;
  NSMutableSet *v27;
  NSMutableSet *ongoingMigrationAttemptAssetIDs;
  NSMutableArray *v29;
  NSMutableArray *ongoingMigrationAttemptObservers;
  id v31;
  BUCoalescingCallBlock *v32;
  BUCoalescingCallBlock *ongoingMigrationAttemptTimer;
  void **v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *);
  void *v38;
  id v39;
  id location;
  objc_super v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v41.receiver = self;
  v41.super_class = (Class)BKUbiquitousDocumentsController;
  v11 = -[BKUbiquitousDocumentsController init](&v41, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_ubiquityStatusMonitor, v8);
    objc_storeWeak((id *)&v12->_ubiquitousBooksPlistHost, v9);
    objc_storeWeak((id *)&v12->_ubiquityEligibleBooksProvider, v10);
    v13 = dispatch_queue_create("com.apple.ibooks.BKUbiquitousDocumentsController.migrationQueue", 0);
    migrationQueue = v12->_migrationQueue;
    v12->_migrationQueue = (OS_dispatch_queue *)v13;

    v15 = objc_opt_new(NSOperationQueue);
    bookOperationsQueue = v12->_bookOperationsQueue;
    v12->_bookOperationsQueue = v15;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v12->_bookOperationsQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v12->_bookOperationsQueue, "setQualityOfService:", 17);
    v17 = objc_opt_new(NSMutableSet);
    booksThatEncounteredUploadError = v12->_booksThatEncounteredUploadError;
    v12->_booksThatEncounteredUploadError = v17;

    v19 = objc_opt_new(IMUbiquityQuotaFetcher);
    quotaFetcher = v12->_quotaFetcher;
    v12->_quotaFetcher = v19;

    v21 = objc_opt_new(NSMutableArray);
    pendingQuotaFetchMigrationBlocks = v12->_pendingQuotaFetchMigrationBlocks;
    v12->_pendingQuotaFetchMigrationBlocks = v21;

    v23 = objc_opt_new(NSMutableDictionary);
    assetIDToFileSizeMapPendingUpload = v12->_assetIDToFileSizeMapPendingUpload;
    v12->_assetIDToFileSizeMapPendingUpload = v23;

    v25 = objc_opt_new(NSMutableDictionary);
    assetIDToFileSizeMapUploadedSinceLastQuotaReceived = v12->_assetIDToFileSizeMapUploadedSinceLastQuotaReceived;
    v12->_assetIDToFileSizeMapUploadedSinceLastQuotaReceived = v25;

    v12->_ongoingMigrationAttemptAccessLock._os_unfair_lock_opaque = 0;
    v27 = objc_opt_new(NSMutableSet);
    ongoingMigrationAttemptAssetIDs = v12->_ongoingMigrationAttemptAssetIDs;
    v12->_ongoingMigrationAttemptAssetIDs = v27;

    v29 = objc_opt_new(NSMutableArray);
    ongoingMigrationAttemptObservers = v12->_ongoingMigrationAttemptObservers;
    v12->_ongoingMigrationAttemptObservers = v29;

    objc_initWeak(&location, v12);
    v31 = objc_alloc((Class)BUCoalescingCallBlock);
    v35 = _NSConcreteStackBlock;
    v36 = 3221225472;
    v37 = sub_10019117C;
    v38 = &unk_1008E8718;
    objc_copyWeak(&v39, &location);
    v32 = (BUCoalescingCallBlock *)objc_msgSend(v31, "initWithNotifyBlock:blockDescription:", &v35, CFSTR("ongoingMigrationAttemptTimer"));
    ongoingMigrationAttemptTimer = v12->_ongoingMigrationAttemptTimer;
    v12->_ongoingMigrationAttemptTimer = v32;

    -[BUCoalescingCallBlock setCoalescingDelay:](v12->_ongoingMigrationAttemptTimer, "setCoalescingDelay:", 5.0, v35, v36, v37, v38);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)makeAllUbiquitousBooksLocalWithCompletion:(id)a3
{
  id v4;
  _QWORD *v5;
  NSObject *v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001912C4;
  v10[3] = &unk_1008EADD0;
  v10[4] = self;
  v11 = a3;
  v4 = v11;
  v5 = objc_retainBlock(v10);
  v6 = objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController migrationQueue](self, "migrationQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100191384;
  v8[3] = &unk_1008E7680;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)makeAllEligibleLocalBooksUbiquitousWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[BKUbiquitousDocumentsController _enterOngoingMigrateAllAttempt](self, "_enterOngoingMigrateAllAttempt");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100191780;
  v7[3] = &unk_1008E7680;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addCustomOperationBlock:", v7);

}

- (void)_makeAllEligibleLocalBooksUbiquitousWithCompletion:(id)a3
{
  id v4;
  _QWORD *v5;
  NSObject *v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100191938;
  v10[3] = &unk_1008EADD0;
  v10[4] = self;
  v11 = a3;
  v4 = v11;
  v5 = objc_retainBlock(v10);
  v6 = objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController migrationQueue](self, "migrationQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001919F8;
  v8[3] = &unk_1008E7680;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)migrateBooksToUbiquityIfNeededWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[BKUbiquitousDocumentsController _enterOngoingMigrateAllAttempt](self, "_enterOngoingMigrateAllAttempt");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100191E6C;
  v7[3] = &unk_1008E7680;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addCustomOperationBlock:", v7);

}

- (void)_migrateBooksToUbiquityIfNeededWithCompletion:(id)a3
{
  id v4;
  _QWORD *v5;
  NSObject *v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];
  _QWORD v11[5];
  id v12;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100192048;
  v11[3] = &unk_1008ED868;
  v11[4] = self;
  v12 = a3;
  v4 = v12;
  v5 = objc_retainBlock(v11);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[BKUbiquitousDocumentsController] Attempting to migrateBooksToUbiquityIfNeededWithCompletion:", buf, 2u);
  }
  v6 = objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController migrationQueue](self, "migrationQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10019234C;
  v8[3] = &unk_1008E7680;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)migrateBookToUbiquity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[2];
  id (*v20)(uint64_t);
  void *v21;
  BKUbiquitousDocumentsController *v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;

  v6 = a3;
  v7 = a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_10004E4C8;
  v24[4] = sub_10004E2D8;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "temporaryAssetID"));
  v25 = (id)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController _permanentOrTemporaryAssetIDsWithAssetID:temporaryAssetID:](self, "_permanentOrTemporaryAssetIDsWithAssetID:temporaryAssetID:", v8, v9));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v20 = sub_100192A34;
  v21 = &unk_1008E76D0;
  v22 = self;
  v23 = v24;
  v10 = v19;
  os_unfair_lock_lock(&self->_ongoingMigrationAttemptAccessLock);
  v20((uint64_t)v10);
  os_unfair_lock_unlock(&self->_ongoingMigrationAttemptAccessLock);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController ongoingMigrationAttemptTimer](self, "ongoingMigrationAttemptTimer"));
  objc_msgSend(v11, "signalWithCompletion:", &stru_1008ED888);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100192A4C;
  v15[3] = &unk_1008ED8D8;
  v15[4] = self;
  v13 = v6;
  v16 = v13;
  v18 = v24;
  v14 = v7;
  v17 = v14;
  objc_msgSend(v12, "addCustomOperationBlock:", v15);

  _Block_object_dispose(v24, 8);
}

- (void)_migrateBookToUbiquity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  NSObject *v11;
  _QWORD *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100192C6C;
  v17[3] = &unk_1008ED900;
  v17[4] = self;
  v8 = v6;
  v18 = v8;
  v19 = v7;
  v9 = v7;
  v10 = objc_retainBlock(v17);
  v11 = objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController migrationQueue](self, "migrationQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100192D7C;
  v14[3] = &unk_1008E8898;
  v14[4] = self;
  v15 = v8;
  v16 = v10;
  v12 = v10;
  v13 = v8;
  dispatch_async(v11, v14);

}

- (void)boq_migrateBooksThatWillFitToUbiquityAfterQuotaFetch:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[BKUbiquitousDocumentsController setPendingQuotaFetch:](self, "setPendingQuotaFetch:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController quotaFetcher](self, "quotaFetcher"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001938A8;
  v11[3] = &unk_1008ED950;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "fetchUserQuotaWithCompletion:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)boq_migrateBooksThatWillFitToUbiquity:(id)a3 completion:(id)a4
{
  id v6;
  char *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _BYTE *v22;
  char *v23;
  id v24;
  NSMutableArray *v25;
  uint64_t v26;
  NSObject *v27;
  char *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  char *v36;
  char *v37;
  int64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  char *v43;
  char *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  char *v49;
  id v50;
  void *v51;
  int64_t v52;
  void *v53;
  id v54;
  NSMutableArray *v55;
  void *v56;
  id obj;
  _QWORD v58[5];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  char *v65;
  __int16 v66;
  char *v67;
  __int16 v68;
  int64_t v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];

  v6 = a3;
  v54 = a4;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v6));
  v55 = objc_opt_new(NSMutableArray);
  v52 = -[BKUbiquitousDocumentsController boq_spaceOccupiedByBooksMigratedSinceLastQuotaCheck](self, "boq_spaceOccupiedByBooksMigratedSinceLastQuotaCheck");
  v7 = (char *)-[BKUbiquitousDocumentsController ubiquityAvailableSpace](self, "ubiquityAvailableSpace") - v52;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v61 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetID", v52));
        if (v13)
        {
          v14 = (void *)v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "url"));

          if (v15)
          {
            v16 = objc_alloc((Class)BKLibraryFileSizeManagerCacheItemRequest);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "url"));
            v19 = objc_msgSend(v16, "initWithCacheItemRequestWithAssetID:assetURL:", v17, v18);

            v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryFileSizeManager sharedInstance](BKLibraryFileSizeManager, "sharedInstance"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "synchronousFileSizeForCacheItemRequest:", v19));

            if (v21)
            {
              v22 = objc_msgSend(v21, "longLongValue");
              v23 = (char *)(v7 - v22);
              if ((uint64_t)v7 >= (uint64_t)v22)
              {
                -[NSMutableArray addObject:](v55, "addObject:", v12);
                objc_msgSend(v56, "removeObject:", v12);
                v7 = v23;
              }
            }

          }
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    }
    while (v9);
  }

  v24 = objc_msgSend(v56, "count");
  v25 = v55;
  if (v24)
  {
    v26 = BKLibraryBookImportLog(v24);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (char *)objc_msgSend(v56, "count");
      *(_DWORD *)buf = 134217984;
      v65 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Marking %ld books with upload error since they wouldn't fit in iCloud", buf, 0xCu);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController booksThatEncounteredUploadError](self, "booksThatEncounteredUploadError"));
    objc_msgSend(v29, "unionSet:", v56);

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "allObjects"));
    -[BKUbiquitousDocumentsController p_postStatusNotificationForAssets:withState:](self, "p_postStatusNotificationForAssets:withState:", v30, 10);

  }
  if (-[NSMutableArray count](v55, "count", v52))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController booksThatEncounteredUploadError](self, "booksThatEncounteredUploadError"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v55));
    objc_msgSend(v31, "minusSet:", v32);

    v34 = BKLibraryBookImportLog(v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (char *)-[NSMutableArray count](v55, "count");
      v37 = (char *)((_BYTE *)-[BKUbiquitousDocumentsController ubiquityAvailableSpace](self, "ubiquityAvailableSpace")
                   - v7);
      v38 = -[BKUbiquitousDocumentsController ubiquityAvailableSpace](self, "ubiquityAvailableSpace");
      *(_DWORD *)buf = 134218752;
      v65 = v36;
      v66 = 2048;
      v67 = v37;
      v68 = 2048;
      v69 = v38 - (_QWORD)v53;
      v70 = 2048;
      v71 = v53;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Will start migrating %ld books occupying %lld/%lld bytes (compensation: %lld)", buf, 0x2Au);
    }

    -[BKUbiquitousDocumentsController boq_addPendingUploadQuotaCompensationForAssets:](self, "boq_addPendingUploadQuotaCompensationForAssets:", v55);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController ubiquitousBooksPlistHost](self, "ubiquitousBooksPlistHost"));
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_1001940B8;
    v58[3] = &unk_1008E9D38;
    v58[4] = self;
    v40 = v54;
    v59 = v54;
    objc_msgSend(v39, "makeBooksUbiquitous:completion:", v55, v58);

  }
  else
  {
    v41 = BKLibraryBookImportLog(0);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = (char *)((_BYTE *)-[BKUbiquitousDocumentsController ubiquityAvailableSpace](self, "ubiquityAvailableSpace")
                   - v7);
      v44 = (char *)((_BYTE *)-[BKUbiquitousDocumentsController ubiquityAvailableSpace](self, "ubiquityAvailableSpace")
                   - (_BYTE *)v53);
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "valueForKey:", CFSTR("assetID")));
      *(_DWORD *)buf = 134218754;
      v65 = v43;
      v66 = 2048;
      v67 = v44;
      v25 = v55;
      v68 = 2048;
      v69 = (int64_t)v53;
      v70 = 2112;
      v71 = v45;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Nothing to migrate, probably because nothing will fit. Avail: %lld/%lld bytes (compensation: %lld). booksToBeMarkedWithAnUploadError: [%@]", buf, 0x2Au);

    }
    v47 = BKLibraryBookImportLog(v46);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "valueForKey:", CFSTR("assetID")));
      *(_DWORD *)buf = 138412290;
      v65 = v49;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "calling callback after NOT migrating assetIDs [%@]", buf, 0xCu);

    }
    v40 = v54;
    v50 = objc_retainBlock(v54);
    v51 = v50;
    if (v50)
      (*((void (**)(id, _QWORD, _QWORD))v50 + 2))(v50, 0, 0);

  }
}

- (void)waitForOngoingMigrationAttemptToFinishWithAssetID:(id)a3 temporaryAssetID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  id v26;
  uint64_t *v27;
  _QWORD v28[2];
  void (*v29)(uint64_t);
  void *v30;
  BKUbiquitousDocumentsController *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  _BYTE *v38;
  _QWORD v39[5];
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  _BYTE buf[24];
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController _permanentOrTemporaryAssetIDsWithAssetID:temporaryAssetID:](self, "_permanentOrTemporaryAssetIDsWithAssetID:temporaryAssetID:", v8, v9));
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100194508;
  v39[3] = &unk_1008ED978;
  v12 = v10;
  v39[4] = self;
  v40 = v12;
  v22 = objc_retainBlock(v39);
  v13 = objc_msgSend(v11, "count");
  if (v13)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v50 = sub_10004E4C8;
    v51 = sub_10004E2D8;
    v52 = 0;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v29 = sub_10019460C;
    v30 = &unk_1008ED9A0;
    v31 = self;
    v14 = v11;
    v32 = v14;
    v36 = &v45;
    v15 = v22;
    v35 = v15;
    v37 = &v41;
    v38 = buf;
    v33 = v8;
    v34 = v9;
    v16 = v28;
    os_unfair_lock_lock(&self->_ongoingMigrationAttemptAccessLock);
    v29((uint64_t)v16);
    os_unfair_lock_unlock(&self->_ongoingMigrationAttemptAccessLock);

    if (*((_BYTE *)v42 + 24))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController ongoingMigrationAttemptTimer](self, "ongoingMigrationAttemptTimer"));
      objc_msgSend(v17, "signalWithCompletion:", &stru_1008ED9C0);

    }
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      *((_BYTE *)v46 + 24) = 1;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController ubiquityEligibleBooksProvider](self, "ubiquityEligibleBooksProvider"));
      v19 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1001946C0;
      v23[3] = &unk_1008EDA30;
      v23[4] = self;
      v24 = v14;
      v25 = v15;
      v27 = &v41;
      v26 = v12;
      objc_msgSend(v18, "fetchLocalAssetWithID:completion:", v19, v23);

    }
    _Block_object_dispose(buf, 8);

  }
  if (!*((_BYTE *)v46 + 24))
  {
    v20 = BKLibraryBookImportLog(v13);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558274;
      *(_QWORD *)&buf[4] = 1752392040;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "OngoingMigrationAttempt - No wait needed for %{mask.hash}@", buf, 0x16u);
    }

    -[BKUbiquitousDocumentsController _notifyOngoingMigrationAttemptCompletion:hasPendingChange:](self, "_notifyOngoingMigrationAttemptCompletion:hasPendingChange:", v12, 0);
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

}

- (void)al_addAssetIDsForOngoingMigrationAttempt:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = BKLibraryBookImportLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 141558274;
    v9 = 1752392040;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "OngoingMigrationAttempt - Add assetIDs: %{mask.hash}@", (uint8_t *)&v8, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController ongoingMigrationAttemptAssetIDs](self, "ongoingMigrationAttemptAssetIDs"));
  objc_msgSend(v7, "unionSet:", v4);

}

- (void)_removeAssetIDsForOngoingMigrationAttempt:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  void (*v24)(uint64_t);
  void *v25;
  BKUbiquitousDocumentsController *v26;
  id v27;
  _BYTE *v28;
  uint8_t v29[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint8_t v33[128];
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  NSMutableArray *v37;

  v4 = a3;
  v5 = BKLibraryBookImportLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558274;
    *(_QWORD *)&buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "OngoingMigrationAttempt - Remove assetIDs: %{mask.hash}@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v35 = sub_10004E4C8;
  v36 = sub_10004E2D8;
  v37 = objc_opt_new(NSMutableArray);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v24 = sub_100194DCC;
  v25 = &unk_1008E7658;
  v26 = self;
  v18 = v4;
  v27 = v18;
  v28 = buf;
  v7 = v23;
  os_unfair_lock_lock(&self->_ongoingMigrationAttemptAccessLock);
  v24((uint64_t)v7);
  os_unfair_lock_unlock(&self->_ongoingMigrationAttemptAccessLock);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = *(id *)(*(_QWORD *)&buf[8] + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v33, 16);
  v10 = v9;
  if (v9)
  {
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v12);
        v14 = BKLibraryBookImportLog(v9);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "assetIDs"));
          *(_DWORD *)v29 = 141558274;
          v30 = 1752392040;
          v31 = 2112;
          v32 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "OngoingMigrationAttempt - Done waiting for %{mask.hash}@", v29, 0x16u);

        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "notifyBlock"));
        -[BKUbiquitousDocumentsController _notifyOngoingMigrationAttemptCompletion:hasPendingChange:](self, "_notifyOngoingMigrationAttemptCompletion:hasPendingChange:", v17, 1);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v33, 16);
      v10 = v9;
    }
    while (v9);
  }

  _Block_object_dispose(buf, 8);
}

- (void)_enterOngoingMigrateAllAttempt
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v3 = BKLibraryBookImportLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "OngoingMigrationAttempt - Enter 'migrate all' attempt", buf, 2u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100194FE4;
  v6[3] = &unk_1008E72C0;
  v6[4] = self;
  os_unfair_lock_lock(&self->_ongoingMigrationAttemptAccessLock);
  sub_100194FE4((uint64_t)v6);
  os_unfair_lock_unlock(&self->_ongoingMigrationAttemptAccessLock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController ongoingMigrationAttemptTimer](self, "ongoingMigrationAttemptTimer"));
  objc_msgSend(v5, "signalWithCompletion:", &stru_1008EDA50);

}

- (void)_leaveOngoingMigrateAllAttempt
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = BKLibraryBookImportLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "OngoingMigrationAttempt - Leave 'migrate all' attempt", v5, 2u);
  }

  -[BKUbiquitousDocumentsController _decrementOrDoneOngoingMigrateAllAttempt](self, "_decrementOrDoneOngoingMigrateAllAttempt");
}

- (void)_decrementOrDoneOngoingMigrateAllAttempt
{
  _QWORD *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[2];
  void (*v9)(uint64_t);
  void *v10;
  BKUbiquitousDocumentsController *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  NSSet *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10004E4C8;
  v17 = sub_10004E2D8;
  v18 = objc_opt_new(NSSet);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v9 = sub_10019523C;
  v10 = &unk_1008E76D0;
  v11 = self;
  v12 = &v13;
  v3 = v8;
  os_unfair_lock_lock(&self->_ongoingMigrationAttemptAccessLock);
  v9((uint64_t)v3);
  os_unfair_lock_unlock(&self->_ongoingMigrationAttemptAccessLock);

  v4 = objc_msgSend((id)v14[5], "count");
  if (v4)
  {
    v5 = BKLibraryBookImportLog(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v14[5];
      *(_DWORD *)buf = 141558274;
      v20 = 1752392040;
      v21 = 2112;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "OngoingMigrationAttempt - No more pending 'migrate all' attempts, triggering observers for %{mask.hash}@", buf, 0x16u);
    }

    -[BKUbiquitousDocumentsController _removeAssetIDsForOngoingMigrationAttempt:](self, "_removeAssetIDsForOngoingMigrationAttempt:", v14[5]);
  }
  _Block_object_dispose(&v13, 8);

}

- (void)_checkTimeoutForOngoingMigrationAttempt
{
  os_unfair_lock_s *p_ongoingMigrationAttemptAccessLock;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];
  id (*v11)(uint64_t);
  void *v12;
  BKUbiquitousDocumentsController *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_10004E4C8;
  v25 = sub_10004E2D8;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  p_ongoingMigrationAttemptAccessLock = &self->_ongoingMigrationAttemptAccessLock;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v11 = sub_1001954E0;
  v12 = &unk_1008EDA78;
  v13 = self;
  v14 = &v27;
  v15 = &v21;
  v16 = &v17;
  v4 = v10;
  os_unfair_lock_lock(p_ongoingMigrationAttemptAccessLock);
  v11((uint64_t)v4);
  os_unfair_lock_unlock(p_ongoingMigrationAttemptAccessLock);

  if (*((_BYTE *)v18 + 24))
  {
    v6 = BKLibraryBookImportLog(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v28[3];
      v9 = v22[5];
      *(_DWORD *)buf = 134218498;
      v32 = v8;
      v33 = 2160;
      v34 = 1752392040;
      v35 = 2112;
      v36 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "OngoingMigrationAttempt - Timeout - %ld outstanding 'migrate all', assetIDs: %{mask.hash}@", buf, 0x20u);
    }

    -[BKUbiquitousDocumentsController _decrementOrDoneOngoingMigrateAllAttempt](self, "_decrementOrDoneOngoingMigrateAllAttempt");
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

- (void)_notifyOngoingMigrationAttemptCompletion:(id)a3 hasPendingChange:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10019563C;
    v10[3] = &unk_1008E7818;
    v11 = v6;
    objc_msgSend(v7, "addCustomOperationBlock:", v10);

  }
  else
  {
    v8 = objc_retainBlock(v5);
    v9 = v8;
    if (v8)
      (*((void (**)(id))v8 + 2))(v8);

  }
}

- (id)_permanentOrTemporaryAssetIDsWithAssetID:(id)a3 temporaryAssetID:(id)a4
{
  id v5;
  id v6;
  NSMutableSet *v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_new(NSMutableSet);
  if (objc_msgSend(v5, "length"))
    -[NSMutableSet addObject:](v7, "addObject:", v5);
  if (objc_msgSend(v6, "length"))
    -[NSMutableSet addObject:](v7, "addObject:", v6);

  return v7;
}

- (void)didHandleInitialQuery
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController migrationQueue](self, "migrationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100195768;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(v3, block);

  -[BKUbiquitousDocumentsController migrateBooksToUbiquityIfNeededWithCompletion:](self, "migrateBooksToUbiquityIfNeededWithCompletion:", 0);
}

- (void)reportUploadErrorForBooks:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BKUbiquitousDocumentsController *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController bookOperationsQueue](self, "bookOperationsQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10019580C;
  v7[3] = &unk_1008E7338;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

- (void)reportUploadCompleteForBooks:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BKUbiquitousDocumentsController *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController bookOperationsQueue](self, "bookOperationsQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100195984;
  v7[3] = &unk_1008E7338;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

- (void)p_updateCachedURLsFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AEPluginRegistry sharedInstance](AEPluginRegistry, "sharedInstance"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pluginForURL:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "helperForURL:withOptions:", v6, 0));
  objc_msgSend(v8, "helperUpdateCachedURLTo:", v5);

}

- (id)p_generateUbiquityNotEnabledError
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("kBKUbiquitousMoveOperationsDomain"), qword_1009CC408, 0);
}

- (id)p_generateNotAllBooksEligibleToMoveToUbiquityError
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("kBKUbiquitousMoveOperationsDomain"), qword_1009CC410, 0);
}

- (void)p_postStatusNotificationForAssets:(id)a3 withState:(int64_t)a4
{
  id v6;
  NSMutableSet *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  NSMutableSet *v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = objc_opt_new(NSMutableSet);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v12), "assetID", (_QWORD)v18));
        if (v13)
        {
          v14 = objc_msgSend(objc_alloc((Class)BKLibraryDownloadStatus), "initWithAssetID:state:progressValue:timeRemaining:bytesDownloaded:fileSize:", v13, a4, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, 0.0);
          -[NSMutableSet addObject:](v7, "addObject:", v14);

        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v10);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v16 = BKLibraryDownloadStatusNotification;
  v22 = BKLibraryDownloadStatusKey;
  v23 = v7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  objc_msgSend(v15, "postNotificationName:object:userInfo:", v16, self, v17);

}

- (int64_t)boq_spaceOccupiedByBooksMigratedSinceLastQuotaCheck
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  int64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController assetIDToFileSizeMapPendingUpload](self, "assetIDToFileSizeMapPendingUpload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v4);
        v7 += (int64_t)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "longLongValue");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController assetIDToFileSizeMapUploadedSinceLastQuotaReceived](self, "assetIDToFileSizeMapUploadedSinceLastQuotaReceived", 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allValues"));

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v7 += (int64_t)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j), "longLongValue");
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  return v7;
}

- (void)boq_addPendingUploadQuotaCompensationForAssets:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v7);
        v9 = objc_alloc((Class)BKLibraryFileSizeManagerCacheItemRequest);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "url"));
        v12 = objc_msgSend(v9, "initWithCacheItemRequestWithAssetID:assetURL:", v10, v11);

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryFileSizeManager sharedInstance](BKLibraryFileSizeManager, "sharedInstance"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "synchronousFileSizeForCacheItemRequest:", v12));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController assetIDToFileSizeMapPendingUpload](self, "assetIDToFileSizeMapPendingUpload"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

}

- (void)boq_addUploadedQuotaCompensationForAssetIDs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController assetIDToFileSizeMapPendingUpload](self, "assetIDToFileSizeMapPendingUpload"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController assetIDToFileSizeMapPendingUpload](self, "assetIDToFileSizeMapPendingUpload"));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v9);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController assetIDToFileSizeMapUploadedSinceLastQuotaReceived](self, "assetIDToFileSizeMapUploadedSinceLastQuotaReceived"));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (void)boq_removeQuotaCompensationForAssets:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController assetIDToFileSizeMapPendingUpload](self, "assetIDToFileSizeMapPendingUpload"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetID"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v11);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController assetIDToFileSizeMapUploadedSinceLastQuotaReceived](self, "assetIDToFileSizeMapUploadedSinceLastQuotaReceived"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetID"));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v13);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (void)boq_removeUploadedQuotaCompensation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKUbiquitousDocumentsController assetIDToFileSizeMapUploadedSinceLastQuotaReceived](self, "assetIDToFileSizeMapUploadedSinceLastQuotaReceived"));
  objc_msgSend(v2, "removeAllObjects");

}

- (id)_sortedAssetsFromEligibleAssets:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  void *v33;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  _BYTE v53[128];
  id v54;

  v5 = a3;
  v6 = a4;
  v41 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("assetID")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjects:forKeys:](NSMutableDictionary, "dictionaryWithObjects:forKeys:", v5, v7));
    v9 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
    objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAssetIDsTaggedLibraryAssets:](BKLibraryManager, "predicateForAssetIDsTaggedLibraryAssets:", v7));
    objc_msgSend(v9, "setPredicate:", v10);

    v11 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("lastOpenDate"), 0);
    v54 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v54, 1));
    objc_msgSend(v9, "setSortDescriptors:", v12);

    v46 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v9, &v46));
    v14 = v46;
    v15 = v14;
    if (v13)
    {
      v35 = v14;
      v36 = v13;
      v37 = v9;
      v38 = v7;
      v39 = v6;
      v40 = v5;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v16 = v13;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v43 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "assetID", v35, v36, v37, v38, v39, v40));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v22));
            v24 = BUProtocolCast(&OBJC_PROTOCOL___BKAsset, v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

            if (v25)
            {
              objc_msgSend(v41, "addObject:", v25);
              v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "assetID"));
              objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v27);
            }
            else
            {
              v28 = BCIMLog(v26);
              v29 = objc_claimAutoreleasedReturnValue(v28);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v48 = "-[BKUbiquitousDocumentsController _sortedAssetsFromEligibleAssets:moc:]";
                v49 = 2080;
                v50 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKUbiquitousDocumentsController.m";
                v51 = 1024;
                v52 = 840;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
              }

              v31 = BCIMLog(v30);
              v27 = objc_claimAutoreleasedReturnValue(v31);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                v32 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "assetID"));
                *(_DWORD *)buf = 138412290;
                v48 = v32;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "@\"Couldn't map BKLibraryAsset with assetID {%@} to BKAsset\", buf, 0xCu);

              }
            }

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
        }
        while (v18);
      }

      v6 = v39;
      v5 = v40;
      v9 = v37;
      v7 = v38;
      v15 = v35;
      v13 = v36;
    }
    if (objc_msgSend(v8, "count", v35, v36, v37, v38, v39, v40))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allValues"));
      objc_msgSend(v41, "addObjectsFromArray:", v33);

    }
  }

  return v41;
}

- (void)boq_handleSpaceAvailableReceivedWithFreeBytes:(int64_t)a3 serverError:(id)a4
{
  char *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  BKUbiquitousDocumentsController *v13;
  int64_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;

  v6 = (char *)a4;
  v7 = -[BKUbiquitousDocumentsController setPendingQuotaFetch:](self, "setPendingQuotaFetch:", 0);
  if (!v6)
  {
    v13 = self;
    v14 = a3;
    goto LABEL_9;
  }
  v8 = BCIMLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v17 = 136315650;
    v18 = "-[BKUbiquitousDocumentsController boq_handleSpaceAvailableReceivedWithFreeBytes:serverError:]";
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKUbiquitousDocumentsController.m";
    v21 = 1024;
    v22 = 861;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v17, 0x1Cu);
  }

  v11 = BCIMLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v17 = 138412290;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "@\"Error retrieving ubiquity quota from server. Error (%@)\", (uint8_t *)&v17, 0xCu);
  }

  if (!-[BKUbiquitousDocumentsController hasEverReceivedUbiquityQuota](self, "hasEverReceivedUbiquityQuota"))
  {
    v13 = self;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_9:
    -[BKUbiquitousDocumentsController setUbiquityAvailableSpace:](v13, "setUbiquityAvailableSpace:", v14);
  }
  -[BKUbiquitousDocumentsController setHasEverReceivedUbiquityQuota:](self, "setHasEverReceivedUbiquityQuota:", 1);
  v15 = BKLibraryBookImportLog(-[BKUbiquitousDocumentsController boq_removeUploadedQuotaCompensation](self, "boq_removeUploadedQuotaCompensation"));
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134217984;
    v18 = (const char *)a3;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "ubiquityAvailableSpace: %lld", (uint8_t *)&v17, 0xCu);
  }

}

- (IMUbiquityStatusMonitor)ubiquityStatusMonitor
{
  return (IMUbiquityStatusMonitor *)objc_loadWeakRetained((id *)&self->_ubiquityStatusMonitor);
}

- (void)setUbiquityStatusMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_ubiquityStatusMonitor, a3);
}

- (BKUbiquitousBooksHosting)ubiquitousBooksPlistHost
{
  return (BKUbiquitousBooksHosting *)objc_loadWeakRetained((id *)&self->_ubiquitousBooksPlistHost);
}

- (void)setUbiquitousBooksPlistHost:(id)a3
{
  objc_storeWeak((id *)&self->_ubiquitousBooksPlistHost, a3);
}

- (BKUbiquityEligibleBooksProviding)ubiquityEligibleBooksProvider
{
  return (BKUbiquityEligibleBooksProviding *)objc_loadWeakRetained((id *)&self->_ubiquityEligibleBooksProvider);
}

- (void)setUbiquityEligibleBooksProvider:(id)a3
{
  objc_storeWeak((id *)&self->_ubiquityEligibleBooksProvider, a3);
}

- (OS_dispatch_queue)migrationQueue
{
  return self->_migrationQueue;
}

- (void)setMigrationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_migrationQueue, a3);
}

- (NSOperationQueue)bookOperationsQueue
{
  return self->_bookOperationsQueue;
}

- (void)setBookOperationsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_bookOperationsQueue, a3);
}

- (NSMutableSet)booksThatEncounteredUploadError
{
  return self->_booksThatEncounteredUploadError;
}

- (void)setBooksThatEncounteredUploadError:(id)a3
{
  objc_storeStrong((id *)&self->_booksThatEncounteredUploadError, a3);
}

- (BOOL)initialMetadataQueryWasHandled
{
  return self->_initialMetadataQueryWasHandled;
}

- (void)setInitialMetadataQueryWasHandled:(BOOL)a3
{
  self->_initialMetadataQueryWasHandled = a3;
}

- (IMUbiquityQuotaFetcher)quotaFetcher
{
  return self->_quotaFetcher;
}

- (void)setQuotaFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_quotaFetcher, a3);
}

- (int64_t)ubiquityAvailableSpace
{
  return self->_ubiquityAvailableSpace;
}

- (void)setUbiquityAvailableSpace:(int64_t)a3
{
  self->_ubiquityAvailableSpace = a3;
}

- (BOOL)hasEverReceivedUbiquityQuota
{
  return self->_hasEverReceivedUbiquityQuota;
}

- (void)setHasEverReceivedUbiquityQuota:(BOOL)a3
{
  self->_hasEverReceivedUbiquityQuota = a3;
}

- (BOOL)pendingQuotaFetch
{
  return self->_pendingQuotaFetch;
}

- (void)setPendingQuotaFetch:(BOOL)a3
{
  self->_pendingQuotaFetch = a3;
}

- (NSMutableArray)pendingQuotaFetchMigrationBlocks
{
  return self->_pendingQuotaFetchMigrationBlocks;
}

- (void)setPendingQuotaFetchMigrationBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingQuotaFetchMigrationBlocks, a3);
}

- (NSMutableDictionary)assetIDToFileSizeMapPendingUpload
{
  return self->_assetIDToFileSizeMapPendingUpload;
}

- (void)setAssetIDToFileSizeMapPendingUpload:(id)a3
{
  objc_storeStrong((id *)&self->_assetIDToFileSizeMapPendingUpload, a3);
}

- (NSMutableDictionary)assetIDToFileSizeMapUploadedSinceLastQuotaReceived
{
  return self->_assetIDToFileSizeMapUploadedSinceLastQuotaReceived;
}

- (void)setAssetIDToFileSizeMapUploadedSinceLastQuotaReceived:(id)a3
{
  objc_storeStrong((id *)&self->_assetIDToFileSizeMapUploadedSinceLastQuotaReceived, a3);
}

- (int64_t)ongoingMigrationAttemptOutstandingMigrateAllAttempts
{
  return self->_ongoingMigrationAttemptOutstandingMigrateAllAttempts;
}

- (void)setOngoingMigrationAttemptOutstandingMigrateAllAttempts:(int64_t)a3
{
  self->_ongoingMigrationAttemptOutstandingMigrateAllAttempts = a3;
}

- (NSMutableSet)ongoingMigrationAttemptAssetIDs
{
  return self->_ongoingMigrationAttemptAssetIDs;
}

- (void)setOngoingMigrationAttemptAssetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_ongoingMigrationAttemptAssetIDs, a3);
}

- (NSMutableArray)ongoingMigrationAttemptObservers
{
  return self->_ongoingMigrationAttemptObservers;
}

- (void)setOngoingMigrationAttemptObservers:(id)a3
{
  objc_storeStrong((id *)&self->_ongoingMigrationAttemptObservers, a3);
}

- (BUCoalescingCallBlock)ongoingMigrationAttemptTimer
{
  return self->_ongoingMigrationAttemptTimer;
}

- (void)setOngoingMigrationAttemptTimer:(id)a3
{
  objc_storeStrong((id *)&self->_ongoingMigrationAttemptTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ongoingMigrationAttemptTimer, 0);
  objc_storeStrong((id *)&self->_ongoingMigrationAttemptObservers, 0);
  objc_storeStrong((id *)&self->_ongoingMigrationAttemptAssetIDs, 0);
  objc_storeStrong((id *)&self->_assetIDToFileSizeMapUploadedSinceLastQuotaReceived, 0);
  objc_storeStrong((id *)&self->_assetIDToFileSizeMapPendingUpload, 0);
  objc_storeStrong((id *)&self->_pendingQuotaFetchMigrationBlocks, 0);
  objc_storeStrong((id *)&self->_quotaFetcher, 0);
  objc_storeStrong((id *)&self->_booksThatEncounteredUploadError, 0);
  objc_storeStrong((id *)&self->_bookOperationsQueue, 0);
  objc_storeStrong((id *)&self->_migrationQueue, 0);
  objc_destroyWeak((id *)&self->_ubiquityEligibleBooksProvider);
  objc_destroyWeak((id *)&self->_ubiquitousBooksPlistHost);
  objc_destroyWeak((id *)&self->_ubiquityStatusMonitor);
}

@end
