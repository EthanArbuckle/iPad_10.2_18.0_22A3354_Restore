@implementation TIInputModeAssetStatusManager

- (TIInputModeAssetStatusManager)init
{
  TIInputModeAssetStatusManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIInputModeAssetStatusManager;
  result = -[TIInputModeAssetStatusManager init](&v3, sel_init);
  if (result)
    result->_assetStatusMapLock._os_unfair_lock_opaque = 0;
  return result;
}

- (TILinguisticAssetDownloadClient)client
{
  TILinguisticAssetDownloadClient *client;
  TILinguisticAssetDownloadClient *v4;
  TILinguisticAssetDownloadClient *v5;

  client = self->_client;
  if (!client)
  {
    v4 = objc_alloc_init(TILinguisticAssetDownloadClient);
    v5 = self->_client;
    self->_client = v4;

    client = self->_client;
  }
  return client;
}

- (NSMutableSet)listeners
{
  NSMutableSet *listeners;
  NSMutableSet *v4;
  NSMutableSet *v5;

  listeners = self->_listeners;
  if (!listeners)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_listeners;
    self->_listeners = v4;

    listeners = self->_listeners;
  }
  return listeners;
}

- (NSMutableSet)debuggingTimers
{
  NSMutableSet *debuggingTimers;
  NSMutableSet *v4;
  NSMutableSet *v5;

  debuggingTimers = self->_debuggingTimers;
  if (!debuggingTimers)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_debuggingTimers;
    self->_debuggingTimers = v4;

    debuggingTimers = self->_debuggingTimers;
  }
  return debuggingTimers;
}

- (NSMutableDictionary)inputModeToAssetStatusMap
{
  NSMutableDictionary *inputModeToAssetStatusMap;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  inputModeToAssetStatusMap = self->_inputModeToAssetStatusMap;
  if (!inputModeToAssetStatusMap)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_inputModeToAssetStatusMap;
    self->_inputModeToAssetStatusMap = v4;

    inputModeToAssetStatusMap = self->_inputModeToAssetStatusMap;
  }
  return inputModeToAssetStatusMap;
}

- (void)lockAccessToAssetStatusMap
{
  os_unfair_lock_lock(&self->_assetStatusMapLock);
}

- (void)unlockAccessToAssetStatusMap
{
  os_unfair_lock_unlock(&self->_assetStatusMapLock);
}

- (void)updateListenerOnMainThread:(id)a3 status:(int64_t)a4 inputModeName:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  TIInputModeAssetStatusManager *v18;
  id v19;
  int64_t v20;

  v8 = a3;
  v9 = a5;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __81__TIInputModeAssetStatusManager_updateListenerOnMainThread_status_inputModeName___block_invoke;
  v16 = &unk_1E243B038;
  v10 = v8;
  v17 = v10;
  v18 = self;
  v20 = a4;
  v11 = v9;
  v19 = v11;
  v12 = (void (**)(_QWORD))MEMORY[0x18D783768](&v13);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v13, v14, v15, v16))
    v12[2](v12);
  else
    TIDispatchSync(MEMORY[0x1E0C80D38], v12);

}

