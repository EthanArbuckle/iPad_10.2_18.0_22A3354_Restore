@implementation SSURLSessionManager

- (SSURLSessionManager)init
{
  SSURLSessionManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *eventQueue;
  NSMutableDictionary *v5;
  NSMutableDictionary *sendTimingDataMap;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *sendTimingDataQueue;
  NSMutableDictionary *v10;
  NSMutableDictionary *sessions;
  dispatch_queue_t v12;
  OS_dispatch_queue *sessionsQueue;
  uint64_t v14;
  NSMapTable *taskDelegates;
  dispatch_queue_t v16;
  OS_dispatch_queue *taskDelegatesQueue;
  NSMutableDictionary *v18;
  NSMutableDictionary *taskMetrics;
  dispatch_queue_t v20;
  OS_dispatch_queue *taskMetricsQueue;
  NSMutableDictionary *v22;
  NSMutableDictionary *requestData;
  dispatch_queue_t v24;
  OS_dispatch_queue *requestDataQueue;
  NSMutableDictionary *v26;
  NSMutableDictionary *responseData;
  dispatch_queue_t v28;
  OS_dispatch_queue *responseDataQueue;
  NSMutableDictionary *v30;
  NSMutableDictionary *recordResponseMap;
  dispatch_queue_t v32;
  OS_dispatch_queue *recordResponseQueue;
  SSCircularBuffer *v34;
  SSCircularBuffer *httpArchiveBuffer;
  void *v36;
  void *v37;
  int v38;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)SSURLSessionManager;
  v2 = -[SSURLSessionManager init](&v41, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.StoreServices.SessionManager.eventqueue", 0);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sendTimingDataMap = v2->_sendTimingDataMap;
    v2->_sendTimingDataMap = v5;

    v7 = MEMORY[0x1E0C80D50];
    v8 = dispatch_queue_create("com.apple.StoreServices.SessionManager.sendTimingData", MEMORY[0x1E0C80D50]);
    sendTimingDataQueue = v2->_sendTimingDataQueue;
    v2->_sendTimingDataQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sessions = v2->_sessions;
    v2->_sessions = v10;

    v12 = dispatch_queue_create("com.apple.StoreServices.SessionManager.sessions", v7);
    sessionsQueue = v2->_sessionsQueue;
    v2->_sessionsQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    taskDelegates = v2->_taskDelegates;
    v2->_taskDelegates = (NSMapTable *)v14;

    v16 = dispatch_queue_create("com.apple.StoreServices.SessionManager.taskDelegates", v7);
    taskDelegatesQueue = v2->_taskDelegatesQueue;
    v2->_taskDelegatesQueue = (OS_dispatch_queue *)v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    taskMetrics = v2->_taskMetrics;
    v2->_taskMetrics = v18;

    v20 = dispatch_queue_create("com.apple.StoreServices.SessionManager.taskMetrics", v7);
    taskMetricsQueue = v2->_taskMetricsQueue;
    v2->_taskMetricsQueue = (OS_dispatch_queue *)v20;

    if (SSIsInternalBuild())
    {
      v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      requestData = v2->_requestData;
      v2->_requestData = v22;

      v24 = dispatch_queue_create("com.apple.StoreServices.SessionManager.requestData", v7);
      requestDataQueue = v2->_requestDataQueue;
      v2->_requestDataQueue = (OS_dispatch_queue *)v24;

      v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      responseData = v2->_responseData;
      v2->_responseData = v26;

      v28 = dispatch_queue_create("com.apple.StoreServices.SessionManager.responseData", v7);
      responseDataQueue = v2->_responseDataQueue;
      v2->_responseDataQueue = (OS_dispatch_queue *)v28;

      v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      recordResponseMap = v2->_recordResponseMap;
      v2->_recordResponseMap = v30;

      v32 = dispatch_queue_create("com.apple.StoreServices.SessionManager.recordResponse", v7);
      recordResponseQueue = v2->_recordResponseQueue;
      v2->_recordResponseQueue = (OS_dispatch_queue *)v32;

    }
    if (objc_msgSend((id)objc_opt_class(), "_shouldCollectNetworkLogs"))
    {
      -[SSURLSessionManager _listenForLowMemoryWarning](v2, "_listenForLowMemoryWarning");
      v34 = -[SSCircularBuffer initWithMaxSize:]([SSCircularBuffer alloc], "initWithMaxSize:", 400);
      httpArchiveBuffer = v2->_httpArchiveBuffer;
      v2->_httpArchiveBuffer = v34;

      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "bundleIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.AppStore"));

      if (v38)
        -[SSCircularBuffer setMaxSize:](v2->_httpArchiveBuffer, "setMaxSize:", 2000);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_SSHTTPArchiveShouldSaveToDisk, CFSTR("SSHTTPArchiveShouldSaveToDiskNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_SSHTTPArchiveShouldSaveToDiskDecompressed, CFSTR("SSHTTPArchiveShouldSaveToDiskDecompressedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *memoryPressureSource;
  objc_super v8;
  _QWORD v9[5];
  _QWORD block[5];

  if (objc_msgSend((id)objc_opt_class(), "_shouldCollectNetworkLogs"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SSHTTPArchiveShouldSaveToDiskNotification"), 0);
  }
  -[SSURLSessionManager sessionsQueue](self, "sessionsQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SSURLSessionManager_dealloc__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_barrier_sync(v4, block);

  -[SSURLSessionManager taskDelegatesQueue](self, "taskDelegatesQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __30__SSURLSessionManager_dealloc__block_invoke_2;
  v9[3] = &unk_1E47B8790;
  v9[4] = self;
  dispatch_barrier_sync(v6, v9);

  memoryPressureSource = self->_memoryPressureSource;
  if (memoryPressureSource)
    dispatch_source_cancel(memoryPressureSource);
  v8.receiver = self;
  v8.super_class = (Class)SSURLSessionManager;
  -[SSURLSessionManager dealloc](&v8, sel_dealloc);
}

void __30__SSURLSessionManager_dealloc__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sessions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "sessions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "invalidateAndCancel");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "sessions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

}

void __30__SSURLSessionManager_dealloc__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "taskDelegates");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (unint64_t)httpArchiveBufferSize
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[SSURLSessionManager httpArchiveBuffer](self, "httpArchiveBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SSURLSessionManager httpArchiveBuffer](self, "httpArchiveBuffer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "maxSize");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setHttpArchiveBufferSize:(unint64_t)a3
{
  id v4;

  -[SSURLSessionManager httpArchiveBuffer](self, "httpArchiveBuffer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxSize:", a3);

}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_31);
  return (id)sharedManager___sessionManager;
}

void __36__SSURLSessionManager_sharedManager__block_invoke()
{
  SSURLSessionManager *v0;
  void *v1;

  v0 = objc_alloc_init(SSURLSessionManager);
  v1 = (void *)sharedManager___sessionManager;
  sharedManager___sessionManager = (uint64_t)v0;

}

