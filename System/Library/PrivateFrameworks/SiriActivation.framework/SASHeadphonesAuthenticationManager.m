@implementation SASHeadphonesAuthenticationManager

- (SASHeadphonesAuthenticationManager)init
{
  SASHeadphonesAuthenticationManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  _QWORD block[4];
  id v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)SASHeadphonesAuthenticationManager;
  v2 = -[SASHeadphonesAuthenticationManager init](&v10, sel_init);
  if (v2)
  {
    v3 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[SASHeadphonesAuthenticationManager init]";
      _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s 🎧 Initializing SASHeadphonesAuthenticationManager", buf, 0xCu);
    }
    v4 = dispatch_queue_create("SASHeadphonesAuthenticationManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_initWeak((id *)buf, v2);
    v6 = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__SASHeadphonesAuthenticationManager_init__block_invoke;
    block[3] = &unk_1E91FBE70;
    objc_copyWeak(&v9, (id *)buf);
    dispatch_async(v6, block);
    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

void __42__SASHeadphonesAuthenticationManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE0], "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isSharedIPad");

    if (v3)
    {
      v4 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315138;
        v6 = "-[SASHeadphonesAuthenticationManager init]_block_invoke";
        _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s 🎧 Headphones authentication is not supported on Shared iPads", (uint8_t *)&v5, 0xCu);
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "_startObserving");
      objc_msgSend(WeakRetained, "didChangeLockState:", 2);
      objc_msgSend(WeakRetained, "_fetchInitialState");
    }
  }

}

- (id)_headphonesMonitor
{
  AFSiriHeadphonesMonitor *headphonesMonitor;
  AFSiriHeadphonesMonitor *v4;
  AFSiriHeadphonesMonitor *v5;

  headphonesMonitor = self->_headphonesMonitor;
  if (!headphonesMonitor)
  {
    objc_msgSend(MEMORY[0x1E0CFE9E0], "sharedMonitor");
    v4 = (AFSiriHeadphonesMonitor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_headphonesMonitor;
    self->_headphonesMonitor = v4;

    headphonesMonitor = self->_headphonesMonitor;
  }
  return headphonesMonitor;
}

- (id)_lockStateMonitor
{
  SASLockStateMonitor *lockStateMonitor;
  SASLockStateMonitor *v4;
  SASLockStateMonitor *v5;

  lockStateMonitor = self->_lockStateMonitor;
  if (!lockStateMonitor)
  {
    v4 = objc_alloc_init(SASLockStateMonitor);
    v5 = self->_lockStateMonitor;
    self->_lockStateMonitor = v4;

    lockStateMonitor = self->_lockStateMonitor;
  }
  return lockStateMonitor;
}

- (void)_startObserving
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[SASHeadphonesAuthenticationManager _startObserving]";
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s 🎧 Adding delegates", (uint8_t *)&v7, 0xCu);
  }
  -[SASHeadphonesAuthenticationManager _lockStateMonitor](self, "_lockStateMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[SASHeadphonesAuthenticationManager _headphonesMonitor](self, "_headphonesMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addDelegate:", self);

  -[SASHeadphonesAuthenticationManager _headphonesMonitor](self, "_headphonesMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startObservingBluetoothConnections");

}

