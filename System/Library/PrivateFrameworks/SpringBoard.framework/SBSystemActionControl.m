@implementation SBSystemActionControl

- (uint64_t)isSelectedActionHostedByApplicationWithBundleIdentifier:(uint64_t)result
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (result)
  {
    v2 = *(void **)(result + 32);
    v3 = a2;
    objc_msgSend(v2, "selectedSystemAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v3, "isEqualToString:", v5);
    return v6;
  }
  return result;
}

- (id)initWithDataSource:(void *)a3 previewCoordinator:(void *)a4 authenticationStatusProvider:(void *)a5 coachingController:(void *)a6 soundController:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  objc_super v25;

  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  obj = a6;
  v16 = a6;
  v17 = v16;
  if (!a1)
    goto LABEL_9;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("dataSource != ((void *)0)"), obj);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionControl initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:].cold.1();
LABEL_24:
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0817F9CLL);
  }
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("previewCoordinator != ((void *)0)"), obj);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionControl initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:].cold.2();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0818004);
  }
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("authenticationStatusProvider != ((void *)0)"), obj);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionControl initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:].cold.3();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D081806CLL);
  }
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("coachingController != ((void *)0)"), obj);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionControl initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:].cold.4();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D08180D4);
  }
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("soundController != ((void *)0)"), obj);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionControl initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:].cold.5();
    goto LABEL_24;
  }
  v25.receiver = a1;
  v25.super_class = (Class)SBSystemActionControl;
  v18 = (id *)objc_msgSendSuper2(&v25, sel_init);
  a1 = v18;
  if (v18)
  {
    objc_storeStrong(v18 + 4, a2);
    objc_msgSend(v12, "addObserver:", a1);
    objc_storeStrong(a1 + 5, a3);
    objc_storeStrong(a1 + 6, a4);
    objc_storeStrong(a1 + 7, a5);
    -[SBHomeScreenConfigurationServer setDelegate:]((id *)a1[7], a1);
    objc_storeStrong(a1 + 8, obj);
    -[SBSystemActionControl _configureWithSelectedAction]((uint64_t)a1);
  }
LABEL_9:

  return a1;
}

- (void)_configureWithSelectedAction
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
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

- (uint64_t)selectedActionAnalyticsData
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "selectedSystemAction");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "analyticsData");

  return v2;
}

- (void)addObserver:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v7 = v3;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v5;

      v4 = *(void **)(a1 + 8);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)removeObserver:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "removeObject:", a2);
  return result;
}