- (id)dataTaskWithRequest:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HIBYTE(v26) = 0;
  -[SSURLSessionManager _sessionWithDelegate:collectTimingData:](self, "_sessionWithDelegate:collectTimingData:", v7, (char *)&v26 + 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataTaskWithRequest:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    objc_msgSend(v11, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      v13 &= 2u;
    if (v13)
    {
      v15 = (void *)objc_opt_class();
      v16 = v15;
      objc_msgSend(v6, "URL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412546;
      v28 = v15;
      v29 = 2112;
      v30 = v17;
      LODWORD(v26) = 22;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, &v27, v26);
      v14 = objc_claimAutoreleasedReturnValue();
      free(v18);
      SSFileLog(v11, CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v14);
    }

    goto LABEL_15;
  }
  -[SSURLSessionManager _setDelegate:forTask:](self, "_setDelegate:forTask:", v7, v9);
  objc_msgSend(v6, "HTTPBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSURLSessionManager _setRequestData:forSessionTask:](self, "_setRequestData:forSessionTask:", v10, v9);

  -[SSURLSessionManager _setAPSTopicWithTask:](self, "_setAPSTopicWithTask:", v9);
  if (HIBYTE(v26))
    -[SSURLSessionManager _setSendTimingData:forSessionTask:](self, "_setSendTimingData:forSessionTask:", MEMORY[0x1E0C9AAB0], v9);
LABEL_16:

  return v9;
}

+ (id)eventFromTimingData:(id)a3 task:(id)a4
{
  return (id)objc_msgSend(a1, "eventFromTimingData:task:error:", a3, a4, 0);
}

+ (id)eventFromTimingData:(id)a3 task:(id)a4 error:(id)a5
{
  return (id)objc_msgSend(a1, "eventFromTimingData:delegate:task:error:", a3, 0, a4, a5);
}

+ (id)eventFromTimingData:(id)a3 requestProperties:(id)a4 task:(id)a5 error:(id)a6
{
  return (id)objc_msgSend(a1, "eventFromTimingData:delegate:task:error:", a3, 0, a5, a6);
}

+ (id)eventFromTimingData:(id)a3 delegate:(id)a4 task:(id)a5 error:(id)a6
{
  return (id)objc_msgSend(a1, "eventFromTimingData:delegate:session:task:error:", a3, a4, 0, a5, a6);
}

+ (id)eventFromTimingData:(id)a3 delegate:(id)a4 session:(id)a5 task:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  SSMetricsLoadURLEvent *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  NSObject *v35;
  int v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  void *v52;
  void *v53;
  int *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _BYTE v72[128];
  int v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!objc_msgSend(a3, "count"))
  {
    v22 = 0;
    goto LABEL_39;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "requestProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "clientIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
    {
      objc_msgSend(v12, "requestProperties");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "clientIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "bundleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFDBD0]), "initWithBundleIdentifier:", v20);

    }
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend((id)objc_opt_class(), "sharedManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_taskMetricsForSessionTask:", v14);
  v24 = objc_claimAutoreleasedReturnValue();

  v59 = (void *)v24;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB88]), "initWithTask:metrics:", v14, v24);
  objc_msgSend(v25, "setError:", v15);
  objc_msgSend(v25, "setProcessInfo:", v18);
  v61 = v15;
  v62 = v14;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "rawResponseData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setResponseBody:", v26);

  }
  else
  {
    objc_msgSend(v25, "setResponseBody:", 0);
  }
  v63 = v13;
  objc_msgSend(v25, "setSession:", v13);
  v58 = v25;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB90]), "initWithContext:", v25);
  objc_msgSend(a1, "_bagPerformanceValuesWithDelegate:", v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("sessionDuration"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "doubleValue");
  objc_msgSend(v27, "setXpSessionDuration:");

  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("samplingPercentageCachedResponses"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  objc_msgSend(v27, "setXpSamplingPercentageCachedResponses:");

  v57 = v28;
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("samplingPercentageUsers"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "doubleValue");
  objc_msgSend(v27, "setXpSamplingPercentageUsers:");

  if (+[SSMetricsLoadURLEvent shouldLogTimingMetrics](SSMetricsLoadURLEvent, "shouldLogTimingMetrics"))
  {
    objc_msgSend(v27, "setXpSamplingForced:", 1);
    objc_msgSend(v27, "setXpSamplingPercentageCachedResponses:", 1.0);
    objc_msgSend(v27, "setXpSamplingPercentageUsers:", 1.0);
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v33 = objc_msgSend(v32, "shouldLog");
    if (objc_msgSend(v32, "shouldLogToDisk"))
      v34 = v33 | 2;
    else
      v34 = v33;
    objc_msgSend(v32, "OSLogObject");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      v36 = v34;
    else
      v36 = v34 & 2;
    if (v36)
    {
      v73 = 138412290;
      v74 = v27;
      LODWORD(v56) = 12;
      v55 = &v73;
      v37 = (void *)_os_log_send_and_compose_impl();

      if (!v37)
      {
LABEL_25:

        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v37, 4, &v73, v56);
      v35 = objc_claimAutoreleasedReturnValue();
      free(v37);
      SSFileLog(v32, CFSTR("%@"), v38, v39, v40, v41, v42, v43, (uint64_t)v35);
    }

    goto LABEL_25;
  }
LABEL_26:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "requestProperties");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "additionalMetrics");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v45 = 0;
  }
  v60 = (void *)v18;
  v64 = v12;
  if (objc_msgSend(v45, "count", v55))
  {
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __71__SSURLSessionManager_eventFromTimingData_delegate_session_task_error___block_invoke;
    v69[3] = &unk_1E47BF5A0;
    v70 = v27;
    v71 = a1;
    objc_msgSend(v45, "enumerateKeysAndObjectsUsingBlock:", v69);

  }
  v22 = objc_alloc_init(SSMetricsLoadURLEvent);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend(v27, "underlyingDictionary");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v66 != v49)
          objc_enumerationMutation(v46);
        v51 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend(v27, "underlyingDictionary");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectForKeyedSubscript:", v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        -[SSMetricsMutableEvent setProperty:forBodyKey:](v22, "setProperty:forBodyKey:", v53, v51);
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    }
    while (v48);
  }

  v13 = v63;
  v12 = v64;
  v15 = v61;
  v14 = v62;
LABEL_39:

  return v22;
}

void __71__SSURLSessionManager_eventFromTimingData_delegate_session_task_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  _BYTE v22[24];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "propertyForBodyKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v10 &= 2u;
    if (v10)
    {
      *(_DWORD *)v22 = 138543874;
      *(_QWORD *)&v22[4] = objc_opt_class();
      *(_WORD *)&v22[12] = 2114;
      *(_QWORD *)&v22[14] = v5;
      *(_WORD *)&v22[22] = 2112;
      v23 = v6;
      v12 = *(id *)&v22[4];
      LODWORD(v21) = 32;
      v20 = v22;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, v22, v21, *(_OWORD *)v22, *(_QWORD *)&v22[16], v23);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_13;
  }
LABEL_14:
  objc_msgSend(*(id *)(a1 + 32), "setProperty:forBodyKey:", v6, v5, v20);

}

- (void)flushHTTPArchiveBuffer
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[SSURLSessionManager httpArchiveBuffer](self, "httpArchiveBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    v9 = v7;
  else
    v9 = v7 & 2;
  if (!v9)
    goto LABEL_12;
  v20 = 134217984;
  v21 = v4;
  LODWORD(v19) = 12;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v20, v19);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
LABEL_12:

  }
  -[SSURLSessionManager httpArchiveBuffer](self, "httpArchiveBuffer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v17, "flush");

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (-[SSURLSessionManager _shouldRecordResponseBodyForDataTask:](self, "_shouldRecordResponseBodyForDataTask:", v8))
    -[SSURLSessionManager _appendResponseData:forSessionTask:](self, "_appendResponseData:forSessionTask:", v9, v8);
  -[SSURLSessionManager _delegateForTask:](self, "_delegateForTask:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "URLSession:dataTask:didReceiveData:", v11, v8, v9);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[SSURLSessionManager _delegateForTask:](self, "_delegateForTask:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "URLSession:dataTask:didReceiveResponse:completionHandler:", v14, v10, v11, v12);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  -[SSURLSessionManager _delegateForTask:](self, "_delegateForTask:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_timingData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && -[SSURLSessionManager _sendTimingDataForSessionTask:](self, "_sendTimingDataForSessionTask:", v8))
  {
    objc_msgSend((id)objc_opt_class(), "eventFromTimingData:delegate:session:task:error:", v11, v10, v16, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v10, "metricsLoadURLSamplingPercentageCachedResponses"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v13))
    {
      objc_msgSend(v10, "metricsLoadURLSamplingPercentageCachedResponses");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v15 = +[SSMetricsLoadURLEvent shouldReportCachedEventWithSamplingPercentage:](SSMetricsLoadURLEvent, "shouldReportCachedEventWithSamplingPercentage:");

    }
    else
    {
      v15 = +[SSMetricsLoadURLEvent shouldReportCachedEvent](SSMetricsLoadURLEvent, "shouldReportCachedEvent");
    }
    if (!objc_msgSend(v12, "connectionReused") || v15)
      -[SSURLSessionManager _insertEventIntoDatabase:delegate:](self, "_insertEventIntoDatabase:delegate:", v12, v10);
  }
  else
  {
    v12 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "URLSession:task:didCompleteWithEvent:error:", v16, v8, v12, v9);
  -[SSURLSessionManager _removeDelegateForTask:](self, "_removeDelegateForTask:", v8);
  -[SSURLSessionManager _setSendTimingData:forSessionTask:](self, "_setSendTimingData:forSessionTask:", 0, v8);
  -[SSURLSessionManager _setTaskMetrics:forSessionTask:](self, "_setTaskMetrics:forSessionTask:", 0, v8);

}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  SSHTTPArchive *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a4;
  v9 = a5;
  -[SSURLSessionManager _setTaskMetrics:forSessionTask:](self, "_setTaskMetrics:forSessionTask:", v9, v8);
  if (SSIsInternalBuild())
  {
    -[SSURLSessionManager _requestDataForSessionTask:](self, "_requestDataForSessionTask:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSURLSessionManager _responseDataForSessionTask:](self, "_responseDataForSessionTask:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSURLSessionManager _delegateForTask:](self, "_delegateForTask:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "URLSession:task:decodedDataForResponseData:", v21, v8, v11);
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
    if ((SSDebugShouldDisableNetworkLogging() & 1) != 0)
      goto LABEL_15;
    -[SSURLSessionManager httpArchiveBuffer](self, "httpArchiveBuffer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "maxSize");

    if (!v15)
      goto LABEL_15;
    v16 = -[SSHTTPArchive initWithTaskMetrics:requestData:responseData:]([SSHTTPArchive alloc], "initWithTaskMetrics:requestData:responseData:", v9, v10, v11);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "URLSession:task:didFinishCreatingHTTPArchive:", v21, v8, v16);
    objc_msgSend(v8, "response");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "response");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = +[SSVCookieStorage responseHasSetCookies:](SSVCookieStorage, "responseHasSetCookies:", v18);

      if (!v19)
      {
LABEL_12:
        if (objc_msgSend((id)objc_opt_class(), "_shouldCollectNetworkLogs"))
        {
          -[SSURLSessionManager httpArchiveBuffer](self, "httpArchiveBuffer");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v16);

        }
LABEL_15:
        -[SSURLSessionManager _removeResponseDataForSessionTask:](self, "_removeResponseDataForSessionTask:", v8);
        -[SSURLSessionManager _setRequestData:forSessionTask:](self, "_setRequestData:forSessionTask:", 0, v8);
        -[SSURLSessionManager _removeRecordResponseDataForSessionTask:](self, "_removeRecordResponseDataForSessionTask:", v8);

        goto LABEL_16;
      }
      +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSHTTPArchive writeToDiskWithLogConfig:compressed:error:](v16, "writeToDiskWithLogConfig:compressed:error:", v17, 0, 0);
    }

    goto LABEL_12;
  }
