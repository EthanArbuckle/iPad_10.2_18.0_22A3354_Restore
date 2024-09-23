@implementation SBExternalDisplayService

- (SBExternalDisplayService)initWithDisplayManager:(id)a3
{
  id v4;
  SBExternalDisplayServiceConnectionListenerFactory *v5;
  SBSConnectedDisplayInfoFactory *v6;
  SBExternalDisplayService *v7;

  v4 = a3;
  v5 = objc_alloc_init(SBExternalDisplayServiceConnectionListenerFactory);
  v6 = objc_alloc_init(SBSConnectedDisplayInfoFactory);
  v7 = -[SBExternalDisplayService initWithDisplayManager:serviceListenerFactory:connectedDisplayInfoFactory:](self, "initWithDisplayManager:serviceListenerFactory:connectedDisplayInfoFactory:", v4, v5, v6);

  return v7;
}

- (SBExternalDisplayService)initWithDisplayManager:(id)a3 serviceListenerFactory:(id)a4 connectedDisplayInfoFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBExternalDisplayService *v12;
  void *v13;
  uint64_t v14;
  SBExternalDisplayDefaults *defaults;
  uint64_t v16;
  BSInvalidatable *displayManagerObserverToken;
  uint64_t v18;
  OS_dispatch_queue *serviceQueue;
  uint64_t v20;
  _SBExternalDisplayServiceConnectionListening *serviceConnectionListener;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SBExternalDisplayService;
  v12 = -[SBExternalDisplayService init](&v23, sel_init);
  if (v12)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "externalDisplayDefaults");
    v14 = objc_claimAutoreleasedReturnValue();
    defaults = v12->_defaults;
    v12->_defaults = (SBExternalDisplayDefaults *)v14;

    objc_storeStrong((id *)&v12->_displayManager, a3);
    objc_storeStrong((id *)&v12->_connectedDisplayInfoFactory, a5);
    -[SBDisplayManager addObserver:](v12->_displayManager, "addObserver:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
    displayManagerObserverToken = v12->_displayManagerObserverToken;
    v12->_displayManagerObserverToken = (BSInvalidatable *)v16;

    v18 = BSDispatchQueueCreateWithQualityOfService();
    serviceQueue = v12->_serviceQueue;
    v12->_serviceQueue = (OS_dispatch_queue *)v18;

    v20 = objc_msgSend(v10, "newExternalDisplayServiceListenerForDelegate:serviceQueue:", v12, v12->_serviceQueue);
    serviceConnectionListener = v12->_serviceConnectionListener;
    v12->_serviceConnectionListener = (_SBExternalDisplayServiceConnectionListening *)v20;

    -[_SBExternalDisplayServiceConnectionListening activate](v12->_serviceConnectionListener, "activate");
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_displayManagerObserverToken, "invalidate");
  -[_SBExternalDisplayServiceConnectionListening invalidate](self->_serviceConnectionListener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBExternalDisplayService;
  -[SBExternalDisplayService dealloc](&v3, sel_dealloc);
}

- (id)preferredArrangementOfExternalDisplay:(id)a3
{
  SBDisplayManager *displayManager;
  id v5;
  void *v6;
  void *v7;

  displayManager = self->_displayManager;
  v5 = a3;
  -[SBDisplayManager mainIdentity](displayManager, "mainIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDisplayArrangementItem preferredArrangementOfDisplay:relativeTo:preferences:](SBDisplayArrangementItem, "preferredArrangementOfDisplay:relativeTo:preferences:", v5, v6, self->_defaults);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)preferredArrangementOfDisplay:(id)a3 relativeTo:(id)a4
{
  return +[SBDisplayArrangementItem preferredArrangementOfDisplay:relativeTo:preferences:](SBDisplayArrangementItem, "preferredArrangementOfDisplay:relativeTo:preferences:", a3, a4, self->_defaults);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  NSHashTable *observers;

  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
  if (!-[NSHashTable count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

  }
}

- (void)client:(id)a3 getConnectedDisplayInfoWithCompletion:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  BSDispatchMain();

}

void __73__SBExternalDisplayService_client_getConnectedDisplayInfoWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "connectedIdentities");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v5)
        objc_enumerationMutation(v2);
      v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
      if ((objc_msgSend(*(id *)(a1 + 32), "_identityParticipatesInExternalDisplayService:", v7, (_QWORD)v13) & 1) != 0)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v9 = *(id **)(a1 + 32);
    objc_msgSend(v9[3], "configurationForIdentity:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_displayInfoForDisplayIdentity:configuration:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(_QWORD *)(a1 + 40);
    if (!v11)
      goto LABEL_12;
    v17 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v12, 0);

  }
  else
  {
LABEL_9:

    v8 = *(_QWORD *)(a1 + 40);
LABEL_12:
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, MEMORY[0x1E0C9AA60], 0);
  }

}

- (void)client:(id)a3 setDisplayArrangement:(id)a4 forDisplay:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v12 = a5;
  v13 = v8;
  v9 = v8;
  v10 = v12;
  v11 = v7;
  BSDispatchMain();

}

