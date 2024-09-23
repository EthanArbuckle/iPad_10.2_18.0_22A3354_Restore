@implementation VUIMediaLibraryFetchController

void __81__VUIMediaLibraryFetchController__fetchOperationCompleted_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "fetchOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4 == v5)
  {
    if (v7)
    {
      objc_msgSend(v3, "logName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "[%@] - Fetch completed. Will process results and move to ready state", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(v3, "_didCompleteFetchOperation:", *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(v3, "setState:", 0);
  }
  else
  {
    if (v7)
    {
      objc_msgSend(v3, "logName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "state"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "[%@] - Fetch completed but was cancelled. Will not process results but will remain in current state (%@) and call completion handler", (uint8_t *)&v11, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __76__VUIMediaLibraryFetchController__enqueueFetchWithReason_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained, "_fetchOperationCompleted:withCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __67__VUIMediaLibraryFetchController__enqueueSyncProcessingQueueBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

uint64_t __103__VUIMediaLibraryFetchController_beginFetchWithMediaLibraryRevision_completionHandler_completionQueue___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "[%@] - Calling completion handler", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __103__VUIMediaLibraryFetchController_beginFetchWithMediaLibraryRevision_completionHandler_completionQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (!a2)
      objc_msgSend(WeakRetained, "setMediaLibraryRevision:", *(_QWORD *)(a1 + 56));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __103__VUIMediaLibraryFetchController_beginFetchWithMediaLibraryRevision_completionHandler_completionQueue___block_invoke_2;
    v9[3] = &unk_1E9F9FD10;
    v9[4] = v7;
    v8 = *(NSObject **)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v12 = a2;
    v10 = v5;
    dispatch_async(v8, v9);

  }
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)setMediaLibraryRevision:(unint64_t)a3
{
  self->_mediaLibraryRevision = a3;
}

- (void)setFetchOperation:(id)a3
{
  objc_storeStrong((id *)&self->_fetchOperation, a3);
}

- (OS_dispatch_queue)serialProcessingDispatchQueue
{
  return self->_serialProcessingDispatchQueue;
}

- (NSOperationQueue)serialFetchOperationQueue
{
  return self->_serialFetchOperationQueue;
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (unint64_t)mediaLibraryRevision
{
  return self->_mediaLibraryRevision;
}

- (NSString)logName
{
  NSString *logName;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  logName = self->_logName;
  if (!logName)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[VUIMediaLibraryFetchController mediaLibrary](self, "mediaLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaLibraryFetchController logNameSuffix](self, "logNameSuffix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%p-%@-%@"), self, v6, v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_logName;
    self->_logName = v8;

    logName = self->_logName;
  }
  return logName;
}

- (NSString)logNameSuffix
{
  NSString *logNameSuffix;

  logNameSuffix = self->_logNameSuffix;
  if (!logNameSuffix)
  {
    self->_logNameSuffix = (NSString *)&stru_1E9FF3598;

    logNameSuffix = self->_logNameSuffix;
  }
  return logNameSuffix;
}

- (VUIMediaLibraryFetchController)initWithMediaLibrary:(id)a3
{
  id v5;
  VUIMediaLibraryFetchController *v6;
  VUIMediaLibraryFetchController *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  dispatch_queue_t v11;
  OS_dispatch_queue *serialProcessingDispatchQueue;
  NSOperationQueue *v13;
  NSOperationQueue *serialFetchOperationQueue;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VUIMediaLibraryFetchController;
  v6 = -[VUIMediaLibraryFetchController init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaLibrary, a3);
    v7->_mediaLibraryRevision = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    v11 = dispatch_queue_create("com.apple.VideosUI.VUIMediaLibraryFetchController.serialProcessingQueue", 0);
    serialProcessingDispatchQueue = v7->_serialProcessingDispatchQueue;
    v7->_serialProcessingDispatchQueue = (OS_dispatch_queue *)v11;

    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    serialFetchOperationQueue = v7->_serialFetchOperationQueue;
    v7->_serialFetchOperationQueue = v13;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_serialFetchOperationQueue, "setMaxConcurrentOperationCount:", 1);
  }

  return v7;
}

- (NSOperation)fetchOperation
{
  return self->_fetchOperation;
}

- (void)beginFetchWithMediaLibraryRevision:(unint64_t)a3 completionHandler:(id)a4 completionQueue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  unint64_t v17;
  _QWORD aBlock[4];
  id v19;
  id v20;
  id v21[2];
  id location;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("completionHandler"));
    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("completionQueue"));
    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__VUIMediaLibraryFetchController_beginFetchWithMediaLibraryRevision_completionHandler_completionQueue___block_invoke;
  aBlock[3] = &unk_1E9F9FD38;
  objc_copyWeak(v21, &location);
  v21[1] = (id)a3;
  v12 = v10;
  v19 = v12;
  v13 = v8;
  v20 = v13;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __103__VUIMediaLibraryFetchController_beginFetchWithMediaLibraryRevision_completionHandler_completionQueue___block_invoke_18;
  v15[3] = &unk_1E9F9FD60;
  v14 = _Block_copy(aBlock);
  v16 = v14;
  v17 = a3;
  -[VUIMediaLibraryFetchController _enqueueSyncProcessingQueueBlock:](self, "_enqueueSyncProcessingQueueBlock:", v15);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

}