LABEL_16:
  -[SSURLSessionManager _logAPSResultsWithTask:](self, "_logAPSResultsWithTask:", v8);
  -[SSURLSessionManager _logCacheHitForTask:metrics:](self, "_logCacheHitForTask:metrics:", v8, v9);

}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, uint64_t, _QWORD);
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, uint64_t, _QWORD))a6;
  -[SSURLSessionManager _delegateForTask:](self, "_delegateForTask:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "URLSession:task:didReceiveChallenge:completionHandler:", v14, v10, v11, v12);
  else
    v12[2](v12, 1, 0);

}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v12 = a4;
  -[SSURLSessionManager _delegateForTask:](self, "_delegateForTask:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "URLSession:task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:", v14, v12, a5, a6, a7);

}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[SSURLSessionManager _delegateForTask:](self, "_delegateForTask:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "URLSession:task:needNewBodyStream:", v11, v8, v9);

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v17 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[SSURLSessionManager _delegateForTask:](self, "_delegateForTask:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16, "URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:", v17, v12, v13, v14, v15);

}

+ (id)_legacyBagValueForKey:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SSIsDaemon())
  {
    v5 = SSViTunesStoreFramework();
    objc_msgSend(SSVWeakLinkedClassForString(CFSTR("ISURLBagCache"), v5), "sharedCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLBagForContext:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "valueForKey:", v3);
  }
  else
  {
    +[SSURLBag URLBagForContext:](SSURLBag, "URLBagForContext:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKey:error:", v3, 0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_delegateForTask:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__65;
  v16 = __Block_byref_object_dispose__65;
  v17 = 0;
  -[SSURLSessionManager taskDelegatesQueue](self, "taskDelegatesQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SSURLSessionManager__delegateForTask___block_invoke;
  block[3] = &unk_1E47B86D0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __40__SSURLSessionManager__delegateForTask___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "taskDelegates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)_DNSServerIPAddresses
{
  id v2;
  __res_9_state *v3;
  res_9_sockaddr_union *v4;
  unint64_t v5;
  char *v6;
  int v7;
  int v8;
  char *v9;
  socklen_t v10;
  void *v11;
  void *v12;
  id v13;
  char v15[46];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (__res_9_state *)malloc_type_calloc(1uLL, 0x228uLL, 0x10B20402089BC1DuLL);
  if (!res_9_ninit(v3))
  {
    v4 = (res_9_sockaddr_union *)malloc_type_malloc((uint64_t)v3->nscount << 7, 0x1000040AE2C30F4uLL);
    res_9_getservers(v3, v4, v3->nscount);
    if (v3->nscount)
    {
      v5 = 0;
      v6 = &v4->__space[4];
      while (1)
      {
        v7 = *(v6 - 3);
        if (v7 == 30)
          break;
        if (v7 == 2)
        {
          v8 = 2;
          v9 = v6;
          v10 = 16;
          goto LABEL_8;
        }
LABEL_10:
        ++v5;
        v6 += 128;
        if (v5 >= v3->nscount)
          goto LABEL_11;
      }
      v9 = v6 + 4;
      v8 = 30;
      v10 = 46;
LABEL_8:
      inet_ntop(v8, v9, v15, v10);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v2, "addObject:", v11);

      }
      goto LABEL_10;
    }
LABEL_11:
    free(v4);
  }
  res_9_ndestroy(v3);
  free(v3);
  if (objc_msgSend(v2, "count"))
    v12 = v2;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

+ (unint64_t)_messageSizeFromTask:(id)a3 isRequest:(BOOL)a4 delegate:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __CFHTTPMessage *HTTPResponse;
  __CFString *v26;
  __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  if (v6)
  {
    objc_msgSend(v7, "originalRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
LABEL_3:
      objc_msgSend(v9, "allHTTPHeaderFields");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "HTTPBody");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      objc_msgSend(v9, "HTTPMethod");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");
      v33[3] += v14 + 1;

      objc_msgSend(v9, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");
      v33[3] += v17;

      objc_msgSend(v9, "URL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "query");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v9, "URL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "query");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "length");
        v33[3] += v22 + 2;

      }
      v33[3] += 10;
      goto LABEL_22;
    }
    getISURLOperationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "activeURLRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_25;
      goto LABEL_3;
    }
LABEL_19:
    v9 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v7, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    getISURLOperationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_19;
    objc_msgSend(v8, "response");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_25;
  }
  objc_msgSend(v9, "allHeaderFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v8, "rawResponseData"), v23 = (void *)objc_claimAutoreleasedReturnValue(), (v24 = v23) != 0))
  {
    v12 = objc_msgSend(v23, "length");
  }
  else
  {
    v12 = objc_msgSend(v9, "expectedContentLength");
    v24 = 0;
  }
  objc_msgSend(v9, "_CFURLResponse");
  HTTPResponse = (__CFHTTPMessage *)CFURLResponseGetHTTPResponse();
  v26 = (__CFString *)CFHTTPMessageCopyResponseStatusLine(HTTPResponse);
  v27 = v26;
  if (v26)
  {
    v28 = -[__CFString length](v26, "length");
    v33[3] += v28 + 2;
    CFRelease(v27);
  }
  else
  {
    v33[3] += 15;
  }

LABEL_22:
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __63__SSURLSessionManager__messageSizeFromTask_isRequest_delegate___block_invoke;
  v31[3] = &unk_1E47BF5C8;
  v31[4] = &v32;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v31);
  v29 = v12 + 2;
  if (!v12)
    v29 = 0;
  v9 = (void *)(v33[3] + v29 + 2);
  v33[3] = (uint64_t)v9;

LABEL_25:
  _Block_object_dispose(&v32, 8);

  return (unint64_t)v9;
}

void __63__SSURLSessionManager__messageSizeFromTask_isRequest_delegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;

  v5 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(a2, "length");
  v6 = objc_msgSend(v5, "length");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v6;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += 4;
}

- (void)_logCacheHitForTask:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  int v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (_logCacheHitForTask_metrics__onceToken != -1)
    dispatch_once(&_logCacheHitForTask_metrics__onceToken, &__block_literal_global_72);
  if (objc_msgSend((id)_logCacheHitForTask_metrics__cacheConfig, "debugLogsEnabled"))
  {
    objc_msgSend(v7, "transactionMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "response");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    SSSafeCast((uint64_t)v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "statusCode") >= 200 && objc_msgSend(v11, "statusCode") <= 299)
    {
      v12 = objc_msgSend(v9, "resourceFetchType");
      v13 = CFSTR("NO");
      if (v12 == 3)
        v13 = CFSTR("YES");
      v29 = v13;
      objc_msgSend(v11, "allHeaderFields");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Cache-Control"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[SSURLSessionManager _delegateForTask:](self, "_delegateForTask:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)_logCacheHitForTask_metrics__cacheConfig;
      if (!v16)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = objc_msgSend(v16, "shouldLog");
      if (objc_msgSend(v16, "shouldLogToDisk"))
        v17 |= 2u;
      objc_msgSend(v16, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        v17 &= 2u;
      if (v17)
      {
        objc_msgSend(v10, "URL");
        v30 = 138413058;
        v31 = (id)objc_claimAutoreleasedReturnValue();
        v32 = 2112;
        v33 = v15;
        v34 = 2112;
        v35 = v28;
        v36 = 2112;
        v37 = v29;
        LODWORD(v27) = 42;
        v19 = (void *)_os_log_send_and_compose_impl();

        if (v19)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v19, 4, &v30, v27);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          free(v19);
          SSFileLog(v16, CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v20);

        }
      }
      else
      {

      }
    }

  }
}

