@implementation VUIMPMediaItemDownloadController

- (VUIMPMediaItemDownloadController)initWithMediaItem:(id)a3 state:(id)a4 serialProcessingDispatchQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  VUIMPMediaItemDownloadController *v12;
  VUIMPMediaItemDownloadController *v13;
  uint64_t v14;
  VUIMPMediaItemDownloadControllerState *state;
  uint64_t v16;
  OS_dispatch_queue *observerDispatchQueue;
  uint64_t v18;
  NSHashTable *observers;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)VUIMPMediaItemDownloadController;
  v12 = -[VUIMPMediaItemDownloadController init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mediaItem, a3);
    v14 = objc_msgSend(v10, "copy");
    state = v13->_state;
    v13->_state = (VUIMPMediaItemDownloadControllerState *)v14;

    objc_storeStrong((id *)&v13->_serialProcessingDispatchQueue, a5);
    dispatch_get_global_queue(21, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    observerDispatchQueue = v13->_observerDispatchQueue;
    v13->_observerDispatchQueue = (OS_dispatch_queue *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v18;

  }
  return v13;
}

- (VUIMPMediaItemDownloadController)init
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

- (VUIMPMediaItemDownloadControllerState)state
{
  VUIMPMediaItemDownloadController *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[VUIMPMediaItemDownloadControllerState copy](v2->_state, "copy");
  objc_sync_exit(v2);

  return (VUIMPMediaItemDownloadControllerState *)v3;
}

- (BOOL)supportsPausing
{
  return 1;
}

- (BOOL)supportsCancellation
{
  return !-[VUIMPMediaItemDownloadController isRestoreDownload](self, "isRestoreDownload");
}

- (BOOL)isRestoreDownload
{
  return 0;
}

- (void)invalidate
{
  -[VUIMPMediaItemDownloadController _enqueueAsyncStrongSelfProcessingQueueBlock:](self, "_enqueueAsyncStrongSelfProcessingQueueBlock:", &__block_literal_global_106);
}

uint64_t __46__VUIMPMediaItemDownloadController_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_onProcessingQueue_invalidate");
}

- (void)cancelDownload
{
  -[VUIMPMediaItemDownloadController _enqueueAsyncStrongSelfProcessingQueueBlock:](self, "_enqueueAsyncStrongSelfProcessingQueueBlock:", &__block_literal_global_3_1);
}

void __50__VUIMPMediaItemDownloadController_cancelDownload__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "supportsCancellation"))
    objc_msgSend(v2, "_onProcessingQueue_cancelDownload");

}

- (void)pauseDownload
{
  -[VUIMPMediaItemDownloadController _enqueueAsyncStrongSelfProcessingQueueBlock:](self, "_enqueueAsyncStrongSelfProcessingQueueBlock:", &__block_literal_global_4_1);
}

void __49__VUIMPMediaItemDownloadController_pauseDownload__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "supportsPausing"))
    objc_msgSend(v2, "_onProcessingQueue_pauseDownload");

}

- (void)resumeDownload
{
  -[VUIMPMediaItemDownloadController _enqueueAsyncStrongSelfProcessingQueueBlock:](self, "_enqueueAsyncStrongSelfProcessingQueueBlock:", &__block_literal_global_5_1);
}

void __50__VUIMPMediaItemDownloadController_resumeDownload__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "supportsPausing"))
    objc_msgSend(v2, "_onProcessingQueue_resumeDownload");

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("observer"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__VUIMPMediaItemDownloadController_addObserver___block_invoke;
  v6[3] = &unk_1E9FA0918;
  v7 = v4;
  v5 = v4;
  -[VUIMPMediaItemDownloadController _enqueueAsyncStrongSelfProcessingQueueBlock:](self, "_enqueueAsyncStrongSelfProcessingQueueBlock:", v6);

}

