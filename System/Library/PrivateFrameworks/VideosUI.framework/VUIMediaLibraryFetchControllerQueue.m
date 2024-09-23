@implementation VUIMediaLibraryFetchControllerQueue

void __73__VUIMediaLibraryFetchControllerQueue__enqueueAsyncProcessingQueueBlock___block_invoke(uint64_t a1)
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

void __72__VUIMediaLibraryFetchControllerQueue__enqueueSyncProcessingQueueBlock___block_invoke(uint64_t a1)
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

void __71__VUIMediaLibraryFetchControllerQueue__enqueueControllerFetchOperation__block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2 && (objc_msgSend(v2, "isCancelled") & 1) == 0)
    objc_msgSend(WeakRetained, "_queueOperationDidComplete:", v2);

}

void __68__VUIMediaLibraryFetchControllerQueue_defaultQueueWithMediaLibrary___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)defaultQueueWithMediaLibrary__defaultQueueByMediaLibraryIdentifier;
  defaultQueueWithMediaLibrary__defaultQueueByMediaLibraryIdentifier = (uint64_t)v0;

}

void __66__VUIMediaLibraryFetchControllerQueue__queueOperationDidComplete___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "currentFetchOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    objc_msgSend(v5, "setCurrentFetchOperation:", 0);
    objc_msgSend(v5, "_notifyDelegateFetchDidComplete");
  }

}

void __59__VUIMediaLibraryFetchControllerQueue_addFetchControllers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    +[VUIMediaLibraryFetchController _logStringWithFetchControllers:](VUIMediaLibraryFetchController, "_logStringWithFetchControllers:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Adding fetch controllers to queue: %@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "_addStateObserverForFetchControllers:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "mutableFetchControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_enqueueControllerFetchOperation");

}

- (void)setCurrentFetchOperation:(id)a3
{
  objc_storeStrong((id *)&self->_currentFetchOperation, a3);
}

- (OS_dispatch_queue)serialProcessingDispatchQueue
{
  return self->_serialProcessingDispatchQueue;
}

- (NSOperationQueue)serialFetchOperationQueue
{
  return self->_serialFetchOperationQueue;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  objc_super v19;
  _QWORD v20[4];
  id v21;

  v10 = a4;
  if (a6 != &VUIMediaLibraryFetchControllerStateKVOContext)
  {
    v19.receiver = self;
    v19.super_class = (Class)VUIMediaLibraryFetchControllerQueue;
    v11 = a5;
    -[VUIMediaLibraryFetchControllerQueue observeValueForKeyPath:ofObject:change:context:](&v19, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, v11, a6);
LABEL_9:

    goto LABEL_10;
  }
  v12 = *MEMORY[0x1E0CB2CC8];
  v13 = a5;
  objc_msgSend(v13, "objectForKey:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "unsignedIntegerValue");
  if (v15 == 2 && v17 == 0)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __86__VUIMediaLibraryFetchControllerQueue_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v20[3] = &unk_1E9F9A8C0;
    v21 = v10;
    -[VUIMediaLibraryFetchControllerQueue _enqueueAsyncProcessingQueueBlock:](self, "_enqueueAsyncProcessingQueueBlock:", v20);
    v11 = v21;
    goto LABEL_9;
  }
LABEL_10:

}

- (NSMutableArray)mutableFetchControllers
{
  return self->_mutableFetchControllers;
}

- (unint64_t)mediaLibraryRevision
{
  return self->_mediaLibraryRevision;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (VUIMediaLibraryFetchControllerQueue)initWithMediaLibrary:(id)a3
{
  id v5;
  VUIMediaLibraryFetchControllerQueue *v6;
  VUIMediaLibraryFetchControllerQueue *v7;
  NSMutableArray *v8;
  NSMutableArray *mutableFetchControllers;
  dispatch_queue_t v10;
  OS_dispatch_queue *serialProcessingDispatchQueue;
  NSOperationQueue *v12;
  NSOperationQueue *serialFetchOperationQueue;
  VUINowPlayingObserver *v14;
  VUINowPlayingObserver *nowPlayingObserver;
  void *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VUIMediaLibraryFetchControllerQueue;
  v6 = -[VUIMediaLibraryFetchControllerQueue init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaLibrary, a3);
    v7->_mediaLibraryRevision = -[VUIMediaLibrary revision](v7->_mediaLibrary, "revision");
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableFetchControllers = v7->_mutableFetchControllers;
    v7->_mutableFetchControllers = v8;

    v10 = dispatch_queue_create("com.apple.videosui.VUIMediaLibraryFetchControllerQueue.serialProcessingQueue", 0);
    serialProcessingDispatchQueue = v7->_serialProcessingDispatchQueue;
    v7->_serialProcessingDispatchQueue = (OS_dispatch_queue *)v10;

    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    serialFetchOperationQueue = v7->_serialFetchOperationQueue;
    v7->_serialFetchOperationQueue = v12;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_serialFetchOperationQueue, "setMaxConcurrentOperationCount:", 1);
    v14 = objc_alloc_init(VUINowPlayingObserver);
    nowPlayingObserver = v7->_nowPlayingObserver;
    v7->_nowPlayingObserver = v14;

    -[VUINowPlayingObserver setDelegate:](v7->_nowPlayingObserver, "setDelegate:", v7);
    -[VUINowPlayingObserver startObserving](v7->_nowPlayingObserver, "startObserving");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel__handleMediaLibraryContentsDidChangeNotification_, CFSTR("VUIMediaLibraryContentsDidChangeNotification"), v7->_mediaLibrary);

  }
  return v7;
}

