@implementation SBFAlwaysOnLiveRenderingAssertionManager

- (SBFAlwaysOnLiveRenderingAssertionManager)initWithBacklight:(id)a3 assertionProvider:(id)a4 attributesProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBFAlwaysOnLiveRenderingAssertionManager *v12;
  SBFAlwaysOnLiveRenderingAssertionManager *v13;
  SBFAlwaysOnLiveRenderingAssertionWeakCollection *v14;
  SBFAlwaysOnLiveRenderingAssertionWeakCollection *liveRenderingAssertionProxies;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBFAlwaysOnLiveRenderingAssertionManager;
  v12 = -[SBFAlwaysOnLiveRenderingAssertionManager init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_backlight, a3);
    objc_storeStrong((id *)&v13->_assertionProvider, a4);
    objc_storeStrong((id *)&v13->_attributesProvider, a5);
    v14 = objc_alloc_init(SBFAlwaysOnLiveRenderingAssertionWeakCollection);
    liveRenderingAssertionProxies = v13->_liveRenderingAssertionProxies;
    v13->_liveRenderingAssertionProxies = v14;

    -[BLSBacklightStateObservable addObserver:](v13->_backlight, "addObserver:", v13);
  }

  return v13;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  SBFAlwaysOnLiveRenderingAssertionManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogLiveRendering();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_18AB69000, v3, OS_LOG_TYPE_INFO, "Deallocated %@", buf, 0xCu);
  }

  -[SBFAlwaysOnLiveRenderingAssertionManager _invalidateWithReason:](self, "_invalidateWithReason:", CFSTR("dealloc"));
  v4.receiver = self;
  v4.super_class = (Class)SBFAlwaysOnLiveRenderingAssertionManager;
  -[SBFAlwaysOnLiveRenderingAssertionManager dealloc](&v4, sel_dealloc);
}

- (id)acquireLiveRenderingAssertionWithReason:(id)a3
{
  id v4;
  SBFAlwaysOnLiveRenderingAssertion *v5;
  SBFAlwaysOnLiveRenderingAssertion *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [SBFAlwaysOnLiveRenderingAssertion alloc];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __84__SBFAlwaysOnLiveRenderingAssertionManager_acquireLiveRenderingAssertionWithReason___block_invoke;
  v11 = &unk_1E200E728;
  objc_copyWeak(&v12, &location);
  v6 = -[SBFAlwaysOnLiveRenderingAssertion initWithReason:timeout:invalidationHandler:](v5, "initWithReason:timeout:invalidationHandler:", v4, &v8, 10.0);
  -[SBFAlwaysOnLiveRenderingAssertionManager _acquireLiveRenderingAssertionProxy:](self, "_acquireLiveRenderingAssertionProxy:", v6, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __84__SBFAlwaysOnLiveRenderingAssertionManager_acquireLiveRenderingAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_releaseLiveRenderingAssertionProxy:", v5);

}

- (void)invalidate
{
  -[SBFAlwaysOnLiveRenderingAssertionManager _invalidateWithReason:](self, "_invalidateWithReason:", CFSTR("Explicit invalidation"));
}

- (void)_invalidateWithReason:(id)a3
{
  SBFAlwaysOnLiveRenderingAssertionWeakCollection *liveRenderingAssertionProxies;
  id v5;

  liveRenderingAssertionProxies = self->_liveRenderingAssertionProxies;
  v5 = a3;
  -[SBFAlwaysOnLiveRenderingAssertionWeakCollection invalidateAll](liveRenderingAssertionProxies, "invalidateAll");
  -[SBFAlwaysOnLiveRenderingAssertionManager _releaseLiveRenderingAssertionWithReason:](self, "_releaseLiveRenderingAssertionWithReason:", v5);

}

- (void)_acquireLiveRenderingAssertionProxy:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  SBFAlwaysOnLiveRenderingAssertionManager *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBFAlwaysOnLiveRenderingAssertionWeakCollection addAssertion:](self->_liveRenderingAssertionProxies, "addAssertion:", v4);
  SBLogLiveRendering();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_18AB69000, v5, OS_LOG_TYPE_INFO, "%@ Acquired live-rendering %@", (uint8_t *)&v7, 0x16u);
  }

  -[SBFAlwaysOnLiveRenderingAssertionManager backlight](self, "backlight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFAlwaysOnLiveRenderingAssertionManager _acquireLiveRenderingAssertionIfNeededForProxy:backlight:](self, "_acquireLiveRenderingAssertionIfNeededForProxy:backlight:", v4, v6);

}

