@implementation BKLibraryIndexer

+ (void)setup
{
  id v3;

  if (+[CSSearchableIndex isIndexingAvailable](CSSearchableIndex, "isIndexingAvailable"))
    v3 = objc_msgSend(a1, "sharedInstance");
}

+ (void)startIndexing
{
  void *v3;
  unsigned __int8 v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("BKDisableSpotlightIndexing"));

  if ((v4 & 1) == 0)
  {
    if (+[CSSearchableIndex isIndexingAvailable](CSSearchableIndex, "isIndexingAvailable"))
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
      objc_msgSend(v5, "continueIndexing");

    }
  }
}

- (BKLibraryIndexer)init
{
  BKLibraryIndexer *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *workQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *changeProcessingQueue;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *indexSync;
  dispatch_semaphore_t v15;
  OS_dispatch_semaphore *indexingSem;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BCManagedObjectIDMonitor *v22;
  BCManagedObjectIDMonitor *libraryAssetMonitor;
  id v24;
  BUCoalescingCallBlock *v25;
  BUCoalescingCallBlock *coalescingProcessChangedBooks;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)BKLibraryIndexer;
  v2 = -[BKLibraryIndexer init](&v31, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);

    v7 = dispatch_queue_create("BKLibraryIndexer.workQueue", v6);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("BKLibraryIndexer.changeProcessingQueue", v6);
    changeProcessingQueue = v2->_changeProcessingQueue;
    v2->_changeProcessingQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("BKLibraryIndexer.indexSync", v12);
    indexSync = v2->_indexSync;
    v2->_indexSync = (OS_dispatch_queue *)v13;

    v15 = dispatch_semaphore_create(1);
    indexingSem = v2->_indexingSem;
    v2->_indexingSem = (OS_dispatch_semaphore *)v15;

    v17 = objc_alloc((Class)BCManagedObjectIDMonitor);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "persistentStoreCoordinator"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "predicateForIndexing"));
    v22 = (BCManagedObjectIDMonitor *)objc_msgSend(v17, "initWithContext:coordinator:entityName:predicate:mapProperty:propertiesOfInterest:observer:", 0, v19, CFSTR("BKLibraryAsset"), v21, CFSTR("assetID"), qword_1009F4E08, v2);
    libraryAssetMonitor = v2->_libraryAssetMonitor;
    v2->_libraryAssetMonitor = v22;

    objc_initWeak(&location, v2);
    v24 = objc_alloc((Class)BUCoalescingCallBlock);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10009C160;
    v28[3] = &unk_1008E8718;
    objc_copyWeak(&v29, &location);
    v25 = (BUCoalescingCallBlock *)objc_msgSend(v24, "initWithNotifyBlock:blockDescription:", v28, CFSTR("BKLibraryIndexer"));
    coalescingProcessChangedBooks = v2->_coalescingProcessChangedBooks;
    v2->_coalescingProcessChangedBooks = v25;

    -[BUCoalescingCallBlock setCoalescingDelay:](v2->_coalescingProcessChangedBooks, "setCoalescingDelay:", 5.0);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009C21C;
  block[3] = &unk_1008E7458;
  block[4] = a1;
  if (qword_1009F4E18 != -1)
    dispatch_once(&qword_1009F4E18, block);
  return (id)qword_1009F4E10;
}

