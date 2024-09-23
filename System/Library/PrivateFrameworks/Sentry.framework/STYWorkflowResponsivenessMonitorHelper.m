@implementation STYWorkflowResponsivenessMonitorHelper

- (id)name
{
  return CFSTR("Workflow Responsiveness");
}

- (STYWorkflowResponsivenessMonitorHelper)init
{
  STYWorkflowResponsivenessMonitorHelper *v2;
  SignpostSupportSubsystemCategoryAllowlist *v3;
  SignpostSupportSubsystemCategoryAllowlist *allowList;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  WRWorkflowProvider *workflowProvider;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  id *v14;
  NSObject *v15;
  NSObject *v16;
  int64_t v17;
  dispatch_time_t v18;
  id *v19;
  id v20;
  NSObject *v21;
  _QWORD v23[4];
  id *v24;
  _QWORD handler[4];
  id *v26;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)STYWorkflowResponsivenessMonitorHelper;
  v2 = -[STYSignpostsMonitorHelper init](&v30, sel_init);
  if (v2)
  {
    v3 = (SignpostSupportSubsystemCategoryAllowlist *)objc_alloc_init(MEMORY[0x1E0D97680]);
    allowList = v2->_allowList;
    v2->_allowList = v3;

    dispatch_get_global_queue(5, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v5, &__block_literal_global_336);

    objc_initWeak(&location, v2);
    v6 = (void *)MEMORY[0x1E0DDA0E0];
    -[STYSignpostsMonitorHelper processingQueue](v2, "processingQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke_2;
    v27[3] = &unk_1E86A0EB8;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v6, "providerForAllWorkflowsWithQueue:callback:", v7, v27);
    v9 = objc_claimAutoreleasedReturnValue();
    workflowProvider = v2->_workflowProvider;
    v2->_workflowProvider = (WRWorkflowProvider *)v9;

    -[STYSignpostsMonitorHelper processingQueue](v2, "processingQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v11);

    v13 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 86400000000000);
    dispatch_source_set_timer(v12, v13, 0x4E94914F0000uLL, 0x34630B8A000uLL);
    handler[0] = v8;
    handler[1] = 3221225472;
    handler[2] = __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke_344;
    handler[3] = &unk_1E86A0B60;
    v14 = v2;
    v26 = v14;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_activate(v12);
    objc_storeStrong(v14 + 11, v12);
    objc_msgSend(v14, "processingQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v15);

    if ((int)objc_msgSend(v14, "periodLengthSec") >= 1)
    {
      if ((int)objc_msgSend(v14, "periodLengthSec") < 1)
        v17 = -1;
      else
        v17 = 1000000000 * (int)objc_msgSend(v14, "periodLengthSec");
      v18 = dispatch_time(0xFFFFFFFFFFFFFFFELL, v17);
      dispatch_source_set_timer(v16, v18, 1000000000 * (int)objc_msgSend(v14, "periodLengthSec"), 1000000000 * (int)objc_msgSend(v14, "periodLengthSec") / 0xAuLL);
    }
    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke_345;
    v23[3] = &unk_1E86A0B60;
    v19 = v14;
    v24 = v19;
    dispatch_source_set_event_handler(v16, v23);
    dispatch_resume(v16);
    v20 = v19[12];
    v19[12] = v16;
    v21 = v16;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return v2;
}

uint64_t __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DDA0D8], "cleanupWorkflowResponsivenessDiagnosticsDirectory");
}

