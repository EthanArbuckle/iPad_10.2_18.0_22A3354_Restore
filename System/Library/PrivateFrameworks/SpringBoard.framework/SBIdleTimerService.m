@implementation SBIdleTimerService

- (id)acquireIdleTimerAssertionWithConfiguration:(id)a3 fromClient:(id)a4 forReason:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  char v18;
  _SBIdleTimerConfigurationInfo *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id WeakRetained;
  void *v27;
  NSObject *v28;
  objc_class *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  __CFString *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  BSDispatchQueueAssert();
  SBLogIdleTimer();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v37 = v13;
    v38 = 2114;
    v39 = v8;
    v40 = 2114;
    v41 = v14;
    v42 = 2114;
    v43 = v10;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@ - acquireIdleTimerAssertionWithConfiguration:%{public}@ fromClient:%{public}@ forReason:%{public}@]", buf, 0x2Au);

  }
  if (objc_msgSend(v8, "disablesTimer"))
  {
    if (-[SBIdleTimerService _isMediaPlaybackClient:](self, "_isMediaPlaybackClient:", v9))
    {
      -[NSMutableSet addObject:](self->_mediaPlaybackDisableReasons, "addObject:", v10);
      +[SBScreenLongevityController sharedInstanceIfExists](SBScreenLongevityController, "sharedInstanceIfExists");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "evaluateEnablement");

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_disableTimerConfigurations, "setObject:forKeyedSubscript:", v8, v10);
LABEL_21:
    objc_initWeak((id *)buf, self);
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "bundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@:%@"), CFSTR("IdleTimerClient"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_alloc(MEMORY[0x1E0D01868]);
    v24 = __serviceCalloutQueue;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __86__SBIdleTimerService_acquireIdleTimerAssertionWithConfiguration_fromClient_forReason___block_invoke;
    v33[3] = &unk_1E8EAE2E0;
    v34 = CFSTR("IdleTimerClient");
    objc_copyWeak(&v35, (id *)buf);
    v25 = (void *)objc_msgSend(v23, "initWithIdentifier:forReason:queue:invalidationBlock:", v22, v10, v24, v33);
    -[SBIdleTimerService _aggregateConfigurations](self, "_aggregateConfigurations");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "bundleIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "idleTimerServiceTimeoutAssertionsDidChange:fromClient:", self, v27);

    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v8;
    if (objc_msgSend(v16, "hasMaxExpirationTimeout"))
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_maxEpirationConfigurations, "setObject:forKeyedSubscript:", v16, v10);
    if (objc_msgSend(v16, "hasMinExpirationTimeout"))
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_minExpirationConfigurations, "setObject:forKeyedSubscript:", v16, v10);
    v17 = objc_msgSend(v16, "idleEventMask");
    v18 = v17;
    if (v17)
    {
      v19 = -[_SBIdleTimerConfigurationInfo initWithConfiguration:reason:]([_SBIdleTimerConfigurationInfo alloc], "initWithConfiguration:reason:", v16, v10);
      if ((v18 & 2) != 0)
        -[SBIdleTimerService _addConfigurationInfo:toSortedArray:](self, "_addConfigurationInfo:toSortedArray:", v19, self->_access_idleExpirationHandlers);
      if ((v18 & 1) != 0)
        -[SBIdleTimerService _addConfigurationInfo:toSortedArray:](self, "_addConfigurationInfo:toSortedArray:", v19, self->_access_idleWarnHandlers);
      if ((v18 & 4) != 0)
        -[SBIdleTimerService _addConfigurationInfo:toSortedArray:](self, "_addConfigurationInfo:toSortedArray:", v19, self->_access_idleUserAttentionResetHandlers);

    }
    goto LABEL_21;
  }
  SBLogIdleTimer();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v37 = v31;
    v38 = 2114;
    v39 = v8;
    v40 = 2114;
    v41 = v32;
    _os_log_error_impl(&dword_1D0540000, v28, OS_LOG_TYPE_ERROR, "[%{public}@ - requested configuration: %{public}@ from client: %{public}@ is not supported.]", buf, 0x20u);

  }
  v25 = 0;
LABEL_25:

  return v25;
}

- (BOOL)_isMediaPlaybackClient:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("com.apple.mediaplaybackd"));

  return v4;
}