void __51__SSURLSessionManager__logCacheHitForTask_metrics___block_invoke()
{
  uint64_t v0;
  void *v1;
  SSMutableLogConfig *v2;

  v2 = objc_alloc_init(SSMutableLogConfig);
  -[SSLogConfig setSubsystem:](v2, "setSubsystem:", CFSTR("com.apple.StoreServices"));
  -[SSLogConfig setCategory:](v2, "setCategory:", CFSTR("urlcache"));
  -[SSLogConfig setEnvironment:](v2, "setEnvironment:", 2);
  v0 = -[SSMutableLogConfig copy](v2, "copy");
  v1 = (void *)_logCacheHitForTask_metrics__cacheConfig;
  _logCacheHitForTask_metrics__cacheConfig = v0;

}

- (int)_PIDFromAuditTokenData:(id)a3
{
  if (a3)
    return *((_DWORD *)CFDataGetBytePtr((CFDataRef)a3) + 5);
  else
    return 0;
}

- (void)_removeDelegateForTask:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    -[SSURLSessionManager taskDelegatesQueue](self, "taskDelegatesQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__SSURLSessionManager__removeDelegateForTask___block_invoke;
    block[3] = &unk_1E47BA0B8;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_barrier_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __46__SSURLSessionManager__removeDelegateForTask___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "taskDelegates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

+ (id)_responseDateFromTask:(id)a3 delegate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    getISURLOperationClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "response");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  objc_msgSend(v6, "allHeaderFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("Date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_sendTimingDataForSessionTask:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
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
  v14 = __Block_byref_object_copy__65;
  v15 = __Block_byref_object_dispose__65;
  v16 = 0;
  -[SSURLSessionManager sendTimingDataQueue](self, "sendTimingDataQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SSURLSessionManager__sendTimingDataForSessionTask___block_invoke;
  block[3] = &unk_1E47B86D0;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  v9 = v6;
  dispatch_sync(v5, block);

  LOBYTE(v4) = objc_msgSend((id)v12[5], "BOOLValue");
  _Block_object_dispose(&v11, 8);

  return (char)v4;
}

void __53__SSURLSessionManager__sendTimingDataForSessionTask___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "sendTimingDataMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_sessionWithDelegate:(id)a3 collectTimingData:(BOOL *)a4
{
  id v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  _BOOL8 v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t *v27;
  BOOL v28;
  BOOL v29;
  _QWORD block[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v6 = a3;
  v7 = -[SSURLSessionManager _shouldEnableTLSSessionForDelegate:](self, "_shouldEnableTLSSessionForDelegate:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "metricsLoadURLSessionDuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v23 = v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "metricsLoadURLSamplingPercentage", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      objc_msgSend(v8, "doubleValue");
      v12 = v11;
      objc_msgSend(v10, "doubleValue");
      v14 = +[SSMetricsLoadURLEvent shouldCollectTimingDataWithSessionDuration:samplingPercentage:](SSMetricsLoadURLEvent, "shouldCollectTimingDataWithSessionDuration:samplingPercentage:", v12, v13);
      goto LABEL_10;
    }
  }
  else
  {
    v10 = 0;
  }
  v14 = +[SSMetricsLoadURLEvent shouldCollectTimingDataWithSessionDelegate:](SSMetricsLoadURLEvent, "shouldCollectTimingDataWithSessionDelegate:", v6, v23);
LABEL_10:
  v15 = v14;
  -[SSURLSessionManager _sessionIDWithDelegate:collectTimingData:allowsTLSSessionTickets:](self, "_sessionIDWithDelegate:collectTimingData:allowsTLSSessionTickets:", v6, v14, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__65;
  v37 = __Block_byref_object_dispose__65;
  v38 = 0;
  -[SSURLSessionManager sessionsQueue](self, "sessionsQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SSURLSessionManager__sessionWithDelegate_collectTimingData___block_invoke;
  block[3] = &unk_1E47B86D0;
  v32 = &v33;
  block[4] = self;
  v19 = v16;
  v31 = v19;
  dispatch_sync(v17, block);

  if (!v34[5])
  {
    -[SSURLSessionManager sessionsQueue](self, "sessionsQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __62__SSURLSessionManager__sessionWithDelegate_collectTimingData___block_invoke_2;
    v24[3] = &unk_1E47BF5F0;
    v27 = &v33;
    v24[4] = self;
    v25 = v19;
    v26 = v6;
    v28 = v15;
    v29 = v7;
    dispatch_barrier_sync(v20, v24);

  }
  if (a4)
    *a4 = v15;
  v21 = (id)v34[5];

  _Block_object_dispose(&v33, 8);
  return v21;
}

void __62__SSURLSessionManager__sessionWithDelegate_collectTimingData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "sessions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __62__SSURLSessionManager__sessionWithDelegate_collectTimingData___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _BYTE v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sessions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      v8 &= 2u;
    if (v8)
    {
      v10 = (void *)objc_opt_class();
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v29 = 138412546;
      *(_QWORD *)&v29[4] = v10;
      *(_WORD *)&v29[12] = 2112;
      *(_QWORD *)&v29[14] = v11;
      v12 = v10;
      LODWORD(v28) = 22;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_13:

        v20 = (void *)objc_opt_new();
        objc_msgSend(v20, "setMaxConcurrentOperationCount:", 5);
        v21 = (void *)MEMORY[0x1E0CB39F0];
        objc_msgSend(*(id *)(a1 + 32), "_sessionConfigurationWithDelegate:collectTimingData:allowsTLSSessionTickets:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "sessionWithConfiguration:delegate:delegateQueue:", v22, *(_QWORD *)(a1 + 32), v20);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v25 = *(void **)(v24 + 40);
        *(_QWORD *)(v24 + 40) = v23;

        v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        objc_msgSend(*(id *)(a1 + 32), "sessions");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, *(_QWORD *)(a1 + 40));

        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, v29, v28, *(_OWORD *)v29, *(_QWORD *)&v29[16]);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v6, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v9);
    }

    goto LABEL_13;
  }
}

- (id)_sessionIDWithDelegate:(id)a3 collectTimingData:(BOOL)a4 allowsTLSSessionTickets:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("com.apple.itunesstore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "sourceAppBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      objc_msgSend(v8, "sourceAppBundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendFormat:", CFSTR(".client-%@"), v12);

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "sourceAppAuditTokenData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v8, "sourceAppAuditTokenData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendFormat:", CFSTR(".auditToken-%d-%ld"), -[SSURLSessionManager _PIDFromAuditTokenData:](self, "_PIDFromAuditTokenData:", v14), objc_msgSend(v14, "hash"));

    }
  }
  if (-[SSURLSessionManager _shouldSetCookiesForDelegate:](self, "_shouldSetCookiesForDelegate:", v8))
    objc_msgSend(v9, "appendString:", CFSTR(".setcookies"));
  if (v6)
    objc_msgSend(v9, "appendString:", CFSTR(".collecttimingdata"));
  if (-[SSURLSessionManager _shouldRequireCelluarForDelegate:](self, "_shouldRequireCelluarForDelegate:", v8))
  {
    v15 = CFSTR(".requirescellular");
  }
  else
  {
    if (-[SSURLSessionManager _shouldDisableCellularForDelegate:](self, "_shouldDisableCellularForDelegate:", v8))
      goto LABEL_16;
    v15 = CFSTR(".allowscellular");
  }
  objc_msgSend(v9, "appendString:", v15);
LABEL_16:
  -[SSURLSessionManager _URLCacheIDForDelegate:](self, "_URLCacheIDForDelegate:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
    objc_msgSend(v9, "appendFormat:", CFSTR(".cache-%@"), v16);
  if (v5)
    objc_msgSend(v9, "appendString:", CFSTR(".allowstls"));

  return v9;
}

