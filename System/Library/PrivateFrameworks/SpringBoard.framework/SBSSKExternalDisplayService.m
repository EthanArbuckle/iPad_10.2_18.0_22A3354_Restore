@implementation SBSSKExternalDisplayService

- (SBSSKExternalDisplayService)init
{
  SBExternalDisplayServiceConnectionListenerFactory *v3;
  SBSConnectedDisplayInfoFactory *v4;
  void *v5;
  void *v6;
  SBSSKExternalDisplayService *v7;

  v3 = objc_alloc_init(SBExternalDisplayServiceConnectionListenerFactory);
  v4 = objc_alloc_init(SBSConnectedDisplayInfoFactory);
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "externalDisplayDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBSSKExternalDisplayService initWithServiceListenerFactory:connectedDisplayInfoFactory:defaults:](self, "initWithServiceListenerFactory:connectedDisplayInfoFactory:defaults:", v3, v4, v6);

  return v7;
}

- (SBSSKExternalDisplayService)initWithServiceListenerFactory:(id)a3 connectedDisplayInfoFactory:(id)a4 defaults:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBSSKExternalDisplayService *v11;
  SBSSKExternalDisplayService *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *rootToConnectedParticipants;
  uint64_t v15;
  OS_dispatch_queue *serviceQueue;
  uint64_t v17;
  _SBExternalDisplayServiceConnectionListening *serviceConnectionListener;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SBSSKExternalDisplayService;
  v11 = -[SBSSKExternalDisplayService init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_connectedDisplayInfoFactory, a4);
    objc_storeStrong((id *)&v12->_defaults, a5);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    rootToConnectedParticipants = v12->_rootToConnectedParticipants;
    v12->_rootToConnectedParticipants = v13;

    v15 = BSDispatchQueueCreateWithQualityOfService();
    serviceQueue = v12->_serviceQueue;
    v12->_serviceQueue = (OS_dispatch_queue *)v15;

    v17 = objc_msgSend(v8, "newExternalDisplayServiceListenerForDelegate:serviceQueue:", v12, v12->_serviceQueue);
    serviceConnectionListener = v12->_serviceConnectionListener;
    v12->_serviceConnectionListener = (_SBExternalDisplayServiceConnectionListening *)v17;

  }
  return v12;
}

- (void)activate
{
  -[_SBExternalDisplayServiceConnectionListening activate](self->_serviceConnectionListener, "activate");
}

- (void)dealloc
{
  objc_super v3;

  -[_SBExternalDisplayServiceConnectionListening invalidate](self->_serviceConnectionListener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSSKExternalDisplayService;
  -[SBSSKExternalDisplayService dealloc](&v3, sel_dealloc);
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

- (void)didConnectParticipant:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  SBSConnectedDisplayInfoFactory *connectedDisplayInfoFactory;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "displayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "rootIdentity");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSKExternalDisplayService.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSKExternalDisplayService.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rootIdentity"));

LABEL_3:
  -[NSMutableDictionary objectForKey:](self->_rootToConnectedParticipants, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "mutableCopy");

  v12 = (id)v11;
  if (!v11)
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v12, "addObject:", v5);
  -[NSMutableDictionary setObject:forKey:](self->_rootToConnectedParticipants, "setObject:forKey:", v12, v9);
  if (!v11 && objc_msgSend(v5, "isExtendedDisplayCapable"))
  {
    SBLogDisplayControlling();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v7;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService: connected extended display capable participant with identity: %{public}@", buf, 0xCu);
    }

    connectedDisplayInfoFactory = self->_connectedDisplayInfoFactory;
    objc_msgSend(v5, "displayConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSConnectedDisplayInfoFactory connectedDisplayInfoForDisplayConfiguration:externalDisplayDefaults:](connectedDisplayInfoFactory, "connectedDisplayInfoForDisplayConfiguration:externalDisplayDefaults:", v15, self->_defaults);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[_SBExternalDisplayServiceConnectionListening notifyObserversExternalDisplayDidConnect:](self->_serviceConnectionListener, "notifyObserversExternalDisplayDidConnect:", v16);
  }

}

- (void)willDisconnectParticipant:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *rootToConnectedParticipants;
  NSObject *v14;
  SBSConnectedDisplayInfoFactory *connectedDisplayInfoFactory;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "displayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "rootIdentity");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSKExternalDisplayService.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSKExternalDisplayService.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rootIdentity"));

