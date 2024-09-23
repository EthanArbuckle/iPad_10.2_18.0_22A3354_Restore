@implementation SBBackgroundActivityAssertionServiceManager

- (SBBackgroundActivityAssertionServiceManager)init
{
  SBBackgroundActivityAssertionServiceManager *v3;
  uint64_t v4;
  NSMapTable *assertionsByIdentifierByClientConnection;
  uint64_t v6;
  NSMapTable *assertionsByBackgroundActivityIdentifier;
  uint64_t v8;
  NSMapTable *attributionsByAssertion;
  NSMutableArray *v10;
  NSMutableArray *coordinatorConnectionsByBackgroundActivity;
  uint64_t Serial;
  OS_dispatch_queue *internalQueue;
  uint64_t v14;
  NSXPCListener *xpcListener;
  uint64_t v16;
  NSMutableSet *backgroundActivityIdentifiers;
  uint64_t v18;
  NSMutableSet *exclusiveBackgroundActivityIdentifiers;
  id v20;
  void *v21;
  uint64_t v22;
  STBackgroundActivitiesStatusDomainPublisher *publisher;
  void *v25;
  uint64_t v26;
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)SBBackgroundActivityAssertionServiceManager;
  v3 = -[SBBackgroundActivityAssertionServiceManager init](&v29, sel_init);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    assertionsByIdentifierByClientConnection = v3->_assertionsByIdentifierByClientConnection;
    v3->_assertionsByIdentifierByClientConnection = (NSMapTable *)v4;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    assertionsByBackgroundActivityIdentifier = v3->_assertionsByBackgroundActivityIdentifier;
    v3->_assertionsByBackgroundActivityIdentifier = (NSMapTable *)v6;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    attributionsByAssertion = v3->_attributionsByAssertion;
    v3->_attributionsByAssertion = (NSMapTable *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    coordinatorConnectionsByBackgroundActivity = v3->_coordinatorConnectionsByBackgroundActivity;
    v3->_coordinatorConnectionsByBackgroundActivity = v10;

    Serial = BSDispatchQueueCreateSerial();
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)Serial;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.springboard.statusbarservices"));
    xpcListener = v3->_xpcListener;
    v3->_xpcListener = (NSXPCListener *)v14;

    -[NSXPCListener setDelegate:](v3->_xpcListener, "setDelegate:", v3);
    -[NSXPCListener resume](v3->_xpcListener, "resume");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    backgroundActivityIdentifiers = v3->_backgroundActivityIdentifiers;
    v3->_backgroundActivityIdentifiers = (NSMutableSet *)v16;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    exclusiveBackgroundActivityIdentifiers = v3->_exclusiveBackgroundActivityIdentifiers;
    v3->_exclusiveBackgroundActivityIdentifiers = (NSMutableSet *)v18;

    objc_initWeak(&location, v3);
    v26 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v27, &location);
    v20 = (id)BSLogAddStateCaptureBlockWithTitle();
    objc_msgSend((id)SBApp, "systemStatusServer", v26, 3221225472, __51__SBBackgroundActivityAssertionServiceManager_init__block_invoke, &unk_1E8EA12C0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("SBBackgroundActivityAssertionServiceManager.m"), 95, CFSTR("SBBackgroundActivityAssertionServiceManager is being created before the system status server"));

    }
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0880]), "initWithServerHandle:", v21);
    publisher = v3->_publisher;
    v3->_publisher = (STBackgroundActivitiesStatusDomainPublisher *)v22;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v3;
}

id __51__SBBackgroundActivityAssertionServiceManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[STBackgroundActivitiesStatusDomainPublisher invalidate](self->_publisher, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBBackgroundActivityAssertionServiceManager;
  -[SBBackgroundActivityAssertionServiceManager dealloc](&v3, sel_dealloc);
}