+ (void)searchableItemAttributeSetForBook:(id)a3 coverTimeout:(double)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _UNKNOWN **v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  BOOL v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  id v71;
  _QWORD *v72;
  double v73;
  _QWORD v74[3];
  char v75;
  void *v76;
  uint64_t v77;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dragInfoFromLibraryAsset:", v7));

  v12 = BCSpotlightIndexLog(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    sub_10069D5D4();

  v14 = objc_alloc((Class)CSSearchableItemAttributeSet);
  v15 = BCAssetUTIForContentType(objc_msgSend(v10, "contentType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = objc_msgSend(v14, "initWithItemContentType:", v16);

  objc_msgSend(v10, "fileSizeInMegaBytes");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v17, "setFileSize:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BCDragRepresentationFactory providerDataTypesForDragInfo:](BCDragRepresentationFactory, "providerDataTypesForDragInfo:", v10));
  objc_msgSend(v17, "setProviderDataTypes:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[BCDragRepresentationFactory providerFileTypesForDragInfo:](BCDragRepresentationFactory, "providerFileTypesForDragInfo:", v10));
  objc_msgSend(v17, "setProviderFileTypes:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "storeURL"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "absoluteString"));
  v23 = objc_msgSend(objc_alloc((Class)CSCustomAttributeKey), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("com_apple_iBooks_storeURL"), 0, 0, 0, 0);
  objc_msgSend(v17, "setValue:forCustomKey:", v22, v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localFileURL"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "absoluteString"));
  v26 = objc_msgSend(objc_alloc((Class)CSCustomAttributeKey), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("com_apple_iBooks_localFileURL"), 0, 0, 0, 0);
  objc_msgSend(v17, "setValue:forCustomKey:", v25, v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    objc_msgSend(v17, "setTitle:", v28);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shortBookTitle"));

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shortBookTitle"));
    objc_msgSend(v17, "setDisplayName:", v30);

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastOpenDate"));

  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastOpenDate"));
    objc_msgSend(v17, "setLastUsedDate:", v32);

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "creationDate"));

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "creationDate"));
    objc_msgSend(v17, "setAddedDate:", v34);

  }
  v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "language"));
  v36 = (void *)v35;
  if (v35)
  {
    v77 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v77, 1));
    objc_msgSend(v17, "setLanguages:", v37);

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayAuthor"));

  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayAuthor"));
    v76 = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v76, 1));
    objc_msgSend(v17, "setContributors:", v40);

  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
  objc_msgSend(v17, "setIdentifier:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
  objc_msgSend(v17, "setRelatedUniqueIdentifier:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "genre"));
  if (v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "genre"));
    objc_msgSend(v17, "setGenre:", v44);

  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "isExplicit"));

  if (v45)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "isExplicit"));
    if (objc_msgSend(v46, "BOOLValue"))
      v47 = &off_10092EC40;
    else
      v47 = &off_10092EC58;
    objc_msgSend(v17, "setContentRating:", v47);

  }
  if (objc_msgSend(v7, "isPartOfSeries"))
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "seriesSortKey"));
    objc_msgSend(v17, "setContainerOrder:", v48);

    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localOnlySeriesItemsParent"));
    if (v49)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localOnlySeriesItemsParent"));
      if ((objc_msgSend(v50, "isValid") & 1) == 0)
        goto LABEL_29;
    }
    else
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "purchasedAndLocalParent"));

      if (!v51)
        goto LABEL_30;
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "purchasedAndLocalParent"));
      if (!objc_msgSend(v50, "isValid"))
        goto LABEL_29;
    }
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "title"));
    objc_msgSend(v17, "setContainerTitle:", v52);

    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "title"));
    objc_msgSend(v17, "setContainerDisplayName:", v53);

    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "assetID"));
    objc_msgSend(v17, "setContainerIdentifier:", v54);

LABEL_29:
  }
LABEL_30:
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeID"));
  v56 = objc_msgSend(v55, "length") == 0;

  if (!v56)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeID"));
    objc_msgSend(v17, "setAdamID:", v57);

  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
  v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
  v60 = (void *)v59;
  if (qword_1009F4E38 != -1)
    dispatch_once(&qword_1009F4E38, &stru_1008E8738);
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x2020000000;
  v75 = 0;
  v61 = BCSpotlightIndexLog(v59);
  v62 = objc_claimAutoreleasedReturnValue(v61);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    sub_10069D5A8();

  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_10009CB98;
  v67[3] = &unk_1008E8800;
  v63 = v17;
  v68 = v63;
  v64 = v58;
  v69 = v64;
  v72 = v74;
  v65 = v60;
  v70 = v65;
  v66 = v8;
  v71 = v66;
  v73 = a4;
  +[BKBookProgressController progressStringForLibraryAsset:completion:](BKBookProgressController, "progressStringForLibraryAsset:completion:", v7, v67);

  _Block_object_dispose(v74, 8);
}