- (void)_fetchInitialState
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SASHeadphonesAuthenticationManager _fetchInitialState]";
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s 🎧 Fetching initial state", buf, 0xCu);
  }
  -[SASHeadphonesAuthenticationManager _headphonesMonitor](self, "_headphonesMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAudioRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SASHeadphonesAuthenticationManager currentAudioRouteDidChange:](self, "currentAudioRouteDidChange:", v5);
  objc_initWeak((id *)buf, self);
  v6 = objc_msgSend(v5, "hasAuthenticationCapability");
  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    -[SASHeadphonesAuthenticationManager _headphonesMonitor](self, "_headphonesMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "btAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __56__SASHeadphonesAuthenticationManager__fetchInitialState__block_invoke;
    v13[3] = &unk_1E91FC4D0;
    objc_copyWeak(&v15, (id *)buf);
    v14 = v5;
    objc_msgSend(v8, "fetchInEarDetctionStateForBTAddress:withCompletion:", v9, v13);

    objc_destroyWeak(&v15);
  }
  -[SASHeadphonesAuthenticationManager _headphonesMonitor](self, "_headphonesMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __56__SASHeadphonesAuthenticationManager__fetchInitialState__block_invoke_3;
  v11[3] = &unk_1E91FC4F8;
  objc_copyWeak(&v12, (id *)buf);
  objc_msgSend(v10, "fetchPrivateSessionStateWithCompletion:", v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

void __56__SASHeadphonesAuthenticationManager__fetchInitialState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id location;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_initWeak(&location, WeakRetained);
    v5 = WeakRetained[2];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__SASHeadphonesAuthenticationManager__fetchInitialState__block_invoke_2;
    v6[3] = &unk_1E91FBFE0;
    objc_copyWeak(&v9, &location);
    v7 = *(id *)(a1 + 32);
    v8 = v3;
    dispatch_async(v5, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __56__SASHeadphonesAuthenticationManager__fetchInitialState__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "btAddress");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "inEarDetectionStateDidChangeForBTAddress:toState:", v2, *(_QWORD *)(a1 + 40));

  }
}

void __56__SASHeadphonesAuthenticationManager__fetchInitialState__block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  NSObject *v4;
  _QWORD block[4];
  id v6[2];
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_initWeak(&location, WeakRetained);
    v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__SASHeadphonesAuthenticationManager__fetchInitialState__block_invoke_4;
    block[3] = &unk_1E91FBE48;
    objc_copyWeak(v6, &location);
    v6[1] = a2;
    dispatch_async(v4, block);
    objc_destroyWeak(v6);
    objc_destroyWeak(&location);
  }

}

void __56__SASHeadphonesAuthenticationManager__fetchInitialState__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "privateAudioSessionStateDidChange:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (id)_initForTesting
{
  SASHeadphonesAuthenticationManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SASHeadphonesAuthenticationManager;
  v2 = -[SASHeadphonesAuthenticationManager init](&v7, sel_init);
  if (v2)
  {
    v3 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[SASHeadphonesAuthenticationManager _initForTesting]";
      _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s 🎧 Initializing SASHeadphonesAuthenticationManager for testing", buf, 0xCu);
    }
    v4 = dispatch_queue_create("SASHeadphonesAuthenticationManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)privateAudioSessionStateDidChange:(unint64_t)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SASHeadphonesAuthenticationManager_privateAudioSessionStateDidChange___block_invoke;
  block[3] = &unk_1E91FBE48;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __72__SASHeadphonesAuthenticationManager_privateAudioSessionStateDidChange___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 40) != WeakRetained[8])
  {
    v4 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      v6 = v3[8];
      v7 = v4;
      objc_msgSend(v5, "numberWithUnsignedInteger:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315650;
      v11 = "-[SASHeadphonesAuthenticationManager privateAudioSessionStateDidChange:]_block_invoke";
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s 🎧 AFPrivateAudioSessionState changed from %@ to %@", (uint8_t *)&v10, 0x20u);

    }
    objc_msgSend(v3, "_invalidateAuthenticationWithReason:", 4);
    *((_BYTE *)v3 + 57) = 0;
    v3[8] = *(_QWORD *)(a1 + 40);
    if (!*((_BYTE *)v3 + 40) && *(_QWORD *)(a1 + 40) == 1)
    {
      *((_BYTE *)v3 + 57) = 1;
      objc_msgSend(v3, "_recomputeAuthentication");
    }
  }

}

