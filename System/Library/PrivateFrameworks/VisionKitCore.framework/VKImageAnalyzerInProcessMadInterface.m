@implementation VKImageAnalyzerInProcessMadInterface

+ (id)sharedInterface
{
  if (sharedInterface_onceToken_0 != -1)
    dispatch_once(&sharedInterface_onceToken_0, &__block_literal_global_35);
  return (id)sharedInterface_sInterface_0;
}

void __55__VKImageAnalyzerInProcessMadInterface_sharedInterface__block_invoke()
{
  VKImageAnalyzerInProcessMadInterface *v0;
  void *v1;

  v0 = objc_alloc_init(VKImageAnalyzerInProcessMadInterface);
  v1 = (void *)sharedInterface_sInterface_0;
  sharedInterface_sInterface_0 = (uint64_t)v0;

}

- (VKImageAnalyzerInProcessMadInterface)init
{
  VKImageAnalyzerInProcessMadInterface *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *housekeepingQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *tempMadProcessingQueue;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *tempMadRequestQueueWaiting;
  NSMutableOrderedSet *v9;
  NSMutableOrderedSet *tempMadRequestQueueProcessing;
  NSMutableSet *v11;
  NSMutableSet *tempMadRequestQueueCancelling;
  NSMutableDictionary *v13;
  NSMutableDictionary *idsToRequests;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VKImageAnalyzerInProcessMadInterface;
  v2 = -[VKImageAnalyzerMadInterface init](&v16, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("VKImageAnalyzer", 0);
    housekeepingQueue = v2->_housekeepingQueue;
    v2->_housekeepingQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("tempMADProcessingQueue", 0);
    tempMadProcessingQueue = v2->_tempMadProcessingQueue;
    v2->_tempMadProcessingQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    tempMadRequestQueueWaiting = v2->_tempMadRequestQueueWaiting;
    v2->_tempMadRequestQueueWaiting = v7;

    v9 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    tempMadRequestQueueProcessing = v2->_tempMadRequestQueueProcessing;
    v2->_tempMadRequestQueueProcessing = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    tempMadRequestQueueCancelling = v2->_tempMadRequestQueueCancelling;
    v2->_tempMadRequestQueueCancelling = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    idsToRequests = v2->_idsToRequests;
    v2->_idsToRequests = v13;

  }
  return v2;
}

- (NSString)errorDomain
{
  return (NSString *)CFSTR("com.apple.VisionKit.ImageAnalyzer");
}

- (int)processRequest:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v10;
  VKImageAnalyzerInProcessMadInterface *v11;
  int v12;

  v4 = a3;
  v5 = -[VKImageAnalyzerInProcessMadInterface nextRequestID](self, "nextRequestID");
  -[VKImageAnalyzerInProcessMadInterface housekeepingQueue](self, "housekeepingQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__VKImageAnalyzerInProcessMadInterface_processRequest___block_invoke;
  block[3] = &unk_1E9465810;
  v12 = v5;
  v10 = v4;
  v11 = self;
  v7 = v4;
  dispatch_async(v6, block);

  return v5;
}

uint64_t __55__VKImageAnalyzerInProcessMadInterface_processRequest___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setRequestID:", *(unsigned int *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setProcessDate:", v2);

  v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    v6 = 138412546;
    v7 = v4;
    v8 = 1024;
    v9 = objc_msgSend(v4, "requestID");
    _os_log_impl(&dword_1D2E0D000, v3, OS_LOG_TYPE_DEFAULT, "Queuing request: %@  requestID: %d", (uint8_t *)&v6, 0x12u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "addRequestForProcessing:", *(_QWORD *)(a1 + 32));
}

