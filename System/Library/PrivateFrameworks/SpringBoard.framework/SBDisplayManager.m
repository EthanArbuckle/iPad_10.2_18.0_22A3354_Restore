@implementation SBDisplayManager

- (int64_t)windowingModeForDisplay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v9;
  void *v10;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBDisplayManager windowingModeForDisplay:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("SBDisplayManager.m"), 222, CFSTR("this call must be made on the main thread"));

  }
  -[NSMutableDictionary objectForKey:](self->_identityToWindowingModeMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "integerValue");
  else
    v7 = 0;

  return v7;
}

- (void)cache:(id)a3 didUpdateAudioSessionPlaying:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  SBLogDisplayControlling();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v7;
    v20 = 1024;
    v21 = v4;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ audioSessionPlaying %d", buf, 0x12u);

  }
  -[NSMutableDictionary allKeys](self->_rootIdentityToBlankingRemovesPower, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[SBDisplayManager _setBlankingRemovesPower:forDisplay:](self, "_setBlankingRemovesPower:forDisplay:", -[SBDisplayManager _shouldBlankingRemovePowerForDisplay:](self, "_shouldBlankingRemovePowerForDisplay:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12)), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (SBDisplayManager)initWithDisplayManager:(id)a3 sceneManagerCoordinator:(id)a4 assertionCoordinator:(id)a5 powerLogReporter:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBDisplayManager *v15;
  SBDisplayManager *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *connectedIdentityToRecordMap;
  uint64_t v19;
  NSMutableDictionary *rootIdentityToLayoutPublisherMap;
  uint64_t v21;
  NSMutableDictionary *rootIdentityToCADisplayQueueMap;
  uint64_t v23;
  NSMapTable *controllerToAssertionMap;
  NSString *disableIdleSleepReason;
  uint64_t v26;
  NSHashTable *factories;
  uint64_t v28;
  NSMutableDictionary *identityToControllerMap;
  uint64_t v30;
  NSMutableDictionary *identityToWindowingModeMap;
  uint64_t v32;
  NSHashTable *lock_observers;
  uint64_t v34;
  NSMutableDictionary *rootIdentityToDisableSleepReasons;
  uint64_t v36;
  NSMutableDictionary *rootIdentityToDisplayArrangementItems;
  uint64_t v38;
  NSMutableDictionary *rootIdentityToCloneMirroringMode;
  uint64_t v40;
  NSMutableDictionary *rootIdentityToCloneMirroringModeTokens;
  uint64_t v42;
  NSMutableDictionary *rootIdentityToBlankingRemovesPower;
  void *v44;
  void *v45;
  void *v46;
  objc_super v48;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v48.receiver = self;
  v48.super_class = (Class)SBDisplayManager;
  v15 = -[SBDisplayManager init](&v48, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_displayManager, a3);
    objc_storeStrong((id *)&v16->_sceneManagerCoordinator, a4);
    objc_storeStrong((id *)&v16->_assertionCoordinator, a5);
    -[SBDisplayAssertionCoordinator setDelegate:](v16->_assertionCoordinator, "setDelegate:", v16);
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    connectedIdentityToRecordMap = v16->_connectedIdentityToRecordMap;
    v16->_connectedIdentityToRecordMap = v17;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    rootIdentityToLayoutPublisherMap = v16->_rootIdentityToLayoutPublisherMap;
    v16->_rootIdentityToLayoutPublisherMap = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    rootIdentityToCADisplayQueueMap = v16->_rootIdentityToCADisplayQueueMap;
    v16->_rootIdentityToCADisplayQueueMap = (NSMutableDictionary *)v21;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v23 = objc_claimAutoreleasedReturnValue();
    controllerToAssertionMap = v16->_controllerToAssertionMap;
    v16->_controllerToAssertionMap = (NSMapTable *)v23;

    disableIdleSleepReason = v16->_disableIdleSleepReason;
    v16->_disableIdleSleepReason = 0;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v26 = objc_claimAutoreleasedReturnValue();
    factories = v16->_factories;
    v16->_factories = (NSHashTable *)v26;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = objc_claimAutoreleasedReturnValue();
    identityToControllerMap = v16->_identityToControllerMap;
    v16->_identityToControllerMap = (NSMutableDictionary *)v28;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v30 = objc_claimAutoreleasedReturnValue();
    identityToWindowingModeMap = v16->_identityToWindowingModeMap;
    v16->_identityToWindowingModeMap = (NSMutableDictionary *)v30;

    objc_storeStrong((id *)&v16->_powerLogReporter, a6);
    v16->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v32 = objc_claimAutoreleasedReturnValue();
    lock_observers = v16->_lock_observers;
    v16->_lock_observers = (NSHashTable *)v32;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v34 = objc_claimAutoreleasedReturnValue();
    rootIdentityToDisableSleepReasons = v16->_rootIdentityToDisableSleepReasons;
    v16->_rootIdentityToDisableSleepReasons = (NSMutableDictionary *)v34;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v36 = objc_claimAutoreleasedReturnValue();
    rootIdentityToDisplayArrangementItems = v16->_rootIdentityToDisplayArrangementItems;
    v16->_rootIdentityToDisplayArrangementItems = (NSMutableDictionary *)v36;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v38 = objc_claimAutoreleasedReturnValue();
    rootIdentityToCloneMirroringMode = v16->_rootIdentityToCloneMirroringMode;
    v16->_rootIdentityToCloneMirroringMode = (NSMutableDictionary *)v38;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v40 = objc_claimAutoreleasedReturnValue();
    rootIdentityToCloneMirroringModeTokens = v16->_rootIdentityToCloneMirroringModeTokens;
    v16->_rootIdentityToCloneMirroringModeTokens = (NSMutableDictionary *)v40;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v42 = objc_claimAutoreleasedReturnValue();
    rootIdentityToBlankingRemovesPower = v16->_rootIdentityToBlankingRemovesPower;
    v16->_rootIdentityToBlankingRemovesPower = (NSMutableDictionary *)v42;

    +[SBAVSystemControllerCache sharedInstance](SBAVSystemControllerCache, "sharedInstance");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObserver:", v16);
    -[FBDisplayManager mainConfiguration](v16->_displayManager, "mainConfiguration");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "identity");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDisplayManager _connectToIdentity:withConfiguration:forDisplayManagerInit:](v16, "_connectToIdentity:withConfiguration:forDisplayManagerInit:", v46, v45, 1);

  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[FBDisplayManager removeObserver:](self->_displayManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBDisplayManager;
  -[SBDisplayManager dealloc](&v3, sel_dealloc);
}

- (void)beginMonitoringForExternalDisplays:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SBDisplayManager_beginMonitoringForExternalDisplays___block_invoke;
  v6[3] = &unk_1E8EA02D8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __55__SBDisplayManager_beginMonitoringForExternalDisplays___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  id *v9;
  void *v10;
  uint64_t result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObserver:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "connectedIdentities", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          v9 = *(id **)(a1 + 32);
          objc_msgSend(v9[1], "configurationForIdentity:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_connectToIdentity:withConfiguration:forDisplayManagerInit:", v7, v10, 1);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)registerDisplayControllerProvider:(id)a3
{
  id v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (v5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBDisplayManager registerDisplayControllerProvider:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("SBDisplayManager.m"), 180, CFSTR("this call must be made on the main thread"));

    if (v5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayManager.m"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayControllerFactory"));

