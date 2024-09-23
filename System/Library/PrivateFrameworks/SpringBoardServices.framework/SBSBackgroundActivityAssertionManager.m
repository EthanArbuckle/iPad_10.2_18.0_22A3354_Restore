@implementation SBSBackgroundActivityAssertionManager

- (SBSBackgroundActivityAssertionManager)init
{
  SBSBackgroundActivityAssertionManager *v2;
  uint64_t v3;
  NSMapTable *assertionsByIdentifier;
  uint64_t v5;
  NSMutableDictionary *acquisitionHandlerEntriesByIdentifier;
  uint64_t Serial;
  OS_dispatch_queue *internalQueue;
  uint64_t v9;
  OS_dispatch_queue *coordinatorCalloutQueue;
  id v11;
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBSBackgroundActivityAssertionManager;
  v2 = -[SBSBackgroundActivityAssertionManager init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    assertionsByIdentifier = v2->_assertionsByIdentifier;
    v2->_assertionsByIdentifier = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    acquisitionHandlerEntriesByIdentifier = v2->_acquisitionHandlerEntriesByIdentifier;
    v2->_acquisitionHandlerEntriesByIdentifier = (NSMutableDictionary *)v5;

    Serial = BSDispatchQueueCreateSerial();
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)Serial;

    v9 = BSDispatchQueueCreateSerial();
    coordinatorCalloutQueue = v2->_coordinatorCalloutQueue;
    v2->_coordinatorCalloutQueue = (OS_dispatch_queue *)v9;

    objc_initWeak(&location, v2);
    objc_copyWeak(&v13, &location);
    v11 = (id)BSLogAddStateCaptureBlockWithTitle();
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __45__SBSBackgroundActivityAssertionManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_43);
  return (id)sharedInstance___sharedBackgroundActivityAssertionManager;
}

void __55__SBSBackgroundActivityAssertionManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___sharedBackgroundActivityAssertionManager;
  sharedInstance___sharedBackgroundActivityAssertionManager = v0;

}

