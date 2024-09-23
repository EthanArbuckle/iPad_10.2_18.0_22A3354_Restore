@implementation SBMultitaskingApplicationShortcutService

- (SBMultitaskingApplicationShortcutService)init
{
  SBMultitaskingApplicationShortcutService *v2;
  uint64_t v3;
  FBServiceClientAuthenticator *serviceClientAuthenticator;
  uint64_t v5;
  OS_dispatch_queue *serviceQueue;
  void *v7;
  id *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBMultitaskingApplicationShortcutService;
  v2 = -[SBMultitaskingApplicationShortcutService init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.multitaskingshortcut.performAction"));
    serviceClientAuthenticator = v2->_serviceClientAuthenticator;
    v2->_serviceClientAuthenticator = (FBServiceClientAuthenticator *)v3;

    v5 = BSDispatchQueueCreateWithQualityOfService();
    serviceQueue = v2->_serviceQueue;
    v2->_serviceQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)MEMORY[0x1E0D23030];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__SBMultitaskingApplicationShortcutService_init__block_invoke;
    v12[3] = &unk_1E8E9EFA0;
    v8 = v2;
    v13 = v8;
    objc_msgSend(v7, "listenerWithConfigurator:", v12);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v8[1];
    v8[1] = (id)v9;

    objc_msgSend(v8[1], "activate");
  }
  return v2;
}

void __48__SBMultitaskingApplicationShortcutService_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAAF18], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)updateSupportedShortcutsForInterestedClients
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *serviceQueue;
  id v14;
  SBMultitaskingApplicationShortcutService *v15;
  _QWORD block[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_spotlightInterestedBundleIDs, "count"))
  {
    v3 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = self;
    v4 = self->_spotlightInterestedBundleIDs;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8);
          +[SBIconController sharedInstance](SBIconController, "sharedInstance");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "supportedMultitaskingShortcutActionsForBundleIdentifier:", v9);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v12, v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }

    serviceQueue = v15->_serviceQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__SBMultitaskingApplicationShortcutService_updateSupportedShortcutsForInterestedClients__block_invoke;
    block[3] = &unk_1E8E9E820;
    block[4] = v15;
    v17 = v3;
    v14 = v3;
    dispatch_async(serviceQueue, block);

  }
}

void __88__SBMultitaskingApplicationShortcutService_updateSupportedShortcutsForInterestedClients__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
  {
    objc_msgSend(v2, "remoteTarget");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateSupportedShortcutActionsForBundleIdentifiers:", *(_QWORD *)(a1 + 40));

  }
}

- (void)performShortcutAction:(id)a3 forBundleIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  BSDispatchMain();

}

void __86__SBMultitaskingApplicationShortcutService_performShortcutAction_forBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeDisplayWindowScene");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "_switcherShortcutActionForRequestedAction:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  if (objc_msgSend(v3, "canPerformKeyboardShortcutAction:forBundleIdentifier:", v4, *(_QWORD *)(a1 + 48)))
    objc_msgSend(v3, "performKeyboardShortcutAction:forBundleIdentifier:", v4, *(_QWORD *)(a1 + 48));

}

- (void)fetchSupportedShortcutActionsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[BSServiceConnectionHost remoteProcess](self->_spotlightConnection, "remoteProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pid");
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pid");

  v13 = v6;
  v11 = v7;
  v12 = v6;
  BSDispatchMain();

}

void __115__SBMultitaskingApplicationShortcutService_fetchSupportedShortcutActionsForBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (*(_BYTE *)(a1 + 56))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    if (!v2)
    {
      v3 = objc_opt_new();
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v3;

      v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    }
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  }
  v6 = *(_QWORD *)(a1 + 48);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v9, "supportedMultitaskingShortcutActionsForBundleIdentifier:", *(_QWORD *)(a1 + 40)));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v8, 0);

}

- (void)stopObservingUpdatesForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  -[BSServiceConnectionHost remoteProcess](self->_spotlightConnection, "remoteProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pid");
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "pid");

  if (v6 == v9)
  {
    v10 = v4;
    BSDispatchMain();

  }
}

uint64_t __84__SBMultitaskingApplicationShortcutService_stopObservingUpdatesForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  FBServiceClientAuthenticator *serviceClientAuthenticator;
  void *v8;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *serviceQueue;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  SBMultitaskingApplicationShortcutService *v21;
  id v22;
  _QWORD v23[5];
  id v24;

  v6 = a4;
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  objc_msgSend(v6, "remoteProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "auditToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v10 = -[FBServiceClientAuthenticator authenticateAuditToken:error:](serviceClientAuthenticator, "authenticateAuditToken:error:", v9, &v24);
  v11 = v24;

  if ((v10 & 1) != 0)
  {
    v12 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __86__SBMultitaskingApplicationShortcutService_listener_didReceiveConnection_withContext___block_invoke;
    v23[3] = &unk_1E8EA1060;
    v23[4] = self;
    objc_msgSend(v6, "configureConnection:", v23);
    objc_msgSend(v6, "remoteProcess");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.Spotlight"));

    if (v15)
    {
      serviceQueue = self->_serviceQueue;
      v17 = v12;
      v18 = 3221225472;
      v19 = __86__SBMultitaskingApplicationShortcutService_listener_didReceiveConnection_withContext___block_invoke_4;
      v20 = &unk_1E8E9E820;
      v21 = self;
      v22 = v6;
      dispatch_async(serviceQueue, &v17);

    }
    objc_msgSend(v6, "activate", v17, v18, v19, v20, v21);
  }
  else
  {
    objc_msgSend(v6, "invalidate");
  }

}

void __86__SBMultitaskingApplicationShortcutService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DAAF18], "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(MEMORY[0x1E0DAAF18], "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__SBMultitaskingApplicationShortcutService_listener_didReceiveConnection_withContext___block_invoke_2;
  v9[3] = &unk_1E8EA1010;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __86__SBMultitaskingApplicationShortcutService_listener_didReceiveConnection_withContext___block_invoke_3;
  v7[3] = &unk_1E8EA1010;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __86__SBMultitaskingApplicationShortcutService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleDisconnectForServiceConnection:", v5);

}

void __86__SBMultitaskingApplicationShortcutService_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleDisconnectForServiceConnection:", v5);

}

void __86__SBMultitaskingApplicationShortcutService_listener_didReceiveConnection_withContext___block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (void)_handleDisconnectForServiceConnection:(id)a3
{
  NSObject *serviceQueue;
  id v5;
  void *v6;
  void *v7;
  int v8;
  BSServiceConnectionHost *spotlightConnection;

  serviceQueue = self->_serviceQueue;
  v5 = a3;
  dispatch_assert_queue_V2(serviceQueue);
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  if (v8)
  {
    spotlightConnection = self->_spotlightConnection;
    self->_spotlightConnection = 0;

    BSDispatchMain();
  }
}

uint64_t __82__SBMultitaskingApplicationShortcutService__handleDisconnectForServiceConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
}

- (int64_t)_switcherShortcutActionForRequestedAction:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return qword_1D0E8A6F8[a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightInterestedBundleIDs, 0);
  objc_storeStrong((id *)&self->_spotlightConnection, 0);
  objc_storeStrong((id *)&self->_serviceClientAuthenticator, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

@end
