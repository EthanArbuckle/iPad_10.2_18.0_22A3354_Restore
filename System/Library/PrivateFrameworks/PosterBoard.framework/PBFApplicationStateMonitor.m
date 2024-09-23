@implementation PBFApplicationStateMonitor

- (PBFApplicationStateMonitor)init
{
  PBFApplicationStateMonitor *v2;
  uint64_t v3;
  BSAtomicFlag *invalidationFlag;
  uint64_t v5;
  NSHashTable *stateTrackingObservers;
  PBFApplicationStateNode *v7;
  PBFApplicationStateNode *rootNode;
  void *v9;
  void *v10;
  uint64_t v11;
  PBFApplicationStateContext *currentApplicationContext;
  uint64_t v13;
  NSMutableOrderedSet *applicationStateStack;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PBFApplicationStateMonitor;
  v2 = -[PBFApplicationStateMonitor init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
    invalidationFlag = v2->_invalidationFlag;
    v2->_invalidationFlag = (BSAtomicFlag *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    stateTrackingObservers = v2->_stateTrackingObservers;
    v2->_stateTrackingObservers = (NSHashTable *)v5;

    v7 = -[PBFApplicationStateNode initWithDescription:]([PBFApplicationStateNode alloc], "initWithDescription:", CFSTR("Application Node"));
    rootNode = v2->_rootNode;
    v2->_rootNode = v7;

    -[PBFApplicationStateNode stateDescription](v2->_rootNode, "stateDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFApplicationStateContext contextWithForegroundStateDescription:posterUUIDs:](PBFApplicationStateContext, "contextWithForegroundStateDescription:posterUUIDs:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    currentApplicationContext = v2->_currentApplicationContext;
    v2->_currentApplicationContext = (PBFApplicationStateContext *)v11;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithObject:", v2->_rootNode);
    v13 = objc_claimAutoreleasedReturnValue();
    applicationStateStack = v2->_applicationStateStack;
    v2->_applicationStateStack = (NSMutableOrderedSet *)v13;

  }
  return v2;
}

- (NSOrderedSet)applicationStateStack
{
  void *v3;
  PBFApplicationStateMonitor *v4;

  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    v3 = (void *)objc_opt_new();
  }
  else
  {
    v4 = self;
    objc_sync_enter(v4);
    v3 = (void *)-[NSMutableOrderedSet copy](v4->_applicationStateStack, "copy");
    objc_sync_exit(v4);

  }
  return (NSOrderedSet *)v3;
}

- (PBFApplicationStateContext)currentApplicationContext
{
  PBFApplicationStateContext *v3;
  PBFApplicationStateMonitor *v4;

  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = self;
    objc_sync_enter(v4);
    v3 = v4->_currentApplicationContext;
    objc_sync_exit(v4);

  }
  return v3;
}

- (void)setCurrentApplicationContext:(id)a3
{
  id v5;
  PBFApplicationStateMonitor *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    v6 = self;
    objc_sync_enter(v6);
    if (-[PBFApplicationStateContext isEqual:](v6->_currentApplicationContext, "isEqual:", v5))
    {
      objc_sync_exit(v6);

    }
    else
    {
      objc_storeStrong((id *)&v6->_currentApplicationContext, a3);
      objc_sync_exit(v6);

      PBFLogApplicationState();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v11 = v5;
        _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, "Updating currentApplicationContext: %{public}@", buf, 0xCu);
      }

      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __59__PBFApplicationStateMonitor_setCurrentApplicationContext___block_invoke;
      v8[3] = &unk_1E86F7760;
      v8[4] = v6;
      v9 = v5;
      -[PBFApplicationStateMonitor _fireStateTrackingObserverSelector:block:](v6, "_fireStateTrackingObserverSelector:block:", sel_applicationStateMonitor_contextDidUpdate_, v8);

    }
  }

}

uint64_t __59__PBFApplicationStateMonitor_setCurrentApplicationContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applicationStateMonitor:contextDidUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)pushState:(id)a3
{
  id v4;
  char v5;
  PBFApplicationStateMonitor *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag");
  if (v4 && (v5 & 1) == 0)
  {
    v6 = self;
    objc_sync_enter(v6);
    if ((-[NSMutableOrderedSet containsObject:](v6->_applicationStateStack, "containsObject:", v4) & 1) != 0)
    {
      objc_sync_exit(v6);

    }
    else
    {
      PBFLogApplicationState();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[NSMutableOrderedSet lastObject](v6->_applicationStateStack, "lastObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stateDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v13 = v4;
        v14 = 2114;
        v15 = v9;
        _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, "Pushing state %{public}@ foreground; moving %{public}@ background",
          buf,
          0x16u);

      }
      objc_msgSend(v4, "addStateObserver:", v6);
      -[NSMutableOrderedSet addObject:](v6->_applicationStateStack, "addObject:", v4);
      -[PBFApplicationStateMonitor _updateApplicationContextIfNeeded](v6, "_updateApplicationContextIfNeeded");
      objc_sync_exit(v6);

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __40__PBFApplicationStateMonitor_pushState___block_invoke;
      v10[3] = &unk_1E86F7760;
      v10[4] = v6;
      v11 = v4;
      -[PBFApplicationStateMonitor _fireStateTrackingObserverSelector:block:](v6, "_fireStateTrackingObserverSelector:block:", sel_applicationStateMonitor_didPushNewState_, v10);

    }
  }

}

