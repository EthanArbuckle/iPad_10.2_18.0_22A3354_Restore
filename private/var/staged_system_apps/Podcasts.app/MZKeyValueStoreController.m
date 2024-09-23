@implementation MZKeyValueStoreController

- (void)performBlock:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController dispatchQueue](self, "dispatchQueue"));
  dispatch_async(v5, v4);

}

- (MZKeyValueStoreController)initWithDomain:(id)a3 baseURLForGETAll:(id)a4 baseURLForPUTAll:(id)a5
{
  id v9;
  id v10;
  id v11;
  MZKeyValueStoreController *v12;
  MZKeyValueStoreController *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *dispatchQueue;
  IMURLRequestService *v16;
  IMURLRequestService *urlRequestService;
  NSMutableArray *v18;
  NSMutableArray *pendingTransactions;
  MZKeyValueStoreAuthenticationController *v20;
  MZKeyValueStoreAuthenticationController *authenticationController;
  _TtC8Podcasts20CloudSyncBugReporter *v22;
  _TtP8Podcasts21CloudSyncBugReporting_ *cloudSyncBugReporter;
  void *v24;
  uint64_t v25;
  void *v26;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)MZKeyValueStoreController;
  v12 = -[MZKeyValueStoreController init](&v28, "init");
  v13 = v12;
  if (v12)
  {
    v12->_enabled = 1;
    v12->_canRequestStoreSignIn = 1;
    v14 = dispatch_queue_create("com.apple.MZKeyValueStoreController", 0);
    dispatchQueue = v13->_dispatchQueue;
    v13->_dispatchQueue = (OS_dispatch_queue *)v14;

    v16 = (IMURLRequestService *)objc_msgSend(objc_alloc((Class)IMURLRequestService), "initWithConcurrentOperationCount:requestEncodingType:", 1, 0);
    urlRequestService = v13->_urlRequestService;
    v13->_urlRequestService = v16;

    -[IMURLRequestService setUrlSessionDelegate:](v13->_urlRequestService, "setUrlSessionDelegate:", v13);
    -[IMURLRequestService setPersonalizeRequests:](v13->_urlRequestService, "setPersonalizeRequests:", 1);
    v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingTransactions = v13->_pendingTransactions;
    v13->_pendingTransactions = v18;

    v20 = objc_alloc_init(MZKeyValueStoreAuthenticationController);
    authenticationController = v13->_authenticationController;
    v13->_authenticationController = v20;

    v22 = objc_alloc_init(_TtC8Podcasts20CloudSyncBugReporter);
    cloudSyncBugReporter = v13->_cloudSyncBugReporter;
    v13->_cloudSyncBugReporter = (_TtP8Podcasts21CloudSyncBugReporting_ *)v22;

    objc_storeStrong((id *)&v13->_defaultDomain, a3);
    objc_storeStrong((id *)&v13->_defaultGetURL, a4);
    objc_storeStrong((id *)&v13->_defaultSetURL, a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v25 = IMNetworkTypeChangedNotification;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[IMNetworkObserver sharedInstance](IMNetworkObserver, "sharedInstance"));
    objc_msgSend(v24, "addObserver:selector:name:object:", v13, "_networkTypeChangedNotification:", v25, v26);

  }
  return v13;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)reset
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100004994;
  v2[3] = &unk_1004A6200;
  v2[4] = self;
  -[MZKeyValueStoreController performBlock:](self, "performBlock:", v2);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)clampsController
{
  return +[MZKeyValueStoreClampsController sharedClampsController](MZKeyValueStoreClampsController, "sharedClampsController");
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  -[MZKeyValueStoreController _endBackgroundTask](self, "_endBackgroundTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = IMNetworkTypeChangedNotification;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMNetworkObserver sharedInstance](IMNetworkObserver, "sharedInstance"));
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)MZKeyValueStoreController;
  -[MZKeyValueStoreController dealloc](&v6, "dealloc");
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setDefaultDomain:(id)a3
{
  NSString *v4;
  NSString *defaultDomain;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_defaultDomain, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    defaultDomain = self->_defaultDomain;
    self->_defaultDomain = v4;

    -[MZKeyValueStoreController reset](self, "reset");
  }

}

- (void)setDefaultGetURL:(id)a3
{
  NSURL *v4;
  NSURL *defaultGetURL;
  id v6;

  v6 = a3;
  if ((-[NSURL isEqual:](self->_defaultGetURL, "isEqual:") & 1) == 0)
  {
    v4 = (NSURL *)objc_msgSend(v6, "copy");
    defaultGetURL = self->_defaultGetURL;
    self->_defaultGetURL = v4;

    -[MZKeyValueStoreController reset](self, "reset");
  }

}