- (void)_internalQueue_setupXPCConnectionIfNecessary
{
  NSXPCConnection *v4;
  NSXPCConnection *sbXPCConnection;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  uint64_t v11;
  NSXPCConnection *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17[2];
  _QWORD v18[4];
  id v19;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (!self->_sbXPCConnection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.springboard.statusbarservices"), 0);
    sbXPCConnection = self->_sbXPCConnection;
    self->_sbXPCConnection = v4;

    v6 = self->_sbXPCConnection;
    SBSBackgroundActivityAssertionClientInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v6, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_sbXPCConnection, "setExportedObject:", self);
    v8 = self->_sbXPCConnection;
    SBBackgroundActivityAssertionServerInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    objc_initWeak(&location, self);
    v10 = self->_sbXPCConnection;
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __85__SBSBackgroundActivityAssertionManager__internalQueue_setupXPCConnectionIfNecessary__block_invoke;
    v18[3] = &unk_1E288F7B8;
    objc_copyWeak(&v19, &location);
    -[NSXPCConnection setInterruptionHandler:](v10, "setInterruptionHandler:", v18);
    v12 = self->_sbXPCConnection;
    v13 = v11;
    v14 = 3221225472;
    v15 = __85__SBSBackgroundActivityAssertionManager__internalQueue_setupXPCConnectionIfNecessary__block_invoke_2;
    v16 = &unk_1E288FB48;
    v17[1] = (id)a2;
    objc_copyWeak(v17, &location);
    -[NSXPCConnection setInvalidationHandler:](v12, "setInvalidationHandler:", &v13);
    -[NSXPCConnection resume](self->_sbXPCConnection, "resume", v13, v14, v15, v16);
    objc_destroyWeak(v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __85__SBSBackgroundActivityAssertionManager__internalQueue_setupXPCConnectionIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reactivateAssertions");
  objc_msgSend(WeakRetained, "_registerBackgroundActivityCoordinatorAfterInterruption");

}

void __85__SBSBackgroundActivityAssertionManager__internalQueue_setupXPCConnectionIfNecessary__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  SBLogStatusBarish();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __85__SBSBackgroundActivityAssertionManager__internalQueue_setupXPCConnectionIfNecessary__block_invoke_2_cold_1(a1, v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleXPCConnectionInvalidation");

}

- (void)addBackgroundActivityAssertion:(id)a3 withHandler:(id)a4 onQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__SBSBackgroundActivityAssertionManager_addBackgroundActivityAssertion_withHandler_onQueue___block_invoke;
  v15[3] = &unk_1E288FBC0;
  v15[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(internalQueue, v15);

}

void __92__SBSBackgroundActivityAssertionManager_addBackgroundActivityAssertion_withHandler_onQueue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  SBSBackgroundActivityAssertionAcquisitionHandlerEntry *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_internalQueue_setupXPCConnectionIfNecessary");
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", *(_QWORD *)(a1 + 40), v2);
  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  if (*(_QWORD *)(a1 + 56))
  {
    v6 = -[SBSBackgroundActivityAssertionAcquisitionHandlerEntry initWithHandler:queue:]([SBSBackgroundActivityAssertionAcquisitionHandlerEntry alloc], "initWithHandler:queue:", *(_QWORD *)(a1 + 56), v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v6, v2);

  }
  objc_msgSend(*(id *)(a1 + 40), "assertionData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogStatusBarish();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v7;
    _os_log_impl(&dword_18EB52000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to add style override assertion: %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__SBSBackgroundActivityAssertionManager_addBackgroundActivityAssertion_withHandler_onQueue___block_invoke_97;
  v13[3] = &unk_1E288FB98;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v2;
  v15 = v7;
  v11 = v7;
  v12 = v2;
  objc_msgSend(v9, "activateBackgroundActivityAssertions:reply:", v10, v13);

}

void __92__SBSBackgroundActivityAssertionManager_addBackgroundActivityAssertion_withHandler_onQueue___block_invoke_97(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__SBSBackgroundActivityAssertionManager_addBackgroundActivityAssertion_withHandler_onQueue___block_invoke_2;
  v8[3] = &unk_1E288EFA8;
  v8[4] = v4;
  v9 = v5;
  v10 = v3;
  v11 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(v6, v8);

}

void __92__SBSBackgroundActivityAssertionManager_addBackgroundActivityAssertion_withHandler_onQueue___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  char v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "BOOLValue"))
    {
      SBLogStatusBarish();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        v16 = v7;
        _os_log_impl(&dword_18EB52000, v6, OS_LOG_TYPE_DEFAULT, "Successfully added style override assertion: %{public}@", buf, 0xCu);
      }

      v8 = 1;
      if (!v3)
        goto LABEL_14;
    }
    else
    {
      SBLogStatusBarish();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        v16 = v10;
        _os_log_impl(&dword_18EB52000, v9, OS_LOG_TYPE_DEFAULT, "Failed to add style override assertion: %{public}@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
      v8 = 0;
      if (!v3)
        goto LABEL_14;
    }
    objc_msgSend(v3, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __92__SBSBackgroundActivityAssertionManager_addBackgroundActivityAssertion_withHandler_onQueue___block_invoke_98;
    v12[3] = &unk_1E288FB70;
    v13 = v3;
    v14 = v8;
    dispatch_async(v11, v12);

LABEL_14:
  }

}

void __92__SBSBackgroundActivityAssertionManager_addBackgroundActivityAssertion_withHandler_onQueue___block_invoke_98(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(unsigned __int8 *)(a1 + 40));

}

- (void)removeBackgroundActivityAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *internalQueue;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  SBSBackgroundActivityAssertionManager *v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertionData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SBSBackgroundActivityAssertionManager_removeBackgroundActivityAssertion___block_invoke;
  block[3] = &unk_1E288E060;
  v11 = v6;
  v12 = self;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(internalQueue, block);

}

void __75__SBSBackgroundActivityAssertionManager_removeBackgroundActivityAssertion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogStatusBarish();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_18EB52000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to remove style override assertion: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_internalQueue_removeBackgroundActivityAssertionWithIdentifier:invalidate:", *(_QWORD *)(a1 + 48), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateBackgroundActivityAssertionsWithIdentifiers:", v5);

}

- (void)updateStatusStringForAssertion:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SBSBackgroundActivityAssertionManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__SBSBackgroundActivityAssertionManager_updateStatusStringForAssertion___block_invoke;
  v7[3] = &unk_1E288D940;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __72__SBSBackgroundActivityAssertionManager_updateStatusStringForAssertion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "remoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "statusString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setStatusString:forAssertionWithIdentifier:", v4, v5);

  }
}

