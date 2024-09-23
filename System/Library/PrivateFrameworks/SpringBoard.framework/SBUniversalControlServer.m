@implementation SBUniversalControlServer

- (SBUniversalControlServer)initWithKeyboardFocusController:(id)a3 keyboardSuppressionManager:(id)a4
{
  id v7;
  id v8;
  SBUniversalControlServer *v9;
  SBUniversalControlServer *v10;
  uint64_t v11;
  FBServiceClientAuthenticator *clientAuthenticator;
  NSMutableSet *v13;
  NSMutableSet *connections;
  uint64_t v15;
  OS_dispatch_queue *queue;
  void *v17;
  id *v18;
  uint64_t v19;
  id v20;
  _QWORD v22[4];
  id *v23;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SBUniversalControlServer;
  v9 = -[SBUniversalControlServer init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyboardFocusController, a3);
    objc_storeStrong((id *)&v10->_keyboardSuppressionManager, a4);
    v10->_lock._os_unfair_lock_opaque = 0;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.universal-control"));
    clientAuthenticator = v10->_clientAuthenticator;
    v10->_clientAuthenticator = (FBServiceClientAuthenticator *)v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    connections = v10->_connections;
    v10->_connections = v13;

    v15 = BSDispatchQueueCreateWithQualityOfService();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v15;

    v17 = (void *)MEMORY[0x1E0D23030];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __87__SBUniversalControlServer_initWithKeyboardFocusController_keyboardSuppressionManager___block_invoke;
    v22[3] = &unk_1E8E9EFA0;
    v18 = v10;
    v23 = v18;
    objc_msgSend(v17, "listenerWithConfigurator:", v22);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v18[1];
    v18[1] = (id)v19;

    objc_msgSend(v18[1], "activate");
  }

  return v10;
}

void __87__SBUniversalControlServer_initWithKeyboardFocusController_keyboardSuppressionManager___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAB048], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SBUniversalControlServer *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __39__SBUniversalControlServer_description__block_invoke;
  v10 = &unk_1E8E9E820;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __39__SBUniversalControlServer_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (void)appendDescriptionToFormatter:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary copy](self->_lock_keyboardDisabledReasonsByPID, "copy");
  os_unfair_lock_unlock(p_lock);
  v6 = (id)objc_msgSend(v7, "appendObject:withName:", v5, CFSTR("keyboardDisabledReasonsByPID"));

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  FBServiceClientAuthenticator *clientAuthenticator;
  void *v10;
  void *v11;
  NSObject *queue;
  id v13;
  _QWORD block[5];
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogKeyboardFocus();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Received SBUniversalControlServer connection: %{public}@", buf, 0xCu);
  }

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__SBUniversalControlServer_listener_didReceiveConnection_withContext___block_invoke;
  v16[3] = &unk_1E8EA1060;
  v16[4] = self;
  objc_msgSend(v6, "configureConnection:", v16);
  clientAuthenticator = self->_clientAuthenticator;
  objc_msgSend(v6, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "auditToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(clientAuthenticator) = -[FBServiceClientAuthenticator authenticateAuditToken:](clientAuthenticator, "authenticateAuditToken:", v11);

  if ((_DWORD)clientAuthenticator)
  {
    queue = self->_queue;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __70__SBUniversalControlServer_listener_didReceiveConnection_withContext___block_invoke_12;
    block[3] = &unk_1E8E9E820;
    block[4] = self;
    v13 = v6;
    v15 = v13;
    dispatch_async(queue, block);
    objc_msgSend(v13, "activate");

  }
  else
  {
    objc_msgSend(v6, "invalidate");
  }

}

void __70__SBUniversalControlServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = (void *)MEMORY[0x1E0DAB048];
  v4 = a2;
  objc_msgSend(v3, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v5);

  objc_msgSend(MEMORY[0x1E0DAB048], "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:", v6);

  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__SBUniversalControlServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_1E8EABE80;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "setInvalidationHandler:", v7);
  objc_msgSend(v4, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

}

void __70__SBUniversalControlServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogKeyboardFocus();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Received SBUniversalControlServer connection invalidation: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnection:", v3);
}

uint64_t __70__SBUniversalControlServer_listener_didReceiveConnection_withContext___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addConnection:", *(_QWORD *)(a1 + 40));
}

- (void)setKeyboardFocusDisabled:(id)a3 reason:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  NSMutableDictionary *lock_keyboardDisabledReasonsByPID;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;

  v16 = a4;
  v6 = (void *)MEMORY[0x1E0D23010];
  v7 = a3;
  objc_msgSend(v6, "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteTarget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "pid");
  os_unfair_lock_lock(&self->_lock);
  v11 = objc_msgSend(v7, "BOOLValue");

  lock_keyboardDisabledReasonsByPID = self->_lock_keyboardDisabledReasonsByPID;
  if (v11)
  {
    if (!lock_keyboardDisabledReasonsByPID)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v14 = self->_lock_keyboardDisabledReasonsByPID;
      self->_lock_keyboardDisabledReasonsByPID = v13;

      lock_keyboardDisabledReasonsByPID = self->_lock_keyboardDisabledReasonsByPID;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](lock_keyboardDisabledReasonsByPID, "setObject:forKey:", v16, v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](lock_keyboardDisabledReasonsByPID, "removeObjectForKey:", v15);
  }

  -[SBUniversalControlServer _lock_reevaluateKeyboardFocusDisablement](self, "_lock_reevaluateKeyboardFocusDisablement");
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setScreenEdgesOwned:(id)a3 reason:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  NSMutableDictionary *lock_screenEdgesOwnedByPID;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "pid");
  os_unfair_lock_lock(&self->_lock);
  v8 = objc_msgSend(v13, "unsignedIntValue");
  lock_screenEdgesOwnedByPID = self->_lock_screenEdgesOwnedByPID;
  if (v8)
  {
    if (!lock_screenEdgesOwnedByPID)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = self->_lock_screenEdgesOwnedByPID;
      self->_lock_screenEdgesOwnedByPID = v10;

      lock_screenEdgesOwnedByPID = self->_lock_screenEdgesOwnedByPID;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](lock_screenEdgesOwnedByPID, "setObject:forKey:", v13, v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](lock_screenEdgesOwnedByPID, "removeObjectForKey:", v12);
  }

  -[SBUniversalControlServer _lock_reevaluateScreenEdgeOwnership](self, "_lock_reevaluateScreenEdgeOwnership");
  os_unfair_lock_unlock(&self->_lock);

}