- (void)setDefaultSetURL:(id)a3
{
  NSURL *v4;
  NSURL *defaultSetURL;
  id v6;

  v6 = a3;
  if ((-[NSURL isEqual:](self->_defaultSetURL, "isEqual:") & 1) == 0)
  {
    v4 = (NSURL *)objc_msgSend(v6, "copy");
    defaultSetURL = self->_defaultSetURL;
    self->_defaultSetURL = v4;

    -[MZKeyValueStoreController reset](self, "reset");
  }

}

- (void)setEnabled:(BOOL)a3
{
  _QWORD v3[5];

  if (self->_enabled != a3)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10008C6E8;
    v3[3] = &unk_1004A6200;
    v3[4] = self;
    -[MZKeyValueStoreController performBlock:](self, "performBlock:", v3);
  }
}

- (void)_networkTypeChangedNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController dispatchQueue](self, "dispatchQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008C87C;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async(v4, block);

}

- (id)scheduleGetAllTransactionWithSinceDomainVersion:(id)a3 processor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultGetURL](self, "defaultGetURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController _scheduleTransactionWithType:sinceDomainVersion:URL:keys:processor:](self, "_scheduleTransactionWithType:sinceDomainVersion:URL:keys:processor:", 1, v7, v8, 0, v6));

  return v9;
}

- (id)scheduleGetTransactionWithKeys:(id)a3 processor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultGetURL](self, "defaultGetURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController _scheduleTransactionWithType:sinceDomainVersion:URL:keys:processor:](self, "_scheduleTransactionWithType:sinceDomainVersion:URL:keys:processor:", 1, 0, v8, v7, v6));

  return v9;
}

- (id)scheduleSetTransactionWithKeys:(id)a3 processor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultSetURL](self, "defaultSetURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController _scheduleTransactionWithType:sinceDomainVersion:URL:keys:processor:](self, "_scheduleTransactionWithType:sinceDomainVersion:URL:keys:processor:", 2, 0, v8, v7, v6));

  return v9;
}

- (void)scheduleTransaction:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v13 = 0;
  v5 = -[MZKeyValueStoreController _delegateShouldScheduleTransaction:error:](self, "_delegateShouldScheduleTransaction:error:", v4, &v13);
  v6 = v13;
  v7 = v6;
  if (v5)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10008CB88;
    v11[3] = &unk_1004A6640;
    v11[4] = self;
    v12 = v4;
    -[MZKeyValueStoreController performBlock:](self, "performBlock:", v11);

  }
  else
  {
    v8 = _MTLogCategoryCloudSync(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ Did not schedule transaction - %@", buf, 0x16u);

    }
    -[MZKeyValueStoreController _transactionDidFail:withError:](self, "_transactionDidFail:withError:", v4, v7);
  }

}

- (void)cancelScheduledTransaction:(id)a3
{
  id v3;
  _QWORD v4[4];
  MZKeyValueStoreController *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008CC0C;
  v4[3] = &unk_1004A6640;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[MZKeyValueStoreController performBlock:](v5, "performBlock:", v4);

}

- (void)cancelAllTransactions
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10008CCB0;
  v2[3] = &unk_1004A6200;
  v2[4] = self;
  -[MZKeyValueStoreController performBlock:](self, "performBlock:", v2);
}

- (void)cancelAllTransactionsCancelCode:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10008CDB8;
  v3[3] = &unk_1004A77F8;
  v3[4] = self;
  v3[5] = a3;
  -[MZKeyValueStoreController performBlock:](self, "performBlock:", v3);
}

- (void)resolveError:(id)a3 transaction:(id)a4 resolution:(int)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  MZKeyValueStoreController *v10;
  id v11;
  id v12;
  int v13;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008CF20;
  v9[3] = &unk_1004A8840;
  v10 = self;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v7 = v12;
  v8 = v11;
  -[MZKeyValueStoreController performBlock:](v10, "performBlock:", v9);

}

- (BOOL)isIdle
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
    v5 = objc_msgSend(v6, "count") == 0;

  }
  objc_sync_exit(v3);

  return v5;
}

- (void)performBlockAndWait:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController dispatchQueue](self, "dispatchQueue"));
  dispatch_sync(v5, v4);

}