- (void)addSystemActionValidator:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (id)previewSelectedActionFromSource:(void *)a3 withSuppressionStatus:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  unsigned __int8 v28;
  uint8_t buf[4];
  id *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (!objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[source length] > 0"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionControl previewSelectedActionFromSource:withSuppressionStatus:].cold.1();
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0818A50);
    }
    v7 = a1[4];
    objc_msgSend(v7, "selectedSystemAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0;
    v27 = 0;
    v9 = -[SBSystemActionControl _shouldPerformAction:withSuppressionStatus:reason:isSuppressed:]((uint64_t)a1, v8, v6, &v27, &v28);
    v10 = v27;
    v11 = 2 * v28;
    +[SBSystemActionAnalyticsTracker sharedTracker]();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemActionAnalyticsTracker trackInteractionWithType:forAction:suppressionStatus:]((uint64_t)v12, v11, v8, v6);

    if (v9)
    {
      SBLogSystemActionControl();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v30 = a1;
        v31 = 2114;
        v32 = v5;
        v33 = 2114;
        v34 = v6;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@) requested to preview selected action from source '%{public}@' with suppression status: %{public}@", buf, 0x20u);
      }

      v14 = a1[9];
      if (v14)
      {
        SBLogSystemActionControl();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v30 = a1;
          v31 = 2114;
          v32 = v14;
          _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "(%{public}@) cannot preview action; an executor is already previewing: %{public}@",
            buf,
            0x16u);
        }
        a1 = 0;
      }
      else
      {
        -[SBSystemActionControl _executorForSystemAction:]((uint64_t)a1, v8);
        v15 = objc_claimAutoreleasedReturnValue();
        -[SBSystemActionControl _noteWillPreviewAction:]((uint64_t)a1, v8);
        v17 = a1[5];
        objc_storeStrong(a1 + 9, v15);
        -[NSObject previewWithCoordinator:](v15, "previewWithCoordinator:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          -[SBSystemActionControl _cancelCameraPrewarmIfNecessaryForAction:]((uint64_t)a1, v8);
          objc_msgSend(a1[10], "invalidate");
          v19 = a1[10];
          a1[10] = 0;

          v20 = a1[9];
          a1[9] = 0;

          a1 = 0;
        }
        else
        {
          v22 = objc_alloc(MEMORY[0x1E0D01868]);
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __79__SBSystemActionControl_previewSelectedActionFromSource_withSuppressionStatus___block_invoke;
          v25[3] = &unk_1E8EA8488;
          v25[4] = a1;
          v26 = v5;
          a1 = (id *)objc_msgSend(v22, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("SBSystemAction-Previewing"), v26, v25);

        }
      }

    }
    else
    {
      if (v28)
      {
        SBLogSystemActionSuppression();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v30 = a1;
          v31 = 2114;
          v32 = v8;
          v33 = 2114;
          v34 = v10;
          _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "(%{public}@) Suppressing action: %{public}@; %{public}@",
            buf,
            0x20u);
        }

      }
      else
      {
        SBLogSystemActionControl();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v30 = a1;
          v31 = 2114;
          v32 = v10;
          v33 = 2114;
          v34 = v8;
          _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "(%{public}@) Disallowing action (%{public}@); action: %{public}@",
            buf,
            0x20u);
        }

        objc_msgSend(a1[5], "provideDiscreteNoActionInteractionFeedback");
      }
      a1 = 0;
    }

  }
  return a1;
}

- (BOOL)_shouldPerformAction:(void *)a3 withSuppressionStatus:(_QWORD *)a4 reason:(_BYTE *)a5 isSuppressed:
{
  id v9;
  id v10;
  void *v11;
  __CFString *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  objc_class *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  BOOL v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  if (!a1)
  {
    v32 = 0;
    goto LABEL_40;
  }
  objc_msgSend((id)SBApp, "lockOutController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isBlocked") & 1) != 0)
  {
    v12 = CFSTR("device is blocked out");
  }
  else if ((objc_msgSend(v11, "isProximityReaderBlocked") & 1) != 0)
  {
    v12 = CFSTR("device is prox reader locked out");
  }
  else
  {
    +[SBSOSEventHandler sharedInstance](SBSOSEventHandler, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isSOSActive");

    if ((v14 & 1) != 0)
    {
      v12 = CFSTR("SOS is active");
    }
    else
    {
      if (v10
        && -[SBCameraActivationManager workspace]((uint64_t)v10) == 1
        && (objc_msgSend(v9, "shouldBePerformedWhenSuppressed") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("suppression status: %@"), v10);
        v15 = objc_claimAutoreleasedReturnValue();
        v12 = (__CFString *)v15;
        if (a5)
          *a5 = 1;
        if (v15)
          goto LABEL_37;
      }
      objc_msgSend(v9, "configuredAction");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sectionIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("Nothing"));

      if ((v18 & 1) != 0)
      {
        v12 = CFSTR("don't perform the nothing action");
      }
      else if ((objc_msgSend(v9, "canBePerformedInSetupMode") & 1) != 0
             || (+[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance"),
                 v19 = (void *)objc_claimAutoreleasedReturnValue(),
                 v20 = objc_msgSend(v19, "isInSetupMode"),
                 v19,
                 (v20 & 1) == 0))
      {
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v21 = *(id *)(a1 + 16);
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        if (v22)
        {
          v23 = v22;
          v34 = v11;
          v35 = v10;
          v12 = 0;
          v24 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v37 != v24)
                objc_enumerationMutation(v21);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "shouldPreviewSystemAction:", v9) & 1) == 0)
              {
                v26 = (void *)MEMORY[0x1E0CB3940];
                v27 = (objc_class *)objc_opt_class();
                NSStringFromClass(v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "stringWithFormat:", CFSTR("%@ did not validate previewing the action"), v28);
                v29 = objc_claimAutoreleasedReturnValue();

                v12 = (__CFString *)v29;
              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
          }
          while (v23);

          v10 = v35;
          v11 = v34;
          if (v12)
            goto LABEL_37;
        }
        else
        {

        }
        if (objc_msgSend(v9, "hostBundleRequiresValidation"))
        {
          objc_msgSend(v9, "hostBundleIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v30, 0, 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            v12 = 0;
          else
            v12 = CFSTR("host bundle does not exist");

        }
        else
        {
          v12 = 0;
        }
      }
      else
      {
        v12 = CFSTR("device is in setup mode");
      }
    }
  }
