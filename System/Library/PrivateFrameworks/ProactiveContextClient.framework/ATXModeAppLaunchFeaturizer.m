@implementation ATXModeAppLaunchFeaturizer

void __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke_21(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (!WeakRetained)
    {
LABEL_9:

      goto LABEL_10;
    }
    objc_msgSend(v14, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "starting") & 1) != 0)
    {
      objc_msgSend(v14, "eventBody");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");

      if (v8)
      {
        v9 = (void *)MEMORY[0x1D82448B0]();
        v10 = objc_alloc(MEMORY[0x1E0C99E60]);
        objc_msgSend(v14, "eventBody");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bundleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v10, "initWithObjects:", v12, 0);

        objc_autoreleasePoolPop(v9);
LABEL_8:
        objc_msgSend(WeakRetained, "_processActiveApps:", v13);

        goto LABEL_9;
      }
    }
    else
    {

    }
    v13 = (void *)objc_opt_new();
    goto LABEL_8;
  }
LABEL_10:

}

- (void)_processActiveApps:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _PASSimpleCoalescingTimer *easeInTimer;
  _BOOL4 easeInTimerIsEnabled;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  uint8_t *v17;
  NSObject *v18;
  double v19;
  NSObject *v20;
  _BOOL4 v21;
  _PASSimpleCoalescingTimer *cooldownTimer;
  __int16 v23;
  uint8_t v24[16];
  uint8_t v25[16];
  uint8_t v26[16];
  __int16 v27;
  uint8_t buf[16];

  v4 = a3;
  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ATXModeAppLaunchFeaturizer _processActiveApps:].cold.2();

  v6 = -[ATXModeAppLaunchFeaturizer state](self, "state");
  if (objc_msgSend(v4, "count"))
  {
    v7 = -[ATXModeAppLaunchFeaturizer expectedGenreId](self, "expectedGenreId");
    -[ATXModeAppLaunchFeaturizer additionalAllowedBundleIds](self, "additionalAllowedBundleIds");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    activeBundleForBundleIds(v4, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = 3;
    else
      v10 = 1;

  }
  else
  {
    v10 = 1;
  }
  if (v6 != v10)
  {
    switch(v6)
    {
      case 0:
        break;
      case 1:
        if (v10 != 3)
          goto LABEL_25;
        __atxlog_handle_modes();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D2C00000, v11, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: Entering ease in period before entering state", buf, 2u);
        }

        -[ATXModeAppLaunchFeaturizer setState:](self, "setState:", 2);
        easeInTimer = self->_easeInTimer;
        easeInTimerIsEnabled = self->_easeInTimerIsEnabled;
        goto LABEL_22;
      case 2:
        __atxlog_handle_modes();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v10 != 3)
        {
          if (v15)
          {
            *(_WORD *)v26 = 0;
            _os_log_impl(&dword_1D2C00000, v14, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: Going back to inactive state since user quit prematurely", v26, 2u);
          }

          -[ATXModeAppLaunchFeaturizer setState:](self, "setState:", 1);
          cooldownTimer = self->_easeInTimer;
          goto LABEL_35;
        }
        if (!v15)
          goto LABEL_39;
        v27 = 0;
        v16 = "ATXModeAppLaunchFeaturizer: Already easing in and still not in state";
        v17 = (uint8_t *)&v27;
        goto LABEL_38;
      case 3:
        if (v10 != 1)
          goto LABEL_25;
        __atxlog_handle_modes();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl(&dword_1D2C00000, v18, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: Entering cool down period before exiting state", v25, 2u);
        }

        -[ATXModeAppLaunchFeaturizer setState:](self, "setState:", 4);
        easeInTimer = self->_cooldownTimer;
        easeInTimerIsEnabled = self->_cooldownTimerIsEnabled;
LABEL_22:
        v19 = 300.0;
        if (!easeInTimerIsEnabled)
          v19 = 0.0;
        -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](easeInTimer, "runAfterDelaySeconds:coalescingBehavior:", 1, v19);
        break;
      case 4:
        __atxlog_handle_modes();
        v14 = objc_claimAutoreleasedReturnValue();
        v21 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v10 == 3)
        {
          if (v21)
          {
            *(_WORD *)v24 = 0;
            _os_log_impl(&dword_1D2C00000, v14, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: Going back to proper state", v24, 2u);
          }

          -[ATXModeAppLaunchFeaturizer setState:](self, "setState:", 3);
          cooldownTimer = self->_cooldownTimer;
LABEL_35:
          -[_PASSimpleCoalescingTimer cancelPendingOperations](cooldownTimer, "cancelPendingOperations");
        }
        else
        {
          if (v21)
          {
            v23 = 0;
            v16 = "ATXModeAppLaunchFeaturizer: Already cooling down and still not in state";
            v17 = (uint8_t *)&v23;
LABEL_38:
            _os_log_impl(&dword_1D2C00000, v14, OS_LOG_TYPE_DEFAULT, v16, v17, 2u);
          }
LABEL_39:

        }
        break;
      default:
LABEL_25:
        __atxlog_handle_modes();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          -[ATXModeAppLaunchFeaturizer _processActiveApps:].cold.1();

        break;
    }
  }

}