void __68__SBExternalDisplayService_client_setDisplayArrangement_forDisplay___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  SBLogDisplayControlling();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v28 = v3;
    v29 = 2114;
    v30 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "SBExternalDisplayService: client %{public}@ is setting displayArrangement for display: %{public}@", buf, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v25 = 0;
  objc_msgSend(v5, "_extendedModeDisplayConfigurationForHardwareIdentifier:error:", v6, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;
  if (v7)
  {
    v9 = objc_msgSend(*(id *)(a1 + 56), "edge");
    objc_msgSend(*(id *)(a1 + 56), "offset");
    v11 = v10;
    if ((_DWORD)v9 != objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "arrangementEdge")
      || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "arrangementOffset"), v11 != v12))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "setArrangementEdge:", v9);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "setArrangementOffset:", v11);
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "copy", 0);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v22;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v22 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17++), "externalDisplayServiceDidUpdatePreferredDisplayArrangement:", *(_QWORD *)(a1 + 48));
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v15);
      }

      objc_msgSend(*(id *)(a1 + 48), "_notifyOfPropertyChangesForDisplayConfiguration:requestingClient:", v7, *(_QWORD *)(a1 + 32));
    }
  }
  else
  {
    SBLogDisplayControlling();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v28 = v19;
      v29 = 2114;
      v30 = v20;
      v31 = 2114;
      v32 = v8;
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "SBExternalDisplayService: client %{public}@ cannot set display arrangement for display: %{public}@ due to error: %{public}@", buf, 0x20u);
    }

  }
}

- (void)client:(id)a3 setDisplayMirroringEnabled:(id)a4 forDisplay:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a3;
  v11 = a4;
  v12 = a5;
  v8 = v12;
  v9 = v11;
  v10 = v7;
  BSDispatchMain();

}

void __73__SBExternalDisplayService_client_setDisplayMirroringEnabled_forDisplay___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  SBLogDisplayControlling();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v20 = v3;
    v21 = 1024;
    v22 = v4;
    v23 = 2114;
    v24 = v5;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "SBExternalDisplayService: client %{public}@ is setting mirroringEnabled %{BOOL}u for display: %{public}@", buf, 0x1Cu);
  }

  v7 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v18 = 0;
  objc_msgSend(v6, "_extendedModeDisplayConfigurationForHardwareIdentifier:error:", v7, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  if (v8)
  {
    v10 = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
    if ((_DWORD)v10 != objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 32), "isMirroringEnabled"))
    {
      SBLogDisplayControlling();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v20) = v10;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "SBExternalDisplayService: setting mirroringEnabled to: %{BOOL}u", buf, 8u);
      }

      +[SBDefaults localDefaults](SBDefaults, "localDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appSwitcherDefaults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShouldUpdateExternalDisplayMirroringWhenWindowManagementStyleUpdates:", 0);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 32), "setMirroringEnabled:", v10);
      objc_msgSend(*(id *)(a1 + 56), "_notifyOfPropertyChangesForDisplayConfiguration:requestingClient:", v8, *(_QWORD *)(a1 + 32));
    }
  }
  else
  {
    SBLogDisplayControlling();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
      v17 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v20 = v15;
      v21 = 1024;
      v22 = v16;
      v23 = 2114;
      v24 = v17;
      v25 = 2114;
      v26 = v9;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "SBExternalDisplayService: client %{public}@ cannot set mirroringEnabled %{BOOL}u for display: %{public}@ due to error: %{public}@", buf, 0x26u);
    }

  }
}

- (void)client:(id)a3 setDisplayModeSettings:(id)a4 forDisplay:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;

  v11 = a3;
  v12 = a4;
  v18 = v11;
  v19 = a5;
  v20 = v12;
  v21 = a6;
  v22 = a7;
  v13 = v22;
  v14 = v21;
  v15 = v12;
  v16 = v19;
  v17 = v11;
  BSDispatchMain();

}

