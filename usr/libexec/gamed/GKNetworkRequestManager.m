@implementation GKNetworkRequestManager

- (BOOL)doesCallbackListExistFor:(id)a3 parameters:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  os_unfair_lock_s *p_pendingCallbacksLock;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v8 = a3;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v12 = v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "sortedArrayUsingSelector:", "compare:"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        v17 = 0;
        v18 = v12;
        do
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v17)));

          v17 = (char *)v17 + 1;
          v18 = v12;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v15);
    }
    p_pendingCallbacksLock = &self->_pendingCallbacksLock;
    os_unfair_lock_lock(&self->_pendingCallbacksLock);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingCallbacks](self, "pendingCallbacks"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v12));

    v11 = v21 != 0;
    if (!v21)
    {
      v22 = objc_opt_new(NSMutableArray);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingCallbacks](self, "pendingCallbacks"));
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v12);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingCallbacks](self, "pendingCallbacks"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v12));
    v26 = objc_msgSend(v10, "copy");
    objc_msgSend(v25, "addObject:", v26);

    os_unfair_lock_unlock(p_pendingCallbacksLock);
  }

  return v11;
}

- (id)retrieveAndClearCallbacks:(id)a3 parameters:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  os_unfair_lock_s *p_pendingCallbacksLock;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "sortedArrayUsingSelector:", "compare:"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        v13 = 0;
        v14 = v8;
        do
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v13)));

          v13 = (char *)v13 + 1;
          v14 = v8;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }
    p_pendingCallbacksLock = &self->_pendingCallbacksLock;
    os_unfair_lock_lock(&self->_pendingCallbacksLock);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingCallbacks](self, "pendingCallbacks"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v8));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingCallbacks](self, "pendingCallbacks"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v8));

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingCallbacks](self, "pendingCallbacks"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, v8);

    }
    else
    {
      v19 = 0;
    }
    os_unfair_lock_unlock(p_pendingCallbacksLock);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)dictionaryFromTaskDescription:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v12;
  uint8_t buf[4];
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "taskDescription"));
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v3, 0);
    if (v4)
    {
      v12 = 0;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v4, 0, &v12));
      v6 = v12;
      v7 = v6;
      if (v6)
      {
        if (!os_log_GKGeneral)
          v8 = (id)GKOSLoggers(v6);
        v9 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKNetworkRequestManager JSON serialization error: %@", buf, 0xCu);
        }
      }

    }
    else
    {
      v5 = &__NSDictionary0__struct;
    }

  }
  else
  {
    v5 = &__NSDictionary0__struct;
  }
  v10 = objc_msgSend(v5, "mutableCopy");

  return v10;
}

- (void)getFairPlaySession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager fairPlaySessionProvider](self, "fairPlaySessionProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeBag"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000BC08C;
  v10[3] = &unk_1002C16E8;
  objc_copyWeak(&v12, &location);
  v9 = v4;
  v11 = v9;
  objc_msgSend(v5, "fairPlaySessionWithStoreBag:reporter:completionHandler:", v7, v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (id)filePathToTempFile:(id)a3 fileName:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)NSURL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v5));

  v9 = objc_msgSend(v7, "initFileURLWithPath:", v8);
  return v9;
}

- (id)pathToTempFile:(id)a3 fileName:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByAppendingPathComponent:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v4));

  return v5;
}

- (void)cleanUpPendingStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingLocation](self, "pendingLocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager filePathToTempFile:fileName:](self, "filePathToTempFile:fileName:", v5, v4));

  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v7);
  v9 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKNetworkRequestManager clearing pending location: %@", (uint8_t *)&v12, 0xCu);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
  objc_msgSend(v10, "removeItemAtPath:error:", v11, 0);

}

- (id)contentsOfPendingStore:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingLocation](self, "pendingLocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pathToTempFile:fileName:](self, "pathToTempFile:fileName:", v6, v4));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v8));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)writeToPendingStore:(id)a3 fileName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  NSObject *v18;
  const char *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  uint32_t v23;
  id v24;
  int v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pendingLocation](self, "pendingLocation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager pathToTempFile:fileName:](self, "pathToTempFile:fileName:", v9, v7));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (!objc_msgSend(v12, "fileExistsAtPath:", v11))
    goto LABEL_7;
  v13 = objc_msgSend(v12, "removeItemAtPath:error:", v11, 0);
  if ((v13 & 1) != 0)
  {
    if (!os_log_GKGeneral)
      v14 = (id)GKOSLoggers(v13);
    v15 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Removed existing file", (uint8_t *)&v25, 2u);
    }
LABEL_7:
    v16 = objc_msgSend(v6, "writeToFile:atomically:", v11, 1);
    if ((v16 & 1) != 0)
    {
      if (!os_log_GKGeneral)
        v17 = (id)GKOSLoggers(v16);
      v18 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        v25 = 138412290;
        v26 = v7;
        v19 = "writeDictionaryToFile succeeded for: %@";
LABEL_20:
        v22 = v18;
        v23 = 12;
        goto LABEL_21;
      }
    }
    else
    {
      if (!os_log_GKGeneral)
        v20 = (id)GKOSLoggers(v16);
      v21 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        LOWORD(v25) = 0;
        v19 = "Failed to write pending data";
        v22 = v21;
        v23 = 2;
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v25, v23);
        goto LABEL_22;
      }
    }
    goto LABEL_22;
  }
  if (!os_log_GKGeneral)
    v24 = (id)GKOSLoggers(v13);
  v18 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v25 = 138412290;
    v26 = v11;
    v19 = "Could not remove file: %@";
    goto LABEL_20;
  }
