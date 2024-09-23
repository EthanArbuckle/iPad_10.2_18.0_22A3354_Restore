@implementation SBSRemoteAlertHandle

- (id)_initWithHandleID:(id)a3 handleClient:(id)a4
{
  id v6;
  id v7;
  SBSRemoteAlertHandle *v8;
  SBSRemoteAlertHandle *v9;
  uint64_t Serial;
  OS_dispatch_queue *calloutSerialQueue;
  uint64_t v12;
  NSString *handleID;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBSRemoteAlertHandle;
  v8 = -[SBSRemoteAlertHandle init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    Serial = BSDispatchQueueCreateSerial();
    calloutSerialQueue = v9->_calloutSerialQueue;
    v9->_calloutSerialQueue = (OS_dispatch_queue *)Serial;

    objc_storeWeak((id *)&v9->_handleClient, v7);
    v12 = objc_msgSend(v6, "copy");
    handleID = v9->_handleID;
    v9->_handleID = (NSString *)v12;

    v9->_lock_valid = 1;
  }

  return v9;
}

+ (id)lookupHandlesForDefinition:(id)a3
{
  return (id)objc_msgSend(a1, "lookupHandlesForDefinition:creatingIfNone:", a3, 0);
}

+ (id)lookupHandlesForDefinition:(id)a3 creatingIfNone:(BOOL)a4
{
  return (id)objc_msgSend(a1, "lookupHandlesForDefinition:creatingIfNone:configurationContext:", a3, a4, 0);
}

+ (id)lookupHandlesForDefinition:(id)a3 creatingIfNone:(BOOL)a4 configurationContext:(id)a5
{
  _BOOL8 v6;
  id v9;
  SBSRemoteAlertConfigurationContext *v10;
  SBSRemoteAlertConfigurationContext *v11;
  void *v12;
  void *v13;
  void *v15;

  v6 = a4;
  v9 = a3;
  v10 = (SBSRemoteAlertConfigurationContext *)a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSRemoteAlertHandle.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("definition"));

    if (v11)
      goto LABEL_5;
  }
  if (v6)
    v11 = objc_alloc_init(SBSRemoteAlertConfigurationContext);
LABEL_5:
  objc_msgSend(a1, "defaultHandleClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteAlertHandlesForDefinition:allowsCreation:configurationContext:", v9, v6, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)newHandleWithDefinition:(id)a3 configurationContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSRemoteAlertHandle.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("definition"));

  }
  objc_msgSend(a1, "defaultHandleClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createRemoteAlertHandleWithDefinition:configurationContext:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)registerObserver:(id)a3
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
    v5 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
    v6 = self->_lock_observers;
    self->_lock_observers = v5;

    lock_observers = self->_lock_observers;
  }
  -[NSHashTable addObject:](lock_observers, "addObject:", v7);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)unregisterObserver:(id)a3
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

- (void)activateWithContext:(id)a3
{
  SBSRemoteAlertHandleClient **p_handleClient;
  id v5;
  id WeakRetained;

  p_handleClient = &self->_handleClient;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_handleClient);
  objc_msgSend(WeakRetained, "activateRemoteAlertHandle:withContext:", self, v5);

}

- (BOOL)isActive
{
  SBSRemoteAlertHandle *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_active;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  -[SBSRemoteAlertHandle _invalidateWithError:shouldInvalidateHandleClient:](self, "_invalidateWithError:shouldInvalidateHandleClient:", 0, 1);
}

- (BOOL)isValid
{
  SBSRemoteAlertHandle *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_valid;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_didActivate
{
  NSObject *calloutSerialQueue;
  _QWORD block[5];

  calloutSerialQueue = self->_calloutSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SBSRemoteAlertHandle__didActivate__block_invoke;
  block[3] = &unk_1E288DFC0;
  block[4] = self;
  dispatch_async(calloutSerialQueue, block);
}

void __36__SBSRemoteAlertHandle__didActivate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 12);
  *(_BYTE *)(v2 + 12) = 1;
  v4 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
  }
  else
  {
    v5 = (void *)objc_msgSend(*(id *)(v4 + 16), "copy");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "remoteAlertHandleDidActivate:", *(_QWORD *)(a1 + 32), (_QWORD)v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)_didDeactivate
{
  NSObject *calloutSerialQueue;
  _QWORD block[5];

  calloutSerialQueue = self->_calloutSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SBSRemoteAlertHandle__didDeactivate__block_invoke;
  block[3] = &unk_1E288DFC0;
  block[4] = self;
  dispatch_async(calloutSerialQueue, block);
}

void __38__SBSRemoteAlertHandle__didDeactivate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 12);
  *(_BYTE *)(v2 + 12) = 0;
  v4 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = (void *)objc_msgSend(*(id *)(v4 + 16), "copy");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "remoteAlertHandleDidDeactivate:", *(_QWORD *)(a1 + 32), (_QWORD)v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
  }
}

- (void)_receivedInvalidationWithError:(id)a3
{
  -[SBSRemoteAlertHandle _invalidateWithError:shouldInvalidateHandleClient:](self, "_invalidateWithError:shouldInvalidateHandleClient:", a3, 0);
}

+ (SBSRemoteAlertHandleClient)defaultHandleClient
{
  void *v2;

  v2 = (void *)sDefaultHandleClient;
  if (!sDefaultHandleClient)
  {
    if (defaultHandleClient_sOnceToken != -1)
      dispatch_once(&defaultHandleClient_sOnceToken, &__block_literal_global_29);
    v2 = (void *)sDefaultXPCHandleClient;
  }
  return (SBSRemoteAlertHandleClient *)v2;
}

void __43__SBSRemoteAlertHandle_defaultHandleClient__block_invoke()
{
  SBSRemoteAlertHandleXPCClient *v0;
  void *v1;

  v0 = objc_alloc_init(SBSRemoteAlertHandleXPCClient);
  v1 = (void *)sDefaultXPCHandleClient;
  sDefaultXPCHandleClient = (uint64_t)v0;

}

+ (void)setDefaultHandleClient:(id)a3
{
  objc_storeStrong((id *)&sDefaultHandleClient, a3);
}

- (void)_invalidateWithError:(id)a3 shouldInvalidateHandleClient:(BOOL)a4
{
  id v6;
  NSObject *calloutSerialQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  calloutSerialQueue = self->_calloutSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SBSRemoteAlertHandle__invalidateWithError_shouldInvalidateHandleClient___block_invoke;
  block[3] = &unk_1E288E9D8;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(calloutSerialQueue, block);

}

void __74__SBSRemoteAlertHandle__invalidateWithError_shouldInvalidateHandleClient___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 12);
  v4 = *(unsigned __int8 *)(v2 + 13);
  if (v4 | v3)
    v5 = (void *)objc_msgSend(*(id *)(v2 + 16), "copy");
  else
    v5 = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 13) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  if (v3)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "remoteAlertHandleDidDeactivate:", *(_QWORD *)(a1 + 32));
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v8);
    }

  }
  if (v4)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
      objc_msgSend(WeakRetained, "invalidateRemoteAlertHandle:", *(_QWORD *)(a1 + 32));

    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = v5;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v17);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v18, "remoteAlertHandle:didInvalidateWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v19);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v15);
    }

  }
}

+ (id)handleWithConfiguration:(id)a3
{
  return (id)objc_msgSend(a1, "newHandleWithDefinition:configurationContext:", a3, 0);
}

- (NSString)handleID
{
  return self->_handleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleID, 0);
  objc_destroyWeak((id *)&self->_handleClient);
  objc_storeStrong((id *)&self->_calloutSerialQueue, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
}

@end
