@implementation SBBacklightEnvironmentSessionProvider

- (SBBacklightEnvironmentSessionProvider)init
{
  SBBacklightEnvironmentSessionProvider *v2;
  SBBacklightEnvironmentSessionProvider *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  id from;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SBBacklightEnvironmentSessionProvider;
  v2 = -[SBBacklightEnvironmentSessionProvider init](&v21, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_springBoardBootCompleted = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v4);

    objc_initWeak(&from, v3);
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__102;
    v17 = __Block_byref_object_dispose__102;
    v18 = 0;
    v5 = objc_loadWeakRetained(&location);
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__SBBacklightEnvironmentSessionProvider_init__block_invoke;
    v10[3] = &unk_1E8EA1628;
    objc_copyWeak(&v11, &from);
    objc_copyWeak(&v12, &location);
    v10[4] = &v13;
    objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("SBBootCompleteNotification"), 0, v6, v10);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v14[5];
    v14[5] = v7;

    _Block_object_dispose(&v13, 8);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __45__SBBacklightEnvironmentSessionProvider_init__block_invoke(uint64_t a1)
{
  _QWORD block[5];
  id v3;
  id v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SBBacklightEnvironmentSessionProvider_init__block_invoke_2;
  block[3] = &unk_1E8EBCE50;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  objc_copyWeak(&v4, (id *)(a1 + 48));
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v3);
}

void __45__SBBacklightEnvironmentSessionProvider_init__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BYTE *WeakRetained;
  void *v4;
  id v5;
  uint8_t v6[16];

  SBLogBacklight();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Invalidating backlight environment presentation at end of SpringBoard boot", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[48] = 1;
    objc_msgSend(WeakRetained, "_rebuildPresentation");
  }
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v5, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

- (void)registerBacklightEnvironmentSceneProvider:(id)a3
{
  id v4;
  NSHashTable *backlightEnvironmentSceneProviders;
  NSHashTable *v6;
  NSHashTable *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  backlightEnvironmentSceneProviders = self->_backlightEnvironmentSceneProviders;
  if (!backlightEnvironmentSceneProviders)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_backlightEnvironmentSceneProviders;
    self->_backlightEnvironmentSceneProviders = v6;

    backlightEnvironmentSceneProviders = self->_backlightEnvironmentSceneProviders;
  }
  -[NSHashTable addObject:](backlightEnvironmentSceneProviders, "addObject:", v4);
  SBLogBacklight();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "succinctDescription");
    else
      objc_msgSend(v4, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating backlight environment presentation after adding scene provider %@", (uint8_t *)&v10, 0xCu);

  }
  -[SBBacklightEnvironmentSessionProvider _rebuildPresentation](self, "_rebuildPresentation");

}

- (void)unregisterBacklightEnvironmentSceneProvider:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSHashTable removeObject:](self->_backlightEnvironmentSceneProviders, "removeObject:", v4);
  SBLogBacklight();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "succinctDescription");
    else
      objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating backlight environment presentation after removing scene provider %@", (uint8_t *)&v7, 0xCu);

  }
  -[SBBacklightEnvironmentSessionProvider _rebuildPresentation](self, "_rebuildPresentation");

}

- (void)registerBacklightSceneHostEnvironmentProvider:(id)a3
{
  id v4;
  NSHashTable *backlightSceneHostEnvironmentProviders;
  NSHashTable *v6;
  NSHashTable *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  backlightSceneHostEnvironmentProviders = self->_backlightSceneHostEnvironmentProviders;
  if (!backlightSceneHostEnvironmentProviders)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_backlightSceneHostEnvironmentProviders;
    self->_backlightSceneHostEnvironmentProviders = v6;

    backlightSceneHostEnvironmentProviders = self->_backlightSceneHostEnvironmentProviders;
  }
  -[NSHashTable addObject:](backlightSceneHostEnvironmentProviders, "addObject:", v4);
  SBLogBacklight();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "succinctDescription");
    else
      objc_msgSend(v4, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating backlight environment presentation after adding environment provider %@", (uint8_t *)&v10, 0xCu);

  }
  -[SBBacklightEnvironmentSessionProvider _rebuildPresentation](self, "_rebuildPresentation");

}

- (void)unregisterBacklightSceneHostEnvironmentProvider:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSHashTable removeObject:](self->_backlightSceneHostEnvironmentProviders, "removeObject:", v4);
  SBLogBacklight();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "succinctDescription");
    else
      objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating backlight environment presentation after removing environment provider %@", (uint8_t *)&v7, 0xCu);

  }
  -[SBBacklightEnvironmentSessionProvider _rebuildPresentation](self, "_rebuildPresentation");

}

- (void)invalidateBacklightScenesForProvider:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogBacklight();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "succinctDescription");
    else
      objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating backlight environment presentation for scene provider %@", (uint8_t *)&v7, 0xCu);

  }
  -[SBBacklightEnvironmentSessionProvider _rebuildPresentation](self, "_rebuildPresentation");

}

