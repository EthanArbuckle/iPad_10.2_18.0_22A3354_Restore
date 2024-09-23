@implementation SBSystemApertureRestrictionServer

- (SBSystemApertureRestrictionServer)initWithDelegate:(id)a3
{
  id v4;
  SBSystemApertureRestrictionServer *v5;
  uint64_t v6;
  NSMutableArray *connections;
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
  v18.super_class = (Class)SBSystemApertureRestrictionServer;
  v5 = -[SBSystemApertureRestrictionServer init](&v18, sel_init);
  if (v5)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    v5->_isValid = 1;
    objc_storeWeak((id *)&v5->_delegate, v4);
    v5->_clientServiceCollectionLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    connections = v5->_connections;
    v5->_connections = (NSMutableArray *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = BSDispatchQueueCreateWithQualityOfService();
    connectionQueue = v5->_connectionQueue;
    v5->_connectionQueue = (OS_dispatch_queue *)v9;

    v11 = (void *)MEMORY[0x1E0D23030];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __54__SBSystemApertureRestrictionServer_initWithDelegate___block_invoke;
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

void __54__SBSystemApertureRestrictionServer_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAB000], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)invalidate
{
  self->_isValid = 0;
  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  _QWORD v18[5];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogSystemApertureHosting();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "SBSystemApertureRestrictionServer received connection %@", buf, 0xCu);
  }

  objc_msgSend(v6, "remoteProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "pid");
  if (v9 != getpid())
  {
    objc_msgSend(v6, "remoteProcess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "auditToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "hasEntitlement:", CFSTR("com.apple.springboard.system-component-layout-monitoring")) & 1) == 0)
    {
      objc_msgSend(v6, "remoteProcess");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "auditToken");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "hasEntitlement:", CFSTR("com.apple.springboard.system-component-restriction")) & 1) == 0)
      {
        objc_msgSend(v6, "remoteProcess");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "auditToken");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "hasEntitlement:", CFSTR("com.apple.springboard.system-component-layout-monitoring"));

        if ((v17 & 1) == 0)
          goto LABEL_5;
LABEL_12:
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke;
        v18[3] = &unk_1E8EA1060;
        v18[4] = self;
        objc_msgSend(v6, "configureConnection:", v18);
        os_unfair_lock_lock(&self->_clientServiceCollectionLock);
        -[NSMutableArray addObject:](self->_connections, "addObject:", v6);
        os_unfair_lock_unlock(&self->_clientServiceCollectionLock);
        objc_msgSend(v6, "activate");
        goto LABEL_13;
      }

    }
    goto LABEL_12;
  }

LABEL_5:
  SBLogSystemApertureHosting();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "SBSystemApertureRestrictionServer invalidating connection because client process is missing required entitlement %@ .", buf, 0xCu);
  }

  objc_msgSend(v6, "invalidate");
LABEL_13:

}

void __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DAB000], "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(MEMORY[0x1E0DAB000], "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v10[3] = &unk_1E8EA1010;
  objc_copyWeak(&v11, &location);
  v7 = (void *)MEMORY[0x1D17E5550](v10);
  objc_msgSend(v3, "setInterruptionHandler:", v7);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_3;
  v8[3] = &unk_1E8EA18D8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setActivationHandler:", v8);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 4));
  SBLogSystemApertureHosting();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBSystemApertureRestrictionServer interrupted/invalidated connection %@", buf, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
  objc_msgSend(*((id *)WeakRetained + 2), "removeObject:", v3);
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
  v8 = WeakRetained;
  v9 = v3;
  v6 = v3;
  v7 = WeakRetained;
  BSDispatchMain();

}

void __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_29(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[4];
  id v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(void **)(v1 + 24);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_2_30;
    v13[3] = &unk_1E8EA18B0;
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v2, "bs_filter:", v13);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          objc_msgSend(v8, "setInvalidationReason:", CFSTR("connection invalidated"));
          objc_msgSend(v8, "invalidate");
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
      }
      while (v5);
    }

  }
}

BOOL __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_2_30(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "associatedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3 == *(void **)(a1 + 32);
  else
    v4 = 1;

  return v4;
}

void __79__SBSystemApertureRestrictionServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
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
  SBLogSystemApertureHosting();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBSystemApertureRestrictionServer activated connection %@", (uint8_t *)&v6, 0xCu);
  }

}

- (id)acquireRestrictSystemApertureLayoutToInertAssertionIdentifierWithReason:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SBSystemApertureRestrictionServerAssertionWrapper *v11;
  void *v12;
  _SBSystemApertureRestrictionServerAssertionWrapper *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "auditToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasEntitlement:", CFSTR("com.apple.springboard.system-component-restriction")))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: %@"), v9, v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = [_SBSystemApertureRestrictionServerAssertionWrapper alloc];
    objc_msgSend(v7, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:](v11, "initWithIdentifier:forReason:invalidationBlock:", v12, v10, &__block_literal_global_21);

    objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SBSystemApertureRestrictionServerAssertionWrapper setAssociatedConnection:](v13, "setAssociatedConnection:", v14);

    v3 = v10;
    v15 = v13;
    BSDispatchMain();

  }
  else
  {
    SBLogSystemApertureHosting();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "SBSystemApertureRestrictionServer invalidating connection because client process is missing required entitlement %@ .", buf, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

void __109__SBSystemApertureRestrictionServer_acquireRestrictSystemApertureLayoutToInertAssertionIdentifierWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  BSDispatchMain();

}