- (void)_startFetchWithCompletionHandler:(id)a3
{
  id v4;

  v4 = a3;
  -[VUIMediaLibraryFetchController _enqueueFetchWithReason:completionHandler:](self, "_enqueueFetchWithReason:completionHandler:", -[VUIMediaLibraryFetchController mediaLibraryRevision](self, "mediaLibraryRevision") != 0, v4);

}

- (void)_startFetchIfNeededWithMediaLibraryRevision:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  _BOOL4 v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[VUIMediaLibraryFetchController _shouldFetchForMediaLibraryRevision:](self, "_shouldFetchForMediaLibraryRevision:", a3);
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      -[VUIMediaLibraryFetchController logName](self, "logName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "[%@] - Starting fetch", (uint8_t *)&v12, 0xCu);

    }
    -[VUIMediaLibraryFetchController _startFetchWithCompletionHandler:](self, "_startFetchWithCompletionHandler:", v6);

    -[VUIMediaLibraryFetchController setState:](self, "setState:", 1);
  }
  else
  {
    if (v9)
    {
      -[VUIMediaLibraryFetchController logName](self, "logName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "[%@] - New fetch not required as the library contents have not changed", (uint8_t *)&v12, 0xCu);

    }
    (*((void (**)(id, uint64_t, _QWORD))v6 + 2))(v6, 2, 0);

  }
}

- (BOOL)_shouldFetchForMediaLibraryRevision:(unint64_t)a3
{
  return -[VUIMediaLibraryFetchController mediaLibraryRevision](self, "mediaLibraryRevision") != a3;
}

- (void)_fetchOperationCompleted:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__VUIMediaLibraryFetchController__fetchOperationCompleted_withCompletionHandler___block_invoke;
  v10[3] = &unk_1E9F9FDD0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[VUIMediaLibraryFetchController _enqueueSyncProcessingQueueBlock:](self, "_enqueueSyncProcessingQueueBlock:", v10);

}

- (void)_enqueueSyncProcessingQueueBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[VUIMediaLibraryFetchController serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__VUIMediaLibraryFetchController__enqueueSyncProcessingQueueBlock___block_invoke;
  block[3] = &unk_1E9F9A060;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_enqueueFetchWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id from;
  id location;

  v6 = a4;
  -[VUIMediaLibraryFetchController _fetchOperationForFetchReason:](self, "_fetchOperationForFetchReason:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaLibraryFetchController setFetchOperation:](self, "setFetchOperation:", v7);
  v8 = objc_alloc_init(MEMORY[0x1E0CB34C8]);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __76__VUIMediaLibraryFetchController__enqueueFetchWithReason_completionHandler___block_invoke;
  v15 = &unk_1E9F9FDA8;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  v9 = v7;
  v16 = v9;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "addExecutionBlock:", &v12);
  objc_msgSend(v8, "addDependency:", v9, v12, v13, v14, v15);
  -[VUIMediaLibraryFetchController serialFetchOperationQueue](self, "serialFetchOperationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperation:", v9);
  objc_msgSend(v11, "addOperation:", v8);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

+ (id)_logStringWithFetchControllers:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "valueForKey:", CFSTR("logName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (VUIMediaLibraryFetchController)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (void)pause
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __39__VUIMediaLibraryFetchController_pause__block_invoke;
  v2[3] = &unk_1E9F9FCA8;
  v2[4] = self;
  -[VUIMediaLibraryFetchController _enqueueSyncProcessingQueueBlock:](self, "_enqueueSyncProcessingQueueBlock:", v2);
}

void __39__VUIMediaLibraryFetchController_pause__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  if (!v4)
  {
LABEL_7:
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "logName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "[%@] - Received pause request while in the ready state. Will move to paused state", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend(v3, "_moveToPausedState");
    goto LABEL_13;
  }
  if (v4 != 2)
  {
    if (v4 != 1)
      goto LABEL_13;
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "logName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "[%@] - Received pause request while fetching. Will cancel fetch and move to paused state", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_cancelFetch");
    objc_msgSend(*(id *)(a1 + 32), "_moveToPausedState");
    goto LABEL_7;
  }
  v9 = objc_msgSend(v3, "pauseCount") + 1;
  objc_msgSend(v3, "setPauseCount:", v9);
  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "logName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v11;
    v14 = 2048;
    v15 = v9;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "[%@] - Received pause request while already in the puased state. Incremented paused count [%lu]", (uint8_t *)&v12, 0x16u);

  }
LABEL_13:

}

- (void)resume
{
  -[VUIMediaLibraryFetchController _enqueueSyncProcessingQueueBlock:](self, "_enqueueSyncProcessingQueueBlock:", &__block_literal_global_95);
}

void __40__VUIMediaLibraryFetchController_resume__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_msgSend(v2, "state");
  switch(v3)
  {
    case 0:
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v2, "logName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v9;
        v10 = "[%@] - Ignoring resume request for fetch controller as it is in the ready state";
LABEL_12:
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0xCu);

      }
LABEL_15:

      break;
    case 1:
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v2, "logName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v9;
        v10 = "[%@] - Ignoring resume request for fetch controller as it is fetching";
        goto LABEL_12;
      }
      goto LABEL_15;
    case 2:
      v4 = objc_msgSend(v2, "pauseCount");
      if (!v4)
      {
        VUIDefaultLogObject();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          __40__VUIMediaLibraryFetchController_resume__block_invoke_cold_1(v2, v6);
        goto LABEL_15;
      }
      v5 = v4 - 1;
      objc_msgSend(v2, "setPauseCount:", v4 - 1);
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          objc_msgSend(v2, "logName");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138412546;
          v13 = v8;
          v14 = 2048;
          v15 = v5;
          _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "[%@] - Decremented pause count for fetch controller. Decremented Count [%lu]", (uint8_t *)&v12, 0x16u);

        }
        goto LABEL_15;
      }
      if (v7)
      {
        objc_msgSend(v2, "logName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "[%@] - Returning fetch controller to the ready state", (uint8_t *)&v12, 0xCu);

      }
      objc_msgSend(v2, "setState:", 0);
      break;
  }

}

void __103__VUIMediaLibraryFetchController_beginFetchWithMediaLibraryRevision_completionHandler_completionQueue___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  if (v4)
  {
    if (v4 == 1)
    {
      VUIDefaultLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "logName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v9;
        _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "[%@] - Received begin fetch request for a controller that is already fetching. Will ignore", (uint8_t *)&v10, 0xCu);

      }
      goto LABEL_12;
    }
    if (v4 == 2)
    {
      VUIDefaultLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "logName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v6;
        _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "[%@] - Ignoring begin fetch request as the controller is paused", (uint8_t *)&v10, 0xCu);

      }
