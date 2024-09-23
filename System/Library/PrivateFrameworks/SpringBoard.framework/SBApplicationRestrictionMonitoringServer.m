@implementation SBApplicationRestrictionMonitoringServer

- (SBApplicationRestrictionMonitoringServer)init
{
  SBApplicationRestrictionMonitoringServer *v2;
  uint64_t v3;
  FBServiceClientAuthenticator *authenticator;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  NSMutableArray *connections;
  void *v10;
  id *v11;
  uint64_t v12;
  id v13;
  _QWORD v15[4];
  id *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBApplicationRestrictionMonitoringServer;
  v2 = -[SBApplicationRestrictionMonitoringServer init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.application-restriction-monitoring"));
    authenticator = v2->_authenticator;
    v2->_authenticator = (FBServiceClientAuthenticator *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.springboard.SBApplicationRestrictionMonitoringServer.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = objc_opt_new();
    connections = v2->_connections;
    v2->_connections = (NSMutableArray *)v8;

    v10 = (void *)MEMORY[0x1E0D23030];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __48__SBApplicationRestrictionMonitoringServer_init__block_invoke;
    v15[3] = &unk_1E8E9EFA0;
    v11 = v2;
    v16 = v11;
    objc_msgSend(v10, "listenerWithConfigurator:", v15);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v11[1];
    v11[1] = (id)v12;

    objc_msgSend(v11[1], "activate");
  }
  return v2;
}

void __48__SBApplicationRestrictionMonitoringServer_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DAAD78];
  v6 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDomain:", v4);

  objc_msgSend(MEMORY[0x1E0DAAD78], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setService:", v5);

  objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)applicationRestrictionControllerWillPostAppVisibilityUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  BSCompoundAssertion *v13;
  BSCompoundAssertion *pendingRestrictionUpdateAssertion;
  BSInvalidatable *v15;
  BSInvalidatable *restrictionControllerDidFinishNotifyingObserversAssertion;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  SBApplicationRestrictionMonitoringServer *v20;
  id v21;
  id v22;
  id location;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "allAllowedAppBundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allRestrictedAppBundleIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAD80]), "initWithAllowedIdentifiers:restrictedIdentifiers:", v5, v6);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_pendingRestrictionUpdateUUID, v8);
  -[BSCompoundAssertion invalidate](self->_pendingRestrictionUpdateAssertion, "invalidate");
  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E0D01718];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBApplicationRestrictionMonitoringServer.pendingRestrictionUpdate.%@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __104__SBApplicationRestrictionMonitoringServer_applicationRestrictionControllerWillPostAppVisibilityUpdate___block_invoke;
  v18[3] = &unk_1E8EAB5F8;
  objc_copyWeak(&v22, &location);
  v11 = v8;
  v19 = v11;
  v20 = self;
  v12 = v7;
  v21 = v12;
  objc_msgSend(v9, "assertionWithIdentifier:stateDidChangeHandler:", v10, v18);
  v13 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
  pendingRestrictionUpdateAssertion = self->_pendingRestrictionUpdateAssertion;
  self->_pendingRestrictionUpdateAssertion = v13;

  -[BSCompoundAssertion acquireForReason:](self->_pendingRestrictionUpdateAssertion, "acquireForReason:", CFSTR("Pending application restriction controller app visibility update broadcast"));
  v15 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  restrictionControllerDidFinishNotifyingObserversAssertion = self->_restrictionControllerDidFinishNotifyingObserversAssertion;
  self->_restrictionControllerDidFinishNotifyingObserversAssertion = v15;

  SBLogApplicationRestrictionMonitoring();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v11;
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_INFO, "App restriction update will occur. Tracking with ID=%@", buf, 0xCu);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __104__SBApplicationRestrictionMonitoringServer_applicationRestrictionControllerWillPostAppVisibilityUpdate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;

  if ((objc_msgSend(a2, "isActive") & 1) == 0)
  {
    v3 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__SBApplicationRestrictionMonitoringServer_applicationRestrictionControllerWillPostAppVisibilityUpdate___block_invoke_2;
    block[3] = &unk_1E8E9F280;
    objc_copyWeak(&v10, (id *)(a1 + 56));
    v9 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __104__SBApplicationRestrictionMonitoringServer_applicationRestrictionControllerWillPostAppVisibilityUpdate___block_invoke_3;
    v5[3] = &unk_1E8E9F280;
    objc_copyWeak(&v7, (id *)(a1 + 56));
    v6 = *(id *)(a1 + 48);
    dispatch_async(v4, v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&v10);
  }
}

void __104__SBApplicationRestrictionMonitoringServer_applicationRestrictionControllerWillPostAppVisibilityUpdate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[SBApplicationRestrictionMonitoringServer _didFinishProcessingAppRestrictionUpdateWithUUID:]((uint64_t)WeakRetained, *(void **)(a1 + 32));

}

- (void)_didFinishProcessingAppRestrictionUpdateWithUUID:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    if (objc_msgSend(*(id *)(a1 + 40), "isEqual:", v3))
    {
      v4 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

      objc_msgSend(*(id *)(a1 + 48), "invalidate");
      v5 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

      SBLogApplicationRestrictionMonitoring();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = 138412290;
        v8 = v3;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Pending restriction update compound assertion with ID=%@ was finally invalidated", (uint8_t *)&v7, 0xCu);
      }

    }
  }

}

void __104__SBApplicationRestrictionMonitoringServer_applicationRestrictionControllerWillPostAppVisibilityUpdate___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[SBApplicationRestrictionMonitoringServer _postAppRestrictionChangeWithState:]((uint64_t)WeakRetained, *(void **)(a1 + 32));

}