void __95__SBExternalDisplayService_client_setDisplayModeSettings_forDisplay_options_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  SBLogDisplayControlling();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v24 = v3;
    v25 = 2114;
    v26 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "SBExternalDisplayService: client %{public}@ is setting displayMode settings for display: %{public}@", buf, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v22 = 0;
  objc_msgSend(v5, "_extendedModeDisplayConfigurationForHardwareIdentifier:error:", v6, &v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v22;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DA9D58], "withDisplay:useNativeSize:", v7, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "chamois"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportedScales");

    objc_msgSend(*(id *)(a1 + 56), "scale");
    if ((SBSDisplayScaleMaskFromScale() & ~v10) != 0)
    {
      v16 = CFSTR("<nil>");
      if (*(_QWORD *)(a1 + 40))
        v16 = *(const __CFString **)(a1 + 40);
      v29 = CFSTR("displayHardwareIdentifier");
      v30[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DAB710], 3, v14);
      v17 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v17;
    }
    else
    {
      v11 = objc_msgSend(*(id *)(a1 + 64), "integerValue");
      v12 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(MEMORY[0x1E0DA9D50], "forDisplay:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithObject:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v11 & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0DA9D50], "forDisplaysSimilarToDisplay:useNativeSize:", v7, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "chamois"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v15);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "setDisplayModeSettings:forDisplaysMatchingPredicates:", *(_QWORD *)(a1 + 56), v14);
      objc_msgSend(*(id *)(a1 + 48), "_notifyOfPropertyChangesForDisplayConfiguration:requestingClient:", v7, *(_QWORD *)(a1 + 32));
    }

  }
  if (v8)
  {
    SBLogDisplayControlling();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v24 = v19;
      v25 = 2114;
      v26 = v20;
      v27 = 2114;
      v28 = v8;
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "SBExternalDisplayService: client %{public}@ cannot set displayMode settings for display: %{public}@ due to error: %{public}@", buf, 0x20u);
    }

  }
  v21 = *(_QWORD *)(a1 + 72);
  if (v21)
    (*(void (**)(uint64_t, id))(v21 + 16))(v21, v8);

}

- (void)displayManager:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  if (-[SBExternalDisplayService _identityParticipatesInExternalDisplayService:](self, "_identityParticipatesInExternalDisplayService:", v9))
  {
    -[SBExternalDisplayService _displayInfoForDisplayIdentity:configuration:](self, "_displayInfoForDisplayIdentity:configuration:", v9, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SBExternalDisplayServiceConnectionListening notifyObserversExternalDisplayDidConnect:](self->_serviceConnectionListener, "notifyObserversExternalDisplayDidConnect:", v8);

  }
}

- (void)displayManager:(id)a3 willDisconnectIdentity:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (-[SBExternalDisplayService _identityParticipatesInExternalDisplayService:](self, "_identityParticipatesInExternalDisplayService:", v6))
  {
    objc_msgSend(v9, "configurationForIdentity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBExternalDisplayService _displayInfoForDisplayIdentity:configuration:](self, "_displayInfoForDisplayIdentity:configuration:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[_SBExternalDisplayServiceConnectionListening notifyObserversExternalDisplayWillDisconnect:](self->_serviceConnectionListener, "notifyObserversExternalDisplayWillDisconnect:", v8);
  }

}

- (BOOL)_identityParticipatesInExternalDisplayService:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isExternal")
    && (objc_msgSend(v3, "isContinuityDisplay") & 1) == 0
    && objc_msgSend(v3, "sb_displayWindowingMode") == 1;

  return v4;
}

- (id)_displayInfoForDisplayIdentity:(id)a3 configuration:(id)a4
{
  return -[SBSConnectedDisplayInfoFactory connectedDisplayInfoForDisplayConfiguration:externalDisplayDefaults:](self->_connectedDisplayInfoFactory, "connectedDisplayInfoForDisplayConfiguration:externalDisplayDefaults:", a4, self->_defaults);
}

- (id)_extendedModeDisplayConfigurationForHardwareIdentifier:(id)a3 error:(id *)a4
{
  __CFString *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  const __CFString *v27;
  const __CFString *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[SBDisplayManager connectedIdentities](self->_displayManager, "connectedIdentities");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v7)
  {
    v21 = a4;
    v8 = 0;
    v9 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[SBDisplayManager configurationForIdentity:](self->_displayManager, "configurationForIdentity:", v11, v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hardwareIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if (v14)
        {
          if (objc_msgSend(v11, "sb_displayWindowingMode") == 1)
          {
            v15 = v11;
            LOBYTE(v7) = 1;
            a4 = v21;
            goto LABEL_14;
          }
          v8 = 1;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v7)
        continue;
      break;
    }
    v12 = 0;
    v15 = 0;
    a4 = v21;
    LOBYTE(v7) = v8;
  }
  else
  {
    v12 = 0;
    v15 = 0;
  }
LABEL_14:

  if (a4 && !v12)
  {
    if (v6)
      v16 = v6;
    else
      v16 = CFSTR("<nil>");
    v27 = CFSTR("displayHardwareIdentifier");
    v28 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v7 & 1) != 0)
      v18 = 2;
    else
      v18 = 1;
    if (v15)
      v19 = 2;
    else
      v19 = v18;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DAB710], v19, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (void)_notifyOfPropertyChangesForDisplayConfiguration:(id)a3 requestingClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBExternalDisplayService _displayInfoForDisplayIdentity:configuration:](self, "_displayInfoForDisplayIdentity:configuration:", v8, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[_SBExternalDisplayServiceConnectionListening notifyObserversExternalDisplayDidUpdateProperties:requestingClient:](self->_serviceConnectionListener, "notifyObserversExternalDisplayDidUpdateProperties:requestingClient:", v9, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_displayManagerObserverToken, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_displayManager, 0);
  objc_storeStrong((id *)&self->_connectedDisplayInfoFactory, 0);
  objc_storeStrong((id *)&self->_serviceConnectionListener, 0);
}

@end