void __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  STYWorkflowEventTracker *v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  id v24;
  id obj;
  id *from;
  void *v27;
  id *WeakRetained;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v24 = a2;
  from = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v24, "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v24;
    v3 = 0;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v4)
    {
      v29 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v34 != v29)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v6, "allowListForDiagnostics");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "logHandle");
          v9 = (STYWorkflowEventTracker *)objc_claimAutoreleasedReturnValue();

          v10 = os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT);
          if (v7)
          {
            if (v10)
            {
              objc_msgSend(v6, "name");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v38 = v11;
              _os_log_impl(&dword_1CB87B000, &v9->super, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ starting monitoring", buf, 0xCu);

            }
            if (!v3)
              v3 = objc_alloc_init(MEMORY[0x1E0D97680]);
            objc_msgSend(v3, "addAllowlist:", v7);
            v9 = objc_alloc_init(STYWorkflowEventTracker);
            objc_initWeak((id *)buf, v9);
            v12 = objc_alloc(MEMORY[0x1E0DDA0D8]);
            objc_msgSend(WeakRetained, "processingQueue");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v30[0] = MEMORY[0x1E0C809B0];
            v30[1] = 3221225472;
            v30[2] = __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke_341;
            v30[3] = &unk_1E86A0E90;
            objc_copyWeak(&v31, (id *)buf);
            objc_copyWeak(&v32, from);
            v14 = (void *)objc_msgSend(v12, "initForLiveStreamingWithWorkflow:timeoutQueue:eventCompletionCallback:", v6, v13, v30);

            -[STYWorkflowEventTracker setWrTracker:](v9, "setWrTracker:", v14);
            objc_msgSend(v27, "addObject:", v9);

            objc_destroyWeak(&v32);
            objc_destroyWeak(&v31);
            objc_destroyWeak((id *)buf);
          }
          else if (v10)
          {
            objc_msgSend(v6, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v38 = v15;
            _os_log_impl(&dword_1CB87B000, &v9->super, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ has no diagnostics enabled, not monitoring", buf, 0xCu);

          }
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v4);
    }

    objc_msgSend(WeakRetained, "setWorkflowEventTrackers:", 0);
    if (objc_msgSend(v27, "count"))
    {
      v16 = (void *)objc_msgSend(v27, "copy");
      objc_msgSend(WeakRetained, "setWorkflowEventTrackers:", v16);

      objc_msgSend(WeakRetained, "takeTransaction");
    }
    else
    {
      +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logHandle");
      v18 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB87B000, v18, OS_LOG_TYPE_DEFAULT, "No workflows have diagnostics enabled", buf, 2u);
      }

      objc_msgSend(WeakRetained, "setOsTransaction:", 0);
    }
    objc_storeStrong(WeakRetained + 4, v3);
    objc_msgSend(WeakRetained, "settingsChangedCallbackQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(WeakRetained, "settingsChangedCallback");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20 == 0;

      if (!v21)
      {
        objc_msgSend(WeakRetained, "settingsChangedCallbackQueue");
        v22 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "settingsChangedCallback");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_async(v22, v23);

      }
    }

  }
}

void __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke_341(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (v4 && WeakRetained)
    objc_msgSend(v4, "workflowEventCompleted:completedWRTracker:", WeakRetained, v6);

}

uint64_t __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke_344(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CB87B000, v3, OS_LOG_TYPE_DEFAULT, "Daily timer fired, resetting per-day counts", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "resetPerDayCounts");
}

uint64_t __46__STYWorkflowResponsivenessMonitorHelper_init__block_invoke_345(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "periodLengthSec");
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1CB87B000, v3, OS_LOG_TYPE_DEFAULT, "per-period (%ds) timer fired, resetting per-day counts", (uint8_t *)v6, 8u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "resetPerPeriodCounts");
}

- (id)allowList
{
  return self->_allowList;
}

- (void)notifyWhenSettingsChanged:(id)a3 block:(id)a4
{
  id v6;

  v6 = a4;
  -[STYWorkflowResponsivenessMonitorHelper setSettingsChangedCallbackQueue:](self, "setSettingsChangedCallbackQueue:", a3);
  -[STYWorkflowResponsivenessMonitorHelper setSettingsChangedCallback:](self, "setSettingsChangedCallback:", v6);

}

- (void)handleSignpost:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  STYWorkflowResponsivenessMonitorHelper *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  id obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[STYWorkflowResponsivenessMonitorHelper workflowEventTrackers](self, "workflowEventTrackers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      v18 = v5;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        if (-[STYWorkflowResponsivenessMonitorHelper workflowIsUnderLimits:](self, "workflowIsUnderLimits:", v8))
        {
          objc_msgSend(v8, "wrTracker");
          v9 = v6;
          v10 = self;
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "workflow");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "allowListForDiagnostics");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "subsystem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "category");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v13, "passesSubsystem:category:", v14, v15);

          self = v10;
          v6 = v9;
          v5 = v18;
          if (v16)
          {
            objc_msgSend(v8, "wrTracker");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "handleSignpost:", v20);

          }
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

}