- (int)nextRequestID
{
  VKImageAnalyzerInProcessMadInterface *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1;
  -[VKImageAnalyzerInProcessMadInterface housekeepingQueue](self, "housekeepingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__VKImageAnalyzerInProcessMadInterface_nextRequestID__block_invoke;
  v5[3] = &unk_1E9465838;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

uint64_t __53__VKImageAnalyzerInProcessMadInterface_nextRequestID__block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(v1 + 88);
  if (!v2)
  {
    *(_DWORD *)(v1 + 88) = 1;
    v1 = *(_QWORD *)(result + 32);
    v2 = *(_DWORD *)(v1 + 88);
  }
  *(_DWORD *)(v1 + 88) = v2 + 1;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (void)processNextItemIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[VKImageAnalyzerInProcessMadInterface tempMadRequestQueueProcessing](self, "tempMadRequestQueueProcessing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    -[VKImageAnalyzerInProcessMadInterface tempMadRequestQueueWaiting](self, "tempMadRequestQueueWaiting");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      -[VKImageAnalyzerInProcessMadInterface idsToRequests](self, "idsToRequests");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKImageAnalyzerInProcessMadInterface tempMadRequestQueueWaiting](self, "tempMadRequestQueueWaiting");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v9);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v11;
      if (!v11)
      {
        +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((request) != nil)", "-[VKImageAnalyzerInProcessMadInterface processNextItemIfNecessary]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "request");
        v10 = 0;
      }
      -[VKImageAnalyzerInProcessMadInterface _processRequest:](self, "_processRequest:", v10);

    }
  }
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
  -[VKImageAnalyzerInProcessMadInterface housekeepingQueue](self, "housekeepingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__VKImageAnalyzerInProcessMadInterface_statusForRequestID___block_invoke;
  block[3] = &unk_1E9464660;
  block[4] = self;
  block[5] = &v10;
  v9 = a3;
  dispatch_sync(v5, block);

  v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __59__VKImageAnalyzerInProcessMadInterface_statusForRequestID___block_invoke(uint64_t a1)
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

  -[VKImageAnalyzerInProcessMadInterface housekeepingQueue](self, "housekeepingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__VKImageAnalyzerInProcessMadInterface_cancelRequestID___block_invoke;
  v6[3] = &unk_1E9464688;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __56__VKImageAnalyzerInProcessMadInterface_cancelRequestID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "idsToRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_cancelRequest:", v5);
    v4 = v5;
  }

}

- (void)cancelAllRequests
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2E0D000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling all requests", buf, 2u);
  }

  -[VKImageAnalyzerInProcessMadInterface housekeepingQueue](self, "housekeepingQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__VKImageAnalyzerInProcessMadInterface_cancelAllRequests__block_invoke;
  block[3] = &unk_1E94625B8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __57__VKImageAnalyzerInProcessMadInterface_cancelAllRequests__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "tempMadRequestQueueWaiting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__VKImageAnalyzerInProcessMadInterface_cancelAllRequests__block_invoke_2;
  v6[3] = &unk_1E94646B0;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  objc_msgSend(*(id *)(a1 + 32), "tempMadRequestQueueProcessing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __57__VKImageAnalyzerInProcessMadInterface_cancelAllRequests__block_invoke_3;
  v5[3] = &unk_1E94646B0;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

uint64_t __57__VKImageAnalyzerInProcessMadInterface_cancelAllRequests__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelRequestID:", objc_msgSend(a2, "unsignedIntValue"));
}

uint64_t __57__VKImageAnalyzerInProcessMadInterface_cancelAllRequests__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelRequestID:", objc_msgSend(a2, "unsignedIntValue"));
}