- (void)updateAssetStatus:(int64_t)a3 forInputMode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[TIInputModeAssetStatusManager lockAccessToAssetStatusMap](self, "lockAccessToAssetStatusMap");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIInputModeAssetStatusManager inputModeToAssetStatusMap](self, "inputModeToAssetStatusMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

  -[TIInputModeAssetStatusManager unlockAccessToAssetStatusMap](self, "unlockAccessToAssetStatusMap");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[TIInputModeAssetStatusManager listeners](self, "listeners", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[TIInputModeAssetStatusManager updateListenerOnMainThread:status:inputModeName:](self, "updateListenerOnMainThread:status:inputModeName:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), a3, v6);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (id)dummyFilePathForInputMode:(id)a3 assetStatus:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  TIInputModeGetNormalizedIdentifier(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((unint64_t)a4 <= 2)
  {
    objc_msgSend(v5, "stringByAppendingString:", off_1E243B0C8[a4]);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v8 = (void *)MEMORY[0x1E0C99E98];
  v13[0] = CFSTR("/var/mobile/Library/Keyboard/");
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileURLWithPathComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)addDebuggingTimerForInputMode:(id)a3 status:(int64_t)a4 duration:(double)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("TIInputModeDebugging");
  v14[1] = CFSTR("TIInputModeAssetStatus");
  v15[0] = a3;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a3;
  objc_msgSend(v8, "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_debuggingTimerFired_, v11, 0, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIInputModeAssetStatusManager debuggingTimers](self, "debuggingTimers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v12);

}

- (void)debuggingTimerFired:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TIInputModeDebugging"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TIInputModeAssetStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  -[TIInputModeAssetStatusManager updateAssetStatus:forInputMode:](self, "updateAssetStatus:forInputMode:", v6, v4);
}

- (id)normalizedInputModesForInputModes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        TIInputModeGetNormalizedIdentifier(*(void **)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)addedInputModesForInputModes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIInputModeAssetStatusManager lockAccessToAssetStatusMap](self, "lockAccessToAssetStatusMap");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        -[TIInputModeAssetStatusManager inputModeToAssetStatusMap](self, "inputModeToAssetStatusMap", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          -[TIInputModeAssetStatusManager inputModeToAssetStatusMap](self, "inputModeToAssetStatusMap");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E24C05F8, v11);

          objc_msgSend(v5, "addObject:", v11);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  -[TIInputModeAssetStatusManager unlockAccessToAssetStatusMap](self, "unlockAccessToAssetStatusMap");
  return v5;
}

- (id)inputModesToRemoveForInputModes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIInputModeAssetStatusManager lockAccessToAssetStatusMap](self, "lockAccessToAssetStatusMap");
  -[TIInputModeAssetStatusManager inputModeToAssetStatusMap](self, "inputModeToAssetStatusMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIInputModeAssetStatusManager unlockAccessToAssetStatusMap](self, "unlockAccessToAssetStatusMap");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v8, "containsObject:", v14, (_QWORD)v16) & 1) == 0)
          objc_msgSend(v5, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v5;
}

- (id)inputModesCurrentlyInProgressOrAvailable
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIInputModeAssetStatusManager lockAccessToAssetStatusMap](self, "lockAccessToAssetStatusMap");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TIInputModeAssetStatusManager inputModeToAssetStatusMap](self, "inputModeToAssetStatusMap", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[TIInputModeAssetStatusManager inputModeToAssetStatusMap](self, "inputModeToAssetStatusMap");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedIntValue");

        if ((v13 - 1) <= 1)
          objc_msgSend(v3, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  -[TIInputModeAssetStatusManager unlockAccessToAssetStatusMap](self, "unlockAccessToAssetStatusMap");
  return v3;
}

- (void)refetchStatusForInputModesCurrentlyInProgressOrAvailable
{
  id v3;

  -[TIInputModeAssetStatusManager inputModesCurrentlyInProgressOrAvailable](self, "inputModesCurrentlyInProgressOrAvailable");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TIInputModeAssetStatusManager startMonitoringAssetUpdateStatusForInputModes:includeExisting:](self, "startMonitoringAssetUpdateStatusForInputModes:includeExisting:", v3, 1);

}