+ (void)establishBackgroundTaskForProgressUpdateOfAsset:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  objc_msgSend(v5, "establishBackgroundTaskForProgressUpdateOfAsset:", v4);

}

- (void)establishBackgroundTaskForProgressUpdateOfAsset:(id)a3
{
  id v4;
  NSObject *indexSync;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  indexSync = self->_indexSync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009D1B8;
  block[3] = &unk_1008E7338;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(indexSync, block);

}

+ (void)processedButNoHighWaterUpdateForAssetsWithIDs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  objc_msgSend(v5, "processedButNoHighWaterUpdateForAssetsWithIDs:", v4);

}

- (void)processedButNoHighWaterUpdateForAssetsWithIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BCBackgroundTaskAssertion sharedAssertion](BCBackgroundTaskAssertion, "sharedAssertion"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "releaseAssertionForIdentifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)_clientStateDictionaryFromData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_opt_class(NSDictionary);
    v16 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v4, 0, &v16));
    v7 = (char *)v16;
    v8 = BUDynamicCast(v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (v9)
      goto LABEL_10;
  }
  else
  {
    v7 = 0;
  }
  v10 = BCIMLog(v3);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[BKLibraryIndexer _clientStateDictionaryFromData:]";
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKLibraryIndexer.m";
    v21 = 1024;
    v22 = 441;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
  }

  v13 = BCIMLog(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "@\"couldn't decode clientData - %@\", buf, 0xCu);
  }

  v9 = 0;
LABEL_10:

  return v9;
}

- (id)_clientStateHash
{
  id v2;
  const char *v3;
  unsigned __int8 *v4;
  CC_LONG v5;
  unsigned __int8 *v6;
  void *v7;
  void *v8;
  CC_SHA256_CTX v10;
  unsigned __int8 data[32];

  memset(&v10, 0, sizeof(v10));
  CC_SHA256_Init(&v10);
  data[0] = 7;
  CC_SHA256_Update(&v10, data, 1u);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIApplication applicationCacheDirectory](UIApplication, "applicationCacheDirectory")));
  v3 = (const char *)objc_msgSend(v2, "UTF8String");
  if (v3)
  {
    v4 = (unsigned __int8 *)v3;
    v5 = strlen(v3) + 1;
    v6 = v4;
  }
  else
  {
    data[0] = 0;
    v6 = data;
    v5 = 1;
  }
  CC_SHA256_Update(&v10, v6, v5);

  CC_SHA256_Final(data, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", data, 32, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "base64EncodedStringWithOptions:", 0));

  return v8;
}

- (id)_iBooksContainerURL
{
  if (qword_1009F4E40 != -1)
    dispatch_once(&qword_1009F4E40, &stru_1008E8820);
  return (id)qword_1009F4E48;
}

- (id)_indexingUserDefaults
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009D778;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  if (qword_1009F4E50 != -1)
    dispatch_once(&qword_1009F4E50, block);
  return (id)qword_1009F4E58;
}

- (id)_nsSetFromUserDefaultsForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v5 = objc_opt_class(NSArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryIndexer _indexingUserDefaults](self, "_indexingUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));

  v8 = BUDynamicCast(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
    v10 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
  else
    v10 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v11 = (void *)v10;

  return v11;
}

- (void)_setNSSetToUserDefaults:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryIndexer _indexingUserDefaults](self, "_indexingUserDefaults"));
  if (objc_msgSend(v9, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
    objc_msgSend(v7, "setObject:forKey:", v8, v6);

  }
  else
  {
    objc_msgSend(v7, "setObject:forKey:", 0, v6);
  }

}

- (id)_mergeNSSetToUserDefaults:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryIndexer _nsSetFromUserDefaultsForKey:](self, "_nsSetFromUserDefaultsForKey:", v7));
  v9 = objc_msgSend(v8, "count");
  v10 = v6;
  if (!v6)
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "setByAddingObjectsFromSet:", v10));

  if (!v6)
  if (objc_msgSend(v11, "count") != v9)
    -[BKLibraryIndexer _setNSSetToUserDefaults:forKey:](self, "_setNSSetToUserDefaults:forKey:", v11, v7);

  return v11;
}