- (void)invalidateBackgroundActivityAssertionsWithIdentifiers:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SBSBackgroundActivityAssertionManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__SBSBackgroundActivityAssertionManager_invalidateBackgroundActivityAssertionsWithIdentifiers___block_invoke;
  v7[3] = &unk_1E288D940;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __95__SBSBackgroundActivityAssertionManager_invalidateBackgroundActivityAssertionsWithIdentifiers___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  SBLogStatusBarish();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v15 = v3;
    _os_log_impl(&dword_18EB52000, v2, OS_LOG_TYPE_DEFAULT, "Style override assertions invalidated: %{public}@", buf, 0xCu);
  }

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(a1 + 40), "_internalQueue_removeBackgroundActivityAssertionWithIdentifier:invalidate:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 1, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)statusBarTappedWithContext:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SBSBackgroundActivityAssertionManager_statusBarTappedWithContext_reply___block_invoke;
  block[3] = &unk_1E288FBE8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(internalQueue, block);

}

void __74__SBSBackgroundActivityAssertionManager_statusBarTappedWithContext_reply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__SBSBackgroundActivityAssertionManager_statusBarTappedWithContext_reply___block_invoke_2;
    block[3] = &unk_1E288D500;
    v9 = *(id *)(a1 + 48);
    v7 = v3;
    v8 = *(id *)(a1 + 40);
    v5 = v3;
    dispatch_async(v4, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __74__SBSBackgroundActivityAssertionManager_statusBarTappedWithContext_reply___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D87D70], "identifierWithPid:", getpid());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithProcessIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskUninterruptable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87C98]), "initWithExplanation:target:attributes:", CFSTR("SBSBackgroundActivityCoordinatorDelegateCompletionBlock"), v3, v5);
  if ((objc_msgSend(v6, "acquireWithError:", 0) & 1) == 0)
  {
    SBLogStatusBarish();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EB52000, v7, OS_LOG_TYPE_DEFAULT, "SBSBackgroundActivityCoordinator: Could not take process assertion for delivering event to delegate.", buf, 2u);
    }

  }
  (*(void (**)(void))(a1[6] + 16))();
  v9 = (void *)a1[4];
  v8 = a1[5];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__SBSBackgroundActivityAssertionManager_statusBarTappedWithContext_reply___block_invoke_111;
  v11[3] = &unk_1E288DFC0;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "_handleStatusBarTapWithContext:withCompletionBlock:", v8, v11);

}

uint64_t __74__SBSBackgroundActivityAssertionManager_statusBarTappedWithContext_reply___block_invoke_111(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (NSString)description
{
  return (NSString *)-[SBSBackgroundActivityAssertionManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSBackgroundActivityAssertionManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSBackgroundActivityAssertionManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBSBackgroundActivityAssertionManager *v11;

  v4 = a3;
  -[SBSBackgroundActivityAssertionManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__SBSBackgroundActivityAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E288D940;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __79__SBSBackgroundActivityAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "assertionsByIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendArraySection:withName:skipIfEmpty:", v3, CFSTR("assertions"), 0);

}

- (void)_internalQueue_removeBackgroundActivityAssertionWithIdentifier:(id)a3 invalidate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_QWORD *);
  void *v15;
  SBSBackgroundActivityAssertionManager *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[NSMapTable objectForKey:](self->_assertionsByIdentifier, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_acquisitionHandlerEntriesByIdentifier, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_acquisitionHandlerEntriesByIdentifier, "removeObjectForKey:", v6);
    if (v4)
    {
      objc_msgSend(v8, "queue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __115__SBSBackgroundActivityAssertionManager__internalQueue_removeBackgroundActivityAssertionWithIdentifier_invalidate___block_invoke;
      block[3] = &unk_1E288DFC0;
      v20 = v8;
      dispatch_async(v9, block);

    }
  }
  if (v7)
  {
    objc_msgSend(v7, "invalidationHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (v8 || !v4)
      {
        objc_msgSend(v7, "setInvalidationHandler:", 0);
      }
      else
      {
        dispatch_get_global_queue(0, 0);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = MEMORY[0x1E0C809B0];
        v13 = 3221225472;
        v14 = __115__SBSBackgroundActivityAssertionManager__internalQueue_removeBackgroundActivityAssertionWithIdentifier_invalidate___block_invoke_2;
        v15 = &unk_1E288D500;
        v18 = v10;
        v16 = self;
        v17 = v7;
        dispatch_async(v11, &v12);

      }
    }
    -[NSMapTable removeObjectForKey:](self->_assertionsByIdentifier, "removeObjectForKey:", v6, v12, v13, v14, v15, v16);

  }
}