- (void)_aggregateConfigurations
{
  SBIdleTimerAggregateClientConfiguration *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  uint64_t v30;
  void *v31;
  SBIdleTimerAggregateClientConfiguration *v32;
  SBIdleTimerAggregateClientConfiguration *aggregateClientConfiguration;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssert();
  v3 = objc_alloc_init(SBIdleTimerAggregateClientConfiguration);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[NSMutableDictionary allValues](self->_disableTimerConfigurations, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v44;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v8);
      v10 = objc_opt_class();
      v11 = v9;
      if (v10)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
      }
      else
      {
        v12 = 0;
      }
      v13 = v12;

      if (v13)
        v14 = objc_msgSend(v13, "precedence");
      else
        v14 = 0;
      -[SBIdleTimerAggregateClientConfiguration disableTimerSetting](v3, "disableTimerSetting");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (!v15 || v14 > objc_msgSend(v15, "precedence"))
        -[SBIdleTimerAggregateClientConfiguration setDisablesTimerWithPrecedence:](v3, "setDisablesTimerWithPrecedence:", v14);

      if (v14 == 2)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[NSMutableDictionary allValues](self->_minExpirationConfigurations, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v40 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v23 = objc_msgSend(v22, "precedence");
        objc_msgSend(v22, "minExpirationTimeout");
        -[SBIdleTimerAggregateClientConfiguration setMinExpirationTimeout:ifGreatestForPrecedence:](v3, "setMinExpirationTimeout:ifGreatestForPrecedence:", v23);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v19);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[NSMutableDictionary allValues](self->_maxEpirationConfigurations, "allValues", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        v30 = objc_msgSend(v29, "precedence");
        objc_msgSend(v29, "maxExpirationTimeout");
        -[SBIdleTimerAggregateClientConfiguration setMaxExpirationTimeout:ifLeastForPrecedence:](v3, "setMaxExpirationTimeout:ifLeastForPrecedence:", v30);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v26);
  }

  -[SBIdleTimerAggregateClientConfiguration disableTimerSetting](v3, "disableTimerSetting");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31
    || (-[SBIdleTimerAggregateClientConfiguration minExpirationTimeoutSettings](v3, "minExpirationTimeoutSettings"),
        (v31 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[SBIdleTimerAggregateClientConfiguration maxExpirationTimeoutSettings](v3, "maxExpirationTimeoutSettings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      aggregateClientConfiguration = self->_aggregateClientConfiguration;
      self->_aggregateClientConfiguration = 0;
      goto LABEL_38;
    }
  }
  v32 = v3;
  aggregateClientConfiguration = self->_aggregateClientConfiguration;
  self->_aggregateClientConfiguration = v32;
LABEL_38:

}

- (SBIdleTimerAggregateClientConfiguration)aggregateClientConfiguration
{
  return self->_aggregateClientConfiguration;
}

+ (id)_sharedIdleTimerStateServiceCreatingIfNeeded:(BOOL)a3
{
  _QWORD block[5];

  if (a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__SBIdleTimerService__sharedIdleTimerStateServiceCreatingIfNeeded___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (_sharedIdleTimerStateServiceCreatingIfNeeded__onceToken != -1)
      dispatch_once(&_sharedIdleTimerStateServiceCreatingIfNeeded__onceToken, block);
  }
  return (id)_sharedIdleTimerStateServiceCreatingIfNeeded__stateService;
}

void __67__SBIdleTimerService__sharedIdleTimerStateServiceCreatingIfNeeded___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc(MEMORY[0x1E0D3A8C8]);
  v2 = objc_msgSend(v1, "initWithDispatchQueue:delegate:", __serviceCalloutQueue, v4);
  v3 = (void *)_sharedIdleTimerStateServiceCreatingIfNeeded__stateService;
  _sharedIdleTimerStateServiceCreatingIfNeeded__stateService = v2;

}

+ (id)_sharedIdleTimerStateServiceIfExists
{
  return (id)objc_msgSend(a1, "_sharedIdleTimerStateServiceCreatingIfNeeded:", 0);
}

+ (void)registerServices
{
  id v2;

  v2 = (id)objc_msgSend(a1, "_sharedIdleTimerStateServiceCreatingIfNeeded:", 1);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_21 != -1)
    dispatch_once(&sharedInstance_onceToken_21, &__block_literal_global_155);
  return (id)sharedInstance_service;
}

void __36__SBIdleTimerService_sharedInstance__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = dispatch_queue_create("IdleTimerService", 0);
  v1 = (void *)__serviceCalloutQueue;
  __serviceCalloutQueue = (uint64_t)v0;

  v2 = -[SBIdleTimerService _init]([SBIdleTimerService alloc], "_init");
  v3 = (void *)sharedInstance_service;
  sharedInstance_service = (uint64_t)v2;

}

