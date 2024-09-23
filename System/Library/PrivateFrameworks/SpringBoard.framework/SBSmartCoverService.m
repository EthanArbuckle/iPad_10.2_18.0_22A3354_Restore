@implementation SBSmartCoverService

- (SBSmartCoverService)initWithInitialState:(int64_t)a3
{
  SBSmartCoverService *v4;
  SBSmartCoverService *v5;
  uint64_t v6;
  NSMutableSet *connections;
  uint64_t v8;
  NSMutableSet *observingConnections;
  void *v10;
  id *v11;
  uint64_t v12;
  id v13;
  _QWORD v15[4];
  id *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBSmartCoverService;
  v4 = -[SBSmartCoverService init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lastSmartCoverState = a3;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    connections = v5->_connections;
    v5->_connections = (NSMutableSet *)v6;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    observingConnections = v5->_observingConnections;
    v5->_observingConnections = (NSMutableSet *)v8;

    v10 = (void *)MEMORY[0x1E0D23030];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __44__SBSmartCoverService_initWithInitialState___block_invoke;
    v15[3] = &unk_1E8E9EFA0;
    v11 = v5;
    v16 = v11;
    objc_msgSend(v10, "listenerWithConfigurator:", v15);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v11[1];
    v11[1] = (id)v12;

    objc_msgSend(v11[1], "activate");
  }
  return v5;
}

void __44__SBSmartCoverService_initWithInitialState___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(v3, "setService:", CFSTR("com.apple.springboard.smart-cover"));
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));

}

- (void)smartCoverStateDidChange:(int64_t)a3
{
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_lastSmartCoverState != a3)
  {
    self->_lastSmartCoverState = a3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = self->_observingConnections;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "remoteTarget", (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "observeSmartCoverStateDidChange:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  SBSmartCoverService *v15;
  id v16;

  v6 = a4;
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", CFSTR("com.apple.springboard.smartCoverObserving"));

  if ((v8 & 1) != 0)
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __65__SBSmartCoverService_listener_didReceiveConnection_withContext___block_invoke;
    v14 = &unk_1E8EA88C8;
    v15 = self;
    v9 = v6;
    v16 = v9;
    objc_msgSend(v9, "configureConnection:", &v11);
    -[NSMutableSet addObject:](self->_connections, "addObject:", v9, v11, v12, v13, v14, v15);
    objc_msgSend(v9, "activate");

  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBSmartCoverService listener:didReceiveConnection:withContext:].cold.1(v10);

    objc_msgSend(v6, "invalidate");
  }

}

void __65__SBSmartCoverService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = (void *)MEMORY[0x1E0DAAFC0];
  v4 = a2;
  objc_msgSend(v3, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:", v5);

  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D23040], "userInitiated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v6);

  objc_msgSend(v4, "setTargetQueue:", MEMORY[0x1E0C80D38]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__SBSmartCoverService_listener_didReceiveConnection_withContext___block_invoke_2;
  v9[3] = &unk_1E8EA8DA0;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v11 = v8;
  objc_msgSend(v4, "setInvalidationHandler:", v9);

}

void __65__SBSmartCoverService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "remoteProcess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "SBSmartCoverService: connection invalidated: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObject:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObject:", v3);

}

- (void)setWantsSmartCoverStateChanges:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D23010];
  v5 = a3;
  objc_msgSend(v4, "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "BOOLValue");

  v8 = -[NSMutableSet containsObject:](self->_observingConnections, "containsObject:", v6);
  if (v7)
  {
    if ((v8 & 1) == 0)
    {
      SBLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "remoteProcess");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v10;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "SBSmartCoverService: observer added: %{public}@", (uint8_t *)&v15, 0xCu);

      }
      -[NSMutableSet addObject:](self->_observingConnections, "addObject:", v6);
      objc_msgSend(v6, "remoteTarget");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_lastSmartCoverState);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "observeSmartCoverStateDidChange:", v12);

    }
  }
  else if (v8)
  {
    SBLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "remoteProcess");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "SBSmartCoverService: observer removed: %{public}@", (uint8_t *)&v15, 0xCu);

    }
    -[NSMutableSet removeObject:](self->_observingConnections, "removeObject:", v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observingConnections, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(os_log_t)log didReceiveConnection:withContext:.cold.1(os_log_t log)
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138543362;
  v2 = CFSTR("com.apple.springboard.smartCoverObserving");
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "SBSmartCoverService: requires entitlement %{public}@", (uint8_t *)&v1, 0xCu);
}

@end
