@implementation PGBackgroundPIPService

- (PGBackgroundPIPService)init
{
  PGBackgroundPIPService *v2;
  PGBackgroundPIPService *v3;
  uint64_t v4;
  NSMutableSet *lock_targets;
  uint64_t v6;
  NSMutableDictionary *lock_targetsByActivitySessionIdentifier;
  uint64_t v8;
  NSMutableSet *mutableIdentifiersForAuthorizedActivitySessions;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  void *v12;
  PGBackgroundPIPService *v13;
  uint64_t v14;
  BSServiceConnectionListener *connectionListener;
  _QWORD v17[4];
  PGBackgroundPIPService *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PGBackgroundPIPService;
  v2 = -[PGBackgroundPIPService init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    lock_targets = v3->_lock_targets;
    v3->_lock_targets = (NSMutableSet *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    lock_targetsByActivitySessionIdentifier = v3->_lock_targetsByActivitySessionIdentifier;
    v3->_lock_targetsByActivitySessionIdentifier = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    mutableIdentifiersForAuthorizedActivitySessions = v3->_mutableIdentifiersForAuthorizedActivitySessions;
    v3->_mutableIdentifiersForAuthorizedActivitySessions = (NSMutableSet *)v8;

    v10 = dispatch_queue_create("com.apple.pegasus.PGBackgroundPIPService", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v10;

    v12 = (void *)MEMORY[0x1E0D23030];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __30__PGBackgroundPIPService_init__block_invoke;
    v17[3] = &unk_1E6230A00;
    v13 = v3;
    v18 = v13;
    objc_msgSend(v12, "listenerWithConfigurator:", v17);
    v14 = objc_claimAutoreleasedReturnValue();
    connectionListener = v13->_connectionListener;
    v13->_connectionListener = (BSServiceConnectionListener *)v14;

  }
  return v3;
}

void __30__PGBackgroundPIPService_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  +[PGBackgroundPIPServiceSpecification identifier](PGBackgroundPIPServiceSpecification, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)startListener
{
  -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PGBackgroundPIPService;
  -[PGBackgroundPIPService dealloc](&v3, sel_dealloc);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  _PGBackgroundPIPServiceConnectionTarget *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  _PGBackgroundPIPServiceConnectionTarget *v14;
  NSObject *v15;
  _PGBackgroundPIPServiceConnectionTarget *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[4];
  _PGBackgroundPIPServiceConnectionTarget *v20;
  PGBackgroundPIPService *v21;
  id location;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  _PGBackgroundPIPServiceConnectionTarget *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (_PGBackgroundPIPServiceConnectionTarget *)a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[_PGBackgroundPIPServiceConnectionTarget remoteProcess](v9, "remoteProcess");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "auditToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasEntitlement:", CFSTR("com.apple.pegasus.backgroundPIPServiceEntitlement"));

  if (v13)
  {
    v14 = -[_PGBackgroundPIPServiceConnectionTarget initWithConnection:delegate:]([_PGBackgroundPIPServiceConnectionTarget alloc], "initWithConnection:delegate:", v9, self);
    PGLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[PGBackgroundPIPService listener:didReceiveConnection:withContext:]";
      v25 = 2114;
      v26 = v14;
      _os_log_impl(&dword_1B0CD6000, v15, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
    }

    os_unfair_lock_lock(&self->_lock);
    -[NSMutableSet addObject:](self->_lock_targets, "addObject:", v14);
    os_unfair_lock_unlock(&self->_lock);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __68__PGBackgroundPIPService_listener_didReceiveConnection_withContext___block_invoke;
    v19[3] = &unk_1E6230A78;
    v16 = v14;
    v20 = v16;
    v21 = self;
    -[_PGBackgroundPIPServiceConnectionTarget configureConnection:](v9, "configureConnection:", v19);
    PGLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[PGBackgroundPIPService listener:didReceiveConnection:withContext:]";
      v25 = 2114;
      v26 = v9;
      _os_log_impl(&dword_1B0CD6000, v17, OS_LOG_TYPE_DEFAULT, "%s Activating connection %{public}@", buf, 0x16u);
    }

    -[_PGBackgroundPIPServiceConnectionTarget activate](v9, "activate");
  }
  else
  {
    PGLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[PGBackgroundPIPService listener:didReceiveConnection:withContext:]";
      v25 = 2114;
      v26 = v9;
      _os_log_impl(&dword_1B0CD6000, v18, OS_LOG_TYPE_DEFAULT, "%s Invalidating unvalidated client %{public}@", buf, 0x16u);
    }

    -[_PGBackgroundPIPServiceConnectionTarget invalidate](v9, "invalidate");
  }
  objc_destroyWeak(&location);

}