LABEL_22:

}

- (BOOL)beforeFirstUnlock
{
  NSObject *v3;
  _BOOL8 v4;

  v3 = objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  dispatch_assert_queue_V2(v3);

  if (-[GKNetworkRequestManager firstUnlockedState](self, "firstUnlockedState"))
  {
    if (MKBDeviceFormattedForContentProtection())
      v4 = MKBDeviceUnlockedSinceBoot() != 1;
    else
      v4 = 0;
    -[GKNetworkRequestManager setFirstUnlockedState:](self, "setFirstUnlockedState:", v4);
  }
  return -[GKNetworkRequestManager firstUnlockedState](self, "firstUnlockedState");
}

+ (id)commonNetworkRequestManager
{
  if (qword_100317EE0 != -1)
    dispatch_once(&qword_100317EE0, &stru_1002C1708);
  return (id)qword_100317ED8;
}

- (GKNetworkRequestManager)initWithInMemoryEntityCache:(BOOL)a3
{
  _BOOL8 v3;
  GKNetworkRequestManager *v4;
  GKNetworkRequestManager *v5;
  NSMutableDictionary *v6;
  NSDictionary *serviceDependancyMappings;
  NSMutableDictionary *v8;
  NSMutableDictionary *existingTasks;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *stateQueue;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *handlerQueue;
  NSOperationQueue *v18;
  NSOperationQueue *operationQueue;
  uint64_t v20;
  NSURLSessionConfiguration *inProcessConfig;
  _TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate *v22;
  _TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate *inProcessTasksSessionDelegate;
  NSURLSessionConfiguration *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSURLSession *inProcessSession;
  GKFairPlaySessionProvider *v29;
  GKFairPlaySessionProvider *fairPlaySessionProvider;
  uint64_t v31;
  GKEntityCacheProviderProtocol *entityCacheProvider;
  objc_super v34;

  v3 = a3;
  v34.receiver = self;
  v34.super_class = (Class)GKNetworkRequestManager;
  v4 = -[GKNetworkRequestManager init](&v34, "init");
  v5 = v4;
  if (v4)
  {
    v4->_firstUnlockedState = 1;
    -[GKNetworkRequestManager setPendingCallbacksLock:](v4, "setPendingCallbacksLock:", 0);
    v6 = objc_opt_new(NSMutableDictionary);
    -[GKNetworkRequestManager setPendingCallbacks:](v5, "setPendingCallbacks:", v6);

    -[GKNetworkRequestManager setWaitListCallbacksLock:](v5, "setWaitListCallbacksLock:", 0);
    serviceDependancyMappings = v5->_serviceDependancyMappings;
    v5->_serviceDependancyMappings = (NSDictionary *)&off_1002DC428;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    existingTasks = v5->_existingTasks;
    v5->_existingTasks = v8;

    v5->_currentState = 0;
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("com.apple.gamed.networkmanager.state", v11);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("com.apple.gamed.networkmanager.handler", v15);
    handlerQueue = v5->_handlerQueue;
    v5->_handlerQueue = (OS_dispatch_queue *)v16;

    v18 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v18;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    v5->_reportedExessiveRequests = 0;
    v20 = objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
    inProcessConfig = v5->_inProcessConfig;
    v5->_inProcessConfig = (NSURLSessionConfiguration *)v20;

    v22 = objc_alloc_init(_TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate);
    inProcessTasksSessionDelegate = v5->_inProcessTasksSessionDelegate;
    v5->_inProcessTasksSessionDelegate = v22;

    v24 = v5->_inProcessConfig;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager inProcessTasksSessionDelegate](v5, "inProcessTasksSessionDelegate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager operationQueue](v5, "operationQueue"));
    v27 = objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v24, v25, v26));
    inProcessSession = v5->_inProcessSession;
    v5->_inProcessSession = (NSURLSession *)v27;

    v29 = -[GKFairPlaySessionProvider initWithSession:]([GKFairPlaySessionProvider alloc], "initWithSession:", v5->_inProcessSession);
    fairPlaySessionProvider = v5->_fairPlaySessionProvider;
    v5->_fairPlaySessionProvider = v29;

    v31 = objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager makeEntityCacheProviderInMemory:](GKNetworkRequestManager, "makeEntityCacheProviderInMemory:", v3));
    entityCacheProvider = v5->_entityCacheProvider;
    v5->_entityCacheProvider = (GKEntityCacheProviderProtocol *)v31;

  }
  return v5;
}