- (VUIMediaLibraryFetchControllerQueueDelegate)delegate
{
  return (VUIMediaLibraryFetchControllerQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (VUIMediaLibraryFetchControllerQueueOperation)currentFetchOperation
{
  return self->_currentFetchOperation;
}

- (void)addFetchControllers:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  VUIMediaLibraryFetchControllerQueue *v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__VUIMediaLibraryFetchControllerQueue_addFetchControllers___block_invoke;
    v5[3] = &unk_1E9F9A838;
    v6 = v4;
    v7 = self;
    -[VUIMediaLibraryFetchControllerQueue _enqueueSyncProcessingQueueBlock:](self, "_enqueueSyncProcessingQueueBlock:", v5);

  }
}

- (void)addFetchController:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIMediaLibraryFetchControllerQueue addFetchControllers:](self, "addFetchControllers:", v6, v7, v8);
  }
}

- (void)_queueOperationDidComplete:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "[VUIMediaLibraryFetchControllerQueue] - VUIMediaLibraryFetchControllerQueueOperation has completed. Notifying delegates", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__VUIMediaLibraryFetchControllerQueue__queueOperationDidComplete___block_invoke;
  v7[3] = &unk_1E9F9A8C0;
  v8 = v4;
  v6 = v4;
  -[VUIMediaLibraryFetchControllerQueue _enqueueAsyncProcessingQueueBlock:](self, "_enqueueAsyncProcessingQueueBlock:", v7);

}

- (void)_notifyDelegateFetchDidComplete
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  -[VUIMediaLibraryFetchControllerQueue delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    -[VUIMediaLibraryFetchControllerQueue mediaLibrary](self, "mediaLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__VUIMediaLibraryFetchControllerQueue__notifyDelegateFetchDidComplete__block_invoke;
    v6[3] = &unk_1E9F9A938;
    objc_copyWeak(&v8, &location);
    v7 = v3;
    objc_msgSend(v5, "_enqueueCompletionQueueBlock:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

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
  -[VUIMediaLibraryFetchControllerQueue serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__VUIMediaLibraryFetchControllerQueue__enqueueSyncProcessingQueueBlock___block_invoke;
  block[3] = &unk_1E9F9A060;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_enqueueControllerFetchOperation
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  VUIMediaLibraryFetchControllerQueueOperation *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[VUIMediaLibraryFetchControllerQueue isPaused](self, "isPaused"))
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[VUIMediaLibraryFetchControllerQueue mediaLibrary](self, "mediaLibrary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "title");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "[%@] - Fetching is paused so the fetch has been deferred. It will start when fetching is resumed", buf, 0xCu);

    }
    -[VUIMediaLibraryFetchControllerQueue setShouldFetchOnResume:](self, "setShouldFetchOnResume:", 1);
  }
  else
  {
    -[VUIMediaLibraryFetchControllerQueue mutableFetchControllers](self, "mutableFetchControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[VUIMediaLibraryFetchControllerQueueOperation initWithFetchControllers:mediaLibraryRevision:]([VUIMediaLibraryFetchControllerQueueOperation alloc], "initWithFetchControllers:mediaLibraryRevision:", v6, -[VUIMediaLibraryFetchControllerQueue mediaLibraryRevision](self, "mediaLibraryRevision"));
    -[VUIMediaLibraryFetchControllerQueue currentFetchOperation](self, "currentFetchOperation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancel");

    -[VUIMediaLibraryFetchControllerQueue setCurrentFetchOperation:](self, "setCurrentFetchOperation:", v7);
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v7);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__VUIMediaLibraryFetchControllerQueue__enqueueControllerFetchOperation__block_invoke;
    v10[3] = &unk_1E9F9A8E8;
    objc_copyWeak(&v11, (id *)buf);
    objc_copyWeak(&v12, &location);
    -[VUIMediaLibraryFetchControllerQueueOperation setCompletionBlock:](v7, "setCompletionBlock:", v10);
    -[VUIMediaLibraryFetchControllerQueue serialFetchOperationQueue](self, "serialFetchOperationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addOperation:", v7);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);

  }
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
  -[VUIMediaLibraryFetchControllerQueue serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__VUIMediaLibraryFetchControllerQueue__enqueueAsyncProcessingQueueBlock___block_invoke;
  block[3] = &unk_1E9F9A060;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_addStateObserverForFetchControllers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "addObserver:forKeyPath:options:context:", self, CFSTR("state"), 3, VUIMediaLibraryFetchControllerStateKVOContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (id)defaultQueueWithMediaLibrary:(id)a3
{
  id v3;
  id v4;
  void *v5;
  VUIMediaLibraryFetchControllerQueue *v6;

  v3 = a3;
  if (defaultQueueWithMediaLibrary____onceToken != -1)
    dispatch_once(&defaultQueueWithMediaLibrary____onceToken, &__block_literal_global_19);
  v4 = (id)defaultQueueWithMediaLibrary__defaultQueueByMediaLibraryIdentifier;
  objc_sync_enter(v4);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)defaultQueueWithMediaLibrary__defaultQueueByMediaLibraryIdentifier, "objectForKey:", v5);
  v6 = (VUIMediaLibraryFetchControllerQueue *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[VUIMediaLibraryFetchControllerQueue initWithMediaLibrary:]([VUIMediaLibraryFetchControllerQueue alloc], "initWithMediaLibrary:", v3);
    objc_msgSend((id)defaultQueueWithMediaLibrary__defaultQueueByMediaLibraryIdentifier, "setObject:forKey:", v6, v5);
  }

  objc_sync_exit(v4);
  return v6;
}