- (void)_internalQueue_invalidateBackgroundActivityAssertions:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  void *v27;
  NSMapTable *obj;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  SBBackgroundActivityAssertionServiceManager *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v27 = v4;
  v31 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = self;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = self->_assertionsByIdentifierByClientConnection;
  v30 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v45;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v29)
        objc_enumerationMutation(obj);
      v32 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v5);
      v33 = v5;
      -[NSMapTable objectForKey:](v35->_assertionsByIdentifierByClientConnection, "objectForKey:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v31, "count");
      v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v9 = v31;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v41;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v41 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v14, "uniqueIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              objc_msgSend(v8, "addObject:", v14);
              objc_msgSend(v6, "removeObjectForKey:", v15);
              -[SBBackgroundActivityAssertionServiceManager _internalQueue_backgroundActivityIdentifiersRemovedByRemovingAssertionData:](v35, "_internalQueue_backgroundActivityIdentifiersRemovedByRemovingAssertionData:", v14);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "unionSet:", v17);
              v18 = objc_msgSend(v8, "count");

              if (v18 == v7)
              {

                goto LABEL_17;
              }
            }

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_17:

      objc_msgSend(v9, "minusSet:", v8);
      if (objc_msgSend(v8, "count"))
      {
        v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v20 = v8;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v37;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v37 != v23)
                objc_enumerationMutation(v20);
              objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "uniqueIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addObject:", v25);

            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
          }
          while (v22);
        }

        -[SBBackgroundActivityAssertionServiceManager _invalidateAssertionsWithIdentifiers:forClientConnection:](v35, "_invalidateAssertionsWithIdentifiers:forClientConnection:", v19, v32);
      }
      v26 = objc_msgSend(v9, "count");

      if (!v26)
        break;
      v5 = v33 + 1;
      if (v33 + 1 == v30)
      {
        v30 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        if (v30)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)invalidateBackgroundActivityAssertions:(id)a3
{
  id v4;
  NSObject *internalQueue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    internalQueue = self->_internalQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __86__SBBackgroundActivityAssertionServiceManager_invalidateBackgroundActivityAssertions___block_invoke;
    v6[3] = &unk_1E8E9E820;
    v6[4] = self;
    v7 = v4;
    dispatch_async(internalQueue, v6);

  }
}

uint64_t __86__SBBackgroundActivityAssertionServiceManager_invalidateBackgroundActivityAssertions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_invalidateBackgroundActivityAssertions:", *(_QWORD *)(a1 + 40));
}

- (void)invalidateBackgroundActivityAssertionsForAttributions:(id)a3
{
  id v4;
  NSObject *internalQueue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    internalQueue = self->_internalQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __101__SBBackgroundActivityAssertionServiceManager_invalidateBackgroundActivityAssertionsForAttributions___block_invoke;
    v6[3] = &unk_1E8E9E820;
    v6[4] = self;
    v7 = v4;
    dispatch_async(internalQueue, v6);

  }
}

void __101__SBBackgroundActivityAssertionServiceManager_invalidateBackgroundActivityAssertionsForAttributions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __101__SBBackgroundActivityAssertionServiceManager_invalidateBackgroundActivityAssertionsForAttributions___block_invoke_2;
  v5[3] = &unk_1E8EA77E8;
  v6 = *(id *)(a1 + 40);
  v7 = v2;
  v4 = v2;
  objc_msgSend(v3, "bs_each:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_internalQueue_invalidateBackgroundActivityAssertions:", v4);
}

void __101__SBBackgroundActivityAssertionServiceManager_invalidateBackgroundActivityAssertionsForAttributions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;

  v5 = a2;
  objc_msgSend(a3, "setRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isSubsetOfSet:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }
  else if (objc_msgSend(v6, "intersectsSet:", *(_QWORD *)(a1 + 32)))
  {
    SBLogStatusBarish();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __101__SBBackgroundActivityAssertionServiceManager_invalidateBackgroundActivityAssertionsForAttributions___block_invoke_2_cold_1(v5);

  }
}

- (BOOL)handleTapForBackgroundActivityWithIdentifier:(id)a3 windowScene:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  internalQueue = self->_internalQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __104__SBBackgroundActivityAssertionServiceManager_handleTapForBackgroundActivityWithIdentifier_windowScene___block_invoke;
  v12[3] = &unk_1E8EA4E50;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(internalQueue, v12);
  LOBYTE(internalQueue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)internalQueue;
}