- (void)_cancelRequest:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setCancelled:", 1);
  v5 = -[VKImageAnalyzerInProcessMadInterface _statusForRequestID:](self, "_statusForRequestID:", objc_msgSend(v4, "requestID"));
  v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1D2E0D000, v6, OS_LOG_TYPE_DEFAULT, "Cancelling Request: %@", (uint8_t *)&v9, 0xCu);
  }

  if (v5)
  {
    if (v5 == 1)
    {
      objc_msgSend(v4, "setCancelled:", 1);
      -[VKImageAnalyzerInProcessMadInterface removeAndNotifyOfCancelledRequest:](self, "removeAndNotifyOfCancelledRequest:", v4);
    }
  }
  else
  {
    -[VKImageAnalyzerInProcessMadInterface tempMadRequestQueueCancelling](self, "tempMadRequestQueueCancelling");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestIDValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (void)removeAndNotifyOfCancelledRequest:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[VKImageAnalyzerInProcessMadInterface clearCompletedRequest:](self, "clearCompletedRequest:", v7);
  objc_msgSend(v7, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v7, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[VKImageAnalyzerInProcessMadInterface cancelledError](self, "cancelledError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v5)[2](v5, 0, 0, v6);

  }
}

- (unint64_t)_statusForRequestID:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  unint64_t v9;
  void *v10;
  char v11;
  void *v12;
  int v13;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKImageAnalyzerInProcessMadInterface idsToRequests](self, "idsToRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VKImageAnalyzerInProcessMadInterface tempMadRequestQueueProcessing](self, "tempMadRequestQueueProcessing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v4);

    if ((v8 & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      -[VKImageAnalyzerInProcessMadInterface tempMadRequestQueueWaiting](self, "tempMadRequestQueueWaiting");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", v4);

      if ((v11 & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        -[VKImageAnalyzerInProcessMadInterface tempMadRequestQueueCancelling](self, "tempMadRequestQueueCancelling");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v4);

        if (v13)
          v9 = 2;
        else
          v9 = 3;
      }
    }
  }
  else
  {
    v9 = 3;
  }

  return v9;
}

- (void)clearCompletedRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "requestIDValue");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[VKImageAnalyzerInProcessMadInterface tempMadRequestQueueProcessing](self, "tempMadRequestQueueProcessing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containsObject:", v11);

  -[VKImageAnalyzerInProcessMadInterface tempMadRequestQueueWaiting](self, "tempMadRequestQueueWaiting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containsObject:", v11);

  -[VKImageAnalyzerInProcessMadInterface tempMadRequestQueueCancelling](self, "tempMadRequestQueueCancelling");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containsObject:", v11);

  -[VKImageAnalyzerInProcessMadInterface tempMadRequestQueueProcessing](self, "tempMadRequestQueueProcessing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v11);

  -[VKImageAnalyzerInProcessMadInterface tempMadRequestQueueCancelling](self, "tempMadRequestQueueCancelling");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v11);

  -[VKImageAnalyzerInProcessMadInterface tempMadRequestQueueWaiting](self, "tempMadRequestQueueWaiting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v11);

  -[VKImageAnalyzerInProcessMadInterface idsToRequests](self, "idsToRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v11);

}

- (id)cancelledError
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
  -[VKImageAnalyzerInProcessMadInterface errorDomain](self, "errorDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = CFSTR("Request Cancelled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", v4, -2, v5);

  return v6;
}

- (void)addRequestForProcessing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[VKImageAnalyzerInProcessMadInterface idsToRequests](self, "idsToRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestIDValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  -[VKImageAnalyzerInProcessMadInterface tempMadRequestQueueWaiting](self, "tempMadRequestQueueWaiting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestIDValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v8);
  -[VKImageAnalyzerInProcessMadInterface processNextItemIfNecessary](self, "processNextItemIfNecessary");
}

- (void)request:(id)a3 didCompleteWithAnalysis:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v8;
    _os_log_impl(&dword_1D2E0D000, v11, OS_LOG_TYPE_DEFAULT, "Request completed: %@", (uint8_t *)&v14, 0xCu);
  }

  -[VKImageAnalyzerInProcessMadInterface clearCompletedRequest:](self, "clearCompletedRequest:", v8);
  objc_msgSend(v8, "completionHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v8, "completionHandler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD, id))v13)[2](v13, v9, 0, v10);

  }
  -[VKImageAnalyzerInProcessMadInterface processNextItemIfNecessary](self, "processNextItemIfNecessary");

}

