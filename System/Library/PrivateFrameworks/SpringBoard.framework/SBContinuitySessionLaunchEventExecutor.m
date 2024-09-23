@implementation SBContinuitySessionLaunchEventExecutor

- (void)executeLaunchEvent:(id)a3 animatedly:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v6 = a4;
  v9 = a3;
  v10 = (void (**)(_QWORD))a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySessionLaunchEventExecutor.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  objc_msgSend(v9, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("notification"));

  if (v12)
  {
    -[SBContinuitySessionLaunchEventExecutor _executeNotificationLaunchEvent:animatedly:completion:](self, "_executeNotificationLaunchEvent:animatedly:completion:", v9, v6, v10);
  }
  else
  {
    objc_msgSend(v9, "type");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("widget"));

    if (v14)
    {
      -[SBContinuitySessionLaunchEventExecutor _executeWidgetLaunchEvent:animatedly:completion:](self, "_executeWidgetLaunchEvent:animatedly:completion:", v9, v6, v10);
    }
    else
    {
      objc_msgSend(v9, "type");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("debug"));

      if (v16)
      {
        -[SBContinuitySessionLaunchEventExecutor _executeDebugLaunchEvent:animatedly:completion:](self, "_executeDebugLaunchEvent:animatedly:completion:", v9, v6, v10);
      }
      else
      {
        SBLogContinuitySession();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[SBContinuitySessionLaunchEventExecutor executeLaunchEvent:animatedly:completion:].cold.1((uint64_t)v9, v17, v18, v19, v20, v21, v22, v23);

        v10[2](v10);
      }
    }
  }

}

- (void)_executeNotificationLaunchEvent:(id)a3 animatedly:(BOOL)a4 completion:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  SBLogContinuitySession();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Building foreground action for launch event %{public}@", buf, 0xCu);
  }

  objc_msgSend(v6, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  v10 = v7;
  v11 = v6;
  UNSBuildForegroundAction();

}

void __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  SBLogContinuitySession();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7 && v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v27 = v12;
      v28 = 2114;
      v29 = v7;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Finished building foreground action for launch event %{public}@ - bundleIdentifier: %{public}@ - calling openApplication:", buf, 0x16u);
    }

    v13 = v8;
    v14 = v13;
    if (!*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(v13, "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = v18;

      objc_msgSend(v19, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DAB8B0]);
      objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v20;
    }
    objc_msgSend(MEMORY[0x1E0D23170], "continuityDisplayService");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_14;
    v22[3] = &unk_1E8EAFAE0;
    v23 = *(id *)(a1 + 32);
    v24 = v7;
    v25 = *(id *)(a1 + 40);
    objc_msgSend(v21, "openApplication:withOptions:completion:", v24, v14, v22);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_cold_1(a1, (uint64_t)v9, v11);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_14(id *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v5 = v4;
  BSDispatchMain();

}

void __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  int v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  SBLogContinuitySession();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v22 = v5;
    v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Foreground application launch succeed for launch event %{public}@ bundleIdentifier %{public}@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UNSDidCompleteDeliveryOfForegroundAction();

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentTransaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v11 = v9;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  objc_msgSend(v13, "toApplicationSceneEntities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_17;
  v19[3] = &unk_1E8E9F410;
  v20 = *(id *)(a1 + 48);
  v16 = objc_msgSend(v14, "bs_containsObjectPassingTest:", v19);

  if (v16 && objc_msgSend(v13, "isRunning"))
  {
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_2_19;
    v17[3] = &unk_1E8EAFAB8;
    v18 = *(id *)(a1 + 56);
    objc_msgSend(v13, "registerBlockObserver:", v17);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_17(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "isEqualToString:", v5);

  return v6;
}

void __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_2_19(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_3;
  v3[3] = &unk_1E8EAFA90;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "addTransactionDidCompleteBlock:", v3);

}