void __68__PGBackgroundPIPService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  +[PGBackgroundPIPServiceSpecification serviceQuality](PGBackgroundPIPServiceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[PGBackgroundPIPServiceSpecification interface](PGBackgroundPIPServiceSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__PGBackgroundPIPService_listener_didReceiveConnection_withContext___block_invoke_2;
  v12[3] = &unk_1E6230A28;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setActivationHandler:", v12);
  v7 = v6;
  v8 = 3221225472;
  v9 = __68__PGBackgroundPIPService_listener_didReceiveConnection_withContext___block_invoke_14;
  v10 = &unk_1E6230A50;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", &v7);
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), v7, v8, v9, v10);

}

void __68__PGBackgroundPIPService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PGLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[PGBackgroundPIPService listener:didReceiveConnection:withContext:]_block_invoke_2";
    v8 = 2114;
    v9 = v3;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1B0CD6000, v4, OS_LOG_TYPE_DEFAULT, "%s Activated connection %{public}@ for target %{public}@", (uint8_t *)&v6, 0x20u);
  }

}

void __68__PGBackgroundPIPService_listener_didReceiveConnection_withContext___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PGLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[PGBackgroundPIPService listener:didReceiveConnection:withContext:]_block_invoke";
    v8 = 2114;
    v9 = v3;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1B0CD6000, v4, OS_LOG_TYPE_DEFAULT, "%s Invalidated connection %{public}@ for target: %{public}@", (uint8_t *)&v6, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_handleInvalidatedTarget:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[PGBackgroundPIPService _handleInvalidatedTarget:]";
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }

  objc_msgSend(v4, "activitySessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionToStateIfPossible:", 5);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet removeObject:](self->_lock_targets, "removeObject:", v4);
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_targetsByActivitySessionIdentifier, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[PGBackgroundPIPService _handleInvalidatedTarget:]";
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_1B0CD6000, v8, OS_LOG_TYPE_DEFAULT, "%s existingTargetForIdentifier %{public}@", buf, 0x16u);
    }

    if (objc_msgSend(v7, "isEqual:", v4))
    {
      v9 = v6;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_targetsByActivitySessionIdentifier, "setObject:forKeyedSubscript:", 0, v9);
    }
    else
    {
      v9 = 0;
    }

    os_unfair_lock_unlock(&self->_lock);
    if (v9)
    {
      v10 = v9;
      BSDispatchMain();

    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

void __51__PGBackgroundPIPService__handleInvalidatedTarget___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 64);
    *(_QWORD *)(v3 + 64) = v2;

    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 136315394;
      v9 = "-[PGBackgroundPIPService _handleInvalidatedTarget:]_block_invoke";
      v10 = 2114;
      v11 = v6;
      _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s BackgroundPIP: Revoking authorization for identifier %{public}@", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundPIPService:didRevokeBackgroundPIPAuthorizationForActivitySessionWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)backgroundPIPTargetRequestsAuthorization:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[PGBackgroundPIPService backgroundPIPTargetRequestsAuthorization:]";
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }

  objc_msgSend(v4, "activitySessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_targetsByActivitySessionIdentifier, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_targetsByActivitySessionIdentifier, "setObject:forKeyedSubscript:", v4, v6);
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_9;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (!objc_msgSend(v7, "isConnectionActive")
    || objc_msgSend(v7, "state") == 4
    || objc_msgSend(v7, "state") == 5)
  {
    objc_msgSend(v7, "invalidate");
LABEL_9:
    v9 = v4;
    v10 = v6;
    BSDispatchMain();

    goto LABEL_10;
  }
  PGLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v12 = (const char *)v6;
    v13 = 2114;
    v14 = v4;
    v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_1B0CD6000, v8, OS_LOG_TYPE_DEFAULT, "Refusing authorization for %{public}@ because an authorization request (%{public}@) for this activitySessionIdentifier already exists %{public}@ and has not yet been revoked.", buf, 0x20u);
  }

  objc_msgSend(v4, "transitionToStateIfPossible:", 4);