uint64_t __40__PBFApplicationStateMonitor_pushState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applicationStateMonitor:didPushNewState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)addMonitorObserver:(id)a3
{
  PBFApplicationStateMonitor *v4;
  id v5;

  v5 = a3;
  if (v5 && (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    v4 = self;
    objc_sync_enter(v4);
    -[NSHashTable addObject:](v4->_stateTrackingObservers, "addObject:", v5);
    objc_sync_exit(v4);

  }
}

- (void)removeMonitorObserver:(id)a3
{
  PBFApplicationStateMonitor *v4;
  id v5;

  v5 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    v4 = self;
    objc_sync_enter(v4);
    -[NSHashTable removeObject:](v4->_stateTrackingObservers, "removeObject:", v5);
    objc_sync_exit(v4);

  }
}

- (void)invalidate
{
  PBFApplicationStateMonitor *v3;
  NSHashTable *stateTrackingObservers;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableOrderedSet *applicationStateStack;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[BSAtomicFlag setFlag:](self->_invalidationFlag, "setFlag:", 1))
  {
    v3 = self;
    objc_sync_enter(v3);
    -[NSHashTable removeAllObjects](v3->_stateTrackingObservers, "removeAllObjects");
    stateTrackingObservers = v3->_stateTrackingObservers;
    v3->_stateTrackingObservers = 0;

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = (void *)-[NSMutableOrderedSet copy](v3->_applicationStateStack, "copy", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "cancel");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    -[NSMutableOrderedSet removeAllObjects](v3->_applicationStateStack, "removeAllObjects");
    applicationStateStack = v3->_applicationStateStack;
    v3->_applicationStateStack = 0;

    objc_sync_exit(v3);
  }
}

- (void)state:(id)a3 didUpdateComponents:(id)a4
{
  id v5;
  _QWORD v6[5];
  id v7;

  v5 = a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    -[PBFApplicationStateMonitor _updateApplicationContextIfNeeded](self, "_updateApplicationContextIfNeeded");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__PBFApplicationStateMonitor_state_didUpdateComponents___block_invoke;
    v6[3] = &unk_1E86F7760;
    v6[4] = self;
    v7 = v5;
    -[PBFApplicationStateMonitor _fireStateTrackingObserverSelector:block:](self, "_fireStateTrackingObserverSelector:block:", sel_applicationStateMonitor_stateDidUpdate_, v6);

  }
}

uint64_t __56__PBFApplicationStateMonitor_state_didUpdateComponents___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applicationStateMonitor:stateDidUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)stateWasInvalidated:(id)a3
{
  PBFApplicationStateNode *v4;
  PBFApplicationStateMonitor *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  PBFApplicationStateNode *v10;
  uint8_t buf[4];
  PBFApplicationStateNode *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (PBFApplicationStateNode *)a3;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0 && self->_rootNode != v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    if ((-[NSMutableOrderedSet containsObject:](v5->_applicationStateStack, "containsObject:", v4) & 1) != 0)
    {
      -[NSMutableOrderedSet removeObject:](v5->_applicationStateStack, "removeObject:", v4);
      PBFLogApplicationState();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[NSMutableOrderedSet lastObject](v5->_applicationStateStack, "lastObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stateDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v12 = v4;
        v13 = 2114;
        v14 = v8;
        _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating state %{public}@ foreground; moving %{public}@ background",
          buf,
          0x16u);

      }
      -[PBFApplicationStateMonitor _updateApplicationContextIfNeeded](v5, "_updateApplicationContextIfNeeded");
      objc_sync_exit(v5);

      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __50__PBFApplicationStateMonitor_stateWasInvalidated___block_invoke;
      v9[3] = &unk_1E86F7760;
      v9[4] = v5;
      v10 = v4;
      -[PBFApplicationStateMonitor _fireStateTrackingObserverSelector:block:](v5, "_fireStateTrackingObserverSelector:block:", sel_applicationStateMonitor_didPopState_, v9);

    }
    else
    {
      objc_sync_exit(v5);

    }
  }

}

uint64_t __50__PBFApplicationStateMonitor_stateWasInvalidated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applicationStateMonitor:didPopState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_updateApplicationContextIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    -[PBFApplicationStateMonitor applicationStateStack](self, "applicationStateStack");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)objc_opt_new();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "components", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "posterUUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "bs_safeAddObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "stateDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFApplicationStateContext contextWithForegroundStateDescription:posterUUIDs:](PBFApplicationStateContext, "contextWithForegroundStateDescription:posterUUIDs:", v12, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[PBFApplicationStateMonitor setCurrentApplicationContext:](self, "setCurrentApplicationContext:", v13);
  }
}

- (void)_fireStateTrackingObserverSelector:(SEL)a3 block:(id)a4
{
  id v7;
  PBFApplicationStateMonitor *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  SEL v14;

  v7 = a4;
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0)
  {
    v8 = self;
    objc_sync_enter(v8);
    -[NSHashTable allObjects](v8->_stateTrackingObservers, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v8);

    if (objc_msgSend(v9, "count"))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __71__PBFApplicationStateMonitor__fireStateTrackingObserverSelector_block___block_invoke;
      v11[3] = &unk_1E86F5328;
      v12 = v9;
      v14 = a3;
      v13 = v7;
      PBFDispatchAsyncWithString(v10, QOS_CLASS_USER_INITIATED, v11);

    }
  }

}

void __71__PBFApplicationStateMonitor__fireStateTrackingObserverSelector_block___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (PBFApplicationStateNode)rootNode
{
  return (PBFApplicationStateNode *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_storeStrong((id *)&self->_currentApplicationContext, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_stateTrackingObservers, 0);
  objc_storeStrong((id *)&self->_applicationStateStack, 0);
}

@end