- (void)_cancelAllPendingTransactions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  v7 = objc_msgSend(v6, "copy");

  objc_sync_exit(v5);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v11);
        v13 = objc_msgSend(v4, "copy", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
        objc_msgSend(v13, "setTransactionDescription:", v14);

        -[MZKeyValueStoreController _cancelTransaction:error:](self, "_cancelTransaction:error:", v12, v13);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  objc_sync_enter(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  objc_msgSend(v16, "removeAllObjects");

  objc_sync_exit(v15);
}

- (void)_cancelTransaction:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));

    if (!v6)
      v6 = (id)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError transactionCancelledErrorWithTransaction:underlyingError:](MZKeyValueStoreError, "transactionCancelledErrorWithTransaction:underlyingError:", 0, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
    objc_msgSend(v6, "setTransactionDescription:", v8);

    if (v7 == v11)
    {
      -[IMURLRequestService cancelAllRequests](self->_urlRequestService, "cancelAllRequests");
      -[MZKeyValueStoreController setCurrentTransaction:](self, "setCurrentTransaction:", 0);
    }
    if (-[MZKeyValueStoreController isResolvingError](self, "isResolvingError"))
      -[MZKeyValueStoreController _transactionDidCancel:withError:](self, "_transactionDidCancel:withError:", v11, v6);
    else
      -[MZKeyValueStoreController _transactionDidFail:withError:](self, "_transactionDidFail:withError:", v11, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
    objc_sync_enter(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
    objc_msgSend(v10, "removeObject:", v11);

    objc_sync_exit(v9);
    -[MZKeyValueStoreController _processPendingTransactions](self, "_processPendingTransactions");
  }

}

- (void)_processPendingTransactions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
    objc_sync_enter(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

    if (v6)
    {
      -[MZKeyValueStoreController setCurrentTransaction:](self, "setCurrentTransaction:", v6);

      objc_sync_exit(v4);
      -[MZKeyValueStoreController _processCurrentTransaction](self, "_processCurrentTransaction");
    }
    else
    {
      objc_sync_exit(v4);

      -[MZKeyValueStoreController _endBackgroundTask](self, "_endBackgroundTask");
    }
  }
}

- (void)_processCurrentTransaction
{
  void *v3;
  unsigned int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
  v15 = 0;
  v4 = -[MZKeyValueStoreController _authenticationCanProcessTransaction:error:](self, "_authenticationCanProcessTransaction:error:", v3, &v15);
  v5 = v15;

  v7 = _MTLogCategoryCloudSync(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ Processing transaction", buf, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController _requestForTransaction:](self, "_requestForTransaction:", v11));

    -[MZKeyValueStoreController _beginBackgroundTask](self, "_beginBackgroundTask");
    objc_msgSend(v12, "start");
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
      *(_DWORD *)buf = 138412546;
      v17 = v13;
      v18 = 2112;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ Authentication cannot process transaction - %@", buf, 0x16u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
    objc_msgSend(v14, "setDSIDCheckTimestamp");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
    -[MZKeyValueStoreController _transactionDidFail:withError:](self, "_transactionDidFail:withError:", v12, v5);
  }

}

- (id)_requestForTransaction:(id)a3
{
  id v4;
  MZKeyValueStoreRequest *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(MZKeyValueStoreRequest);
  -[MZKeyValueStoreRequest setTransaction:](v5, "setTransaction:", v4);

  -[MZKeyValueStoreRequest setDelegate:](v5, "setDelegate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
  -[MZKeyValueStoreRequest setShouldAuthenticate:](v5, "setShouldAuthenticate:", objc_msgSend(v6, "shouldAuthenticate"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "DSID"));
  -[MZKeyValueStoreRequest setDSID:](v5, "setDSID:", v8);

  return v5;
}

- (void)_scheduleTransaction:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v10 = 0;
  v5 = -[MZKeyValueStoreController _canScheduleTransaction:error:](self, "_canScheduleTransaction:error:", v4, &v10);
  v6 = v10;
  v7 = _MTLogCategoryCloudSync(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ Scheduling transaction", buf, 0xCu);
    }

    -[MZKeyValueStoreController _addPendingTransaction:](self, "_addPendingTransaction:", v4);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ Did not schedule transaction - %@", buf, 0x16u);
    }

    -[MZKeyValueStoreController _transactionDidFail:withError:](self, "_transactionDidFail:withError:", v4, v6);
  }

}

- (void)_addPendingTransaction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
  objc_msgSend(v5, "setTimestampForTransaction:", v7);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  objc_msgSend(v6, "addObject:", v7);

  objc_sync_exit(v4);
  -[MZKeyValueStoreController _processPendingTransactions](self, "_processPendingTransactions");

}

- (BOOL)_canScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (-[MZKeyValueStoreController _isEnabledForTransaction:error:](self, "_isEnabledForTransaction:error:", v6, a4)
    && -[MZKeyValueStoreController _isTransactionValid:error:](self, "_isTransactionValid:error:", v6, a4))
  {
    v7 = -[MZKeyValueStoreController _clampsCanScheduleTransaction:error:](self, "_clampsCanScheduleTransaction:error:", v6, a4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_isEnabledForTransaction:(id)a3 error:(id *)a4
{
  id v6;
  unsigned __int8 v7;
  BOOL v8;

  v6 = a3;
  v7 = -[MZKeyValueStoreController isEnabled](self, "isEnabled");
  v8 = v7;
  if (a4 && (v7 & 1) == 0)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError keyValueStoreDisabledErrorWithTransaction:underlyingError:](MZKeyValueStoreError, "keyValueStoreDisabledErrorWithTransaction:underlyingError:", v6, 0));

  return v8;
}