- (void)_releaseLiveRenderingAssertionProxy:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  SBFAlwaysOnLiveRenderingAssertionManager *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBFAlwaysOnLiveRenderingAssertionWeakCollection removeAssertion:](self->_liveRenderingAssertionProxies, "removeAssertion:", v4);
  SBLogLiveRendering();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_18AB69000, v5, OS_LOG_TYPE_INFO, "%@ Released live-rendering  %@", (uint8_t *)&v6, 0x16u);
  }

  if (-[SBFAlwaysOnLiveRenderingAssertionWeakCollection isEmpty](self->_liveRenderingAssertionProxies, "isEmpty"))
    -[SBFAlwaysOnLiveRenderingAssertionManager _releaseLiveRenderingAssertionWithReason:](self, "_releaseLiveRenderingAssertionWithReason:", CFSTR("All live-rendering assertion proxies have been released"));

}

- (id)_nextLiveRenderingAssertionProxyIfAny
{
  return -[SBFAlwaysOnLiveRenderingAssertionWeakCollection mostRecentlyCreatedValidAssertion](self->_liveRenderingAssertionProxies, "mostRecentlyCreatedValidAssertion");
}

- (void)_acquireLiveRenderingAssertionIfNeededForProxy:(id)a3 backlight:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BLSAssertion *liveRenderingAssertion;
  int v10;
  BLSAssertion *v11;
  NSObject *v12;
  objc_class *v13;
  BLSAssertion *v14;
  BLSAssertion *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  objc_class *v20;
  BLSAssertion *v21;
  NSObject *v22;
  SBFAlwaysOnLiveRenderingBLSAssertionProvider *assertionProvider;
  void *v24;
  BLSAssertion *v25;
  BLSAssertion *v26;
  int v27;
  SBFAlwaysOnLiveRenderingAssertionManager *v28;
  __int16 v29;
  BLSAssertion *v30;
  __int16 v31;
  BLSAssertion *v32;
  __int16 v33;
  BLSAssertion *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 || (objc_msgSend(v6, "isValid") & 1) == 0)
  {
    SBLogLiveRendering();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v27 = 138412290;
      v28 = self;
      _os_log_impl(&dword_18AB69000, v8, OS_LOG_TYPE_INFO, "%@ Ignoring live-rendering assertion acquisition request because of there are no valid pending proxies", (uint8_t *)&v27, 0xCu);
    }
    goto LABEL_21;
  }
  -[SBFAlwaysOnLiveRenderingBLSAttributesProvider assertionAttributes](self->_attributesProvider, "assertionAttributes");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject count](v8, "count"))
  {
    SBLogLiveRendering();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBFAlwaysOnLiveRenderingAssertionManager _acquireLiveRenderingAssertionIfNeededForProxy:backlight:].cold.1((uint64_t)self, (uint64_t)v6, v12);
    goto LABEL_20;
  }
  if (objc_msgSend(v7, "backlightState") != 1)
  {
    SBLogLiveRendering();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      goto LABEL_20;
    objc_msgSend(v7, "backlightState");
    NSStringFromBLSBacklightState();
    v14 = (BLSAssertion *)objc_claimAutoreleasedReturnValue();
    v27 = 138412802;
    v28 = self;
    v29 = 2112;
    v30 = (BLSAssertion *)v6;
    v31 = 2112;
    v32 = v14;
    v16 = "%@ Ignoring live-rendering assertion acquisition request for %@ because backlight state is %@";
LABEL_18:
    v17 = v12;
    v18 = OS_LOG_TYPE_INFO;
    v19 = 32;
LABEL_19:
    _os_log_impl(&dword_18AB69000, v17, v18, v16, (uint8_t *)&v27, v19);

    goto LABEL_20;
  }
  if (!objc_msgSend(v7, "flipbookState"))
  {
    SBLogLiveRendering();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      goto LABEL_20;
    objc_msgSend(v7, "flipbookState");
    NSStringFromBLSFlipbookState();
    v14 = (BLSAssertion *)objc_claimAutoreleasedReturnValue();
    v27 = 138412802;
    v28 = self;
    v29 = 2112;
    v30 = (BLSAssertion *)v6;
    v31 = 2112;
    v32 = v14;
    v16 = "%@ Ignoring live-rendering assertion acquisition request for %@ because flipbook state is %@";
    goto LABEL_18;
  }
  liveRenderingAssertion = self->_liveRenderingAssertion;
  if (liveRenderingAssertion)
  {
    v10 = -[BLSAssertion isAcquired](liveRenderingAssertion, "isAcquired");
    v11 = self->_liveRenderingAssertion;
    if (v10)
    {
      -[BLSAssertion restartTimeoutTimer](v11, "restartTimeoutTimer");
      SBLogLiveRendering();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (BLSAssertion *)objc_claimAutoreleasedReturnValue();
        v15 = self->_liveRenderingAssertion;
        v27 = 138413058;
        v28 = self;
        v29 = 2112;
        v30 = v14;
        v31 = 2048;
        v32 = v15;
        v33 = 2112;
        v34 = (BLSAssertion *)v6;
        v16 = "%@ Tickled live-rendering <%@; %p> for %@";
        v17 = v12;
        v18 = OS_LOG_TYPE_DEFAULT;
LABEL_25:
        v19 = 42;
        goto LABEL_19;
      }
LABEL_20:

      goto LABEL_21;
    }
    if (v11)
    {
      SBLogLiveRendering();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        goto LABEL_20;
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v14 = (BLSAssertion *)objc_claimAutoreleasedReturnValue();
      v21 = self->_liveRenderingAssertion;
      v27 = 138413058;
      v28 = self;
      v29 = 2112;
      v30 = (BLSAssertion *)v6;
      v31 = 2112;
      v32 = v14;
      v33 = 2048;
      v34 = v21;
      v16 = "%@ Ignoring live-rendering assertion acquisition for %@ because <%@; %p> is pending acquisition";
      v17 = v12;
      v18 = OS_LOG_TYPE_INFO;
      goto LABEL_25;
    }
  }
  SBLogLiveRendering();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v27 = 138412546;
    v28 = self;
    v29 = 2112;
    v30 = (BLSAssertion *)v6;
    _os_log_impl(&dword_18AB69000, v22, OS_LOG_TYPE_INFO, "%@ Will acquire live-rendering assertion for %@", (uint8_t *)&v27, 0x16u);
  }

  assertionProvider = self->_assertionProvider;
  objc_msgSend(v6, "reason");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFAlwaysOnLiveRenderingBLSAssertionProvider acquireWithExplanation:attributes:](assertionProvider, "acquireWithExplanation:attributes:", v24, v8);
  v25 = (BLSAssertion *)objc_claimAutoreleasedReturnValue();
  v26 = self->_liveRenderingAssertion;
  self->_liveRenderingAssertion = v25;

  -[BLSAssertion addObserver:](self->_liveRenderingAssertion, "addObserver:", self);
