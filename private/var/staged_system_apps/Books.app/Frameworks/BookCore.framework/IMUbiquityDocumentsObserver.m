@implementation IMUbiquityDocumentsObserver

- (IMUbiquityDocumentsObserver)init
{

  return 0;
}

- (IMUbiquityDocumentsObserver)initWithDelegate:(id)a3 ubquityStatusMonitor:(id)a4 directoriesSubpath:(id)a5
{
  id v8;
  id v9;
  id v10;
  IMUbiquityDocumentsObserver *v11;
  IMUbiquityDocumentsObserver *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  NSObject *v15;
  _QWORD v17[4];
  IMUbiquityDocumentsObserver *v18;
  id v19;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)IMUbiquityDocumentsObserver;
  v11 = -[IMUbiquityDocumentsObserver init](&v20, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeWeak((id *)&v12->_ubiquityStatusMonitor, v9);
    objc_storeStrong((id *)&v12->_directoriesSubpath, a5);
    v13 = dispatch_queue_create("com.apple.iBooks.IMUbiquityDocumentsObserver", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    objc_msgSend(v9, "addObserver:", v12);
    v15 = v12->_queue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_139B1C;
    v17[3] = &unk_28B808;
    v18 = v12;
    v19 = v9;
    dispatch_barrier_async(v15, v17);

  }
  return v12;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;

  if (self->_query)
  {
    v3 = BKLibraryDataSourceUbiquityLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_1B8520();

  }
  v5.receiver = self;
  v5.super_class = (Class)IMUbiquityDocumentsObserver;
  -[IMUbiquityDocumentsObserver dealloc](&v5, "dealloc");
}

- (void)ubiquityStatusChangedToAvailableWithNewIdentity:(id)a3 oldIdentity:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_139DEC;
  v8[3] = &unk_28B808;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_barrier_async(v6, v8);

}

- (void)restartQuery
{
  id v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  v3 = BKLibraryDataSourceUbiquityLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Starting new query", buf, 2u);
  }

  -[IMUbiquityDocumentsObserver tearDownQuery](self, "tearDownQuery");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_139F7C;
  v5[3] = &unk_28D600;
  v5[4] = self;
  -[IMUbiquityDocumentsObserver documentsURL:](self, "documentsURL:", v5);
}

- (void)tearDownQuery
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_13A1B0;
  block[3] = &unk_28B960;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BCICloudIdentityToken)identity
{
  BCICloudIdentityToken *identity;
  id WeakRetained;
  BCICloudIdentityToken *v5;
  BCICloudIdentityToken *v6;

  identity = self->_identity;
  if (!identity)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_ubiquityStatusMonitor);
    v5 = (BCICloudIdentityToken *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "ubiquityIdentityToken"));
    v6 = self->_identity;
    self->_identity = v5;

    identity = self->_identity;
  }
  return identity;
}

- (void)documentsURL:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver queue](self, "queue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_13A29C;
    v6[3] = &unk_28C388;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (void)mq_setupQuery:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v4 = a3;
  v5 = BKLibraryDataSourceUbiquityLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Setting up query", v12, 2u);
  }

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v7 = BKLibraryDataSourceUbiquityLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1B85D4();

  }
  -[IMUbiquityDocumentsObserver setQuery:](self, "setQuery:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "mq_queryDidStart:", NSMetadataQueryDidStartGatheringNotification, v4);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "mq_queryDidFinish:", NSMetadataQueryDidFinishGatheringNotification, v4);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "mq_queryDidUpdate:", NSMetadataQueryDidUpdateNotification, v4);

  objc_msgSend(v4, "startQuery");
}

- (void)mq_tearDownQuery
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v3 = BKLibraryDataSourceUbiquityLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1B85D4();

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver query](self, "query"));
  if (v5)
  {
    v6 = BKLibraryDataSourceUbiquityLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_1B8600();

    -[IMUbiquityDocumentsObserver setQuery:](self, "setQuery:", 0);
    objc_msgSend(v5, "stopQuery");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "removeObserver:name:object:", self, NSMetadataQueryDidStartGatheringNotification, v5);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "removeObserver:name:object:", self, NSMetadataQueryDidFinishGatheringNotification, v5);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "removeObserver:name:object:", self, NSMetadataQueryDidUpdateNotification, v5);

  }
}

- (void)mq_queryDidStart:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = BKLibraryDataSourceUbiquityLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Query did start", v5, 2u);
  }

}

- (void)mq_queryDidFinish:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  IMUbiquityDocumentsObserver *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;

  v4 = BKLibraryDataSourceUbiquityLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Query did finish", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver query](self, "query"));
  objc_msgSend(v6, "disableUpdates");

  v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver query](self, "query"));
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_13A7A8;
  v18 = &unk_292178;
  v9 = v7;
  v19 = v9;
  v20 = self;
  objc_msgSend(v8, "enumerateResultsUsingBlock:", &v15);

  v10 = BKLibraryDataSourceUbiquityLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v9, "count", v15, v16, v17, v18);
    *(_DWORD *)buf = 134218242;
    v22 = v12;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Found %lu downloaded items:%@", buf, 0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver delegate](self, "delegate"));
  objc_msgSend(v13, "ubiquityDocumentsObserver:didLoadWithItems:", self, v9);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver query](self, "query"));
  objc_msgSend(v14, "enableUpdates");

}