- (BOOL)_isTransactionValid:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));

  if (!v6)
  {
    if (a4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError transactionMissingURLErrorWithTransaction:underlyingError:](MZKeyValueStoreError, "transactionMissingURLErrorWithTransaction:underlyingError:", v5, 0));
LABEL_8:
      v8 = 0;
      *a4 = v9;
      goto LABEL_10;
    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));

  if (!v7)
  {
    if (a4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError transactionMissingDomainErrorWithTransaction:underlyingError:](MZKeyValueStoreError, "transactionMissingDomainErrorWithTransaction:underlyingError:", v5, 0));
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v8 = 1;
LABEL_10:

  return v8;
}

- (BOOL)_clampsCanScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
  LOBYTE(a4) = objc_msgSend(v7, "canScheduleTransaction:error:", v6, a4);

  return (char)a4;
}

- (BOOL)_authenticationCanProcessTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  char v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
  v8 = objc_msgSend(v7, "hasUserRecentlyAcceptedSync");

  if ((v8 & 1) != 0
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController")),
        v10 = objc_msgSend(v9, "isAuthenticationValidForTransaction:error:", v6, a4),
        v9,
        v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
    if ((objc_msgSend(v11, "shouldAuthenticate") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
      v13 = objc_msgSend(v12, "hasAuthenticatedTooRecentlyForTransaction:error:", v6, a4);

      v14 = v13 ^ 1;
    }
    else
    {

      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_scheduleTransactionWithType:(int)a3 sinceDomainVersion:(id)a4 URL:(id)a5 keys:(id)a6 processor:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  MZKeyValueStoreTransaction *v16;
  void *v17;
  MZKeyValueStoreTransaction *v18;

  v10 = *(_QWORD *)&a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = [MZKeyValueStoreTransaction alloc];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultDomain](self, "defaultDomain"));
  v18 = -[MZKeyValueStoreTransaction initWithType:domain:URL:keys:](v16, "initWithType:domain:URL:keys:", v10, v17, v14, v13);

  -[MZKeyValueStoreTransaction setSinceDomainVersion:](v18, "setSinceDomainVersion:", v15);
  -[MZKeyValueStoreTransaction setProcessor:](v18, "setProcessor:", v12);

  -[MZKeyValueStoreController scheduleTransaction:](self, "scheduleTransaction:", v18);
  return v18;
}

- (void)_currentTransactionDidFinish
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v3 = _MTLogCategoryCloudSync(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
    v10 = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Transaction did finish %@", (uint8_t *)&v10, 0xCu);

  }
  -[MZKeyValueStoreController _endBackgroundTask](self, "_endBackgroundTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
  -[MZKeyValueStoreController _delegateTransactionDidFinish:](self, "_delegateTransactionDidFinish:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController pendingTransactions](self, "pendingTransactions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
  objc_msgSend(v8, "removeObject:", v9);

  -[MZKeyValueStoreController setCurrentTransaction:](self, "setCurrentTransaction:", 0);
  objc_sync_exit(v7);

  -[MZKeyValueStoreController _processPendingTransactions](self, "_processPendingTransactions");
}

- (void)_transactionDidFail:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));

    if (v10 == v6)
      -[MZKeyValueStoreController _endBackgroundTask](self, "_endBackgroundTask");
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008DF34;
  block[3] = &unk_1004A7398;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_transactionDidCancel:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));

    if (v10 == v6)
      -[MZKeyValueStoreController _endBackgroundTask](self, "_endBackgroundTask");
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E068;
  block[3] = &unk_1004A7398;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_processOperationOutput:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  MZKeyValueStoreDeserializer *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  _BOOL8 v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  _BOOL8 v43;
  _BOOL8 v44;
  void *v45;
  unsigned __int8 v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  uint64_t v63;
  NSObject *v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  NSObject *v68;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "DSID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "DSID"));

  v11 = -[NSObject isEqualToString:](v10, "isEqualToString:", v8);
  if ((v11 & 1) != 0)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
    if (v12 && -[MZKeyValueStoreController isEnabled](self, "isEnabled"))
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transaction"));
      v14 = (void *)v13;
      if (v13 != v12)
      {
        v15 = _MTLogCategoryCloudSync(v13);
        v16 = (MZKeyValueStoreDeserializer *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v66 = v14;
          v67 = 2112;
          v68 = v12;
          _os_log_impl((void *)&_mh_execute_header, &v16->super, OS_LOG_TYPE_ERROR, "Ignoring BK response for transaction %@ while current transaction is %@", buf, 0x16u);
        }
        goto LABEL_41;
      }
      v16 = -[MZKeyValueStoreDeserializer initWithTransaction:response:]([MZKeyValueStoreDeserializer alloc], "initWithTransaction:response:", v12, v6);
      -[MZKeyValueStoreDeserializer setDelegate:](v16, "setDelegate:", self);
      if (-[MZKeyValueStoreDeserializer success](v16, "success")
        || -[MZKeyValueStoreDeserializer versionMismatch](v16, "versionMismatch"))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
        objc_msgSend(v18, "resetAcceptedCredentials");

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
        objc_msgSend(v19, "setShouldAuthenticate:", 0);

        -[MZKeyValueStoreController setCurrentDeserializer:](self, "setCurrentDeserializer:", v16);
        -[MZKeyValueStoreDeserializer deserialize](v16, "deserialize");
