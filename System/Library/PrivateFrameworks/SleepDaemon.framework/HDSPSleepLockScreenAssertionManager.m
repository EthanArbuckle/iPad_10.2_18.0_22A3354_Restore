@implementation HDSPSleepLockScreenAssertionManager

- (HDSPSleepLockScreenAssertionManager)initWithEnvironment:(id)a3
{
  id v4;
  HDSPSleepLockScreenAssertionManager *v5;
  HDSPSleepLockScreenAssertionManager *v6;
  HDSPSleepLockScreenAssertionManager *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSPSleepLockScreenAssertionManager;
  v5 = -[HDSPSleepLockScreenAssertionManager init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v6->_connectionLock._os_unfair_lock_opaque = 0;
    v7 = v6;
  }

  return v6;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_connectionLock;
  void (**v4)(_QWORD);

  p_connectionLock = &self->_connectionLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_connectionLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_connectionLock);
}

- (void)takeAssertionIfNeeded
{
  SBSLockScreenRemoteContentAssertion *lockScreenAssertion;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  objc_class *v10;
  void *v11;
  NSXPCListener *v12;
  NSXPCListener *listener;
  NSXPCListener *v14;
  void *v15;
  void *v16;
  SBSLockScreenRemoteContentAssertion *v17;
  SBSLockScreenRemoteContentAssertion *v18;
  _QWORD v19[5];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  lockScreenAssertion = self->_lockScreenAssertion;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (lockScreenAssertion)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      v21 = (id)objc_opt_class();
      v6 = v21;
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] lock screen assertion already taken", buf, 0xCu);

    }
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      v21 = (id)objc_opt_class();
      v7 = v21;
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] taking lock screen assertion", buf, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    objc_msgSend(WeakRetained, "assertionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "takeIndefiniteAssertionWithIdentifier:type:", v11, 1);

    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v12 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    -[NSXPCListener setDelegate:](v12, "setDelegate:", self);
    -[NSXPCListener resume](v12, "resume");
    listener = self->_listener;
    self->_listener = v12;
    v14 = v12;

    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BEB0B20]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.SleepLockScreen"), CFSTR("SleepLockScreen.LockScreenViewController"));
    -[NSXPCListener endpoint](v14, "endpoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_endpoint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setXpcEndpoint:](v4, "setXpcEndpoint:", v16);

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __60__HDSPSleepLockScreenAssertionManager_takeAssertionIfNeeded__block_invoke;
    v19[3] = &unk_24D4E4858;
    v19[4] = self;
    objc_msgSend(MEMORY[0x24BEB0A90], "acquireRemoteContentAssertionWithDefinition:errorHandler:", v4, v19);
    v17 = (SBSLockScreenRemoteContentAssertion *)objc_claimAutoreleasedReturnValue();
    v18 = self->_lockScreenAssertion;
    self->_lockScreenAssertion = v17;

  }
}

void __60__HDSPSleepLockScreenAssertionManager_takeAssertionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqual:", *MEMORY[0x24BE0BAB0]))
  {
    v4 = objc_msgSend(v2, "code");

    if (v4 == 5)
    {
      HKSPLogForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 138543362;
        v8 = (id)objc_opt_class();
        v6 = v8;
        _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] invalidated lock screen assertion", (uint8_t *)&v7, 0xCu);
LABEL_9:

        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {

  }
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v2;
    v6 = v8;
    _os_log_error_impl(&dword_21610C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] error acquiring lock screen assertion: %{public}@", (uint8_t *)&v7, 0x16u);
    goto LABEL_9;
  }
LABEL_7:

}

- (void)sendLockScreenState:(int64_t)a3 userInfo:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_lockScreenAssertion)
  {
    v6 = a4;
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      NSStringFromHKSPSleepLockScreenState();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sending state: %@", (uint8_t *)&v13, 0x16u);

    }
    -[HDSPSleepLockScreenAssertionManager connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLockScreenState:userInfo:", a3, v6);

  }
}

