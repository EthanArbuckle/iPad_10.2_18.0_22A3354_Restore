@implementation NCModeManager

- (NCModeManager)init
{
  NCModeManager *v2;
  void *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;
  DNDStateService *stateService;
  uint64_t v9;
  DNDModeConfigurationService *modeConfigurationService;
  DNDModeConfiguration *currentModeConfiguration;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NCModeManager;
  v2 = -[NCModeManager init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.internal.NotificationsUITool"));

    if (v5)
      v6 = CFSTR("com.apple.internal.NotificationsUITool.NCModeManager");
    else
      v6 = CFSTR("com.apple.springboard.NCModeManager");
    objc_msgSend(MEMORY[0x1E0D1D758], "serviceForClientIdentifier:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    stateService = v2->_stateService;
    v2->_stateService = (DNDStateService *)v7;

    -[DNDStateService addStateUpdateListener:withCompletionHandler:](v2->_stateService, "addStateUpdateListener:withCompletionHandler:", v2, 0);
    objc_msgSend(MEMORY[0x1E0D1D688], "serviceForClientIdentifier:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    modeConfigurationService = v2->_modeConfigurationService;
    v2->_modeConfigurationService = (DNDModeConfigurationService *)v9;

    -[DNDModeConfigurationService addListener:withCompletionHandler:](v2->_modeConfigurationService, "addListener:withCompletionHandler:", v2, 0);
    currentModeConfiguration = v2->_currentModeConfiguration;
    v2->_currentModeConfiguration = 0;

    -[NCModeManager _fetchCurrentModeConfiguration](v2, "_fetchCurrentModeConfiguration");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[DNDModeConfigurationService removeListener:](self->_modeConfigurationService, "removeListener:", self);
  v3.receiver = self;
  v3.super_class = (Class)NCModeManager;
  -[NCModeManager dealloc](&v3, sel_dealloc);
}

- (id)currentModeConfiguration
{
  return self->_currentModeConfiguration;
}

- (void)setModeConfiguration:(id)a3
{
  DNDModeConfigurationService *modeConfigurationService;
  uint64_t v4;

  modeConfigurationService = self->_modeConfigurationService;
  v4 = 0;
  -[DNDModeConfigurationService setModeConfiguration:error:](modeConfigurationService, "setModeConfiguration:error:", a3, &v4);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v9 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v9);
    -[NCModeManager currentModeConfiguration](self, "currentModeConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modeManager:didUpdateCurrentModeConfiguration:previousModeConfiguration:", self, v8, 0);

    v4 = v9;
  }

}

- (void)removeObserver:(id)a3
{
  NSHashTable *observers;

  if (a3)
  {
    observers = self->_observers;
    if (observers)
      -[NSHashTable removeObject:](observers, "removeObject:");
  }
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeModeConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "previousState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "activeModeConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCModeManager _updateWithModeConfiguration:previousModeConfiguration:](self, "_updateWithModeConfiguration:previousModeConfiguration:", v9, v8);
}

- (void)_fetchCurrentModeConfiguration
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__NCModeManager__fetchCurrentModeConfiguration__block_invoke;
  block[3] = &unk_1E8D1B568;
  block[4] = self;
  dispatch_async(v3, block);

}

void __47__NCModeManager__fetchCurrentModeConfiguration__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = 0;
  objc_msgSend(v2, "queryCurrentStateWithError:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  objc_msgSend(v3, "activeModeConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_updateWithModeConfiguration:previousModeConfiguration:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

}

- (void)_updateWithModeConfiguration:(id)a3 previousModeConfiguration:(id)a4
{
  DNDModeConfiguration *v7;
  id v8;
  _QWORD block[5];
  DNDModeConfiguration *v10;
  id v11;

  v7 = (DNDModeConfiguration *)a3;
  v8 = a4;
  if (self->_currentModeConfiguration != v7)
  {
    objc_storeStrong((id *)&self->_currentModeConfiguration, a3);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__NCModeManager__updateWithModeConfiguration_previousModeConfiguration___block_invoke;
    block[3] = &unk_1E8D1D8C0;
    block[4] = self;
    v10 = v7;
    v11 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __72__NCModeManager__updateWithModeConfiguration_previousModeConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__NCModeManager__updateWithModeConfiguration_previousModeConfiguration___block_invoke_2;
  v3[3] = &unk_1E8D1F3E8;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_notifyObserversWithBlock:", v3);

}

uint64_t __72__NCModeManager__updateWithModeConfiguration_previousModeConfiguration___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "modeManager:didUpdateCurrentModeConfiguration:previousModeConfiguration:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_notifyObserversWithBlock:(id)a3
{
  void (**v4)(id, NCModeManager *, _QWORD);
  NSHashTable *observers;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id location;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, NCModeManager *, _QWORD))a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v6 = (id)-[NSHashTable copy](observers, "copy");
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v14;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v14 != v8)
              objc_enumerationMutation(v6);
            v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
            v11 = objc_initWeak(&location, self);
            v4[2](v4, self, v10);

            objc_destroyWeak(&location);
            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v7);
      }

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentModeConfiguration, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_modeConfigurationService, 0);
  objc_storeStrong((id *)&self->_stateService, 0);
}

@end