LABEL_41:

        goto LABEL_42;
      }
      v20 = -[MZKeyValueStoreDeserializer hasBackoff](v16, "hasBackoff");
      if (v20)
      {
        v21 = _MTLogCategoryCloudSync(v20);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
          v58 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer requestError](v16, "requestError"));
          *(_DWORD *)buf = 138412546;
          v66 = v23;
          v67 = 2112;
          v68 = v58;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@ Deserializer has backoff - %@", buf, 0x16u);

        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
        objc_msgSend(v24, "backOffForTimeInterval:", (double)-[MZKeyValueStoreDeserializer retrySeconds](v16, "retrySeconds"));

        v25 = (double)-[MZKeyValueStoreDeserializer retrySeconds](v16, "retrySeconds");
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer requestError](v16, "requestError"));
        v27 = objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError serverClampErrorWithTransaction:retrySeconds:underlyingError:](MZKeyValueStoreError, "serverClampErrorWithTransaction:retrySeconds:underlyingError:", v12, v26, v25));
      }
      else
      {
        v28 = -[MZKeyValueStoreDeserializer unsupportedClient](v16, "unsupportedClient");
        if (!v28)
        {
          v34 = -[MZKeyValueStoreDeserializer genericError](v16, "genericError");
          if (v34)
          {
            v35 = _MTLogCategoryCloudSync(v34);
            v36 = objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
              v60 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer requestError](v16, "requestError"));
              *(_DWORD *)buf = 138412546;
              v66 = v37;
              v67 = 2112;
              v68 = v60;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%@ Got generic deserializer error - %@", buf, 0x16u);

            }
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer requestError](v16, "requestError"));
            v38 = objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError storeGenericErrorWithTransaction:underlyingError:](MZKeyValueStoreError, "storeGenericErrorWithTransaction:underlyingError:", v12, v26));
          }
          else
          {
            v39 = -[MZKeyValueStoreDeserializer validationError](v16, "validationError");
            if (v39)
            {
              v40 = _MTLogCategoryCloudSync(v39);
              v41 = objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                v42 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
                v61 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer requestError](v16, "requestError"));
                *(_DWORD *)buf = 138412546;
                v66 = v42;
                v67 = 2112;
                v68 = v61;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%@ Got validation error - %@", buf, 0x16u);

              }
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer requestError](v16, "requestError"));
              v38 = objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError storeValidationErrorWithTransaction:underlyingError:](MZKeyValueStoreError, "storeValidationErrorWithTransaction:underlyingError:", v12, v26));
            }
            else
            {
              v43 = -[MZKeyValueStoreDeserializer authenticationError](v16, "authenticationError");
              if (v43)
              {
                v44 = -[MZKeyValueStoreController canRequestStoreSignIn](self, "canRequestStoreSignIn");
                if (v44)
                {
                  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
                  v46 = objc_msgSend(v45, "shouldAuthenticate");

                  if ((v46 & 1) == 0)
                  {
                    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
                    objc_msgSend(v55, "clearAuthenticationRequest");

                    v56 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
                    objc_msgSend(v56, "setShouldAuthenticate:", 1);

                    -[MZKeyValueStoreController _processCurrentTransaction](self, "_processCurrentTransaction");
                    goto LABEL_41;
                  }
                }
                v47 = _MTLogCategoryCloudSync(v44);
                v48 = objc_claimAutoreleasedReturnValue(v47);
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
                  v62 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer requestError](v16, "requestError"));
                  *(_DWORD *)buf = 138412546;
                  v66 = v49;
                  v67 = 2112;
                  v68 = v62;
                  _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%@ Got authentication error - %@", buf, 0x16u);

                }
                v50 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer requestError](v16, "requestError"));
                v63 = objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError storeAccountSessionExpiredWithTransaction:underlyingError:](MZKeyValueStoreError, "storeAccountSessionExpiredWithTransaction:underlyingError:", v12, v50));

                v57 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController cloudSyncBugReporter](self, "cloudSyncBugReporter"));
                v51 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
                v26 = (void *)v63;
                objc_msgSend(v57, "reportSyncAuthenticationErrorFor:error:", v51, v63);

                -[MZKeyValueStoreController _transactionDidFail:withError:](self, "_transactionDidFail:withError:", v12, v63);
                goto LABEL_40;
              }
              v52 = _MTLogCategoryCloudSync(v43);
              v53 = objc_claimAutoreleasedReturnValue(v52);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                v54 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
                v64 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer requestError](v16, "requestError"));
                *(_DWORD *)buf = 138412546;
                v66 = v54;
                v67 = 2112;
                v68 = v64;
                _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%@ Got unknown error - %@", buf, 0x16u);

              }
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer requestError](v16, "requestError"));
              v38 = objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError unknownErrorWithTransaction:underlyingError:](MZKeyValueStoreError, "unknownErrorWithTransaction:underlyingError:", v12, v26));
            }
          }
          v33 = (void *)v38;
          -[MZKeyValueStoreController _transactionDidFail:withError:](self, "_transactionDidFail:withError:", v12, v38);