void __104__SBBackgroundActivityAssertionServiceManager_handleTapForBackgroundActivityWithIdentifier_windowScene___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  SBLockScreenUnlockRequest *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "_internalQueue_coordinatorClientMatchingBackgroundActivityIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isUILocked");

    if (v4)
    {
      v5 = objc_alloc_init(SBLockScreenUnlockRequest);
      -[SBLockScreenUnlockRequest setName:](v5, "setName:", CFSTR("Unlock to send tap to status bar coordinator."));
      -[SBLockScreenUnlockRequest setSource:](v5, "setSource:", 24);
      -[SBLockScreenUnlockRequest setIntent:](v5, "setIntent:", 3);
      -[SBLockScreenUnlockRequest setWindowScene:](v5, "setWindowScene:", *(_QWORD *)(a1 + 48));
      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __104__SBBackgroundActivityAssertionServiceManager_handleTapForBackgroundActivityWithIdentifier_windowScene___block_invoke_2;
      v10[3] = &unk_1E8EA7810;
      v11 = v2;
      v7 = *(id *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 56);
      v12 = v7;
      v13 = v8;
      objc_msgSend(v6, "unlockWithRequest:completion:", v5, v10);

    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAFD0]), "initWithBackgroundActivityIdentifier:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v2, "acquireAssertionAndDeliverTapContextToClient:", v9);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
  }

}

void __104__SBBackgroundActivityAssertionServiceManager_handleTapForBackgroundActivityWithIdentifier_windowScene___block_invoke_2(_QWORD *a1, int a2)
{
  void *v3;
  void *v4;

  if (a2)
  {
    v3 = (void *)a1[4];
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAFD0]), "initWithBackgroundActivityIdentifier:", a1[5]);
    objc_msgSend(v3, "acquireAssertionAndDeliverTapContextToClient:", v4);

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *internalQueue;
  NSObject *v11;
  _QWORD v13[5];
  id v14;

  v6 = a4;
  v7 = v6;
  if (self->_xpcListener == a3)
  {
    objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.springboard.statusbarstyleoverrides"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v9, "BOOLValue"))
    {
      internalQueue = self->_internalQueue;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __82__SBBackgroundActivityAssertionServiceManager_listener_shouldAcceptNewConnection___block_invoke;
      v13[3] = &unk_1E8E9E820;
      v13[4] = self;
      v14 = v7;
      dispatch_async(internalQueue, v13);

      v8 = 1;
    }
    else
    {
      SBLogStatusBarish();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SBBackgroundActivityAssertionServiceManager listener:shouldAcceptNewConnection:].cold.1(v11);

      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __82__SBBackgroundActivityAssertionServiceManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

  v4 = *(void **)(a1 + 40);
  SBBackgroundActivityAssertionServerInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v5);

  objc_msgSend(*(id *)(a1 + 40), "setExportedObject:", *(_QWORD *)(a1 + 32));
  v6 = *(void **)(a1 + 40);
  SBSBackgroundActivityAssertionClientInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v7);

  objc_initWeak(&location, *(id *)(a1 + 40));
  v8 = *(void **)(a1 + 40);
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__SBBackgroundActivityAssertionServiceManager_listener_shouldAcceptNewConnection___block_invoke_2;
  v17[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v8, "setInterruptionHandler:", v17);
  v11 = v9;
  v12 = 3221225472;
  v13 = __82__SBBackgroundActivityAssertionServiceManager_listener_shouldAcceptNewConnection___block_invoke_3;
  v14 = &unk_1E8EA7838;
  v10 = *(void **)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v16, &location);
  objc_msgSend(v10, "setInvalidationHandler:", &v11);
  objc_msgSend(*(id *)(a1 + 40), "resume", v11, v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __82__SBBackgroundActivityAssertionServiceManager_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void __82__SBBackgroundActivityAssertionServiceManager_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[5];
  id v4;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __82__SBBackgroundActivityAssertionServiceManager_listener_shouldAcceptNewConnection___block_invoke_4;
  v3[3] = &unk_1E8E9F280;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, v3);
  objc_destroyWeak(&v4);
}

void __82__SBBackgroundActivityAssertionServiceManager_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", WeakRetained);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "_internalQueue_deactivateBackgroundActivityAssertionsWithIdentifiers:forClientConnection:", v4, WeakRetained);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", WeakRetained);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (!v11)
  {
    v13 = v10;
    goto LABEL_20;
  }
  v12 = v11;
  v19 = a1;
  v13 = 0;
  v14 = *(_QWORD *)v21;
  do
  {
    for (j = 0; j != v12; ++j)
    {
      if (*(_QWORD *)v21 != v14)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
      objc_msgSend(v16, "connection");
      v17 = (id)objc_claimAutoreleasedReturnValue();

      if (v17 == WeakRetained)
      {
        v18 = v16;

        v13 = v18;
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  }
  while (v12);

  if (v13)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(v19 + 32) + 80), "removeObject:", v13);