- (void)resetState
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[STYWorkflowResponsivenessMonitorHelper workflowEventTrackers](self, "workflowEventTrackers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "wrTracker");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "reset");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (BOOL)workflowIsUnderLimits:(id)a3
{
  id v4;
  int v5;
  int v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "perPeriodEventCount");
  if (v5 >= -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit"))
  {
    v7 = 0;
  }
  else
  {
    v6 = objc_msgSend(v4, "perDayEventCount");
    v7 = v6 < -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
  }

  return v7;
}

- (void)resetCounts
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  const char *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  __int128 v37;
  char v38;
  id obj;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[STYWorkflowResponsivenessMonitorHelper workflowEventTrackers](self, "workflowEventTrackers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
  if (!v3)
  {
LABEL_27:

    return;
  }
  v5 = v3;
  v38 = 0;
  v40 = *(_QWORD *)v42;
  *(_QWORD *)&v4 = 138544386;
  v37 = v4;
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v42 != v40)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v6);
      v8 = objc_msgSend(v7, "perDayEventCount", v37);
      v9 = objc_msgSend(v7, "perPeriodEventCount");
      v10 = -[STYWorkflowResponsivenessMonitorHelper workflowIsUnderLimits:](self, "workflowIsUnderLimits:", v7);
      objc_msgSend(v7, "setPerDayEventCount:", 0);
      objc_msgSend(v7, "setPerPeriodEventCount:", 0);
      v11 = -[STYWorkflowResponsivenessMonitorHelper workflowIsUnderLimits:](self, "workflowIsUnderLimits:", v7);
      +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logHandle");
      v13 = objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        if (v11)
        {
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            goto LABEL_19;
          objc_msgSend(v7, "wrTracker");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "workflow");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
          v18 = -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit");
          *(_DWORD *)buf = v37;
          v46 = v16;
          v47 = 1024;
          v48 = v8;
          v49 = 1024;
          v50 = v17;
          v51 = 1024;
          v52 = v9;
          v53 = 1024;
          v54 = v18;
          v19 = v13;
          v20 = "Workflow %{public}@ resetting all counts (was %d/%d per day, %d/%d per period), was already under limits";
          goto LABEL_18;
        }
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
LABEL_15:
          v38 = 1;
          goto LABEL_19;
        }
        objc_msgSend(v7, "wrTracker");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "workflow");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
        v30 = -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit");
        *(_DWORD *)buf = v37;
        v46 = v24;
        v47 = 1024;
        v48 = v8;
        v49 = 1024;
        v50 = v29;
        v51 = 1024;
        v52 = v9;
        v53 = 1024;
        v54 = v30;
        _os_log_fault_impl(&dword_1CB87B000, v13, OS_LOG_TYPE_FAULT, "Workflow %{public}@ resetting all counts (was %d/%d per day, %d/%d per period), was already under limits, and is now above limit!", buf, 0x24u);
LABEL_13:

        goto LABEL_15;
      }
      v21 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (!v21)
          goto LABEL_15;
        objc_msgSend(v7, "wrTracker");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "workflow");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
        v26 = -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit");
        *(_DWORD *)buf = v37;
        v46 = v24;
        v47 = 1024;
        v48 = v8;
        v49 = 1024;
        v50 = v25;
        v51 = 1024;
        v52 = v9;
        v53 = 1024;
        v54 = v26;
        _os_log_impl(&dword_1CB87B000, v13, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ resetting all counts (was %d/%d per day, %d/%d per period), turning on signpost streaming", buf, 0x24u);
        goto LABEL_13;
      }
      if (!v21)
        goto LABEL_19;
      objc_msgSend(v7, "wrTracker");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "workflow");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
      v28 = -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit");
      *(_DWORD *)buf = v37;
      v46 = v16;
      v47 = 1024;
      v48 = v8;
      v49 = 1024;
      v50 = v27;
      v51 = 1024;
      v52 = v9;
      v53 = 1024;
      v54 = v28;
      v19 = v13;
      v20 = "Workflow %{public}@ resetting all counts (was %d/%d per day, %d/%d per period), still above limits";