void __109__SBSystemApertureRestrictionServer_acquireRestrictSystemApertureLayoutToInertAssertionIdentifierWithReason___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "wrappedAssertion");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setWrappedAssertion:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidationReason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateWithReason:", v2);

}

void __109__SBSystemApertureRestrictionServer_acquireRestrictSystemApertureLayoutToInertAssertionIdentifierWithReason___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "restrictSystemApertureToInertWithReason:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setWrappedAssertion:", v3);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __109__SBSystemApertureRestrictionServer_acquireRestrictSystemApertureLayoutToInertAssertionIdentifierWithReason___block_invoke_4;
  v8[3] = &unk_1E8EA1940;
  objc_copyWeak(&v10, &location);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "addInvalidationBlock:", v8);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v5;

    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 48));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __109__SBSystemApertureRestrictionServer_acquireRestrictSystemApertureLayoutToInertAssertionIdentifierWithReason___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[3], "removeObject:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)invalidateRestrictSystemApertureLayoutToInertAssertionWithIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

void __106__SBSystemApertureRestrictionServer_invalidateRestrictSystemApertureLayoutToInertAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __106__SBSystemApertureRestrictionServer_invalidateRestrictSystemApertureLayoutToInertAssertionWithIdentifier___block_invoke_2;
  v4[3] = &unk_1E8EA18B0;
  v5 = v1;
  objc_msgSend(v2, "bs_firstObjectPassingTest:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidationReason:", CFSTR("restriction server client request"));
  objc_msgSend(v3, "invalidate");

}

uint64_t __106__SBSystemApertureRestrictionServer_invalidateRestrictSystemApertureLayoutToInertAssertionWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)acquireSystemApertureCompleteSuppressionAssertionIdentifierWithReason:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SBSystemApertureRestrictionServerAssertionWrapper *v11;
  void *v12;
  _SBSystemApertureRestrictionServerAssertionWrapper *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "auditToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasEntitlement:", CFSTR("com.apple.springboard.system-component-complete-suppression")))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: %@"), v9, v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = [_SBSystemApertureRestrictionServerAssertionWrapper alloc];
    objc_msgSend(v7, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:](v11, "initWithIdentifier:forReason:invalidationBlock:", v12, v10, &__block_literal_global_48_0);

    objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SBSystemApertureRestrictionServerAssertionWrapper setAssociatedConnection:](v13, "setAssociatedConnection:", v14);

    v3 = v10;
    v15 = v13;
    BSDispatchMain();

  }
  else
  {
    SBLogSystemApertureHosting();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "SBSystemApertureRestrictionServer invalidating connection because client process is missing required entitlement %@ .", buf, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

void __107__SBSystemApertureRestrictionServer_acquireSystemApertureCompleteSuppressionAssertionIdentifierWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  BSDispatchMain();

}

void __107__SBSystemApertureRestrictionServer_acquireSystemApertureCompleteSuppressionAssertionIdentifierWithReason___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "wrappedAssertion");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setWrappedAssertion:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidationReason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateWithReason:", v2);

}

void __107__SBSystemApertureRestrictionServer_acquireSystemApertureCompleteSuppressionAssertionIdentifierWithReason___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "suppressSystemApertureCompletelyWithReason:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setWrappedAssertion:", v3);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __107__SBSystemApertureRestrictionServer_acquireSystemApertureCompleteSuppressionAssertionIdentifierWithReason___block_invoke_4;
  v8[3] = &unk_1E8EA1940;
  objc_copyWeak(&v10, &location);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "addInvalidationBlock:", v8);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v5;

    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 48));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __107__SBSystemApertureRestrictionServer_acquireSystemApertureCompleteSuppressionAssertionIdentifierWithReason___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[3], "removeObject:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)invalidateSystemApertureCompleteSuppressionAssertionWithIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

void __104__SBSystemApertureRestrictionServer_invalidateSystemApertureCompleteSuppressionAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __104__SBSystemApertureRestrictionServer_invalidateSystemApertureCompleteSuppressionAssertionWithIdentifier___block_invoke_2;
  v4[3] = &unk_1E8EA18B0;
  v5 = v1;
  objc_msgSend(v2, "bs_firstObjectPassingTest:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidationReason:", CFSTR("restriction server client request"));
  objc_msgSend(v3, "invalidate");

}

uint64_t __104__SBSystemApertureRestrictionServer_invalidateSystemApertureCompleteSuppressionAssertionWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_remoteAssertions, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

@end