LABEL_3:
  -[NSMutableDictionary objectForKey:](self->_rootToConnectedParticipants, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if ((objc_msgSend(v11, "containsObject:", v5) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSKExternalDisplayService.m"), 120, CFSTR("Why are we disconnecting an participant that we aren't tracking??"));

  }
  objc_msgSend(v11, "removeObject:", v5);
  v12 = objc_msgSend(v11, "count");
  rootToConnectedParticipants = self->_rootToConnectedParticipants;
  if (v12)
  {
    -[NSMutableDictionary setObject:forKey:](rootToConnectedParticipants, "setObject:forKey:", v11, v9);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](rootToConnectedParticipants, "removeObjectForKey:", v9);
    if (objc_msgSend(v5, "isExtendedDisplayCapable"))
    {
      SBLogDisplayControlling();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v7;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService: disconnected extended display capable participant with identity: %{public}@", buf, 0xCu);
      }

      connectedDisplayInfoFactory = self->_connectedDisplayInfoFactory;
      objc_msgSend(v5, "displayConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSConnectedDisplayInfoFactory connectedDisplayInfoForDisplayConfiguration:externalDisplayDefaults:](connectedDisplayInfoFactory, "connectedDisplayInfoForDisplayConfiguration:externalDisplayDefaults:", v16, self->_defaults);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[_SBExternalDisplayServiceConnectionListening notifyObserversExternalDisplayWillDisconnect:](self->_serviceConnectionListener, "notifyObserversExternalDisplayWillDisconnect:", v17);
    }
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

void __76__SBSSKExternalDisplayService_client_getConnectedDisplayInfoWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__83;
  v12 = __Block_byref_object_dispose__83;
  v13 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__SBSSKExternalDisplayService_client_getConnectedDisplayInfoWithCompletion___block_invoke_18;
  v7[3] = &unk_1E8EB5D18;
  v7[4] = v2;
  v7[5] = &v8;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v9[5];
  if (v5)
  {
    v14[0] = v9[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v6, 0);
  if (v5)

  _Block_object_dispose(&v8, 8);
}

void __76__SBSSKExternalDisplayService_client_getConnectedDisplayInfoWithCompletion___block_invoke_18(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "isExtendedDisplayCapable", (_QWORD)v17))
        {
          v12 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
          objc_msgSend(v11, "displayConfiguration");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "connectedDisplayInfoForDisplayConfiguration:externalDisplayDefaults:", v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v16 = *(void **)(v15 + 40);
          *(_QWORD *)(v15 + 40) = v14;

          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;

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

void __71__SBSSKExternalDisplayService_client_setDisplayArrangement_forDisplay___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService: client %{public}@ is setting displayArrangement for display: %{public}@", buf, 0x16u);
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
      v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "copy", 0);
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
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService: client %{public}@ cannot set display arrangement for display: %{public}@ due to error: %{public}@", buf, 0x20u);
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

void __76__SBSSKExternalDisplayService_client_setDisplayMirroringEnabled_forDisplay___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService: client %{public}@ is setting mirroringEnabled %{BOOL}u for display: %{public}@", buf, 0x1Cu);
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
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService: setting mirroringEnabled to: %{BOOL}u", buf, 8u);
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
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService: client %{public}@ cannot set mirroringEnabled %{BOOL}u for display: %{public}@ due to error: %{public}@", buf, 0x26u);
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

void __98__SBSSKExternalDisplayService_client_setDisplayModeSettings_forDisplay_options_completionHandler___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService: client %{public}@ is setting displayMode settings for display: %{public}@", buf, 0x16u);
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
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "SBSSKExternalDisplayService  : client %{public}@ cannot set displayMode settings for display: %{public}@ due to error: %{public}@", buf, 0x20u);
    }

  }
  v21 = *(_QWORD *)(a1 + 72);
  if (v21)
    (*(void (**)(uint64_t, id))(v21 + 16))(v21, v8);

}

- (id)_extendedModeDisplayConfigurationForHardwareIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  NSMutableDictionary *rootToConnectedParticipants;
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  __CFString *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  const __CFString *v38;
  const __CFString *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__83;
  v36 = __Block_byref_object_dispose__83;
  v37 = 0;
  rootToConnectedParticipants = self->_rootToConnectedParticipants;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __92__SBSSKExternalDisplayService__extendedModeDisplayConfigurationForHardwareIdentifier_error___block_invoke;
  v29[3] = &unk_1E8EB5D40;
  v7 = (__CFString *)v5;
  v30 = v7;
  v31 = &v32;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](rootToConnectedParticipants, "enumerateKeysAndObjectsUsingBlock:", v29);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = (id)v33[5];
  v9 = 0;
  v10 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "displayConfiguration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "sb_displayWindowingMode") == 1;

        if (v16)
        {
          objc_msgSend(v13, "displayConfiguration");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
        if (objc_msgSend(v13, "isExtendedDisplayCapable"))
        {
          objc_msgSend(v13, "displayConfiguration");
          v17 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v17;
        }
      }
      v10 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

  if (a4 && !v10)
  {
    if (v7)
      v18 = v7;
    else
      v18 = CFSTR("<nil>");
    v38 = CFSTR("displayHardwareIdentifier");
    v39 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33[5])
    {
      if (v9)
      {
LABEL_23:

        goto LABEL_24;
      }
      v20 = 2;
    }
    else
    {
      v20 = 1;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DAB710], v20, v19);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
LABEL_24:
  if (v10)
    v21 = v10;
  else
    v21 = v9;
  v22 = v21;

  _Block_object_dispose(&v32, 8);
  return v22;
}

void __92__SBSSKExternalDisplayService__extendedModeDisplayConfigurationForHardwareIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "hardwareIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v10)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
      *a4 = 1;
    }
  }

}

- (void)_notifyOfPropertyChangesForDisplayConfiguration:(id)a3 requestingClient:(id)a4
{
  SBSConnectedDisplayInfoFactory *connectedDisplayInfoFactory;
  SBExternalDisplayDefaults *defaults;
  id v8;
  id v9;

  connectedDisplayInfoFactory = self->_connectedDisplayInfoFactory;
  defaults = self->_defaults;
  v8 = a4;
  -[SBSConnectedDisplayInfoFactory connectedDisplayInfoForDisplayConfiguration:externalDisplayDefaults:](connectedDisplayInfoFactory, "connectedDisplayInfoForDisplayConfiguration:externalDisplayDefaults:", a3, defaults);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_SBExternalDisplayServiceConnectionListening notifyObserversExternalDisplayDidUpdateProperties:requestingClient:](self->_serviceConnectionListener, "notifyObserversExternalDisplayDidUpdateProperties:requestingClient:", v9, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_rootToConnectedParticipants, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_connectedDisplayInfoFactory, 0);
  objc_storeStrong((id *)&self->_serviceConnectionListener, 0);
}

@end
