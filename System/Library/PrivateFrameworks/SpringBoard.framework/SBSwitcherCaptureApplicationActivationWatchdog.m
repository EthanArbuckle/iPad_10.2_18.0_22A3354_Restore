@implementation SBSwitcherCaptureApplicationActivationWatchdog

- (SBSwitcherCaptureApplicationActivationWatchdog)initWithDelegate:(id)a3
{
  id v4;
  SBSwitcherCaptureApplicationActivationWatchdog *v5;
  uint64_t v6;
  NSHashTable *watchdogEntries;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSwitcherCaptureApplicationActivationWatchdog;
  v5 = -[SBSwitcherCaptureApplicationActivationWatchdog init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 512);
    v6 = objc_claimAutoreleasedReturnValue();
    watchdogEntries = v5->_watchdogEntries;
    v5->_watchdogEntries = (NSHashTable *)v6;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)foregroundWorkspaceEntitiesUpdatedTo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSSet *lastEntitiesUpdate;
  NSSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  NSSet *v20;
  NSSet *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33 = (void *)objc_msgSend(v4, "mutableCopy");
  v5 = (void *)-[NSSet mutableCopy](self->_lastEntitiesUpdate, "mutableCopy");
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v51 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
        lastEntitiesUpdate = self->_lastEntitiesUpdate;
        v48[0] = v8;
        v48[1] = 3221225472;
        v48[2] = __87__SBSwitcherCaptureApplicationActivationWatchdog_foregroundWorkspaceEntitiesUpdatedTo___block_invoke;
        v48[3] = &unk_1E8EB62B8;
        v48[4] = v12;
        v49 = v33;
        -[NSSet enumerateObjectsUsingBlock:](lastEntitiesUpdate, "enumerateObjectsUsingBlock:", v48);

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    }
    while (v9);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v14 = self->_lastEntitiesUpdate;
  v15 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v45 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
        v42[0] = v8;
        v42[1] = 3221225472;
        v42[2] = __87__SBSwitcherCaptureApplicationActivationWatchdog_foregroundWorkspaceEntitiesUpdatedTo___block_invoke_2;
        v42[3] = &unk_1E8EB62B8;
        v42[4] = v19;
        v43 = v5;
        objc_msgSend(v6, "enumerateObjectsUsingBlock:", v42);

      }
      v16 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v16);
  }

  v20 = (NSSet *)objc_msgSend(v6, "copy");
  v21 = self->_lastEntitiesUpdate;
  self->_lastEntitiesUpdate = v20;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v22 = v5;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v39 != v25)
          objc_enumerationMutation(v22);
        -[SBSwitcherCaptureApplicationActivationWatchdog _endMonitoringAppRepresentedByEntity:](self, "_endMonitoringAppRepresentedByEntity:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
    }
    while (v24);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = v33;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v35;
    do
    {
      for (m = 0; m != v29; ++m)
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * m);
        if (objc_msgSend(v32, "flagForActivationSetting:", 36) == 1)
          -[SBSwitcherCaptureApplicationActivationWatchdog _beginMonitoringAppRepresentedByEntity:](self, "_beginMonitoringAppRepresentedByEntity:", v32);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
    }
    while (v29);
  }

}

uint64_t __87__SBSwitcherCaptureApplicationActivationWatchdog_foregroundWorkspaceEntitiesUpdatedTo___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isAnalogousToEntity:", a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "removeObject:", *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __87__SBSwitcherCaptureApplicationActivationWatchdog_foregroundWorkspaceEntitiesUpdatedTo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isAnalogousToEntity:", a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "removeObject:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_beginMonitoringAppRepresentedByEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SBCaptureApplicationLaunchMonitor *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "applicationSceneEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sceneIfExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCaptureApplication();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      objc_msgSend(v4, "applicationSceneEntity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "application");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v12;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Unlocked: Capture watchdog monitoring BEGINNING for \"%{public}@\", (uint8_t *)&v18, 0xCu);

    }
    -[SBSwitcherCaptureApplicationActivationWatchdog _addEntryForEntity:](self, "_addEntryForEntity:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBCaptureApplicationLaunchMonitor initWithScene:delegate:]([SBCaptureApplicationLaunchMonitor alloc], "initWithScene:delegate:", v7, self);
    objc_msgSend(v13, "setCaptureAppLaunchMonitor:", v14);
    -[SBCaptureApplicationLaunchMonitor start](v14, "start");

  }
  else
  {
    if (v9)
    {
      objc_msgSend(v4, "applicationSceneEntity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "application");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Unlocked: Capture watchdog monitoring PENDING for \"%{public}@\", (uint8_t *)&v18, 0xCu);

    }
    -[SBSwitcherCaptureApplicationActivationWatchdog _addEntryForEntity:](self, "_addEntryForEntity:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSceneHandle:", v6);
    objc_msgSend(v6, "addObserver:", self);
  }

}