- (void)_processRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  VKImageAnalyzerInProcessMadInterface *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "requestIDValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1D2E0D000, v6, OS_LOG_TYPE_DEFAULT, "Processing Request: %@", buf, 0xCu);
  }

  -[VKImageAnalyzerInProcessMadInterface tempMadRequestQueueWaiting](self, "tempMadRequestQueueWaiting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v5);

  -[VKImageAnalyzerInProcessMadInterface tempMadRequestQueueProcessing](self, "tempMadRequestQueueProcessing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v5);

  -[VKImageAnalyzerInProcessMadInterface tempMadProcessingQueue](self, "tempMadProcessingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__VKImageAnalyzerInProcessMadInterface__processRequest___block_invoke;
  v11[3] = &unk_1E9462B58;
  v12 = v4;
  v13 = self;
  v10 = v4;
  dispatch_async(v9, v11);

}

void __56__VKImageAnalyzerInProcessMadInterface__processRequest___block_invoke(uint64_t a1)
{
  id *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  VKCImageAnalysisResult *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "imageSize");
  v4 = v3;
  v6 = v5;
  v7 = objc_alloc_init(MEMORY[0x1E0CEDFE0]);
  objc_msgSend(*v2, "locales");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    objc_msgSend(*v2, "locales");
  else
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setRecognitionLanguages:", v9);
  objc_msgSend(v7, "setMaximumCandidateCount:", 3);
  objc_msgSend(v7, "setUsesLanguageDetection:", 1);
  objc_msgSend(*v2, "createVNRequestHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[VKImageAnalyzerInProcessMadInterface _processRequest:]_block_invoke", 0, 0, CFSTR("Unable to create handler from request %@"), *(_QWORD *)(a1 + 32));
    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(*(id *)(a1 + 40), "errorDomain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x1E0C9AFB0];
    v28[0] = CFSTR("Unable to create request handler");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", v15, -3, v16);
LABEL_10:
    v19 = 0;
    goto LABEL_16;
  }
  v26 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v10, "performRequests:error:", v11, &v25);
  v12 = v25;

  if (v12)
  {
    v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __56__VKImageAnalyzerInProcessMadInterface__processRequest___block_invoke_cold_1((uint64_t)v12, (uint64_t *)v2, v13);

    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(*(id *)(a1 + 40), "errorDomain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, 2, v16);

    goto LABEL_10;
  }
  if ((objc_msgSend(*v2, "analysisTypes") & 4) != 0 || (objc_msgSend(*v2, "analysisTypes") & 8) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(void **)(a1 + 40);
    v22 = objc_msgSend(v20, "vk_cgImage");
    objc_msgSend(*(id *)(a1 + 32), "processedBarcodeSymbologies");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "mrcElementsFromImage:symbologies:", v22, v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(v7, "results");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[VKCImageAnalysisResult initWithDocumentObservation:mrcDataDetectors:imageSize:]([VKCImageAnalysisResult alloc], "initWithDocumentObservation:mrcDataDetectors:imageSize:", v16, v15, v4, v6);
  v17 = 0;
LABEL_16:

  -[VKCImageAnalysisResult setRequest:](v19, "setRequest:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "didFinishRequest:withAnalysisResult:error:", *(_QWORD *)(a1 + 32), v19, v17);

}

- (void)didFinishRequest:(id)a3 withAnalysisResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  VKCImageAnalysis *v11;
  NSObject *v12;
  id v13;
  VKCImageAnalysis *v14;
  id v15;
  _QWORD block[5];
  id v17;
  VKCImageAnalysis *v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;

  v8 = a3;
  v9 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__18;
  v21[4] = __Block_byref_object_dispose__18;
  v10 = a5;
  v22 = v10;
  if (v9)
    v11 = -[VKImageAnalysis initWithAnalysisResult:]([VKCImageAnalysis alloc], "initWithAnalysisResult:", v9);
  else
    v11 = 0;
  -[VKImageAnalyzerInProcessMadInterface housekeepingQueue](self, "housekeepingQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__VKImageAnalyzerInProcessMadInterface_didFinishRequest_withAnalysisResult_error___block_invoke;
  block[3] = &unk_1E94648F0;
  block[4] = self;
  v17 = v8;
  v19 = v10;
  v20 = v21;
  v18 = v11;
  v13 = v10;
  v14 = v11;
  v15 = v8;
  dispatch_async(v12, block);

  _Block_object_dispose(v21, 8);
}

void __82__VKImageAnalyzerInProcessMadInterface_didFinishRequest_withAnalysisResult_error___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "tempMadRequestQueueCancelling");
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
  objc_msgSend(*(id *)(a1 + 32), "request:didCompleteWithAnalysis:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (id)mrcElementsFromImage:(CGImage *)a3 symbologies:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CEDE50];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithCompletionHandler:", 0);
  objc_msgSend(v7, "setSymbologies:", v6);

  v8 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v9 = (void *)objc_msgSend(v8, "initWithCGImage:options:", a3, MEMORY[0x1E0C9AA70]);
  v24[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performRequests:error:", v10, 0);

  objc_msgSend(v7, "results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 134217984;
      v21 = objc_msgSend(v11, "count");
      _os_log_impl(&dword_1D2E0D000, v13, OS_LOG_TYPE_DEFAULT, "Beginning MRC Parsing with %lu elements", (uint8_t *)&v20, 0xCu);
    }

    objc_msgSend(v11, "vk_compactMap:", &__block_literal_global_61);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v14, "count");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", v12);
      v20 = 134218240;
      v21 = v16;
      v22 = 2048;
      v23 = v18;
      _os_log_impl(&dword_1D2E0D000, v15, OS_LOG_TYPE_DEFAULT, "Completed MRC Parsing of %lu elements in %f seconds.", (uint8_t *)&v20, 0x16u);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id __73__VKImageAnalyzerInProcessMadInterface_mrcElementsFromImage_symbologies___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[VKCTextElementProcessor dataDetectorElementFromVNBarcodeObservation:loggingIndex:](VKCTextElementProcessor, "dataDetectorElementFromVNBarcodeObservation:loggingIndex:", a2, a3);
}

- (OS_dispatch_queue)housekeepingQueue
{
  return self->_housekeepingQueue;
}

- (void)setHousekeepingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_housekeepingQueue, a3);
}

