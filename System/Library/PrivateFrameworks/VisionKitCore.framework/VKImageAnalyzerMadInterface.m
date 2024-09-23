@implementation VKImageAnalyzerMadInterface

+ (VKImageAnalyzerMadInterface)sharedInterface
{
  if (sharedInterface_onceToken != -1)
    dispatch_once(&sharedInterface_onceToken, &__block_literal_global_23);
  return (VKImageAnalyzerMadInterface *)(id)sharedInterface_sInterface;
}

void __46__VKImageAnalyzerMadInterface_sharedInterface__block_invoke()
{
  VKImageAnalyzerMadInterface *v0;
  void *v1;

  v0 = objc_alloc_init(VKImageAnalyzerMadInterface);
  v1 = (void *)sharedInterface_sInterface;
  sharedInterface_sInterface = (uint64_t)v0;

}

- (VKImageAnalyzerMadInterface)init
{
  VKImageAnalyzerMadInterface *v2;
  uint64_t v3;
  MADService *madService;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *housekeepingQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *processingQueue;
  NSMutableOrderedSet *v11;
  NSMutableOrderedSet *requestQueueProcessing;
  NSMutableSet *v13;
  NSMutableSet *requestQueueCancelling;
  NSMutableDictionary *v15;
  NSMutableDictionary *idsToRequests;
  NSMutableDictionary *v17;
  NSMutableDictionary *vkToMadIDs;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)VKImageAnalyzerMadInterface;
  v2 = -[VKImageAnalyzerMadInterface init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D47780], "service");
    v3 = objc_claimAutoreleasedReturnValue();
    madService = v2->_madService;
    v2->_madService = (MADService *)v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("VKImageAnalyzerHouseKeeping", v5);
    housekeepingQueue = v2->_housekeepingQueue;
    v2->_housekeepingQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("VKImageAnalyzerProcessing", v6);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v9;

    v11 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    requestQueueProcessing = v2->_requestQueueProcessing;
    v2->_requestQueueProcessing = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    requestQueueCancelling = v2->_requestQueueCancelling;
    v2->_requestQueueCancelling = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    idsToRequests = v2->_idsToRequests;
    v2->_idsToRequests = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    vkToMadIDs = v2->_vkToMadIDs;
    v2->_vkToMadIDs = v17;

    v2->_requestIDIndex = 0;
  }
  return v2;
}

- (int)processRequest:(id)a3 callbackQueue:(id)a4
{
  id v6;
  id v7;
  VKImageAnalyzerMadInterface *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = -[VKImageAnalyzerMadInterface requestIDIndex](v8, "requestIDIndex") + 1;
  -[VKImageAnalyzerMadInterface setRequestIDIndex:](v8, "setRequestIDIndex:", v9);
  objc_msgSend(v6, "setRequestID:", v9);
  -[VKImageAnalyzerMadInterface setRequest:forRequestID:](v8, "setRequest:forRequestID:", v6, objc_msgSend(v6, "requestID"));
  objc_sync_exit(v8);

  -[VKImageAnalyzerMadInterface housekeepingQueue](v8, "housekeepingQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__VKImageAnalyzerMadInterface_processRequest_callbackQueue___block_invoke;
  block[3] = &unk_1E9462B08;
  block[4] = v8;
  v15 = v6;
  v16 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

  return v9;
}

uint64_t __60__VKImageAnalyzerMadInterface_processRequest_callbackQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processRequest:callbackQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (NSMutableDictionary)vkToMadIDs
{
  NSObject *v3;

  -[VKImageAnalyzerMadInterface housekeepingQueue](self, "housekeepingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_vkToMadIDs;
}

- (unint64_t)statusForRequestID:(int)a3
{
  NSObject *v5;
  unint64_t v6;
  _QWORD block[6];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 3;
  -[VKImageAnalyzerMadInterface housekeepingQueue](self, "housekeepingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__VKImageAnalyzerMadInterface_statusForRequestID___block_invoke;
  block[3] = &unk_1E9464660;
  block[4] = self;
  block[5] = &v10;
  v9 = a3;
  dispatch_sync(v5, block);

  v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __50__VKImageAnalyzerMadInterface_statusForRequestID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_statusForRequestID:", *(unsigned int *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)cancelRequestID:(int)a3
{
  NSObject *v5;
  _QWORD v6[5];
  int v7;

  -[VKImageAnalyzerMadInterface housekeepingQueue](self, "housekeepingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__VKImageAnalyzerMadInterface_cancelRequestID___block_invoke;
  v6[3] = &unk_1E9464688;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

uint64_t __47__VKImageAnalyzerMadInterface_cancelRequestID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelRequestID:", *(unsigned int *)(a1 + 40));
}

- (void)cancelAllRequests
{
  VKImageAnalyzerMadInterface *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  -[VKImageAnalyzerMadInterface idsToRequests](v2, "idsToRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  objc_initWeak(&location, v2);
  -[VKImageAnalyzerMadInterface housekeepingQueue](v2, "housekeepingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__VKImageAnalyzerMadInterface_cancelAllRequests__block_invoke;
  block[3] = &unk_1E94646D8;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__VKImageAnalyzerMadInterface_cancelAllRequests__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1D2E0D000, v2, OS_LOG_TYPE_DEFAULT, "Cancelling all requests: %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__VKImageAnalyzerMadInterface_cancelAllRequests__block_invoke_36;
    v6[3] = &unk_1E94646B0;
    v6[4] = WeakRetained;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
  }

}

uint64_t __48__VKImageAnalyzerMadInterface_cancelAllRequests__block_invoke_36(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelRequestID:", objc_msgSend(a2, "integerValue"));
}

- (void)_cancelRequestID:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v3 = *(_QWORD *)&a3;
  v10 = *MEMORY[0x1E0C80C00];
  -[VKImageAnalyzerMadInterface housekeepingQueue](self, "housekeepingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[VKImageAnalyzerMadInterface requestForRequestID:](self, "requestForRequestID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((objc_msgSend(v6, "cancelled") & 1) == 0)
      -[VKImageAnalyzerMadInterface _cancelRequest:](self, "_cancelRequest:", v7);
  }
  else
  {
    v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_1D2E0D000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to cancel completed or unknown requestID: %d", (uint8_t *)v9, 8u);
    }

  }
}

- (BOOL)hasAnyRequests
{
  void *v3;
  BOOL v4;
  void *v5;

  -[VKImageAnalyzerMadInterface requestQueueCancelling](self, "requestQueueCancelling");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[VKImageAnalyzerMadInterface requestQueueProcessing](self, "requestQueueProcessing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (MADService)service
{
  MADService *serviceDontUseThisOneDirectly;
  NSObject *v4;
  MADService *v5;
  MADService *v6;
  uint8_t v8[16];

  serviceDontUseThisOneDirectly = self->__serviceDontUseThisOneDirectly;
  if (!serviceDontUseThisOneDirectly)
  {
    v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D2E0D000, v4, OS_LOG_TYPE_INFO, "Retaining MADService", v8, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D47780], "service");
    v5 = (MADService *)objc_claimAutoreleasedReturnValue();
    v6 = self->__serviceDontUseThisOneDirectly;
    self->__serviceDontUseThisOneDirectly = v5;

    serviceDontUseThisOneDirectly = self->__serviceDontUseThisOneDirectly;
  }
  return serviceDontUseThisOneDirectly;
}

- (id)requestForRequestID:(int)a3
{
  uint64_t v3;
  VKImageAnalyzerMadInterface *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  v4 = self;
  objc_sync_enter(v4);
  -[VKImageAnalyzerMadInterface idsToRequests](v4, "idsToRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  return v7;
}

- (void)setRequest:(id)a3 forRequestID:(int)a4
{
  uint64_t v4;
  VKImageAnalyzerMadInterface *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v9 = a3;
  v6 = self;
  objc_sync_enter(v6);
  -[VKImageAnalyzerMadInterface idsToRequests](v6, "idsToRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

  objc_sync_exit(v6);
}

- (void)_cancelRequest:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VKImageAnalyzerMadInterface housekeepingQueue](self, "housekeepingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "setCancelled:", 1);
  v6 = -[VKImageAnalyzerMadInterface _statusForRequestID:](self, "_statusForRequestID:", objc_msgSend(v4, "requestID"));
  -[VKImageAnalyzerMadInterface vkToMadIDs](self, "vkToMadIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "requestID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "shortLoggingDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v12;
    _os_log_impl(&dword_1D2E0D000, v11, OS_LOG_TYPE_DEFAULT, "Cancelling Request: %@", (uint8_t *)&v16, 0xCu);

  }
  if (!v6)
  {
    -[VKImageAnalyzerMadInterface service](self, "service");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cancelRequestID:", v10);

    -[VKImageAnalyzerMadInterface requestQueueCancelling](self, "requestQueueCancelling");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestIDValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

  }
}

- (void)removeAndNotifyOfCancelledRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, void *);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, void *))a4;
  -[VKImageAnalyzerMadInterface housekeepingQueue](self, "housekeepingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "shortLoggingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v10;
    _os_log_impl(&dword_1D2E0D000, v9, OS_LOG_TYPE_DEFAULT, "Removing and notifying of cancelled request not yet submitted to MAD: %@", (uint8_t *)&v12, 0xCu);

  }
  -[VKImageAnalyzerMadInterface clearCompletedRequest:](self, "clearCompletedRequest:", v6);
  -[VKImageAnalyzerMadInterface cancelledError](self, "cancelledError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, objc_msgSend(v6, "madRequestID"), v11);

}

- (unint64_t)_statusForRequestID:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  unint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  -[VKImageAnalyzerMadInterface housekeepingQueue](self, "housekeepingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKImageAnalyzerMadInterface requestForRequestID:](self, "requestForRequestID:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKImageAnalyzerMadInterface vkToMadIDs](self, "vkToMadIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if (v7)
  {
    -[VKImageAnalyzerMadInterface requestQueueProcessing](self, "requestQueueProcessing");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v6);

    if ((v12 & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      -[VKImageAnalyzerMadInterface requestQueueCancelling](self, "requestQueueCancelling");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", v6);

      v16 = 3;
      if (v10 == -1)
        v16 = 1;
      if ((v15 & 1) != 0)
        v13 = 2;
      else
        v13 = v16;
    }
  }
  else
  {
    v13 = 3;
  }

  return v13;
}

- (void)clearCompletedRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;

  v4 = a3;
  -[VKImageAnalyzerMadInterface housekeepingQueue](self, "housekeepingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "requestIDValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[VKImageAnalyzerMadInterface requestQueueProcessing](self, "requestQueueProcessing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containsObject:", v6);

    -[VKImageAnalyzerMadInterface requestQueueCancelling](self, "requestQueueCancelling");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containsObject:", v6);

    -[VKImageAnalyzerMadInterface requestQueueProcessing](self, "requestQueueProcessing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v6);

    -[VKImageAnalyzerMadInterface requestQueueCancelling](self, "requestQueueCancelling");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "vk_removeNonNilObject:", v6);

    -[VKImageAnalyzerMadInterface vkToMadIDs](self, "vkToMadIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v6);

    -[VKImageAnalyzerMadInterface setRequest:forRequestID:](self, "setRequest:forRequestID:", 0, objc_msgSend(v4, "requestID"));
    -[VKImageAnalyzerMadInterface createNewIdleTimerIfNecessary](self, "createNewIdleTimerIfNecessary");
    -[VKImageAnalyzerMadInterface logCollectionsIfNecessary](self, "logCollectionsIfNecessary");
  }
  else
  {
    v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[VKImageAnalyzerMadInterface clearCompletedRequest:].cold.1((uint64_t)v4, v12, v13);

  }
}

- (id)cancelledError
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("Request Cancelled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithDomain:code:userInfo:", CFSTR("com.apple.VisionKit.ImageAnalyzer"), -2, v3);

  return v4;
}

+ (id)analyzerDeallocedError
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("Analzyer was dealloced");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithDomain:code:userInfo:", CFSTR("com.apple.VisionKit.ImageAnalyzer"), -6, v3);

  return v4;
}