- (VUIMediaLibraryFetchControllerQueue)init
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

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[VUINowPlayingObserver setDelegate:](self->_nowPlayingObserver, "setDelegate:", 0);
  -[VUINowPlayingObserver stopObserving](self->_nowPlayingObserver, "stopObserving");
  -[VUIMediaLibraryFetchControllerQueue _removeStateObserverForFetchControllers:](self, "_removeStateObserverForFetchControllers:", self->_mutableFetchControllers);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIMediaLibraryFetchControllerQueue;
  -[VUIMediaLibraryFetchControllerQueue dealloc](&v4, sel_dealloc);
}

- (NSArray)fetchControllers
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__VUIMediaLibraryFetchControllerQueue_fetchControllers__block_invoke;
  v4[3] = &unk_1E9F9A810;
  v4[4] = &v5;
  -[VUIMediaLibraryFetchControllerQueue _enqueueSyncProcessingQueueBlock:](self, "_enqueueSyncProcessingQueueBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __55__VUIMediaLibraryFetchControllerQueue_fetchControllers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "mutableFetchControllers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)removeFetchController:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIMediaLibraryFetchControllerQueue removeFetchControllers:](self, "removeFetchControllers:", v6, v7, v8);
}

- (void)removeFetchControllers:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  VUIMediaLibraryFetchControllerQueue *v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__VUIMediaLibraryFetchControllerQueue_removeFetchControllers___block_invoke;
    v5[3] = &unk_1E9F9A838;
    v6 = v4;
    v7 = self;
    -[VUIMediaLibraryFetchControllerQueue _enqueueSyncProcessingQueueBlock:](self, "_enqueueSyncProcessingQueueBlock:", v5);

  }
}

void __62__VUIMediaLibraryFetchControllerQueue_removeFetchControllers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    +[VUIMediaLibraryFetchController _logStringWithFetchControllers:](VUIMediaLibraryFetchController, "_logStringWithFetchControllers:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v5;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Passed fetch controllers to remove from queue: %@", buf, 0xCu);

  }
  objc_msgSend(v3, "mutableFetchControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = *(id *)(a1 + 32);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v6, "indexOfObjectIdenticalTo:", v13, (_QWORD)v16) != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  VUIDefaultLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    +[VUIMediaLibraryFetchController _logStringWithFetchControllers:](VUIMediaLibraryFetchController, "_logStringWithFetchControllers:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v15;
    _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "Actually removing fetch controllers from queue: %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "_removeStateObserverForFetchControllers:", v7);
  objc_msgSend(v6, "removeObjectsInArray:", v7);

}

