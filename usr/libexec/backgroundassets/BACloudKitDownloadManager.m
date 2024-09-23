@implementation BACloudKitDownloadManager

- (BACloudKitDownloadManager)initWithDownload:(id)a3 withDelegate:(id)a4
{
  id v6;
  id v7;
  BACloudKitDownloadManager *v8;
  BACloudKitDownloadManager *v9;
  void *v10;
  dispatch_queue_t v11;
  id v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BACloudKitDownloadManager;
  v8 = -[BACloudKitDownloadManager init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    -[BACloudKitDownloadManager setDelegate:](v8, "setDelegate:", v7);
    -[BACloudKitDownloadManager setDownload:](v9, "setDownload:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[BACloudKitDownloadManager setRecordErrors:](v9, "setRecordErrors:", v10);

    v11 = dispatch_queue_create("com.apple.BACloudKitDownloadManager.ResponseQueue", 0);
    -[BACloudKitDownloadManager setResponseQueue:](v9, "setResponseQueue:", v11);

    v12 = objc_alloc_init((Class)NSLock);
    -[BACloudKitDownloadManager setStateLock:](v9, "setStateLock:", v12);

  }
  return v9;
}

- (BOOL)startDownloadWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *, void *);
  void *v27;
  BACloudKitDownloadManager *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  BACloudKitDownloadManager *v32;
  id v33;
  id location;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager stateLock](self, "stateLock", a3));
  objc_msgSend(v4, "lock");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager recordErrors](self, "recordErrors"));
  objc_msgSend(v5, "removeAllObjects");

  -[BACloudKitDownloadManager setRecordFound:](self, "setRecordFound:", 0);
  -[BACloudKitDownloadManager setAssetFound:](self, "setAssetFound:", 0);
  -[BACloudKitDownloadManager setAssetURL:](self, "setAssetURL:", 0);
  -[BACloudKitDownloadManager setAssetSize:](self, "setAssetSize:", 0);
  v6 = objc_alloc((Class)CKContainer);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager download](self, "download"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "containerID"));
  v9 = objc_msgSend(v6, "initWithContainerID:", v8);

  v10 = objc_alloc_init((Class)CKOperationConfiguration);
  objc_msgSend(v10, "setContainer:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager download](self, "download"));
  os_unfair_lock_lock((os_unfair_lock_t)objc_msgSend(v11, "downloadLock"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager download](self, "download"));
  v13 = objc_msgSend(v12, "isForegroundDownload");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager download](self, "download"));
  os_unfair_lock_unlock((os_unfair_lock_t)objc_msgSend(v14, "downloadLock"));

  if (v13)
  {
    objc_msgSend(v10, "setTimeoutIntervalForRequest:", 60.0);
    objc_msgSend(v10, "setAllowsCellularAccess:", 1);
    objc_msgSend(v10, "setAllowsExpensiveNetworkAccess:", 1);
    v15 = 0;
    v16 = 17;
  }
  else
  {
    objc_msgSend(v10, "setAllowsCellularAccess:", 0);
    objc_msgSend(v10, "setAllowsExpensiveNetworkAccess:", 0);
    objc_msgSend(v10, "setAutomaticallyRetryNetworkFailures:", 1);
    v16 = 9;
    v15 = 2;
  }
  objc_msgSend(v10, "setDiscretionaryNetworkBehavior:", v15);
  objc_msgSend(v10, "setQualityOfService:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager download](self, "download"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "masqueradeIdentifier"));
  objc_msgSend(v10, "setApplicationBundleIdentifierOverrideForContainerAccess:", v18);

  -[BACloudKitDownloadManager setOperationConfiguration:](self, "setOperationConfiguration:", v10);
  v19 = -[BACloudKitDownloadManager _newOperationQuery](self, "_newOperationQuery");
  objc_msgSend(v19, "setShouldFetchAssetContent:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "database"));
  objc_initWeak(&location, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000286B4;
  v30[3] = &unk_1000596F8;
  objc_copyWeak(&v33, &location);
  v21 = v20;
  v31 = v21;
  v32 = self;
  objc_msgSend(v19, "setQueryCompletionBlock:", v30);
  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_1000289DC;
  v27 = &unk_100059720;
  v28 = self;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v19, "setRecordMatchedBlock:", &v24);
  -[BACloudKitDownloadManager setCurrentOperation:](self, "setCurrentOperation:", v19, v24, v25, v26, v27, v28);
  objc_msgSend(v21, "addOperation:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager stateLock](self, "stateLock"));
  objc_msgSend(v22, "unlock");

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  return 1;
}

- (void)pauseDownload
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager stateLock](self, "stateLock"));
  objc_msgSend(v3, "lock");

  -[BACloudKitDownloadManager cancelDownload](self, "cancelDownload");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager stateLock](self, "stateLock"));
  objc_msgSend(v4, "unlock");

  v5 = objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager responseQueue](self, "responseQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028BC0;
  block[3] = &unk_100058998;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)cancelDownload
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager currentOperation](self, "currentOperation"));
  objc_msgSend(v2, "cancel");

}

- (void)_downloadFailedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager responseQueue](self, "responseQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100028CB4;
  v7[3] = &unk_100058A10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_downloadSucceededWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager responseQueue](self, "responseQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028DE8;
  block[3] = &unk_100058A10;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_and_wait(v5, block);

}