- (id)_init
{
  SBIdleTimerService *v2;
  SBIdleTimerService *v3;
  NSMutableArray *v4;
  NSMutableArray *access_idleWarnHandlers;
  NSMutableArray *v6;
  NSMutableArray *access_idleExpirationHandlers;
  NSMutableArray *v8;
  NSMutableArray *access_idleUserAttentionResetHandlers;
  NSMutableDictionary *v10;
  NSMutableDictionary *disableTimerConfigurations;
  NSMutableDictionary *v12;
  NSMutableDictionary *minExpirationConfigurations;
  NSMutableDictionary *v14;
  NSMutableDictionary *maxEpirationConfigurations;
  NSMutableSet *v16;
  NSMutableSet *mediaPlaybackDisableReasons;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SBIdleTimerService;
  v2 = -[SBIdleTimerService init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    access_idleWarnHandlers = v3->_access_idleWarnHandlers;
    v3->_access_idleWarnHandlers = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    access_idleExpirationHandlers = v3->_access_idleExpirationHandlers;
    v3->_access_idleExpirationHandlers = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    access_idleUserAttentionResetHandlers = v3->_access_idleUserAttentionResetHandlers;
    v3->_access_idleUserAttentionResetHandlers = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    disableTimerConfigurations = v3->_disableTimerConfigurations;
    v3->_disableTimerConfigurations = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    minExpirationConfigurations = v3->_minExpirationConfigurations;
    v3->_minExpirationConfigurations = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    maxEpirationConfigurations = v3->_maxEpirationConfigurations;
    v3->_maxEpirationConfigurations = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    mediaPlaybackDisableReasons = v3->_mediaPlaybackDisableReasons;
    v3->_mediaPlaybackDisableReasons = v16;

    -[SBIdleTimerService _addStateCaptureHandlers](v3, "_addStateCaptureHandlers");
  }
  return v3;
}

- (void)dealloc
{
  BSInvalidatable *stateCaptureAssertion;
  BSInvalidatable *v4;
  objc_super v5;

  stateCaptureAssertion = self->_stateCaptureAssertion;
  if (stateCaptureAssertion)
  {
    -[BSInvalidatable invalidate](stateCaptureAssertion, "invalidate");
    v4 = self->_stateCaptureAssertion;
    self->_stateCaptureAssertion = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)SBIdleTimerService;
  -[SBIdleTimerService dealloc](&v5, sel_dealloc);
}

- (BOOL)isDisabledByMediaPlayback
{
  return -[NSMutableSet count](self->_mediaPlaybackDisableReasons, "count") != 0;
}

void __86__SBIdleTimerService_acquireIdleTimerAssertionWithConfiguration_fromClient_forReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id *WeakRetained;
  id *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "substringFromIndex:", objc_msgSend(*(id *)(a1 + 32), "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogIdleTimer();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v4;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[SBIdleTimerService - Invalidating idle timer expiration timeout assertion forReason:%{public}@]", (uint8_t *)&v11, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_removeAssertionsForReason:", v4);
    objc_msgSend(v9, "_aggregateConfigurations");
    v10 = objc_loadWeakRetained(v9 + 10);
    objc_msgSend(v10, "idleTimerServiceTimeoutAssertionsDidChange:fromClient:", v9, v6);

  }
}

- (BOOL)handleIdleTimerDidWarn
{
  os_unfair_lock_s *p_accessLock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  os_unfair_lock_s *lock;
  _QWORD block[7];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  lock = p_accessLock;
  os_unfair_lock_lock(p_accessLock);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableArray reverseObjectEnumerator](self->_access_idleWarnHandlers, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    v7 = MEMORY[0x1E0C809B0];
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v6)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __44__SBIdleTimerService_handleIdleTimerDidWarn__block_invoke;
      block[3] = &unk_1E8EA0BE0;
      block[5] = self;
      block[6] = &v18;
      block[4] = v9;
      dispatch_sync((dispatch_queue_t)__serviceCalloutQueue, block);
      if (*((_BYTE *)v19 + 24))
        break;
      if (v5 == ++v8)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16, lock);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  os_unfair_lock_unlock(lock);
  v10 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v10;
}

void __44__SBIdleTimerService_handleIdleTimerDidWarn__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_sharedIdleTimerStateServiceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "clientConfiguration:handleIdleEvent:", v3, 1);

}

