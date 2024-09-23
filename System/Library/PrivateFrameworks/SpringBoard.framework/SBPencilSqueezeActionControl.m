@implementation SBPencilSqueezeActionControl

- (id)initWithDefaults:(void *)a1
{
  id v4;
  void *v5;
  id *v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id *v14;
  id *v15;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = v4;
  if (a1)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("defaults != ((void *)0)"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBPencilSqueezeActionControl initWithDefaults:].cold.1(sel_initWithDefaults_);
      objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0B7EDACLL);
    }
    v21.receiver = a1;
    v21.super_class = (Class)SBPencilSqueezeActionControl;
    v6 = (id *)objc_msgSendSuper2(&v21, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong(v6 + 1, a2);
      objc_initWeak(&location, v7);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "squeezeConfiguredActionArchive");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C80D38];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __49__SBPencilSqueezeActionControl_initWithDefaults___block_invoke;
      v18[3] = &unk_1E8E9DF28;
      objc_copyWeak(&v19, &location);
      v11 = (id)objc_msgSend(v5, "observeDefaults:onQueue:withBlock:", v9, MEMORY[0x1E0C80D38], v18);

      -[SBPencilSqueezeActionControl _updateSelectedAction]((uint64_t)v7);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v14 = v7;
    else
      v14 = 0;
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __49__SBPencilSqueezeActionControl_initWithDefaults___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBPencilSqueezeActionControl _updateSelectedAction]((uint64_t)WeakRetained);

}

- (void)_updateSelectedAction
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "(%{public}@) Error unarchiving squeeze action: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (BOOL)performSqueezeActionWithTimestamp:(uint64_t)a1
{
  __CFString *v3;
  __CFString *v4;
  NSObject *v5;
  __CFString *v6;
  _BOOL8 v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v16;
  __CFString *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("timestamp != ((void *)0)"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBPencilSqueezeActionControl performSqueezeActionWithTimestamp:].cold.1(sel_performSqueezeActionWithTimestamp_);
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0B7F2C8);
    }
    SBLogPencilSqueeze();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v19 = a1;
      v20 = 2114;
      v21 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) requested to perform action with timestamp: %{public}@", buf, 0x16u);
    }

    v6 = (__CFString *)*(id *)(a1 + 16);
    v17 = 0;
    v7 = -[SBPencilSqueezeActionControl _shouldPerformAction:withReason:](a1, (uint64_t)v6, (const __CFString **)&v17);
    v8 = v17;
    if (v7)
    {
      -[SBPencilSqueezeActionControl _runnerClientForAction:timestamp:](a1, v6, v4);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 24);
      if (v10)
      {
        if ((objc_msgSend(v10, "containsObject:", v9) & 1) == 0)
          objc_msgSend(*(id *)(a1 + 24), "addObject:", v9);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v11;

      }
      SBLogPencilSqueeze();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543875;
        v19 = a1;
        v20 = 2113;
        v21 = v6;
        v22 = 2114;
        v23 = v9;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@) performing action '%{private}@' with runner client '%{public}@'", buf, 0x20u);
      }

      -[NSObject startWithPreciseTimeStamp:](v9, "startWithPreciseTimeStamp:", v4);
      if ((AnalyticsSendEventLazy() & 1) == 0)
      {
        SBLogPencilSqueeze();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[SBPencilSqueezeActionControl performSqueezeActionWithTimestamp:].cold.2(v14);

      }
    }
    else
    {
      SBLogPencilSqueeze();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543875;
        v19 = a1;
        v20 = 2114;
        v21 = v8;
        v22 = 2113;
        v23 = v6;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) Disallowing action (%{public}@); action: %{private}@",
          buf,
          0x20u);
      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldPerformAction:(const __CFString *)a3 withReason:
{
  const __CFString *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v10;

  if (!a1)
    return 0;
  if (a2)
    v5 = 0;
  else
    v5 = CFSTR("no action to perform");
  objc_msgSend((id)SBApp, "lockOutController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if ((objc_msgSend(v6, "isBlocked") & 1) != 0)
    {
      v5 = CFSTR("device is blocked out");
      if (!a3)
        goto LABEL_13;
      goto LABEL_12;
    }
    if ((objc_msgSend(v7, "isProximityReaderBlocked") & 1) == 0)
    {
      +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isInSetupMode"))
        v5 = CFSTR("device is in setup mode");
      else
        v5 = 0;

      if (!a3)
        goto LABEL_13;
      goto LABEL_12;
    }
    v5 = CFSTR("device is proximity reader blocked out");
  }
  if (a3)
LABEL_12:
    *a3 = v5;
LABEL_13:
  v8 = v5 == 0;

  return v8;
}

- (id)_runnerClientForAction:(void *)a3 timestamp:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = *(void **)(a1 + 24);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__SBPencilSqueezeActionControl__runnerClientForAction_timestamp___block_invoke;
    v13[3] = &unk_1E8EB87B8;
    v8 = v5;
    v14 = v8;
    objc_msgSend(v7, "bs_firstObjectPassingTest:", v13);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      SBLogPencilSqueeze();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543875;
        v16 = a1;
        v17 = 2114;
        v18 = v10;
        v19 = 2113;
        v20 = v8;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@) found active runner %{public}@ to use for action: %{private}@", buf, 0x20u);
      }

    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7C28]), "initWithSystemAction:preciseTimeStamp:", v8, v6);
      objc_msgSend(v10, "setDelegate:", a1);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __66__SBPencilSqueezeActionControl_performSqueezeActionWithTimestamp___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v5[0] = &unk_1E91D1850;
  v4[0] = CFSTR("action");
  v4[1] = CFSTR("bundleId_category");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  v5[2] = &unk_1E91D1868;
  v4[2] = CFSTR("pencilVersion");
  v4[3] = CFSTR("trigger");
  v5[3] = &unk_1E91D1880;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  -[SBPencilSqueezeActionControl _runnerClientDidFinish:withResult:cancelled:]((uint64_t)self, a3, a5, a6);
}

- (void)_runnerClientDidFinish:(void *)a3 withResult:(int)a4 cancelled:
{
  id v7;
  id v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v9 = objc_msgSend(*(id *)(a1 + 24), "containsObject:", v7);
    SBLogPencilSqueeze();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        v12 = 138544386;
        v13 = a1;
        v14 = 2114;
        v15 = v7;
        v16 = 1024;
        v17 = v8 == 0;
        v18 = 1024;
        v19 = a4;
        v20 = 2114;
        v21 = v8;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@) runner '%{public}@' did finish successfully: %{BOOL}u\n    cancelled: %{BOOL}u\n    error: %{public}@", (uint8_t *)&v12, 0x2Cu);
      }

      objc_msgSend(*(id *)(a1 + 24), "removeObject:", v7);
    }
    else
    {
      if (v11)
      {
        v12 = 138543618;
        v13 = a1;
        v14 = 2114;
        v15 = v7;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@) skipping finished result from no-longer-tracked runner client '%{public}@'", (uint8_t *)&v12, 0x16u);
      }

    }
  }

}

uint64_t __65__SBPencilSqueezeActionControl__runnerClientForAction_timestamp___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if ((objc_msgSend(v3, "hasCompletedRun") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningRunnerClients, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

- (void)initWithDefaults:(const char *)a1 .cold.1(const char *a1)
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
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)performSqueezeActionWithTimestamp:(const char *)a1 .cold.1(const char *a1)
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
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)performSqueezeActionWithTimestamp:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Failed to send CA event", v1, 2u);
}

@end