void __115__SBSBackgroundActivityAssertionManager__internalQueue_removeBackgroundActivityAssertionWithIdentifier_invalidate___block_invoke(uint64_t a1)
{
  void (**v1)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v1 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v1[2](v1, 0);

}

void __115__SBSBackgroundActivityAssertionManager__internalQueue_removeBackgroundActivityAssertionWithIdentifier_invalidate___block_invoke_2(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  (*(void (**)(void))(a1[6] + 16))();
  v2 = (void *)a1[5];
  v3 = *(NSObject **)(a1[4] + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__SBSBackgroundActivityAssertionManager__internalQueue_removeBackgroundActivityAssertionWithIdentifier_invalidate___block_invoke_3;
  block[3] = &unk_1E288DFC0;
  v5 = v2;
  dispatch_async(v3, block);

}

uint64_t __115__SBSBackgroundActivityAssertionManager__internalQueue_removeBackgroundActivityAssertionWithIdentifier_invalidate___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInvalidationHandler:", 0);
}

- (void)updateRegistrationForCoordinator:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__SBSBackgroundActivityAssertionManager_updateRegistrationForCoordinator_reply___block_invoke;
  block[3] = &unk_1E288FC10;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __80__SBSBackgroundActivityAssertionManager_updateRegistrationForCoordinator_reply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_updateRegistrationForCoordinator:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_internalQueue_updateRegistrationForCoordinator:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *coordinatorCalloutQueue;
  id v15;
  id v16;
  NSXPCConnection *sbXPCConnection;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  id v27;
  SBSBackgroundActivityAssertionManager *v28;
  id v29;
  _QWORD block[4];
  id v31;
  id v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBSBackgroundActivityAssertionManager _internalQueue_setupXPCConnectionIfNecessary](self, "_internalQueue_setupXPCConnectionIfNecessary");
  WeakRetained = objc_loadWeakRetained((id *)&self->_internalQueue_backgroundActivityCoordinator);

  if (WeakRetained)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    v34[0] = CFSTR("There is already a coordinator registered for this background activity within this process.");
    v33[0] = v10;
    v33[1] = CFSTR("SBSBackgroundActivityCoordinatorErrorBackgroundActivityIdentifiersKey");
    objc_msgSend(v6, "backgroundActivityIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("SBSBackgroundActivityCoordinatorErrorDomain"), 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    coordinatorCalloutQueue = self->_coordinatorCalloutQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke;
    block[3] = &unk_1E288D2E8;
    v31 = v13;
    v32 = v7;
    v15 = v13;
    v16 = v7;
    dispatch_async(coordinatorCalloutQueue, block);

  }
  else
  {
    sbXPCConnection = self->_sbXPCConnection;
    v18 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_2;
    v26[3] = &unk_1E288FC38;
    v19 = v6;
    v27 = v19;
    v28 = self;
    v20 = v7;
    v29 = v20;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](sbXPCConnection, "remoteObjectProxyWithErrorHandler:", v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_internalQueue_backgroundActivityCoordinator, v19);
    objc_msgSend(v19, "backgroundActivityIdentifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_4;
    v24[3] = &unk_1E288D768;
    v24[4] = self;
    v25 = v20;
    v23 = v20;
    objc_msgSend(v21, "setRegisteredBackgroundActivityIdentifiers:reply:", v22, v24);

    v15 = v27;
  }

}

uint64_t __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0CB2D50];
  v17[0] = CFSTR("Error getting remote proxy");
  v16[0] = v4;
  v16[1] = CFSTR("SBSBackgroundActivityCoordinatorErrorBackgroundActivityIdentifiersKey");
  v5 = (void *)a1[4];
  v6 = a2;
  objc_msgSend(v5, "backgroundActivityIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = *MEMORY[0x1E0CB3388];
  v17[1] = v7;
  v17[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("SBSBackgroundActivityCoordinatorErrorDomain"), 3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)a1[6];
  v11 = *(NSObject **)(a1[5] + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_3;
  block[3] = &unk_1E288D2E8;
  v14 = v9;
  v15 = v10;
  v12 = v9;
  dispatch_async(v11, block);

}

uint64_t __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_5;
  block[3] = &unk_1E288FC10;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

void __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_5(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (*(_QWORD *)(a1 + 32))
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 40), 0);
  v2 = *(void **)(a1 + 48);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_6;
  v4[3] = &unk_1E288D2E8;
  v6 = v2;
  v5 = *(id *)(a1 + 32);
  dispatch_async(v3, v4);

}