- (int64_t)state
{
  return self->_state;
}

- (id)additionalAllowedBundleIds
{
  return (id)objc_opt_new();
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (ATXModeAppLaunchFeaturizer)init
{
  ATXModeAppLaunchFeaturizer *v2;
  ATXModeAppLaunchFeaturizer *v3;
  ATXFrontBoardLayoutAggregator *v4;
  ATXFrontBoardLayoutAggregator *frontBoardLayoutAggregator;
  ATXModeAppLaunchFeaturizer *v6;
  objc_super v8;
  Boolean keyExistsAndHasValidFormat;

  v8.receiver = self;
  v8.super_class = (Class)ATXModeAppLaunchFeaturizer;
  v2 = -[ATXModeAppLaunchFeaturizer init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cooldownTimerIsEnabled = 1;
    if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
    {
      keyExistsAndHasValidFormat = 0;
      if (CFPreferencesGetAppBooleanValue(CFSTR("RemoveModeSwitchCooldown"), (CFStringRef)*MEMORY[0x1E0CF9510], &keyExistsAndHasValidFormat))
      {
        v3->_cooldownTimerIsEnabled = 0;
      }
    }
    v3->_easeInTimerIsEnabled = 1;
    if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
    {
      keyExistsAndHasValidFormat = 0;
      if (CFPreferencesGetAppBooleanValue(CFSTR("RemoveModeSwitchEaseIn"), (CFStringRef)*MEMORY[0x1E0CF9510], &keyExistsAndHasValidFormat))
      {
        v3->_easeInTimerIsEnabled = 0;
      }
    }
    v4 = (ATXFrontBoardLayoutAggregator *)objc_alloc_init(MEMORY[0x1E0CF94B8]);
    frontBoardLayoutAggregator = v3->_frontBoardLayoutAggregator;
    v3->_frontBoardLayoutAggregator = v4;

    v6 = v3;
  }

  return v3;
}

- (id)_latestAppLaunchBundleIds
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = (id)objc_opt_new();
  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "App");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "InFocus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "atx_publisherFromStartDate:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "last");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__ATXModeAppLaunchFeaturizer__latestAppLaunchBundleIds__block_invoke_6;
  v10[3] = &unk_1E942DB38;
  v10[4] = &v11;
  v7 = (id)objc_msgSend(v6, "sinkWithCompletion:receiveInput:", &__block_literal_global_4, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __55__ATXModeAppLaunchFeaturizer__latestAppLaunchBundleIds__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = a2;
  v3 = objc_msgSend(v2, "state");
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55__ATXModeAppLaunchFeaturizer__latestAppLaunchBundleIds__block_invoke_cold_1(v2);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: done fetching last app launch event", v6, 2u);
  }

}

void __55__ATXModeAppLaunchFeaturizer__latestAppLaunchBundleIds__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "starting"))
    goto LABEL_4;
  objc_msgSend(v13, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1D82448B0]();
    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v13, "eventBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithObjects:", v10, 0);

    objc_autoreleasePoolPop(v7);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v3 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
LABEL_4:

  }
}