LABEL_37:
  if (a4)
    *a4 = objc_retainAutorelease(v12);
  v40 = v12 == 0;

  v32 = v40;
LABEL_40:

  return v32;
}

- (id)_executorForSystemAction:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 24);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __50__SBSystemActionControl__executorForSystemAction___block_invoke;
    v16 = &unk_1E8EA84D8;
    v6 = v3;
    v17 = v6;
    objc_msgSend(v5, "bs_firstObjectPassingTest:", &v13);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      SBLogSystemActionControl();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v19 = a1;
        v20 = 2114;
        v21 = v8;
        v22 = 2114;
        v23 = v6;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) found running executor %{public}@ to use for action: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      v9 = *(id *)(a1 + 32);
      -[NSObject executorForSystemAction:](v9, "executorForSystemAction:", v6);
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v10 = objc_msgSend(v6, "newExecutor");
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) cannot preview selected action '%@' without an executor; dataSource: %@"),
            a1,
            v6,
            v9,
            v13,
            v14,
            v15,
            v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[SBSystemActionControl _executorForSystemAction:].cold.1();
          objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1D0818F80);
        }
      }
      v8 = (void *)v10;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_noteWillPreviewAction:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[SBSystemActionControl _prewarmCameraIfNecessaryForAction:](a1, v3);
    -[SBSystemActionControl _activateFeedbackForAction:](a1, (uint64_t)v3);

  }
}

- (void)_noteFailedToPreviewAction:(uint64_t)a1
{
  void *v3;

  if (a1)
  {
    -[SBSystemActionControl _cancelCameraPrewarmIfNecessaryForAction:](a1, a2);
    objc_msgSend(*(id *)(a1 + 80), "invalidate");
    v3 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

  }
}

BOOL __79__SBSystemActionControl_previewSelectedActionFromSource_withSuppressionStatus___block_invoke(uint64_t a1)
{
  return -[SBSystemActionControl _cancelPreviewingSelectedActionFromSource:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (BOOL)_cancelPreviewingSelectedActionFromSource:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  _BOOL8 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!objc_msgSend(v3, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[source length] > 0"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionControl _cancelPreviewingSelectedActionFromSource:].cold.1();
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D08191C4);
    }
    v5 = *(id *)(a1 + 72);
    v6 = v5 != 0;
    if (v5)
    {
      SBLogSystemActionControl();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v14 = a1;
        v15 = 2114;
        v16 = v4;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) Cancelling previewing selected action from source '%{public}@'", buf, 0x16u);
      }

      objc_msgSend(v5, "systemAction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemActionControl _cancelCameraPrewarmIfNecessaryForAction:](a1, v8);
      objc_msgSend(*(id *)(a1 + 80), "invalidate");
      v9 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = 0;

      objc_msgSend(v5, "cancelPreviewing");
      v10 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)performSelectedActionFromSource:(void *)a3 withContext:
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (!objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[source length] > 0"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionControl performSelectedActionFromSource:withContext:].cold.1(sel_performSelectedActionFromSource_withContext_);
      objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D081970CLL);
    }
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("context != ((void *)0)"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionControl performSelectedActionFromSource:withContext:].cold.2(sel_performSelectedActionFromSource_withContext_);
      objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0819770);
    }
    SBLogSystemActionControl();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v36 = a1;
      v37 = 2114;
      v38 = v5;
      v39 = 2114;
      v40 = v6;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) requested to perform selected action from source '%{public}@' with context: %{public}@", buf, 0x20u);
    }

    v8 = *(id *)(a1 + 72);
    if (v8)
    {
      -[SBHomeScreenConfigurationServer authenticator]((uint64_t)v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SBCameraActivationManager workspace]((uint64_t)v9) == 1)
      {
        objc_msgSend(v8, "systemAction");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "shouldBePerformedWhenSuppressed");

        if ((v11 & 1) == 0)
        {
          SBLogSystemActionSuppression();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v8, "systemAction");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBHomeScreenConfigurationServer authenticator]((uint64_t)v6);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v36 = a1;
            v37 = 2114;
            v38 = v13;
            v39 = 2114;
            v40 = v14;
            _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "(%{public}@) Suppressing action: %{public}@, suppression status: %{public}@", buf, 0x20u);

          }
          -[SBSystemActionControl _cancelPreviewingSelectedActionFromSource:](a1, v5);
          +[SBSystemActionAnalyticsTracker sharedTracker]();
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "systemAction");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBHomeScreenConfigurationServer authenticator]((uint64_t)v6);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSystemActionAnalyticsTracker trackInteractionWithType:forAction:suppressionStatus:]((uint64_t)v15, 2, v16, v17);