- (id)_sessionConfigurationWithDelegate:(id)a3 collectTimingData:(BOOL)a4 allowsTLSSessionTickets:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SSURLSessionManager _shouldRequireCelluarForDelegate:](self, "_shouldRequireCelluarForDelegate:", v8))
  {
    objc_msgSend(v9, "set_CTDataConnectionServiceType:", *MEMORY[0x1E0CA7368]);
    v10 = 1;
  }
  else
  {
    v10 = -[SSURLSessionManager _shouldDisableCellularForDelegate:](self, "_shouldDisableCellularForDelegate:", v8) ^ 1;
  }
  objc_msgSend(v9, "setAllowsCellularAccess:", v10);
  objc_msgSend(v9, "set_allowsTLSSessionTickets:", v5);
  objc_msgSend(v9, "setHTTPShouldSetCookies:", -[SSURLSessionManager _shouldSetCookiesForDelegate:](self, "_shouldSetCookiesForDelegate:", v8));
  objc_msgSend(v9, "setHTTPShouldUsePipelining:", 1);
  if (v6)
    objc_msgSend(v9, "set_timingDataOptions:", 7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "sourceAppBundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      objc_msgSend(v8, "sourceAppBundleID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "set_sourceApplicationBundleIdentifier:", v13);

      objc_msgSend(v9, "set_infersDiscretionaryFromOriginatingClient:", 1);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "sourceAppAuditTokenData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v8, "sourceAppAuditTokenData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "set_sourceApplicationAuditTokenData:", v15);

      objc_msgSend(v9, "set_infersDiscretionaryFromOriginatingClient:", 1);
    }
  }
  -[SSURLSessionManager _URLCacheForDelegate:](self, "_URLCacheForDelegate:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16
    || objc_msgSend((id)objc_opt_class(), "_shouldCreateLocalCache")
    && (v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3990]), "initWithMemoryCapacity:diskCapacity:diskPath:", 0, 20971520, CFSTR("StoreServices"))) != 0)
  {
    objc_msgSend(v9, "setURLCache:", v16);

  }
  if (-[NSArray count](self->_customURLProtocols, "count"))
  {
    v17 = (void *)-[NSArray mutableCopy](self->_customURLProtocols, "mutableCopy");
    v18 = objc_msgSend(v17, "count");
    if (v18 - 1 >= 0)
    {
      v19 = v18;
      do
      {
        if ((objc_msgSend((id)objc_msgSend(v17, "objectAtIndexedSubscript:", --v19), "isSubclassOfClass:", objc_opt_class()) & 1) == 0)objc_msgSend(v17, "removeObjectAtIndex:", v19);
      }
      while (v19 > 0);
    }
    objc_msgSend(v9, "protocolClasses");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v20);

    v21 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v9, "setProtocolClasses:", v21);

  }
  return v9;
}

- (void)_setDelegate:(id)a3 forTask:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    objc_initWeak(&location, self);
    -[SSURLSessionManager taskDelegatesQueue](self, "taskDelegatesQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__SSURLSessionManager__setDelegate_forTask___block_invoke;
    v10[3] = &unk_1E47BAB90;
    objc_copyWeak(&v13, &location);
    v11 = v6;
    v12 = v8;
    dispatch_barrier_async(v9, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __44__SSURLSessionManager__setDelegate_forTask___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "taskDelegates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_setSendTimingData:(id)a3 forSessionTask:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  -[SSURLSessionManager sendTimingDataQueue](self, "sendTimingDataQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__SSURLSessionManager__setSendTimingData_forSessionTask___block_invoke;
  v11[3] = &unk_1E47BAB90;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __57__SSURLSessionManager__setSendTimingData_forSessionTask___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v6 = WeakRetained;
  objc_msgSend(WeakRetained, "sendTimingDataMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)_setTaskMetrics:(id)a3 forSessionTask:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  -[SSURLSessionManager taskMetricsQueue](self, "taskMetricsQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__SSURLSessionManager__setTaskMetrics_forSessionTask___block_invoke;
  v11[3] = &unk_1E47BAB90;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_sync(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __54__SSURLSessionManager__setTaskMetrics_forSessionTask___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v6 = WeakRetained;
  objc_msgSend(WeakRetained, "taskMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

+ (BOOL)_shouldCreateLocalCache
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0CB3990], "sharedURLCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "diskCapacity") == 0;

  return v3;
}

- (BOOL)_shouldDisableCellularForDelegate:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "shouldDisableCellular");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_shouldRequireCelluarForDelegate:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "shouldRequireCellular");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_shouldEnableTLSSessionForDelegate:(id)a3
{
  id v3;
  void *v4;
  int AppBooleanValue;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  CFPropertyListRef *v18;

  v3 = a3;
  CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("TLSLastSampleDate"), CFSTR("com.apple.itunesstored"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("TLSLastSampleResult"), CFSTR("com.apple.itunesstored"), 0);
  objc_msgSend((id)objc_opt_class(), "bagValueForKey:delegate:type:", CFSTR("TLSSamplingPercentage"), v3, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  objc_msgSend((id)objc_opt_class(), "bagValueForKey:delegate:type:", CFSTR("TLSSamplingSessionDuration"), v3, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v13 = AppBooleanValue != 0,
        objc_msgSend(v4, "dateByAddingTimeInterval:", v11 / 1000.0),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v12, "compare:", v14),
        v14,
        v15 != -1))
  {
    objc_msgSend((id)objc_opt_class(), "_randomDouble");
    if (v16 == 0.0)
    {
      v13 = 0;
    }
    else
    {
      v17 = v16;
      CFPreferencesSetAppValue(CFSTR("TLSLastSampleDate"), v12, CFSTR("com.apple.itunesstored"));
      v13 = v17 <= v8;
      v18 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
      if (v17 > v8)
        v18 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
      CFPreferencesSetAppValue(CFSTR("TLSLastSampleResult"), *v18, CFSTR("com.apple.itunesstored"));
    }
  }

  return v13;
}

- (BOOL)_shouldSetCookiesForDelegate:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "shouldSetCookies");
  else
    v4 = 0;

  return v4;
}

- (id)_taskMetricsForSessionTask:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  id location;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__65;
  v18 = __Block_byref_object_dispose__65;
  v19 = 0;
  objc_initWeak(&location, self);
  -[SSURLSessionManager taskMetricsQueue](self, "taskMetricsQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__SSURLSessionManager__taskMetricsForSessionTask___block_invoke;
  v9[3] = &unk_1E47BF618;
  objc_copyWeak(&v12, &location);
  v10 = v4;
  v11 = &v14;
  v6 = v4;
  dispatch_sync(v5, v9);

  v7 = (id)v15[5];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __50__SSURLSessionManager__taskMetricsForSessionTask___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "taskMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)_tidStateForTask:(id)a3 delegate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "originalRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_2;
  getISURLOperationClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "activeURLRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_7;
LABEL_2:
  objc_msgSend(v6, "allHTTPHeaderFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("X-Apple-TID-State"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v8;
}

- (id)_URLCacheForDelegate:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "URLCacheID"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v4,
        v5)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "URLCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_URLCacheIDForDelegate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v3, "URLCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "URLCacheID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_5:
    v4 = 0;
  }
LABEL_6:

  return v4;
}

- (void)_appendResponseData:(id)a3 forSessionTask:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend((id)objc_opt_class(), "_shouldCollectNetworkLogs"))
  {
    v8 = (void *)objc_msgSend(v6, "copy");
    objc_initWeak(&location, self);
    -[SSURLSessionManager responseDataQueue](self, "responseDataQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__SSURLSessionManager__appendResponseData_forSessionTask___block_invoke;
    v11[3] = &unk_1E47BAB90;
    objc_copyWeak(&v14, &location);
    v12 = v7;
    v13 = v8;
    v10 = v8;
    dispatch_barrier_async(v9, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __58__SSURLSessionManager__appendResponseData_forSessionTask___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "responseData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    objc_msgSend(WeakRetained, "responseData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(v3, "appendData:", *(_QWORD *)(a1 + 40));

}

+ (BOOL)_fetchedFromCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_taskMetricsForSessionTask:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v6, "transactionMetrics", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "resourceFetchType") == 3)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

+ (id)_fetchNetworkQualityReports
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  +[SSNetworkQualityInquiry sharedInstance](SSNetworkQualityInquiry, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "investigateNetworks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SSURLSessionManager__fetchNetworkQualityReports__block_invoke;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v7[4] = a1;
  objc_msgSend(v4, "addErrorBlock:", v7);
  objc_msgSend(v4, "resultWithTimeout:error:", 0, 10.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __50__SSURLSessionManager__fetchNetworkQualityReports__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  *(_DWORD *)v16 = 138412546;
  *(_QWORD *)&v16[4] = objc_opt_class();
  *(_WORD *)&v16[12] = 2112;
  *(_QWORD *)&v16[14] = v2;
  v7 = *(id *)&v16[4];
  LODWORD(v15) = 22;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, v16, v15, *(_OWORD *)v16, *(_QWORD *)&v16[16], v17);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
LABEL_11:

  }
}