- (void)invalidateBacklightSceneHostEnvironmentsForProvider:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogBacklight();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "succinctDescription");
    else
      objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating backlight environment presentation for environment provider %@", (uint8_t *)&v7, 0xCu);

  }
  -[SBBacklightEnvironmentSessionProvider _rebuildPresentation](self, "_rebuildPresentation");

}

- (NSSet)currentPresentationBundleIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBBacklightEnvironmentSessionProvider _currentSession](self, "_currentSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "presentationEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_compactMap:", &__block_literal_global_345);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v7;
}

id __77__SBBacklightEnvironmentSessionProvider_currentPresentationBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "userObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
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
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (id)_backlightPresentationEntries
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t j;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  void *v46;
  NSObject *v47;
  SBBacklightEnvironmentSessionProvider *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  NSHashTable *obj;
  id v55;
  NSHashTable *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  NSObject *v82;
  id v83;
  uint8_t buf[16];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  if (self->_springBoardBootCompleted)
  {
    objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __70__SBBacklightEnvironmentSessionProvider__backlightPresentationEntries__block_invoke;
    v81[3] = &unk_1E8EBCEB8;
    v53 = v3;
    v82 = v53;
    v52 = v4;
    v83 = v52;
    objc_msgSend(v5, "scenesPassingTest:", v81);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = v6;
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bs_map:", &__block_literal_global_35_3);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v49 = self;
    obj = self->_backlightEnvironmentSceneProviders;
    v57 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
    if (v57)
    {
      v55 = *(id *)v78;
      do
      {
        v9 = 0;
        do
        {
          if (*(id *)v78 != v55)
            objc_enumerationMutation(obj);
          v59 = v9;
          v10 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v9);
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          objc_msgSend(v10, "scenesForBacklightSession");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v74;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v74 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
                objc_msgSend(v16, "backlightSceneHostEnvironment");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_alloc(MEMORY[0x1E0D01018]);
                objc_msgSend(v16, "clientHandle");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "bundleIdentifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = (void *)objc_msgSend(v18, "initWithEnvironment:userObject:", v17, v20);
                objc_msgSend(v8, "addObject:", v21);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
            }
            while (v13);
          }

          v9 = v59 + 1;
        }
        while (v59 + 1 != v57);
        v57 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
      }
      while (v57);
    }

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v56 = v49->_backlightSceneHostEnvironmentProviders;
    v60 = -[NSHashTable countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
    if (v60)
    {
      v58 = *(_QWORD *)v70;
      do
      {
        for (j = 0; j != v60; ++j)
        {
          if (*(_QWORD *)v70 != v58)
            objc_enumerationMutation(v56);
          v23 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v68 = 0u;
          objc_msgSend(v23, "sceneHostEnvironmentEntriesForBacklightSession");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v66;
            do
            {
              for (k = 0; k != v26; ++k)
              {
                if (*(_QWORD *)v66 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
                v30 = objc_alloc(MEMORY[0x1E0D01018]);
                objc_msgSend(v29, "environment");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "bundleIdentifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = (void *)objc_msgSend(v30, "initWithEnvironment:userObject:", v31, v32);
                objc_msgSend(v8, "addObject:", v33);

              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
            }
            while (v26);
          }

        }
        v60 = -[NSHashTable countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
      }
      while (v60);
    }

    objc_msgSend((id)SBApp, "screenSleepCoordinator");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "backlightSceneHostEnvironment");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35 && (v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01018]), "initWithEnvironment:userObject:", v35, 0)) != 0)
    {
      v37 = (void *)v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v38 = (void *)MEMORY[0x1E0C9AA60];
    }
    objc_msgSend(v38, "arrayByAddingObjectsFromArray:", v50);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "arrayByAddingObjectsFromArray:", v8);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v41 = v40;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v61, v85, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v62;
      do
      {
        for (m = 0; m != v43; ++m)
        {
          if (*(_QWORD *)v62 != v44)
            objc_enumerationMutation(v41);
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * m), "environment");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setAlwaysOnEnabledForEnvironment:", objc_msgSend(v46, "clientSupportsAlwaysOn"));

        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v61, v85, 16);
      }
      while (v43);
    }

    v47 = v53;
  }
  else
  {
    SBLogBacklight();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v47, OS_LOG_TYPE_DEFAULT, "Constructing empty backlight environment presentation while SpringBoard is booting", buf, 2u);
    }
    v41 = (id)MEMORY[0x1E0C9AA60];
  }

  return v41;
}