- (void)request:(id)a3 didCompleteWithAnalysis:(id)a4 analysisEvent:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[VKImageAnalyzerMadInterface housekeepingQueue](self, "housekeepingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "shortLoggingDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v16;
    _os_log_impl(&dword_1D2E0D000, v15, OS_LOG_TYPE_DEFAULT, "Request completed: %@", (uint8_t *)&v19, 0xCu);

  }
  -[VKImageAnalyzerMadInterface clearCompletedRequest:](self, "clearCompletedRequest:", v10);
  objc_msgSend(v10, "completionHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v10, "completionHandler");
    v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id))v18)[2](v18, v11, v12, v13);

  }
}

- (void)_processRequest:(id)a3 callbackQueue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  _QWORD *v24;
  id *v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  void *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  VKAnalyticsAnalyzerEvent *v32;
  void *v33;
  _QWORD v34[5];
  void (**v35)(_QWORD, _QWORD, _QWORD);
  _QWORD v36[6];
  id v37;
  id v38[3];
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  const __CFString *v44;
  id buf;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[VKImageAnalyzerMadInterface housekeepingQueue](self, "housekeepingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = objc_msgSend(v6, "requestID");
  v10 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109378;
    HIDWORD(buf) = v9;
    v46 = 2112;
    v47 = v6;
    _os_log_impl(&dword_1D2E0D000, v10, OS_LOG_TYPE_DEFAULT, "Processing Request: %d - %@", (uint8_t *)&buf, 0x12u);
  }

  _VKSignpostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  _VKSignpostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, self);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2E0D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VisionKit MAD Parse Request", (const char *)&unk_1D2EDB5E1, (uint8_t *)&buf, 2u);
  }

  v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1D2E0D000, v14, OS_LOG_TYPE_INFO, "Signpost Begin: \"VisionKit MAD Parse Request\", (uint8_t *)&buf, 2u);
  }

  -[VKImageAnalyzerMadInterface vkToMadIDs](self, "vkToMadIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1E9494F40, v16);

  objc_msgSend(v6, "madRequests");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v6, "imageSize");
    v19 = v18;
    v21 = v20;
    objc_initWeak(&buf, self);
    v22 = objc_msgSend(v6, "isMultiPartAnalysis");
    v23 = MEMORY[0x1E0C809B0];
    if (v22)
    {
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke;
      v39[3] = &unk_1E9464700;
      v24 = v39;
      v25 = &v42;
      objc_copyWeak(&v42, &buf);
      v39[4] = v6;
      v40 = v17;
      v41 = v7;
      v26 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8249E20](v39);

    }
    else
    {
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_2;
      v36[3] = &unk_1E9464728;
      v24 = v36;
      v25 = v38;
      objc_copyWeak(v38, &buf);
      v36[4] = v6;
      v36[5] = self;
      v37 = v17;
      v38[1] = v19;
      v38[2] = v21;
      v26 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8249E20](v36);

    }
    objc_destroyWeak(v25);
    if (objc_msgSend(v17, "count"))
    {
      v34[0] = v23;
      v34[1] = 3221225472;
      v34[2] = __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_2_61;
      v34[3] = &unk_1E9464750;
      v34[4] = self;
      v35 = v26;
      -[VKImageAnalyzerMadInterface performMADRequest:forRequest:withCompletion:](self, "performMADRequest:forRequest:withCompletion:", v17, v6, v34);

    }
    else
    {
      objc_msgSend(v6, "setMadRequestID:", 420420420);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProcessDate:", v33);

      v26[2](v26, 420420420, 0);
    }

    objc_destroyWeak(&buf);
  }
  else
  {
    objc_msgSend(v6, "shortLoggingDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[VKImageAnalyzerMadInterface _processRequest:callbackQueue:]", 0, 0, CFSTR("unable to create madRequests for request %@"), v27);

    v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v43 = *MEMORY[0x1E0C9AFB0];
    v44 = CFSTR("Unable to create madRequests for request");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithDomain:code:userInfo:", CFSTR("com.apple.VisionKit.ImageAnalyzer"), -3, v29);

    v31 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[VKImageAnalyzerMadInterface _processRequest:callbackQueue:].cold.1(v6, (uint64_t)v30, v31);

    v32 = -[VKAnalyticsAnalyzerEvent initWithExecutionDurations:request:analysis:customIdentifier:error:]([VKAnalyticsAnalyzerEvent alloc], "initWithExecutionDurations:request:analysis:customIdentifier:error:", 0, v6, 0, 0, v30);
    -[VKImageAnalyzerMadInterface didFinishRequest:withAnalysis:analyticsEvent:error:](self, "didFinishRequest:withAnalysis:analyticsEvent:error:", v6, 0, v32, v30);

  }
  -[VKImageAnalyzerMadInterface logCollectionsIfNecessary](self, "logCollectionsIfNecessary");

}