LABEL_20:

  }
}

- (void)activateBackgroundActivityAssertions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__SBBackgroundActivityAssertionServiceManager_activateBackgroundActivityAssertions_reply___block_invoke;
  v13[3] = &unk_1E8E9E248;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  dispatch_async(internalQueue, v13);

}

void __90__SBBackgroundActivityAssertionServiceManager_activateBackgroundActivityAssertions_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id obj;
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint8_t v63[128];
  uint8_t buf[4];
  int v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v60 = 0u;
    v61 = 0u;
    v3 = *(void **)(a1 + 40);
    if (v3)
      objc_msgSend(v3, "auditToken");
    v44 = BSPIDForAuditToken();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = *(id *)(a1 + 48);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v57;
      v37 = a1;
      v38 = v2;
      v40 = *(_QWORD *)v57;
      do
      {
        v7 = 0;
        v42 = v5;
        do
        {
          if (*(_QWORD *)v57 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v7);
          SBLogStatusBarish();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67240450;
            v65 = v44;
            v66 = 2114;
            v67 = v8;
            _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to activate client (%{public}d) style override assertion: %{public}@", buf, 0x12u);
          }

          objc_msgSend(v8, "uniqueIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
          {
            v45 = v7;
            v46 = v10;
            v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            if (objc_msgSend(v8, "isExclusive"))
            {
              v13 = v12;
              v54 = 0u;
              v55 = 0u;
              v52 = 0u;
              v53 = 0u;
              v14 = v47;
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v53;
                do
                {
                  for (i = 0; i != v16; ++i)
                  {
                    if (*(_QWORD *)v53 != v17)
                      objc_enumerationMutation(v14);
                    objc_msgSend(v14, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v8, "backgroundActivityIdentifiers");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "backgroundActivityIdentifiers");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = objc_msgSend(v20, "intersectsSet:", v21);

                    if (v22)
                      objc_msgSend(v13, "addObject:", v19);

                  }
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
                }
                while (v16);
              }

              a1 = v37;
              v2 = v38;
              v12 = v13;
LABEL_26:
              v10 = v46;
              objc_msgSend(v47, "setObject:forKey:", v8, v46);
              objc_msgSend(*(id *)(a1 + 32), "_internalQueue_backgroundActivityIdentifiersAddedByAddingAssertionData:", v8);
              v25 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "unionSet:", v25);
              objc_msgSend(v41, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v46);
              SBLogStatusBarish();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67240450;
                v65 = v44;
                v66 = 2114;
                v67 = v8;
                _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, "Successfully activated client (%{public}d) SBS background activity assertion: %{public}@", buf, 0x12u);
              }

            }
            else
            {
              v23 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
              objc_msgSend(v8, "backgroundActivityIdentifiers");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v23) = objc_msgSend(v23, "intersectsSet:", v24);

              if (!(_DWORD)v23)
                goto LABEL_26;
              v10 = v46;
              objc_msgSend(v41, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v46);
              SBLogStatusBarish();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67240450;
                v65 = v44;
                v66 = 2114;
                v67 = v8;
                _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "Failed to activate client (%{public}d) SBS background activity assertion: %{public}@", buf, 0x12u);
              }
            }

            if (objc_msgSend(v12, "count"))
            {
              v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              v48 = 0u;
              v49 = 0u;
              v50 = 0u;
              v51 = 0u;
              v28 = v12;
              v29 = v12;
              v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
              if (v30)
              {
                v31 = v30;
                v32 = *(_QWORD *)v49;
                do
                {
                  for (j = 0; j != v31; ++j)
                  {
                    if (*(_QWORD *)v49 != v32)
                      objc_enumerationMutation(v29);
                    v34 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
                    objc_msgSend(v34, "uniqueIdentifier");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "removeObjectForKey:", v35);
                    objc_msgSend(*(id *)(a1 + 32), "_internalQueue_backgroundActivityIdentifiersRemovedByRemovingAssertionData:", v34);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v2, "unionSet:", v36);
                    objc_msgSend(v27, "addObject:", v35);

                  }
                  v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
                }
                while (v31);
              }

              objc_msgSend(*(id *)(a1 + 32), "_invalidateAssertionsWithIdentifiers:forClientConnection:", v27, *(_QWORD *)(a1 + 40));
              v10 = v46;
              v12 = v28;
            }

            v6 = v40;
            v5 = v42;
            v7 = v45;
          }

          ++v7;
        }
        while (v7 != v5);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
      }
      while (v5);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)deactivateBackgroundActivityAssertionsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  NSObject *internalQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__SBBackgroundActivityAssertionServiceManager_deactivateBackgroundActivityAssertionsWithIdentifiers___block_invoke;
  block[3] = &unk_1E8E9E270;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(internalQueue, block);

}