- (unint64_t)externalProcessActiveOnScreenEdges
{
  os_unfair_lock_s *p_lock;
  unint64_t lock_externallyControlledScreenEdgeMask;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_externallyControlledScreenEdgeMask = self->_lock_externallyControlledScreenEdgeMask;
  os_unfair_lock_unlock(p_lock);
  return lock_externallyControlledScreenEdgeMask;
}

- (void)_lock_reevaluateScreenEdgeOwnership
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t lock_externallyControlledScreenEdgeMask;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  int v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  self->_lock_externallyControlledScreenEdgeMask = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allValues](self->_lock_screenEdgesOwnedByPID, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        self->_lock_externallyControlledScreenEdgeMask |= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "unsignedIntValue");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v5);
  }

  SBLogKeyboardFocus();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    lock_externallyControlledScreenEdgeMask = self->_lock_externallyControlledScreenEdgeMask;
    *(_DWORD *)buf = 67109120;
    v15 = lock_externallyControlledScreenEdgeMask;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "externally controlled screen edges now: %X", buf, 8u);
  }

}

- (void)_lock_reevaluateKeyboardFocusDisablement
{
  uint64_t v3;
  _QWORD v4[5];
  BOOL v5;

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = -[NSMutableDictionary count](self->_lock_keyboardDisabledReasonsByPID, "count");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__SBUniversalControlServer__lock_reevaluateKeyboardFocusDisablement__block_invoke;
  v4[3] = &unk_1E8E9F508;
  v4[4] = self;
  v5 = v3 != 0;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

void __68__SBUniversalControlServer__lock_reevaluateKeyboardFocusDisablement__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
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
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "activeDisplayWindowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = *(_QWORD **)(a1 + 32);
    if (!v4[8])
    {
      v5 = (void *)v4[12];
      objc_msgSend((id)SBApp, "windowSceneManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "activeDisplayWindowScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBKeyboardFocusLockReason universalControl](SBKeyboardFocusLockReason, "universalControl");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "focusLockSpringBoardWindowScene:forReason:", v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 64);
      *(_QWORD *)(v10 + 64) = v9;

      v4 = *(_QWORD **)(a1 + 32);
    }
    v12 = (void *)v4[13];
    objc_msgSend(v3, "_fbsDisplayIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "acquireKeyboardSuppressionAssertionWithReason:predicate:displayIdentity:", CFSTR("SBUniversalControlServer"), 0, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 72);
    *(_QWORD *)(v15 + 72) = v14;

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "invalidate");
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 64);
    *(_QWORD *)(v17 + 64) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
    v19 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v19 + 72);
    *(_QWORD *)(v19 + 72) = 0;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)_queue_addConnection:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogKeyboardFocus();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Adding SBUniversalControlServer connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableSet addObject:](self->_connections, "addObject:", v4);

}

- (void)_queue_removeConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *lock_keyboardDisabledReasonsByPID;
  void *v9;
  NSMutableDictionary *lock_screenEdgesOwnedByPID;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogKeyboardFocus();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Removing SBUniversalControlServer connection: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet removeObject:](self->_connections, "removeObject:", v4);
  os_unfair_lock_lock(&self->_lock);
  lock_keyboardDisabledReasonsByPID = self->_lock_keyboardDisabledReasonsByPID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "pid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](lock_keyboardDisabledReasonsByPID, "removeObjectForKey:", v9);

  -[SBUniversalControlServer _lock_reevaluateKeyboardFocusDisablement](self, "_lock_reevaluateKeyboardFocusDisablement");
  lock_screenEdgesOwnedByPID = self->_lock_screenEdgesOwnedByPID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "pid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](lock_screenEdgesOwnedByPID, "removeObjectForKey:", v11);

  -[SBUniversalControlServer _lock_reevaluateScreenEdgeOwnership](self, "_lock_reevaluateScreenEdgeOwnership");
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setExternalProcessActiveOnScreenEdges:(unint64_t)a3
{
  self->_externalProcessActiveOnScreenEdges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardSuppressionManager, 0);
  objc_storeStrong((id *)&self->_keyboardFocusController, 0);
  objc_storeStrong((id *)&self->_lock_keyboardSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_lock_keyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_lock_screenEdgesOwnedByPID, 0);
  objc_storeStrong((id *)&self->_lock_keyboardDisabledReasonsByPID, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

@end