- (void)_listenForLowMemoryWarning
{
  OS_dispatch_source *v3;
  OS_dispatch_source *memoryPressureSource;
  NSObject *v5;
  _QWORD handler[5];
  id v7;
  id location;

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 3uLL, 0);
  memoryPressureSource = self->_memoryPressureSource;
  self->_memoryPressureSource = v3;

  if (self->_memoryPressureSource)
  {
    objc_initWeak(&location, self);
    v5 = self->_memoryPressureSource;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __49__SSURLSessionManager__listenForLowMemoryWarning__block_invoke;
    handler[3] = &unk_1E47BA0B8;
    objc_copyWeak(&v7, &location);
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    dispatch_resume((dispatch_object_t)self->_memoryPressureSource);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __49__SSURLSessionManager__listenForLowMemoryWarning__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  int v27;
  NSObject *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[24];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(v3 + 16);
  *(_DWORD *)(v3 + 16) = dispatch_source_get_data(*(dispatch_source_t *)(v3 + 8));
  v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v4 == v5)
    goto LABEL_31;
  if (v5 == 1)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26 = objc_msgSend(v25, "shouldLog");
    if (objc_msgSend(v25, "shouldLogToDisk"))
      v27 = v26 | 2;
    else
      v27 = v26;
    objc_msgSend(v25, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      v27 &= 2u;
    if (v27)
    {
      *(_DWORD *)v38 = 138412290;
      *(_QWORD *)&v38[4] = objc_opt_class();
      v29 = *(id *)&v38[4];
      LODWORD(v37) = 12;
      v30 = (void *)_os_log_send_and_compose_impl();

      if (!v30)
      {
LABEL_28:

        objc_msgSend(WeakRetained, "httpArchiveBuffer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setMaxSize:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
LABEL_30:

        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v30, 4, v38, v37, *(_QWORD *)v38, *(_QWORD *)&v38[8]);
      v28 = objc_claimAutoreleasedReturnValue();
      free(v30);
      SSFileLog(v25, CFSTR("%@"), v31, v32, v33, v34, v35, v36, (uint64_t)v28);
    }

    goto LABEL_28;
  }
  if (v5 == 2)
  {
    objc_msgSend(WeakRetained, "httpArchiveBuffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend(v6, "maxSize");

    objc_msgSend(WeakRetained, "httpArchiveBuffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 >= 0x28)
      v9 = 20;
    else
      v9 = v8 >> 1;
    objc_msgSend(WeakRetained, "httpArchiveBuffer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMaxSize:", v9);

    objc_msgSend(WeakRetained, "httpArchiveBuffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMaxSize:", 20);

    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = objc_msgSend(v12, "shouldLog");
    if (objc_msgSend(v12, "shouldLogToDisk"))
      v14 = v13 | 2;
    else
      v14 = v13;
    objc_msgSend(v12, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      v14 &= 2u;
    if (v14)
    {
      *(_DWORD *)v38 = 138412546;
      *(_QWORD *)&v38[4] = objc_opt_class();
      *(_WORD *)&v38[12] = 2048;
      *(_QWORD *)&v38[14] = v8 - v9;
      v16 = *(id *)&v38[4];
      LODWORD(v37) = 22;
      v17 = (void *)_os_log_send_and_compose_impl();

      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v17, 4, v38, v37, *(_OWORD *)v38, *(_QWORD *)&v38[16], v39);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        free(v17);
        SSFileLog(v12, CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v18);

      }
    }
    else
    {

    }
    goto LABEL_30;
  }
LABEL_31:

}

+ (double)_randomDouble
{
  if (_randomDouble_onceToken != -1)
    dispatch_once(&_randomDouble_onceToken, &__block_literal_global_136);
  return drand48();
}

void __36__SSURLSessionManager__randomDouble__block_invoke()
{
  uint32_t v0;

  v0 = arc4random();
  srand48(v0);
}

- (void)_removeRecordResponseDataForSessionTask:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_shouldCollectNetworkLogs"))
  {
    objc_initWeak(&location, self);
    -[SSURLSessionManager recordResponseQueue](self, "recordResponseQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__SSURLSessionManager__removeRecordResponseDataForSessionTask___block_invoke;
    block[3] = &unk_1E47BA0B8;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_barrier_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __63__SSURLSessionManager__removeRecordResponseDataForSessionTask___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "recordResponseMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

- (void)_removeResponseDataForSessionTask:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_shouldCollectNetworkLogs"))
  {
    objc_initWeak(&location, self);
    -[SSURLSessionManager responseDataQueue](self, "responseDataQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__SSURLSessionManager__removeResponseDataForSessionTask___block_invoke;
    block[3] = &unk_1E47BA0B8;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_barrier_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __57__SSURLSessionManager__removeResponseDataForSessionTask___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "responseData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

- (id)_requestDataForSessionTask:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_shouldCollectNetworkLogs"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__65;
    v15 = __Block_byref_object_dispose__65;
    v16 = 0;
    -[SSURLSessionManager requestDataQueue](self, "requestDataQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__SSURLSessionManager__requestDataForSessionTask___block_invoke;
    block[3] = &unk_1E47B86D0;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(v5, block);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __50__SSURLSessionManager__requestDataForSessionTask___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "requestData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_responseDataForSessionTask:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_shouldCollectNetworkLogs"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__65;
    v15 = __Block_byref_object_dispose__65;
    v16 = 0;
    -[SSURLSessionManager responseDataQueue](self, "responseDataQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SSURLSessionManager__responseDataForSessionTask___block_invoke;
    block[3] = &unk_1E47B86D0;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(v5, block);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __51__SSURLSessionManager__responseDataForSessionTask___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "responseData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_saveHTTPArchiveBufferToDiskDecompressed:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t i;
  NSObject *v24;
  void *v25;
  int *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  int v34;
  uint64_t v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_opt_class(), "_shouldCollectNetworkLogs"))
    return 0;
  -[SSURLSessionManager httpArchiveBuffer](self, "httpArchiveBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    +[SSHTTPArchive merge:withEstimatedFileSizeLimit:](SSHTTPArchive, "merge:withEstimatedFileSizeLimit:", v6, 4000);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      v10 &= 2u;
    if (v10)
    {
      v34 = 134217984;
      v35 = objc_msgSend(v7, "count");
      LODWORD(v28) = 12;
      v27 = &v34;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_14:

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v6 = v7;
        v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v30;
          v22 = !v3;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v30 != v21)
                objc_enumerationMutation(v6);
              objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "writeToDiskWithLogConfig:compressed:error:", 0, v22, 0, v27);
            }
            v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          }
          while (v20);
        }

        dispatch_get_global_queue(-32768, 0);
        v24 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v24, &__block_literal_global_137_0);

        +[SSHTTPArchive outputDirectoryForLogConfig:](SSHTTPArchive, "outputDirectoryForLogConfig:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v34, v28);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog(v8, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v11);
    }

    goto LABEL_14;
  }
  v25 = 0;
LABEL_24:

  return v25;
}

void __64__SSURLSessionManager__saveHTTPArchiveBufferToDiskDecompressed___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateByAddingTimeInterval:", -2419200.0);
  v1 = (id)objc_claimAutoreleasedReturnValue();

  +[SSHTTPArchive removeLogsWithLogConfig:olderThanDate:](SSHTTPArchive, "removeLogsWithLogConfig:olderThanDate:", 0, v1);
}

- (void)_setRequestData:(id)a3 forSessionTask:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend((id)objc_opt_class(), "_shouldCollectNetworkLogs"))
  {
    v8 = (void *)objc_msgSend(v6, "copy");
    objc_initWeak(&location, self);
    -[SSURLSessionManager requestDataQueue](self, "requestDataQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__SSURLSessionManager__setRequestData_forSessionTask___block_invoke;
    v11[3] = &unk_1E47BAB90;
    objc_copyWeak(&v14, &location);
    v12 = v8;
    v13 = v7;
    v10 = v8;
    dispatch_barrier_async(v9, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __54__SSURLSessionManager__setRequestData_forSessionTask___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v6 = WeakRetained;
  objc_msgSend(WeakRetained, "requestData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

+ (BOOL)_shouldCollectNetworkLogs
{
  if (_shouldCollectNetworkLogs_onceToken != -1)
    dispatch_once(&_shouldCollectNetworkLogs_onceToken, &__block_literal_global_138_0);
  return (_shouldCollectNetworkLogs_shouldCollectLogs & 1) == 0;
}

void __48__SSURLSessionManager__shouldCollectNetworkLogs__block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;
  id v4;

  if ((SSIsInternalBuild() & 1) != 0 && !SSDebugShouldDisableNetworkLogging())
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "outputDirectory");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "fileExistsAtPath:", v4);

    if ((v2 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

    }
    if (!SSFileIsLocalWritable(v4))
      _shouldCollectNetworkLogs_shouldCollectLogs = 1;

  }
  else
  {
    _shouldCollectNetworkLogs_shouldCollectLogs = 1;
  }
}

- (BOOL)_shouldRecordResponseBodyForDataTask:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v17[5];
  id v18;
  char v19;
  _QWORD block[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_shouldCollectNetworkLogs"))
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__65;
    v27 = __Block_byref_object_dispose__65;
    v28 = 0;
    -[SSURLSessionManager recordResponseQueue](self, "recordResponseQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__SSURLSessionManager__shouldRecordResponseBodyForDataTask___block_invoke;
    block[3] = &unk_1E47B86D0;
    v22 = &v23;
    block[4] = self;
    v7 = v4;
    v21 = v7;
    dispatch_sync(v5, block);

    v8 = (void *)v24[5];
    if (v8)
    {
      v9 = objc_msgSend(v8, "BOOLValue");
    }
    else
    {
      objc_msgSend(v7, "response");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v7, "response");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "MIMEType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v14, "containsString:", CFSTR("image")) & 1) != 0)
        {
          v9 = 0;
        }
        else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("application/json")) & 1) != 0
               || (objc_msgSend(v14, "isEqualToString:", CFSTR("application/javascript")) & 1) != 0
               || (objc_msgSend(v14, "isEqualToString:", CFSTR("application/x-javascript")) & 1) != 0
               || (objc_msgSend(v14, "isEqualToString:", CFSTR("text/html")) & 1) != 0
               || (objc_msgSend(v14, "isEqualToString:", CFSTR("text/xml")) & 1) != 0)
        {
          v9 = 1;
        }
        else
        {
          v9 = objc_msgSend(v14, "isEqualToString:", CFSTR("text/xml+itml"));
        }
        -[SSURLSessionManager recordResponseQueue](self, "recordResponseQueue");
        v15 = objc_claimAutoreleasedReturnValue();
        v17[0] = v6;
        v17[1] = 3221225472;
        v17[2] = __60__SSURLSessionManager__shouldRecordResponseBodyForDataTask___block_invoke_2;
        v17[3] = &unk_1E47BF6C0;
        v17[4] = self;
        v18 = v7;
        v19 = v9;
        dispatch_barrier_sync(v15, v17);

      }
      else
      {
        v9 = 0;
      }
    }

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __60__SSURLSessionManager__shouldRecordResponseBodyForDataTask___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "recordResponseMap");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __60__SSURLSessionManager__shouldRecordResponseBodyForDataTask___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordResponseMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

}

