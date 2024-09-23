@implementation SBSSystemNotesPresentationHandle

- (SBSSystemNotesPresentationHandle)initWithConfiguration:(id)a3
{
  id v4;
  SBSSystemNotesPresentationClientToServerProxy *v5;
  SBSSystemNotesPresentationHandle *v6;

  v4 = a3;
  v5 = objc_alloc_init(SBSSystemNotesPresentationClientToServerProxy);
  v6 = -[SBSSystemNotesPresentationHandle initWithConfiguration:client:](self, "initWithConfiguration:client:", v4, v5);

  return v6;
}

- (SBSSystemNotesPresentationHandle)initWithConfiguration:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  SBSSystemNotesPresentationHandle *v8;
  SBSSystemNotesPresentationHandle *v9;
  uint64_t v10;
  SBSSystemNotesPresentationConfiguration *configuration;
  uint64_t Serial;
  OS_dispatch_queue *calloutSerialQueue;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBSSystemNotesPresentationHandle;
  v8 = -[SBSSystemNotesPresentationHandle init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    *(_OWORD *)&v8->_lock_state = xmmword_18EBC9630;
    v10 = objc_msgSend(v6, "copy");
    configuration = v9->_configuration;
    v9->_configuration = (SBSSystemNotesPresentationConfiguration *)v10;

    objc_storeStrong((id *)&v9->_handleClient, a4);
    Serial = BSDispatchQueueCreateSerial();
    calloutSerialQueue = v9->_calloutSerialQueue;
    v9->_calloutSerialQueue = (OS_dispatch_queue *)Serial;

    -[SBSSystemNotesPresentationClientToServerProxy setDelegate:](v9->_handleClient, "setDelegate:", v9);
  }

  return v9;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_state == 1)
    -[SBSSystemNotesPresentationHandle invalidate](self, "invalidate");
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)SBSSystemNotesPresentationHandle;
  -[SBSSystemNotesPresentationHandle dealloc](&v4, sel_dealloc);
}

- (void)activate
{
  os_unfair_lock_s *p_lock;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_state)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemNotesPresentationHandle.m"), 66, CFSTR("attempting to activate a SBSSystemNotesPresentationHandle multiple times"));

  }
  self->_lock_state = 1;
  os_unfair_lock_unlock(p_lock);
  -[SBSSystemNotesPresentationClientToServerProxy activateConfiguration:](self->_handleClient, "activateConfiguration:", self->_configuration);
}

- (void)invalidate
{
  -[SBSSystemNotesPresentationHandle _invalidateWithError:locally:](self, "_invalidateWithError:locally:", 0, 1);
}

- (void)addObserver:(id)a3
{
  NSHashTable *lock_observers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_observers = self->_lock_observers;
  if (!lock_observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_lock_observers;
    self->_lock_observers = v5;

    lock_observers = self->_lock_observers;
  }
  -[NSHashTable addObject:](lock_observers, "addObject:", v7);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSHashTable *lock_observers;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v5);

  if (!-[NSHashTable count](self->_lock_observers, "count"))
  {
    lock_observers = self->_lock_observers;
    self->_lock_observers = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)presentationMode
{
  os_unfair_lock_s *p_lock;
  int64_t lock_presentationMode;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_presentationMode = self->_lock_presentationMode;
  os_unfair_lock_unlock(p_lock);
  return lock_presentationMode;
}

- (SBSSystemNotesPresentationConfiguration)requestedConfiguration
{
  return (SBSSystemNotesPresentationConfiguration *)(id)-[SBSSystemNotesPresentationConfiguration copy](self->_configuration, "copy");
}

- (void)configuration:(id)a3 didInvalidateWithError:(id)a4
{
  -[SBSSystemNotesPresentationHandle _invalidateWithError:locally:](self, "_invalidateWithError:locally:", a4, 0);
}

- (void)configuration:(id)a3 didChangeToPresentationMode:(id)a4
{
  int64_t v5;
  NSObject *calloutSerialQueue;
  _QWORD v7[6];

  v5 = objc_msgSend(a4, "integerValue", a3);
  os_unfair_lock_lock(&self->_lock);
  self->_lock_presentationMode = v5;
  os_unfair_lock_unlock(&self->_lock);
  calloutSerialQueue = self->_calloutSerialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__SBSSystemNotesPresentationHandle_configuration_didChangeToPresentationMode___block_invoke;
  v7[3] = &unk_1E288D298;
  v7[4] = self;
  v7[5] = v5;
  dispatch_async(calloutSerialQueue, v7);
}

void __78__SBSSystemNotesPresentationHandle_configuration_didChangeToPresentationMode___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "systemNotesPresentationHandle:didChangePresentationMode:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_invalidateWithError:(id)a3 locally:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  int64_t lock_state;
  NSObject *v9;
  NSObject *v10;
  NSObject *calloutSerialQueue;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  SBSSystemNotesPresentationHandle *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!v4 && !self->_lock_state)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemNotesPresentationHandle.m"), 137, CFSTR("server called back with invalidation but we're only in Initialized state"));

  }
  lock_state = self->_lock_state;
  self->_lock_state = 2;
  os_unfair_lock_unlock(&self->_lock);
  if (lock_state != 2)
  {
    SBLogSystemNotes();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SBSSystemNotesPresentationHandle _invalidateWithError:locally:].cold.1((uint64_t)self, (uint64_t)v7, v10);
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = self;
      _os_log_impl(&dword_18EB52000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidating", buf, 0xCu);
    }

    if (v4)
      -[SBSSystemNotesPresentationClientToServerProxy invalidate](self->_handleClient, "invalidate");
    calloutSerialQueue = self->_calloutSerialQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__SBSSystemNotesPresentationHandle__invalidateWithError_locally___block_invoke;
    v13[3] = &unk_1E288D940;
    v13[4] = self;
    v14 = v7;
    dispatch_async(calloutSerialQueue, v13);

  }
}

void __65__SBSSystemNotesPresentationHandle__invalidateWithError_locally___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "systemNotesPresentationHandle:didInvalidateWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_calloutSerialQueue, 0);
  objc_storeStrong((id *)&self->_handleClient, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
}

- (void)_invalidateWithError:(os_log_t)log locally:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_18EB52000, log, OS_LOG_TYPE_ERROR, "%{public}@ invalidating with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