- (BOOL)handleIdleTimerDidExpire
{
  os_unfair_lock_s *p_accessLock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  os_unfair_lock_s *lock;
  _QWORD block[7];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  lock = p_accessLock;
  os_unfair_lock_lock(p_accessLock);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableArray reverseObjectEnumerator](self->_access_idleExpirationHandlers, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    v7 = MEMORY[0x1E0C809B0];
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v6)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __46__SBIdleTimerService_handleIdleTimerDidExpire__block_invoke;
      block[3] = &unk_1E8EA0BE0;
      block[5] = self;
      block[6] = &v18;
      block[4] = v9;
      dispatch_sync((dispatch_queue_t)__serviceCalloutQueue, block);
      if (*((_BYTE *)v19 + 24))
        break;
      if (v5 == ++v8)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16, lock);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  os_unfair_lock_unlock(lock);
  v10 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v10;
}

void __46__SBIdleTimerService_handleIdleTimerDidExpire__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_sharedIdleTimerStateServiceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "clientConfiguration:handleIdleEvent:", v3, 2);

}

- (BOOL)handleIdleTimerUserAttentionDidReset
{
  os_unfair_lock_s *p_accessLock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  os_unfair_lock_s *lock;
  _QWORD block[7];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  lock = p_accessLock;
  os_unfair_lock_lock(p_accessLock);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableArray reverseObjectEnumerator](self->_access_idleUserAttentionResetHandlers, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    v7 = MEMORY[0x1E0C809B0];
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v6)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __58__SBIdleTimerService_handleIdleTimerUserAttentionDidReset__block_invoke;
      block[3] = &unk_1E8EA0BE0;
      block[5] = self;
      block[6] = &v18;
      block[4] = v9;
      dispatch_sync((dispatch_queue_t)__serviceCalloutQueue, block);
      if (*((_BYTE *)v19 + 24))
        break;
      if (v5 == ++v8)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16, lock);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  os_unfair_lock_unlock(lock);
  v10 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v10;
}

void __58__SBIdleTimerService_handleIdleTimerUserAttentionDidReset__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_sharedIdleTimerStateServiceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "clientConfiguration:handleIdleEvent:", v3, 4);

}

- (id)_acquireIdleTimerDisableAssertionForReason:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  _QWORD block[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v3 = a3;
  BSDispatchQueueAssert();
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__52;
  v13[4] = __Block_byref_object_dispose__52;
  v4 = MEMORY[0x1E0C809B0];
  v14 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SBIdleTimerService__acquireIdleTimerDisableAssertionForReason___block_invoke;
  block[3] = &unk_1E8E9DFA0;
  v12 = v13;
  v5 = v3;
  v11 = v5;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v6 = objc_alloc(MEMORY[0x1E0D01868]);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __65__SBIdleTimerService__acquireIdleTimerDisableAssertionForReason___block_invoke_2;
  v9[3] = &unk_1E8EAE308;
  v9[4] = v13;
  v7 = (void *)objc_msgSend(v6, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("DisableIdleTimer"), v5, __serviceCalloutQueue, v9);

  _Block_object_dispose(v13, 8);
  return v7;
}

void __65__SBIdleTimerService__acquireIdleTimerDisableAssertionForReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acquireIdleTimerDisableAssertionForReason:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __65__SBIdleTimerService__acquireIdleTimerDisableAssertionForReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SBIdleTimerService__acquireIdleTimerDisableAssertionForReason___block_invoke_3;
  block[3] = &unk_1E8E9E868;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

uint64_t __65__SBIdleTimerService__acquireIdleTimerDisableAssertionForReason___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogIdleTimer();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "reason");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[SBIdleTimerService - Invalidating idle timer disable assertion forReason:%{public}@]", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
}