LABEL_3:
  if (-[NSHashTable containsObject:](self->_factories, "containsObject:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NSHashTable addObject:](self->_factories, "addObject:", v5);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_connectedIdentityToRecordMap;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_identityToControllerMap, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          -[FBDisplayManager configurationForIdentity:](self->_displayManager, "configurationForIdentity:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "displayControllerInfoForConnectingDisplay:configuration:", v11, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            -[SBDisplayManager _connectControllerWithInfo:toDisplay:configuration:](self, "_connectControllerWithInfo:toDisplay:configuration:", v14, v11, v13);

        }
      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

}

- (id)layoutPublisherForDisplay:(id)a3
{
  id v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBDisplayManager layoutPublisherForDisplay:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SBDisplayManager.m"), 198, CFSTR("this call must be made on the main thread"));

  }
  if ((objc_msgSend(v5, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayManager.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootIdentity isRootIdentity]"));

  }
  -[NSMutableDictionary objectForKey:](self->_rootIdentityToLayoutPublisherMap, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)addObserver:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v5 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (-[NSHashTable containsObject:](self->_lock_observers, "containsObject:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayManager.m"), 206, CFSTR("observer already registered: %@"), v5);

  }
  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E8EC7EC0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __32__SBDisplayManager_addObserver___block_invoke;
  v12[3] = &unk_1E8EA4CC0;
  objc_copyWeak(&v14, &location);
  v8 = v5;
  v13 = v8;
  v9 = (void *)objc_msgSend(v6, "initWithIdentifier:forReason:invalidationBlock:", v7, CFSTR("displayCoordinator"), v12);

  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v8);
  os_unfair_lock_unlock(&self->_lock);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __32__SBDisplayManager_addObserver___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  id *v4;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained + 34;
    v4 = (id *)WeakRetained;
    os_unfair_lock_lock(WeakRetained + 34);
    objc_msgSend(v4[18], "removeObject:", *(_QWORD *)(a1 + 32));
    os_unfair_lock_unlock(v3);
    WeakRetained = (os_unfair_lock_s *)v4;
  }

}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  SBLogFBDisplayManagerCallbacks();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_sbLoggingDescription");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@\n\tconfiguration: %{public}@;\n\tidentity: %{public}@",
      (uint8_t *)&v14,
      0x20u);

  }
  objc_msgSend(v8, "hardwareIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_7;
  if ((objc_msgSend(v8, "isMainDisplay") & 1) == 0)
  {
    SBLogFBDisplayManagerCallbacks();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      _SBFLoggingMethodProem();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v13;
      v16 = 2114;
      v17 = CFSTR("connecting");
      v18 = 2114;
      v19 = v7;
      v20 = 2114;
      v21 = v8;
      _os_log_error_impl(&dword_1D0540000, v12, OS_LOG_TYPE_ERROR, "%{public}@ told about a %{public}@ display with nil hardwareIdentifier. identity: %{public}@; configuration: %{public}@",
        (uint8_t *)&v14,
        0x2Au);

    }
LABEL_7:

  }
  -[SBDisplayManager _connectToIdentity:withConfiguration:forDisplayManagerInit:](self, "_connectToIdentity:withConfiguration:forDisplayManagerInit:", v7, v8, 0);

}