uint64_t __95__SBSBackgroundActivityAssertionManager__internalQueue_updateRegistrationForCoordinator_reply___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_registerBackgroundActivityCoordinatorAfterInterruption
{
  NSObject *v3;
  NSObject *internalQueue;
  _QWORD block[5];
  uint8_t buf[16];

  SBLogStatusBarish();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "SBSBackgroundActivityCoordinator: XPC interrupted, registering style override coordinators again", buf, 2u);
  }

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__SBSBackgroundActivityAssertionManager__registerBackgroundActivityCoordinatorAfterInterruption__block_invoke;
  block[3] = &unk_1E288DFC0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __96__SBSBackgroundActivityAssertionManager__registerBackgroundActivityCoordinatorAfterInterruption__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[5];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 40), 0);
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __96__SBSBackgroundActivityAssertionManager__registerBackgroundActivityCoordinatorAfterInterruption__block_invoke_2;
    v4[3] = &unk_1E288FC60;
    v4[4] = v3;
    v5 = WeakRetained;
    objc_msgSend(v3, "_internalQueue_updateRegistrationForCoordinator:reply:", v5, v4);

  }
}

void __96__SBSBackgroundActivityAssertionManager__registerBackgroundActivityCoordinatorAfterInterruption__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  uint8_t buf[16];

  v3 = a2;
  SBLogStatusBarish();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18EB52000, v4, OS_LOG_TYPE_DEFAULT, "SBSBackgroundActivityCoordinator: re-registering after interruption.", buf, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(v5 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__SBSBackgroundActivityAssertionManager__registerBackgroundActivityCoordinatorAfterInterruption__block_invoke_119;
  block[3] = &unk_1E288E060;
  v10 = v3;
  v11 = v5;
  v12 = v6;
  v8 = v3;
  dispatch_async(v7, block);

}

void __96__SBSBackgroundActivityAssertionManager__registerBackgroundActivityCoordinatorAfterInterruption__block_invoke_119(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 48);
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 48);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __96__SBSBackgroundActivityAssertionManager__registerBackgroundActivityCoordinatorAfterInterruption__block_invoke_2_120;
    v4[3] = &unk_1E288D940;
    v5 = v2;
    v6 = *(id *)(a1 + 32);
    dispatch_async(v3, v4);

  }
}

uint64_t __96__SBSBackgroundActivityAssertionManager__registerBackgroundActivityCoordinatorAfterInterruption__block_invoke_2_120(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registrationInvalidated:", *(_QWORD *)(a1 + 40));
}

- (void)unregisterCoordinator
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SBSBackgroundActivityAssertionManager_unregisterCoordinator__block_invoke;
  block[3] = &unk_1E288DFC0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __62__SBSBackgroundActivityAssertionManager_unregisterCoordinator__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_121_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogStatusBarish();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "SBSBackgroundActivityCoordinator: Cleaning up _BackgroundActivityCoordinator, and cancelling.", v4, 2u);
  }

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 40), 0);
  objc_msgSend(v2, "setRegisteredBackgroundActivityIdentifiers:reply:", 0, &__block_literal_global_123_0);

}

void __62__SBSBackgroundActivityAssertionManager_unregisterCoordinator__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  SBLogStatusBarish();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18EB52000, v0, OS_LOG_TYPE_DEFAULT, "SBSBackgroundActivityCoordinator: Error communicating with SpringBoard.", v1, 2u);
  }

}