uint64_t __101__SBBackgroundActivityAssertionServiceManager_deactivateBackgroundActivityAssertionsWithIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalQueue_deactivateBackgroundActivityAssertionsWithIdentifiers:forClientConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setStatusString:(id)a3 forAssertionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__SBBackgroundActivityAssertionServiceManager_setStatusString_forAssertionWithIdentifier___block_invoke;
  v13[3] = &unk_1E8E9F108;
  v13[4] = self;
  v14 = v8;
  v15 = v7;
  v16 = v6;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  dispatch_async(internalQueue, v13);

}

void __90__SBBackgroundActivityAssertionServiceManager_setStatusString_forAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = v2;
    objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "statusString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 56));

      if ((v6 & 1) == 0)
      {
        objc_msgSend(v4, "setStatusString:", *(_QWORD *)(a1 + 56));
        objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateAboutStatusStringChange");
      }
    }

    v2 = v7;
  }

}

- (id)statusStringForBackgroundActivityWithIdentifier:(id)a3 activeAttributions:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__24;
  v21 = __Block_byref_object_dispose__24;
  v22 = 0;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __114__SBBackgroundActivityAssertionServiceManager_statusStringForBackgroundActivityWithIdentifier_activeAttributions___block_invoke;
  v13[3] = &unk_1E8EA4E50;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(internalQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __114__SBBackgroundActivityAssertionServiceManager_statusStringForBackgroundActivityWithIdentifier_activeAttributions___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v2, "allObjects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1[4] + 72), "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "intersectsSet:", a1[6]);

        if (v11)
        {
          objc_msgSend(v8, "statusString");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = *(_QWORD *)(a1[7] + 8);
          v14 = *(void **)(v13 + 40);
          *(_QWORD *)(v13 + 40) = v12;

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

}

- (void)_notifyDelegateAboutStatusStringChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "assertionServiceDidChangeStatusStringsForAForegroundApp");

}