- (void)_connectToIdentity:(id)a3 withConfiguration:(id)a4 forDisplayManagerInit:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  _SBDisplayIdentityRecord *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  const char *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  dispatch_time_t v29;
  NSHashTable *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  SEL v51;
  int v52;
  void *v53;
  _SBDisplayIdentityRecord *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD block[4];
  _SBDisplayIdentityRecord *v68;
  id v69;
  SBDisplayManager *v70;
  id v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  id v76;
  uint64_t v77;

  v5 = a5;
  v77 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  -[NSMutableDictionary objectForKey:](self->_connectedIdentityToRecordMap, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hardwareIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

    goto LABEL_4;
  }
  if ((objc_msgSend(v10, "isMainDisplay") & 1) != 0)
  {
LABEL_4:
    if (objc_msgSend(v11, "didConnectAtInit"))
    {
      SBLogDisplayControlling();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v76 = v9;
LABEL_22:
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
        goto LABEL_59;
      }
    }
    else
    {
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayManager.m"), 249, CFSTR("told an identity is connecting when we're already tracking it. is frontboard telling us things out of order?: %@"), v9);

      }
      v16 = -[_SBDisplayIdentityRecord initWithIdentity:connectedAtInit:]([_SBDisplayIdentityRecord alloc], "initWithIdentity:connectedAtInit:", v9, v5);

      -[NSMutableDictionary setObject:forKey:](self->_connectedIdentityToRecordMap, "setObject:forKey:", v16, v9);
      v17 = objc_msgSend(v9, "isRootIdentity");
      if (v17)
      {
        -[SBDisplayAssertionCoordinator rootDisplayDidConnect:](self->_assertionCoordinator, "rootDisplayDidConnect:", v9);
        -[NSMutableDictionary objectForKey:](self->_rootIdentityToLayoutPublisherMap, "objectForKey:", v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          -[SBDisplayManager _createAndActivateLayoutPublisherForConnectingDisplay:](self, "_createAndActivateLayoutPublisherForConnectingDisplay:", v9);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](self->_rootIdentityToLayoutPublisherMap, "setObject:forKey:", v19, v9);

        }
        -[NSMutableDictionary objectForKey:](self->_rootIdentityToCADisplayQueueMap, "objectForKey:", v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@:CADisplayMutation"), objc_opt_class(), v9);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D01760], "serial");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "serviceClass:", 25);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v17;
          v25 = a2;
          v26 = (void *)BSDispatchQueueCreate();

          -[NSMutableDictionary setObject:forKey:](self->_rootIdentityToCADisplayQueueMap, "setObject:forKey:", v26, v9);
          a2 = v25;
          v17 = v24;
        }
        -[NSMutableDictionary objectForKey:](self->_rootIdentityToBlankingRemovesPower, "objectForKey:", v9);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
          -[SBDisplayManager _setBlankingRemovesPower:forDisplay:](self, "_setBlankingRemovesPower:forDisplay:", -[SBDisplayManager _shouldBlankingRemovePowerForDisplay:](self, "_shouldBlankingRemovePowerForDisplay:", v9), v9);
        SBLogDisplayControlling();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v28))
        {
          *(_DWORD *)buf = 138543362;
          v76 = v9;
          _os_signpost_emit_with_name_impl(&dword_1D0540000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_DISPLAY_MANAGER_ROOT_DISPLAY_CONNECTED", "%{public}@", buf, 0xCu);
        }

        if (objc_msgSend(v9, "isExternal"))
        {
          v29 = dispatch_time(0, 100000000);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __79__SBDisplayManager__connectToIdentity_withConfiguration_forDisplayManagerInit___block_invoke;
          block[3] = &unk_1E8E9F108;
          v68 = v16;
          v69 = v10;
          v70 = self;
          v71 = v9;
          dispatch_after(v29, MEMORY[0x1E0C80D38], block);

        }
        else
        {
          -[SBDisplayAssertionCoordinator activateAssertionsForDisplay:](self->_assertionCoordinator, "activateAssertionsForDisplay:", v9);
        }
      }
      v54 = v16;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v30 = self->_factories;
      v31 = -[NSHashTable countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
      if (v31)
      {
        v32 = v31;
        v52 = v17;
        v51 = a2;
        v13 = 0;
        v33 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v64 != v33)
              objc_enumerationMutation(v30);
            objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "displayControllerInfoForConnectingDisplay:configuration:", v9, v10);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              if (v13)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", v51, self, CFSTR("SBDisplayManager.m"), 294, CFSTR("multiple factories want to provide a controller for the same display: %@; how it started: %@; how it's going: %@"),
                  v9,
                  v13,
                  v35);

              }
              v36 = v35;

              v13 = v36;
            }

          }
          v32 = -[NSHashTable countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
        }
        while (v32);

        v17 = v52;
        if (v13)
          -[SBDisplayManager _connectControllerWithInfo:toDisplay:configuration:](self, "_connectControllerWithInfo:toDisplay:configuration:", v13, v9, v10);
      }
      else
      {

        v13 = 0;
      }
      os_unfair_lock_assert_not_owner(&self->_lock);
      os_unfair_lock_lock(&self->_lock);
      v38 = (void *)-[NSHashTable copy](self->_lock_observers, "copy");
      os_unfair_lock_unlock(&self->_lock);
      if (v17)
      {
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v53 = v38;
        v39 = v38;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v60;
          do
          {
            for (j = 0; j != v41; ++j)
            {
              if (*(_QWORD *)v60 != v42)
                objc_enumerationMutation(v39);
              v44 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v44, "displayManager:didConnectToRootDisplay:", self, v9);
            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
          }
          while (v41);
        }

        v38 = v53;
      }
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v45 = v38;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v56;
        do
        {
          for (k = 0; k != v47; ++k)
          {
            if (*(_QWORD *)v56 != v48)
              objc_enumerationMutation(v45);
            v50 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v50, "displayManager:didConnectIdentity:withConfiguration:", self, v9, v10);
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
        }
        while (v47);
      }

      v11 = v54;
    }
    goto LABEL_59;
  }
  SBLogDisplayControlling();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v76 = v9;
    v14 = "got a connect for an external display that is missing its hardwareIdentifier. ignoring: %{public}@";
    goto LABEL_22;
  }