- (void)mq_queryDidUpdate:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;

  v4 = a3;
  v5 = BKLibraryDataSourceUbiquityLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "mq_queryDidUpdate %@", (uint8_t *)&v20, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSMetadataQueryUpdateAddedItemsKey));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver _itemsForMetadataItems:](self, "_itemsForMetadataItems:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSMetadataQueryUpdateChangedItemsKey));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver _itemsForMetadataItems:](self, "_itemsForMetadataItems:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", NSMetadataQueryUpdateRemovedItemsKey));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver _itemsForMetadataItems:](self, "_itemsForMetadataItems:", v12));

  v14 = BKLibraryDataSourceUbiquityLog();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = objc_msgSend(v9, "count");
    v17 = objc_msgSend(v11, "count");
    v18 = objc_msgSend(v13, "count");
    v20 = 134219266;
    v21 = v16;
    v22 = 2112;
    v23 = v9;
    v24 = 2048;
    v25 = v17;
    v26 = 2112;
    v27 = v11;
    v28 = 2048;
    v29 = v18;
    v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "mq_queryDidUpdate added %lu:(%@) changed %lu:(%@) removed %lu:(%@)", (uint8_t *)&v20, 0x3Eu);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver delegate](self, "delegate"));
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v19, "ubiquityDocumentsObserver:itemsDidBecomeAvailable:", self, v9);
  if (objc_msgSend(v13, "count"))
    objc_msgSend(v19, "ubiquityDocumentsObserver:itemsDidBecomeUnavailable:", self, v13);
  if (objc_msgSend(v11, "count"))
    objc_msgSend(v19, "ubiquityDocumentsObserver:itemsDidChange:", self, v11);

}

- (id)_identityData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver identity](self, "identity"));
  if (v2)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, 0));
  else
    v3 = 0;

  return v3;
}

- (id)_documentsURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver containerURL](self, "containerURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("Documents")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver directoriesSubpath](self, "directoriesSubpath"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver directoriesSubpath](self, "directoriesSubpath"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", v6));

    v4 = (void *)v7;
  }
  return v4;
}

- (id)_dataURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver containerURL](self, "containerURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("Data")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver directoriesSubpath](self, "directoriesSubpath"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver directoriesSubpath](self, "directoriesSubpath"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", v6));

    v4 = (void *)v7;
  }
  return v4;
}

- (id)_noSyncURL
{
  NSURL *noSyncURL;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  NSURL *v12;
  NSURL *v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  NSURL *v17;
  NSURL *v18;
  NSURL *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v24;

  noSyncURL = self->_noSyncURL;
  if (!noSyncURL)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver containerURL](self, "containerURL"));
    v5 = v4;
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("metadata.nosync")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
      v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

      if ((v9 & 1) != 0)
      {
        v10 = BKLibraryDataSourceUbiquityLog();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          sub_1B862C();

        v12 = v6;
        v13 = self->_noSyncURL;
        self->_noSyncURL = v12;
      }
      else
      {
        v24 = 0;
        v14 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 0, 0, &v24);
        v13 = (NSURL *)v24;
        v15 = BKLibraryDataSourceUbiquityLog();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        v17 = (NSURL *)v16;
        if (v14)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            sub_1B8658();

          v18 = v6;
          v17 = self->_noSyncURL;
          self->_noSyncURL = v18;
        }
        else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          sub_1B8684();
        }

      }
    }

    noSyncURL = self->_noSyncURL;
  }
  v19 = noSyncURL;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver directoriesSubpath](self, "directoriesSubpath"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver directoriesSubpath](self, "directoriesSubpath"));
    v22 = objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](v19, "URLByAppendingPathComponent:", v21));

    v19 = (NSURL *)v22;
  }
  return v19;
}

- (void)q_createSubpathDirectories
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[3];
  char v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver _documentsURL](self, "_documentsURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver _dataURL](self, "_dataURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver _noSyncURL](self, "_noSyncURL"));
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_13AF0C;
  v8[3] = &unk_2921A0;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = v6;
  v10 = v11;
  v7 = objc_retainBlock(v8);
  ((void (*)(_QWORD *, void *))v7[2])(v7, v3);
  ((void (*)(_QWORD *, void *))v7[2])(v7, v4);
  ((void (*)(_QWORD *, void *))v7[2])(v7, v5);

  _Block_object_dispose(v11, 8);
}

- (id)_itemsForMetadataItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  IMUbiquityDocumentsObserver *v13;

  v4 = a3;
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_13B090;
  v11 = &unk_292178;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = self;
  v5 = v12;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v8);

  v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);
  return v6;
}