- (OS_dispatch_queue)tempMadProcessingQueue
{
  return self->_tempMadProcessingQueue;
}

- (void)setTempMadProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_tempMadProcessingQueue, a3);
}

- (NSMutableOrderedSet)tempMadRequestQueueWaiting
{
  return self->_tempMadRequestQueueWaiting;
}

- (void)setTempMadRequestQueueWaiting:(id)a3
{
  objc_storeStrong((id *)&self->_tempMadRequestQueueWaiting, a3);
}

- (NSMutableOrderedSet)tempMadRequestQueueProcessing
{
  return self->_tempMadRequestQueueProcessing;
}

- (void)setTempMadRequestQueueProcessing:(id)a3
{
  objc_storeStrong((id *)&self->_tempMadRequestQueueProcessing, a3);
}

- (NSMutableSet)tempMadRequestQueueCancelling
{
  return self->_tempMadRequestQueueCancelling;
}

- (void)setTempMadRequestQueueCancelling:(id)a3
{
  objc_storeStrong((id *)&self->_tempMadRequestQueueCancelling, a3);
}

- (NSMutableDictionary)idsToRequests
{
  return self->_idsToRequests;
}

- (void)setIdsToRequests:(id)a3
{
  objc_storeStrong((id *)&self->_idsToRequests, a3);
}

- (int)queueRequestID
{
  return self->_queueRequestID;
}

- (void)setQueueRequestID:(int)a3
{
  self->_queueRequestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsToRequests, 0);
  objc_storeStrong((id *)&self->_tempMadRequestQueueCancelling, 0);
  objc_storeStrong((id *)&self->_tempMadRequestQueueProcessing, 0);
  objc_storeStrong((id *)&self->_tempMadRequestQueueWaiting, 0);
  objc_storeStrong((id *)&self->_tempMadProcessingQueue, 0);
  objc_storeStrong((id *)&self->_housekeepingQueue, 0);
}

void __56__VKImageAnalyzerInProcessMadInterface__processRequest___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1D2E0D000, log, OS_LOG_TYPE_ERROR, "Error processing text result image: %@ request: %@", (uint8_t *)&v4, 0x16u);
}

@end