- (id)_subtractNSSetFromUserDefaults:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryIndexer _nsSetFromUserDefaultsForKey:](self, "_nsSetFromUserDefaultsForKey:", v7));
  v9 = objc_msgSend(v8, "mutableCopy");

  v10 = objc_msgSend(v9, "count");
  if (v6)
  {
    objc_msgSend(v9, "minusSet:", v6);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    objc_msgSend(v9, "minusSet:", v11);

  }
  if (objc_msgSend(v9, "count") != v10)
    -[BKLibraryIndexer _setNSSetToUserDefaults:forKey:](self, "_setNSSetToUserDefaults:forKey:", v9, v7);
  v12 = objc_msgSend(v9, "copy");

  return v12;
}

- (NSSet)iq_retryAssetIDs
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexSync);
  return (NSSet *)-[BKLibraryIndexer _nsSetFromUserDefaultsForKey:](self, "_nsSetFromUserDefaultsForKey:", CFSTR("retryAssetIDs"));
}

- (void)iq_setRetryAssetIDs:(id)a3
{
  NSObject *indexSync;
  id v5;

  indexSync = self->_indexSync;
  v5 = a3;
  dispatch_assert_queue_V2(indexSync);
  -[BKLibraryIndexer _setNSSetToUserDefaults:forKey:](self, "_setNSSetToUserDefaults:forKey:", v5, CFSTR("retryAssetIDs"));

}

- (void)iq_addRetryAssetIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexSync);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryIndexer _mergeNSSetToUserDefaults:forKey:](self, "_mergeNSSetToUserDefaults:forKey:", v4, CFSTR("retryAssetIDs")));
  v6 = BCSpotlightIndexLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10069D818(v4, v5, v7);

}

- (void)iq_removeRetryAssetIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexSync);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryIndexer _subtractNSSetFromUserDefaults:forKey:](self, "_subtractNSSetFromUserDefaults:forKey:", v4, CFSTR("retryAssetIDs")));
  v6 = BCSpotlightIndexLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10069D8D8(v4, v5, v7);

}

- (void)wq_beginIndexTask
{
  NSObject *indexingSem;
  dispatch_time_t v4;
  intptr_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  intptr_t v10;
  uint64_t v11;
  NSObject *v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  indexingSem = self->_indexingSem;
  v4 = dispatch_time(0, 300000000000);
  v5 = dispatch_semaphore_wait(indexingSem, v4);
  if (v5)
  {
    v6 = BCSpotlightIndexLog(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_10069D9C4();

    v8 = self->_indexingSem;
    v9 = dispatch_time(0, 300000000000);
    v10 = dispatch_semaphore_wait(v8, v9);
    if (v10)
    {
      v11 = BCSpotlightIndexLog(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        sub_10069D998();

      dispatch_semaphore_wait((dispatch_semaphore_t)self->_indexingSem, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
}

- (void)_endIndexTask
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_indexingSem);
}

- (void)continueIndexing
{
  id v2;
  _QWORD v3[5];
  id v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10009DDD8;
  v3[3] = &unk_1008E88E0;
  v3[4] = self;
  v4 = objc_msgSend(objc_alloc((Class)CSSearchableIndex), "initWithName:", CFSTR("Library"));
  v2 = v4;
  objc_msgSend(v2, "fetchLastClientStateWithCompletionHandler:", v3);

}

- (void)_indexStartingAtLastDateAdded:(id)a3 retryAssetIDs:(id)a4 completion:(id)a5
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
  id v17;
  BKLibraryIndexer *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10009E55C;
  v15[3] = &unk_1008E8600;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "performBackgroundReadOnlyBlock:", v15);

}

- (id)_extractDeletedIdentifiersFromArray:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "mutableCopy");
  v8 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  v14 = CFSTR("assetID");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  objc_msgSend(v8, "setPropertiesToFetch:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("assetID"), v6));
  objc_msgSend(v8, "setPredicate:", v10);

  objc_msgSend(v8, "setResultType:", 2);
  objc_msgSend(v8, "setReturnsDistinctResults:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v8, 0));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("assetID")));
  objc_msgSend(v7, "removeObjectsInArray:", v12);
  objc_msgSend(v6, "removeObjectsInArray:", v7);

  return v7;
}

- (void)mocq_reindexBooksWithAssetIDs:(id)a3 batch:(BOOL)a4 moc:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[8];

  v8 = a4;
  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = BCSpotlightIndexLog(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    sub_10069DAC4(v8, v9, v13);

  v14 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKLibraryAsset"));
  objc_msgSend(v14, "setFetchBatchSize:", 25);
  v24[0] = CFSTR("assetID");
  v24[1] = CFSTR("title");
  v24[2] = CFSTR("author");
  v24[3] = CFSTR("lastOpenDate");
  v24[4] = CFSTR("creationDate");
  v24[5] = CFSTR("genre");
  v24[6] = CFSTR("seriesSortKey");
  v24[7] = CFSTR("seriesID");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 8));
  objc_msgSend(v14, "setPropertiesToFetch:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("assetID"), v16));
  objc_msgSend(v14, "setPredicate:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1));
  v23 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  objc_msgSend(v14, "setSortDescriptors:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "executeFetchRequest:error:", v14, 0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
  -[BKLibraryIndexer mocq_reindexBooks:assetIDList:batch:completion:](self, "mocq_reindexBooks:assetIDList:batch:completion:", v20, v21, v8, v10);

}

- (id)_clientDataFromSearchableItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v16[2];
  _QWORD v17[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryIndexer _clientStateHash](self, "_clientStateHash"));
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributeSet"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedDate"));
    objc_msgSend(v7, "timeIntervalSince1970");
    v9 = v8;

  }
  else
  {
    v9 = 0.0;
  }
  v16[0] = CFSTR("hash");
  v16[1] = CFSTR("date");
  v17[0] = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
  v17[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v11, 0, 0));
  v13 = BCSpotlightIndexLog(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    sub_10069DB78();

  return v12;
}