void __48__VUIMPMediaItemDownloadController_addObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "observers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("observer"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__VUIMPMediaItemDownloadController_removeObserver___block_invoke;
  v6[3] = &unk_1E9FA0918;
  v7 = v4;
  v5 = v4;
  -[VUIMPMediaItemDownloadController _enqueueAsyncStrongSelfProcessingQueueBlock:](self, "_enqueueAsyncStrongSelfProcessingQueueBlock:", v6);

}

void __51__VUIMPMediaItemDownloadController_removeObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "observers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));

}

- (void)_setState:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__VUIMPMediaItemDownloadController__setState___block_invoke;
  v6[3] = &unk_1E9FA0918;
  v7 = v4;
  v5 = v4;
  -[VUIMPMediaItemDownloadController _enqueueAsyncStrongSelfProcessingQueueBlock:](self, "_enqueueAsyncStrongSelfProcessingQueueBlock:", v6);

}

uint64_t __46__VUIMPMediaItemDownloadController__setState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_onProcessingQueue_setState:", *(_QWORD *)(a1 + 32));
}

- (void)_enqueueAsyncStrongSelfProcessingQueueBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__VUIMPMediaItemDownloadController__enqueueAsyncStrongSelfProcessingQueueBlock___block_invoke;
  v6[3] = &unk_1E9F9A060;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[VUIMPMediaItemDownloadController _enqueueAsyncProcessingQueueBlock:](self, "_enqueueAsyncProcessingQueueBlock:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __80__VUIMPMediaItemDownloadController__enqueueAsyncStrongSelfProcessingQueueBlock___block_invoke(uint64_t a1)
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

- (void)_enqueueAsyncProcessingQueueBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[VUIMPMediaItemDownloadController serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__VUIMPMediaItemDownloadController__enqueueAsyncProcessingQueueBlock___block_invoke;
  block[3] = &unk_1E9F98E68;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

uint64_t __70__VUIMPMediaItemDownloadController__enqueueAsyncProcessingQueueBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_enqueueObserverQueueBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[VUIMPMediaItemDownloadController observerDispatchQueue](self, "observerDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__VUIMPMediaItemDownloadController__enqueueObserverQueueBlock___block_invoke;
  block[3] = &unk_1E9F98E68;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

uint64_t __63__VUIMPMediaItemDownloadController__enqueueObserverQueueBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_onProcessingQueue_setState:(id)a3
{
  id v4;
  VUIMPMediaItemDownloadController *v5;
  uint64_t v6;
  VUIMPMediaItemDownloadControllerState *state;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[VUIMPMediaItemDownloadControllerState isEqual:](v5->_state, "isEqual:", v4))
  {
    v6 = objc_msgSend(v4, "copy");
    state = v5->_state;
    v5->_state = (VUIMPMediaItemDownloadControllerState *)v6;

    v8 = (void *)objc_msgSend(v4, "copy");
    -[VUIMPMediaItemDownloadController observers](v5, "observers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    objc_initWeak(&location, v5);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__VUIMPMediaItemDownloadController__onProcessingQueue_setState___block_invoke;
    v13[3] = &unk_1E9F99000;
    objc_copyWeak(&v16, &location);
    v11 = v10;
    v14 = v11;
    v12 = v8;
    v15 = v12;
    -[VUIMPMediaItemDownloadController _enqueueObserverQueueBlock:](v5, "_enqueueObserverQueueBlock:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  objc_sync_exit(v5);

}

void __64__VUIMPMediaItemDownloadController__onProcessingQueue_setState___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_notifyObservers:stateDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_notifyObservers:(id)a3 stateDidChange:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "mediaItemDownloadController:stateDidChange:", self, v7);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (OS_dispatch_queue)observerDispatchQueue
{
  return self->_observerDispatchQueue;
}

- (void)setObserverDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_observerDispatchQueue, a3);
}

- (MPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)serialProcessingDispatchQueue
{
  return self->_serialProcessingDispatchQueue;
}

- (void)setSerialProcessingDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_observerDispatchQueue, 0);
}

@end