- (void)pauseFetching
{
  -[VUIMediaLibraryFetchControllerQueue _enqueueAsyncProcessingQueueBlock:](self, "_enqueueAsyncProcessingQueueBlock:", &__block_literal_global_16);
}

uint64_t __52__VUIMediaLibraryFetchControllerQueue_pauseFetching__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPaused:", 1);
}

- (void)resumeFetching
{
  -[VUIMediaLibraryFetchControllerQueue _enqueueAsyncProcessingQueueBlock:](self, "_enqueueAsyncProcessingQueueBlock:", &__block_literal_global_17);
}

uint64_t __53__VUIMediaLibraryFetchControllerQueue_resumeFetching__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPaused:", 0);
}

- (void)nowPlayingObserver:(id)a3 latestObservationDidChange:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__VUIMediaLibraryFetchControllerQueue_nowPlayingObserver_latestObservationDidChange___block_invoke;
  v7[3] = &unk_1E9F9A8C0;
  v8 = v5;
  v6 = v5;
  -[VUIMediaLibraryFetchControllerQueue _enqueueAsyncProcessingQueueBlock:](self, "_enqueueAsyncProcessingQueueBlock:", v7);

}

void __85__VUIMediaLibraryFetchControllerQueue_nowPlayingObserver_latestObservationDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "nowPlayingAppBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "isEqualToString:", v6);
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      objc_msgSend(v3, "mediaLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v16 = 138412546;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIMediaLibraryFetchControllerQueue for %@ has detected playback has begun. Observation = %@", (uint8_t *)&v16, 0x16u);

    }
  }
  else
  {
    if (v9)
    {
      objc_msgSend(v3, "mediaLibrary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIMediaLibraryFetchControllerQueue for %@ has detected playback has ended. Will begin a refetch. Observation = %@", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(v3, "mediaLibrary");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject _postContentsDidChangeNotification](v8, "_postContentsDidChangeNotification");
  }

}

- (void)_handleMediaLibraryContentsDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("VUIMediaLibraryContentsDidChangeUserInfoKeyContentsChange"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__VUIMediaLibraryFetchControllerQueue__handleMediaLibraryContentsDidChangeNotification___block_invoke;
  v7[3] = &unk_1E9F9A8C0;
  v8 = v5;
  v6 = v5;
  -[VUIMediaLibraryFetchControllerQueue _enqueueAsyncProcessingQueueBlock:](self, "_enqueueAsyncProcessingQueueBlock:", v7);

}

void __88__VUIMediaLibraryFetchControllerQueue__handleMediaLibraryContentsDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "mediaLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "[%@] - Received contents change: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(v3, "setMediaLibraryRevision:", objc_msgSend(*(id *)(a1 + 32), "revision"));
  objc_msgSend(v3, "_handleMediaLibraryContentsChange");

}

void __86__VUIMediaLibraryFetchControllerQueue_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(id *)(a1 + 32);
  v4 = a2;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "logName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Fetch controller (%@) has resumed. Will enqueue a new fetch operation to pick up any changes.", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(v4, "_handleMediaLibraryContentsChange");

}

- (void)_removeStateObserverForFetchControllers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "removeObserver:forKeyPath:context:", self, CFSTR("state"), VUIMediaLibraryFetchControllerStateKVOContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_handleMediaLibraryContentsChange
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[VUIMediaLibraryFetchControllerQueue delayContentsChangeOperation](self, "delayContentsChangeOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      -[VUIMediaLibraryFetchControllerQueue mediaLibrary](self, "mediaLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "[%@] - Delay contents change operation is active. Waiting for delay to expire", buf, 0xCu);

    }
  }
  else
  {
    if (v5)
    {
      -[VUIMediaLibraryFetchControllerQueue mediaLibrary](self, "mediaLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "[%@] - Creating delay contents change operation", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0DC69C8], "delayOperationWithDelay:", 1.0);
    v4 = objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v4);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__VUIMediaLibraryFetchControllerQueue__handleMediaLibraryContentsChange__block_invoke;
    v10[3] = &unk_1E9F9A8E8;
    objc_copyWeak(&v11, (id *)buf);
    objc_copyWeak(&v12, &location);
    -[NSObject setCompletionBlock:](v4, "setCompletionBlock:", v10);
    -[VUIMediaLibraryFetchControllerQueue setDelayContentsChangeOperation:](self, "setDelayContentsChangeOperation:", v4);
    -[NSObject start](v4, "start");
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }

}