void __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleCompletionForMultiPartRequest:madRequests:callbackQueue:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6);

}

void __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  id *v7;
  void *v8;
  double v9;
  double v10;
  VKAnalysisExecutionDurations *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  VKCImageAnalysis *v15;
  VKAnalyticsAnalyzerEvent *v16;
  VKCImageAnalysis *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "processDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v8);
  v10 = v9;

  if (WeakRetained)
  {
    v11 = objc_alloc_init(VKAnalysisExecutionDurations);
    -[VKAnalysisExecutionDurations setMadRoundTripAnalysisDuration:](v11, "setMadRoundTripAnalysisDuration:", v10);
    if (v4)
    {
      v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_2_cold_1((uint64_t)v4, (id *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 40), "housekeepingQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_59;
      v23 = &unk_1E9462B58;
      v24 = WeakRetained;
      v25 = *(id *)(a1 + 32);
      dispatch_async(v13, &v20);

      v14 = 0;
      v15 = 0;
    }
    else
    {
      objc_msgSend(WeakRetained, "analysisResultFromMadRequests:imageSize:durations:", *(_QWORD *)(a1 + 48), v11, *(double *)(a1 + 64), *(double *)(a1 + 72));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setRequest:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v14, "setImageSource:", objc_msgSend(*(id *)(a1 + 32), "imageSource"));
      objc_msgSend(v14, "setAnalysisRequestID:", objc_msgSend(*(id *)(a1 + 32), "requestID"));
      v15 = -[VKImageAnalysis initWithAnalysisResult:]([VKCImageAnalysis alloc], "initWithAnalysisResult:", v14);
    }
    v16 = -[VKAnalyticsAnalyzerEvent initWithExecutionDurations:request:analysis:customIdentifier:error:]([VKAnalyticsAnalyzerEvent alloc], "initWithExecutionDurations:request:analysis:customIdentifier:error:", v11, *v7, v15, 0, v4);
    if ((objc_msgSend(*v7, "cancelled") & 1) == 0 && v14)
    {
      objc_msgSend(v14, "setRequest:", *v7);
      objc_msgSend(v14, "setImageSource:", objc_msgSend(*v7, "imageSource"));
      v17 = -[VKImageAnalysis initWithAnalysisResult:]([VKCImageAnalysis alloc], "initWithAnalysisResult:", v14);

      -[VKImageAnalysis imageAnalysisResult](v17, "imageAnalysisResult");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "visualSearchResult");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAnalysis:", v17);

      v15 = v17;
    }
    objc_msgSend(WeakRetained, "didFinishRequest:withAnalysis:analyticsEvent:error:", *v7, v15, v16, v4, v20, v21, v22, v23, v24);

  }
}

void __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_59(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "vkToMadIDs");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "requestIDValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

void __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_2_61(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "requestQueueProcessing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 >= 0xB)
  {
    v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_2_61_cold_1(v4);

  }
  _VKSignpostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  _VKSignpostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v6, *(const void **)(a1 + 32));

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2E0D000, v5, OS_SIGNPOST_INTERVAL_END, v7, "VisionKit MAD Parse Request", (const char *)&unk_1D2EDB5E1, buf, 2u);
  }

  v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D2E0D000, v8, OS_LOG_TYPE_INFO, "Signpost Begin: \"VisionKit MAD Parse Request\", v9, 2u);
  }

}

- (void)handleCompletionForMultiPartRequest:(id)a3 madRequests:(id)a4 callbackQueue:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  VKAnalysisExecutionDurations *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  dispatch_time_t when;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  VKImageAnalyzerMadInterface *v45;
  id v46;
  id v47;
  id v48;
  _QWORD *v49;
  _QWORD v50[4];
  char v51;
  _QWORD block[5];
  id v53;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(VKAnalysisExecutionDurations);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "processDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", v16);
  v18 = v17;

  -[VKAnalysisExecutionDurations setMadRoundTripAnalysisDuration:](v14, "setMadRoundTripAnalysisDuration:", v18);
  if (v13)
  {
    v19 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[VKImageAnalyzerMadInterface handleCompletionForMultiPartRequest:madRequests:callbackQueue:error:].cold.1((uint64_t)v13, v10);

    -[VKImageAnalyzerMadInterface housekeepingQueue](self, "housekeepingQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke;
    block[3] = &unk_1E9462B58;
    block[4] = self;
    v53 = v10;
    v21 = v10;
    dispatch_async(v20, block);

  }
  else
  {
    objc_msgSend(v10, "inProcessAnalysis");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inProcessAnalysis");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageAnalysisResult");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[VKImageAnalyzerMadInterface documentObservationFromRequests:durations:](self, "documentObservationFromRequests:durations:", v11, v14);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = objc_claimAutoreleasedReturnValue();
    v51 = 0;
    -[VKImageAnalyzerMadInterface mrcDDElementsFromRequests:didParse:durations:](self, "mrcDDElementsFromRequests:didParse:durations:", v11, &v51, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)v23;
    if (v51)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeIntervalSinceDate:", v23);
      -[VKAnalysisExecutionDurations setMrcParseDuration:](v14, "setMrcParseDuration:");

    }
    else
    {
      -[VKAnalysisExecutionDurations setMrcParseDuration:](v14, "setMrcParseDuration:", 0.0);
    }
    v38 = v11;
    -[VKImageAnalyzerMadInterface visualSearchResultFromRequests:durations:](self, "visualSearchResultFromRequests:durations:", v11, v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x2020000000;
    v50[3] = 0x4000000000000000;
    when = dispatch_time(0, 2000000000);
    -[VKImageAnalyzerMadInterface housekeepingQueue](self, "housekeepingQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_2;
    v39[3] = &unk_1E94647F0;
    v40 = v34;
    v41 = v12;
    v42 = v10;
    v43 = v36;
    v44 = v35;
    v48 = 0;
    v49 = v50;
    v45 = self;
    v46 = v24;
    v47 = v26;
    v32 = v10;
    v28 = v26;
    v29 = v24;
    v21 = v35;
    v30 = v36;
    v31 = v34;
    dispatch_after(when, v27, v39);

    _Block_object_dispose(v50, 8);
    v11 = v38;
  }

}

void __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "vkToMadIDs");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "requestIDValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