- (id)_indexCompletionBlockForItems:(id)a3 shouldBatch:(BOOL)a4 isBatchEnd:(BOOL)a5
{
  int v5;
  int v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  Block_layout *v10;
  id v11;
  Block_layout *v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = BCSpotlightIndexLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bu_prettyDescription"));
    *(_DWORD *)buf = 67109634;
    v18 = v6;
    v19 = 1024;
    v20 = v5;
    v21 = 2112;
    v22 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Index completed items. shouldBatch:%{BOOL}d, isBatchEnd:%{BOOL}d. %@", buf, 0x18u);

  }
  if (v6 == v5)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10009EEDC;
    v15[3] = &unk_1008E8948;
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKeyPath:", CFSTR("attributeSet.identifier")));
    v11 = v16;
    v10 = objc_retainBlock(v15);

  }
  else
  {
    v10 = &stru_1008E8920;
  }
  v12 = objc_retainBlock(v10);

  return v12;
}

- (id)_requestStoreURLsForAttributeSets:(id)a3
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
  uint64_t v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  dispatch_semaphore_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  dispatch_time_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *j;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  NSObject *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  NSObject *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v53 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "adamID"));
        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentType"));
          v13 = BCAssetUTIForContentType(1);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          v15 = objc_msgSend(v12, "isEqualToString:", v14);

          v16 = v4;
          if ((v15 & 1) != 0
            || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentType")),
                v18 = BCAssetUTIForContentType(6),
                v19 = (void *)objc_claimAutoreleasedReturnValue(v18),
                v20 = objc_msgSend(v17, "isEqualToString:", v19),
                v19,
                v17,
                v16 = v44,
                v20))
          {
            objc_msgSend(v16, "addObject:", v11);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v7);
  }

  v21 = dispatch_semaphore_create(0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[BCMBridgedCatalogService sharedInstance](BCMBridgedCatalogService, "sharedInstance"));
  v23 = objc_alloc((Class)BFMRequestMetadata);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "BKLibraryIndexer.m"));
  v25 = objc_msgSend(v23, "initWithFileID:line:", v24, 810);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10009F424;
  v49[3] = &unk_1008E8970;
  v26 = v5;
  v50 = v26;
  v27 = v21;
  v51 = v27;
  objc_msgSend(v22, "fetchMixedAssetsWithBookIds:audiobookIds:relationships:views:additionalParameters:batchSize:metadata:completionHandler:", v4, v44, 0, 0, 0, 25, v25, v49);

  v28 = dispatch_time(0, 2000000000);
  v43 = v27;
  dispatch_semaphore_wait(v27, v28);
  v29 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v26, "count"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v30 = v26;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(_QWORD *)v46 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "adamID"));
        v37 = v36;
        if (v36)
          v38 = v36;
        else
          v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "identifier"));
        v39 = v38;

        v40 = objc_msgSend(objc_alloc((Class)CSSearchableItem), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v39, 0, v35);
        objc_msgSend(v29, "addObject:", v40);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    }
    while (v32);
  }

  v41 = objc_msgSend(v29, "copy");
  return v41;
}