uint64_t __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_executeWidgetLaunchEvent:(id)a3 animatedly:(BOOL)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SBDeviceApplicationSceneEntity *v29;
  void *v30;
  void *v31;
  void *v32;
  SBDeviceApplicationSceneEntity *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  void (**v49)(_QWORD);
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v44 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  SBLogContinuitySession();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v51 = v8;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Building foreground action for launch event %{public}@", buf, 0xCu);
  }

  v11 = objc_alloc(MEMORY[0x1E0D10308]);
  objc_msgSend(v8, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithData:", v12);

  if (!v13)
  {
    SBLogContinuitySession();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SBContinuitySessionLaunchEventExecutor _executeWidgetLaunchEvent:animatedly:completion:].cold.1((uint64_t)v8, v14, v15, v16, v17, v18, v19, v20);

    v9[2](v9);
  }
  v45 = v8;
  +[SBContinuitySessionManager sharedInstance](SBContinuitySessionManager, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "currentSession");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "mainWindowScene");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySessionLaunchEventExecutor.m"), 107, CFSTR("could not get continuityScene"));

  }
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "extensionIdentity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "containerBundleIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applicationWithBundleIdentifier:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = [SBDeviceApplicationSceneEntity alloc];
  objc_msgSend(v23, "sceneManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_sbDisplayConfiguration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "identity");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[SBDeviceApplicationSceneEntity initWithApplication:sceneHandleProvider:displayIdentity:](v29, "initWithApplication:sceneHandleProvider:displayIdentity:", v27, v30, v32);

  v34 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v13, "action");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setWithObject:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationSceneEntity addActions:](v33, "addActions:", v36);

  if (v44)
    v37 = 0;
  else
    v37 = 4;
  objc_msgSend(v23, "_sbDisplayConfiguration");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "createRequestForApplicationActivation:withDisplayConfiguration:options:", v33, v38, v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setOriginatingProcess:", v40);

    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __90__SBContinuitySessionLaunchEventExecutor__executeWidgetLaunchEvent_animatedly_completion___block_invoke;
    v46[3] = &unk_1E8EA47F0;
    v41 = v45;
    v47 = v45;
    v48 = v13;
    v49 = v9;
    v42 = (id)objc_msgSend(v39, "addCompletionHandler:", v46);
    objc_msgSend(v28, "executeTransitionRequest:", v39);

  }
  else
  {
    v41 = v45;
    if (v9)
      v9[2](v9);
  }

}

uint64_t __90__SBContinuitySessionLaunchEventExecutor__executeWidgetLaunchEvent_animatedly_completion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t result;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  SBLogContinuitySession();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "extensionIdentity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "containerBundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "action");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v6;
      v13 = 2114;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Foreground widget launch succeed for launch event %{public}@ bundleIdentifier %{public}@ bsAction %{public}@", (uint8_t *)&v11, 0x20u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __90__SBContinuitySessionLaunchEventExecutor__executeWidgetLaunchEvent_animatedly_completion___block_invoke_cold_1(a1, v5);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_executeDebugLaunchEvent:(id)a3 animatedly:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  __CFString *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  SBLogContinuitySession();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v7;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Executing debug launch event %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D23170], "continuityDisplayService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v11 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v19 = *MEMORY[0x1E0DAB8B0];
    v20 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__SBContinuitySessionLaunchEventExecutor__executeDebugLaunchEvent_animatedly_completion___block_invoke;
  v15[3] = &unk_1E8EAFAE0;
  v16 = v7;
  v17 = CFSTR("com.apple.tips");
  v18 = v8;
  v13 = v8;
  v14 = v7;
  objc_msgSend(v10, "openApplication:withOptions:completion:", CFSTR("com.apple.tips"), v12, v15);

}

void __89__SBContinuitySessionLaunchEventExecutor__executeDebugLaunchEvent_animatedly_completion___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v5 = v4;
  BSDispatchMain();

}

uint64_t __89__SBContinuitySessionLaunchEventExecutor__executeDebugLaunchEvent_animatedly_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  SBLogContinuitySession();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __89__SBContinuitySessionLaunchEventExecutor__executeDebugLaunchEvent_animatedly_completion___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[5];
    v6 = a1[6];
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Debug application launch succeed for launch event %{public}@ bundleIdentifier %{public}@", (uint8_t *)&v8, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)executeLaunchEvent:(uint64_t)a3 animatedly:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "Don't know how to handle launch event %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Failed to build foreground action for launch event: %{public}@ - error: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

void __96__SBContinuitySessionLaunchEventExecutor__executeNotificationLaunchEvent_animatedly_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_1_11(&dword_1D0540000, v0, (uint64_t)v0, "Foreground application launch failed for launch event: %{public}@ bundleIdentifier %{public}@: %{public}@", v1);
}

- (void)_executeWidgetLaunchEvent:(uint64_t)a3 animatedly:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "Failed to build foreground action for launch event: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __90__SBContinuitySessionLaunchEventExecutor__executeWidgetLaunchEvent_animatedly_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v4;
  v11 = 2114;
  v12 = v6;
  v13 = 2114;
  v14 = v7;
  OUTLINED_FUNCTION_1_11(&dword_1D0540000, a2, v8, "Foreground widget launch failed for launch event %{public}@ bundleIdentifier %{public}@ bsAction %{public}@", (uint8_t *)&v9);

}

void __89__SBContinuitySessionLaunchEventExecutor__executeDebugLaunchEvent_animatedly_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_1_11(&dword_1D0540000, v0, (uint64_t)v0, "Debug application launch failed for launch event: %{public}@ bundleIdentifier %{public}@: %{public}@", v1);
}

@end