LABEL_39:

LABEL_40:
          goto LABEL_41;
        }
        v29 = _MTLogCategoryCloudSync(v28);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
          v59 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer requestError](v16, "requestError"));
          *(_DWORD *)buf = 138412546;
          v66 = v31;
          v67 = 2112;
          v68 = v59;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%@ Got unsupported client error - %@", buf, 0x16u);

        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
        objc_msgSend(v32, "setNetworkingBlocked");

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreDeserializer requestError](v16, "requestError"));
        v27 = objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError killSwitchErrorWithTransaction:underlyingError:](MZKeyValueStoreError, "killSwitchErrorWithTransaction:underlyingError:", v12, v26));
      }
      v33 = (void *)v27;
      -[MZKeyValueStoreController _cancelAllPendingTransactions:](self, "_cancelAllPendingTransactions:", v27);
      goto LABEL_39;
    }
  }
  else
  {
    v17 = _MTLogCategoryCloudSync(v11);
    v12 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v66 = v8;
      v67 = 2112;
      v68 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Ignoring BK response for dsid = %@ while currentDsid = %@", buf, 0x16u);
    }
  }
LABEL_42:

}

- (void)_enqueueStoreRequest:(id)a3 withUrlRequest:(id)a4
{
  id v6;
  id v7;
  IMURLRequestService *urlRequestService;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  urlRequestService = self->_urlRequestService;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10008E988;
  v10[3] = &unk_1004A8868;
  objc_copyWeak(&v12, &location);
  v9 = v6;
  v11 = v9;
  -[IMURLRequestService performUrlRequest:callback:](urlRequestService, "performUrlRequest:callback:", v7, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)_resolveError:(id)a3 transaction:(id)a4 resolution:(int)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  -[MZKeyValueStoreController setResolvingError:](self, "setResolvingError:", 1);
  if ((objc_msgSend(v13, "isTransactionCancelledError") & 1) == 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
    if ((id)v9 == v8)
    {

    }
    else
    {
      v10 = (void *)v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));

      if (v11)
        goto LABEL_7;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
    objc_msgSend(v12, "clearDSIDCheckTimestamp");

LABEL_7:
    if (a5 == 2)
    {
      -[MZKeyValueStoreController _errorResolutionCancel:transaction:](self, "_errorResolutionCancel:transaction:", v13, v8);
    }
    else if (a5 == 1)
    {
      -[MZKeyValueStoreController _errorResolutionRetry:transaction:](self, "_errorResolutionRetry:transaction:", v13, v8);
    }
    else
    {
      -[MZKeyValueStoreController _errorResolutionDefault:transaction:](self, "_errorResolutionDefault:transaction:", v13, v8);
    }
  }
  -[MZKeyValueStoreController setResolvingError:](self, "setResolvingError:", 0);

}

- (void)_errorResolutionRetry:(id)a3 transaction:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v11, "isAccountsChangedError"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
    objc_msgSend(v7, "setUserAcceptedSyncTimestamp");
  }
  else
  {
    v8 = objc_msgSend(v11, "isAuthenticationError");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
    v10 = v9;
    if (!v8)
    {
      objc_msgSend(v9, "clearTimestampForTransaction:", v6);

      -[MZKeyValueStoreController scheduleTransaction:](self, "scheduleTransaction:", v6);
      goto LABEL_7;
    }
    objc_msgSend(v9, "setUserAcceptedSyncTimestamp");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
    objc_msgSend(v7, "resetAcceptedCredentials");
  }

  -[MZKeyValueStoreController _processCurrentTransaction](self, "_processCurrentTransaction");
LABEL_7:

}

- (void)_errorResolutionCancel:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isAuthenticationError"))
    -[MZKeyValueStoreController _cancelAllPendingTransactions:](self, "_cancelAllPendingTransactions:", v6);
  else
    -[MZKeyValueStoreController _cancelTransaction:error:](self, "_cancelTransaction:error:", v7, v6);

}

