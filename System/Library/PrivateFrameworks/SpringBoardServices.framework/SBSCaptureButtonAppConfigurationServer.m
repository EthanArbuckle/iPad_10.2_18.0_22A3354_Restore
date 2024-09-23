@implementation SBSCaptureButtonAppConfigurationServer

- (SBSCaptureButtonAppConfigurationServer)initWithAssociatedAppBundleIdentifier:(id)a3 eligibleAppsBundleIdentifiers:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBSCaptureButtonAppConfigurationServer *v11;
  SBSCaptureButtonAppConfigurationServer *v12;
  uint64_t v13;
  NSMutableArray *lock_connections;
  uint64_t v15;
  NSString *lock_associatedAppBundleIdentifier;
  uint64_t v17;
  NSSet *lock_eligibleAppsBundleIdentifiers;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[SBSCaptureButtonAppConfigurationServer init](self, "init");
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    lock_connections = v12->_lock_connections;
    v12->_lock_connections = (NSMutableArray *)v13;

    v15 = objc_msgSend(v8, "copy");
    lock_associatedAppBundleIdentifier = v12->_lock_associatedAppBundleIdentifier;
    v12->_lock_associatedAppBundleIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v9, "copy");
    lock_eligibleAppsBundleIdentifiers = v12->_lock_eligibleAppsBundleIdentifiers;
    v12->_lock_eligibleAppsBundleIdentifiers = (NSSet *)v17;

    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
}

- (void)startServer
{
  BSServiceConnectionListener *v3;
  BSServiceConnectionListener *connectionListener;
  _QWORD v5[5];

  BSDispatchQueueAssertMain();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__SBSCaptureButtonAppConfigurationServer_startServer__block_invoke;
  v5[3] = &unk_1E288FCD0;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0D03460], "listenerWithConfigurator:", v5);
  v3 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue();
  connectionListener = self->_connectionListener;
  self->_connectionListener = v3;

  -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
}

void __53__SBSCaptureButtonAppConfigurationServer_startServer__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  +[SBSCaptureButtonAppConfigurationServiceSpecification identifier](SBSCaptureButtonAppConfigurationServiceSpecification, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSCaptureButtonAppConfigurationServer;
  -[SBSCaptureButtonAppConfigurationServer dealloc](&v3, sel_dealloc);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id location;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  objc_msgSend(v9, "remoteProcess");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "auditToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "hasEntitlement:", CFSTR("com.apple.springboard.private.capture-button-app-configuration-service")))
  {

LABEL_4:
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __84__SBSCaptureButtonAppConfigurationServer_listener_didReceiveConnection_withContext___block_invoke;
    v17[3] = &unk_1E288D270;
    v17[4] = self;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v9, "configureConnection:", v17);
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableArray addObject:](self->_lock_connections, "addObject:", v9);
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v9, "activate");
    objc_destroyWeak(&v18);
    goto LABEL_8;
  }
  objc_msgSend(v9, "remoteProcess");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "auditToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasEntitlement:", CFSTR("com.apple.springboard.private.EA0E3FBF-D56E-4897-B807-A3CA8090EE38"));

  if (v15)
    goto LABEL_4;
  SBLogCameraCaptureAppConfiguration();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v9;
    _os_log_impl(&dword_18EB52000, v16, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationServer invalidating connection because client process is missing required entitlement %@.", buf, 0xCu);
  }

  objc_msgSend(v9, "invalidate");
LABEL_8:
  objc_destroyWeak(&location);

}

void __84__SBSCaptureButtonAppConfigurationServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  +[SBSCaptureButtonAppConfigurationServiceSpecification serviceQuality](SBSCaptureButtonAppConfigurationServiceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[SBSCaptureButtonAppConfigurationServiceSpecification interface](SBSCaptureButtonAppConfigurationServiceSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_55);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__SBSCaptureButtonAppConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_9;
  v9[3] = &unk_1E288D248;
  a1 += 40;
  objc_copyWeak(&v10, (id *)a1);
  objc_msgSend(v3, "setInvalidationHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __84__SBSCaptureButtonAppConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_10;
  v7[3] = &unk_1E288D248;
  objc_copyWeak(&v8, (id *)a1);
  objc_msgSend(v3, "setActivationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);

}

void __84__SBSCaptureButtonAppConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogCameraCaptureAppConfiguration();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationServer interrupted connection %@", (uint8_t *)&v4, 0xCu);
  }

}

void __84__SBSCaptureButtonAppConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  SBLogCameraCaptureAppConfiguration();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18EB52000, v5, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationServer invalidated connection %@", (uint8_t *)&v6, 0xCu);
  }

  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
    objc_msgSend(*((id *)WeakRetained + 3), "removeObject:", v3);
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
  }

}

void __84__SBSCaptureButtonAppConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  SBLogCameraCaptureAppConfiguration();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_18EB52000, v5, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationServer activated connection %@", (uint8_t *)&v8, 0xCu);
  }

  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "associatedAppBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "eligibleAppsBundleIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sendInitialStateForNewConnection:associatedAppsBundleIdentifier:eligibleAppsBundleIdentifiers:", v3, v6, v7);

  }
}

- (NSString)associatedAppBundleIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_associatedAppBundleIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *lock_associatedAppBundleIdentifier;
  NSString *v6;
  id v7;

  v7 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    os_unfair_lock_lock(&self->_lock);
    lock_associatedAppBundleIdentifier = self->_lock_associatedAppBundleIdentifier;
    self->_lock_associatedAppBundleIdentifier = v4;
    v6 = v4;

    os_unfair_lock_unlock(&self->_lock);
    -[SBSCaptureButtonAppConfigurationServer _notifyExistingConnectionsDidUpdateAssociatedAppBundleIdentifier:](self, "_notifyExistingConnectionsDidUpdateAssociatedAppBundleIdentifier:", v6);

  }
}

- (NSSet)eligibleAppsBundleIdentifiers
{
  os_unfair_lock_s *p_lock;
  NSSet *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_eligibleAppsBundleIdentifiers;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setEligibleAppsBundleIdentifiers:(id)a3
{
  NSSet *v4;
  NSSet *lock_eligibleAppsBundleIdentifiers;
  NSSet *v6;
  id v7;

  v7 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    v4 = (NSSet *)objc_msgSend(v7, "copy");
    os_unfair_lock_lock(&self->_lock);
    lock_eligibleAppsBundleIdentifiers = self->_lock_eligibleAppsBundleIdentifiers;
    self->_lock_eligibleAppsBundleIdentifiers = v4;
    v6 = v4;

    os_unfair_lock_unlock(&self->_lock);
    -[SBSCaptureButtonAppConfigurationServer _notifyExistingConnectionsDidUpdateEligibleAppsBundleIdentifiers:](self, "_notifyExistingConnectionsDidUpdateEligibleAppsBundleIdentifiers:", v6);

  }
}

- (void)_sendInitialStateForNewConnection:(id)a3 associatedAppsBundleIdentifier:(id)a4 eligibleAppsBundleIdentifiers:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "remoteTarget");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "receiveInitialOrUpdatedAssociatedAppBundleIdentifier:", v8);

  objc_msgSend(v9, "remoteTarget");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "receiveInitialOrUpdatedEligibleAppsBundleIdentifiers:", v7);
}

- (id)_currentConnections
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_connections;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_notifyExistingConnectionsDidUpdateAssociatedAppBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  v4 = a3;
  -[SBSCaptureButtonAppConfigurationServer _currentConnections](self, "_currentConnections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "remoteTarget", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "receiveInitialOrUpdatedAssociatedAppBundleIdentifier:", v4);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_notifyExistingConnectionsDidUpdateEligibleAppsBundleIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  v4 = a3;
  -[SBSCaptureButtonAppConfigurationServer _currentConnections](self, "_currentConnections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "remoteTarget", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "receiveInitialOrUpdatedEligibleAppsBundleIdentifiers:", v4);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)setCurrentAssociatedAppUsingBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogCameraCaptureAppConfiguration();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v10 = v3;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_18EB52000, v7, OS_LOG_TYPE_DEFAULT, "SBSCaptureButtonAppConfigurationServer received request to set current active app bundle identifier to %{public}@ from %{public}@", buf, 0x16u);
  }

  v8 = v3;
  BSDispatchMain();

}

void __87__SBSCaptureButtonAppConfigurationServer_setCurrentAssociatedAppUsingBundleIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureButtonAppConfigurationServer:setCurrentAssociatedAppUsingBundleIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (NSMutableArray)connections
{
  return self->_lock_connections;
}

- (SBSCaptureButtonAppConfigurationServerDelegate)delegate
{
  return (SBSCaptureButtonAppConfigurationServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_eligibleAppsBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_lock_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_connections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

@end