void __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id location;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v2 = MEMORY[0x1E0C809B0];
  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_3;
    block[3] = &unk_1E9464778;
    v3 = *(NSObject **)(a1 + 40);
    v20 = *(id *)(a1 + 48);
    v21 = *(id *)(a1 + 56);
    v22 = *(id *)(a1 + 64);
    v23 = *(id *)(a1 + 32);
    dispatch_sync(v3, block);

  }
  objc_initWeak(&location, *(id *)(a1 + 72));
  v4 = dispatch_time(0, (uint64_t)(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) * 1000000000.0));
  objc_msgSend(*(id *)(a1 + 72), "housekeepingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_5;
  v8[3] = &unk_1E94647C8;
  objc_copyWeak(&v17, &location);
  v9 = *(id *)(a1 + 80);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 104);
  v13 = v6;
  v16 = v7;
  v14 = *(id *)(a1 + 88);
  v15 = *(id *)(a1 + 96);
  dispatch_after(v4, v5, v8);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_3(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "updateHandler");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_4;
  v4[3] = &unk_1E9462B58;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  ((void (**)(_QWORD, uint64_t, uint64_t, _QWORD *))v2)[2](v2, v3, 1, v4);

}

uint64_t __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateVNDocumentObservation:", *(_QWORD *)(a1 + 40));
}

void __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_5(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v2 = (id *)(a1 + 96);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  if (WeakRetained)
  {
    v4 = MEMORY[0x1E0C809B0];
    if (*(_QWORD *)(a1 + 32) && (vk_isSeedBuild() & 1) == 0)
    {
      block[0] = v4;
      block[1] = 3221225472;
      block[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_6;
      block[3] = &unk_1E9464778;
      v5 = *(NSObject **)(a1 + 40);
      v18 = *(id *)(a1 + 48);
      v19 = *(id *)(a1 + 56);
      v20 = *(id *)(a1 + 64);
      v21 = *(id *)(a1 + 32);
      dispatch_sync(v5, block);

    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
    }
    v6 = dispatch_time(0, (uint64_t)(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) * 1000000000.0));
    objc_msgSend(WeakRetained, "housekeepingQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_8;
    v8[3] = &unk_1E94647A0;
    objc_copyWeak(&v16, v2);
    v9 = *(id *)(a1 + 72);
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    v13 = *(id *)(a1 + 64);
    v14 = WeakRetained;
    v15 = *(id *)(a1 + 80);
    dispatch_after(v6, v7, v8);

    objc_destroyWeak(&v16);
  }

}

void __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_6(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "updateHandler");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_7;
  v4[3] = &unk_1E9462B58;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  ((void (**)(_QWORD, uint64_t, uint64_t, _QWORD *))v2)[2](v2, v3, 4, v4);

}

uint64_t __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateMRCDataDetectors:", *(_QWORD *)(a1 + 40));
}

void __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_9;
      block[3] = &unk_1E9464778;
      v3 = *(NSObject **)(a1 + 40);
      v6 = *(id *)(a1 + 48);
      v7 = *(id *)(a1 + 56);
      v8 = *(id *)(a1 + 64);
      v9 = *(id *)(a1 + 32);
      dispatch_sync(v3, block);

    }
    objc_msgSend(*(id *)(a1 + 72), "didFinishRequest:withAnalysis:analyticsEvent:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 80));
    WeakRetained = v4;
  }

}

void __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_9(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "updateHandler");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_10;
  v4[3] = &unk_1E9462B08;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 56);
  ((void (**)(_QWORD, uint64_t, uint64_t, _QWORD *))v2)[2](v2, v3, 16, v4);

}

uint64_t __99__VKImageAnalyzerMadInterface_handleCompletionForMultiPartRequest_madRequests_callbackQueue_error___block_invoke_10(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setRequest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setImageSource:", objc_msgSend(*(id *)(a1 + 40), "imageSource"));
  return objc_msgSend(*(id *)(a1 + 32), "setVisualSearchResult:", *(_QWORD *)(a1 + 48));
}

- (void)performMADRequest:(id)a3 forRequest:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  VKImageAnalyzerMadInterface *v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = +[VKCInternalSettings isCGImageForMadEnabled](VKCInternalSettings, "isCGImageForMadEnabled");
  objc_initWeak(&location, self);
  -[VKImageAnalyzerMadInterface processingQueue](self, "processingQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__VKImageAnalyzerMadInterface_performMADRequest_forRequest_withCompletion___block_invoke;
  block[3] = &unk_1E9464840;
  v22 = v11;
  v17 = v9;
  v18 = self;
  v13 = v9;
  objc_copyWeak(&v21, &location);
  v19 = v8;
  v20 = v10;
  v14 = v10;
  v15 = v8;
  dispatch_async(v12, block);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __75__VKImageAnalyzerMadInterface_performMADRequest_forRequest_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17[3];
  char v18;

  v2 = 0;
  v3 = 0;
  switch(objc_msgSend(*(id *)(a1 + 32), "requestType"))
  {
    case 0:
      v4 = *(void **)(a1 + 32);
      if (*(_BYTE *)(a1 + 72))
      {
        objc_msgSend(v4, "image");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = objc_msgSend(v5, "vk_cgImageGeneratingIfNecessary");

        CGImageRetain((CGImageRef)v2);
        v3 = 0;
      }
      else
      {
        v3 = objc_msgSend(v4, "tempPixelBufferRef");
        v2 = 0;
      }
      if (!(v2 | v3))
      {
        +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "(cgImage != ((void *)0) || pixelBuffer != ((void *)0))", "-[VKImageAnalyzerMadInterface performMADRequest:forRequest:withCompletion:]_block_invoke", 0, 0, CFSTR("Unable to create pixel buffer or CGImage from image for request: %@"), *(_QWORD *)(a1 + 40));
        v2 = 0;
        goto LABEL_16;
      }
      break;
    case 1:
      v6 = *(void **)(a1 + 32);
      if (*(_BYTE *)(a1 + 72))
        goto LABEL_8;
      v7 = objc_msgSend(v6, "tempPixelBufferRef");
      goto LABEL_10;
    case 2:
    case 4:
    case 5:
      break;
    case 3:
      v3 = objc_msgSend(*(id *)(a1 + 32), "pixelBuffer");
      CVPixelBufferRetain((CVPixelBufferRef)v3);
      goto LABEL_11;
    case 6:
      v6 = *(void **)(a1 + 32);
LABEL_8:
      v2 = objc_msgSend(v6, "cgImageRef");
      CGImageRetain((CGImageRef)v2);
LABEL_16:
      v3 = 0;
      break;
    case 7:
      v7 = objc_msgSend(*(id *)(a1 + 32), "pixelBuffer");
LABEL_10:
      v3 = v7;
LABEL_11:
      v2 = 0;
      break;
    default:
      v3 = 0;
      break;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "housekeepingQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__VKImageAnalyzerMadInterface_performMADRequest_forRequest_withCompletion___block_invoke_2;
    block[3] = &unk_1E9464818;
    objc_copyWeak(v17, (id *)(a1 + 64));
    v14 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 48);
    v17[1] = (id)v3;
    v17[2] = (id)v2;
    v18 = *(_BYTE *)(a1 + 72);
    v16 = *(id *)(a1 + 56);
    dispatch_async(v10, block);

    objc_destroyWeak(v17);
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 56);
    +[VKImageAnalyzerMadInterface analyzerDeallocedError](VKImageAnalyzerMadInterface, "analyzerDeallocedError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, 0xFFFFFFFFLL, v12);

    CVPixelBufferRelease((CVPixelBufferRef)v3);
    CGImageRelease((CGImageRef)v2);
  }

}