- (void)_errorResolutionDefault:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v11, "isAuthenticationError"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
    if (v7 == v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController authenticationController](self, "authenticationController"));
      v9 = objc_msgSend(v8, "shouldAuthenticate");

      if (!v9)
      {
        v10 = 1;
        goto LABEL_6;
      }
    }
    else
    {

    }
  }
  v10 = 2;
LABEL_6:
  -[MZKeyValueStoreController _resolveError:transaction:resolution:](self, "_resolveError:transaction:resolution:", v11, v6, v10);

}

- (BOOL)_delegateShouldScheduleTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  unsigned __int8 v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "keyValueStoreController:shouldScheduleTransaction:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "keyValueStoreController:shouldScheduleTransaction:", self, v6);

    if (a4 && (v10 & 1) == 0)
    {
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError delegateCancelledErrorWithTransaction:underlyingError:](MZKeyValueStoreError, "delegateCancelledErrorWithTransaction:underlyingError:", v6, 0));
    }
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)_delegateTransactionDidFail:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  unsigned __int8 v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "keyValueStoreController:transaction:didFailWithError:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController delegate](self, "delegate"));
    v11 = objc_msgSend(v10, "keyValueStoreController:transaction:didFailWithError:", self, v6, v7);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_delegateTransactionDidCancel:(id)a3 withError:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "keyValueStoreController:transaction:didCancelWithError:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController delegate](self, "delegate"));
    objc_msgSend(v9, "keyValueStoreController:transaction:didCancelWithError:", self, v10, v6);

  }
}

- (void)_delegateTransactionDidFinish:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "keyValueStoreController:transactionDidFinish:");

  if ((v6 & 1) != 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10008F040;
    v7[3] = &unk_1004A6640;
    v7[4] = self;
    v8 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  }
}

- (void)_beginBackgroundTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController backgroundTaskAssertion](self, "backgroundTaskAssertion"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@ _beginBackgroundTask] - No transaction"), self));
    v8 = v7;

    objc_initWeak(&location, self);
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = sub_1000466CC;
    v17 = sub_1000469DC;
    v18 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[2] = sub_10008F224;
    v11[3] = &unk_1004A8890;
    v11[1] = 3221225472;
    objc_copyWeak(&v12, &location);
    v11[4] = &v13;
    v9 = +[MZTaskAssertion newBackgroundTaskWithExpirationHandler:debugInfo:](MZTaskAssertion, "newBackgroundTaskWithExpirationHandler:debugInfo:", v11, v8);
    v10 = (void *)v14[5];
    v14[5] = (uint64_t)v9;

    -[MZKeyValueStoreController setBackgroundTaskAssertion:](self, "setBackgroundTaskAssertion:", v14[5]);
    _Block_object_dispose(&v13, 8);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

- (void)_endBackgroundTask
{
  void *v3;
  _QWORD block[4];
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController backgroundTaskAssertion](self, "backgroundTaskAssertion"));
  -[MZKeyValueStoreController setBackgroundTaskAssertion:](self, "setBackgroundTaskAssertion:", 0);
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008F320;
    block[3] = &unk_1004A6200;
    v5 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8;
  void (**v9)(id, uint64_t);
  uint64_t v10;
  _QWORD v11[5];

  v8 = a5;
  v9 = (void (**)(id, uint64_t))a6;
  v10 = objc_opt_class(NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0 && objc_msgSend(v8, "statusCode") == (id)511)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10008F3E8;
    v11[3] = &unk_1004A6200;
    v11[4] = self;
    -[MZKeyValueStoreController performBlock:](self, "performBlock:", v11);
  }
  v9[2](v9, 1);

}

- (BOOL)AMSURLSession:(id)a3 shouldHandleAuthenticationForAccount:(id)a4 dialogDictionary:(id)a5
{
  id v5;
  id v6;
  _QWORD v8[4];
  MZKeyValueStoreController *v9;
  id v10;
  id v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008F5B4;
  v8[3] = &unk_1004A7398;
  v9 = self;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction", a3, a4, a5));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError storeAccountSessionExpiredWithTransaction:underlyingError:](MZKeyValueStoreError, "storeAccountSessionExpiredWithTransaction:underlyingError:", v10, 0));
  v5 = v11;
  v6 = v10;
  -[MZKeyValueStoreController performBlock:](v9, "performBlock:", v8);

  return 0;
}

- (BOOL)AMSURLSession:(id)a3 task:(id)a4 shouldFailWithServerError:(id)a5
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;

  v6 = a5;
  v7 = _MTLogCategoryCloudSync(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
    v14 = 138412546;
    v15 = v9;
    v16 = 2112;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@ AMSURLSession server failure - %@", (uint8_t *)&v14, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MZKeyValueStoreError unknownErrorWithTransaction:underlyingError:](MZKeyValueStoreError, "unknownErrorWithTransaction:underlyingError:", v10, v6));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentTransaction](self, "currentTransaction"));
  -[MZKeyValueStoreController _transactionDidFail:withError:](self, "_transactionDidFail:withError:", v12, v11);

  return 1;
}