- (NSString)description
{
  return (NSString *)-[SBBackgroundActivityAssertionServiceManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBBackgroundActivityAssertionServiceManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBBackgroundActivityAssertionServiceManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SBBackgroundActivityAssertionServiceManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__SBBackgroundActivityAssertionServiceManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8E9E820;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

void __85__SBBackgroundActivityAssertionServiceManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "assertionsByIdentifierByClientConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__SBBackgroundActivityAssertionServiceManager_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v3[3] = &unk_1E8EA7860;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "bs_each:", v3);

}

void __85__SBBackgroundActivityAssertionServiceManager_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (a2)
    objc_msgSend(a2, "auditToken");
  v6 = BSPIDForAuditToken();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("client (%d) assertions"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendArraySection:withName:skipIfEmpty:", v9, v10, 0);

}

- (BOOL)_verifyCoordinatorEntitlementForBackgroundActivityIdentifiers:(id)a3 onConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  objc_msgSend(a4, "valueForEntitlement:", CFSTR("com.apple.springboard.statusbarstyleoverrides.coordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "_statusBarStyleOverridesForArray:", v6);
    STUIBackgroundActivityIdentifiersForStyleOverrides();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isSubsetOfSet:", v7) & 1) != 0)
    {
      v8 = 1;
    }
    else if (objc_msgSend(v5, "count"))
    {
      v8 = 0;
    }
    else
    {
      v8 = objc_msgSend(v7, "count") != 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_internalQueue_coordinatorClientForBackgroundActivityIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_coordinatorConnectionsByBackgroundActivity;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "registeredBackgroundActivityIdentifiers", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = BSEqualSets();

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_internalQueue_coordinatorClientMatchingBackgroundActivityIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_coordinatorConnectionsByBackgroundActivity;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "registeredBackgroundActivityIdentifiers", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_internalQueue_coordinatorClientForConnection:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_coordinatorConnectionsByBackgroundActivity;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "connection", (_QWORD)v12);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setRegisteredBackgroundActivityIdentifiers:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__SBBackgroundActivityAssertionServiceManager_setRegisteredBackgroundActivityIdentifiers_reply___block_invoke;
  v13[3] = &unk_1E8E9E248;
  v13[4] = self;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  dispatch_async(internalQueue, v13);

}

void __96__SBBackgroundActivityAssertionServiceManager_setRegisteredBackgroundActivityIdentifiers_reply___block_invoke(uint64_t a1)
{
  SBBackgroundActivityCoordinatorClient *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_verifyCoordinatorEntitlementForBackgroundActivityIdentifiers:onConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_internalQueue_coordinatorClientForConnection:", *(_QWORD *)(a1 + 48));
    v2 = (SBBackgroundActivityCoordinatorClient *)objc_claimAutoreleasedReturnValue();
    v3 = *(id *)(a1 + 40);
    v4 = v3;
    if (v2)
    {
      v5 = (void *)objc_msgSend(v3, "mutableCopy");
      -[SBBackgroundActivityCoordinatorClient registeredBackgroundActivityIdentifiers](v2, "registeredBackgroundActivityIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "minusSet:", v6);

      v4 = v5;
    }
    objc_msgSend(*(id *)(a1 + 32), "_internalQueue_coordinatorClientForBackgroundActivityIdentifiers:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0DAB588];
      v28[0] = *MEMORY[0x1E0CB2D50];
      v28[1] = v9;
      v10 = *MEMORY[0x1E0DAB590];
      v29[0] = *MEMORY[0x1E0DAB5A0];
      v29[1] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v10, 1, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
      goto LABEL_18;
    }
    v18 = objc_msgSend(v4, "count");
    if (v2)
    {
      if (!v18)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObject:", v2);
        goto LABEL_16;
      }
      -[SBBackgroundActivityCoordinatorClient setRegisteredBackgroundActivityIdentifiers:](v2, "setRegisteredBackgroundActivityIdentifiers:", v4);
      SBLogStatusBarish();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

LABEL_16:
        v12 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      if (!v18)
      {
        v12 = 0;
        goto LABEL_18;
      }
      v2 = -[SBBackgroundActivityCoordinatorClient initWithConnection:andBackgroundActivityIdentifiers:]([SBBackgroundActivityCoordinatorClient alloc], "initWithConnection:andBackgroundActivityIdentifiers:", *(_QWORD *)(a1 + 48), v4);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObject:", v2);
      SBLogStatusBarish();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
    }
    v20 = *(_QWORD *)(a1 + 48);
    STBackgroundActivityIdentifiersDescription();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v20;
    v26 = 2114;
    v27 = v21;
    _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "Succeeded in registering %@ for coordinator for background activity identifiers: %{public}@", buf, 0x16u);

    goto LABEL_14;
  }
  v13 = (void *)MEMORY[0x1E0CB35C8];
  v14 = *MEMORY[0x1E0DAB590];
  v15 = *MEMORY[0x1E0DAB598];
  v16 = *MEMORY[0x1E0DAB588];
  v22[0] = *MEMORY[0x1E0CB2D50];
  v22[1] = v16;
  v17 = *(_QWORD *)(a1 + 40);
  v23[0] = v15;
  v23[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)unregisterCoordinatorRegistrationForBackgroundActivityIdentifiers:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __113__SBBackgroundActivityAssertionServiceManager_unregisterCoordinatorRegistrationForBackgroundActivityIdentifiers___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __113__SBBackgroundActivityAssertionServiceManager_unregisterCoordinatorRegistrationForBackgroundActivityIdentifiers___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_internalQueue_coordinatorClientForBackgroundActivityIdentifiers:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObject:", v2);

}