- (void)currentAudioRouteDidChange:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SASHeadphonesAuthenticationManager_currentAudioRouteDidChange___block_invoke;
  block[3] = &unk_1E91FBF68;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __65__SASHeadphonesAuthenticationManager_currentAudioRouteDidChange___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "hash");
    if (v3 != objc_msgSend(WeakRetained[9], "hash"))
    {
      v4 = (void *)*MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(void **)(a1 + 32);
        v6 = v4;
        objc_msgSend(v5, "avscRouteDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 136315394;
        v10 = "-[SASHeadphonesAuthenticationManager currentAudioRouteDidChange:]_block_invoke";
        v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s 🎧 AFSiriAudioRoute changed to %@", (uint8_t *)&v9, 0x16u);

      }
      objc_msgSend(WeakRetained, "_invalidateAuthenticationWithReason:", 2);
      *((_BYTE *)WeakRetained + 59) = 0;
      objc_msgSend(*(id *)(a1 + 32), "btAddress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "inEarDetectionStateDidChangeForBTAddress:toState:", v8, 0);

      objc_storeStrong(WeakRetained + 9, *(id *)(a1 + 32));
      if (!*((_BYTE *)WeakRetained + 40) && objc_msgSend(*(id *)(a1 + 32), "hasAuthenticationCapability"))
      {
        *((_BYTE *)WeakRetained + 59) = 1;
        objc_msgSend(WeakRetained, "_recomputeAuthentication");
      }
    }
  }

}

- (void)inEarDetectionStateDidChangeForBTAddress:(id)a3 toState:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__SASHeadphonesAuthenticationManager_inEarDetectionStateDidChangeForBTAddress_toState___block_invoke;
  v11[3] = &unk_1E91FBFE0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __87__SASHeadphonesAuthenticationManager_inEarDetectionStateDidChangeForBTAddress_toState___block_invoke(id *a1)
{
  id *WeakRetained;
  os_log_t *v3;
  NSObject *v4;
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained
    && (!objc_msgSend(a1[4], "isEqualToString:", WeakRetained[10])
     || (objc_msgSend(a1[5], "isEqual:", WeakRetained[11]) & 1) == 0))
  {
    v3 = (os_log_t *)MEMORY[0x1E0CFE6A0];
    v4 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[4];
      v6 = a1[5];
      v8 = 136315650;
      v9 = "-[SASHeadphonesAuthenticationManager inEarDetectionStateDidChangeForBTAddress:toState:]_block_invoke";
      v10 = 2112;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s 🎧 InEarDetectionState changed to (%@)%@", (uint8_t *)&v8, 0x20u);
    }
    if (objc_msgSend(WeakRetained, "_shouldIgnoreConnectionChangesForState:", a1[5]))
    {
      v7 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315138;
        v9 = "-[SASHeadphonesAuthenticationManager inEarDetectionStateDidChangeForBTAddress:toState:]_block_invoke";
        _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s 🎧 Ignoring invalidation for in-ear detection state changes for the secondary bud inside the case", (uint8_t *)&v8, 0xCu);
      }
      objc_storeStrong(WeakRetained + 11, a1[5]);
    }
    else
    {
      objc_msgSend(WeakRetained, "_invalidateAuthenticationWithReason:", 3);
      *((_BYTE *)WeakRetained + 56) = 0;
      objc_storeStrong(WeakRetained + 10, a1[4]);
      objc_storeStrong(WeakRetained + 11, a1[5]);
      if (!*((_BYTE *)WeakRetained + 40)
        && objc_msgSend(WeakRetained, "_inEarDetectionStateEligibleForState:", a1[5]))
      {
        *((_BYTE *)WeakRetained + 56) = 1;
        objc_msgSend(WeakRetained, "_recomputeAuthentication");
      }
    }
  }

}

