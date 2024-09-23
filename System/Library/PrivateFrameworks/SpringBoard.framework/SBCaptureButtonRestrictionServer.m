@implementation SBCaptureButtonRestrictionServer

- (SBCaptureButtonRestrictionServer)initWithDelegate:(id)a3
{
  id v4;
  SBCaptureButtonRestrictionServer *v5;
  NSMutableSet *v6;
  NSMutableSet *connections;
  void *v8;
  uint64_t v9;
  OS_dispatch_queue *connectionQueue;
  void *v11;
  id *v12;
  uint64_t v13;
  id v14;
  _QWORD v16[4];
  id *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBCaptureButtonRestrictionServer;
  v5 = -[SBCaptureButtonRestrictionServer init](&v18, sel_init);
  if (v5)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    v5->_isValid = 1;
    objc_storeWeak((id *)&v5->_delegate, v4);
    v5->_clientServiceCollectionLock._os_unfair_lock_opaque = 0;
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    connections = v5->_connections;
    v5->_connections = v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = BSDispatchQueueCreateWithQualityOfService();
    connectionQueue = v5->_connectionQueue;
    v5->_connectionQueue = (OS_dispatch_queue *)v9;

    v11 = (void *)MEMORY[0x1E0D23030];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __53__SBCaptureButtonRestrictionServer_initWithDelegate___block_invoke;
    v16[3] = &unk_1E8E9EFA0;
    v12 = v5;
    v17 = v12;
    objc_msgSend(v11, "listenerWithConfigurator:", v16);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v12[5];
    v12[5] = (id)v13;

    objc_msgSend(v12[5], "activate");
  }

  return v5;
}

void __53__SBCaptureButtonRestrictionServer_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAAE10], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBCaptureButtonRestrictionServer.m");
  v16 = 1024;
  v17 = 78;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSMutableDictionary *versionedPIDToRemoteAssertion;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_isValid)
  {
    self->_isValid = 0;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSMutableDictionary allValues](self->_versionedPIDToRemoteAssertion, "allValues", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "wrappedAssertion");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "invalidate");

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    versionedPIDToRemoteAssertion = self->_versionedPIDToRemoteAssertion;
    self->_versionedPIDToRemoteAssertion = 0;

    -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
  }
}

- (id)_authorizedClientBundleIdentifiers
{
  if (a1)
  {
    if (_authorizedClientBundleIdentifiers_onceToken != -1)
      dispatch_once(&_authorizedClientBundleIdentifiers_onceToken, &__block_literal_global_305);
    a1 = (id)_authorizedClientBundleIdentifiers_authorizedBundleIdentifiers;
  }
  return a1;
}

void __70__SBCaptureButtonRestrictionServer__authorizedClientBundleIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.accessibility.AccessibilityUIServer"), CFSTR("com.apple.Diagnostics"), CFSTR("com.apple.Mica-Player"), CFSTR("com.apple.Preferences"), CFSTR("com.apple.purplebuddy"), CFSTR("com.apple.VoiceOver"), 0);
  v1 = (void *)_authorizedClientBundleIdentifiers_authorizedBundleIdentifiers;
  _authorizedClientBundleIdentifiers_authorizedBundleIdentifiers = v0;

}

- (uint64_t)_remoteProcessIsAuthorizedClient:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "auditToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasEntitlement:", CFSTR("com.apple.springboard.capture-button-restriction")) & 1) != 0
      || objc_msgSend(v5, "hasEntitlement:", CFSTR("com.apple.springboard.126E27E0-D025-4A46-B2F1-AF49D4E0B105")))
    {
      objc_msgSend(v4, "bundleIdentifier");
      v6 = objc_claimAutoreleasedReturnValue();
      -[SBCaptureButtonRestrictionServer _authorizedClientBundleIdentifiers]((id)a1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = objc_msgSend(v7, "containsObject:", v6);

      if ((a1 & 1) == 0)
      {
        SBLogCameraCaptureRestriction();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[SBCaptureButtonRestrictionServer _remoteProcessIsAuthorizedClient:].cold.1((uint64_t)v4, (uint64_t)v6, v8);

      }
    }
    else
    {
      if ((objc_msgSend(v5, "hasEntitlement:", CFSTR("com.apple.springboard.capture-button-restriction-internal")) & 1) != 0
        || objc_msgSend(v5, "hasEntitlement:", CFSTR("com.apple.springboard.8CFFD00F-D62F-43B2-AA10-427657A783F4")))
      {
        if ((os_variant_has_internal_content() & 1) != 0)
        {
          a1 = 1;
LABEL_18:

          goto LABEL_19;
        }
        SBLogCameraCaptureRestriction();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[SBCaptureButtonRestrictionServer _remoteProcessIsAuthorizedClient:].cold.2((uint64_t)v4, v6, v9, v10, v11, v12, v13, v14);
      }
      else
      {
        SBLogCameraCaptureRestriction();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[SBCaptureButtonRestrictionServer _remoteProcessIsAuthorizedClient:].cold.3((uint64_t)v4, v6, v15, v16, v17, v18, v19, v20);
      }
      a1 = 0;
    }

    goto LABEL_18;
  }