LABEL_14:
          a1 = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      else
      {

      }
      v18 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = 0;

      v19 = *(void **)(a1 + 24);
      if (v19)
      {
        objc_msgSend(v19, "addObject:", v8);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v8);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v20;

      }
      objc_msgSend(v8, "systemAction");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected to get a valid action at this point"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[SBSystemActionControl performSelectedActionFromSource:withContext:].cold.3();
        objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1D08197C8);
      }
      SBLogSystemActionControl();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v23))
      {
        *(_DWORD *)buf = 138543874;
        v36 = a1;
        v37 = 2114;
        v38 = v22;
        v39 = 2114;
        v40 = v8;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_SYSTEM_ACTION_PERFORM_EXECUTION", "(%{public}@) performing action '%{public}@' with executor '%{public}@'", buf, 0x20u);
      }

      kdebug_trace();
      SBLogSystemActionControl();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v36 = a1;
        v37 = 2114;
        v38 = v22;
        v39 = 2114;
        v40 = v8;
        _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "(%{public}@) performing action '%{public}@' with executor '%{public}@'", buf, 0x20u);
      }

      +[SBSystemActionAnalyticsTracker sharedTracker]();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHomeScreenConfigurationServer authenticator]((uint64_t)v6);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemActionAnalyticsTracker trackInteractionWithType:forAction:suppressionStatus:]((uint64_t)v25, 1, v22, v26);

      -[SBSystemActionControl _noteWillPerformAction:](a1, v22);
      -[SBSystemActionControl _executionHandlerForExecutor:]((void *)a1, v8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, (id)a1);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __69__SBSystemActionControl_performSelectedActionFromSource_withContext___block_invoke;
      v32[3] = &unk_1E8EA84B0;
      objc_copyWeak(&v34, (id *)buf);
      v15 = v22;
      v33 = v15;
      objc_msgSend(v8, "executeWithContext:executionHandler:completion:", v6, v27, v32);
      a1 = objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)buf);

      goto LABEL_25;
    }
    SBLogSystemActionControl();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = a1;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "(%{public}@) no action to perform since no action is previewing", buf, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_26:

  return (id)a1;
}

- (void)_noteWillPerformAction:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (a1)
  {
    -[SBSystemActionControl _playFeedbackForAction:](a1, (uint64_t)v10);
    objc_msgSend(*(id *)(a1 + 80), "invalidate");
    v3 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

    if (objc_msgSend(v10, "shouldWakeScreenWhenPerformed"))
    {
      objc_msgSend(*(id *)(a1 + 40), "windowScene");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lockScreenManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "configuredAction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Performing action: %@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "requestUserAttentionScreenWakeFromSource:reason:", 39, v9);
    }
  }

}

- (id)_executionHandlerForExecutor:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __54__SBSystemActionControl__executionHandlerForExecutor___block_invoke;
    v10 = &unk_1E8EA8500;
    v11 = a1;
    v12 = v3;
    v5 = (void *)MEMORY[0x1D17E5550](&v7);
    a1 = (void *)objc_msgSend(v5, "copy", v7, v8, v9, v10, v11);

  }
  return a1;
}