- (void)_internalQueue_deactivateBackgroundActivityAssertionsWithIdentifiers:(id)a3 forClientConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[4];
  int v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint8_t buf[32];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_assertionsByIdentifierByClientConnection, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  SBLogStatusBarish();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v10;
    *(_WORD *)&buf[8] = 2114;
    *(_QWORD *)&buf[10] = v6;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to deactivate assertions (count: %d) %{public}@", buf, 0x12u);
  }

  if (v10)
  {
    memset(buf, 0, sizeof(buf));
    if (v7)
      objc_msgSend(v7, "auditToken");
    v21 = v7;
    v23 = BSPIDForAuditToken();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v22 = v6;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKey:", v17, v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            SBLogStatusBarish();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v28 = 67240450;
              v29 = v23;
              v30 = 2114;
              v31 = v18;
              _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "Deactivating client (%{public}d) style override assertion: %{public}@", v28, 0x12u);
            }

            objc_msgSend(v9, "removeObjectForKey:", v17);
            -[SBBackgroundActivityAssertionServiceManager _internalQueue_backgroundActivityIdentifiersRemovedByRemovingAssertionData:](self, "_internalQueue_backgroundActivityIdentifiersRemovedByRemovingAssertionData:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "unionSet:", v20);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v14);
    }

    v7 = v21;
    v6 = v22;
  }

}

- (id)_internalQueue_backgroundActivityIdentifiersAddedByAddingAssertionData:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  SBAddBackgroundActivityAssertionDataByIdentifier(v4, self->_assertionsByBackgroundActivityIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isExclusive");
  v7 = 48;
  if (v6)
    v7 = 56;
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "unionSet:", v5);
  -[SBBackgroundActivityAssertionServiceManager _internalQueue_publishAttributionsForAddingAssertionData:](self, "_internalQueue_publishAttributionsForAddingAssertionData:", v4);

  return v5;
}

- (id)_internalQueue_backgroundActivityIdentifiersRemovedByRemovingAssertionData:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  SBRemoveBackgroundActivityAssertionDataByIdentifier(v4, self->_assertionsByBackgroundActivityIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isExclusive");
  v7 = 48;
  if (v6)
    v7 = 56;
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "minusSet:", v5);
  -[SBBackgroundActivityAssertionServiceManager _internalQueue_publishAttributionsForRemovingAssertionData:](self, "_internalQueue_publishAttributionsForRemovingAssertionData:", v4);

  return v5;
}

- (void)_internalQueue_publishAttributionsForAddingAssertionData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v5 = objc_msgSend(v4, "pid");
  objc_msgSend(MEMORY[0x1E0D01828], "processHandleForPID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  if (v7)
    objc_msgSend(v7, "realToken");
  else
    STActivityAttributionUnsafeAuditTokenForPID();
  v27[0] = v28;
  v27[1] = v29;
  objc_msgSend(MEMORY[0x1E0DB0858], "attributionWithAuditToken:", v27, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v4, "backgroundActivityIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0870]), "initWithBackgroundActivityIdentifier:activityAttribution:showsWhenForeground:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v8, objc_msgSend(v4, "showsWhenForeground"));
        objc_msgSend(v9, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(*(id *)(v19 + 72), "objectForKey:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 0, 1);
      objc_msgSend(*(id *)(v19 + 72), "setObject:forKey:", v16, v4);
    }
    v17 = *(void **)(v19 + 88);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __104__SBBackgroundActivityAssertionServiceManager__internalQueue_publishAttributionsForAddingAssertionData___block_invoke;
    v20[3] = &unk_1E8EA7888;
    v21 = v9;
    v22 = v16;
    v18 = v16;
    objc_msgSend(v17, "updateVolatileData:completion:", v20, 0);

  }
}

void __104__SBBackgroundActivityAssertionServiceManager__internalQueue_publishAttributionsForAddingAssertionData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v9, (_QWORD)v10);
        objc_msgSend(v3, "addAttribution:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_internalQueue_publishAttributionsForRemovingAssertionData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  STBackgroundActivitiesStatusDomainPublisher *publisher;
  NSObject *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[NSMapTable objectForKey:](self->_attributionsByAssertion, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    publisher = self->_publisher;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __106__SBBackgroundActivityAssertionServiceManager__internalQueue_publishAttributionsForRemovingAssertionData___block_invoke;
    v9[3] = &unk_1E8EA78B0;
    v10 = v6;
    -[STBackgroundActivitiesStatusDomainPublisher updateVolatileData:completion:](publisher, "updateVolatileData:completion:", v9, 0);
    -[NSMapTable removeObjectForKey:](self->_attributionsByAssertion, "removeObjectForKey:", v4);

  }
  else
  {
    SBLogStatusBarish();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SBBackgroundActivityAssertionServiceManager _internalQueue_publishAttributionsForRemovingAssertionData:].cold.1((uint64_t)v4, v8);

  }
}