LABEL_10:

}

void __67__PGBackgroundPIPService_backgroundPIPTargetRequestsAuthorization___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "activitySessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v2, "backgroundPIPService:canAuthorizeBackgroundPIPForActivitySessionWithIdentifier:appBundleIdentifier:", v3, v4, v5);

  if ((_DWORD)v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 48));
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 48);
      v14 = 136315394;
      v15 = "-[PGBackgroundPIPService backgroundPIPTargetRequestsAuthorization:]_block_invoke";
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_1B0CD6000, v6, OS_LOG_TYPE_DEFAULT, "%s BackgroundPIP: Authorizing identifier %{public}@", (uint8_t *)&v14, 0x16u);
    }

    v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 64);
    *(_QWORD *)(v9 + 64) = v8;

    objc_msgSend(*(id *)(a1 + 40), "transitionToStateIfPossible:", 2);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backgroundPIPService:didGrantBackgroundPIPAuthorizationForActivitySessionWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
  else
  {
    PGLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(const char **)(a1 + 48);
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1B0CD6000, v12, OS_LOG_TYPE_DEFAULT, "Refusing authorization for %{public}@ because delegate didn't allow it.", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "transitionToStateIfPossible:", 4);
  }
}

- (void)pipDidStartForRemoteObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "pictureInPictureApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "activitySessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGBackgroundPIPService _targetForIdentifier:](self, "_targetForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v10);

  if (v9)
    objc_msgSend(v7, "transitionToStateIfPossible:", 3);

}

- (void)pipDidStopForRemoteObject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "activitySessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGBackgroundPIPService _targetForIdentifier:](self, "_targetForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pictureInPictureApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v8))
  {
    v9 = objc_msgSend(v5, "state");

    if (v9 == 3)
    {
      if (objc_msgSend(v13, "isVideoCall"))
      {
        objc_msgSend(v13, "pictureInPictureApplication");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.InCallService"));

        if (v12)
          objc_msgSend(v5, "invalidate");
      }
    }
  }
  else
  {

  }
}

- (BOOL)hasAcquiredAuthorizationForActivitySessionWithIdentifier:(id)a3 appBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a3;
  v7 = a4;
  if (v6
    && (-[PGBackgroundPIPService identifiersForAuthorizedActivitySessions](self, "identifiersForAuthorizedActivitySessions"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "containsObject:", v6), v8, v9))
  {
    -[PGBackgroundPIPService _targetForIdentifier:](self, "_targetForIdentifier:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isConnectionActive"))
    {
      objc_msgSend(v10, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v7, "isEqualToString:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)revokeAuthorizationActivitySessionWithIdentifier:(id)a3
{
  id v3;

  if (a3)
  {
    -[PGBackgroundPIPService _targetForIdentifier:](self, "_targetForIdentifier:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

  }
}

- (id)_targetForIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_targetsByActivitySessionIdentifier, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (PGBackgroundPIPServiceDelegate)delegate
{
  return (PGBackgroundPIPServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)identifiersForAuthorizedActivitySessions
{
  return self->_identifiersForAuthorizedActivitySessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersForAuthorizedActivitySessions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_targetsByActivitySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_targets, 0);
  objc_storeStrong((id *)&self->_mutableIdentifiersForAuthorizedActivitySessions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

@end