void __75__VKImageAnalyzerMadInterface_performMADRequest_forRequest_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _DWORD v17[2];
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    v15 = *(_QWORD *)(a1 + 48);
    +[VKImageAnalyzerMadInterface analyzerDeallocedError](VKImageAnalyzerMadInterface, "analyzerDeallocedError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, 0xFFFFFFFFLL, v16);

    goto LABEL_10;
  }
  v3 = *(void **)(a1 + 32);
  if (!v3)
  {
    v5 = 0;
    goto LABEL_9;
  }
  v4 = objc_msgSend(v3, "cancelled");
  v5 = *(_QWORD *)(a1 + 32);
  if ((v4 & 1) != 0)
  {
LABEL_9:
    objc_msgSend(WeakRetained, "removeAndNotifyOfCancelledRequest:completion:", v5, *(_QWORD *)(a1 + 48));
    goto LABEL_10;
  }
  v6 = objc_msgSend(WeakRetained, "_performMADRequest:forRequest:pixelBuffer:cgImage:useCGForMad:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setMadRequestID:", v6);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setProcessDate:", v7);

  v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "requestID");
    v17[0] = 67109376;
    v17[1] = v6;
    v18 = 1024;
    v19 = v9;
    _os_log_impl(&dword_1D2E0D000, v8, OS_LOG_TYPE_DEFAULT, "Assigned madId: %d to vkId: %d", (uint8_t *)v17, 0xEu);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "vkToMadIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestIDValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  objc_msgSend(WeakRetained, "requestQueueProcessing");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestIDValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

  objc_msgSend(WeakRetained, "logCollectionsIfNecessary");
LABEL_10:
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 64));
  CGImageRelease(*(CGImageRef *)(a1 + 72));

}

- (int)_performMADRequest:(id)a3 forRequest:(id)a4 pixelBuffer:(__CVBuffer *)a5 cgImage:(CGImage *)a6 useCGForMad:(BOOL)a7 withCompletion:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  int v31;
  void *v32;
  uint64_t v33;

  v9 = a7;
  v33 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a8;
  -[VKImageAnalyzerMadInterface service](self, "service");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKImageAnalyzerMadInterface housekeepingQueue](self, "housekeepingQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v18);

  v19 = vk_cgImagePropertyOrientationFromVKOrientation(objc_msgSend(v15, "imageOrientation"));
  switch(objc_msgSend(v15, "requestType"))
  {
    case 0:
    case 1:
      if (!v9)
        goto LABEL_4;
      v20 = objc_msgSend(v17, "performRequests:onCGImage:withOrientation:andIdentifier:completionHandler:", v14, a6, v19, 0, v16);
      goto LABEL_5;
    case 2:
      objc_msgSend(v15, "ciImage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v17, "performRequests:onCIImage:withOrientation:andIdentifier:completionHandler:", v14, v22, v19, 0, v16);
      goto LABEL_9;
    case 3:
LABEL_4:
      v20 = objc_msgSend(v17, "performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:", v14, a5, v19, 0, v16);
LABEL_5:
      v21 = v20;
      break;
    case 4:
      objc_msgSend(v15, "URL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v17, "performRequests:onImageURL:withIdentifier:completionHandler:", v14, v22, 0, v16);
LABEL_9:
      v21 = v23;
      goto LABEL_13;
    case 5:
      objc_msgSend(v15, "localIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v17, "performRequests:onAssetWithLocalIdentifier:fromPhotoLibraryWithURL:completionHandler:", v14, v22, v24, v16);

      goto LABEL_13;
    case 6:
      objc_msgSend(v15, "localIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v17, "performRequests:onCGImage:withOrientation:assetLocalIdentifier:photoLibraryURL:completionHandler:", v14, a6, v19, v25, v26, v16);

      break;
    case 7:
      objc_msgSend(v15, "localIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v17, "performRequests:onPixelBuffer:withOrientation:assetLocalIdentifier:photoLibraryURL:completionHandler:", v14, a5, v19, v22, v27, v16);

LABEL_13:
      break;
    default:
      v21 = 0;
      break;
  }
  v28 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v15, "shortLoggingDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v29;
    _os_log_impl(&dword_1D2E0D000, v28, OS_LOG_TYPE_INFO, "Request Submitted to MAD: %@", (uint8_t *)&v31, 0xCu);

  }
  -[VKImageAnalyzerMadInterface logCollectionsIfNecessary](self, "logCollectionsIfNecessary");

  return v21;
}

- (id)analysisResultFromMadRequests:(id)a3 imageSize:(CGSize)a4 durations:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  VKCImageAnalysisResult *v15;
  void *v16;
  void *v17;
  char v19;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  -[VKImageAnalyzerMadInterface documentObservationFromRequests:durations:](self, "documentObservationFromRequests:durations:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  -[VKImageAnalyzerMadInterface mrcDDElementsFromRequests:didParse:durations:](self, "mrcDDElementsFromRequests:didParse:durations:", v9, &v19, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v12);
    objc_msgSend(v10, "setMrcParseDuration:");

  }
  else
  {
    objc_msgSend(v10, "setMrcParseDuration:", 0.0);
  }
  v15 = -[VKCImageAnalysisResult initWithDocumentObservation:mrcDataDetectors:imageSize:]([VKCImageAnalysisResult alloc], "initWithDocumentObservation:mrcDataDetectors:imageSize:", v11, v13, width, height);
  -[VKImageAnalyzerMadInterface visualSearchResultFromRequests:durations:](self, "visualSearchResultFromRequests:durations:", v9, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisResult setVisualSearchResult:](v15, "setVisualSearchResult:", v16);
  -[VKImageAnalyzerMadInterface rectangleObservationsFromRequests:durations:](self, "rectangleObservationsFromRequests:durations:", v9, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCTextRecognitionResult setRectangleObservations:](v15, "setRectangleObservations:", v17);

  return v15;
}

- (id)documentObservationFromRequests:(id)a3 durations:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  objc_msgSend(a3, "vk_objectPassingTest:", &__block_literal_global_68);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_opt_class();
    objc_msgSend(v6, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    VKCheckedDynamicCast(v7, (uint64_t)v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "observations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "executionTimeInterval");
      objc_msgSend(v5, "setMadDocumentDuration:");
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __73__VKImageAnalyzerMadInterface_documentObservationFromRequests_durations___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)rectangleObservationsFromRequests:(id)a3 durations:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  objc_msgSend(a3, "vk_objectPassingTest:", &__block_literal_global_71);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_opt_class();
    objc_msgSend(v6, "results");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    VKDynamicCast(v7, (uint64_t)v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "observations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "executionTimeInterval");
    objc_msgSend(v5, "setMadRectangleDuration:");

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __75__VKImageAnalyzerMadInterface_rectangleObservationsFromRequests_durations___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)visualSearchResultFromRequests:(id)a3 durations:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  VKCVisualSearchResult *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "vk_objectPassingTest:", &__block_literal_global_74);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[VKImageAnalyzerMadInterface visualSearchResultFromRequests:durations:].cold.1(v7, v9);

    }
    else
    {
      v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v7;
        _os_log_impl(&dword_1D2E0D000, v9, OS_LOG_TYPE_DEFAULT, "VSGating Request completed: %@", (uint8_t *)&v14, 0xCu);
      }
    }

    objc_msgSend(v7, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[VKCVisualSearchResult initWithGatingResult:]([VKCVisualSearchResult alloc], "initWithGatingResult:", v12);
    objc_msgSend(v12, "executionTimeInterval");
    objc_msgSend(v5, "setMadVisualSearchDuration:");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __72__VKImageAnalyzerMadInterface_visualSearchResultFromRequests_durations___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)mrcDDElementsFromRequests:(id)a3 didParse:(BOOL *)a4 durations:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  objc_msgSend(v7, "vk_objectPassingTest:", &__block_literal_global_78);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_opt_class();
    objc_msgSend(v10, "results");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    VKCheckedDynamicCast(v11, (uint64_t)v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v14, "observations");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");
        *(_DWORD *)buf = 134217984;
        v33 = v17;
        _os_log_impl(&dword_1D2E0D000, v15, OS_LOG_TYPE_DEFAULT, "Beginning MRC Parsing with %lu elements", buf, 0xCu);

      }
      objc_msgSend(v14, "executionTimeInterval");
      objc_msgSend(v8, "setMadMRCDuration:");
      objc_msgSend(v14, "observations");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __76__VKImageAnalyzerMadInterface_mrcDDElementsFromRequests_didParse_durations___block_invoke_81;
      v27[3] = &unk_1E94648C8;
      v27[4] = &v28;
      objc_msgSend(v18, "vk_compactMap:", v27);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }
  v20 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_msgSend(v19, "count");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSinceDate:", v9);
    *(_DWORD *)buf = 134218240;
    v33 = v21;
    v34 = 2048;
    v35 = v23;
    _os_log_impl(&dword_1D2E0D000, v20, OS_LOG_TYPE_DEFAULT, "Completed MRC Parsing of %lu elements in %f seconds.", buf, 0x16u);

  }
  v24 = (void *)MEMORY[0x1E0C9AA60];
  if (v19)
    v24 = v19;
  v25 = v24;

  *a4 = *((_BYTE *)v29 + 24);
  _Block_object_dispose(&v28, 8);

  return v25;
}