LABEL_21:

}

- (void)_releaseLiveRenderingAssertionWithReason:(id)a3
{
  id v4;
  BLSAssertion *liveRenderingAssertion;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  BLSAssertion *v10;
  BLSAssertion *v11;
  int v12;
  SBFAlwaysOnLiveRenderingAssertionManager *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  BLSAssertion *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  liveRenderingAssertion = self->_liveRenderingAssertion;
  SBLogLiveRendering();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (liveRenderingAssertion)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_liveRenderingAssertion;
      v12 = 138413058;
      v13 = self;
      v14 = 2112;
      v15 = v9;
      v16 = 2048;
      v17 = v10;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_18AB69000, v7, OS_LOG_TYPE_DEFAULT, "%@ Will release live-rendering <%@; %p> with reason '%@'",
        (uint8_t *)&v12,
        0x2Au);

    }
    v11 = self->_liveRenderingAssertion;
    self->_liveRenderingAssertion = 0;
    v7 = v11;

    -[NSObject invalidate](v7, "invalidate");
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_18AB69000, v7, OS_LOG_TYPE_INFO, "%@ Ignored live-rendering assertion release with reason '%@' because we are not holding any", (uint8_t *)&v12, 0x16u);
  }

}

- (void)assertion:(id)a3 didFailToAcquireWithError:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  BLSAssertion *liveRenderingAssertion;
  uint8_t buf[4];
  SBFAlwaysOnLiveRenderingAssertionManager *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BLSAssertion *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_liveRenderingAssertion == a3)
  {
    SBLogLiveRendering();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      liveRenderingAssertion = self->_liveRenderingAssertion;
      *(_DWORD *)buf = 138413058;
      v13 = self;
      v14 = 2112;
      v15 = v10;
      v16 = 2048;
      v17 = liveRenderingAssertion;
      v18 = 2112;
      v19 = v6;
      _os_log_error_impl(&dword_18AB69000, v7, OS_LOG_TYPE_ERROR, "%@ Could not acquire live-rendering <%@; %p> with error '%@'",
        buf,
        0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to acquire assertion with error '%@'"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFAlwaysOnLiveRenderingAssertionManager _releaseLiveRenderingAssertionWithReason:](self, "_releaseLiveRenderingAssertionWithReason:", v8);

  }
}