LABEL_59:

}

uint64_t __79__SBDisplayManager__connectToIdentity_withConfiguration_forDisplayManagerInit___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isValid");
  if ((_DWORD)result)
  {
    SBLogDisplayAssertions();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "activating assertions for configuration: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "activateAssertionsForDisplay:", *(_QWORD *)(a1 + 56));
  }
  return result;
}

- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  objc_class *v17;
  __CFString *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  SBLogFBDisplayManagerCallbacks();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_sbLoggingDescription");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v10;
    v22 = 2114;
    v23 = v11;
    v24 = 2114;
    v25 = v7;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@\n\tconfiguration: %{public}@;\n\tidentity: %{public}@",
      (uint8_t *)&v20,
      0x20u);

  }
  objc_msgSend(v8, "hardwareIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if ((objc_msgSend(v8, "isMainDisplay") & 1) != 0)
      goto LABEL_8;
    SBLogFBDisplayManagerCallbacks();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      _SBFLoggingMethodProem();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544130;
      v21 = v19;
      v22 = 2114;
      v23 = CFSTR("updating");
      v24 = 2114;
      v25 = v7;
      v26 = 2114;
      v27 = v8;
      _os_log_error_impl(&dword_1D0540000, v12, OS_LOG_TYPE_ERROR, "%{public}@ told about a %{public}@ display with nil hardwareIdentifier. identity: %{public}@; configuration: %{public}@",
        (uint8_t *)&v20,
        0x2Au);

    }
  }

LABEL_8:
  -[NSMutableDictionary objectForKey:](self->_connectedIdentityToRecordMap, "objectForKey:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[NSMutableDictionary objectForKey:](self->_identityToControllerMap, "objectForKey:", v7);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      SBLogDisplayControlling();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        _SBFLoggingMethodProem();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[NSObject signpostDescription](v14, "signpostDescription");
        }
        else
        {
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
        }
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v20 = 138543874;
        v21 = v16;
        v22 = 2114;
        v23 = v18;
        v24 = 2114;
        v25 = v8;
        _os_log_debug_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ => %{public}@", (uint8_t *)&v20, 0x20u);

      }
      -[NSObject displayIdentityDidUpdate:configuration:](v14, "displayIdentityDidUpdate:configuration:", v7, v8);
    }
  }
  else
  {
    SBLogDisplayControlling();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138543362;
      v21 = v7;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "got an update for an identity that we aren't tracking. ignoring update: %{public}@", (uint8_t *)&v20, 0xCu);
    }
  }

}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  SEL v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  id v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[FBDisplayManager configurationForIdentity:](self->_displayManager, "configurationForIdentity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogFBDisplayManagerCallbacks();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_sbLoggingDescription");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v48 = v9;
    v49 = 2114;
    v50 = v10;
    v51 = 2114;
    v52 = v6;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@\n\tconfiguration: %{public}@;\n\tidentity: %{public}@",
      buf,
      0x20u);

  }
  objc_msgSend(v7, "hardwareIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if ((objc_msgSend(v7, "isMainDisplay") & 1) != 0)
      goto LABEL_8;
    SBLogFBDisplayManagerCallbacks();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      _SBFLoggingMethodProem();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v48 = v33;
      v49 = 2114;
      v50 = CFSTR("disconnecting");
      v51 = 2114;
      v52 = v6;
      v53 = 2114;
      v54 = v7;
      _os_log_error_impl(&dword_1D0540000, v11, OS_LOG_TYPE_ERROR, "%{public}@ told about a %{public}@ display with nil hardwareIdentifier. identity: %{public}@; configuration: %{public}@",
        buf,
        0x2Au);

    }
  }