- (void)iq_indexSearchableItems:(id)a3 shouldBatch:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  CSSearchableIndex *index;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSDate *v13;
  NSDate *lastBatchDate;
  id v15;

  v4 = a4;
  v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexSync);
  if (v4)
    -[CSSearchableIndex beginIndexBatch](self->_index, "beginIndexBatch");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryIndexer _indexCompletionBlockForItems:shouldBatch:isBatchEnd:](self, "_indexCompletionBlockForItems:shouldBatch:isBatchEnd:", v15, v4, 0));
  -[CSSearchableIndex indexSearchableItems:completionHandler:](self->_index, "indexSearchableItems:completionHandler:", v15, v6);
  if (v4)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[BKLibraryIndexer _indexCompletionBlockForItems:shouldBatch:isBatchEnd:](self, "_indexCompletionBlockForItems:shouldBatch:isBatchEnd:", v15, 1, 1));

    index = self->_index;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryIndexer _clientDataFromSearchableItem:](self, "_clientDataFromSearchableItem:", v9));
    -[CSSearchableIndex endIndexBatchWithClientState:completionHandler:](index, "endIndexBatchWithClientState:completionHandler:", v10, v7);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastObject"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "attributeSet"));
    v13 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addedDate"));
    lastBatchDate = self->_lastBatchDate;
    self->_lastBatchDate = v13;

    v6 = (void *)v7;
  }

}