- (void)_logAPSResultsWithTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  int v30;
  id v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  __CFString *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SSURLSessionManager _taskMetricsForSessionTask:](self, "_taskMetricsForSessionTask:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transactionMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "_apsRelayAttempted"))
  {
    if (objc_msgSend(v7, "_apsRelaySucceeded"))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v29 = v8;
    if (objc_msgSend(v7, "_apsRelayAttempted"))
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    v10 = v9;
    objc_msgSend(v4, "originalRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v14, "shouldLog");
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      v18 = v16;
    else
      v18 = v16 & 2;
    if (v18)
    {
      v30 = 138544130;
      v31 = (id)objc_opt_class();
      v32 = 2114;
      v33 = v10;
      v34 = 2114;
      v35 = v29;
      v36 = 2112;
      v37 = v13;
      v19 = v31;
      LODWORD(v28) = 42;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v20, 4, &v30, v28);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        free(v20);
        SSFileLog(v14, CFSTR("%@"), v22, v23, v24, v25, v26, v27, (uint64_t)v21);

      }
    }
    else
    {

    }
  }

}

- (void)_setAPSTopicWithTask:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SSURLSessionManager _shouldEnableAPSRWithTask:](self, "_shouldEnableAPSRWithTask:", v4))
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      v7 &= 2u;
    if (v7)
    {
      LODWORD(v18) = 138543362;
      *(_QWORD *)((char *)&v18 + 4) = objc_opt_class();
      v9 = *(id *)((char *)&v18 + 4);
      LODWORD(v17) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_13:

        objc_msgSend(v4, "set_APSRelayTopic:", CFSTR("com.apple.private.alloy.itunes.apsr"));
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v18, v17, v18);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (BOOL)_shouldEnableAPSRWithTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SSURLSessionManager _delegateForTask:](self, "_delegateForTask:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "requestProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v5, "isURLBagRequest") & 1) != 0
    || (objc_msgSend(v6, "shouldDisableReversePush") & 1) != 0)
  {
    goto LABEL_9;
  }
  v7 = objc_msgSend(MEMORY[0x1E0CFDA48], "reversePushEnabled");
  if (v7 == 1)
    goto LABEL_13;
  if (v7 == 2)
  {
LABEL_9:
    LOBYTE(v8) = 0;
    goto LABEL_35;
  }
  if ((objc_msgSend(v6, "shouldDisableReversePushSampling") & 1) != 0)
    goto LABEL_13;
  objc_msgSend((id)objc_opt_class(), "_randomDouble");
  v10 = v9;
  objc_msgSend((id)objc_opt_class(), "bagValueForKey:delegate:type:", CFSTR("aps-sampling-percentage"), v5, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  LOBYTE(v8) = 0;
  if (v10 > 0.0 && v10 <= v13)
  {
LABEL_13:
    objc_msgSend(v4, "originalRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(v6, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        objc_msgSend(v6, "URLBagKey");
        v24 = objc_claimAutoreleasedReturnValue();
        if (!v24)
          goto LABEL_9;
        v25 = (void *)v24;
        objc_msgSend((id)objc_opt_class(), "bagValueForKey:delegate:type:", v24, v5, 6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          goto LABEL_9;
      }
    }
    objc_msgSend(v15, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "bagValueForKey:delegate:type:", CFSTR("aps-enabled-patterns"), v5, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = 0;
        goto LABEL_21;
      }
      v18 = v17;
    }
    v19 = v18;
LABEL_21:
    if (!objc_msgSend(v19, "count"))
    {

      v19 = &unk_1E481E930;
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v20 = v19;
    v8 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v8)
    {
      v26 = v15;
      v21 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v20);
          if (objc_msgSend(v16, "rangeOfString:options:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), 1024) != 0x7FFFFFFFFFFFFFFFLL)
          {
            LOBYTE(v8) = 1;
            goto LABEL_33;
          }
        }
        v8 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v8)
          continue;
        break;
      }
LABEL_33:
      v15 = v26;
    }

  }
LABEL_35:

  return v8;
}

+ (id)_bagPerformanceValuesWithDelegate:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_metricsDictionaryWithDelegate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("performance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_metricsDictionaryWithDelegate:(id)a3
{
  return (id)objc_msgSend(a1, "bagValueForKey:delegate:type:", CFSTR("metrics"), a3, 2);
}

+ (id)bagValueForKey:(id)a3 delegate:(id)a4 type:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v29;
  void *v30;
  int v31;
  id *v32;
  uint64_t v33;
  __CFString *v34;
  __CFString *v35;
  void *v36;
  int v37;
  int v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  void *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  const __CFString *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v9, "bag"), (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = (void *)v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = objc_msgSend(v9, "isURLBagRequest");
    else
      v12 = 0;
    objc_msgSend(v11, "profileConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bagKeys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "containsObject:", v8);

    v14 = CFSTR("YES");
    if ((v12 & 1) != 0 || !v31)
    {
LABEL_7:
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", v49);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v16 = objc_msgSend(v15, "shouldLog");
      if (objc_msgSend(v15, "shouldLogToDisk"))
        v17 = v16 | 2;
      else
        v17 = v16;
      objc_msgSend(v15, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        v17 &= 2u;
      if (v17)
      {
        v19 = (void *)objc_opt_class();
        v58 = 138543874;
        v59 = v19;
        v60 = 2114;
        v61 = v8;
        v62 = 2114;
        v63 = v14;
        v20 = v19;
        LODWORD(v50) = 32;
        v21 = (void *)_os_log_send_and_compose_impl();

        if (!v21)
        {
LABEL_18:

          v13 = 0;
          goto LABEL_19;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v21, 4, &v58, v50);
        v18 = objc_claimAutoreleasedReturnValue();
        free(v21);
        SSFileLog(v15, CFSTR("%@"), v22, v23, v24, v25, v26, v27, (uint64_t)v18);
      }

      goto LABEL_18;
    }
    switch(a5)
    {
      case 0uLL:
        v57 = 0;
        v32 = (id *)&v57;
        objc_msgSend(v11, "arrayForKey:error:", v8, &v57);
        v33 = objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      case 1uLL:
        v56 = 0;
        v32 = (id *)&v56;
        objc_msgSend(v11, "BOOLForKey:error:", v8, &v56);
        v33 = objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      case 2uLL:
        v55 = 0;
        v32 = (id *)&v55;
        objc_msgSend(v11, "dictionaryForKey:error:", v8, &v55);
        v33 = objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      case 3uLL:
        v54 = 0;
        v32 = (id *)&v54;
        objc_msgSend(v11, "doubleForKey:error:", v8, &v54);
        v33 = objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      case 4uLL:
        v53 = 0;
        v32 = (id *)&v53;
        objc_msgSend(v11, "integerForKey:error:", v8, &v53);
        v33 = objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      case 5uLL:
        v52 = 0;
        v32 = (id *)&v52;
        objc_msgSend(v11, "stringForKey:error:", v8, &v52);
        v33 = objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      case 6uLL:
        v51 = 0;
        v32 = (id *)&v51;
        objc_msgSend(v11, "URLForKey:error:", v8, &v51);
        v33 = objc_claimAutoreleasedReturnValue();
LABEL_32:
        v13 = (void *)v33;
        v34 = (__CFString *)*v32;
        if (!v34)
          break;
        v35 = v34;
        +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v36)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v37 = objc_msgSend(v36, "shouldLog");
        if (objc_msgSend(v36, "shouldLogToDisk"))
          v38 = v37 | 2;
        else
          v38 = v37;
        objc_msgSend(v36, "OSLogObject");
        v39 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          v38 &= 2u;
        if (!v38)
          goto LABEL_43;
        v40 = (void *)objc_opt_class();
        v58 = 138412802;
        v59 = v40;
        v60 = 2112;
        v61 = v8;
        v62 = 2112;
        v63 = v35;
        v41 = v40;
        LODWORD(v50) = 32;
        v49 = &v58;
        v42 = (void *)_os_log_send_and_compose_impl();

        if (v42)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v42, 4, &v58, v50);
          v39 = objc_claimAutoreleasedReturnValue();
          free(v42);
          SSFileLog(v36, CFSTR("%@"), v43, v44, v45, v46, v47, v48, (uint64_t)v39);
LABEL_43:

        }
        v14 = CFSTR("YES");
        break;
      default:
        v13 = 0;
        break;
    }
  }
  else
  {
    objc_msgSend(a1, "_legacyBagValueForKey:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v14 = CFSTR("NO");
  }
  if (!v13)
    goto LABEL_7;
LABEL_19:

  return v13;
}