- (id)_replacementObjectForResultObject:(id)a3
{
  id v3;
  IMUbiquityDocumentItem *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;

  v3 = a3;
  v4 = objc_opt_new(IMUbiquityDocumentItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForAttribute:", NSMetadataItemURLKey));
  -[IMUbiquityDocumentItem setUrl:](v4, "setUrl:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForAttribute:", NSMetadataUbiquitousItemDownloadingStatusKey));
  if ((objc_msgSend(v6, "isEqualToString:", NSMetadataUbiquitousItemDownloadingStatusCurrent) & 1) != 0)
    v7 = 1;
  else
    v7 = (uint64_t)objc_msgSend(v6, "isEqualToString:", NSMetadataUbiquitousItemDownloadingStatusDownloaded);
  v8 = objc_msgSend(v6, "isEqualToString:", NSMetadataUbiquitousItemDownloadingStatusNotDownloaded);
  -[IMUbiquityDocumentItem setIsLocal:](v4, "setIsLocal:", v7);
  -[IMUbiquityDocumentItem setIsNotLocal:](v4, "setIsNotLocal:", v8);
  if ((v7 & 1) != 0 || !(_DWORD)v8)
  {
    -[IMUbiquityDocumentItem setIsDownloading:](v4, "setIsDownloading:", 0);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForAttribute:", NSMetadataUbiquitousItemIsDownloadingKey));
    v10 = objc_msgSend(v9, "BOOLValue");

    -[IMUbiquityDocumentItem setIsDownloading:](v4, "setIsDownloading:", v10);
    if ((_DWORD)v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForAttribute:", NSMetadataUbiquitousItemPercentDownloadedKey));
      -[IMUbiquityDocumentItem setDownloadingPercent:](v4, "setDownloadingPercent:", v11);

    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForAttribute:", NSMetadataUbiquitousItemUploadingErrorKey));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForAttribute:", NSMetadataUbiquitousItemIsUploadingKey));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForAttribute:", NSMetadataUbiquitousItemIsUploadedKey));
  if (!objc_msgSend(v13, "BOOLValue") || v12)
  {
    if (objc_msgSend(v14, "BOOLValue"))
      -[IMUbiquityDocumentItem setIsUploaded:](v4, "setIsUploaded:", 1);
    else
      -[IMUbiquityDocumentItem setUploadingError:](v4, "setUploadingError:", v12);
  }
  else
  {
    -[IMUbiquityDocumentItem setIsUploading:](v4, "setIsUploading:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForAttribute:", NSMetadataUbiquitousItemPercentUploadedKey));
    -[IMUbiquityDocumentItem setUploadingPercent:](v4, "setUploadingPercent:", v15);

  }
  v16 = objc_opt_class(NSDate);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForAttribute:", CFSTR("kMDItemFSContentChangeDate")));
  v18 = BUDynamicCast(v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[IMUbiquityDocumentItem setContentChangedDate:](v4, "setContentChangedDate:", v19);

  v20 = objc_opt_class(NSDate);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForAttribute:", CFSTR("kMDItemFSCreationDate")));
  v22 = BUDynamicCast(v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  -[IMUbiquityDocumentItem setContentCreationDate:](v4, "setContentCreationDate:", v23);

  v24 = objc_opt_class(NSNumber);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForAttribute:", CFSTR("kMDItemFSSize")));
  v26 = BUDynamicCast(v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  -[IMUbiquityDocumentItem setContentFileSize:](v4, "setContentFileSize:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForAttribute:", NSMetadataUbiquitousItemHasUnresolvedConflictsKey));
  -[IMUbiquityDocumentItem setUnresolvedConflict:](v4, "setUnresolvedConflict:", v28);

  return v4;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver identity](self, "identity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver containerURL](self, "containerURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver noSyncURL](self, "noSyncURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMUbiquityDocumentsObserver ubiquityStatusMonitor](self, "ubiquityStatusMonitor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%p) identity='%@' containerURL='%@' noSyncURL='%@'>\n\tubiquityStatusMonitor = %@"), v5, self, v6, v7, v8, v9));

  return (NSString *)v10;
}

- (IMUbiquityDocumentsObserverDelegate)delegate
{
  return (IMUbiquityDocumentsObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)directoriesSubpath
{
  return self->_directoriesSubpath;
}

- (void)setDirectoriesSubpath:(id)a3
{
  objc_storeStrong((id *)&self->_directoriesSubpath, a3);
}

- (IMUbiquityStatusMonitor)ubiquityStatusMonitor
{
  return (IMUbiquityStatusMonitor *)objc_loadWeakRetained((id *)&self->_ubiquityStatusMonitor);
}

- (void)setUbiquityStatusMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_ubiquityStatusMonitor, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMetadataQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (void)setContainerURL:(id)a3
{
  objc_storeStrong((id *)&self->_containerURL, a3);
}

- (NSURL)noSyncURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNoSyncURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noSyncURL, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_ubiquityStatusMonitor);
  objc_storeStrong((id *)&self->_directoriesSubpath, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