LABEL_12:

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }
  else
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "logName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "[%@] - Received begin fetch request for a controller that is in the ready state. Will start new fetch if required", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(v3, "_startFetchIfNeededWithMediaLibraryRevision:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }

}

- (void)cancelFetch
{
  -[VUIMediaLibraryFetchController _enqueueSyncProcessingQueueBlock:](self, "_enqueueSyncProcessingQueueBlock:", &__block_literal_global_19_2);
}

uint64_t __45__VUIMediaLibraryFetchController_cancelFetch__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cancelFetch");
}

- (id)_fetchOperationForFetchReason:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ method needs to be override by a subclass."), v5);

  return objc_alloc_init(MEMORY[0x1E0CB3818]);
}

- (void)_didCompleteFetchOperation:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ method needs to be override by a subclass."), v5);

}

- (BOOL)_updateMutableArray:(id)a3 withLatestObjects:(id)a4 changeSet:(id)a5 updateOnNoChanges:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    objc_msgSend(v9, "vui_applyChangeSet:destinationObjects:", v11, v10);
LABEL_5:
    LOBYTE(v6) = 1;
    goto LABEL_6;
  }
  if (v6)
  {
    objc_msgSend(v9, "removeAllObjects");
    objc_msgSend(v9, "addObjectsFromArray:", v10);
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (void)_moveToPausedState
{
  -[VUIMediaLibraryFetchController setState:](self, "setState:", 2);
  -[VUIMediaLibraryFetchController setPauseCount:](self, "setPauseCount:", 1);
}

- (void)_cancelFetch
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIMediaLibraryFetchController logName](self, "logName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "[%@] - Cancelling fetch", (uint8_t *)&v6, 0xCu);

  }
  -[VUIMediaLibraryFetchController fetchOperation](self, "fetchOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaLibraryFetchController setFetchOperation:](self, "setFetchOperation:", 0);
  objc_msgSend(v5, "cancel");

}

- (void)_enqueueProcessingQueueBlock:(id)a3 synchronous:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__VUIMediaLibraryFetchController__enqueueProcessingQueueBlock_synchronous___block_invoke;
    v11[3] = &unk_1E9F9FDF8;
    v8 = &v12;
    v12 = v6;
    -[VUIMediaLibraryFetchController _enqueueSyncProcessingQueueBlock:](self, "_enqueueSyncProcessingQueueBlock:", v11);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__VUIMediaLibraryFetchController__enqueueProcessingQueueBlock_synchronous___block_invoke_2;
    v9[3] = &unk_1E9F9FDF8;
    v8 = &v10;
    v10 = v6;
    -[VUIMediaLibraryFetchController _enqueueAsyncProcessingQueueBlock:](self, "_enqueueAsyncProcessingQueueBlock:", v9);
  }

}

uint64_t __75__VUIMediaLibraryFetchController__enqueueProcessingQueueBlock_synchronous___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__VUIMediaLibraryFetchController__enqueueProcessingQueueBlock_synchronous___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_enqueueAsyncProcessingQueueBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[VUIMediaLibraryFetchController serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__VUIMediaLibraryFetchController__enqueueAsyncProcessingQueueBlock___block_invoke;
  block[3] = &unk_1E9F9A060;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __68__VUIMediaLibraryFetchController__enqueueAsyncProcessingQueueBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setLogName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setLogNameSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setSerialProcessingDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, a3);
}

- (void)setSerialFetchOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialFetchOperationQueue, a3);
}

- (unint64_t)pauseCount
{
  return self->_pauseCount;
}

- (void)setPauseCount:(unint64_t)a3
{
  self->_pauseCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchOperation, 0);
  objc_storeStrong((id *)&self->_serialFetchOperationQueue, 0);
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, 0);
  objc_storeStrong((id *)&self->_logNameSuffix, 0);
  objc_storeStrong((id *)&self->_logName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

void __40__VUIMediaLibraryFetchController_resume__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "logName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "[%@] - Received resume request when we are in the paused state but we have a zero pause count! Ignoring", (uint8_t *)&v4, 0xCu);

}

@end