LABEL_8:
  -[NSMutableDictionary objectForKey:](self->_connectedIdentityToRecordMap, "objectForKey:", v6);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    v35 = a2;
    v36 = (void *)v12;
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    v14 = (void *)-[NSHashTable copy](self->_lock_observers, "copy");
    os_unfair_lock_unlock(&self->_lock);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v42 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v20, "displayManager:willDisconnectIdentity:", self, v6);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v17);
    }

    -[NSMutableDictionary objectForKey:](self->_identityToControllerMap, "objectForKey:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[NSMapTable objectForKey:](self->_controllerToAssertionMap, "objectForKey:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDisplayAssertionCoordinator invalidateAssertionForDerivedDisplayDisconnect:](self->_assertionCoordinator, "invalidateAssertionForDerivedDisplayDisconnect:", v22);
      objc_msgSend(v21, "displayIdentityDidDisconnect:", v6);
      SBLogDisplayControlling();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v23))
      {
        -[SBDisplayManager _signpostMetadataForController:](self, "_signpostMetadataForController:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = v24;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_DISPLAY_MANAGER_CONTROLLER_TAKES_THE_WHEEL", "%{public}@", buf, 0xCu);

      }
      -[NSMutableDictionary removeObjectForKey:](self->_identityToControllerMap, "removeObjectForKey:", v6);
      -[NSMutableDictionary removeObjectForKey:](self->_identityToWindowingModeMap, "removeObjectForKey:", v6);
      -[NSMapTable removeObjectForKey:](self->_controllerToAssertionMap, "removeObjectForKey:", v21);

    }
    if (objc_msgSend(v6, "isRootIdentity"))
    {
      -[SBDisplayAssertionCoordinator rootDisplayDidDisconnect:](self->_assertionCoordinator, "rootDisplayDidDisconnect:", v6);
      -[NSMutableDictionary objectForKey:](self->_rootIdentityToLayoutPublisherMap, "objectForKey:", v6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", v35, self, CFSTR("SBDisplayManager.m"), 383, CFSTR("we don't have a publisher for a disconnecting display: %@"), v6);

      }
      -[SBDisplayManager _deactivateLayoutPublisher:forDisconnectingDisplay:](self, "_deactivateLayoutPublisher:forDisconnectingDisplay:", v25, v6);
      -[NSMutableDictionary removeObjectForKey:](self->_rootIdentityToLayoutPublisherMap, "removeObjectForKey:", v6);
      -[NSMutableDictionary removeObjectForKey:](self->_rootIdentityToCADisplayQueueMap, "removeObjectForKey:", v6);
      -[NSMutableDictionary removeObjectForKey:](self->_rootIdentityToBlankingRemovesPower, "removeObjectForKey:", v6);

    }
    objc_msgSend(v36, "invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_connectedIdentityToRecordMap, "removeObjectForKey:", v6);
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    v26 = (void *)-[NSHashTable copy](self->_lock_observers, "copy");

    os_unfair_lock_unlock(&self->_lock);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v27 = v26;
    v28 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v38 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v32, "displayManager:didDisconnectIdentity:", self, v6);
        }
        v29 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v29);
    }

    v13 = v36;
  }
  else
  {
    SBLogDisplayControlling();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v48 = v6;
      _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEFAULT, "got a disconnect for an identity that we aren't tracking. ignoring disconnect: %{public}@", buf, 0xCu);
    }
  }

}

- (void)assertionCoordinator:(id)a3 updatedAssertionPreferences:(id)a4 oldPreferences:(id)a5 forDisplay:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a6;
  v9 = a4;
  SBLogDisplayControlling();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v11;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ assertion preferences changed. reevaluating", (uint8_t *)&v17, 0xCu);

  }
  objc_msgSend(v9, "powerLogEntry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDisplayManager _setPowerLogEntry:forDisplay:](self, "_setPowerLogEntry:forDisplay:", v12, v8);

  objc_msgSend(v9, "displayArrangement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDisplayManager _setDisplayArrangementItem:forDisplay:](self, "_setDisplayArrangementItem:forDisplay:", v13, v8);

  -[SBDisplayManager _setCloneMirroringMode:forDisplay:](self, "_setCloneMirroringMode:forDisplay:", objc_msgSend(v9, "cloneMirroringMode"), v8);
  objc_msgSend(v9, "disableSystemIdleSleepReason");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBDisplayManager _setDisableIdleSleepReason:forDisplay:](self, "_setDisableIdleSleepReason:forDisplay:", v14, v8);
  SBLogDisplayControlling();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v16;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ assertion preferences changed. done reevaluating", (uint8_t *)&v17, 0xCu);

  }
}

- (void)cache:(id)a3 didUpdateActiveAudioRoute:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  SBLogDisplayControlling();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v7;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ activeAudioRoute %@", buf, 0x16u);

  }
  -[NSMutableDictionary allKeys](self->_rootIdentityToBlankingRemovesPower, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[SBDisplayManager _setBlankingRemovesPower:forDisplay:](self, "_setBlankingRemovesPower:forDisplay:", -[SBDisplayManager _shouldBlankingRemovePowerForDisplay:](self, "_shouldBlankingRemovePowerForDisplay:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12)), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (BOOL)_shouldBlankingRemovePowerForDisplay:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;

  if (objc_msgSend(a3, "isExternal"))
  {
    +[SBAVSystemControllerCache sharedInstance](SBAVSystemControllerCache, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isAudioSessionPlaying");
    objc_msgSend(v3, "activeAudioRoute");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      if ((objc_msgSend(v5, "isEqual:", CFSTR("HDMI")) & 1) != 0)
        LOBYTE(v7) = 0;
      else
        v7 = objc_msgSend(v6, "isEqual:", CFSTR("HDMIOutput")) ^ 1;
    }
    else
    {
      LOBYTE(v7) = 1;
    }

  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)_setBlankingRemovesPower:(BOOL)a3 forDisplay:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSMutableDictionary *rootIdentityToBlankingRemovesPower;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(v6, "isExternal"))
  {
    -[NSMutableDictionary objectForKey:](self->_rootIdentityToBlankingRemovesPower, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7 || objc_msgSend(v7, "BOOLValue") != v4)
    {
      rootIdentityToBlankingRemovesPower = self->_rootIdentityToBlankingRemovesPower;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](rootIdentityToBlankingRemovesPower, "setObject:forKey:", v10, v6);

      -[FBDisplayManager configurationForIdentity:](self->_displayManager, "configurationForIdentity:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hardwareIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogDisplayControlling();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        _SBFLoggingMethodProem();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138544898;
        v16 = v14;
        v17 = 2114;
        v18 = v6;
        v19 = 2114;
        v20 = v12;
        v21 = 1024;
        v22 = objc_msgSend(v6, "isMainDisplay");
        v23 = 1024;
        v24 = objc_msgSend(v6, "isExternal");
        v25 = 1024;
        v26 = objc_msgSend(v6, "isRootIdentity");
        v27 = 1024;
        v28 = v4;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ identity %{public}@ UUID %{public}@ main %d external %d root %d blankingRemovesPower %d", (uint8_t *)&v15, 0x38u);

      }
      BKSDisplayServicesSetBlankingRemovesPower();

    }
  }

}