- (void)assertion:(id)a3 didCancelWithError:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  BLSAssertion *liveRenderingAssertion;
  uint8_t buf[4];
  SBFAlwaysOnLiveRenderingAssertionManager *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BLSAssertion *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_liveRenderingAssertion == a3)
  {
    SBLogLiveRendering();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      liveRenderingAssertion = self->_liveRenderingAssertion;
      *(_DWORD *)buf = 138413058;
      v13 = self;
      v14 = 2112;
      v15 = v10;
      v16 = 2048;
      v17 = liveRenderingAssertion;
      v18 = 2112;
      v19 = v6;
      _os_log_error_impl(&dword_18AB69000, v7, OS_LOG_TYPE_ERROR, "%@ Received unexpected cancellation for <%@; %p> with error '%@'",
        buf,
        0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received unexpected cancellation with error '%@'"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFAlwaysOnLiveRenderingAssertionManager _releaseLiveRenderingAssertionWithReason:](self, "_releaseLiveRenderingAssertionWithReason:", v8);

  }
}

- (id)backlight
{
  return self->_backlight;
}

- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4
{
  id v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = dispatch_time(0, 30000000);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__SBFAlwaysOnLiveRenderingAssertionManager_backlight_didChangeAlwaysOnEnabled___block_invoke;
  v9[3] = &unk_1E200E750;
  objc_copyWeak(&v11, &location);
  v12 = a4;
  v10 = v6;
  v8 = v6;
  dispatch_after(v7, MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __79__SBFAlwaysOnLiveRenderingAssertionManager_backlight_didChangeAlwaysOnEnabled___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(WeakRetained, "_nextLiveRenderingAssertionProxyIfAny");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_acquireLiveRenderingAssertionIfNeededForProxy:backlight:", v3, *(_QWORD *)(a1 + 32));

    }
    else
    {
      objc_msgSend(WeakRetained, "_releaseLiveRenderingAssertionWithReason:", CFSTR("AOD is disabled"));
    }
    WeakRetained = v4;
  }

}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  id v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12[2];
  id location;

  v7 = a3;
  objc_initWeak(&location, self);
  v8 = dispatch_time(0, 30000000);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__SBFAlwaysOnLiveRenderingAssertionManager_backlight_didCompleteUpdateToState_forEvent___block_invoke;
  v10[3] = &unk_1E200E778;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a4;
  v11 = v7;
  v9 = v7;
  dispatch_after(v8, MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __88__SBFAlwaysOnLiveRenderingAssertionManager_backlight_didCompleteUpdateToState_forEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (*(_QWORD *)(a1 + 48) == 1)
    {
      objc_msgSend(WeakRetained, "_nextLiveRenderingAssertionProxyIfAny");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_acquireLiveRenderingAssertionIfNeededForProxy:backlight:", v3, *(_QWORD *)(a1 + 32));
    }
    else
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromBLSBacklightState();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("Backlight state is %@"), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_releaseLiveRenderingAssertionWithReason:", v5);

    }
    WeakRetained = v6;
  }

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; proxyAssertions:%@; assertions:%@>"),
    v5,
    self,
    self->_liveRenderingAssertionProxies,
    self->_liveRenderingAssertion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlight, 0);
  objc_storeStrong((id *)&self->_attributesProvider, 0);
  objc_storeStrong((id *)&self->_assertionProvider, 0);
  objc_storeStrong((id *)&self->_liveRenderingAssertionProxies, 0);
  objc_storeStrong((id *)&self->_liveRenderingAssertion, 0);
}

- (void)_acquireLiveRenderingAssertionIfNeededForProxy:(os_log_t)log backlight:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_18AB69000, log, OS_LOG_TYPE_ERROR, "%@ Ignoring live-rendering assertion acquisition request for %@ because of invalid attributes", (uint8_t *)&v3, 0x16u);
}

@end