- (void)_removeAssertionsForReason:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIdleTimerService.m"), 323, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  BSDispatchQueueAssert();
  -[NSMutableSet removeObject:](self->_mediaPlaybackDisableReasons, "removeObject:", v7);
  +[SBScreenLongevityController sharedInstanceIfExists](SBScreenLongevityController, "sharedInstanceIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "evaluateEnablement");

  -[NSMutableDictionary removeObjectForKey:](self->_disableTimerConfigurations, "removeObjectForKey:", v7);
  -[NSMutableDictionary removeObjectForKey:](self->_minExpirationConfigurations, "removeObjectForKey:", v7);
  -[NSMutableDictionary removeObjectForKey:](self->_maxEpirationConfigurations, "removeObjectForKey:", v7);
  -[SBIdleTimerService _removeConfigurationInfoForReason:fromArray:](self, "_removeConfigurationInfoForReason:fromArray:", v7, self->_access_idleExpirationHandlers);
  -[SBIdleTimerService _removeConfigurationInfoForReason:fromArray:](self, "_removeConfigurationInfoForReason:fromArray:", v7, self->_access_idleWarnHandlers);
  -[SBIdleTimerService _removeConfigurationInfoForReason:fromArray:](self, "_removeConfigurationInfoForReason:fromArray:", v7, self->_access_idleUserAttentionResetHandlers);

}

- (void)_addStateCaptureHandlers
{
  SBIdleTimerService *v2;
  uint64_t v3;
  BSInvalidatable *stateCaptureAssertion;
  SBIdleTimerService *v5;

  v5 = self;
  v2 = v5;
  BSLogAddStateCaptureBlockWithTitle();
  v3 = objc_claimAutoreleasedReturnValue();
  stateCaptureAssertion = v2->_stateCaptureAssertion;
  v2->_stateCaptureAssertion = (BSInvalidatable *)v3;

}

__CFString *__46__SBIdleTimerService__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  void *v1;
  __CFString *v2;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(v1, "_stateCaptureDescription");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = &stru_1E8EC7EC0;
  }
  return v2;
}

- (id)_stateCaptureDescription
{
  void *v3;
  os_unfair_lock_s *p_accessLock;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  SBIdleTimerService *v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __46__SBIdleTimerService__stateCaptureDescription__block_invoke;
  v11 = &unk_1E8E9E820;
  v12 = v3;
  v13 = self;
  v5 = v3;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, &v8);
  os_unfair_lock_unlock(p_accessLock);
  objc_msgSend(v5, "build", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __46__SBIdleTimerService__stateCaptureDescription__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88), CFSTR("AggregateClientConfiguration"), 1);
  objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("DisableTimerConfigurations"), 1);
  objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("MinExpirationConfigurations"), 1);
  objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("maxExpirationConfigurations"), 1);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v4, CFSTR("mediaPlaybackDisableReasons"), 1);

  objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("idleExpirationHandlers"), 1);
  objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("idleWarnHandlers"), 1);
  return objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("idleUserAttentionResetHandlers"), 1);
}

- (void)_addConfigurationInfo:(id)a3 toSortedArray:(id)a4
{
  os_unfair_lock_s *p_accessLock;
  id v6;
  id v7;

  p_accessLock = &self->_accessLock;
  v6 = a4;
  v7 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  objc_msgSend(v6, "addObject:", v7);

  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_51_0);
  os_unfair_lock_unlock(p_accessLock);
}

uint64_t __58__SBIdleTimerService__addConfigurationInfo_toSortedArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "precedence");

  objc_msgSend(v4, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "precedence");
  v9 = 1;
  if (v6 <= v8)
    v9 = -1;
  if (v6 == v8)
    return 0;
  else
    return v9;
}

- (void)_removeConfigurationInfoForReason:(id)a3 fromArray:(id)a4
{
  id v6;
  os_unfair_lock_s *p_accessLock;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v12 = a3;
  v6 = a4;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  if (objc_msgSend(v6, "count"))
  {
    v8 = 0;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reason");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v12);

      if (v11)
        break;
      if (objc_msgSend(v6, "count") <= (unint64_t)++v8)
        goto LABEL_8;
    }
    if ((v8 & 0x8000000000000000) == 0)
      objc_msgSend(v6, "removeObjectAtIndex:", v8);
  }
LABEL_8:
  os_unfair_lock_unlock(p_accessLock);

}

- (SBIdleTimerServiceDelegate)delegate
{
  return (SBIdleTimerServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateClientConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_mediaPlaybackDisableReasons, 0);
  objc_storeStrong((id *)&self->_maxEpirationConfigurations, 0);
  objc_storeStrong((id *)&self->_minExpirationConfigurations, 0);
  objc_storeStrong((id *)&self->_disableTimerConfigurations, 0);
  objc_storeStrong((id *)&self->_access_idleUserAttentionResetHandlers, 0);
  objc_storeStrong((id *)&self->_access_idleWarnHandlers, 0);
  objc_storeStrong((id *)&self->_access_idleExpirationHandlers, 0);
}

@end