- (void)didChangeLockState:(unint64_t)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SASHeadphonesAuthenticationManager_didChangeLockState___block_invoke;
  block[3] = &unk_1E91FBE48;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __57__SASHeadphonesAuthenticationManager_didChangeLockState___block_invoke(uint64_t a1)
{
  double *WeakRetained;
  double *v3;
  uint64_t v4;
  os_log_t *v5;
  NSObject *v6;
  _BOOL4 v7;
  os_log_t v8;
  void *v9;
  double v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 58) = 0;
    v4 = *(_QWORD *)(a1 + 40);
    v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
    v6 = *MEMORY[0x1E0CFE6A0];
    v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT);
    if ((v4 & 2) != 0)
    {
      if (v7)
      {
        v14 = (void *)MEMORY[0x1E0CB37E8];
        v15 = *((unsigned __int8 *)v3 + 40);
        v11 = v6;
        objc_msgSend(v14, "numberWithBool:", v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 136315394;
        v17 = "-[SASHeadphonesAuthenticationManager didChangeLockState:]_block_invoke";
        v18 = 2112;
        v19 = v12;
        v13 = "%s 🎧 Phone locked! _authenticated: %@";
        goto LABEL_10;
      }
    }
    else
    {
      if (v7)
      {
        v16 = 136315138;
        v17 = "-[SASHeadphonesAuthenticationManager didChangeLockState:]_block_invoke";
        _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s 🎧 Phone unlocked!", (uint8_t *)&v16, 0xCu);
      }
      *((_BYTE *)v3 + 58) = 1;
      if (!*((_BYTE *)v3 + 40))
      {
        objc_msgSend(v3, "_recomputeAuthentication");
        goto LABEL_12;
      }
      v3[6] = CFAbsoluteTimeGetCurrent();
      v8 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)MEMORY[0x1E0CB37E8];
        v10 = v3[6];
        v11 = v8;
        objc_msgSend(v9, "numberWithDouble:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 136315394;
        v17 = "-[SASHeadphonesAuthenticationManager didChangeLockState:]_block_invoke";
        v18 = 2112;
        v19 = v12;
        v13 = "%s 🎧 Authenticated time bumped to: %@";
LABEL_10:
        _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0x16u);

      }
    }
  }
LABEL_12:

}

- (BOOL)isAuthenticated
{
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 authenticated;
  _BOOL8 v10;
  double authenticatedTime;
  NSObject *v12;
  double v13;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v4 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0CB3978];
    v6 = v4;
    objc_msgSend(v5, "currentThread");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315394;
    v16 = "-[SASHeadphonesAuthenticationManager isAuthenticated]";
    v17 = 2048;
    v18 = objc_msgSend(v7, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock about to lock with qos: %zd", (uint8_t *)&v15, 0x16u);

  }
  os_unfair_lock_lock(&self->_authenticatedLock);
  v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[SASHeadphonesAuthenticationManager isAuthenticated]";
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock successfully locked", (uint8_t *)&v15, 0xCu);
  }
  authenticated = self->_authenticated;
  v10 = self->_authenticated;
  authenticatedTime = self->_authenticatedTime;
  os_unfair_lock_unlock(&self->_authenticatedLock);
  v12 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[SASHeadphonesAuthenticationManager isAuthenticated]";
    _os_log_impl(&dword_1D132F000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock unlocked", (uint8_t *)&v15, 0xCu);
  }
  v13 = CFAbsoluteTimeGetCurrent() - authenticatedTime;
  if (authenticated && v13 >= 5400.0)
  {
    -[SASHeadphonesAuthenticationManager _invalidateAuthenticationWithReason:](self, "_invalidateAuthenticationWithReason:", 1);
    v10 = 0;
  }
  -[SASHeadphonesAuthenticationManager _logEligibilityForAuthenticatedState:andTimedOut:](self, "_logEligibilityForAuthenticatedState:andTimedOut:", v10, v13 >= 5400.0);
  return v10;
}