uint64_t __76__VKImageAnalyzerMadInterface_mrcDDElementsFromRequests_didParse_durations___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __76__VKImageAnalyzerMadInterface_mrcDDElementsFromRequests_didParse_durations___block_invoke_81(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return +[VKCTextElementProcessor dataDetectorElementFromVNBarcodeObservation:loggingIndex:](VKCTextElementProcessor, "dataDetectorElementFromVNBarcodeObservation:loggingIndex:", a2, a3);
}

- (void)didFinishRequest:(id)a3 withAnalysis:(id)a4 analyticsEvent:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__9;
  v23[4] = __Block_byref_object_dispose__9;
  v13 = a6;
  v24 = v13;
  -[VKImageAnalyzerMadInterface housekeepingQueue](self, "housekeepingQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__VKImageAnalyzerMadInterface_didFinishRequest_withAnalysis_analyticsEvent_error___block_invoke;
  block[3] = &unk_1E94648F0;
  block[4] = self;
  v19 = v10;
  v21 = v12;
  v22 = v23;
  v20 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  dispatch_async(v14, block);

  _Block_object_dispose(v23, 8);
}

void __82__VKImageAnalyzerMadInterface_didFinishRequest_withAnalysis_analyticsEvent_error___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "requestQueueCancelling");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "requestIDValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "containsObject:", v2);

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "requestIDValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v4);

    objc_msgSend(*(id *)(a1 + 32), "cancelledError");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  objc_msgSend(*(id *)(a1 + 32), "clearCompletedRequest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "request:didCompleteWithAnalysis:analysisEvent:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

- (id)VNRequestHandlerForRequest:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;

  v3 = a3;
  v4 = vk_cgImagePropertyOrientationFromVKOrientation(objc_msgSend(v3, "imageOrientation"));
  switch(objc_msgSend(v3, "requestType"))
  {
    case 0:
    case 1:
      objc_msgSend(v3, "image");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "vk_cgImage");

      v7 = objc_alloc(MEMORY[0x1E0CEDF70]);
      v8 = objc_msgSend(v7, "initWithCGImage:orientation:options:", v6, v4, MEMORY[0x1E0C9AA70]);
      goto LABEL_6;
    case 2:
      v10 = objc_alloc(MEMORY[0x1E0CEDF70]);
      objc_msgSend(v3, "ciImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v10, "initWithCIImage:orientation:options:", v11, v4, MEMORY[0x1E0C9AA70]);

      break;
    case 3:
      v12 = objc_alloc(MEMORY[0x1E0CEDF70]);
      v13 = objc_msgSend(v3, "pixelBuffer");
      v8 = objc_msgSend(v12, "initWithCVPixelBuffer:orientation:options:", v13, v4, MEMORY[0x1E0C9AA70]);
LABEL_6:
      v9 = (void *)v8;
      break;
    case 4:
      v14 = objc_alloc(MEMORY[0x1E0CEDF70]);
      objc_msgSend(v3, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v14, "initWithURL:options:", v15, MEMORY[0x1E0C9AA70]);

      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (void)generateVisualSearchResultForRequest:(id)a3 analysis:(id)a4 items:(id)a5 payload:(id)a6 queryID:(unint64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  os_signpost_id_t v35;
  NSObject *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  unint64_t v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  VKImageAnalyzerMadInterface *v50;
  id v51;
  unint64_t v52;
  void *v53;
  void *v54;
  uint8_t buf[4];
  unint64_t v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v43 = a8;
  v17 = (void *)MEMORY[0x1E0C99D68];
  v18 = a6;
  objc_msgSend(v17, "date");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v56 = a7;
    v57 = 1024;
    v58 = objc_msgSend(v15, "analysisRequestID");
    _os_log_impl(&dword_1D2E0D000, v19, OS_LOG_TYPE_DEFAULT, "VS Request complete began with queryID: %llu, id: %d", buf, 0x12u);
  }

  objc_msgSend(v16, "vk_compactMap:", &__block_literal_global_86);
  v20 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "vk_containsObjectPassingTest:", &__block_literal_global_90))
  {
    objc_msgSend(v15, "imageAnalysisResult");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sourceVNDocument");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v54 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((vnObservation) != nil)", "-[VKImageAnalyzerMadInterface generateVisualSearchResultForRequest:analysis:items:payload:queryID:completionHandler:]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "vnObservation");
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }
  v42 = (void *)v20;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D47840]), "initWithGatingResultItems:payload:documentObservations:", v20, v18, v23);

  -[VKImageAnalyzerMadInterface madSuggestionTypeFromItems:](self, "madSuggestionTypeFromItems:", v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = a7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setQueryID:", v26);

  v27 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v14, "screenScale");
  objc_msgSend(v27, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setUiScale:", v28);

  objc_msgSend(v14, "location");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setLocation:", v29);

  objc_msgSend(v14, "imageURL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setImageURL:", v30);

  objc_msgSend(v14, "pageURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setReferralURL:", v31);

  objc_msgSend(v14, "viImageType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setImageType:", v32);

  objc_msgSend(v24, "setEngagementSuggestionType:", v25);
  _VKSignpostLog();
  v33 = objc_claimAutoreleasedReturnValue();
  _VKSignpostLog();
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = os_signpost_id_make_with_pointer(v34, self);

  if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2E0D000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v35, "VisionKit MAD VisualSearch Request", (const char *)&unk_1D2EDB5E1, buf, 2u);
  }

  v36 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2E0D000, v36, OS_LOG_TYPE_INFO, "Signpost Begin: \"VisionKit MAD VisualSearch Request\", buf, 2u);
  }

  v53 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __117__VKImageAnalyzerMadInterface_generateVisualSearchResultForRequest_analysis_items_payload_queryID_completionHandler___block_invoke_96;
  v46[3] = &unk_1E9464958;
  v47 = v44;
  v48 = v15;
  v49 = v24;
  v50 = self;
  v51 = v43;
  v52 = v45;
  v38 = v43;
  v39 = v24;
  v40 = v15;
  v41 = v44;
  -[VKImageAnalyzerMadInterface performMADRequest:forRequest:withCompletion:](self, "performMADRequest:forRequest:withCompletion:", v37, v14, v46);

}

id __117__VKImageAnalyzerMadInterface_generateVisualSearchResultForRequest_analysis_items_payload_queryID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)MEMORY[0x1E0D47830];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "resultItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "normalizedBoundingBox");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v3, "domainInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v4, "initWithNormalizedBoundingBox:andDomains:", v15, v7, v9, v11, v13);

  return v16;
}