- (void)_insertEventIntoDatabase:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    -[SSURLSessionManager eventQueue](self, "eventQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__SSURLSessionManager__insertEventIntoDatabase_delegate___block_invoke;
    block[3] = &unk_1E47BF708;
    objc_copyWeak(&v12, &location);
    block[4] = self;
    v10 = v7;
    v11 = v6;
    dispatch_async(v8, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __57__SSURLSessionManager__insertEventIntoDatabase_delegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  SSMetricsController *v4;
  void *v5;
  SSMetricsConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id WeakRetained;

  +[SSTransactionStore defaultStore](SSTransactionStore, "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "takeKeepAliveWithTransactionID:", CFSTR("com.apple.storeservices.metricsEventTransactionIdentifier"));

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "metricsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(SSMetricsController);
    objc_msgSend(WeakRetained, "setMetricsController:", v4);

    objc_msgSend((id)objc_opt_class(), "_metricsDictionaryWithDelegate:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[SSMetricsConfiguration initWithGlobalConfiguration:]([SSMetricsConfiguration alloc], "initWithGlobalConfiguration:", v5);
      objc_msgSend(WeakRetained, "metricsController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGlobalConfiguration:", v6);

    }
  }
  objc_msgSend(WeakRetained, "metricsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reportingURLString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (objc_msgSend(*(id *)(a1 + 48), "requestURL"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "containsString:", v10),
        v11,
        (v12 & 1) == 0))
  {
    objc_msgSend(WeakRetained, "metricsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "insertEvent:withCompletionHandler:", *(_QWORD *)(a1 + 48), &__block_literal_global_172);
  }
  else
  {
    +[SSTransactionStore defaultStore](SSTransactionStore, "defaultStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "releaseKeepAliveWithTransactionID:", CFSTR("com.apple.storeservices.metricsEventTransactionIdentifier"));
  }

}

void __57__SSURLSessionManager__insertEventIntoDatabase_delegate___block_invoke_2()
{
  id v0;

  +[SSTransactionStore defaultStore](SSTransactionStore, "defaultStore");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "releaseKeepAliveWithTransactionID:", CFSTR("com.apple.storeservices.metricsEventTransactionIdentifier"));

}

+ (double)_localTimeIntervalToServerTimeInterval:(double)a3
{
  if (_localTimeIntervalToServerTimeInterval__onceToken != -1)
    dispatch_once(&_localTimeIntervalToServerTimeInterval__onceToken, &__block_literal_global_173);
  return *(double *)&_localTimeIntervalToServerTimeInterval__timeIntervalBetweenReferenceDates + a3;
}

void __62__SSURLSessionManager__localTimeIntervalToServerTimeInterval___block_invoke()
{
  void *v0;
  uint64_t v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v0);
  _localTimeIntervalToServerTimeInterval__timeIntervalBetweenReferenceDates = v1;

}

+ (id)_resolvedIPAddressFromTask:(id)a3
{
  void *v3;
  uint64_t v4;
  const __CFData *v5;
  const __CFData *v6;
  const UInt8 *BytePtr;
  socklen_t v8;
  char *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_CFURLResponse");

  if (!v4)
    return 0;
  v5 = (const __CFData *)CFURLResponseCopyPeerAddress();
  if (!v5)
    return 0;
  v6 = v5;
  BytePtr = CFDataGetBytePtr(v5);
  v8 = *BytePtr;
  v9 = (char *)v12 - (((_WORD)v8 + 15) & 0x1F0);
  inet_ntop(BytePtr[1], BytePtr + 4, v9, v8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v6);
  return v10;
}

+ (double)_timingDataMetricToServerTimeInterval:(id)a3
{
  double v4;
  double result;

  objc_msgSend(a3, "doubleValue");
  if (v4 == 0.0)
    return 0.0;
  objc_msgSend(a1, "_localTimeIntervalToServerTimeInterval:");
  return result;
}

- (NSArray)customURLProtocols
{
  return self->_customURLProtocols;
}

- (void)setCustomURLProtocols:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventQueue, a3);
}

- (SSCircularBuffer)httpArchiveBuffer
{
  return self->_httpArchiveBuffer;
}

- (void)setHttpArchiveBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_httpArchiveBuffer, a3);
}

- (SSMetricsController)metricsController
{
  return self->_metricsController;
}

- (void)setMetricsController:(id)a3
{
  objc_storeStrong((id *)&self->_metricsController, a3);
}

- (NSMutableDictionary)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
  objc_storeStrong((id *)&self->_requestData, a3);
}

- (OS_dispatch_queue)requestDataQueue
{
  return self->_requestDataQueue;
}

- (void)setRequestDataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestDataQueue, a3);
}

- (NSMutableDictionary)taskMetrics
{
  return self->_taskMetrics;
}

- (void)setTaskMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_taskMetrics, a3);
}

- (OS_dispatch_queue)taskMetricsQueue
{
  return self->_taskMetricsQueue;
}

- (void)setTaskMetricsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_taskMetricsQueue, a3);
}

- (NSMutableDictionary)responseData
{
  return self->_responseData;
}

- (void)setResponseData:(id)a3
{
  objc_storeStrong((id *)&self->_responseData, a3);
}

- (OS_dispatch_queue)responseDataQueue
{
  return self->_responseDataQueue;
}

- (void)setResponseDataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_responseDataQueue, a3);
}

- (NSMutableDictionary)recordResponseMap
{
  return self->_recordResponseMap;
}

- (void)setRecordResponseMap:(id)a3
{
  objc_storeStrong((id *)&self->_recordResponseMap, a3);
}

- (OS_dispatch_queue)recordResponseQueue
{
  return self->_recordResponseQueue;
}

- (void)setRecordResponseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_recordResponseQueue, a3);
}

- (NSMutableDictionary)sendTimingDataMap
{
  return self->_sendTimingDataMap;
}

- (void)setSendTimingDataMap:(id)a3
{
  objc_storeStrong((id *)&self->_sendTimingDataMap, a3);
}

- (OS_dispatch_queue)sendTimingDataQueue
{
  return self->_sendTimingDataQueue;
}

- (void)setSendTimingDataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_sendTimingDataQueue, a3);
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
  objc_storeStrong((id *)&self->_sessions, a3);
}

- (OS_dispatch_queue)sessionsQueue
{
  return self->_sessionsQueue;
}

- (void)setSessionsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_sessionsQueue, a3);
}

- (NSMapTable)taskDelegates
{
  return self->_taskDelegates;
}

- (void)setTaskDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_taskDelegates, a3);
}

- (OS_dispatch_queue)taskDelegatesQueue
{
  return self->_taskDelegatesQueue;
}

- (void)setTaskDelegatesQueue:(id)a3
{
  objc_storeStrong((id *)&self->_taskDelegatesQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskDelegatesQueue, 0);
  objc_storeStrong((id *)&self->_taskDelegates, 0);
  objc_storeStrong((id *)&self->_sessionsQueue, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_sendTimingDataQueue, 0);
  objc_storeStrong((id *)&self->_sendTimingDataMap, 0);
  objc_storeStrong((id *)&self->_recordResponseQueue, 0);
  objc_storeStrong((id *)&self->_recordResponseMap, 0);
  objc_storeStrong((id *)&self->_responseDataQueue, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_taskMetricsQueue, 0);
  objc_storeStrong((id *)&self->_taskMetrics, 0);
  objc_storeStrong((id *)&self->_requestDataQueue, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_httpArchiveBuffer, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_customURLProtocols, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
}

@end
