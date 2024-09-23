@implementation VUIMediaLibraryFetchControllerQueueOperation

intptr_t __65__VUIMediaLibraryFetchControllerQueueOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "logName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_INFO, "[%p] - Finished fetch controller %@", (uint8_t *)&v6, 0x16u);

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (unint64_t)mediaLibraryRevision
{
  return self->_mediaLibraryRevision;
}

- (VUIMediaLibraryFetchControllerQueueOperation)initWithFetchControllers:(id)a3 mediaLibraryRevision:(unint64_t)a4
{
  id v6;
  VUIMediaLibraryFetchControllerQueueOperation *v7;
  uint64_t v8;
  NSArray *fetchControllers;
  objc_super v11;

  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("fetchControllers"));
  v11.receiver = self;
  v11.super_class = (Class)VUIMediaLibraryFetchControllerQueueOperation;
  v7 = -[VUIMediaLibraryFetchControllerQueueOperation init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    fetchControllers = v7->_fetchControllers;
    v7->_fetchControllers = (NSArray *)v8;

    v7->_mediaLibraryRevision = a4;
  }

  return v7;
}

- (NSArray)fetchControllers
{
  return self->_fetchControllers;
}

- (void)executionDidBegin
{
  void *v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  dispatch_semaphore_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id obj;
  _QWORD v21[6];
  dispatch_semaphore_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  VUIMediaLibraryFetchControllerQueueOperation *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[VUIMediaLibraryFetchControllerQueueOperation fetchControllers](self, "fetchControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    +[VUIMediaLibraryFetchController _logStringWithFetchControllers:](VUIMediaLibraryFetchController, "_logStringWithFetchControllers:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v29 = self;
    v30 = 2112;
    v31 = v5;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_INFO, "[%p] - Begining VUIMediaLibraryFetchControllerQueueOperation for controllers: %@", buf, 0x16u);

  }
  v6 = -[VUIMediaLibraryFetchControllerQueueOperation mediaLibraryRevision](self, "mediaLibraryRevision");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v13 = dispatch_semaphore_create(0);
        VUIDefaultLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v12, "logName");
          v15 = v10;
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v29 = self;
          v30 = 2112;
          v31 = v16;
          _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_INFO, "[%p] - Starting fetch controller %@", buf, 0x16u);

          v10 = v15;
        }

        v21[0] = v10;
        v21[1] = 3221225472;
        v21[2] = __65__VUIMediaLibraryFetchControllerQueueOperation_executionDidBegin__block_invoke;
        v21[3] = &unk_1E9FA37F8;
        v21[4] = self;
        v21[5] = v12;
        v22 = v13;
        dispatch_get_global_queue(0, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v13;
        objc_msgSend(v12, "beginFetchWithMediaLibraryRevision:completionHandler:completionQueue:", v6, v21, v17);

        dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  VUIDefaultLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v29 = self;
    _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_INFO, "[%p] - All fetches finished. Finishing VUIMediaLibraryFetchControllerQueueOperation operation", buf, 0xCu);
  }

  -[VUIAsynchronousOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchControllers, 0);
}

- (VUIMediaLibraryFetchControllerQueueOperation)init
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

- (void)setFetchControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)setMediaLibraryRevision:(unint64_t)a3
{
  self->_mediaLibraryRevision = a3;
}

@end