- (void)addListener:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIInputModeAssetStatusManager listeners](self, "listeners");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeListener:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIInputModeAssetStatusManager listeners](self, "listeners");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (int64_t)assetStatusForInputMode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  TIInputModeGetNormalizedIdentifier(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TIInputModeAssetStatusManager lockAccessToAssetStatusMap](self, "lockAccessToAssetStatusMap");
    -[TIInputModeAssetStatusManager inputModeToAssetStatusMap](self, "inputModeToAssetStatusMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    -[TIInputModeAssetStatusManager unlockAccessToAssetStatusMap](self, "unlockAccessToAssetStatusMap");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)startMonitoringAssetUpdateStatusForInputModes:(id)a3 includeExisting:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[6];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v4 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  -[TIInputModeAssetStatusManager normalizedInputModesForInputModes:](self, "normalizedInputModesForInputModes:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  -[TIInputModeAssetStatusManager addedInputModesForInputModes:](self, "addedInputModesForInputModes:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  -[TIInputModeAssetStatusManager inputModesToRemoveForInputModes:](self, "inputModesToRemoveForInputModes:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIInputModeAssetStatusManager lockAccessToAssetStatusMap](self, "lockAccessToAssetStatusMap");
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v48 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        -[TIInputModeAssetStatusManager inputModeToAssetStatusMap](self, "inputModeToAssetStatusMap");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeObjectForKey:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v11);
  }
  v31 = v9;

  -[TIInputModeAssetStatusManager unlockAccessToAssetStatusMap](self, "unlockAccessToAssetStatusMap");
  v32 = (void *)v7;
  v33 = (void *)v6;
  if (v4)
    v16 = (void *)v6;
  else
    v16 = (void *)v7;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v16;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v36)
  {
    v35 = *(_QWORD *)v44;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v44 != v35)
          objc_enumerationMutation(obj);
        v37 = v17;
        v18 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v17);
        -[TIInputModeAssetStatusManager lockAccessToAssetStatusMap](self, "lockAccessToAssetStatusMap");
        -[TIInputModeAssetStatusManager inputModeToAssetStatusMap](self, "inputModeToAssetStatusMap");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          -[TIInputModeAssetStatusManager inputModeToAssetStatusMap](self, "inputModeToAssetStatusMap");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E24C05F8, v18);

        }
        -[TIInputModeAssetStatusManager unlockAccessToAssetStatusMap](self, "unlockAccessToAssetStatusMap");
        if (-[TIInputModeAssetStatusManager usesDummyFileDebugging](self, "usesDummyFileDebugging"))
        {
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v22 = objc_msgSend(&unk_1E24B06C0, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v40;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v40 != v24)
                  objc_enumerationMutation(&unk_1E24B06C0);
                v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
                objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[TIInputModeAssetStatusManager dummyFilePathForInputMode:assetStatus:](self, "dummyFilePathForInputMode:assetStatus:", v18, objc_msgSend(v26, "unsignedIntegerValue"));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v27, "fileExistsAtPath:", v28);

                if (v29)
                  -[TIInputModeAssetStatusManager addDebuggingTimerForInputMode:status:duration:](self, "addDebuggingTimerForInputMode:status:duration:", v18, objc_msgSend(v26, "unsignedIntegerValue"), 0.04);
              }
              v23 = objc_msgSend(&unk_1E24B06C0, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
            }
            while (v23);
          }
        }
        else
        {
          -[TIInputModeAssetStatusManager client](self, "client");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __95__TIInputModeAssetStatusManager_startMonitoringAssetUpdateStatusForInputModes_includeExisting___block_invoke;
          v38[3] = &unk_1E243B060;
          v38[4] = v18;
          v38[5] = self;
          objc_msgSend(v30, "fetchAssetUpdateStatusForInputModeIdentifier:callback:", v18, v38);

        }
        v17 = v37 + 1;
      }
      while (v37 + 1 != v36);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v36);
  }

}

- (void)startMonitoringAssetUpdateStatusForInputModes:(id)a3
{
  -[TIInputModeAssetStatusManager startMonitoringAssetUpdateStatusForInputModes:includeExisting:](self, "startMonitoringAssetUpdateStatusForInputModes:includeExisting:", a3, 0);
}