LABEL_18:
      _os_log_impl(&dword_1CB87B000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x24u);

LABEL_19:
      ++v6;
    }
    while (v5 != v6);
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    v5 = v31;
  }
  while (v31);

  if ((v38 & 1) != 0)
  {
    -[STYWorkflowResponsivenessMonitorHelper updateAllowList](self, "updateAllowList");
    -[STYWorkflowResponsivenessMonitorHelper settingsChangedCallbackQueue](self, "settingsChangedCallbackQueue");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = (void *)v32;
      -[STYWorkflowResponsivenessMonitorHelper settingsChangedCallback](self, "settingsChangedCallback");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        -[STYWorkflowResponsivenessMonitorHelper settingsChangedCallbackQueue](self, "settingsChangedCallbackQueue");
        v35 = objc_claimAutoreleasedReturnValue();
        -[STYWorkflowResponsivenessMonitorHelper settingsChangedCallback](self, "settingsChangedCallback");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        obj = v35;
        dispatch_async(v35, v36);

        goto LABEL_27;
      }
    }
  }
}

- (void)resetPerDayCounts
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  const char *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  __int128 v37;
  char v38;
  id obj;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[STYWorkflowResponsivenessMonitorHelper workflowEventTrackers](self, "workflowEventTrackers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
  if (!v3)
  {
LABEL_27:

    return;
  }
  v5 = v3;
  v38 = 0;
  v40 = *(_QWORD *)v42;
  *(_QWORD *)&v4 = 138544386;
  v37 = v4;
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v42 != v40)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v6);
      v8 = objc_msgSend(v7, "perDayEventCount", v37);
      v9 = objc_msgSend(v7, "perPeriodEventCount");
      v10 = -[STYWorkflowResponsivenessMonitorHelper workflowIsUnderLimits:](self, "workflowIsUnderLimits:", v7);
      objc_msgSend(v7, "setPerDayEventCount:", 0);
      v11 = -[STYWorkflowResponsivenessMonitorHelper workflowIsUnderLimits:](self, "workflowIsUnderLimits:", v7);
      +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logHandle");
      v13 = objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        if (v11)
        {
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            goto LABEL_19;
          objc_msgSend(v7, "wrTracker");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "workflow");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
          v18 = -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit");
          *(_DWORD *)buf = v37;
          v46 = v16;
          v47 = 1024;
          v48 = v8;
          v49 = 1024;
          v50 = v17;
          v51 = 1024;
          v52 = v9;
          v53 = 1024;
          v54 = v18;
          v19 = v13;
          v20 = "Workflow %{public}@ resetting per day counts (was %d/%d per day, %d/%d per period), was already under limits";
          goto LABEL_18;
        }
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
LABEL_15:
          v38 = 1;
          goto LABEL_19;
        }
        objc_msgSend(v7, "wrTracker");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "workflow");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
        v30 = -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit");
        *(_DWORD *)buf = v37;
        v46 = v24;
        v47 = 1024;
        v48 = v8;
        v49 = 1024;
        v50 = v29;
        v51 = 1024;
        v52 = v9;
        v53 = 1024;
        v54 = v30;
        _os_log_fault_impl(&dword_1CB87B000, v13, OS_LOG_TYPE_FAULT, "Workflow %{public}@ resetting per day counts (was %d/%d per day, %d/%d per period), was already under limits, and is now above limit!", buf, 0x24u);