- (void)invalidateAssertion
{
  SBSLockScreenRemoteContentAssertion *lockScreenAssertion;
  NSObject *WeakRetained;
  _BOOL4 v5;
  id v6;
  SBSLockScreenRemoteContentAssertion *v7;
  NSXPCListener *listener;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  lockScreenAssertion = self->_lockScreenAssertion;
  HKSPLogForCategory();
  WeakRetained = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT);
  if (lockScreenAssertion)
  {
    if (v5)
    {
      v13 = 138543362;
      v14 = (id)objc_opt_class();
      v6 = v14;
      _os_log_impl(&dword_21610C000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[%{public}@] invalidating lock screen assertion", (uint8_t *)&v13, 0xCu);

    }
    -[SBSLockScreenRemoteContentAssertion invalidate](self->_lockScreenAssertion, "invalidate");
    v7 = self->_lockScreenAssertion;
    self->_lockScreenAssertion = 0;

    -[NSXPCListener invalidate](self->_listener, "invalidate");
    listener = self->_listener;
    self->_listener = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    -[NSObject assertionManager](WeakRetained, "assertionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "releaseAssertionWithIdentifier:", v11);

  }
  else if (v5)
  {
    v13 = 138543362;
    v14 = (id)objc_opt_class();
    v12 = v14;
    _os_log_impl(&dword_21610C000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[%{public}@] lock screen assertion already invalidated", (uint8_t *)&v13, 0xCu);

  }
}

- (void)connect
{
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v4 = v7;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] lock screen service did connect", (uint8_t *)&v6, 0xCu);

  }
  -[HDSPSleepLockScreenAssertionManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockScreenDidConnect");

}

- (void)didDismissWithReason:(int64_t)a3
{
  NSObject *v3;
  id v4;
  const char *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 0:
    case 1:
      HKSPLogForCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v6 = 138543362;
      v7 = (id)objc_opt_class();
      v4 = v7;
      _os_log_error_impl(&dword_21610C000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] lock screen service did dismiss due to error", (uint8_t *)&v6, 0xCu);
      goto LABEL_19;
    case 2:
      HKSPLogForCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v6 = 138543362;
      v7 = (id)objc_opt_class();
      v4 = v7;
      v5 = "[%{public}@] lock screen service did dismiss due to dismiss button";
      break;
    case 3:
      HKSPLogForCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v6 = 138543362;
      v7 = (id)objc_opt_class();
      v4 = v7;
      v5 = "[%{public}@] lock screen service did dismiss due to home gesture";
      break;
    case 4:
      HKSPLogForCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v6 = 138543362;
      v7 = (id)objc_opt_class();
      v4 = v7;
      v5 = "[%{public}@] lock screen service did dismiss due to notification";
      break;
    case 5:
      HKSPLogForCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v6 = 138543362;
      v7 = (id)objc_opt_class();
      v4 = v7;
      v5 = "[%{public}@] lock screen service did dismiss due to camera launch";
      break;
    case 6:
      HKSPLogForCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v6 = 138543362;
      v7 = (id)objc_opt_class();
      v4 = v7;
      v5 = "[%{public}@] lock screen service did dismiss due to assertion invalidation";
      break;
    case 7:
      HKSPLogForCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v6 = 138543362;
      v7 = (id)objc_opt_class();
      v4 = v7;
      v5 = "[%{public}@] lock screen service did dismiss due to lock screen dismissal";
      break;
    case 8:
      HKSPLogForCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v6 = 138543362;
      v7 = (id)objc_opt_class();
      v4 = v7;
      v5 = "[%{public}@] lock screen service did dismiss due to tap";
      break;
    default:
      return;
  }
  _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v6, 0xCu);
LABEL_19:

LABEL_20:
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  HDSPSleepLockScreenAssertionManager *v16;
  id v17;
  id location;
  _QWORD v19[5];

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E4DBB0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v8);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E3B900);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v9);
  objc_msgSend(v7, "setExportedObject:", self);
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __74__HDSPSleepLockScreenAssertionManager_listener_shouldAcceptNewConnection___block_invoke;
  v19[3] = &unk_24D4E3498;
  v19[4] = self;
  objc_msgSend(v7, "setInterruptionHandler:", v19);
  objc_initWeak(&location, self);
  v12 = v10;
  v13 = 3221225472;
  v14 = __74__HDSPSleepLockScreenAssertionManager_listener_shouldAcceptNewConnection___block_invoke_199;
  v15 = &unk_24D4E4880;
  v16 = self;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v7, "setInvalidationHandler:", &v12);
  objc_msgSend(v7, "resume", v12, v13, v14, v15, v16);
  -[HDSPSleepLockScreenAssertionManager setConnection:](self, "setConnection:", v7);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return 1;
}

void __74__HDSPSleepLockScreenAssertionManager_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;
  id v1;
  int v2;
  id v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 138543362;
    v3 = (id)objc_opt_class();
    v1 = v3;
    _os_log_impl(&dword_21610C000, v0, OS_LOG_TYPE_DEFAULT, "[%{public}@] interruption handler", (uint8_t *)&v2, 0xCu);

  }
}

void __74__HDSPSleepLockScreenAssertionManager_listener_shouldAcceptNewConnection___block_invoke_199(uint64_t a1)
{
  NSObject *v2;
  id v3;
  id WeakRetained;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v3 = v6;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] invalidation handler", (uint8_t *)&v5, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setConnection:", 0);

}

- (void)setConnection:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__HDSPSleepLockScreenAssertionManager_setConnection___block_invoke;
  v6[3] = &unk_24D4E3680;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDSPSleepLockScreenAssertionManager _withLock:](self, "_withLock:", v6);

}

void __53__HDSPSleepLockScreenAssertionManager_setConnection___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (NSXPCConnection)connection
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6;
  v9 = __Block_byref_object_dispose__6;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__HDSPSleepLockScreenAssertionManager_connection__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPSleepLockScreenAssertionManager _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSXPCConnection *)v2;
}

void __49__HDSPSleepLockScreenAssertionManager_connection__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (BOOL)hasLockScreenConnection
{
  void *v2;
  BOOL v3;

  -[HDSPSleepLockScreenAssertionManager connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HDSPSleepLockScreenAssertionManagerDelegate)delegate
{
  return (HDSPSleepLockScreenAssertionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBSLockScreenRemoteContentAssertion)lockScreenAssertion
{
  return self->_lockScreenAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