LABEL_19:

  return a1;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[6];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogCameraCaptureRestriction();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "SBCaptureButtonRestrictionServer received connection %{public}@", buf, 0xCu);
  }

  objc_msgSend(v6, "remoteProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "auditToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "versionedPID");

  LODWORD(v9) = objc_msgSend(v8, "pid");
  if ((_DWORD)v9 == getpid()
    || !-[SBCaptureButtonRestrictionServer _remoteProcessIsAuthorizedClient:]((uint64_t)self, v8))
  {
    objc_msgSend(v6, "invalidate");
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__SBCaptureButtonRestrictionServer_listener_didReceiveConnection_withContext___block_invoke;
    v11[3] = &unk_1E8EB9670;
    v11[4] = self;
    v11[5] = v10;
    objc_msgSend(v6, "configureConnection:", v11);
    os_unfair_lock_lock(&self->_clientServiceCollectionLock);
    -[NSMutableSet addObject:](self->_connections, "addObject:", v6);
    os_unfair_lock_unlock(&self->_clientServiceCollectionLock);
    objc_msgSend(v6, "activate");
  }

}

void __78__SBCaptureButtonRestrictionServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11[2];
  id location;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DAAE10], "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(MEMORY[0x1E0DAAE10], "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__SBCaptureButtonRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v10[3] = &unk_1E8EB9648;
  objc_copyWeak(v11, &location);
  v11[1] = *(id *)(a1 + 40);
  v7 = (void *)MEMORY[0x1D17E5550](v10);
  objc_msgSend(v3, "setInterruptionHandler:", v7);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __78__SBCaptureButtonRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_4;
  v8[3] = &unk_1E8EA18D8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setActivationHandler:", v8);
  objc_destroyWeak(&v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

}

void __78__SBCaptureButtonRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 4));
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
  objc_msgSend(*((id *)WeakRetained + 2), "removeObject:", v3);

  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
  v5 = WeakRetained;
  BSDispatchMain();

}

void __78__SBCaptureButtonRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    -[SBCaptureButtonRestrictionServer _removeCaptureButtonInhibitActionAssertionForVersionedPID:reason:](v2, *(_QWORD *)(a1 + 40), CFSTR("connection interrupted"));
}

- (void)_removeCaptureButtonInhibitActionAssertionForVersionedPID:(void *)a3 reason:
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 24), "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      SBLogCameraCaptureRestriction();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromBSVersionedPID();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543618;
        v12 = v9;
        v13 = 2114;
        v14 = v5;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "SBCaptureButtonRestrictionServer invalidate remote assertion for %{public}@ for reason %{public}@", (uint8_t *)&v11, 0x16u);

      }
      objc_msgSend(v7, "wrappedAssertion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "invalidate");

      objc_msgSend(*(id *)(a1 + 24), "removeObjectForKey:", v6);
    }

  }
}

void __78__SBCaptureButtonRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  dispatch_queue_t *WeakRetained;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_assert_queue_V2(WeakRetained[4]);
  SBLogCameraCaptureRestriction();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBCaptureButtonRestrictionServer activated connection %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)_removeCaptureButtonInhibitActionAssertionForConnection:(uint64_t)a1
{
  void *v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a2, "remoteProcess");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "auditToken");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[SBCaptureButtonRestrictionServer _removeCaptureButtonInhibitActionAssertionForVersionedPID:reason:](a1, objc_msgSend(v4, "versionedPID"), CFSTR("remote request"));
  }
}

- (void)_addCaptureButtonInhibitActionAssertionForConnection:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _SBCaptureButtonRestrictionServerAssertionWrapper *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "remoteProcess");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "auditToken");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v16, "versionedPID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(_SBCaptureButtonRestrictionServerAssertionWrapper);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v9 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromBSVersionedPID();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("request from process %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "inhibitCaptureButtonActionAssertionWithReason:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[_SBCaptureButtonRestrictionServerAssertionWrapper setWrappedAssertion:](v7, "setWrappedAssertion:", v12);
    -[_SBCaptureButtonRestrictionServerAssertionWrapper setAssociatedConnection:](v7, "setAssociatedConnection:", v3);

    v13 = *(void **)(a1 + 24);
    if (!v13)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v14;

      v13 = *(void **)(a1 + 24);
    }
    objc_msgSend(v13, "setObject:forKey:", v7, v6);

  }
}

- (void)setCaptureButtonActionInhibited:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v6 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  v5 = v3;
  BSDispatchMain();

}

void __68__SBCaptureButtonRestrictionServer_setCaptureButtonActionInhibited___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  if (v2)
    -[SBCaptureButtonRestrictionServer _addCaptureButtonInhibitActionAssertionForConnection:](v3, v4);
  else
    -[SBCaptureButtonRestrictionServer _removeCaptureButtonInhibitActionAssertionForConnection:](v3, v4);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_versionedPIDToRemoteAssertion, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

- (void)_remoteProcessIsAuthorizedClient:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "SBCaptureButtonRestrictionServer: process is not authorized to suppress the capture button %{public}@ -- %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_remoteProcessIsAuthorizedClient:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "SBCaptureButtonRestrictionServer: process is not authorized to suppress the capture button on prod devices %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_remoteProcessIsAuthorizedClient:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "SBCaptureButtonRestrictionServer: process is missing required entitlement %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