void __72__VUIMediaLibraryFetchControllerQueue__handleMediaLibraryContentsChange__block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2 && (objc_msgSend(v2, "isCancelled") & 1) == 0)
    objc_msgSend(WeakRetained, "_delayContentsChangeOperationDidComplete:", v2);

}

- (void)_delayContentsChangeOperationDidComplete:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__VUIMediaLibraryFetchControllerQueue__delayContentsChangeOperationDidComplete___block_invoke;
  v6[3] = &unk_1E9F9A8C0;
  v7 = v4;
  v5 = v4;
  -[VUIMediaLibraryFetchControllerQueue _enqueueAsyncProcessingQueueBlock:](self, "_enqueueAsyncProcessingQueueBlock:", v6);

}

void __80__VUIMediaLibraryFetchControllerQueue__delayContentsChangeOperationDidComplete___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "delayContentsChangeOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "mediaLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v8;
      v11 = 2048;
      v12 = objc_msgSend(v3, "mediaLibraryRevision");
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "[%@] - Delay contents change operation has completed. Starting fetching of controllers for revision: %lu", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(v3, "_enqueueControllerFetchOperation");
    objc_msgSend(v3, "setDelayContentsChangeOperation:", 0);
  }

}

- (void)setPaused:(BOOL)a3
{
  _BOOL4 paused;
  _BOOL4 v6;

  paused = self->_paused;
  if (paused != a3)
  {
    v6 = -[VUIMediaLibraryFetchControllerQueue shouldFetchOnResume](self, "shouldFetchOnResume");
    self->_paused = a3;
    -[VUIMediaLibraryFetchControllerQueue setShouldFetchOnResume:](self, "setShouldFetchOnResume:", 0);
    if (paused && v6)
      -[VUIMediaLibraryFetchControllerQueue _enqueueControllerFetchOperation](self, "_enqueueControllerFetchOperation");
  }
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
    v11[2] = __80__VUIMediaLibraryFetchControllerQueue__enqueueProcessingQueueBlock_synchronous___block_invoke;
    v11[3] = &unk_1E9F9A910;
    v8 = &v12;
    v12 = v6;
    -[VUIMediaLibraryFetchControllerQueue _enqueueSyncProcessingQueueBlock:](self, "_enqueueSyncProcessingQueueBlock:", v11);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__VUIMediaLibraryFetchControllerQueue__enqueueProcessingQueueBlock_synchronous___block_invoke_2;
    v9[3] = &unk_1E9F9A910;
    v8 = &v10;
    v10 = v6;
    -[VUIMediaLibraryFetchControllerQueue _enqueueAsyncProcessingQueueBlock:](self, "_enqueueAsyncProcessingQueueBlock:", v9);
  }

}

uint64_t __80__VUIMediaLibraryFetchControllerQueue__enqueueProcessingQueueBlock_synchronous___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__VUIMediaLibraryFetchControllerQueue__enqueueProcessingQueueBlock_synchronous___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__VUIMediaLibraryFetchControllerQueue__notifyDelegateFetchDidComplete__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  VUIDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "[VUIMediaLibraryFetchControllerQueue] - Notifying fetch did complete", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(*(id *)(a1 + 32), "fetchDidCompleteForMediaLibraryFetchControllerQueue:", WeakRetained);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setMutableFetchControllers:(id)a3
{
  objc_storeStrong((id *)&self->_mutableFetchControllers, a3);
}

- (void)setSerialProcessingDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, a3);
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (BOOL)shouldFetchOnResume
{
  return self->_shouldFetchOnResume;
}

- (void)setShouldFetchOnResume:(BOOL)a3
{
  self->_shouldFetchOnResume = a3;
}

- (void)setMediaLibraryRevision:(unint64_t)a3
{
  self->_mediaLibraryRevision = a3;
}

- (VUIDelayOperation)delayContentsChangeOperation
{
  return self->_delayContentsChangeOperation;
}

- (void)setDelayContentsChangeOperation:(id)a3
{
  objc_storeStrong((id *)&self->_delayContentsChangeOperation, a3);
}

- (void)setSerialFetchOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialFetchOperationQueue, a3);
}

- (VUINowPlayingObserver)nowPlayingObserver
{
  return self->_nowPlayingObserver;
}

- (void)setNowPlayingObserver:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingObserver, 0);
  objc_storeStrong((id *)&self->_serialFetchOperationQueue, 0);
  objc_storeStrong((id *)&self->_delayContentsChangeOperation, 0);
  objc_storeStrong((id *)&self->_currentFetchOperation, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, 0);
  objc_storeStrong((id *)&self->_mutableFetchControllers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