LABEL_13:

        goto LABEL_15;
      }
      v21 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (!v21)
          goto LABEL_15;
        objc_msgSend(v7, "wrTracker");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "workflow");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
        v26 = -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit");
        *(_DWORD *)buf = v37;
        v46 = v24;
        v47 = 1024;
        v48 = v8;
        v49 = 1024;
        v50 = v25;
        v51 = 1024;
        v52 = v9;
        v53 = 1024;
        v54 = v26;
        _os_log_impl(&dword_1CB87B000, v13, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ resetting per day counts (was %d/%d per day, %d/%d per period), turning on signpost streaming", buf, 0x24u);
        goto LABEL_13;
      }
      if (!v21)
        goto LABEL_19;
      objc_msgSend(v7, "wrTracker");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "workflow");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
      v28 = -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit");
      *(_DWORD *)buf = v37;
      v46 = v16;
      v47 = 1024;
      v48 = v8;
      v49 = 1024;
      v50 = v27;
      v51 = 1024;
      v52 = v9;
      v53 = 1024;
      v54 = v28;
      v19 = v13;
      v20 = "Workflow %{public}@ resetting per day counts (was %d/%d per day, %d/%d per period), still above limits";
LABEL_18:
      _os_log_impl(&dword_1CB87B000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x24u);

LABEL_19:
      ++v6;
    }
    while (v5 != v6);
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    v5 = v31;
  }
  while (v31);

  if ((v38 & 1) != 0)
  {
    -[STYWorkflowResponsivenessMonitorHelper updateAllowList](self, "updateAllowList");
    -[STYWorkflowResponsivenessMonitorHelper settingsChangedCallbackQueue](self, "settingsChangedCallbackQueue");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = (void *)v32;
      -[STYWorkflowResponsivenessMonitorHelper settingsChangedCallback](self, "settingsChangedCallback");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        -[STYWorkflowResponsivenessMonitorHelper settingsChangedCallbackQueue](self, "settingsChangedCallbackQueue");
        v35 = objc_claimAutoreleasedReturnValue();
        -[STYWorkflowResponsivenessMonitorHelper settingsChangedCallback](self, "settingsChangedCallback");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        obj = v35;
        dispatch_async(v35, v36);

        goto LABEL_27;
      }
    }
  }
}

- (void)resetPerPeriodCounts
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  const char *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  __int128 v37;
  char v38;
  id obj;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[STYWorkflowResponsivenessMonitorHelper workflowEventTrackers](self, "workflowEventTrackers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
  if (!v3)
  {
LABEL_27:

    return;
  }
  v5 = v3;
  v38 = 0;
  v40 = *(_QWORD *)v42;
  *(_QWORD *)&v4 = 138544386;
  v37 = v4;
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v42 != v40)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v6);
      v8 = objc_msgSend(v7, "perDayEventCount", v37);
      v9 = objc_msgSend(v7, "perPeriodEventCount");
      v10 = -[STYWorkflowResponsivenessMonitorHelper workflowIsUnderLimits:](self, "workflowIsUnderLimits:", v7);
      objc_msgSend(v7, "setPerPeriodEventCount:", 0);
      v11 = -[STYWorkflowResponsivenessMonitorHelper workflowIsUnderLimits:](self, "workflowIsUnderLimits:", v7);
      +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logHandle");
      v13 = objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        if (v11)
        {
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            goto LABEL_19;
          objc_msgSend(v7, "wrTracker");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "workflow");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
          v18 = -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit");
          *(_DWORD *)buf = v37;
          v46 = v16;
          v47 = 1024;
          v48 = v8;
          v49 = 1024;
          v50 = v17;
          v51 = 1024;
          v52 = v9;
          v53 = 1024;
          v54 = v18;
          v19 = v13;
          v20 = "Workflow %{public}@ resetting per period counts (was %d/%d per day, %d/%d per period), was already under limits";
          goto LABEL_18;
        }
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
LABEL_15:
          v38 = 1;
          goto LABEL_19;
        }
        objc_msgSend(v7, "wrTracker");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "workflow");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
        v30 = -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit");
        *(_DWORD *)buf = v37;
        v46 = v24;
        v47 = 1024;
        v48 = v8;
        v49 = 1024;
        v50 = v29;
        v51 = 1024;
        v52 = v9;
        v53 = 1024;
        v54 = v30;
        _os_log_fault_impl(&dword_1CB87B000, v13, OS_LOG_TYPE_FAULT, "Workflow %{public}@ resetting per period counts (was %d/%d per day, %d/%d per period), was already under limits, and is now above limit!", buf, 0x24u);