uint64_t __117__VKImageAnalyzerMadInterface_generateVisualSearchResultForRequest_analysis_items_payload_queryID_completionHandler___block_invoke_2()
{
  return 1;
}

void __117__VKImageAnalyzerMadInterface_generateVisualSearchResultForRequest_analysis_items_payload_queryID_completionHandler___block_invoke_96(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  int v17;
  double v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "timeIntervalSinceNow");
  v7 = v6;
  v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 72);
    v10 = objc_msgSend(*(id *)(a1 + 40), "analysisRequestID");
    v17 = 134218496;
    v18 = -v7;
    v19 = 2048;
    v20 = v9;
    v21 = 1024;
    v22 = v10;
    _os_log_impl(&dword_1D2E0D000, v8, OS_LOG_TYPE_DEFAULT, "VS Request complete with duration: %f, queryID: %llu, id: %d", (uint8_t *)&v17, 0x1Cu);
  }

  objc_msgSend(*(id *)(a1 + 48), "results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _VKSignpostLog();
  v13 = objc_claimAutoreleasedReturnValue();
  _VKSignpostLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_make_with_pointer(v14, *(const void **)(a1 + 56));

  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2E0D000, v13, OS_SIGNPOST_INTERVAL_END, v15, "VisionKit MAD VisualSearch Request", (const char *)&unk_1D2EDB5E1, (uint8_t *)&v17, 2u);
  }

  v16 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1D2E0D000, v16, OS_LOG_TYPE_INFO, "Signpost Begin: \"VisionKit MAD VisualSearch Request\", (uint8_t *)&v17, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)generateTextualVisualSearchResultForAnalysis:(id)a3 queryInfo:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  VKImageAnalyzerMadInterface *v45;
  id v46;
  void *v47;
  uint8_t buf[4];
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99D68];
  v11 = a4;
  objc_msgSend(v10, "date");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch.text");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v49 = objc_msgSend(v8, "analysisRequestID");
    _os_log_impl(&dword_1D2E0D000, v12, OS_LOG_TYPE_DEFAULT, "VisualSearch Text Request begin, id: %d", buf, 8u);
  }

  objc_msgSend(v8, "imageAnalysisResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x1E0D477F8]);
  objc_msgSend(v11, "queryString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithQueryTerm:", v16);

  objc_msgSend(v8, "imageAnalysisResult");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSurroundingText:", v19);

  objc_msgSend(v8, "imageAnalysisResult");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allLineQuads");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "vk_compactMap:", &__block_literal_global_100);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    v23 = v22;
  else
    v23 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v17, "setNormalizedBoundingBoxes:", v23);
  v24 = (void *)MEMORY[0x1E0CB37E8];
  v25 = objc_msgSend(v11, "queryID");

  objc_msgSend(v24, "numberWithInteger:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setQueryID:", v26);

  v27 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v14, "screenScale");
  objc_msgSend(v27, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setUiScale:", v28);

  _VKSignpostLog();
  v29 = objc_claimAutoreleasedReturnValue();
  _VKSignpostLog();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = os_signpost_id_make_with_pointer(v30, self);

  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2E0D000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v31, "VisionKit MAD VisualSearch Text Request", (const char *)&unk_1D2EDB5E1, buf, 2u);
  }

  v32 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2E0D000, v32, OS_LOG_TYPE_INFO, "Signpost Begin: \"VisionKit MAD VisualSearch Text Request\", buf, 2u);
  }

  v47 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageAnalysisResult");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "request");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __104__VKImageAnalyzerMadInterface_generateTextualVisualSearchResultForAnalysis_queryInfo_completionHandler___block_invoke_102;
  v41[3] = &unk_1E9464980;
  v42 = v40;
  v43 = v8;
  v44 = v17;
  v45 = self;
  v46 = v9;
  v36 = v9;
  v37 = v17;
  v38 = v8;
  v39 = v40;
  -[VKImageAnalyzerMadInterface performMADRequest:forRequest:withCompletion:](self, "performMADRequest:forRequest:withCompletion:", v33, v35, v41);

}

uint64_t __104__VKImageAnalyzerMadInterface_generateTextualVisualSearchResultForAnalysis_queryInfo_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(a2, "boundingBox");
  return objc_msgSend(v2, "vk_valueWithRect:");
}

void __104__VKImageAnalyzerMadInterface_generateTextualVisualSearchResultForAnalysis_queryInfo_completionHandler___block_invoke_102(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  v7 = v6;
  v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch.text");
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(*(id *)(a1 + 40), "analysisRequestID");
      objc_msgSend(v5, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 134218754;
      v22 = v7;
      v23 = 1024;
      v24 = a2;
      v25 = 1024;
      v26 = v10;
      v27 = 2112;
      v28 = v11;
      _os_log_error_impl(&dword_1D2E0D000, v9, OS_LOG_TYPE_ERROR, "VisualSearch Text Request completed: duration: %f, requestID %d, id: %d, error %@", (uint8_t *)&v21, 0x22u);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(*(id *)(a1 + 40), "analysisRequestID");
    v21 = 134218496;
    v22 = v7;
    v23 = 1024;
    v24 = a2;
    v25 = 1024;
    v26 = v12;
    _os_log_impl(&dword_1D2E0D000, v9, OS_LOG_TYPE_DEFAULT, "VisualSearch Text Request completed: duration: %f, requestID %d, id: %d", (uint8_t *)&v21, 0x18u);
  }

  objc_msgSend(*(id *)(a1 + 48), "results");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  objc_msgSend(v13, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  VKDynamicCast(v14, (uint64_t)v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _VKSignpostLog();
  v17 = objc_claimAutoreleasedReturnValue();
  _VKSignpostLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_signpost_id_make_with_pointer(v18, *(const void **)(a1 + 56));

  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2E0D000, v17, OS_SIGNPOST_INTERVAL_END, v19, "VisionKit MAD VisualSearch Text Request", (const char *)&unk_1D2EDB5E1, (uint8_t *)&v21, 2u);
  }

  v20 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_1D2E0D000, v20, OS_LOG_TYPE_INFO, "Signpost Begin: \"VisionKit MAD VisualSearch Text Request\", (uint8_t *)&v21, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)submitVisualIntelligenceUserFeedbackForRequest:(id)a3 reportIdentifier:(id)a4 userFeedbackPayload:(id)a5 sfReportData:(id)a6
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (objc_class *)MEMORY[0x1E0D47808];
  v13 = a6;
  v14 = a5;
  v15 = (void *)objc_msgSend([v12 alloc], "initWithUserFeedbackPayload:sfReportData:reportIdentifier:", v14, v13, v11);

  v22[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __128__VKImageAnalyzerMadInterface_submitVisualIntelligenceUserFeedbackForRequest_reportIdentifier_userFeedbackPayload_sfReportData___block_invoke;
  v19[3] = &unk_1E94649A8;
  v20 = v11;
  v21 = v10;
  v17 = v10;
  v18 = v11;
  -[VKImageAnalyzerMadInterface performMADRequest:forRequest:withCompletion:](self, "performMADRequest:forRequest:withCompletion:", v16, v17, v19);

}

void __128__VKImageAnalyzerMadInterface_submitVisualIntelligenceUserFeedbackForRequest_reportIdentifier_userFeedbackPayload_sfReportData___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "requestID");
    v5 = 138412546;
    v6 = v3;
    v7 = 1024;
    v8 = v4;
    _os_log_impl(&dword_1D2E0D000, v2, OS_LOG_TYPE_DEFAULT, "VisualIntelligence VisualSearch submit user report completed: %@, id: %d ", (uint8_t *)&v5, 0x12u);
  }

}