- (void)startDownloadingAssetsForInputMode:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  TIInputModeGetNormalizedIdentifier(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TIInputModeAssetStatusManager updateAssetStatus:forInputMode:](self, "updateAssetStatus:forInputMode:", 2, v4);
    if (-[TIInputModeAssetStatusManager usesDummyFileDebugging](self, "usesDummyFileDebugging"))
    {
      -[TIInputModeAssetStatusManager addDebuggingTimerForInputMode:status:duration:](self, "addDebuggingTimerForInputMode:status:duration:", v4, 0, 10.0);
    }
    else
    {
      -[TIInputModeAssetStatusManager client](self, "client");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __68__TIInputModeAssetStatusManager_startDownloadingAssetsForInputMode___block_invoke;
      v6[3] = &unk_1E243B088;
      v6[4] = self;
      v7 = v4;
      objc_msgSend(v5, "updateAssetForInputModeIdentifier:callback:", v7, v6);

    }
  }

}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (void)setInputModeToAssetStatusMap:(id)a3
{
  objc_storeStrong((id *)&self->_inputModeToAssetStatusMap, a3);
}

- (BOOL)usesDummyFileDebugging
{
  return self->_usesDummyFileDebugging;
}

- (void)setUsesDummyFileDebugging:(BOOL)a3
{
  self->_usesDummyFileDebugging = a3;
}

- (void)setDebuggingTimers:(id)a3
{
  objc_storeStrong((id *)&self->_debuggingTimers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debuggingTimers, 0);
  objc_storeStrong((id *)&self->_inputModeToAssetStatusMap, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

void __68__TIInputModeAssetStatusManager_startDownloadingAssetsForInputMode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("DDSAssetDownloadUIErrorDomain")))
  {
    v7 = objc_msgSend(v5, "code");

    if (v7 == 3)
    {
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 2;
      goto LABEL_10;
    }
  }
  else
  {

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 136315650;
    v13 = "-[TIInputModeAssetStatusManager startDownloadingAssetsForInputMode:]_block_invoke";
    v14 = 2112;
    v15 = v11;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_18C56E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Updating assets for %@ failed with error %@", (uint8_t *)&v12, 0x20u);
  }
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = 1;
LABEL_10:
  objc_msgSend(v8, "updateAssetStatus:forInputMode:", v10, v9);
  objc_msgSend(*(id *)(a1 + 32), "refetchStatusForInputModesCurrentlyInProgressOrAvailable");

}

void __95__TIInputModeAssetStatusManager_startMonitoringAssetUpdateStatusForInputModes_includeExisting___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 136315650;
      v8 = "-[TIInputModeAssetStatusManager startMonitoringAssetUpdateStatusForInputModes:includeExisting:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_18C56E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Fetching asset update status for %@ failed with error %@", (uint8_t *)&v7, 0x20u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "updateAssetStatus:forInputMode:", a2, *(_QWORD *)(a1 + 32));
  }

}

uint64_t __81__TIInputModeAssetStatusManager_updateListenerOnMainThread_status_inputModeName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "manager:didUpdateStatus:forInputMode:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

+ (id)sharedManager
{
  if (sharedManager___onceToken != -1)
    dispatch_once(&sharedManager___onceToken, &__block_literal_global_8290);
  return (id)sharedManager___sharedManager;
}

void __46__TIInputModeAssetStatusManager_sharedManager__block_invoke()
{
  TIInputModeAssetStatusManager *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  v0 = objc_alloc_init(TIInputModeAssetStatusManager);
  v1 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v0;

  if (TIGetUseTestFilesForAssetDownloadingTestingValue_onceToken != -1)
    dispatch_once(&TIGetUseTestFilesForAssetDownloadingTestingValue_onceToken, &__block_literal_global_94);
  +[TIPreferencesController sharedPreferencesController](TIPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForPreferenceKey:", CFSTR("UseTestFilesForAssetDownloadingTesting"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v4, "BOOLValue");
  objc_msgSend((id)sharedManager___sharedManager, "setUsesDummyFileDebugging:", v3);

}

@end