LABEL_13:

        goto LABEL_15;
      }
      v21 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (!v21)
          goto LABEL_15;
        objc_msgSend(v7, "wrTracker");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "workflow");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
        v26 = -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit");
        *(_DWORD *)buf = v37;
        v46 = v24;
        v47 = 1024;
        v48 = v8;
        v49 = 1024;
        v50 = v25;
        v51 = 1024;
        v52 = v9;
        v53 = 1024;
        v54 = v26;
        _os_log_impl(&dword_1CB87B000, v13, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ resetting per period counts (was %d/%d per day, %d/%d per period), turning on signpost streaming", buf, 0x24u);
        goto LABEL_13;
      }
      if (!v21)
        goto LABEL_19;
      objc_msgSend(v7, "wrTracker");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "workflow");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
      v28 = -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit");
      *(_DWORD *)buf = v37;
      v46 = v16;
      v47 = 1024;
      v48 = v8;
      v49 = 1024;
      v50 = v27;
      v51 = 1024;
      v52 = v9;
      v53 = 1024;
      v54 = v28;
      v19 = v13;
      v20 = "Workflow %{public}@ resetting per period counts (was %d/%d per day, %d/%d per period), still above limits";
LABEL_18:
      _os_log_impl(&dword_1CB87B000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x24u);

LABEL_19:
      ++v6;
    }
    while (v5 != v6);
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    v5 = v31;
  }
  while (v31);

  if ((v38 & 1) != 0)
  {
    -[STYWorkflowResponsivenessMonitorHelper updateAllowList](self, "updateAllowList");
    -[STYWorkflowResponsivenessMonitorHelper settingsChangedCallbackQueue](self, "settingsChangedCallbackQueue");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = (void *)v32;
      -[STYWorkflowResponsivenessMonitorHelper settingsChangedCallback](self, "settingsChangedCallback");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        -[STYWorkflowResponsivenessMonitorHelper settingsChangedCallbackQueue](self, "settingsChangedCallbackQueue");
        v35 = objc_claimAutoreleasedReturnValue();
        -[STYWorkflowResponsivenessMonitorHelper settingsChangedCallback](self, "settingsChangedCallback");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        obj = v35;
        dispatch_async(v35, v36);

        goto LABEL_27;
      }
    }
  }
}