- (void)cancelCurrentTasks
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKNetworkRequestManager cancelling all existing tasks:", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager backgroundSession](self, "backgroundSession"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BCA84;
  v6[3] = &unk_1002C1730;
  v6[4] = self;
  objc_msgSend(v5, "getAllTasksWithCompletionHandler:", v6);

}

- (int64_t)relatedTasksExistForBagKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  int64_t v12;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager serviceDependancyMappings](self, "serviceDependancyMappings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BCEAC;
    block[3] = &unk_1002C15D0;
    block[4] = self;
    v15 = v6;
    v16 = &v17;
    dispatch_sync(v7, block);

    if (!os_log_GKGeneral)
      v9 = (id)GKOSLoggers(v8);
    v10 = os_log_GKDaemon;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v18[3]));
      *(_DWORD *)buf = 138412546;
      v22 = v4;
      v23 = 2112;
      v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKNetworkRequestManager the outcome of relatedTasksExistForBagKey %@ is: %@", buf, 0x16u);

    }
    v12 = v18[3];

  }
  else
  {
    v12 = v18[3];
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

+ (Class)networkRequestClass:(id)a3
{
  id v3;
  __objc2_class **v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  unsigned int v23;
  void *v24;
  objc_class *v25;

  v3 = a3;
  v4 = &off_1002BA5B0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKRemoveFriendNetworkRequest bagKey](GKRemoveFriendNetworkRequest, "bagKey"));
  v6 = objc_msgSend(v5, "isEqualToString:", v3);

  if ((v6 & 1) != 0)
    goto LABEL_10;
  v4 = off_1002BA5A8;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKRemoveAllFriendsNetworkRequest bagKey](GKRemoveAllFriendsNetworkRequest, "bagKey"));
  v9 = objc_msgSend(v8, "isEqualToString:", v3);

  if ((v9 & 1) != 0)
    goto LABEL_10;
  v4 = &off_1002BA358;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKChallengeNetworkRequest bagKey](GKChallengeNetworkRequest, "bagKey"));
  v11 = objc_msgSend(v10, "isEqualToString:", v3);

  if ((v11 & 1) != 0)
    goto LABEL_10;
  v4 = &off_1002BA2B8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKAbortChallengeNetworkRequest bagKey](GKAbortChallengeNetworkRequest, "bagKey"));
  v13 = objc_msgSend(v12, "isEqualToString:", v3);

  if ((v13 & 1) != 0)
    goto LABEL_10;
  v4 = &off_1002BA2E8;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKAchievementNetworkRequest bagKey](GKAchievementNetworkRequest, "bagKey"));
  v15 = objc_msgSend(v14, "isEqualToString:", v3);

  if ((v15 & 1) != 0)
    goto LABEL_10;
  v4 = &off_1002BA5E0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKScoreNetworkRequest bagKey](GKScoreNetworkRequest, "bagKey"));
  v17 = objc_msgSend(v16, "isEqualToString:", v3);

  if ((v17 & 1) != 0)
    goto LABEL_10;
  v4 = &off_1002BA480;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKInstanceScoreNetworkRequest bagKey](GKInstanceScoreNetworkRequest, "bagKey"));
  v19 = objc_msgSend(v18, "isEqualToString:", v3);

  if ((v19 & 1) != 0)
    goto LABEL_10;
  v4 = &off_1002BA560;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerGameSettingsNetworkRequest bagKey](GKPlayerGameSettingsNetworkRequest, "bagKey"));
  v21 = objc_msgSend(v20, "isEqualToString:", v3);

  if ((v21 & 1) != 0
    || (v4 = off_1002BA520,
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKMultiplayerGroupRequest bagKey](GKMultiplayerGroupRequest, "bagKey")),
        v23 = objc_msgSend(v22, "isEqualToString:", v3),
        v22,
        v23))
  {
LABEL_10:
    v24 = (void *)objc_opt_class(*v4, v7);
  }
  else
  {
    v24 = 0;
  }
  v25 = v24;

  return v25;
}