- (id)provideFeatures
{
  void *v3;
  void *v4;

  -[ATXModeAppLaunchFeaturizer _latestAppLaunchBundleIds](self, "_latestAppLaunchBundleIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeAppLaunchFeaturizer _provideFeaturesWithBundleIds:](self, "_provideFeaturesWithBundleIds:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_provideFeaturesWithBundleIds:(id)a3
{
  id v4;
  ATXModeFeatureSet *v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(ATXModeFeatureSet);
  v6 = -[ATXModeAppLaunchFeaturizer state](self, "state");
  if (v6 == 4 || v6 == 3)
  {
    v9 = 0;
    v10 = 1;
  }
  else if (v6)
  {
    v10 = 0;
    v9 = 0;
  }
  else
  {
    v7 = -[ATXModeAppLaunchFeaturizer expectedGenreId](self, "expectedGenreId");
    -[ATXModeAppLaunchFeaturizer additionalAllowedBundleIds](self, "additionalAllowedBundleIds");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    activeBundleForBundleIds(v4, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v9 != 0;
    if (v9)
      v11 = 3;
    else
      v11 = 1;
    -[ATXModeAppLaunchFeaturizer setState:](self, "setState:", v11);
    __atxlog_handle_modes();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134217984;
      v15 = -[ATXModeAppLaunchFeaturizer state](self, "state");
      _os_log_impl(&dword_1D2C00000, v12, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: Initial state: %ld", (uint8_t *)&v14, 0xCu);
    }

  }
  -[ATXModeFeatureSet setValue:forBinaryFeatureOfType:](v5, "setValue:forBinaryFeatureOfType:", v10, -[ATXModeAppLaunchFeaturizer modeFeatureType](self, "modeFeatureType"));
  if (v10 && v9)
    -[ATXModeFeatureSet setString:forFeatureType:](v5, "setString:forFeatureType:", v9, 16);
  else
    -[ATXModeFeatureSet setNullForFeatureType:](v5, "setNullForFeatureType:", 16);

  return v5;
}

- (void)_actuallyEndMode
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (-[ATXModeAppLaunchFeaturizer state](self, "state") == 4)
  {
    -[ATXModeAppLaunchFeaturizer setState:](self, "setState:", 1);
    __atxlog_handle_modes();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D2C00000, v3, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: State after cooldown: not active", v7, 2u);
    }

    -[ATXModeAppLaunchFeaturizer delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    -[ATXModeAppLaunchFeaturizer _provideFeaturesWithBundleIds:](self, "_provideFeaturesWithBundleIds:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featurizer:didUpdateFeatures:", self, v6);

  }
}

- (void)_actuallyStartMode
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (-[ATXModeAppLaunchFeaturizer state](self, "state") == 2)
  {
    -[ATXModeAppLaunchFeaturizer setState:](self, "setState:", 3);
    __atxlog_handle_modes();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D2C00000, v3, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: State after ease-in: active", v7, 2u);
    }

    -[ATXModeAppLaunchFeaturizer delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXModeAppLaunchFeaturizer _latestAppLaunchBundleIds](self, "_latestAppLaunchBundleIds");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXModeAppLaunchFeaturizer _provideFeaturesWithBundleIds:](self, "_provideFeaturesWithBundleIds:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featurizer:didUpdateFeatures:", self, v6);

  }
}