- (void)didShowVisualSearchHintsForRequest:(id)a3 invocationType:(int64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[VKImageAnalyzerMadInterface sfViewAppearEventFromInvocationType:request:](self, "sfViewAppearEventFromInvocationType:request:", a4, v6);
  -[VKImageAnalyzerMadInterface service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startEntryPointWithQueryID:andEvent:", objc_msgSend(v6, "queryID"), v7);

  v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    VKMUIStringForVKCVSInvocationType(a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v10;
    v13 = 1024;
    v14 = objc_msgSend(v6, "requestID");
    _os_log_impl(&dword_1D2E0D000, v9, OS_LOG_TYPE_INFO, "DidShowVisualSearchHints with invocationType: %@, id: %d", (uint8_t *)&v11, 0x12u);

  }
}

- (void)didShowVisualSearchCachedResultsForQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4 item:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  int v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v18[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKImageAnalyzerMadInterface madSuggestionTypeFromItems:](self, "madSuggestionTypeFromItems:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKImageAnalyzerMadInterface service](self, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cacheHitWithQueryID:cachedResultQueryID:engagementSuggestionType:", a3, a4, v10);

  v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "analysis");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v10;
    v16 = 1024;
    v17 = objc_msgSend(v13, "analysisRequestID");
    _os_log_impl(&dword_1D2E0D000, v12, OS_LOG_TYPE_INFO, "didShowVisualSearchCachedResultsForQueryID suggestionType: %@, id: %d", (uint8_t *)&v14, 0x12u);

  }
}

- (void)didLeaveVisualSearchHints
{
  id v2;

  -[VKImageAnalyzerMadInterface service](self, "service");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEntryPoint");

}

- (void)createNewIdleTimerIfNecessary
{
  void *v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[4];
  id v7[2];
  id location;

  if (!-[VKImageAnalyzerMadInterface hasAnyRequests](self, "hasAnyRequests"))
  {
    v3 = (void *)(-[VKImageAnalyzerMadInterface timeoutIndex](self, "timeoutIndex") + 1);
    -[VKImageAnalyzerMadInterface setTimeoutIndex:](self, "setTimeoutIndex:", v3);
    objc_initWeak(&location, self);
    v4 = dispatch_time(0, 60000000000);
    -[VKImageAnalyzerMadInterface housekeepingQueue](self, "housekeepingQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__VKImageAnalyzerMadInterface_createNewIdleTimerIfNecessary__block_invoke;
    block[3] = &unk_1E9463B88;
    objc_copyWeak(v7, &location);
    v7[1] = v3;
    dispatch_after(v4, v5, block);

    objc_destroyWeak(v7);
    objc_destroyWeak(&location);
  }
}

void __60__VKImageAnalyzerMadInterface_createNewIdleTimerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "timeoutIndex") == *(_QWORD *)(a1 + 40))
  {
    v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 134217984;
      v6 = 0x404E000000000000;
      _os_log_impl(&dword_1D2E0D000, v4, OS_LOG_TYPE_INFO, "Releasing MADService after timeout: %f", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(v3, "set_serviceDontUseThisOneDirectly:", 0);
  }

}

- (id)madSuggestionTypeFromItems:(id)a3
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  id *v6;

  objc_msgSend(a3, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentInvocationType");

  v5 = 0;
  switch(v4)
  {
    case 1:
      v6 = (id *)MEMORY[0x1E0D476A0];
      goto LABEL_6;
    case 2:
      v5 = CFSTR("highlightedSubject");
      break;
    case 4:
      v5 = CFSTR("automatic");
      break;
    case 5:
      v6 = (id *)MEMORY[0x1E0D476A8];
LABEL_6:
      v5 = (__CFString *)*v6;
      break;
    default:
      return v5;
  }
  return v5;
}

- (unint64_t)sfViewAppearEventFromInvocationType:(int64_t)a3 request:(id)a4
{
  uint64_t v5;
  unint64_t result;

  v5 = objc_msgSend(a4, "imageSource");
  switch(a3)
  {
    case 1:
    case 4:
      if (v5 == 2)
        result = 31;
      else
        result = 34;
      break;
    case 2:
      if (v5 == 2)
        result = 33;
      else
        result = 32;
      break;
    case 3:
      result = 28;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (OS_dispatch_queue)housekeepingQueue
{
  return self->_housekeepingQueue;
}

- (void)setHousekeepingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_housekeepingQueue, a3);
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (NSMutableOrderedSet)requestQueueProcessing
{
  return self->_requestQueueProcessing;
}

- (void)setRequestQueueProcessing:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueueProcessing, a3);
}

- (NSMutableSet)requestQueueCancelling
{
  return self->_requestQueueCancelling;
}

- (void)setRequestQueueCancelling:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueueCancelling, a3);
}

- (void)setVkToMadIDs:(id)a3
{
  objc_storeStrong((id *)&self->_vkToMadIDs, a3);
}

- (NSMutableDictionary)idsToRequests
{
  return self->_idsToRequests;
}

- (void)setIdsToRequests:(id)a3
{
  objc_storeStrong((id *)&self->_idsToRequests, a3);
}

- (int)requestIDIndex
{
  return self->_requestIDIndex;
}

- (void)setRequestIDIndex:(int)a3
{
  self->_requestIDIndex = a3;
}

- (MADService)_serviceDontUseThisOneDirectly
{
  return self->__serviceDontUseThisOneDirectly;
}

- (void)set_serviceDontUseThisOneDirectly:(id)a3
{
  objc_storeStrong((id *)&self->__serviceDontUseThisOneDirectly, a3);
}

- (unint64_t)timeoutIndex
{
  return self->_timeoutIndex;
}

- (void)setTimeoutIndex:(unint64_t)a3
{
  self->_timeoutIndex = a3;
}

- (MADService)madService
{
  return self->_madService;
}

- (void)setMadService:(id)a3
{
  objc_storeStrong((id *)&self->_madService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_madService, 0);
  objc_storeStrong((id *)&self->__serviceDontUseThisOneDirectly, 0);
  objc_storeStrong((id *)&self->_idsToRequests, 0);
  objc_storeStrong((id *)&self->_vkToMadIDs, 0);
  objc_storeStrong((id *)&self->_requestQueueCancelling, 0);
  objc_storeStrong((id *)&self->_requestQueueProcessing, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_housekeepingQueue, 0);
}

- (void)clearCompletedRequest:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_2_2(&dword_1D2E0D000, a2, a3, "Trying to clear nil completed requestID for request: %@", (uint8_t *)&v3);
}

- (void)_processRequest:(NSObject *)a3 callbackQueue:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  int v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a1, "requestID");
  objc_msgSend(a1, "shortLoggingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 67109634;
  v8[1] = v6;
  v9 = 2112;
  v10 = a2;
  v11 = 2112;
  v12 = v7;
  _os_log_error_impl(&dword_1D2E0D000, a3, OS_LOG_TYPE_ERROR, "Error processing id: %d from MAD on result: %@ request: %@", (uint8_t *)v8, 0x1Cu);

}

void __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_2_cold_1(uint64_t a1, id *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*a2, "shortLoggingDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1D2E0D000, v2, v3, "Error processing request from MAD on result: %@ request: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_2();
}

void __61__VKImageAnalyzerMadInterface__processRequest_callbackQueue___block_invoke_2_61_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D2E0D000, log, OS_LOG_TYPE_FAULT, "There are more than 10 requests in the processing queue. VisionKit clients should cancel requests if the image is no longer present", v1, 2u);
}

- (void)handleCompletionForMultiPartRequest:(uint64_t)a1 madRequests:(void *)a2 callbackQueue:error:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "shortLoggingDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1D2E0D000, v2, v3, "Error processing request from MAD on result: %@ request: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_2();
}

- (void)visualSearchResultFromRequests:(void *)a1 durations:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_2_2(&dword_1D2E0D000, a2, v4, "VSGating: Could not get visual search result from MADService with %@", (uint8_t *)&v5);

}

@end