- (void)_setDisplayArrangementItem:(id)a3 forDisplay:(id)a4
{
  unint64_t v6;
  id v7;
  uint64_t v8;
  NSMutableDictionary *rootIdentityToDisplayArrangementItems;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  FBDisplayManager *displayManager;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  id v30;
  NSMutableDictionary *obj;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_rootIdentityToDisplayArrangementItems, "objectForKey:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)v8, "isEqual:", v6) & 1) == 0 && v6 | v8)
  {
    rootIdentityToDisplayArrangementItems = self->_rootIdentityToDisplayArrangementItems;
    v30 = v7;
    if (v6)
      -[NSMutableDictionary setObject:forKey:](rootIdentityToDisplayArrangementItems, "setObject:forKey:", v6, v7);
    else
      -[NSMutableDictionary removeObjectForKey:](rootIdentityToDisplayArrangementItems, "removeObjectForKey:", v7);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_rootIdentityToDisplayArrangementItems, "count", v8));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = self->_rootIdentityToDisplayArrangementItems;
    v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
    if (v10)
    {
      v11 = v10;
      v33 = *(_QWORD *)v35;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v35 != v33)
            objc_enumerationMutation(obj);
          -[FBDisplayManager configurationForIdentity:](self->_displayManager, "configurationForIdentity:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "hardwareIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          displayManager = self->_displayManager;
          objc_msgSend((id)v6, "relativeDisplayIdentity");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[FBDisplayManager configurationForIdentity:](displayManager, "configurationForIdentity:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "hardwareIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v19 = objc_alloc(MEMORY[0x1E0D00C70]);
            v20 = objc_msgSend((id)v6, "edge");
            objc_msgSend((id)v6, "offset");
            v21 = objc_msgSend(v19, "initWithDisplayUUID:relativeToDisplayUUID:alongEdge:atOffset:", v14, v18, v20);
            objc_msgSend(v32, "addObject:", v21);
          }
          else
          {
            SBLogDisplayControlling();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              _SBFLoggingMethodProem();
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v39 = v22;
              v40 = 2114;
              v41 = v13;
              v42 = 2114;
              v43 = 0;
              v44 = 2114;
              v45 = v17;
              v46 = 2114;
              v47 = v18;
              _os_log_fault_impl(&dword_1D0540000, v21, OS_LOG_TYPE_FAULT, "%{public}@ got nil displayUUIDs, which shouldn't be happening for newly active assertions. rootDisplayConfig: %{public}@; rootDisplayUUID: %{public}@; relativeDisplayConfig: %{public}@; relativeDisplayUUID: %{public}@",
                buf,
                0x34u);

            }
          }

          ++v12;
        }
        while (v11 != v12);
        v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
      }
      while (v11);
    }

    SBLogDisplayControlling();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      v7 = v30;
      if (v24)
      {
        _SBFLoggingMethodProem();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v39 = v25;
        v40 = 2114;
        v41 = v30;
        v42 = 2114;
        v43 = v6;
        v44 = 2114;
        v45 = v32;
        v26 = "%{public}@ %{public}@ display arrangement item changed: %{public}@\n"
              "updating backboard with global arrangement: %{public}@";
        v27 = v23;
        v28 = 42;
LABEL_22:
        _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);

      }
    }
    else
    {
      v7 = v30;
      if (v24)
      {
        _SBFLoggingMethodProem();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v25;
        v40 = 2114;
        v41 = v30;
        v42 = 2114;
        v43 = (unint64_t)v32;
              "updating backboard with global arrangement: %{public}@";
        v27 = v23;
        v28 = 32;
        goto LABEL_22;
      }
    }

    BKSDisplayServicesSetArrangement();
    v8 = v29;
  }

}

- (void)_setPowerLogEntry:(id)a3 forDisplay:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "isRootIdentity") & 1) != 0)
  {
    if (v7)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayManager.m"), 502, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootIdentity isRootIdentity]"));

    if (v7)
      goto LABEL_6;
  }
  SBLogDisplayControlling();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SBDisplayManager _setPowerLogEntry:forDisplay:].cold.1((uint64_t)self, (uint64_t)a2, v9);

  -[FBDisplayManager configurationForIdentity:](self->_displayManager, "configurationForIdentity:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDisplayPowerLogEntry forDisplay:mode:zoom:](SBDisplayPowerLogEntry, "forDisplay:mode:zoom:", v10, 0, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
  -[SBDisplayPowerLogReporter reportPowerLogEntry:](self->_powerLogReporter, "reportPowerLogEntry:", v7);

}