void __69__SBSystemActionControl_performSelectedActionFromSource_withContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  -[SBSystemActionControl _executor:didFinishPerformingAction:withResult:]((uint64_t)WeakRetained, v7, *(void **)(a1 + 32), v6);

}

- (void)_executor:(void *)a3 didFinishPerformingAction:(void *)a4 withResult:
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  double v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _BYTE v24[14];
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if ((objc_msgSend(*(id *)(a1 + 24), "containsObject:", v7) & 1) != 0)
    {
      objc_msgSend(v7, "executionStartTime");
      v11 = v10;
      objc_msgSend(v7, "executionEndTime");
      v13 = v12;
      SBLogSystemActionControl();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        objc_msgSend(v7, "systemAction");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = a1;
        v21 = 2114;
        v22 = v15;
        v23 = 2114;
        *(_QWORD *)v24 = v7;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_SYSTEM_ACTION_PERFORM_EXECUTION", "(%{public}@) performing action '%{public}@' with executor '%{public}@'", (uint8_t *)&v19, 0x20u);

      }
      v16 = v13 - v11;

      kdebug_trace();
      SBLogSystemActionControl();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138544386;
        v20 = a1;
        v21 = 2114;
        v22 = v7;
        v23 = 1024;
        *(_DWORD *)v24 = v9 == 0;
        *(_WORD *)&v24[4] = 2048;
        *(double *)&v24[6] = v16;
        v25 = 2114;
        v26 = v9;
        _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "(%{public}@) executor '%{public}@' did finish successfully: %{BOOL}u\n    executionTime: %fs\n    error: %{public}@", (uint8_t *)&v19, 0x30u);
      }

      objc_msgSend(*(id *)(a1 + 24), "removeObject:", v7);
      +[SBSystemActionAnalyticsTracker sharedTracker]();
      v18 = objc_claimAutoreleasedReturnValue();
      -[SBSystemActionAnalyticsTracker trackPerformedAction:executionTime:]((uint64_t)v18, v8, v16);
    }
    else
    {
      SBLogSystemActionControl();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = 138543618;
        v20 = a1;
        v21 = 2114;
        v22 = v7;
        _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_INFO, "(%{public}@) skipping processing finished result from no-longer-tracked executor '%{public}@'", (uint8_t *)&v19, 0x16u);
      }
    }

  }
}

- (BOOL)systemActionCoachingController:(id)a3 canPresentCoachingForAction:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "configuredAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Shortcuts"));

  if (v8)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = self->_runningExecutors;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "systemAction", (_QWORD)v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", v5);

          if ((v15 & 1) != 0)
          {
            v16 = 0;
            goto LABEL_13;
          }
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }
    v16 = 1;
LABEL_13:

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (void)systemActionDataSource:(id)a3 didUpdateSelectedAction:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  SBSystemActionControl *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  SBLogSystemActionControl();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) received updated selected action: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  -[SBSystemActionControl _configureWithSelectedAction]((uint64_t)self);
  +[SBSystemActionAnalyticsTracker sharedTracker]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemActionAnalyticsTracker trackSelectedActionChanged:](v7, v5);

}

- (void)_prewarmCameraIfNecessaryForAction:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[3];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1 && objc_msgSend(v3, "isCameraCaptureAction"))
  {
    +[SBCaptureApplicationCenter sharedInstance](SBCaptureApplicationCenter, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predictedPrewarmBundleIdentifierForApplicationBundleIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogSystemActionControl();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = a1;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@) prewarming camera for bundleID: '%{public}@' ", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", mach_absolute_time());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", mach_continuous_time());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0C8A058];
    v12 = *MEMORY[0x1E0C8A0B8];
    v14[0] = *MEMORY[0x1E0C8A0A0];
    v14[1] = v12;
    v15[0] = v11;
    v15[1] = v9;
    v14[2] = *MEMORY[0x1E0C8A0C8];
    v15[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AVCapturePrewarmWithOptions();

  }
}