+ (id)networkRequestFromNsurlTask:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  int v13;
  void *v14;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager dictionaryFromTaskDescription:](GKNetworkRequestManager, "dictionaryFromTaskDescription:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BagKeyKey")));
  v6 = +[GKNetworkRequestManager networkRequestClass:](GKNetworkRequestManager, "networkRequestClass:", v5);
  if (v6)
  {
    v7 = objc_msgSend([v6 alloc], "initWithTask:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "originalRequest"));
    v9 = objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v7, "setNsurlRequest:", v9);

  }
  else
  {
    if (!os_log_GKGeneral)
      v10 = (id)GKOSLoggers(0);
    v11 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GKNetworkRequestManager error, unsupported class: %@", (uint8_t *)&v13, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (id)dictionaryForBagAndPlayer:(id)a3 createIfNotPresent:(BOOL)a4 description:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  GKNetworkRequestInfo *v20;
  GKNetworkRequestInfo *v21;
  id v22;
  NSObject *v23;
  uint8_t v25[16];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  dispatch_assert_queue_V2(v10);

  if (v9)
  {
    v12 = v9;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nsurlTask"));
    v12 = (id)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager dictionaryFromTaskDescription:](GKNetworkRequestManager, "dictionaryFromTaskDescription:", v13));

  }
  v14 = objc_msgSend((id)objc_opt_class(v8, v11), "bagKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PlayerIDKey")));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager existingTasks](self, "existingTasks"));
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v15));

    if (v18)
      goto LABEL_8;
    if (v6)
    {
      v18 = objc_alloc_init((Class)NSMutableDictionary);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager existingTasks](self, "existingTasks"));
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v15);

LABEL_8:
      v20 = (GKNetworkRequestInfo *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v16));
      if (!v20)
      {
        if (!v6)
        {
          v21 = 0;
          goto LABEL_18;
        }
        v20 = objc_alloc_init(GKNetworkRequestInfo);
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, v16);
      }
      v21 = v20;

LABEL_18:
      goto LABEL_19;
    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v22 = (id)GKOSLoggers(0);
    v23 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "GKNetworkRequestManager failed to get store due to nil playerID", v25, 2u);
    }
  }
  v21 = 0;
LABEL_19:

  return v21;
}

- (BOOL)managerReady
{
  NSObject *v3;
  void *v4;
  id v5;

  v3 = objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v5 = objc_msgSend(v4, "networkManagerStateOverride");

  if (v5 != (id)-1)
    return v5 != 0;
  if (-[GKNetworkRequestManager currentState](self, "currentState") < 2)
    return 0;
  return -[GKNetworkRequestManager fairPlaySessionReady](self, "fairPlaySessionReady");
}

- (void)addNetworkRequest:(id)a3 description:(id)a4 clientProxy:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  int v28;
  id v29;
  __int16 v30;
  void *v31;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  dispatch_assert_queue_V2(v11);

  if (!os_log_GKGeneral)
    v13 = (id)GKOSLoggers(v12);
  v14 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[GKNetworkRequestManager currentState](self, "currentState")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager existingTasks](self, "existingTasks"));
    v28 = 138412546;
    v29 = v16;
    v30 = 2112;
    v31 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "GKNetworkRequestManager addNetworkRequest managerState: %@ memory state before update: %@", (uint8_t *)&v28, 0x16u);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager dictionaryForBagAndPlayer:createIfNotPresent:description:](self, "dictionaryForBagAndPlayer:createIfNotPresent:description:", v8, 1, v10));

  if (v18)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager backgroundSession](self, "backgroundSession"));
    objc_msgSend(v8, "handleNetworkRequest:session:clientProxy:", v18, v20, v9);

    if (!os_log_GKGeneral)
      v22 = (id)GKOSLoggers(v21);
    v23 = (void *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager existingTasks](self, "existingTasks"));
      v28 = 138412290;
      v29 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "GKNetworkRequestManager addNetworkRequest state after update: %@", (uint8_t *)&v28, 0xCu);

    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v26 = (id)GKOSLoggers(v19);
    v27 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      v28 = 138412290;
      v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "GKNetworkRequestManager error when trying to add to store: %@", (uint8_t *)&v28, 0xCu);
    }
  }

}

- (void)handleTaskFinished:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (!os_log_GKGeneral)
      v6 = (id)GKOSLoggers(v4);
    v7 = (void *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager existingTasks](self, "existingTasks"));
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKNetworkRequestManager handleTaskFinished state before update: %@", buf, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager networkRequestFromNsurlTask:](GKNetworkRequestManager, "networkRequestFromNsurlTask:", v5));
    v11 = objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000BDAF8;
    v15[3] = &unk_1002BB658;
    v15[4] = self;
    v16 = v10;
    v12 = v10;
    dispatch_async(v11, v15);

  }
  else
  {
    if (!os_log_GKGeneral)
      v13 = (id)GKOSLoggers(0);
    v14 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "GKNetworkRequestManager handleTaskFinished with nil task, skipping", buf, 2u);
    }
  }

}