- (void)mocq_reindexBooks:(id)a3 assetIDList:(id)a4 batch:(BOOL)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *indexSync;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSDate *lastBatchDate;
  void *v22;
  dispatch_queue_attr_t v23;
  NSObject *v24;
  dispatch_queue_attr_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  NSObject *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  BOOL v59;
  NSObject *queue;
  _QWORD block[5];
  id v63;
  _QWORD v64[5];
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  BOOL v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  BKLibraryIndexer *v75;
  id v76;
  id v77;
  BOOL v78;
  _QWORD v79[4];
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  id v87;
  __int16 v88;
  void *v89;
  uint8_t v90[4];
  uint64_t v91;
  _BYTE v92[128];

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = BCSpotlightIndexLog(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    sub_10069DCD4(v10, v13);

  if (objc_msgSend(v9, "count"))
  {
    if (a5)
    {
      v59 = 1;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
      if (objc_msgSend(v20, "isValid"))
      {
        lastBatchDate = self->_lastBatchDate;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "creationDate"));
        v59 = -[NSDate compare:](lastBatchDate, "compare:", v22) == NSOrderedAscending;

      }
      else
      {
        v59 = 0;
      }

    }
    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = dispatch_queue_attr_make_with_qos_class(v24, QOS_CLASS_UTILITY, 0);
    v19 = objc_claimAutoreleasedReturnValue(v25);

    queue = dispatch_queue_create("com.apple.iBooks.libraryIndexer.attributeSet", v19);
    v58 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 25);
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", 25));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v10, "count")));
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v26 = v9;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
    if (v27)
    {
      v28 = v27;
      v51 = v19;
      v52 = v11;
      v53 = v10;
      v54 = v9;
      v29 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(_QWORD *)v83 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i);
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "assetID", v51, v52, v53, v54));
          if (objc_msgSend(v32, "length"))
          {
            v33 = objc_msgSend(v31, "isValid");
            if ((_DWORD)v33)
            {
              v34 = BCSpotlightIndexLog(v33);
              v35 = objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "title"));
                *(_DWORD *)buf = 138412546;
                v87 = v32;
                v88 = 2112;
                v89 = v46;
                _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "indexing %@ - %@", buf, 0x16u);

              }
              v36 = objc_alloc_init((Class)AMSMutablePromise);
              v79[0] = _NSConcreteStackBlock;
              v79[1] = 3221225472;
              v79[2] = sub_10009FDA8;
              v79[3] = &unk_1008E8998;
              v37 = v32;
              v80 = v37;
              v38 = v36;
              v81 = v38;
              +[BKLibraryIndexer searchableItemAttributeSetForBook:coverTimeout:completion:](BKLibraryIndexer, "searchableItemAttributeSetForBook:coverTimeout:completion:", v31, v79, 10.0);
              v71[0] = _NSConcreteStackBlock;
              v71[1] = 3221225472;
              v71[2] = sub_10009FE14;
              v71[3] = &unk_1008E89E8;
              v72 = v38;
              v39 = v37;
              v73 = v39;
              v74 = v58;
              v75 = self;
              v76 = v56;
              v78 = v59;
              v77 = v57;
              v40 = v38;
              dispatch_async(queue, v71);
              v42 = BCSpotlightIndexLog(v41);
              v43 = objc_claimAutoreleasedReturnValue(v42);
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v87 = v39;
                _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "To be indexed: %@", buf, 0xCu);
              }

            }
            else
            {
              v45 = BCSpotlightIndexLog(objc_msgSend(v55, "addObject:", v32));
              v40 = objc_claimAutoreleasedReturnValue(v45);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v87 = v32;
                _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "Indexes to be deleted: %@", buf, 0xCu);
              }
            }
          }
          else
          {
            v44 = BCSpotlightIndexLog(0);
            v40 = objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              sub_10069DC60(v90, v31, &v91, v40);
          }

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
      }
      while (v28);
      v10 = v53;
      v9 = v54;
      v19 = v51;
      v11 = v52;
    }

    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_1000A0164;
    v64[3] = &unk_1008E8A38;
    v64[4] = self;
    v65 = v58;
    v70 = v59;
    v66 = v56;
    v67 = v57;
    v68 = v55;
    v69 = v11;
    v47 = v55;
    v48 = v57;
    v49 = v56;
    v50 = v58;
    dispatch_async(queue, v64);

  }
  else
  {
    v14 = objc_msgSend(v10, "count");
    if (v14)
    {
      v15 = BCSpotlightIndexLog(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        sub_10069DBDC(v10, v16);

      indexSync = self->_indexSync;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000A0368;
      block[3] = &unk_1008E7338;
      block[4] = self;
      v63 = v10;
      dispatch_sync(indexSync, block);

    }
    v18 = objc_retainBlock(v11);
    v19 = v18;
    if (v18)
      ((void (*))v18[2].isa)(v18);
  }

}

- (NSSet)cpq_pendingChangedAssetIDs
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeProcessingQueue);
  return (NSSet *)-[BKLibraryIndexer _nsSetFromUserDefaultsForKey:](self, "_nsSetFromUserDefaultsForKey:", CFSTR("pendingChangedAssetIDs"));
}

- (void)cpq_setPendingChangedAssetIDs:(id)a3
{
  NSObject *changeProcessingQueue;
  id v5;

  changeProcessingQueue = self->_changeProcessingQueue;
  v5 = a3;
  dispatch_assert_queue_V2(changeProcessingQueue);
  -[BKLibraryIndexer _setNSSetToUserDefaults:forKey:](self, "_setNSSetToUserDefaults:forKey:", v5, CFSTR("pendingChangedAssetIDs"));

}

- (void)cpq_addPendingChangedAssetIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeProcessingQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryIndexer _mergeNSSetToUserDefaults:forKey:](self, "_mergeNSSetToUserDefaults:forKey:", v4, CFSTR("pendingChangedAssetIDs")));
  v6 = BCSpotlightIndexLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10069DF88();

}