- (void)_postAppRestrictionChangeWithState:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "remoteTarget", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "observeUpdateWithApplicationRestrictState:", v3);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      }
      while (v7);
    }

    SBLogApplicationRestrictionMonitoring();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134349056;
      v18 = v12;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Notified %{public}ld active connection(s) of restrictions update", buf, 0xCu);
    }

  }
}

- (void)applicationRestrictionControllerDidPostAppVisibilityUpdate:(id)a3
{
  BSInvalidatable *restrictionControllerDidFinishNotifyingObserversAssertion;
  NSObject *v5;
  NSUUID *pendingRestrictionUpdateUUID;
  void *v7;
  int v8;
  NSUUID *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[BSInvalidatable invalidate](self->_restrictionControllerDidFinishNotifyingObserversAssertion, "invalidate", a3);
  restrictionControllerDidFinishNotifyingObserversAssertion = self->_restrictionControllerDidFinishNotifyingObserversAssertion;
  self->_restrictionControllerDidFinishNotifyingObserversAssertion = 0;

  SBLogApplicationRestrictionMonitoring();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    pendingRestrictionUpdateUUID = self->_pendingRestrictionUpdateUUID;
    -[BSCompoundAssertion reasons](self->_pendingRestrictionUpdateAssertion, "reasons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = pendingRestrictionUpdateUUID;
    v10 = 2048;
    v11 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "App restriction update with ID=%@ was ingested by restriction observers. Now waiting for %lu outstanding assertions…", (uint8_t *)&v8, 0x16u);

  }
}

- (id)acquireApplicationRestrictionUpdatePendingAssertionForReason:(id)a3
{
  return (id)-[BSCompoundAssertion acquireForReason:](self->_pendingRestrictionUpdateAssertion, "acquireForReason:", a3);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  OS_dispatch_queue *v13;
  id v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  SBApplicationRestrictionMonitoringServer *v18;
  NSObject *v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "remoteProcess");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "auditToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = self->_queue;
  objc_initWeak(&location, self);
  if ((-[FBServiceClientAuthenticator authenticateAuditToken:](self->_authenticator, "authenticateAuditToken:", v12) & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__SBApplicationRestrictionMonitoringServer_listener_didReceiveConnection_withContext___block_invoke;
    block[3] = &unk_1E8E9F018;
    v14 = v9;
    v17 = v14;
    v18 = self;
    objc_copyWeak(&v20, &location);
    v19 = v13;
    dispatch_sync(v19, block);
    objc_msgSend(v14, "activate");

    objc_destroyWeak(&v20);
  }
  else
  {
    SBLogApplicationRestrictionMonitoring();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenConfigurationServer listener:didReceiveConnection:withContext:].cold.1((uint64_t)v9, v15);

    objc_msgSend(v9, "invalidate");
  }
  objc_destroyWeak(&location);

}

void __86__SBApplicationRestrictionMonitoringServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __86__SBApplicationRestrictionMonitoringServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v9 = &unk_1E8E9EFF0;
  v2 = *(void **)(a1 + 32);
  v3 = (id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  objc_copyWeak(&v13, (id *)(a1 + 56));
  v11 = *v3;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v2, "configureConnection:", &v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObject:", *(_QWORD *)(a1 + 32), v6, v7, v8, v9, v10);
  SBLogApplicationRestrictionMonitoring();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v15 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Configured new connection: %{public}@", buf, 0xCu);
  }

  objc_destroyWeak(&v13);
}

void __86__SBApplicationRestrictionMonitoringServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DAAD78], "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(MEMORY[0x1E0DAAD78], "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __86__SBApplicationRestrictionMonitoringServer_listener_didReceiveConnection_withContext___block_invoke_3;
  v9 = &unk_1E8E9EFC8;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v3, "setInvalidationHandler:", &v6);
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(a1 + 48), v6, v7, v8, v9);

  objc_destroyWeak(&v11);
}

void __86__SBApplicationRestrictionMonitoringServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogApplicationRestrictionMonitoring();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Received connection invalidation: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[SBApplicationRestrictionMonitoringServer removeConnection:]((uint64_t)WeakRetained, *(void **)(a1 + 32));

}

- (void)removeConnection:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    SBLogApplicationRestrictionMonitoring();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Removing connection: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v3);
  }

}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (FBServiceClientAuthenticator)authenticator
{
  return self->_authenticator;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (NSUUID)pendingRestrictionUpdateUUID
{
  return self->_pendingRestrictionUpdateUUID;
}

- (void)setPendingRestrictionUpdateUUID:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRestrictionUpdateUUID, a3);
}

- (BSCompoundAssertion)pendingRestrictionUpdateAssertion
{
  return self->_pendingRestrictionUpdateAssertion;
}

- (void)setPendingRestrictionUpdateAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRestrictionUpdateAssertion, a3);
}

- (BSInvalidatable)restrictionControllerDidFinishNotifyingObserversAssertion
{
  return self->_restrictionControllerDidFinishNotifyingObserversAssertion;
}

- (void)setRestrictionControllerDidFinishNotifyingObserversAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_restrictionControllerDidFinishNotifyingObserversAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictionControllerDidFinishNotifyingObserversAssertion, 0);
  objc_storeStrong((id *)&self->_pendingRestrictionUpdateAssertion, 0);
  objc_storeStrong((id *)&self->_pendingRestrictionUpdateUUID, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
