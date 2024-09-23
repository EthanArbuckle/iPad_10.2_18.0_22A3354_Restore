@implementation SBSensorActivityDataProvider

void __59__SBSensorActivityDataProvider_initWithSystemStatusServer___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleNewDomainData:", *(_QWORD *)(a1 + 32));

}

- (void)_handleNewDomainData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v16 = v4;
  if (v4)
  {
    objc_msgSend(v4, "activeAttributionData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataAccessAttributions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "bs_map:", &__block_literal_global_15_2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSensorActivityDataProvider setActiveSensorActivityAttributions:](self, "setActiveSensorActivityAttributions:", v9);
    objc_msgSend(v16, "recentAttributionData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataAccessAttributions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v11, "bs_map:", &__block_literal_global_17_1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSensorActivityDataProvider setRecentSensorActivityAttributions:](self, "setRecentSensorActivityAttributions:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSensorActivityDataProvider setActiveSensorActivityAttributions:](self, "setActiveSensorActivityAttributions:", v15);

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSensorActivityDataProvider setRecentSensorActivityAttributions:](self, "setRecentSensorActivityAttributions:", v6);
  }

  -[SBSensorActivityDataProvider _notifyObserversOfActivityChange](self, "_notifyObserversOfActivityChange");
}

- (void)setRecentSensorActivityAttributions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setActiveSensorActivityAttributions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)_notifyObserversOfActivityChange
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SBSensorActivityDataProvider observers](self, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "activityDidChangeForSensorActivityDataProvider:", self, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (NSSet)activeAndRecentSensorActivityAttributions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  -[SBSensorActivityDataProvider activeSensorActivityAttributions](self, "activeSensorActivityAttributions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[SBSensorActivityDataProvider recentSensorActivityAttributions](self, "recentSensorActivityAttributions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v8);

  v9 = (void *)objc_msgSend(v7, "copy");
  return (NSSet *)v9;
}

- (NSSet)activeCameraAndMicrophoneActivityAttributions
{
  void *v2;
  void *v3;

  -[SBSensorActivityDataProvider activeSensorActivityAttributions](self, "activeSensorActivityAttributions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsPassingTest:", &__block_literal_global_226);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSSet)activeSensorActivityAttributions
{
  return self->_activeSensorActivityAttributions;
}

- (NSSet)recentSensorActivityAttributions
{
  return self->_recentSensorActivityAttributions;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (SBSensorActivityAttribution)mostRecentCameraAndMicrophoneSensorActivityAttribution
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[SBSensorActivityDataProvider _recentCameraAndMicrophoneActivityAttributions](self, "_recentCameraAndMicrophoneActivityAttributions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        if (v9 != v3)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "bundleIdentifier", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "bundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
          {
            v12 = objc_msgSend(v9, "sensor");

            if (v12)
              goto LABEL_12;
            v10 = v3;
            v3 = v9;
          }
          else
          {

          }
        }
LABEL_12:
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return (SBSensorActivityAttribution *)v3;
}

- (id)_recentCameraAndMicrophoneActivityAttributions
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SBSensorActivityDataProvider recentSensorActivityAttributions](self, "recentSensorActivityAttributions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (!objc_msgSend(v9, "sensor", (_QWORD)v12) || objc_msgSend(v9, "sensor") == 1)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

SBSensorActivityAttribution *__53__SBSensorActivityDataProvider__handleNewDomainData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  SBSensorActivityAttribution *v3;

  v2 = a2;
  v3 = -[SBSensorActivityAttribution initWithDataAccessAttribution:]([SBSensorActivityAttribution alloc], "initWithDataAccessAttribution:", v2);

  return v3;
}

SBSensorActivityAttribution *__53__SBSensorActivityDataProvider__handleNewDomainData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SBSensorActivityAttribution *v3;

  v2 = a2;
  v3 = -[SBSensorActivityAttribution initWithDataAccessAttribution:]([SBSensorActivityAttribution alloc], "initWithDataAccessAttribution:", v2);

  return v3;
}

BOOL __77__SBSensorActivityDataProvider_activeCameraAndMicrophoneActivityAttributions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (objc_msgSend(v2, "sensor"))
    v3 = objc_msgSend(v2, "sensor") == 1;
  else
    v3 = 1;

  return v3;
}

void __59__SBSensorActivityDataProvider_initWithSystemStatusServer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__SBSensorActivityDataProvider_initWithSystemStatusServer___block_invoke_2;
  v5[3] = &unk_1E8E9F280;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

- (SBSensorActivityDataProvider)init
{
  void *v4;
  void *v5;
  SBSensorActivityDataProvider *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSensorActivityDataProvider.m"), 32, CFSTR("call initWithSystemStatusServer:"));

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBSensorActivityDataProvider initWithSystemStatusServer:](self, "initWithSystemStatusServer:", v5);

  return v6;
}

- (SBSensorActivityDataProvider)initWithSystemStatusServer:(id)a3
{
  id v4;
  SBSensorActivityDataProvider *v5;
  uint64_t v6;
  STUIDataAccessStatusDomain *dataAccessDomain;
  STUIDataAccessStatusDomain *v8;
  uint64_t v9;
  NSHashTable *observers;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBSensorActivityDataProvider;
  v5 = -[SBSensorActivityDataProvider init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0F08]), "initWithServerHandle:", v4);
    dataAccessDomain = v5->_dataAccessDomain;
    v5->_dataAccessDomain = (STUIDataAccessStatusDomain *)v6;

    objc_initWeak(&location, v5);
    v8 = v5->_dataAccessDomain;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __59__SBSensorActivityDataProvider_initWithSystemStatusServer___block_invoke;
    v16 = &unk_1E8EB4DC0;
    objc_copyWeak(&v17, &location);
    -[STUIDataAccessStatusDomain observeDataWithBlock:](v8, "observeDataWithBlock:", &v13);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable", v13, v14, v15, v16);
    v9 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v9;

    -[STUIDataAccessStatusDomain data](v5->_dataAccessDomain, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSensorActivityDataProvider _handleNewDomainData:](v5, "_handleNewDomainData:", v11);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[STUIDataAccessStatusDomain invalidate](self->_dataAccessDomain, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSensorActivityDataProvider;
  -[SBSensorActivityDataProvider dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSensorActivityDataProvider observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSensorActivityDataProvider observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (STUIDataAccessStatusDomain)dataAccessDomain
{
  return self->_dataAccessDomain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dataAccessDomain, 0);
  objc_storeStrong((id *)&self->_recentSensorActivityAttributions, 0);
  objc_storeStrong((id *)&self->_activeSensorActivityAttributions, 0);
}

@end