- (void)setupSessionsAsync
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BDD4C;
  block[3] = &unk_1002BBBD8;
  block[4] = self;
  dispatch_async(v3, block);

}

+ (BOOL)entityIsReleaseStateAwareForBagKey:(id)a3
{
  uint64_t v3;
  id v4;
  unsigned __int8 v5;

  v3 = qword_100317EF0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_100317EF0, &stru_1002C1750);
  v5 = objc_msgSend((id)qword_100317EE8, "containsObject:", v4);

  return v5;
}

+ (BOOL)useJSONForBagKey:(id)a3
{
  uint64_t v3;
  id v4;
  unsigned __int8 v5;

  v3 = qword_100317F00;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_100317F00, &stru_1002C1770);
  v5 = objc_msgSend((id)qword_100317EF8, "containsObject:", v4);

  return v5;
}

- (id)playerCredentialsForClientProxy:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
  v5 = objc_msgSend(v3, "environment");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pushCredentialForEnvironment:", v5));
  return v6;
}

- (void)assembleRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 sapSession:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager playerCredentialsForClientProxy:](self, "playerCredentialsForClientProxy:", v14));
  -[GKNetworkRequestManager assembleRequestForPlayer:bagKey:clientProxy:sapSession:playerCredential:handler:](self, "assembleRequestForPlayer:bagKey:clientProxy:sapSession:playerCredential:handler:", v16, v15, v14, v13, v17, v12);

}

- (void)assembleRequestForPlayer:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 sapSession:(id)a6 playerCredential:(id)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  GKNetworkRequestManager *v31;
  id v32;
  id v33;
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager handlerQueue](self, "handlerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BE98C;
  block[3] = &unk_1002BC420;
  v28 = v14;
  v29 = v15;
  v30 = v18;
  v31 = self;
  v32 = v16;
  v33 = v17;
  v34 = v19;
  v21 = v19;
  v22 = v17;
  v23 = v16;
  v24 = v18;
  v25 = v15;
  v26 = v14;
  dispatch_async(v20, block);

}

- (void)writeToNetwork:(id)a3 clientProxy:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  NSObject *v12;
  id v13;
  _QWORD *v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v8 = a3;
  v9 = a4;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000BEEF8;
  v22[3] = &unk_1002BD988;
  v10 = a5;
  v22[4] = self;
  v23 = v10;
  v11 = objc_retainBlock(v22);
  v12 = objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BEFB8;
  block[3] = &unk_1002C1810;
  block[4] = self;
  v18 = v8;
  v20 = v10;
  v21 = v11;
  v19 = v9;
  v13 = v9;
  v14 = v11;
  v15 = v10;
  v16 = v8;
  dispatch_async(v12, block);

}

- (id)waitListLocation
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = GKInsecureCacheRoot(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("networkWaitBeforeAllowAttempt.plist")));

  v6 = GKInsecureCacheRoot(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (id)gkEnsureDirectory(v7);

  return v4;
}

- (void)setWaitPeriod:(id)a3 waitPeriod:(double)a4
{
  id v6;
  os_unfair_lock_s *p_waitListCallbacksLock;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;

  v6 = a3;
  p_waitListCallbacksLock = &self->_waitListCallbacksLock;
  os_unfair_lock_lock(&self->_waitListCallbacksLock);
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
    v16 = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Attempting to update wait period: %@, %@", (uint8_t *)&v16, 0x16u);

  }
  if (v6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager waitListLocation](self, "waitListLocation"));
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v13));
    if (!v14)
      v14 = objc_alloc_init((Class)NSMutableDictionary);
    if (a4 == 0.0)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, v6);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a4));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v6);

    }
    objc_msgSend(v14, "writeToFile:atomically:", v13, 1);
    os_unfair_lock_unlock(p_waitListCallbacksLock);

  }
}