- (void)_endMonitoringAppRepresentedByEntity:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBSwitcherCaptureApplicationActivationWatchdog _entryForEntity:](self, "_entryForEntity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    SBLogCaptureApplication();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "applicationSceneEntity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "application");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Unlocked: Capture watchdog ENDED for \"%{public}@\", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(v5, "captureAppLaunchMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    -[SBSwitcherCaptureApplicationActivationWatchdog _removeEntryForEntity:](self, "_removeEntryForEntity:", v4);
  }

}

- (void)captureApplicationMonitor:(id)a3 hasMetLaunchRequirements:(BOOL)a4 unmetReason:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  _DWORD v22[2];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  -[SBSwitcherCaptureApplicationActivationWatchdog _entryForMonitor:](self, "_entryForMonitor:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown state"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSwitcherCaptureApplicationActivationWatchdog captureApplicationMonitor:hasMetLaunchRequirements:unmetReason:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0AED048);
  }
  v12 = (void *)v11;
  SBLogCaptureApplication();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "entity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "applicationSceneEntity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "application");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = 67109378;
    v22[1] = v6;
    v23 = 2114;
    v24 = v17;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Unlocked: Capture watchdog met requirements? (%{BOOL}u) for \"%{public}@\", (uint8_t *)v22, 0x12u);

  }
  if (!v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "entity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "watchdog:requestsTerminationOf:forReason:", self, v19, v10);

  }
  objc_msgSend(v12, "entity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherCaptureApplicationActivationWatchdog _endMonitoringAppRepresentedByEntity:](self, "_endMonitoringAppRepresentedByEntity:", v20);

}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  -[SBSwitcherCaptureApplicationActivationWatchdog _entryForSceneHandle:](self, "_entryForSceneHandle:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "entity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherCaptureApplicationActivationWatchdog _removeEntryForEntity:](self, "_removeEntryForEntity:", v10);

    objc_msgSend(v9, "entity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherCaptureApplicationActivationWatchdog _beginMonitoringAppRepresentedByEntity:](self, "_beginMonitoringAppRepresentedByEntity:", v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Observed change for unmonitored entity"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSwitcherCaptureApplicationActivationWatchdog sceneHandle:didCreateScene:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)sceneHandle:(id)a3 replacedWithSceneHandle:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  SBSwitcherCaptureApplicationActivationWatchdog *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unhandled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544642;
    v14 = v10;
    v15 = 2114;
    v16 = v12;
    v17 = 2048;
    v18 = self;
    v19 = 2114;
    v20 = CFSTR("SBSwitcherCaptureApplicationActivationWatchdog.m");
    v21 = 1024;
    v22 = 135;
    v23 = 2114;
    v24 = v9;
    _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (id)_entryForEntity:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_watchdogEntries;
  v6 = (id)-[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "entity", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isAnalogousToEntity:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_entryForMonitor:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_watchdogEntries;
  v6 = (id)-[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "captureAppLaunchMonitor", (_QWORD)v12);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_entryForSceneHandle:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_watchdogEntries;
  v6 = (id)-[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "sceneHandle", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_addEntryForEntity:(id)a3
{
  id v5;
  void *v6;
  _SBWatchdogEntry *v7;
  id result;
  void *v9;

  v5 = a3;
  -[SBSwitcherCaptureApplicationActivationWatchdog _entryForEntity:](self, "_entryForEntity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't add duplicate entry"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSwitcherCaptureApplicationActivationWatchdog _addEntryForEntity:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v7 = objc_alloc_init(_SBWatchdogEntry);
    -[_SBWatchdogEntry setEntity:](v7, "setEntity:", v5);
    -[NSHashTable addObject:](self->_watchdogEntries, "addObject:", v7);

    return v7;
  }
  return result;
}

- (void)_removeEntryForEntity:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SBSwitcherCaptureApplicationActivationWatchdog _entryForEntity:](self, "_entryForEntity:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "removeObserver:", self);
    objc_msgSend(v6, "setSceneHandle:", 0);
  }
  -[NSHashTable removeObject:](self->_watchdogEntries, "removeObject:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEntitiesUpdate, 0);
  objc_storeStrong((id *)&self->_watchdogEntries, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)captureApplicationMonitor:(const char *)a1 hasMetLaunchRequirements:unmetReason:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)sceneHandle:(const char *)a1 didCreateScene:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_addEntryForEntity:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