- (void)_setCloneMirroringMode:(unint64_t)a3 forDisplay:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *rootIdentityToCloneMirroringMode;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if ((objc_msgSend(v7, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayManager.m"), 514, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootIdentity isRootIdentity]"));

  }
  -[NSMutableDictionary objectForKey:](self->_rootIdentityToCloneMirroringMode, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (!a3)
  {
    SBLogDisplayControlling();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      SBDisplayCloneMirroringModeDescription(0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v13;
      v31 = 2114;
      v32 = v14;

    }
    -[NSMutableDictionary objectForKey:](self->_rootIdentityToCloneMirroringModeTokens, "objectForKey:", v7);
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject invalidate](v15, "invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_rootIdentityToCloneMirroringMode, "removeObjectForKey:", v7);
    goto LABEL_18;
  }
  if (v9 != a3)
  {
    rootIdentityToCloneMirroringMode = self->_rootIdentityToCloneMirroringMode;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](rootIdentityToCloneMirroringMode, "setObject:forKey:", v11, v7);

    if (a3 != 1 && a3 != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayManager.m"), 535, CFSTR("unexpected mirroring mode: %lu"), a3);

    }
    if ((objc_msgSend(v7, "isMainDisplay") & 1) != 0)
    {
      SBLogDisplayControlling();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        _SBFLoggingMethodProem();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        SBDisplayCloneMirroringModeDescription(v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        SBDisplayCloneMirroringModeDescription(a3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = v17;
        v31 = 2114;
        v32 = v18;
        v33 = 2114;
        v34 = v19;

      }
    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_rootIdentityToCloneMirroringModeTokens, "objectForKey:", v7);
      v15 = objc_claimAutoreleasedReturnValue();
      -[FBDisplayManager configurationForIdentity:](self->_displayManager, "configurationForIdentity:", v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "hardwareIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogDisplayControlling();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        _SBFLoggingMethodProem();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        SBDisplayCloneMirroringModeDescription(v9);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        SBDisplayCloneMirroringModeDescription(a3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBKSDisplayServicesCloneMirroringMode();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v30 = v23;
        v31 = 2114;
        v32 = v24;
        v33 = 2114;
        v34 = v25;
        v35 = 2114;
        v36 = v26;

      }
      -[NSMutableDictionary setObject:forKey:](self->_rootIdentityToCloneMirroringModeTokens, "setObject:forKey:", v21, v7);
      -[NSObject invalidate](v15, "invalidate");

    }
LABEL_18:

  }
}

- (void)_setDisableIdleSleepReason:(id)a3 forDisplay:(id)a4
{
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableDictionary *rootIdentityToDisableSleepReasons;
  uint64_t v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  NSString *disableIdleSleepReason;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = (unint64_t)a3;
  v8 = a4;
  if ((objc_msgSend(v8, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayManager.m"), 558, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootIdentity isRootIdentity]"));

  }
  -[NSMutableDictionary objectForKey:](self->_rootIdentityToDisableSleepReasons, "objectForKey:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)v9, "isEqualToString:", v7) & 1) == 0 && v7 | v9)
  {
    v10 = -[NSMutableDictionary count](self->_rootIdentityToDisableSleepReasons, "count");
    rootIdentityToDisableSleepReasons = self->_rootIdentityToDisableSleepReasons;
    if (v7)
      -[NSMutableDictionary setObject:forKey:](rootIdentityToDisableSleepReasons, "setObject:forKey:", v7, v8);
    else
      -[NSMutableDictionary removeObjectForKey:](rootIdentityToDisableSleepReasons, "removeObjectForKey:", v8);
    v12 = -[NSMutableDictionary count](self->_rootIdentityToDisableSleepReasons, "count");
    -[NSMutableDictionary allValues](self->_rootIdentityToDisableSleepReasons, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("|"));
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D229A0], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v12)
      objc_msgSend(v16, "setSystemIdleSleepDisabled:forReason:", 1, v15);
    if (v10)
      objc_msgSend(v17, "setSystemIdleSleepDisabled:forReason:", 0, self->_disableIdleSleepReason);
    SBLogDisplayControlling();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v12 != 0;
      _SBFLoggingMethodProem();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v20;
      if (v9)
        v22 = (const __CFString *)v9;
      else
      v27 = 2114;
      if (v15)
        v21 = (const __CFString *)v15;
      v28 = v22;
      v29 = 2114;
      v30 = v21;
      v31 = 1024;
      v32 = v19;
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ idle sleep reason changed from %{public}@ to %{public}@; idle sleep disabled: %{BOOL}u",
        buf,
        0x26u);

    }
    disableIdleSleepReason = self->_disableIdleSleepReason;
    self->_disableIdleSleepReason = v15;

  }
}