BOOL __70__SBBacklightEnvironmentSessionProvider__backlightPresentationEntries__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;

  v3 = a2;
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "clientHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "processHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 40));

    v9 = v8 ^ 1;
  }
  else
  {
    v9 = 1;
  }

  objc_msgSend(v3, "definition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "specification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uiSceneSessionRole");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CEBE48]);

  objc_msgSend(v3, "identity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "workspaceIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  if ((v9 & 1) == 0 && v13 && !v15)
  {
    objc_msgSend(v3, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v17 != 0;

  }
  return v16;
}

id __70__SBBacklightEnvironmentSessionProvider__backlightPresentationEntries__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "backlightSceneHostEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D01018]);
  objc_msgSend(v2, "clientHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithEnvironment:userObject:", v3, v6);

  return v7;
}

- (void)_setCurrentSession:(id)a3
{
  BLSHBacklightInactiveEnvironmentSession *v5;
  BLSHBacklightInactiveEnvironmentSession *currentSession;
  BLSHBacklightInactiveEnvironmentSession *v7;

  v5 = (BLSHBacklightInactiveEnvironmentSession *)a3;
  currentSession = self->_currentSession;
  if (currentSession != v5)
  {
    v7 = v5;
    -[BLSHBacklightInactiveEnvironmentSession removeObserver:](currentSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_currentSession, a3);
    -[BLSHBacklightInactiveEnvironmentSession addObserver:](self->_currentSession, "addObserver:", self);
    -[SBBacklightEnvironmentSessionProvider _notifyObserversOfPresentation](self, "_notifyObserversOfPresentation");
    v5 = v7;
  }

}

- (void)_rebuildPresentation
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BSInvalidatable *v11;
  void *v12;
  BSInvalidatable *v13;
  BSInvalidatable *presentationUpdateLiveRenderAssertion;
  NSObject *v15;
  BSInvalidatable *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[SBBacklightEnvironmentSessionProvider _currentSession](self, "_currentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBBacklightEnvironmentSessionProvider _buildPresentation](self, "_buildPresentation");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject isEqual:](v4, "isEqual:", v5);
    objc_msgSend((id)SBApp, "windowSceneManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "embeddedDisplayWindowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_FBSScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0DA9D68];
      v11 = self->_presentationUpdateLiveRenderAssertion;
      objc_msgSend(v10, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "acquireLiveRenderingAssertionForFBSScene:reason:", v9, CFSTR("updatingPresentation"));
      v13 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      presentationUpdateLiveRenderAssertion = self->_presentationUpdateLiveRenderAssertion;
      self->_presentationUpdateLiveRenderAssertion = v13;

      -[BSInvalidatable invalidate](v11, "invalidate");
    }
    SBLogBacklight();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Rebuilt inactive environment presentation: %@", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(v3, "setPresentation:", v4);
    -[SBBacklightEnvironmentSessionProvider _notifyObserversOfPresentation](self, "_notifyObserversOfPresentation");
    if (v6)
    {
      -[BSInvalidatable invalidate](self->_presentationUpdateLiveRenderAssertion, "invalidate");
      v16 = self->_presentationUpdateLiveRenderAssertion;
      self->_presentationUpdateLiveRenderAssertion = 0;

    }
  }
  else
  {
    SBLogBacklight();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "No active session so not rebuilding inactive environment presentation", (uint8_t *)&v17, 2u);
    }
  }

}

- (void)_notifyObserversOfPresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SBBacklightEnvironmentSessionProvider _currentSession](self, "_currentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBBacklightEnvironmentSessionProvider currentPresentationBundleIdentifiers](self, "currentPresentationBundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_observers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "backlightEnvironmentSessionsProvider:didUpdatePresentation:withBundleIdentifiers:", self, v4, v5, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)inactiveEnvironmentSession:(id)a3 didUpdateToPresentation:(id)a4
{
  BSDispatchMain();
}

void __92__SBBacklightEnvironmentSessionProvider_inactiveEnvironmentSession_didUpdateToPresentation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)didEndInactiveEnvironmentSession:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

void __74__SBBacklightEnvironmentSessionProvider_didEndInactiveEnvironmentSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_currentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 40), "_setCurrentSession:", 0);
}

- (id)_buildPresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[SBMainDisplayRootWindowScenePresentationBinder sharedInstance](SBMainDisplayRootWindowScenePresentationBinder, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBBacklightEnvironmentSessionProvider _backlightPresentationEntries](self, "_backlightPresentationEntries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01000]), "initWithCAContext:wantsTransform:inverted:", v6, 0, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00FE8]), "initWithPresentationEntries:flipbookContext:expirationDate:", v7, v8, 0);

  return v9;
}

- (id)createInactiveEnvironmentSession
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[SBBacklightEnvironmentSessionProvider _buildPresentation](self, "_buildPresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogBacklight();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "New inactive environment presentation: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D00FF8], "sessionWithPresentation:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);
  -[SBBacklightEnvironmentSessionProvider _setCurrentSession:](self, "_setCurrentSession:", v5);

  return v5;
}

- (BLSHBacklightInactiveEnvironmentSession)_currentSession
{
  return self->_currentSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationUpdateLiveRenderAssertion, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_backlightSceneHostEnvironmentProviders, 0);
  objc_storeStrong((id *)&self->_backlightEnvironmentSceneProviders, 0);
}

@end