- (void)_logEligibilityForAuthenticatedState:(BOOL)a3 andTimedOut:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[4];
  id v9;
  BOOL v10;
  BOOL v11;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__SASHeadphonesAuthenticationManager__logEligibilityForAuthenticatedState_andTimedOut___block_invoke;
  block[3] = &unk_1E91FC520;
  objc_copyWeak(&v9, &location);
  v10 = a3;
  v11 = a4;
  dispatch_async(queue, block);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __87__SASHeadphonesAuthenticationManager__logEligibilityForAuthenticatedState_andTimedOut___block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)MEMORY[0x1E0CB37E8];
      v5 = *(unsigned __int8 *)(a1 + 40);
      v6 = v3;
      objc_msgSend(v4, "numberWithBool:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", WeakRetained[58]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", WeakRetained[59]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", WeakRetained[56]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", WeakRetained[57]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 41));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136316674;
      v14 = "-[SASHeadphonesAuthenticationManager _logEligibilityForAuthenticatedState:andTimedOut:]_block_invoke";
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s 🎧 authenticated: %@, _lockStateEligible: %@, _routeEligible: %@, _inEarStateEligible: %@, _sessionStateEligible: %@, timedOut: %@", (uint8_t *)&v13, 0x48u);

    }
  }

}

- (void)getHeadphonesAuthenticationStatusWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__SASHeadphonesAuthenticationManager_getHeadphonesAuthenticationStatusWithCompletion___block_invoke;
    block[3] = &unk_1E91FC548;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    dispatch_async(queue, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      -[SASHeadphonesAuthenticationManager getHeadphonesAuthenticationStatusWithCompletion:].cold.1(v6);
  }

}

void __86__SASHeadphonesAuthenticationManager_getHeadphonesAuthenticationStatusWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(WeakRetained, "isAuthenticated"));
    WeakRetained = v3;
  }

}

- (BOOL)_inEarDetectionStateEligibleForState:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isEnabled")
    && (objc_msgSend(v3, "primaryInEarStatus") == 3 || objc_msgSend(v3, "secondaryInEarStatus") == 3)
    && objc_msgSend(v3, "primaryInEarStatus") != 2
    && objc_msgSend(v3, "secondaryInEarStatus") != 2;

  return v4;
}

- (BOOL)_shouldIgnoreConnectionChangesForState:(id)a3
{
  id v4;
  _BOOL8 v5;
  _BOOL8 v6;
  BOOL v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[AFBluetoothHeadphoneInEarDetectionState secondaryInEarStatus](self->_inEarDetectionState, "secondaryInEarStatus") == 1&& objc_msgSend(v4, "secondaryInEarStatus") == 0;
  if (-[AFBluetoothHeadphoneInEarDetectionState secondaryInEarStatus](self->_inEarDetectionState, "secondaryInEarStatus"))
  {
    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(v4, "secondaryInEarStatus") == 1;
  }
  v7 = v5 || v6;
  if (v5 || v6)
  {
    v8 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      v10 = v8;
      objc_msgSend(v9, "numberWithBool:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315650;
      v15 = "-[SASHeadphonesAuthenticationManager _shouldIgnoreConnectionChangesForState:]";
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s 🎧 Secondary bud (in-case): disconnected: %@, reconnected: %@", (uint8_t *)&v14, 0x20u);

    }
  }

  return v7;
}

- (BOOL)_wearingSessionEligible
{
  void *v3;
  void *v4;
  _BOOL8 authenticated;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    authenticated = self->_authenticated;
    v6 = v3;
    objc_msgSend(v4, "numberWithBool:", authenticated);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lockStateEligible);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_routeEligible);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_inEarStateEligible);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sessionStateEligible);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136316418;
    v14 = "-[SASHeadphonesAuthenticationManager _wearingSessionEligible]";
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s 🎧 _authenticated: %@, _lockStateEligible: %@, _routeEligible: %@, _inEarStateEligible: %@, _sessionStateEligible: %@", (uint8_t *)&v13, 0x3Eu);

  }
  return !self->_authenticated
      && self->_routeEligible
      && self->_lockStateEligible
      && self->_sessionStateEligible
      && self->_inEarStateEligible;
}

