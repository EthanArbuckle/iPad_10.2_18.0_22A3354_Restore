@implementation SiriLongPressButtonConfigurationUpdateManager

- (SiriLongPressButtonConfigurationUpdateManager)init
{
  SiriLongPressButtonConfigurationUpdateManager *v2;
  uint64_t v3;
  NSMapTable *delegatesBySource;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriLongPressButtonConfigurationUpdateManager;
  v2 = -[SiriLongPressButtonConfigurationUpdateManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    delegatesBySource = v2->_delegatesBySource;
    v2->_delegatesBySource = (NSMapTable *)v3;

    v2->_currentLongPressBehavior = 0;
  }
  return v2;
}

- (void)dealloc
{
  NSUserDefaults *internalUserDefaults;
  objc_super v4;

  internalUserDefaults = self->_internalUserDefaults;
  if (internalUserDefaults)
    -[NSUserDefaults removeObserver:forKeyPath:](internalUserDefaults, "removeObserver:forKeyPath:", self, CFSTR("SiriHardwareButtonLongPressBehavior"));
  v4.receiver = self;
  v4.super_class = (Class)SiriLongPressButtonConfigurationUpdateManager;
  -[SiriLongPressButtonConfigurationUpdateManager dealloc](&v4, sel_dealloc);
}

- (void)startManagingConfigurationFromSource:(id)a3 withDelegate:(id)a4
{
  id v6;
  void *v7;
  int64_t currentLongPressBehavior;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!self->_monitoringForUpdates)
    -[SiriLongPressButtonConfigurationUpdateManager _setupKVOMonitoring](self, "_setupKVOMonitoring");
  -[SiriLongPressButtonConfigurationUpdateManager _addDelegate:forSource:](self, "_addDelegate:forSource:", v6, v9);
  objc_msgSend(v9, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("#configurationUpdateManager longPressBehavior: %ld previousValue: %ld"), self->_currentLongPressBehavior, objc_msgSend(v7, "longPressBehavior"));
  if (v7)
  {
    currentLongPressBehavior = self->_currentLongPressBehavior;
    if (currentLongPressBehavior != objc_msgSend(v7, "longPressBehavior"))
    {
      objc_msgSend(v7, "setLongPressBehavior:", self->_currentLongPressBehavior);
      objc_msgSend(v9, "setConfiguration:", v7);
      objc_msgSend(v6, "configurationUpdateManager:configurationDidUpdateForLongPressSource:", self, v9);
    }
  }

}

- (void)stopManagingConfigurationFromSource:(id)a3
{
  id v4;
  NSUInteger v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    -[NSMapTable removeObjectForKey:](self->_delegatesBySource, "removeObjectForKey:", v4);
    v5 = -[NSMapTable count](self->_delegatesBySource, "count");
    v4 = v6;
    if (!v5)
    {
      -[SiriLongPressButtonConfigurationUpdateManager _stopKVOMonitoring](self, "_stopKVOMonitoring");
      v4 = v6;
    }
  }

}

- (void)stopManagingAllConfigurations
{
  NSUserDefaults *internalUserDefaults;

  -[NSMapTable removeAllObjects](self->_delegatesBySource, "removeAllObjects");
  -[SiriLongPressButtonConfigurationUpdateManager _stopKVOMonitoring](self, "_stopKVOMonitoring");
  internalUserDefaults = self->_internalUserDefaults;
  self->_internalUserDefaults = 0;

}

- (id)userDefaults
{
  NSUserDefaults *internalUserDefaults;
  NSUserDefaults *v4;
  NSUserDefaults *v5;

  internalUserDefaults = self->_internalUserDefaults;
  if (!internalUserDefaults)
  {
    v4 = (NSUserDefaults *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.SiriViewService"));
    v5 = self->_internalUserDefaults;
    self->_internalUserDefaults = v4;

    internalUserDefaults = self->_internalUserDefaults;
  }
  return internalUserDefaults;
}

- (void)_addDelegate:(id)a3 forSource:(id)a4
{
  if (a4)
    -[NSMapTable setObject:forKey:](self->_delegatesBySource, "setObject:forKey:", a3);
}

- (void)_setupKVOMonitoring
{
  void *v3;
  void *v4;
  id v5;

  self->_monitoringForUpdates = 1;
  -[SiriLongPressButtonConfigurationUpdateManager userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("SiriHardwareButtonLongPressBehavior"), 1, 0);

  -[SiriLongPressButtonConfigurationUpdateManager userDefaults](self, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("SiriHardwareButtonLongPressBehavior"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_currentLongPressBehavior = objc_msgSend(v4, "integerValue");

}

- (void)_stopKVOMonitoring
{
  id v3;

  self->_monitoringForUpdates = 0;
  -[SiriLongPressButtonConfigurationUpdateManager userDefaults](self, "userDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("SiriHardwareButtonLongPressBehavior"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("SiriHardwareButtonLongPressBehavior")))
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__SiriLongPressButtonConfigurationUpdateManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E91FBFE0;
    objc_copyWeak(&v17, &location);
    v15 = v12;
    v16 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SiriLongPressButtonConfigurationUpdateManager;
    -[SiriLongPressButtonConfigurationUpdateManager observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

void __96__SiriLongPressButtonConfigurationUpdateManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("#configurationUpdateManager %@ changed to %@"), *(_QWORD *)(a1 + 40), v3);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v16 = v3;
      v6 = objc_msgSend(v3, "integerValue");
      *((_QWORD *)WeakRetained + 3) = v6;
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(*((id *)WeakRetained + 4), "keyEnumerator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(*((id *)WeakRetained + 4), "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              objc_msgSend(v12, "configuration");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "longPressBehavior");
              objc_msgSend(v14, "setLongPressBehavior:", v6);
              objc_msgSend(v12, "setConfiguration:", v14);
              if (v15 != v6)
                objc_msgSend(v13, "configurationUpdateManager:configurationDidUpdateForLongPressSource:", WeakRetained, v12);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v9);
      }

      v3 = v16;
    }

  }
}

- (int64_t)currentLongPressBehavior
{
  return self->_currentLongPressBehavior;
}

- (void)setCurrentLongPressBehavior:(int64_t)a3
{
  self->_currentLongPressBehavior = a3;
}

- (BOOL)monitoringForUpdates
{
  return self->_monitoringForUpdates;
}

- (void)setMonitoringForUpdates:(BOOL)a3
{
  self->_monitoringForUpdates = a3;
}

- (NSMapTable)delegatesBySource
{
  return self->_delegatesBySource;
}

- (void)setDelegatesBySource:(id)a3
{
  objc_storeStrong((id *)&self->_delegatesBySource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatesBySource, 0);
  objc_storeStrong((id *)&self->_internalUserDefaults, 0);
}

@end