- (unint64_t)expectedGenreId
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Subclasses should implement -[ATXModeAppLaunchFeaturizer expectedGenreId]"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (int)modeFeatureType
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Subclasses should implement -[ATXModeAppLaunchFeaturizer modeFeatureType]"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)registrationId
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Subclasses should implement -[ATXModeAppLaunchFeaturizer registrationId]"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)beginListening
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  _PASSimpleCoalescingTimer *v7;
  _PASSimpleCoalescingTimer *cooldownTimer;
  id v9;
  uint64_t v10;
  id v11;
  _PASSimpleCoalescingTimer *v12;
  _PASSimpleCoalescingTimer *easeInTimer;
  NSObject *v14;
  OS_dispatch_queue *v15;
  OS_dispatch_queue *queue;
  id v17;
  void *v18;
  BMBiomeScheduler *v19;
  BMBiomeScheduler *scheduler;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BPSSink *v26;
  BPSSink *sink;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  if (!self->_cooldownTimer)
  {
    v4 = objc_alloc(MEMORY[0x1E0D81618]);
    v5 = MEMORY[0x1E0C80D38];
    v6 = MEMORY[0x1E0C80D38];
    v32[0] = v3;
    v32[1] = 3221225472;
    v32[2] = __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke;
    v32[3] = &unk_1E942DA58;
    objc_copyWeak(&v33, &location);
    v7 = (_PASSimpleCoalescingTimer *)objc_msgSend(v4, "initWithQueue:operation:", v5, v32);
    cooldownTimer = self->_cooldownTimer;
    self->_cooldownTimer = v7;

    objc_destroyWeak(&v33);
  }
  if (!self->_easeInTimer)
  {
    v9 = objc_alloc(MEMORY[0x1E0D81618]);
    v10 = MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C80D38];
    v30[0] = v3;
    v30[1] = 3221225472;
    v30[2] = __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke_2;
    v30[3] = &unk_1E942DA58;
    objc_copyWeak(&v31, &location);
    v12 = (_PASSimpleCoalescingTimer *)objc_msgSend(v9, "initWithQueue:operation:", v10, v30);
    easeInTimer = self->_easeInTimer;
    self->_easeInTimer = v12;

    objc_destroyWeak(&v31);
  }
  if (!self->_queue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.BiomeAppLaunch.queue", v14);
    queue = self->_queue;
    self->_queue = v15;

  }
  v17 = objc_alloc(MEMORY[0x1E0D025E0]);
  -[ATXModeAppLaunchFeaturizer registrationId](self, "registrationId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (BMBiomeScheduler *)objc_msgSend(v17, "initWithIdentifier:targetQueue:", v18, self->_queue);
  scheduler = self->_scheduler;
  self->_scheduler = v19;

  BiomeLibrary();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "App");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "InFocus");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "atx_DSLPublisher");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "subscribeOn:", self->_scheduler);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v3;
  v28[1] = 3221225472;
  v28[2] = __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke_21;
  v28[3] = &unk_1E942DC08;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v25, "sinkWithCompletion:receiveInput:", &__block_literal_global_20, v28);
  v26 = (BPSSink *)objc_claimAutoreleasedReturnValue();
  sink = self->_sink;
  self->_sink = v26;

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_actuallyEndMode");

}

void __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_actuallyStartMode");

}

void __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = a2;
  v3 = objc_msgSend(v2, "state");
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke_3_cold_1(v2);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: done listening to app launch events", v6, 2u);
  }

}

- (void)stopListening
{
  BPSSink *sink;
  BMBiomeScheduler *scheduler;

  -[BPSSink cancel](self->_sink, "cancel");
  sink = self->_sink;
  self->_sink = 0;

  scheduler = self->_scheduler;
  self->_scheduler = 0;

}

- (ATXModeFeaturizerDelegate)delegate
{
  return (ATXModeFeaturizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)easeInTimerIsEnabled
{
  return self->_easeInTimerIsEnabled;
}

- (void)setEaseInTimerIsEnabled:(BOOL)a3
{
  self->_easeInTimerIsEnabled = a3;
}

- (BOOL)cooldownTimerIsEnabled
{
  return self->_cooldownTimerIsEnabled;
}

- (void)setCooldownTimerIsEnabled:(BOOL)a3
{
  self->_cooldownTimerIsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_frontBoardLayoutAggregator, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_easeInTimer, 0);
  objc_storeStrong((id *)&self->_cooldownTimer, 0);
}

void __55__ATXModeAppLaunchFeaturizer__latestAppLaunchBundleIds__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D2C00000, v2, v3, "ATXModeAppLaunchFeaturizer: error fetching last app launch event: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_processActiveApps:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  v3 = 2048;
  v4 = v0;
  _os_log_fault_impl(&dword_1D2C00000, v1, OS_LOG_TYPE_FAULT, "ATXModeAppLaunchFeaturizer: Unexpected state %ld %ld", v2, 0x16u);
}

- (void)_processActiveApps:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_1D2C00000, v0, OS_LOG_TYPE_DEBUG, "ATXModeAppLaunchFeaturizer: Processing active apps: %@", v1, 0xCu);
}

void __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke_3_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D2C00000, v2, v3, "ATXModeAppLaunchFeaturizer: error listening to app launch events: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

@end