- (void)workflowEventCompleted:(id)a3 completedWRTracker:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[STYWorkflowResponsivenessMonitorHelper workflowIsUnderLimits:](self, "workflowIsUnderLimits:", v6);
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logHandle");
  v10 = objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "workflow");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "name");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138544386;
      v38 = v33;
      v39 = 1024;
      v40 = objc_msgSend(v6, "perDayEventCount");
      v41 = 1024;
      v42 = -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
      v43 = 1024;
      v44 = objc_msgSend(v6, "perPeriodEventCount");
      v45 = 1024;
      v46 = -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit");
      _os_log_impl(&dword_1CB87B000, v10, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ already exceeded limits (%d/%d per day, %d/%d per period), not reporting completed event", (uint8_t *)&v37, 0x24u);

    }
    goto LABEL_20;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "workflow");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "name");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138544386;
    v38 = v36;
    v39 = 1024;
    v40 = objc_msgSend(v6, "perDayEventCount");
    v41 = 1024;
    v42 = -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
    v43 = 1024;
    v44 = objc_msgSend(v6, "perPeriodEventCount");
    v45 = 1024;
    v46 = -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit");
    _os_log_debug_impl(&dword_1CB87B000, v10, OS_LOG_TYPE_DEBUG, "Workflow %{public}@ below limits (%d/%d per day, %d/%d per period)", (uint8_t *)&v37, 0x24u);

  }
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logHandle");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "workflow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138543362;
    v38 = v14;
    _os_log_impl(&dword_1CB87B000, v12, OS_LOG_TYPE_INFO, "Workflow %{public}@ event completed, gathering diagnostics if needed", (uint8_t *)&v37, 0xCu);

  }
  v15 = objc_msgSend(v7, "gatherDiagnosticsIfNeeded");
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logHandle");
  v10 = objc_claimAutoreleasedReturnValue();

  v17 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v15 & 1) == 0)
  {
    if (!v17)
    {
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v7, "workflow");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "name");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138543362;
    v38 = v34;
    _os_log_impl(&dword_1CB87B000, v10, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ event completed, no diagnostics were needed", (uint8_t *)&v37, 0xCu);

LABEL_19:
    goto LABEL_20;
  }
  if (v17)
  {
    objc_msgSend(v7, "workflow");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138543362;
    v38 = v19;
    _os_log_impl(&dword_1CB87B000, v10, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ event completed, diagnostics were kicked off", (uint8_t *)&v37, 0xCu);

  }
  objc_msgSend(v6, "setPerPeriodEventCount:", objc_msgSend(v6, "perPeriodEventCount") + 1);
  objc_msgSend(v6, "setPerDayEventCount:", objc_msgSend(v6, "perDayEventCount") + 1);
  if (!-[STYWorkflowResponsivenessMonitorHelper workflowIsUnderLimits:](self, "workflowIsUnderLimits:", v6))
  {
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logHandle");
    v21 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "workflow");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v6, "perDayEventCount");
      v25 = -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
      v26 = objc_msgSend(v6, "perPeriodEventCount");
      v27 = -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit");
      v37 = 138544386;
      v38 = v23;
      v39 = 1024;
      v40 = v24;
      v41 = 1024;
      v42 = v25;
      v43 = 1024;
      v44 = v26;
      v45 = 1024;
      v46 = v27;
      _os_log_impl(&dword_1CB87B000, v21, OS_LOG_TYPE_DEFAULT, "Workflow %{public}@ hit report limit (%d/%d per day, %d/%d per period), turning off signpost streaming", (uint8_t *)&v37, 0x24u);

    }
    -[STYWorkflowResponsivenessMonitorHelper updateAllowList](self, "updateAllowList");
    -[STYWorkflowResponsivenessMonitorHelper settingsChangedCallbackQueue](self, "settingsChangedCallbackQueue");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)v28;
      -[STYWorkflowResponsivenessMonitorHelper settingsChangedCallback](self, "settingsChangedCallback");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        -[STYWorkflowResponsivenessMonitorHelper settingsChangedCallbackQueue](self, "settingsChangedCallbackQueue");
        v10 = objc_claimAutoreleasedReturnValue();
        -[STYWorkflowResponsivenessMonitorHelper settingsChangedCallback](self, "settingsChangedCallback");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_async(v10, v31);
        goto LABEL_19;
      }
    }
  }
LABEL_21:

}

- (void)updateAllowList
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  SignpostSupportSubsystemCategoryAllowlist *allowList;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[STYWorkflowResponsivenessMonitorHelper workflowEventTrackers](self, "workflowEventTrackers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v9 = -[STYWorkflowResponsivenessMonitorHelper workflowIsUnderLimits:](self, "workflowIsUnderLimits:", v8);
        +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logHandle");
        v11 = objc_claimAutoreleasedReturnValue();

        v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
        if (v9)
        {
          if (v12)
          {
            objc_msgSend(v8, "wrTracker");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "workflow");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v8, "perDayEventCount");
            v16 = -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
            v17 = objc_msgSend(v8, "perPeriodEventCount");
            v18 = -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit");
            *(_DWORD *)buf = 138544386;
            v36 = v15;
            v37 = 1024;
            v38 = v25;
            v39 = 1024;
            v40 = v16;
            v41 = 1024;
            v42 = v17;
            v43 = 1024;
            v44 = v18;
            _os_log_debug_impl(&dword_1CB87B000, v11, OS_LOG_TYPE_DEBUG, "Workflow %{public}@ is below limit (%d/%d per day, %d/%d per period), including in allowlist", buf, 0x24u);

          }
          if (!v5)
            v5 = objc_alloc_init(MEMORY[0x1E0D97680]);
          objc_msgSend(v8, "wrTracker");
          v11 = objc_claimAutoreleasedReturnValue();
          -[NSObject workflow](v11, "workflow");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "allowListForDiagnostics");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addAllowlist:", v14);

        }
        else if (v12)
        {
          objc_msgSend(v8, "wrTracker");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "workflow");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v8, "perDayEventCount");
          v21 = -[STYWorkflowResponsivenessMonitorHelper perDayLogLimit](self, "perDayLogLimit");
          v22 = objc_msgSend(v8, "perPeriodEventCount");
          v23 = -[STYWorkflowResponsivenessMonitorHelper perPeriodLogLimit](self, "perPeriodLogLimit");
          *(_DWORD *)buf = 138544386;
          v36 = v19;
          v37 = 1024;
          v38 = v20;
          v39 = 1024;
          v40 = v21;
          v41 = 1024;
          v42 = v22;
          v43 = 1024;
          v44 = v23;
          _os_log_debug_impl(&dword_1CB87B000, v11, OS_LOG_TYPE_DEBUG, "Workflow %{public}@ is above limit (%d/%d per day, %d/%d per period), not including in allowlist", buf, 0x24u);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  allowList = self->_allowList;
  self->_allowList = (SignpostSupportSubsystemCategoryAllowlist *)v5;

}