- (BOOL)_consumeAvailableDownloadSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  char v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager stateLock](self, "stateLock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager download](self, "download"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationInfo"));

  if (!v5)
    goto LABEL_5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager download](self, "download"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "applicationInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager download](self, "download"));
  v9 = objc_msgSend(v7, "remainingDownloadAllowanceWithNecessity:", objc_msgSend(v8, "necessity"));

  if (!v9)
    goto LABEL_4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager download](self, "download"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationInfo"));
  v12 = -[BACloudKitDownloadManager assetSize](self, "assetSize");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager download](self, "download"));
  LOBYTE(v12) = objc_msgSend(v11, "consumeAllowanceShouldStopWithAdditionalBytes:downloadNecessity:isManifest:", v12, objc_msgSend(v13, "necessity"), 0);

  if ((v12 & 1) != 0)
LABEL_4:
    v14 = 0;
  else
LABEL_5:
    v14 = 1;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager stateLock](self, "stateLock"));
  objc_msgSend(v15, "unlock");

  return v14 & 1;
}

- (void)_downloadActualAsset
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *, void *);
  void *v12;
  BACloudKitDownloadManager *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  BACloudKitDownloadManager *v17;
  id v18;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager stateLock](self, "stateLock"));
  objc_msgSend(v3, "lock");

  -[BACloudKitDownloadManager setRecordFound:](self, "setRecordFound:", 0);
  -[BACloudKitDownloadManager setAssetFound:](self, "setAssetFound:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager recordErrors](self, "recordErrors"));
  objc_msgSend(v4, "removeAllObjects");

  v5 = -[BACloudKitDownloadManager _newOperationQuery](self, "_newOperationQuery");
  objc_msgSend(v5, "setShouldFetchAssetContent:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "database"));
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000291DC;
  v15[3] = &unk_1000596F8;
  objc_copyWeak(&v18, &location);
  v7 = v6;
  v16 = v7;
  v17 = self;
  objc_msgSend(v5, "setQueryCompletionBlock:", v15);
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_100029544;
  v12 = &unk_100059720;
  v13 = self;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v5, "setRecordMatchedBlock:", &v9);
  -[BACloudKitDownloadManager setCurrentOperation:](self, "setCurrentOperation:", v5, v9, v10, v11, v12, v13);
  objc_msgSend(v7, "addOperation:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager stateLock](self, "stateLock"));
  objc_msgSend(v8, "unlock");

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (id)_newOperationQuery
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;

  v3 = objc_alloc((Class)CKQueryOperation);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager download](self, "download"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "query"));
  v6 = objc_msgSend(v3, "initWithQuery:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager download](self, "download"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
  objc_msgSend(v6, "setZoneID:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager operationConfiguration](self, "operationConfiguration"));
  objc_msgSend(v6, "setConfiguration:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager download](self, "download"));
  v11 = objc_msgSend(v10, "databaseScope");

  if (v11 == (id)2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager operationConfiguration](self, "operationConfiguration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "container"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "privateCloudDatabase"));
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager download](self, "download"));
    v16 = objc_msgSend(v15, "databaseScope");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager operationConfiguration](self, "operationConfiguration"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "container"));
    v13 = v17;
    if (v16 == (id)3)
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sharedCloudDatabase"));
    else
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "publicCloudDatabase"));
  }
  v18 = (void *)v14;

  objc_msgSend(v6, "setDatabase:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BACloudKitDownloadManager download](self, "download"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "assetKey"));
  v23 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  objc_msgSend(v6, "setDesiredKeys:", v21);

  objc_msgSend(v6, "setResultsLimit:", 1);
  return v6;
}

- (BACloudKitDownloadManagerDelegate)delegate
{
  return (BACloudKitDownloadManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BACloudKitDownload)download
{
  return (BACloudKitDownload *)objc_loadWeakRetained((id *)&self->_download);
}

- (void)setDownload:(id)a3
{
  objc_storeWeak((id *)&self->_download, a3);
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (void)setResponseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_responseQueue, a3);
}

- (NSLock)stateLock
{
  return self->_stateLock;
}

- (void)setStateLock:(id)a3
{
  objc_storeStrong((id *)&self->_stateLock, a3);
}

- (CKOperationConfiguration)operationConfiguration
{
  return self->_operationConfiguration;
}

- (void)setOperationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_operationConfiguration, a3);
}

- (CKQueryOperation)currentOperation
{
  return self->_currentOperation;
}

- (void)setCurrentOperation:(id)a3
{
  objc_storeStrong((id *)&self->_currentOperation, a3);
}

- (NSMutableDictionary)recordErrors
{
  return self->_recordErrors;
}

- (void)setRecordErrors:(id)a3
{
  objc_storeStrong((id *)&self->_recordErrors, a3);
}

- (BOOL)recordFound
{
  return self->_recordFound;
}

- (void)setRecordFound:(BOOL)a3
{
  self->_recordFound = a3;
}

- (BOOL)assetFound
{
  return self->_assetFound;
}

- (void)setAssetFound:(BOOL)a3
{
  self->_assetFound = a3;
}

- (unint64_t)assetSize
{
  return self->_assetSize;
}

- (void)setAssetSize:(unint64_t)a3
{
  self->_assetSize = a3;
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
  objc_storeStrong((id *)&self->_assetURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_recordErrors, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_operationConfiguration, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_destroyWeak((id *)&self->_download);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