- (void)handleRetryAfter:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  GKNetworkRequestManager *v17;
  id v18;
  uint8_t buf[4];
  void *v20;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager dictionaryFromTaskDescription:](GKNetworkRequestManager, "dictionaryFromTaskDescription:", v5));
    *(_DWORD *)buf = 138412290;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKNetworkRequestManager attempting to retry after for task: %@", buf, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "response"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager networkRequestFromNsurlTask:](GKNetworkRequestManager, "networkRequestFromNsurlTask:", v5));
  v12 = objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager stateQueue](self, "stateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BF950;
  block[3] = &unk_1002BC380;
  v16 = v10;
  v17 = self;
  v18 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

- (id)existingWaitListDate:(id)a3
{
  os_unfair_lock_s *p_waitListCallbacksLock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_waitListCallbacksLock = &self->_waitListCallbacksLock;
  v5 = a3;
  os_unfair_lock_lock(p_waitListCallbacksLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager waitListLocation](self, "waitListLocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v5));
  os_unfair_lock_unlock(p_waitListCallbacksLock);

  return v8;
}

- (id)canSafelyIssueRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  NSErrorUserInfoKey v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager existingWaitListDate:](self, "existingWaitListDate:", v4));
  v6 = v5;
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v5, "timeIntervalSinceNow");
  if (v7 <= 0.0)
  {
    -[GKNetworkRequestManager setWaitPeriod:waitPeriod:](self, "setWaitPeriod:waitPeriod:", v4, 0.0);
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("A wait period is active not allowing network requests for this bag key: %@ , %@"), v4, v6));
  v12 = NSLocalizedFailureReasonErrorKey;
  v13 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:userInfo:](NSError, "userErrorForCode:userInfo:", 3, v9));

LABEL_6:
  return v10;
}

- (void)issueRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 handler:(id)a6
{
  -[GKNetworkRequestManager issueRequest:bagKey:clientProxy:locale:handler:](self, "issueRequest:bagKey:clientProxy:locale:handler:", a3, a4, a5, 0, a6);
}

- (void)issueRequestForPlayer:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 locale:(id)a6 playerCredential:(id)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "storeBag"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000BFD6C;
  v28[3] = &unk_1002C17E8;
  v33 = v18;
  v34 = v19;
  v28[4] = self;
  v29 = v14;
  v30 = v15;
  v31 = v16;
  v32 = v17;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  v26 = v14;
  v27 = v19;
  objc_msgSend(v21, "verifyEligibilityForBagKey:replyQueue:client:completion:", v25, 0, v24, v28);

}

- (void)_issueRequestForPlayer:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 locale:(id)a6 playerCredential:(id)a7 handler:(id)a8
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
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000BFEE0;
  v25[3] = &unk_1002C18C8;
  v25[4] = self;
  v26 = v15;
  v30 = v17;
  v31 = a8;
  v27 = v14;
  v28 = v16;
  v29 = v18;
  v19 = v17;
  v20 = v18;
  v21 = v16;
  v22 = v14;
  v23 = v31;
  v24 = v15;
  -[GKNetworkRequestManager getFairPlaySession:](self, "getFairPlaySession:", v25);

}

- (void)issueRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 locale:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager playerCredentialsForClientProxy:](self, "playerCredentialsForClientProxy:", v14));
  -[GKNetworkRequestManager issueRequestForPlayer:bagKey:clientProxy:locale:playerCredential:handler:](self, "issueRequestForPlayer:bagKey:clientProxy:locale:playerCredential:handler:", v16, v15, v14, v13, v17, v12);

}

+ (id)uuidFromTask:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager dictionaryFromTaskDescription:](GKNetworkRequestManager, "dictionaryFromTaskDescription:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("UUIDKey")));

  return v4;
}

+ (id)taskWithRequest:(id)a3 description:(id)a4 session:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;

  if (!a3)
    return 0;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "downloadTaskWithRequest:", a3));
  v17 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v7, 1, &v17));

  v10 = v17;
  v11 = v10;
  if (v10)
  {
    if (!os_log_GKGeneral)
      v12 = (id)GKOSLoggers(v10);
    v13 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GKNetworkRequestManager JSON serialization error: %@", buf, 0xCu);
    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "base64EncodedStringWithOptions:", 0));
    if (v15)
      objc_msgSend(v8, "setTaskDescription:", v15);

  }
  v16 = v8;

  return v16;
}

- (id)resultsLocation
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = GKInsecureCacheRoot(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("staging")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("storeAndForwardResultsLocation")));
  v6 = (id)gkEnsureDirectory(v5);
  return v5;
}

- (id)pendingLocation
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = GKInsecureCacheRoot(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("staging")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("storeAndForwardPendingLocation")));
  v6 = (id)gkEnsureDirectory(v5);
  return v5;
}

- (id)taskFromIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKNetworkRequestManager contentsOfPendingStore:](self, "contentsOfPendingStore:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BagKeyKey")));
  v5 = objc_alloc_init(+[GKNetworkRequestManager networkRequestClass:](GKNetworkRequestManager, "networkRequestClass:", v4));
  v6 = objc_msgSend(v5, "updateWithTaskInfo:", v3);
  if (!os_log_GKGeneral)
    v7 = (id)GKOSLoggers(v6);
  v8 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKNetworkRequestManager constructed pending request: %@", (uint8_t *)&v10, 0xCu);
  }

  return v5;
}