- (void)_recomputeAuthentication
{
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v4 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0CB3978];
    v6 = v4;
    objc_msgSend(v5, "currentThread");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[SASHeadphonesAuthenticationManager _recomputeAuthentication]";
    v12 = 2048;
    v13 = objc_msgSend(v7, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock about to lock with qos: %zd", (uint8_t *)&v10, 0x16u);

  }
  os_unfair_lock_lock(&self->_authenticatedLock);
  v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SASHeadphonesAuthenticationManager _recomputeAuthentication]";
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock successfully locked", (uint8_t *)&v10, 0xCu);
  }
  if (-[SASHeadphonesAuthenticationManager _wearingSessionEligible](self, "_wearingSessionEligible"))
  {
    self->_authenticated = 1;
    self->_authenticatedTime = CFAbsoluteTimeGetCurrent();
  }
  os_unfair_lock_unlock(&self->_authenticatedLock);
  v9 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SASHeadphonesAuthenticationManager _recomputeAuthentication]";
    _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock unlocked", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_invalidateAuthenticationWithReason:(int64_t)a3
{
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  os_log_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x1E0CB3978];
    v8 = v6;
    objc_msgSend(v7, "currentThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315394;
    v16 = "-[SASHeadphonesAuthenticationManager _invalidateAuthenticationWithReason:]";
    v17 = 2048;
    v18 = objc_msgSend(v9, "qualityOfService");
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock about to lock with qos: %zd", (uint8_t *)&v15, 0x16u);

  }
  os_unfair_lock_lock(&self->_authenticatedLock);
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[SASHeadphonesAuthenticationManager _invalidateAuthenticationWithReason:]";
    _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock successfully locked", (uint8_t *)&v15, 0xCu);
  }
  if (self->_authenticated)
  {
    v11 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      SASHeadphonesAuthenticationInvalidationReasonGetName(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136315394;
      v16 = "-[SASHeadphonesAuthenticationManager _invalidateAuthenticationWithReason:]";
      v17 = 2112;
      v18 = (uint64_t)v13;
      _os_log_impl(&dword_1D132F000, v12, OS_LOG_TYPE_DEFAULT, "%s 🎧 Invalidating authentication for reason: %@", (uint8_t *)&v15, 0x16u);

    }
    self->_authenticated = 0;
  }
  os_unfair_lock_unlock(&self->_authenticatedLock);
  v14 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[SASHeadphonesAuthenticationManager _invalidateAuthenticationWithReason:]";
    _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _authenticatedLock unlocked", (uint8_t *)&v15, 0xCu);
  }
}

- (void)dealloc
{
  NSObject *v3;
  SASLockStateMonitor *lockStateMonitor;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  SASHeadphonesAuthenticationManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[SASHeadphonesAuthenticationManager dealloc]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s 🎧 Deallocating: %@", buf, 0x16u);
  }
  lockStateMonitor = self->_lockStateMonitor;
  self->_lockStateMonitor = 0;

  v5.receiver = self;
  v5.super_class = (Class)SASHeadphonesAuthenticationManager;
  -[SASHeadphonesAuthenticationManager dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inEarDetectionState, 0);
  objc_storeStrong((id *)&self->_inEarDetectionBTAddress, 0);
  objc_storeStrong((id *)&self->_audioRoute, 0);
  objc_storeStrong((id *)&self->_headphonesMonitor, 0);
  objc_storeStrong((id *)&self->_lockStateMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)getHeadphonesAuthenticationStatusWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[SASHeadphonesAuthenticationManager getHeadphonesAuthenticationStatusWithCompletion:]";
  _os_log_error_impl(&dword_1D132F000, log, OS_LOG_TYPE_ERROR, "%s 🎧 No completion handler provided.", (uint8_t *)&v1, 0xCu);
}

@end