void __106__SBBackgroundActivityAssertionServiceManager__internalQueue_publishAttributionsForRemovingAssertionData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
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
        objc_msgSend(v3, "removeAttribution:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_invalidateAssertionsWithIdentifiers:(id)a3 forClientConnection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v14 = 0u;
  v15 = 0u;
  if (v6)
    objc_msgSend(v6, "auditToken");
  v8 = BSPIDForAuditToken();
  SBLogStatusBarish();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240450;
    v17 = v8;
    v18 = 2114;
    v19 = v5;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Invalidating client (%{public}d) style override assertions with identifiers: %{public}@", buf, 0x12u);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __104__SBBackgroundActivityAssertionServiceManager__invalidateAssertionsWithIdentifiers_forClientConnection___block_invoke;
  v12[3] = &unk_1E8EA78D8;
  v13 = v7;
  v10 = v7;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidateBackgroundActivityAssertionsWithIdentifiers:", v5);

}

void __104__SBBackgroundActivityAssertionServiceManager__invalidateAssertionsWithIdentifiers_forClientConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  SBLogStatusBarish();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __104__SBBackgroundActivityAssertionServiceManager__invalidateAssertionsWithIdentifiers_forClientConnection___block_invoke_cold_1(v3);

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListener, a3);
}

- (NSMapTable)assertionsByIdentifierByClientConnection
{
  return self->_assertionsByIdentifierByClientConnection;
}

- (void)setAssertionsByIdentifierByClientConnection:(id)a3
{
  objc_storeStrong((id *)&self->_assertionsByIdentifierByClientConnection, a3);
}

- (NSMapTable)assertionsByBackgroundActivityIdentifier
{
  return self->_assertionsByBackgroundActivityIdentifier;
}

- (void)setAssertionsByBackgroundActivityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assertionsByBackgroundActivityIdentifier, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (NSMutableSet)backgroundActivityIdentifiers
{
  return self->_backgroundActivityIdentifiers;
}

- (void)setBackgroundActivityIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSMutableSet)exclusiveBackgroundActivityIdentifiers
{
  return self->_exclusiveBackgroundActivityIdentifiers;
}

- (void)setExclusiveBackgroundActivityIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SBBackgroundActivityAssertionServiceManagerDelegate)delegate
{
  return (SBBackgroundActivityAssertionServiceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMapTable)attributionsByAssertion
{
  return self->_attributionsByAssertion;
}

- (void)setAttributionsByAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_attributionsByAssertion, a3);
}

- (NSMutableArray)coordinatorConnectionsByBackgroundActivity
{
  return self->_coordinatorConnectionsByBackgroundActivity;
}

- (void)setCoordinatorConnectionsByBackgroundActivity:(id)a3
{
  objc_storeStrong((id *)&self->_coordinatorConnectionsByBackgroundActivity, a3);
}

- (STBackgroundActivitiesStatusDomainPublisher)publisher
{
  return self->_publisher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_coordinatorConnectionsByBackgroundActivity, 0);
  objc_storeStrong((id *)&self->_attributionsByAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_exclusiveBackgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_backgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_assertionsByBackgroundActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_assertionsByIdentifierByClientConnection, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_runningUpdateTransactions, 0);
}

void __101__SBBackgroundActivityAssertionServiceManager_invalidateBackgroundActivityAssertionsForAttributions___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "backgroundActivityIdentifiers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  STBackgroundActivityIdentifiersDescription();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_10(&dword_1D0540000, v3, v4, "Unable to invalidate background activity assertion with identifiers due to partial match: %{public}@", v5, v6, v7, v8, 2u);

}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Rejecting connection for status bar style overrides because caller isn't entitled", v1, 2u);
}

- (void)_internalQueue_publishAttributionsForRemovingAssertionData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "No attributions to remove for assertion: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __104__SBBackgroundActivityAssertionServiceManager__invalidateAssertionsWithIdentifiers_forClientConnection___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_10(&dword_1D0540000, v2, v3, "Error communicating with client: %{public}@", v4, v5, v6, v7, 2u);

}

@end