- (void)issuePending
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = _localPlayerID();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000C0CE8;
    v6[3] = &unk_1002C18F0;
    v6[4] = self;
    v7 = v4;
    -[GKNetworkRequestManager getFairPlaySession:](self, "getFairPlaySession:", v6);

  }
}

- (GKEntityCacheProviderProtocol)entityCacheProvider
{
  return self->_entityCacheProvider;
}

- (void)setEntityCacheProvider:(id)a3
{
  objc_storeStrong((id *)&self->_entityCacheProvider, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (NSURLSessionConfiguration)backgroundConfig
{
  return self->_backgroundConfig;
}

- (void)setBackgroundConfig:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundConfig, a3);
}

- (NSURLSession)backgroundSession
{
  return self->_backgroundSession;
}

- (void)setBackgroundSession:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundSession, a3);
}

- (GKNetworkRequestManagerSessionDelegate)backgroundTasksSessionDelegate
{
  return self->_backgroundTasksSessionDelegate;
}

- (void)setBackgroundTasksSessionDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTasksSessionDelegate, a3);
}

- (_TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate)inProcessTasksSessionDelegate
{
  return self->_inProcessTasksSessionDelegate;
}

- (void)setInProcessTasksSessionDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_inProcessTasksSessionDelegate, a3);
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_handlerQueue, a3);
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (BOOL)firstUnlockedState
{
  return self->_firstUnlockedState;
}

- (void)setFirstUnlockedState:(BOOL)a3
{
  self->_firstUnlockedState = a3;
}

- (NSDictionary)serviceDependancyMappings
{
  return self->_serviceDependancyMappings;
}

- (void)setServiceDependancyMappings:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDependancyMappings, a3);
}

- (NSMutableDictionary)existingTasks
{
  return self->_existingTasks;
}

- (void)setExistingTasks:(id)a3
{
  objc_storeStrong((id *)&self->_existingTasks, a3);
}

- (BOOL)reportedExessiveRequests
{
  return self->_reportedExessiveRequests;
}

- (void)setReportedExessiveRequests:(BOOL)a3
{
  self->_reportedExessiveRequests = a3;
}

- (os_unfair_lock_s)pendingCallbacksLock
{
  return self->_pendingCallbacksLock;
}

- (void)setPendingCallbacksLock:(os_unfair_lock_s)a3
{
  self->_pendingCallbacksLock = a3;
}

- (os_unfair_lock_s)waitListCallbacksLock
{
  return self->_waitListCallbacksLock;
}

- (void)setWaitListCallbacksLock:(os_unfair_lock_s)a3
{
  self->_waitListCallbacksLock = a3;
}

- (NSMutableDictionary)pendingCallbacks
{
  return self->_pendingCallbacks;
}

- (void)setPendingCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingCallbacks, a3);
}

- (NSURLSession)inProcessSession
{
  return self->_inProcessSession;
}

- (void)setInProcessSession:(id)a3
{
  objc_storeStrong((id *)&self->_inProcessSession, a3);
}

- (NSURLSessionConfiguration)inProcessConfig
{
  return self->_inProcessConfig;
}

- (void)setInProcessConfig:(id)a3
{
  objc_storeStrong((id *)&self->_inProcessConfig, a3);
}

- (BOOL)fairPlaySessionReady
{
  return self->_fairPlaySessionReady;
}

- (void)setFairPlaySessionReady:(BOOL)a3
{
  self->_fairPlaySessionReady = a3;
}

- (GKFairPlaySessionProvider)fairPlaySessionProvider
{
  return self->_fairPlaySessionProvider;
}

- (void)setFairPlaySessionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_fairPlaySessionProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fairPlaySessionProvider, 0);
  objc_storeStrong((id *)&self->_inProcessConfig, 0);
  objc_storeStrong((id *)&self->_inProcessSession, 0);
  objc_storeStrong((id *)&self->_pendingCallbacks, 0);
  objc_storeStrong((id *)&self->_existingTasks, 0);
  objc_storeStrong((id *)&self->_serviceDependancyMappings, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_inProcessTasksSessionDelegate, 0);
  objc_storeStrong((id *)&self->_backgroundTasksSessionDelegate, 0);
  objc_storeStrong((id *)&self->_backgroundSession, 0);
  objc_storeStrong((id *)&self->_backgroundConfig, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_entityCacheProvider, 0);
}

+ (id)makeEntityCacheProviderInMemory:(BOOL)a3
{
  id v3;

  sub_10018E70C(a3);
  return v3;
}