- (void)_activateFeedbackForAction:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a1)
  {
    -[SBSystemActionControl _feedbackForAction:](a1, a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = *(id *)(a1 + 64);
    objc_msgSend(v3, "activateSound:forReason:", v6, CFSTR("SBSystemAction-Previewing"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = v4;

  }
}

- (void)_cancelCameraPrewarmIfNecessaryForAction:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1 && objc_msgSend(v3, "isCameraCaptureAction"))
  {
    objc_msgSend(v4, "hostBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogSystemActionControl();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v11 = a1;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) cancelling prewarming camera for bundleID: '%{public}@' ", buf, 0x16u);
    }

    v8 = *MEMORY[0x1E0C8A0A0];
    v9 = *MEMORY[0x1E0C8A058];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1D17E1D28](v5, v7);

  }
}

- (void)_deactivateFeedbackForAction:(uint64_t)a1
{
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 80), "invalidate");
    v2 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

  }
}

- (void)_playFeedbackForAction:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    -[SBSystemActionControl _feedbackForAction:](a1, a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "playSoundWithDefaultEnvironment:", v3);

  }
}

uint64_t __50__SBSystemActionControl__executorForSystemAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "canBeExecuted"))
  {
    objc_msgSend(v3, "systemAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __54__SBSystemActionControl__executionHandlerForExecutor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  SBLockScreenUnlockRequest *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[6];
  v5 = v4;
  if (objc_msgSend(*(id *)(a1 + 40), "requiresAuthenticationAtLeastOnceSinceBootBeforeExecution")
    && (objc_msgSend(v5, "hasAuthenticatedAtLeastOnceSinceBoot") & 1) == 0)
  {
    SBLogSystemActionControl();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v19 = v7;
      v20 = 2114;
      v21 = v8;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) requesting device authentication for executor '%{public}@'", buf, 0x16u);
    }

    v9 = objc_alloc_init(SBLockScreenUnlockRequest);
    -[SBLockScreenUnlockRequest setSource:](v9, "setSource:", 39);
    -[SBLockScreenUnlockRequest setIntent:](v9, "setIntent:", 2);
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenUnlockRequest setName:](v9, "setName:", v11);

    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      v13 = *(void **)(v12 + 40);
    else
      v13 = 0;
    objc_msgSend(v13, "windowScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lockScreenManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __54__SBSystemActionControl__executionHandlerForExecutor___block_invoke_94;
    v16[3] = &unk_1E8E9F1C0;
    v17 = v3;
    objc_msgSend(v15, "unlockWithRequest:completion:", v9, v16);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v3 + 2))(v3, 1, 0);
  }

}

void __54__SBSystemActionControl__executionHandlerForExecutor___block_invoke_94(uint64_t a1, char a2)
{
  uint64_t v3;
  id v4;

  if ((a2 & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    SBSystemActionExecutionErrorCreate(2, CFSTR("Post-boot authentication cancelled or failed"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (id)v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_notifyDidUpdateActionInteractionConfiguration
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    objc_msgSend(*(id *)(a1 + 8), "allObjects", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "systemActionControlDidUpdateActionInteractionConfiguration:", a1);
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

  }
}

- (id)_feedbackForAction:(uint64_t)a1
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 40), "customSoundForPerformingAction:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      v4 = v2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DAC2A0], "soundWithFeedbackEventType:", 1022);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlHost, 0);
  objc_storeStrong((id *)&self->_feedbackActivationAssertion, 0);
  objc_storeStrong((id *)&self->_previewingExecutor, 0);
  objc_storeStrong((id *)&self->_soundController, 0);
  objc_storeStrong((id *)&self->_coachingController, 0);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_storeStrong((id *)&self->_previewCoordinator, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_runningExecutors, 0);
  objc_storeStrong((id *)&self->_actionValidators, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
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

- (void)initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
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

- (void)initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
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

- (void)initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
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

- (void)initWithDataSource:previewCoordinator:authenticationStatusProvider:coachingController:soundController:.cold.5()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
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

- (void)previewSelectedActionFromSource:withSuppressionStatus:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
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

- (void)_executorForSystemAction:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
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

- (void)_cancelPreviewingSelectedActionFromSource:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
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

- (void)performSelectedActionFromSource:(const char *)a1 withContext:.cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_8_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)performSelectedActionFromSource:(const char *)a1 withContext:.cold.2(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_8_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)performSelectedActionFromSource:withContext:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
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