- (int)periodLengthSec
{
  return self->_periodLengthSec;
}

- (void)setPeriodLengthSec:(int)a3
{
  int periodLengthSec;
  NSObject *v6;
  _QWORD v7[5];
  int v8;
  int v9;

  periodLengthSec = self->_periodLengthSec;
  self->_periodLengthSec = a3;
  if (periodLengthSec != a3)
  {
    -[STYSignpostsMonitorHelper processingQueue](self, "processingQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__STYWorkflowResponsivenessMonitorHelper_setPeriodLengthSec___block_invoke;
    v7[3] = &unk_1E86A0EE0;
    v7[4] = self;
    v8 = periodLengthSec;
    v9 = a3;
    dispatch_async(v6, v7);

  }
}

void __61__STYWorkflowResponsivenessMonitorHelper_setPeriodLengthSec___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  int v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "perPeriodTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logHandle");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_DWORD *)(a1 + 40);
      v6 = *(_DWORD *)(a1 + 44);
      v8[0] = 67109376;
      v8[1] = v5;
      v9 = 1024;
      v10 = v6;
      _os_log_impl(&dword_1CB87B000, v4, OS_LOG_TYPE_DEFAULT, "Workflow Responsiveness logging period changed from %ds to %ds while actively monitoring", (uint8_t *)v8, 0xEu);
    }

    objc_msgSend(*(id *)(a1 + 32), "resetPerPeriodCounts");
    objc_msgSend(*(id *)(a1 + 32), "perPeriodTimer");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v7, 0xFFFFFFFFFFFFFFFELL, 1000000000 * (int)objc_msgSend(*(id *)(a1 + 32), "periodLengthSec"), 1000000000 * (int)objc_msgSend(*(id *)(a1 + 32), "periodLengthSec") / 0xAuLL);

  }
}

- (int)perDayLogLimit
{
  return self->_perDayLogLimit;
}

- (void)setPerDayLogLimit:(int)a3
{
  self->_perDayLogLimit = a3;
}

- (int)perPeriodLogLimit
{
  return self->_perPeriodLogLimit;
}

- (void)setPerPeriodLogLimit:(int)a3
{
  self->_perPeriodLogLimit = a3;
}

- (WRWorkflowProvider)workflowProvider
{
  return (WRWorkflowProvider *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWorkflowProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)workflowEventTrackers
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setWorkflowEventTrackers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (OS_dispatch_queue)settingsChangedCallbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSettingsChangedCallbackQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (id)settingsChangedCallback
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setSettingsChangedCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (OS_dispatch_source)perDayTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPerDayTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OS_dispatch_source)perPeriodTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPerPeriodTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perPeriodTimer, 0);
  objc_storeStrong((id *)&self->_perDayTimer, 0);
  objc_storeStrong(&self->_settingsChangedCallback, 0);
  objc_storeStrong((id *)&self->_settingsChangedCallbackQueue, 0);
  objc_storeStrong((id *)&self->_workflowEventTrackers, 0);
  objc_storeStrong((id *)&self->_workflowProvider, 0);
  objc_storeStrong((id *)&self->_allowList, 0);
}

@end