- (void)_connectControllerWithInfo:(id)a3 toDisplay:(id)a4 configuration:(id)a5
{
  id v9;
  id v10;
  NSMutableDictionary *identityToControllerMap;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableDictionary *identityToWindowingModeMap;
  void *v22;
  void *v23;
  NSMutableDictionary *rootIdentityToCADisplayQueueMap;
  void *v25;
  void *v26;
  SBDisplayAssertionCoordinator *assertionCoordinator;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  identityToControllerMap = self->_identityToControllerMap;
  v36 = a5;
  -[NSMutableDictionary objectForKey:](identityToControllerMap, "objectForKey:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[NSMutableDictionary objectForKey:](self->_identityToWindowingModeMap, "objectForKey:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SBDisplayWindowingModeDescription(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayManager.m"), 589, CFSTR("already have a controller for display: %@; existing: %@; existingWindowingMode: %@; new: %@"),
      v10,
      v12,
      v16,
      v9);

  }
  v37 = (void *)v12;
  v17 = objc_msgSend(v9, "priorityLevel");
  if (!SBDisplayAssertionLevelIsValid(v17))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    SBDisplayAssertionLevelDescription(v17);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayManager.m"), 593, CFSTR("invalid priorityLevel: %@"), v35);

  }
  objc_msgSend(v9, "displayController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v9, "windowingMode");
  v20 = objc_msgSend(v9, "deactivationReasons");
  -[NSMutableDictionary setObject:forKey:](self->_identityToControllerMap, "setObject:forKey:", v18, v10);
  identityToWindowingModeMap = self->_identityToWindowingModeMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](identityToWindowingModeMap, "setObject:forKey:", v22, v10);

  -[SBSceneManagerCoordinator sceneManagerForDisplayIdentity:](self->_sceneManagerCoordinator, "sceneManagerForDisplayIdentity:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  rootIdentityToCADisplayQueueMap = self->_rootIdentityToCADisplayQueueMap;
  objc_msgSend(v10, "rootIdentity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](rootIdentityToCADisplayQueueMap, "objectForKey:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  assertionCoordinator = self->_assertionCoordinator;
  objc_msgSend(v10, "rootIdentity");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDisplayAssertionCoordinator acquireAssertionForDisplay:level:deactivationReasons:delegate:](assertionCoordinator, "acquireAssertionForDisplay:level:deactivationReasons:delegate:", v28, v17, v20, v18);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable setObject:forKey:](self->_controllerToAssertionMap, "setObject:forKey:", v29, v18);
  SBLogDisplayControlling();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v30))
  {
    -[SBDisplayManager _signpostMetadataForController:](self, "_signpostMetadataForController:", v18);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v31;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v30, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_DISPLAY_MANAGER_CONTROLLER_TAKES_THE_WHEEL", "%{public}@", buf, 0xCu);

  }
  SBLogDisplayControlling();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v33;
    v40 = 2114;
    v41 = v9;
    _os_log_impl(&dword_1D0540000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ connecting new controllerInfo: %{public}@", buf, 0x16u);

  }
  objc_msgSend(v18, "connectToDisplayIdentity:configuration:displayManager:sceneManager:caDisplayQueue:assertion:", v10, v36, self, v23, v26, v29);

}

- (id)_createAndActivateLayoutPublisherForConnectingDisplay:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;
  void *v11;

  v5 = a3;
  if ((objc_msgSend(v5, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayManager.m"), 612, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[connectingDisplay isRootIdentity]"));

  }
  if ((objc_msgSend(v5, "isMainDisplay") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D22910], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D230F8]);
    objc_msgSend(v7, "setDomainIdentifier:", CFSTR("com.apple.frontboard"));
    SBExternalDisplayLayoutServiceInstanceIdentifierForDisplay();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInstanceIdentifier:", v8);

    objc_msgSend(MEMORY[0x1E0D230F0], "publisherWithConfiguration:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayManager.m"), 619, CFSTR("failed to create publisher with config: %@"), v7);

    }
    objc_msgSend(v6, "activate");

  }
  return v6;
}

- (void)_deactivateLayoutPublisher:(id)a3 forDisconnectingDisplay:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayManager.m"), 629, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[disconnectingDisplay isRootIdentity]"), v13);

  }
  if ((objc_msgSend(v7, "isMainDisplay") & 1) == 0)
  {
    v8 = objc_opt_class();
    v9 = v13;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    objc_msgSend(v11, "invalidate");
  }

}

- (id)_signpostMetadataForController:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "signpostDescription");
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootIdentityToBlankingRemovesPower, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_identityToWindowingModeMap, 0);
  objc_storeStrong((id *)&self->_identityToControllerMap, 0);
  objc_storeStrong((id *)&self->_factories, 0);
  objc_storeStrong((id *)&self->_powerLogReporter, 0);
  objc_storeStrong((id *)&self->_rootIdentityToCloneMirroringModeTokens, 0);
  objc_storeStrong((id *)&self->_rootIdentityToCloneMirroringMode, 0);
  objc_storeStrong((id *)&self->_rootIdentityToDisplayArrangementItems, 0);
  objc_storeStrong((id *)&self->_rootIdentityToDisableSleepReasons, 0);
  objc_storeStrong((id *)&self->_disableIdleSleepReason, 0);
  objc_storeStrong((id *)&self->_controllerToAssertionMap, 0);
  objc_storeStrong((id *)&self->_rootIdentityToCADisplayQueueMap, 0);
  objc_storeStrong((id *)&self->_rootIdentityToLayoutPublisherMap, 0);
  objc_storeStrong((id *)&self->_connectedIdentityToRecordMap, 0);
  objc_storeStrong((id *)&self->_assertionCoordinator, 0);
  objc_storeStrong((id *)&self->_sceneManagerCoordinator, 0);
  objc_storeStrong((id *)&self->_displayManager, 0);
}

- (void)updateTransformsWithCompletion:(id)a3
{
  -[FBDisplayManager updateTransformsWithCompletion:](self->_displayManager, "updateTransformsWithCompletion:", a3);
}

- (NSArray)connectedIdentities
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_connectedIdentityToRecordMap, "allKeys");
}

- (FBSDisplayIdentity)mainIdentity
{
  return (FBSDisplayIdentity *)-[FBDisplayManager mainIdentity](self->_displayManager, "mainIdentity");
}

- (id)configurationForIdentity:(id)a3
{
  return (id)-[FBDisplayManager configurationForIdentity:](self->_displayManager, "configurationForIdentity:", a3);
}

- (void)_setPowerLogEntry:(NSObject *)a3 forDisplay:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ creating invalid PowerLog entry as we're probably going away", (uint8_t *)&v5, 0xCu);

}

@end