- (void)_handleXPCConnectionInvalidation
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__SBSBackgroundActivityAssertionManager__handleXPCConnectionInvalidation__block_invoke;
  block[3] = &unk_1E288DFC0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __73__SBSBackgroundActivityAssertionManager__handleXPCConnectionInvalidation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "keyEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "_internalQueue_removeBackgroundActivityAssertionWithIdentifier:invalidate:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 1);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_reactivateAssertions
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SBSBackgroundActivityAssertionManager__reactivateAssertions__block_invoke;
  block[3] = &unk_1E288DFC0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __62__SBSBackgroundActivityAssertionManager__reactivateAssertions__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "assertionData");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v10);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  SBLogStatusBarish();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18EB52000, v11, OS_LOG_TYPE_DEFAULT, "Re-activating style override assertions after interruption", buf, 2u);
  }

  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__SBSBackgroundActivityAssertionManager__reactivateAssertions__block_invoke_125;
    v13[3] = &unk_1E288FCA8;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v2;
    objc_msgSend(v12, "activateBackgroundActivityAssertions:reply:", v14, v13);

  }
}

void __62__SBSBackgroundActivityAssertionManager__reactivateAssertions__block_invoke_125(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SBSBackgroundActivityAssertionManager__reactivateAssertions__block_invoke_2;
  block[3] = &unk_1E288E060;
  v8 = v4;
  v9 = v3;
  v10 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  dispatch_async(v5, block);

}

void __62__SBSBackgroundActivityAssertionManager__reactivateAssertions__block_invoke_2(id *a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v14;
  _QWORD block[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v18;
    *(_QWORD *)&v4 = 138543362;
    v14 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7), "uniqueIdentifier", v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9 && objc_msgSend(v9, "BOOLValue"))
        {
          objc_msgSend(*((id *)a1[6] + 2), "objectForKey:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(*((id *)a1[6] + 2), "removeObjectForKey:", v8);
            objc_msgSend(v11, "queue");
            v12 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __62__SBSBackgroundActivityAssertionManager__reactivateAssertions__block_invoke_3;
            block[3] = &unk_1E288DFC0;
            v16 = v11;
            dispatch_async(v12, block);

          }
        }
        else
        {
          SBLogStatusBarish();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v22 = v8;
            _os_log_impl(&dword_18EB52000, v13, OS_LOG_TYPE_DEFAULT, "Failed to re-activate style override assertion: %{public}@", buf, 0xCu);
          }

          objc_msgSend(a1[6], "_internalQueue_removeBackgroundActivityAssertionWithIdentifier:invalidate:", v8, 1);
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v5);
  }

}

void __62__SBSBackgroundActivityAssertionManager__reactivateAssertions__block_invoke_3(uint64_t a1)
{
  void (**v1)(id, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v1 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  v1[2](v1, 1);

}

- (NSMapTable)assertionsByIdentifier
{
  return self->_assertionsByIdentifier;
}

- (void)setAssertionsByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assertionsByIdentifier, a3);
}

- (NSMutableDictionary)acquisitionHandlerEntriesByIdentifier
{
  return self->_acquisitionHandlerEntriesByIdentifier;
}

- (void)setAcquisitionHandlerEntriesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_acquisitionHandlerEntriesByIdentifier, a3);
}

- (NSXPCConnection)sbXPCConnection
{
  return self->_sbXPCConnection;
}

- (void)setSbXPCConnection:(id)a3
{
  objc_storeStrong((id *)&self->_sbXPCConnection, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (SBSBackgroundActivityCoordinator)internalQueue_backgroundActivityCoordinator
{
  return (SBSBackgroundActivityCoordinator *)objc_loadWeakRetained((id *)&self->_internalQueue_backgroundActivityCoordinator);
}

- (void)setInternalQueue_backgroundActivityCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_internalQueue_backgroundActivityCoordinator, a3);
}

- (OS_dispatch_queue)coordinatorCalloutQueue
{
  return self->_coordinatorCalloutQueue;
}

- (void)setCoordinatorCalloutQueue:(id)a3
{
  objc_storeStrong((id *)&self->_coordinatorCalloutQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinatorCalloutQueue, 0);
  objc_destroyWeak((id *)&self->_internalQueue_backgroundActivityCoordinator);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_sbXPCConnection, 0);
  objc_storeStrong((id *)&self->_acquisitionHandlerEntriesByIdentifier, 0);
  objc_storeStrong((id *)&self->_assertionsByIdentifier, 0);
}

void __85__SBSBackgroundActivityAssertionManager__internalQueue_setupXPCConnectionIfNecessary__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_18EB52000, a2, OS_LOG_TYPE_ERROR, "%{public}@ -- Connection to SpringBoard invalidated", (uint8_t *)&v4, 0xCu);

}

@end