- (void)createEntityWithRequest:(id)a3 bagKey:(id)a4 clientProxy:(id)a5 completionHandler:(id)a6 entityMaker:(id)a7
{
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  GKNetworkRequestManager *v21;
  uint64_t v22;
  uint64_t v23;

  v12 = _Block_copy(a6);
  v13 = _Block_copy(a7);
  v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v17 = v16;
  v18 = swift_allocObject(&unk_1002C6540, 24, 7);
  *(_QWORD *)(v18 + 16) = v12;
  v19 = swift_allocObject(&unk_1002C6568, 24, 7);
  *(_QWORD *)(v19 + 16) = v13;
  v20 = a5;
  v21 = self;
  sub_10018E76C(v14, v15, v17, v20, (uint64_t)sub_100194690, v18, (uint64_t)sub_100194694, v19);

  swift_bridgeObjectRelease(v14, v22);
  swift_bridgeObjectRelease(v17, v23);
  swift_release(v18);
  swift_release(v19);
}

- (void)createEntityWithRequest:(NSDictionary *)a3 bagKey:(NSString *)a4 clientProxy:(GKClientProxy *)a5 entityMaker:(id)a6 completionHandler:
{
  const void *v6;
  const void *v7;
  void *v12;
  void *v13;
  _QWORD *v14;
  NSDictionary *v15;
  NSString *v16;
  GKClientProxy *v17;
  GKNetworkRequestManager *v18;

  v7 = v6;
  v12 = _Block_copy(a6);
  v13 = _Block_copy(v7);
  v14 = (_QWORD *)swift_allocObject(&unk_1002C64F0, 64, 7);
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = v12;
  v14[6] = v13;
  v14[7] = self;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = self;
  sub_1001C15C4((uint64_t)&unk_100315A70, (uint64_t)v14);
}

- (void)readEntityWithRequest:(id)a3 bagKey:(id)a4 includeStaleCacheData:(BOOL)a5 clientProxy:(id)a6 completionHandler:(id)a7 entityMaker:(id)a8
{
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  GKNetworkRequestManager *v22;
  uint64_t v23;
  uint64_t v24;

  v14 = _Block_copy(a7);
  v15 = _Block_copy(a8);
  if (a3)
    a3 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = v17;
  v19 = swift_allocObject(&unk_1002C6370, 24, 7);
  *(_QWORD *)(v19 + 16) = v14;
  v20 = swift_allocObject(&unk_1002C6398, 24, 7);
  *(_QWORD *)(v20 + 16) = v15;
  v21 = a6;
  v22 = self;
  sub_10018F854((uint64_t)a3, v16, v18, a5, v21, (uint64_t)sub_100193680, v19, (uint64_t)sub_100194694, v20);

  swift_bridgeObjectRelease(v18, v23);
  swift_release(v19);
  swift_release(v20);
  swift_bridgeObjectRelease(a3, v24);
}

- (void)readEntityWithRequest:(NSDictionary *)a3 bagKey:(NSString *)a4 includeStaleCacheData:(BOOL)a5 clientProxy:(GKClientProxy *)a6 entityMaker:(id)a7 completionHandler:
{
  const void *v7;
  const void *v8;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *v17;
  NSString *v18;
  GKClientProxy *v19;
  GKNetworkRequestManager *v20;

  v8 = v7;
  v14 = _Block_copy(a7);
  v15 = _Block_copy(v8);
  v16 = swift_allocObject(&unk_1002C6278, 72, 7);
  *(_QWORD *)(v16 + 16) = a3;
  *(_QWORD *)(v16 + 24) = a4;
  *(_BYTE *)(v16 + 32) = a5;
  *(_QWORD *)(v16 + 40) = a6;
  *(_QWORD *)(v16 + 48) = v14;
  *(_QWORD *)(v16 + 56) = v15;
  *(_QWORD *)(v16 + 64) = self;
  v17 = a3;
  v18 = a4;
  v19 = a6;
  v20 = self;
  sub_1001C15C4((uint64_t)&unk_1003159F8, v16);
}

- (void)deleteEntitiesWithBagKey:(NSString *)a3 clientProxy:(GKClientProxy *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSString *v10;
  GKClientProxy *v11;
  GKNetworkRequestManager *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject(&unk_1002C6220, 48, 7);
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1001C15C4((uint64_t)&unk_1003159D8, (uint64_t)v9);
}

+ (id)makeEntityIDWithRequest:(id)a3 bagKey:(id)a4
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  uint64_t v13;

  if (a3)
    v5 = (_QWORD *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v5 = 0;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  sub_100190750(v5, v6, v7);
  v10 = v9;
  swift_bridgeObjectRelease(v8, v9);
  swift_bridgeObjectRelease(v5, v11);
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10, v13);
  return v12;
}

@end