- (void)keyValueStoreOperation:(id)a3 scheduleURLRequest:(id)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController clampsController](self, "clampsController"));
  v8 = objc_msgSend(v7, "isNetworkingBlocked");

  if ((v8 & 1) == 0)
    -[MZKeyValueStoreController _enqueueStoreRequest:withUrlRequest:](self, "_enqueueStoreRequest:withUrlRequest:", v9, v6);

}

- (void)deserializeOperationDidFinish:(id)a3 shouldReschedule:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentDeserializer](self, "currentDeserializer"));

  if (v7 == v6)
  {
    if (v4)
      -[MZKeyValueStoreController _processCurrentTransaction](self, "_processCurrentTransaction");
    else
      -[MZKeyValueStoreController _currentTransactionDidFinish](self, "_currentTransactionDidFinish");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController currentDeserializer](self, "currentDeserializer"));
    objc_msgSend(v8, "setDelegate:", 0);

    -[MZKeyValueStoreController setCurrentDeserializer:](self, "setCurrentDeserializer:", 0);
  }
}

- (MZKeyValueStoreControllerDelegate)delegate
{
  return (MZKeyValueStoreControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSURL)defaultGetURL
{
  return self->_defaultGetURL;
}

- (NSURL)defaultSetURL
{
  return self->_defaultSetURL;
}

- (NSString)defaultDomain
{
  return self->_defaultDomain;
}

- (MZKeyValueStoreAuthenticationController)authenticationController
{
  return (MZKeyValueStoreAuthenticationController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAuthenticationController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)canRequestStoreSignIn
{
  return self->_canRequestStoreSignIn;
}

- (void)setCanRequestStoreSignIn:(BOOL)a3
{
  self->_canRequestStoreSignIn = a3;
}

- (NSMutableArray)pendingTransactions
{
  return self->_pendingTransactions;
}

- (void)setPendingTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTransactions, a3);
}

- (MZKeyValueStoreTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransaction, a3);
}

- (BOOL)isResolvingError
{
  return self->_resolvingError;
}

- (void)setResolvingError:(BOOL)a3
{
  self->_resolvingError = a3;
}

- (MZKeyValueStoreDeserializer)currentDeserializer
{
  return self->_currentDeserializer;
}

- (void)setCurrentDeserializer:(id)a3
{
  objc_storeStrong((id *)&self->_currentDeserializer, a3);
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (MZTaskAssertion)backgroundTaskAssertion
{
  return self->_backgroundTaskAssertion;
}

- (void)setBackgroundTaskAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTaskAssertion, a3);
}

- (IMURLRequestService)urlRequestService
{
  return self->_urlRequestService;
}

- (void)setUrlRequestService:(id)a3
{
  objc_storeStrong((id *)&self->_urlRequestService, a3);
}

- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter
{
  return self->_cloudSyncBugReporter;
}

- (void)setCloudSyncBugReporter:(id)a3
{
  objc_storeStrong((id *)&self->_cloudSyncBugReporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSyncBugReporter, 0);
  objc_storeStrong((id *)&self->_urlRequestService, 0);
  objc_storeStrong((id *)&self->_backgroundTaskAssertion, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentDeserializer, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_pendingTransactions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_defaultDomain, 0);
  objc_storeStrong((id *)&self->_defaultSetURL, 0);
  objc_storeStrong((id *)&self->_defaultGetURL, 0);
}

- (id)scheduleApnSubscriptionTransactionWithDictionary:(id)a3
{
  id v4;
  MTApnsDictionaryProcessor *v5;
  MTApnsTransaction *v6;
  void *v7;
  void *v8;
  void *v9;
  MTApnsTransaction *v10;

  v4 = a3;
  v5 = -[MTApnsDictionaryProcessor initWithDictionary:]([MTApnsDictionaryProcessor alloc], "initWithDictionary:", v4);
  v6 = [MTApnsTransaction alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultDomain](self, "defaultDomain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultSetURL](self, "defaultSetURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));

  v10 = -[MZKeyValueStoreTransaction initWithType:domain:URL:keys:](v6, "initWithType:domain:URL:keys:", 2, v7, v8, v9);
  -[MZKeyValueStoreTransaction setSinceDomainVersion:](v10, "setSinceDomainVersion:", CFSTR("0"));
  -[MZKeyValueStoreTransaction setProcessor:](v10, "setProcessor:", v5);
  -[MZKeyValueStoreController scheduleTransaction:](self, "scheduleTransaction:", v10);

  return v10;
}

@end