- (void)cpq_removePendingChangedAssetIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeProcessingQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryIndexer _subtractNSSetFromUserDefaults:forKey:](self, "_subtractNSSetFromUserDefaults:forKey:", v4, CFSTR("pendingChangedAssetIDs")));
  v6 = BCSpotlightIndexLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10069DFE8();

}

- (NSSet)cpq_pendingDeletedAssetIDs
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeProcessingQueue);
  return (NSSet *)-[BKLibraryIndexer _nsSetFromUserDefaultsForKey:](self, "_nsSetFromUserDefaultsForKey:", CFSTR("pendingDeletedAssetIDs"));
}

- (void)cpq_setPendingDeletedAssetIDs:(id)a3
{
  NSObject *changeProcessingQueue;
  id v5;

  changeProcessingQueue = self->_changeProcessingQueue;
  v5 = a3;
  dispatch_assert_queue_V2(changeProcessingQueue);
  -[BKLibraryIndexer _setNSSetToUserDefaults:forKey:](self, "_setNSSetToUserDefaults:forKey:", v5, CFSTR("pendingDeletedAssetIDs"));

}

- (void)cpq_addPendingDeletedAssetIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeProcessingQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryIndexer _mergeNSSetToUserDefaults:forKey:](self, "_mergeNSSetToUserDefaults:forKey:", v4, CFSTR("pendingDeletedAssetIDs")));
  v6 = BCSpotlightIndexLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10069E048();

}

- (void)cpq_removePendingDeletedAssetIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeProcessingQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryIndexer _subtractNSSetFromUserDefaults:forKey:](self, "_subtractNSSetFromUserDefaults:forKey:", v4, CFSTR("pendingDeletedAssetIDs")));
  v6 = BCSpotlightIndexLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10069E0A8();

}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  NSObject *changeProcessingQueue;
  _QWORD block[5];

  changeProcessingQueue = self->_changeProcessingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A0738;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(changeProcessingQueue, block);
}

- (void)managedObjectBackgroundMonitor:(id)a3 willSaveNotify:(id)a4
{
  id v5;
  NSObject *changeProcessingQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  BKLibraryIndexer *v10;

  v5 = a4;
  changeProcessingQueue = self->_changeProcessingQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A085C;
  v8[3] = &unk_1008E7338;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(changeProcessingQueue, v8);

}

- (void)_processChangedBooksWithCompletion:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A0AEC;
  v7[3] = &unk_1008E7680;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *workQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v5 = a4;
  v6 = BCSpotlightIndexLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Requested to reindex all searchable items.", buf, 2u);
  }

  workQueue = self->_workQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A10A0;
  v10[3] = &unk_1008E7680;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  dispatch_async(workQueue, v10);

}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *workQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;

  v7 = a4;
  v8 = a5;
  v9 = BCSpotlightIndexLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bu_prettyDescription"));
    *(_DWORD *)buf = 138412290;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Requested to reindex some searchable items: %@", buf, 0xCu);

  }
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A138C;
  block[3] = &unk_1008E8B48;
  v16 = v7;
  v17 = v8;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  dispatch_async(workQueue, block);

}

- (BUCoalescingCallBlock)coalescingProcessChangedBooks
{
  return self->_coalescingProcessChangedBooks;
}

- (void)setCoalescingProcessChangedBooks:(id)a3
{
  objc_storeStrong((id *)&self->_coalescingProcessChangedBooks, a3);
}

- (NSString)assetIDNeedingProcessAssertion
{
  return self->_assetIDNeedingProcessAssertion;
}

- (void)setAssetIDNeedingProcessAssertion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIDNeedingProcessAssertion, 0);
  objc_storeStrong((id *)&self->_coalescingProcessChangedBooks, 0);
  objc_storeStrong((id *)&self->_libraryAssetMonitor, 0);
  objc_storeStrong((id *)&self->_indexingSem, 0);
  objc_storeStrong((id *)&self->_indexSync, 0);
  objc_storeStrong((id *)&self->_changeProcessingQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_lastBatchDate, 0);
  objc_storeStrong((id *)&self->_index, 0);
}

@end
