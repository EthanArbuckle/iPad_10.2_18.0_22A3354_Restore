@implementation TRIXPCActivityManager

- (TRIXPCActivityManager)initWithDispatchQueue:(id)a3
{
  id v5;
  TRIXPCActivityManager *v6;
  TRIXPCActivityManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIXPCActivityManager;
  v6 = -[TRIXPCActivityManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);

  return v7;
}

- (void)registerActivities
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  -[TRIXPCActivityManager _registerRetryFailuresActivity](self, "_registerRetryFailuresActivity");
  -[TRIXPCActivityManager _registerFetchExperimentsActivity](self, "_registerFetchExperimentsActivity");
  -[TRIXPCActivityManager _registerCellularActivityWithDelay:](self, "_registerCellularActivityWithDelay:", 0.0);
  -[TRIXPCActivityManager _registerPostUpgradeActivity](self, "_registerPostUpgradeActivity");
  -[TRIXPCActivityManager registerSetupAssistantFetchActivity](self, "registerSetupAssistantFetchActivity");
  -[TRIXPCActivityManager _registerPostUpgradeActivityRequireInexpensiveNetworking](self, "_registerPostUpgradeActivityRequireInexpensiveNetworking");
  -[TRIXPCActivityManager _registerPlaceholderTaskQueueActivity](self, "_registerPlaceholderTaskQueueActivity");
  -[TRIXPCActivityManager _registerClientTriggeredActivities](self, "_registerClientTriggeredActivities");
  -[TRIXPCActivityManager _registerHotfixTargetingActivity](self, "_registerHotfixTargetingActivity");
  -[TRIXPCActivityManager _registerMaintenanceWorkActivity](self, "_registerMaintenanceWorkActivity");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/System/Library/LaunchDaemons/com.apple.triald.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = v3,
        objc_msgSend(v3, "objectForKey:", CFSTR("LaunchEvents")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v5)
    && (objc_msgSend(v5, "objectForKey:", CFSTR("com.apple.xpc.activity")),
        v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    -[NSObject allKeys](v6, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[TRIXPCActivitySupport assertRegistrationOfLaunchdPlistActivities:](TRIXPCActivitySupport, "assertRegistrationOfLaunchdPlistActivities:", v9);
  }
  else
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "failed to call assertRegistrationOfLaunchdPlistActivities", v10, 2u);
    }
  }

}

- (void)postponeCellularActivity
{
  -[TRIXPCActivityManager _registerCellularActivityWithDelay:](self, "_registerCellularActivityWithDelay:", 259200.0);
}

- (void)_registerRetryFailuresActivity
{
  void *v3;
  _QWORD v4[5];

  +[TRILaunchDaemonActivityDescriptor retryFailuresDescriptor](TRILaunchDaemonActivityDescriptor, "retryFailuresDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__TRIXPCActivityManager__registerRetryFailuresActivity__block_invoke;
  v4[3] = &unk_1E932F820;
  v4[4] = self;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:](TRIXPCActivitySupport, "registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:", v3, 0, v4);

}

void __55__TRIXPCActivityManager__registerRetryFailuresActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__TRIXPCActivityManager__registerRetryFailuresActivity__block_invoke_2;
  block[3] = &unk_1E9331760;
  block[4] = v4;
  v10 = &v11;
  v6 = v3;
  v9 = v6;
  dispatch_sync(v5, block);
  if (!*((_BYTE *)v12 + 24))
  {
    objc_msgSend(v6, "completion");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, 1);

  }
  _Block_object_dispose(&v11, 8);

}

void __55__TRIXPCActivityManager__registerRetryFailuresActivity__block_invoke_2(_QWORD *a1)
{
  NSObject *v1;
  uint8_t v2[16];

  if (*(_QWORD *)(a1[4] + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1[4] + 24), "resumeWithXPCActivityDescriptor:executeWhenSuspended:", a1[5], 0);
  }
  else
  {
    TRILogCategory_Server();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v2 = 0;
      _os_log_error_impl(&dword_1D207F000, v1, OS_LOG_TYPE_ERROR, "Can't carry out retry-failures activity, task queue not initialized.", v2, 2u);
    }

  }
}

- (void)_setDelaySeconds:(int64_t)a3 forXPCActivity:(id)a4 withLabel:(id)a5 replacementCriteria:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *dispatchQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__TRIXPCActivityManager__setDelaySeconds_forXPCActivity_withLabel_replacementCriteria___block_invoke;
  block[3] = &unk_1E9331788;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a3;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_sync(dispatchQueue, block);

}

void __87__TRIXPCActivityManager__setDelaySeconds_forXPCActivity_withLabel_replacementCriteria___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  const char *v4;
  int64_t int64;
  unint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  int64_t v10;
  id v11;
  const char *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = xpc_activity_copy_criteria(*(xpc_activity_t *)(a1 + 32));
  if (!v2)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 40);
      v17 = 138543362;
      v18 = v14;
      _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ check-in: criteria not found, using replacement and updating delay.", (uint8_t *)&v17, 0xCu);
    }

    v11 = *(id *)(a1 + 48);
    v3 = v11;
    v12 = (const char *)*MEMORY[0x1E0C80760];
    v10 = *(_QWORD *)(a1 + 56);
    goto LABEL_12;
  }
  v3 = v2;
  v4 = (const char *)*MEMORY[0x1E0C80760];
  int64 = xpc_dictionary_get_int64(v2, (const char *)*MEMORY[0x1E0C80760]);
  if (int64 - *(_QWORD *)(a1 + 56) >= 0)
    v6 = int64 - *(_QWORD *)(a1 + 56);
  else
    v6 = *(_QWORD *)(a1 + 56) - int64;
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 > 0x3B)
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 40);
      v17 = 138543362;
      v18 = v9;
      _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ check-in: delay is different, criteria will be updated.", (uint8_t *)&v17, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 56);
    v11 = v3;
    v12 = v4;
LABEL_12:
    xpc_dictionary_set_int64(v11, v12, v10);
    xpc_activity_set_criteria(*(xpc_activity_t *)(a1 + 32), v3);
    goto LABEL_16;
  }
  if (v8)
  {
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 56);
    v17 = 138543874;
    v18 = v15;
    v19 = 2048;
    v20 = int64;
    v21 = 2048;
    v22 = v16;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ check-in: existing delay is too close to requested delay (%lli ~ %lli), not updating the delay this time", (uint8_t *)&v17, 0x20u);
  }

LABEL_16:
}

- (void)_setJitterForXPCActivity:(id)a3 withLabel:(id)a4 replacementCriteria:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__TRIXPCActivityManager__setJitterForXPCActivity_withLabel_replacementCriteria___block_invoke;
  block[3] = &unk_1E9330548;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_sync(dispatchQueue, block);

}

void __80__TRIXPCActivityManager__setJitterForXPCActivity_withLabel_replacementCriteria___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  id v3;
  const char *v4;
  int64_t int64;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = xpc_activity_copy_criteria(*(xpc_activity_t *)(a1 + 32));
  if (!v2)
  {
    v3 = *(id *)(a1 + 40);
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 48);
      v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ check-in: criteria not found, using replacement and updating jitter.", (uint8_t *)&v14, 0xCu);
    }

    v11 = (const char *)*MEMORY[0x1E0C80890];
    v12 = v3;
    goto LABEL_12;
  }
  v3 = v2;
  v4 = (const char *)*MEMORY[0x1E0C80890];
  int64 = xpc_dictionary_get_int64(v2, (const char *)*MEMORY[0x1E0C80890]);
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (int64 != 3600)
  {
    if (v7)
    {
      v13 = *(_QWORD *)(a1 + 48);
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ check-in: jitter is unset, criteria will be updated.", (uint8_t *)&v14, 0xCu);
    }

    v12 = v3;
    v11 = v4;
LABEL_12:
    xpc_dictionary_set_int64(v12, v11, 3600);
    xpc_activity_set_criteria(*(xpc_activity_t *)(a1 + 32), v3);
    goto LABEL_13;
  }
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 48);
    v14 = 138543362;
    v15 = v8;
    _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ check-in: jitter is already set, criteria unchanged.", (uint8_t *)&v14, 0xCu);
  }

LABEL_13:
}

- (void)_scheduleFetchTaskWithActivityDescriptor:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_QWORD *);
  void *v15;
  TRIXPCActivityManager *v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  dispatchQueue = self->_dispatchQueue;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __72__TRIXPCActivityManager__scheduleFetchTaskWithActivityDescriptor_label___block_invoke;
  v15 = &unk_1E93317B0;
  v16 = self;
  v9 = v7;
  v17 = v9;
  v19 = &v20;
  v10 = v6;
  v18 = v10;
  dispatch_sync(dispatchQueue, &v12);
  if (!*((_BYTE *)v21 + 24))
  {
    objc_msgSend(v10, "completion", v12, v13, v14, v15, v16, v17);
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v11[2](v11, 1);

  }
  _Block_object_dispose(&v20, 8);

}

void __72__TRIXPCActivityManager__scheduleFetchTaskWithActivityDescriptor_label___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1[4] + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    v2 = *(void **)(a1[4] + 24);
    v3 = (void *)a1[6];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__TRIXPCActivityManager__scheduleFetchTaskWithActivityDescriptor_label___block_invoke_210;
    v8[3] = &unk_1E932F8C8;
    v4 = v3;
    v5 = a1[4];
    v9 = v4;
    v10 = v5;
    objc_msgSend(v2, "resumeWithXPCActivityDescriptor:executeWhenSuspended:", v4, v8);
    v6 = v9;
  }
  else
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[5];
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Can't carry out %{public}@ activity, task queue not initialized.", buf, 0xCu);
    }
  }

}

void __72__TRIXPCActivityManager__scheduleFetchTaskWithActivityDescriptor_label___block_invoke_210(uint64_t a1)
{
  _BOOL8 v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = !+[TRITaskCapabilityUtilities requiredCapabilities:areSupportedByAllowedCapabilities:](TRITaskCapabilityUtilities, "requiredCapabilities:areSupportedByAllowedCapabilities:", 1, objc_msgSend(*(id *)(a1 + 32), "capabilities"))&& +[TRITaskCapabilityUtilities requiredCapabilities:areSupportedByAllowedCapabilities:](TRITaskCapabilityUtilities, "requiredCapabilities:areSupportedByAllowedCapabilities:", 2, objc_msgSend(*(id *)(a1 + 32), "capabilities"));
  v3 = objc_alloc(MEMORY[0x1E0DC0A10]);
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithAllowsCellular:discretionaryBehavior:activity:", v2, 2, v4);

  v6 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  +[TRIScheduleFetchExperimentNotificationsTask taskWithRollbacksOnly:downloadOptions:](TRIScheduleFetchExperimentNotificationsTask, "taskWithRollbacksOnly:downloadOptions:", 0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTask:options:", v7, v10);

  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  +[TRIRetargetAllTask task](TRIRetargetAllTask, "task");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTask:options:", v9, v10);

}

- (void)_scheduleMaintenanceTaskWithActivityDescriptor:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_QWORD *);
  void *v15;
  TRIXPCActivityManager *v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  dispatchQueue = self->_dispatchQueue;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __78__TRIXPCActivityManager__scheduleMaintenanceTaskWithActivityDescriptor_label___block_invoke;
  v15 = &unk_1E93317B0;
  v16 = self;
  v9 = v7;
  v17 = v9;
  v19 = &v20;
  v10 = v6;
  v18 = v10;
  dispatch_sync(dispatchQueue, &v12);
  if (!*((_BYTE *)v21 + 24))
  {
    objc_msgSend(v10, "completion", v12, v13, v14, v15, v16, v17);
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v11[2](v11, 1);

  }
  _Block_object_dispose(&v20, 8);

}

void __78__TRIXPCActivityManager__scheduleMaintenanceTaskWithActivityDescriptor_label___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1[4] + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    v2 = a1[4];
    v3 = *(void **)(v2 + 24);
    v4 = a1[6];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78__TRIXPCActivityManager__scheduleMaintenanceTaskWithActivityDescriptor_label___block_invoke_216;
    v7[3] = &unk_1E932F918;
    v7[4] = v2;
    objc_msgSend(v3, "resumeWithXPCActivityDescriptor:executeWhenSuspended:", v4, v7);
  }
  else
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = a1[5];
      *(_DWORD *)buf = 138543362;
      v9 = v6;
      _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "Can't carry out %{public}@ activity, task queue not initialized.", buf, 0xCu);
    }

  }
}

void __78__TRIXPCActivityManager__scheduleMaintenanceTaskWithActivityDescriptor_label___block_invoke_216(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  +[TRIRetargetAllTask task](TRIRetargetAllTask, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addTask:options:", v3, v6);

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  +[TRIMaintenanceTask task](TRIMaintenanceTask, "task");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTask:options:", v5, v6);

}

- (void)_registerCellularActivityWithDelay:(double)a3
{
  void *v5;
  _QWORD v6[5];
  _QWORD v7[6];

  +[TRILaunchDaemonActivityDescriptor cellularDescriptor](TRILaunchDaemonActivityDescriptor, "cellularDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__TRIXPCActivityManager__registerCellularActivityWithDelay___block_invoke;
  v7[3] = &unk_1E93317D8;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__TRIXPCActivityManager__registerCellularActivityWithDelay___block_invoke_2;
  v6[3] = &unk_1E932F820;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:](TRIXPCActivitySupport, "registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:", v5, v7, v6);

}

void __60__TRIXPCActivityManager__registerCellularActivityWithDelay___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  v8 = a2;
  +[TRIXPCActivityCriteria cellularCriteria](TRIXPCActivityCriteria, "cellularCriteria");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  +[TRILaunchDaemonActivityDescriptor cellularDescriptor](TRILaunchDaemonActivityDescriptor, "cellularDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setJitterForXPCActivity:withLabel:replacementCriteria:", v8, v6, v3);

  v7 = *(double *)(a1 + 40);
  if (v7 > 0.0)
    objc_msgSend(*(id *)(a1 + 32), "_setDelaySeconds:forXPCActivity:withLabel:replacementCriteria:", (uint64_t)v7, v8, CFSTR("cellular"), v3);

}

uint64_t __60__TRIXPCActivityManager__registerCellularActivityWithDelay___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleFetchTaskWithActivityDescriptor:label:", a2, CFSTR("cellular"));
}

- (void)_registerFetchExperimentsActivity
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  +[TRILaunchDaemonActivityDescriptor inexpensiveNetworkingDescriptor](TRILaunchDaemonActivityDescriptor, "inexpensiveNetworkingDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__TRIXPCActivityManager__registerFetchExperimentsActivity__block_invoke;
  v5[3] = &unk_1E932F7F8;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__TRIXPCActivityManager__registerFetchExperimentsActivity__block_invoke_2;
  v4[3] = &unk_1E932F820;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:](TRIXPCActivitySupport, "registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:", v3, v5, v4);

}

void __58__TRIXPCActivityManager__registerFetchExperimentsActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  +[TRIXPCActivityCriteria fetchExperimentsCriteria](TRIXPCActivityCriteria, "fetchExperimentsCriteria");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  +[TRILaunchDaemonActivityDescriptor inexpensiveNetworkingDescriptor](TRILaunchDaemonActivityDescriptor, "inexpensiveNetworkingDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setJitterForXPCActivity:withLabel:replacementCriteria:", v3, v6, v7);

}

uint64_t __58__TRIXPCActivityManager__registerFetchExperimentsActivity__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleFetchTaskWithActivityDescriptor:label:", a2, CFSTR("fetch-experiments"));
}

- (void)_registerMaintenanceWorkActivity
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  +[TRILaunchDaemonActivityDescriptor maintenanceWorkDescriptor](TRILaunchDaemonActivityDescriptor, "maintenanceWorkDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__TRIXPCActivityManager__registerMaintenanceWorkActivity__block_invoke;
  v5[3] = &unk_1E932F7F8;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__TRIXPCActivityManager__registerMaintenanceWorkActivity__block_invoke_2;
  v4[3] = &unk_1E932F820;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:](TRIXPCActivitySupport, "registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:", v3, v5, v4);

}

void __57__TRIXPCActivityManager__registerMaintenanceWorkActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  +[TRIXPCActivityCriteria maintenanceCriteria](TRIXPCActivityCriteria, "maintenanceCriteria");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  +[TRILaunchDaemonActivityDescriptor maintenanceWorkDescriptor](TRILaunchDaemonActivityDescriptor, "maintenanceWorkDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setJitterForXPCActivity:withLabel:replacementCriteria:", v3, v6, v7);

}

uint64_t __57__TRIXPCActivityManager__registerMaintenanceWorkActivity__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleMaintenanceTaskWithActivityDescriptor:label:", a2, CFSTR("maintenance"));
}

- (void)_registerPostUpgradeActivity
{
  void *v3;
  _QWORD v4[5];

  +[TRILaunchDaemonActivityDescriptor postUpgradeDescriptor](TRILaunchDaemonActivityDescriptor, "postUpgradeDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__TRIXPCActivityManager__registerPostUpgradeActivity__block_invoke;
  v4[3] = &unk_1E932F820;
  v4[4] = self;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:](TRIXPCActivitySupport, "registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:", v3, 0, v4);

}

void __53__TRIXPCActivityManager__registerPostUpgradeActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__TRIXPCActivityManager__registerPostUpgradeActivity__block_invoke_2;
  block[3] = &unk_1E9331760;
  block[4] = v4;
  v10 = &v11;
  v6 = v3;
  v9 = v6;
  dispatch_sync(v5, block);
  if (!*((_BYTE *)v12 + 24))
  {
    objc_msgSend(v6, "completion");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, 1);

  }
  _Block_object_dispose(&v11, 8);

}

void __53__TRIXPCActivityManager__registerPostUpgradeActivity__block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id *v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint32_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  NSObject *v32;
  _QWORD handler[6];
  int out_token;
  id obj;
  uint8_t buf[8];
  uint8_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t v42[4];
  const __CFString *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v1 = a1[4];
  if (*(_QWORD *)(v1 + 16))
  {
    v3 = *(_QWORD *)(v1 + 24) == 0;
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "Can't trigger post-upgrade actions, task queue not initialized.", buf, 2u);
      }

    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "post-upgrade actions triggered", buf, 2u);
      }

      *(_QWORD *)buf = 0;
      v37 = buf;
      v38 = 0x3032000000;
      v39 = __Block_byref_object_copy__14;
      v40 = __Block_byref_object_dispose__14;
      v41 = 0;
      objc_msgSend(*(id *)(a1[4] + 16), "keyValueStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id *)(v37 + 40);
      obj = (id)*((_QWORD *)v37 + 5);
      v8 = +[TRISetupAssistantFetchUtils setValueInKeyValueStore:key:value:error:](TRISetupAssistantFetchUtils, "setValueInKeyValueStore:key:value:error:", v6, CFSTR("post-upgrade-activity-in-progress"), &unk_1E9363A98, &obj);
      objc_storeStrong(v7, obj);

      if (v8)
      {
        out_token = 0;
        v9 = a1[4];
        v10 = *(NSObject **)(v9 + 8);
        v11 = MEMORY[0x1E0C809B0];
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __53__TRIXPCActivityManager__registerPostUpgradeActivity__block_invoke_229;
        handler[3] = &unk_1E9331800;
        handler[4] = v9;
        handler[5] = buf;
        v12 = notify_register_dispatch("com.apple.trial.TaskQueueComplete", &out_token, v10, handler);
        if (v12)
        {
          TRILogCategory_Server();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v42 = 134217984;
            v43 = (const __CFString *)v12;
            _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", v42, 0xCu);
          }
        }
        else
        {
          +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = *(void **)(a1[4] + 24);
          +[TRIPostUpgradeCleanupTask task](TRIPostUpgradeCleanupTask, "task");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addTask:options:", v18, v16);

          v19 = *(void **)(a1[4] + 24);
          v20 = (void *)objc_opt_new();
          objc_msgSend(v19, "addTask:options:", v20, v16);

          v21 = *(void **)(a1[4] + 24);
          +[TRIRetargetAllTask task](TRIRetargetAllTask, "task");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addTask:options:", v22, v16);

          objc_msgSend(MEMORY[0x1E0DC0A10], "inexpensiveOptions");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[TRIScheduleFetchExperimentNotificationsTask taskWithRollbacksOnly:downloadOptions:](TRIScheduleFetchExperimentNotificationsTask, "taskWithRollbacksOnly:downloadOptions:", 1, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
          v25 = a1[4];
          v26 = a1[5];
          v27 = *(void **)(v25 + 24);
          v30[0] = v11;
          v30[1] = 3221225472;
          v30[2] = __53__TRIXPCActivityManager__registerPostUpgradeActivity__block_invoke_234;
          v30[3] = &unk_1E9330548;
          v30[4] = v25;
          v28 = v24;
          v31 = v28;
          v13 = v16;
          v32 = v13;
          objc_msgSend(v27, "resumeWithXPCActivityDescriptor:executeWhenSuspended:", v26, v30);

        }
      }
      else
      {
        TRILogCategory_Server();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v29 = *((_QWORD *)v37 + 5);
          *(_DWORD *)v42 = 138412546;
          v43 = CFSTR("post-upgrade-activity-in-progress");
          v44 = 2114;
          v45 = v29;
          _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Error writing data for %@ key in TRIKVStore: %{public}@. Not proceeding further", v42, 0x16u);
        }

      }
      _Block_object_dispose(buf, 8);

    }
  }
  else
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Can't trigger post-upgrade actions, server context not available.", buf, 2u);
    }

  }
}

void __53__TRIXPCActivityManager__registerPostUpgradeActivity__block_invoke_229(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  id obj;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "task queue completed in asynch handler of post-upgrade. Updating KV store to indicate the activity is no longer in progress", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "keyValueStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v6 + 40);
  v7 = +[TRISetupAssistantFetchUtils setValueInKeyValueStore:key:value:error:](TRISetupAssistantFetchUtils, "setValueInKeyValueStore:key:value:error:", v5, CFSTR("post-upgrade-activity-in-progress"), &unk_1E9363AB0, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);

  if (v7)
  {
    notify_cancel(a2);
  }
  else
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v12 = CFSTR("post-upgrade-activity-in-progress");
      v13 = 2114;
      v14 = v9;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Error writing data for %@ key in TRIKVStore: %{public}@. Not proceeding further", buf, 0x16u);
    }

  }
}

uint64_t __53__TRIXPCActivityManager__registerPostUpgradeActivity__block_invoke_234(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "addTask:options:", a1[5], a1[6]);
}

- (void)_registerPostUpgradeActivityRequireInexpensiveNetworking
{
  void *v3;
  _QWORD v4[5];

  +[TRILaunchDaemonActivityDescriptor postUpgradeDescriptorRequireInexpensiveNetworking](TRILaunchDaemonActivityDescriptor, "postUpgradeDescriptorRequireInexpensiveNetworking");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__TRIXPCActivityManager__registerPostUpgradeActivityRequireInexpensiveNetworking__block_invoke;
  v4[3] = &unk_1E932F820;
  v4[4] = self;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:](TRIXPCActivitySupport, "registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:", v3, 0, v4);

}

void __81__TRIXPCActivityManager__registerPostUpgradeActivityRequireInexpensiveNetworking__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__TRIXPCActivityManager__registerPostUpgradeActivityRequireInexpensiveNetworking__block_invoke_2;
  block[3] = &unk_1E9331828;
  block[4] = v4;
  v6 = v3;
  v9 = v6;
  v10 = &v11;
  dispatch_sync(v5, block);
  if (!*((_BYTE *)v12 + 24))
  {
    objc_msgSend(v6, "completion");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, 1);

  }
  _Block_object_dispose(&v11, 8);

}

void __81__TRIXPCActivityManager__registerPostUpgradeActivityRequireInexpensiveNetworking__block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id *v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  TRITaskAttributionInternalInsecure *v15;
  void *v16;
  TRITaskAttributionInternalInsecure *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[6];
  int out_token;
  id obj;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t v29[4];
  const __CFString *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v1 = a1[4];
  if (*(_QWORD *)(v1 + 16))
  {
    v3 = *(_QWORD *)(v1 + 24) == 0;
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "Can't trigger post-upgrade require inexpensive networking actions, task queue not initialized.", buf, 2u);
      }

    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "post-upgrade-require-inexpensive-networking actions triggered", buf, 2u);
      }

      *(_QWORD *)buf = 0;
      v24 = buf;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__14;
      v27 = __Block_byref_object_dispose__14;
      v28 = 0;
      objc_msgSend(*(id *)(a1[4] + 16), "keyValueStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id *)(v24 + 40);
      obj = (id)*((_QWORD *)v24 + 5);
      v8 = +[TRISetupAssistantFetchUtils setValueInKeyValueStore:key:value:error:](TRISetupAssistantFetchUtils, "setValueInKeyValueStore:key:value:error:", v6, CFSTR("post-upgrade-require-inexpensive-networking-activity-in-progress"), &unk_1E9363A98, &obj);
      objc_storeStrong(v7, obj);

      if (v8)
      {
        out_token = 0;
        v9 = a1[4];
        v10 = *(NSObject **)(v9 + 8);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __81__TRIXPCActivityManager__registerPostUpgradeActivityRequireInexpensiveNetworking__block_invoke_235;
        v20[3] = &unk_1E9331800;
        v20[4] = v9;
        v20[5] = buf;
        v11 = notify_register_dispatch("com.apple.trial.TaskQueueComplete", &out_token, v10, v20);
        if (v11)
        {
          TRILogCategory_Server();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v29 = 134217984;
            v30 = (const __CFString *)v11;
            _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", v29, 0xCu);
          }
        }
        else
        {
          +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
          v12 = objc_claimAutoreleasedReturnValue();
          v15 = [TRITaskAttributionInternalInsecure alloc];
          objc_msgSend(MEMORY[0x1E0DC0A10], "inexpensiveOptions");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[TRITaskAttributionInternalInsecure initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:](v15, "initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:", 0, 1, CFSTR("com.apple.triald"), v16);

          +[TRISelectRolloutNotificationListTask taskWithNamespaceNames:taskAttribution:](TRISelectRolloutNotificationListTask, "taskWithNamespaceNames:taskAttribution:", 0, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1[4] + 24), "addTask:options:", v18, v12);
          objc_msgSend(*(id *)(a1[4] + 24), "resumeWithXPCActivityDescriptor:executeWhenSuspended:", a1[5], 0);
          *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;

        }
      }
      else
      {
        TRILogCategory_Server();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v19 = *((_QWORD *)v24 + 5);
          *(_DWORD *)v29 = 138412546;
          v30 = CFSTR("post-upgrade-require-inexpensive-networking-activity-in-progress");
          v31 = 2114;
          v32 = v19;
          _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Error writing data for %@ key in TRIKVStore: %{public}@. Not proceeding further", v29, 0x16u);
        }

      }
      _Block_object_dispose(buf, 8);

    }
  }
  else
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Can't trigger post-upgrade require inexpensive networking actions, server context not available.", buf, 2u);
    }

  }
}

void __81__TRIXPCActivityManager__registerPostUpgradeActivityRequireInexpensiveNetworking__block_invoke_235(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  id obj;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "task queue completed in asynch handler of post-upgrade-require-inexpensive-networking. Updating KV store to indicate the activity is no longer in progress", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "keyValueStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v6 + 40);
  v7 = +[TRISetupAssistantFetchUtils setValueInKeyValueStore:key:value:error:](TRISetupAssistantFetchUtils, "setValueInKeyValueStore:key:value:error:", v5, CFSTR("post-upgrade-require-inexpensive-networking-activity-in-progress"), &unk_1E9363AB0, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);

  if (v7)
  {
    notify_cancel(a2);
  }
  else
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v12 = CFSTR("post-upgrade-require-inexpensive-networking-activity-in-progress");
      v13 = 2114;
      v14 = v9;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Error writing data for %@ key in TRIKVStore: %{public}@. Not proceeding further", buf, 0x16u);
    }

  }
}

- (void)registerSetupAssistantFetchActivity
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  +[TRILaunchDaemonActivityDescriptor setupAssistantFetchDescriptor](TRILaunchDaemonActivityDescriptor, "setupAssistantFetchDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__TRIXPCActivityManager_registerSetupAssistantFetchActivity__block_invoke;
  v5[3] = &unk_1E932F7F8;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__TRIXPCActivityManager_registerSetupAssistantFetchActivity__block_invoke_241;
  v4[3] = &unk_1E932F820;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:](TRIXPCActivitySupport, "registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:", v3, v5, v4);

}

void __60__TRIXPCActivityManager_registerSetupAssistantFetchActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  NSObject *v4;
  xpc_object_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  const char **v12;
  const char **v13;
  NSObject *v14;
  xpc_object_t v15;
  id v16;
  __CFString *v17;
  void *v18;
  double v19;
  int64_t v20;
  NSObject *v21;
  uint64_t v22;
  _BOOL4 v23;
  __CFString *v24;
  __CFString *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  int64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "setup-assistant-fetch activity check-in", buf, 2u);
  }

  v5 = xpc_activity_copy_criteria(v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "keyValueStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  +[TRISetupAssistantFetchUtils getValueInKeyValueStore:key:error:](TRISetupAssistantFetchUtils, "getValueInKeyValueStore:key:error:", v6, CFSTR("setup-assistant-fetch-activity-deadline-date"), &v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v29;

  if (!v7)
  {
    if (v8)
    {
      TRILogCategory_Server();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v31 = CFSTR("setup-assistant-fetch-activity-deadline-date");
        v32 = 2114;
        v33 = (int64_t)v8;
        _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Error reading data for %@ key in TRIKVStore: %{public}@. Not proceeding further", buf, 0x16u);
      }

    }
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v10 = "setupAssistantFetchActivityRegistrationKey not set, unregistering setup-assistant-fetch";
    goto LABEL_13;
  }
  if (objc_msgSend(v7, "isEqualToNumber:", &unk_1E9363AC8))
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      xpc_activity_unregister("com.apple.triald.setup-assistant-fetch");
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    v10 = "Unregistering setup-assistant-fetch activity in check-in because the activity already registered. Not proceeding further";
LABEL_13:
    _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    goto LABEL_14;
  }
  v12 = (const char **)MEMORY[0x1E0C80790];
  if (v5 && xpc_dictionary_get_count(v5))
  {
    v13 = v12;
  }
  else
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "criteria is nil or has zero count when trying to register setup-assistant-fetch activity to run", buf, 2u);
    }

    v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E0C80898], 0);
    xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E0C80738], 1);
    xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E0C808B8], 1);
    xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E0C808C8], 1);
    xpc_dictionary_set_string(v15, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
    xpc_dictionary_set_int64(v15, (const char *)*MEMORY[0x1E0C80760], 0);
    v13 = v12;
    xpc_dictionary_set_int64(v15, *v12, 21600);
    xpc_dictionary_set_int64(v15, (const char *)*MEMORY[0x1E0C80818], 700000000);
    xpc_dictionary_set_BOOL(v15, (const char *)*MEMORY[0x1E0C80900], 1);
    v5 = v15;
  }
  v16 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v7, "doubleValue");
  v17 = (__CFString *)objc_msgSend(v16, "initWithTimeIntervalSince1970:");
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString timeIntervalSinceDate:](v17, "timeIntervalSinceDate:", v18);
  v20 = (uint64_t)v19;
  TRILogCategory_Server();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v17;
    v32 = 2048;
    v33 = v20;
    _os_log_impl(&dword_1D207F000, v21, OS_LOG_TYPE_DEFAULT, "The deadline to run setup-assistant-fetch activity is: %@. Setting grace period to: %lld", buf, 0x16u);
  }

  xpc_dictionary_set_int64(v5, *v13, v20);
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v28 = 0;
  v23 = +[TRISetupAssistantFetchUtils stopSetupAssistantFetchWithServerContext:namespaceNames:error:](TRISetupAssistantFetchUtils, "stopSetupAssistantFetchWithServerContext:namespaceNames:error:", v22, 0, &v28);
  v24 = (__CFString *)v28;
  v25 = v24;
  if (v23)
  {
    TRILogCategory_Server();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v26, OS_LOG_TYPE_DEFAULT, "Unregistering setup-assistant-fetch activity to run", buf, 2u);
    }

    xpc_activity_unregister("com.apple.triald.setup-assistant-fetch");
  }
  else if (v24)
  {
    TRILogCategory_Server();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v25;
      _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Error checking if the setup-assistant-fetch activity is needed to run in registerSetupAssistantFetchActivity: %{public}@", buf, 0xCu);
    }

  }
  else
  {
    xpc_activity_set_criteria(v3, v5);
  }

LABEL_33:
}

void __60__TRIXPCActivityManager_registerSetupAssistantFetchActivity__block_invoke_241(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__TRIXPCActivityManager_registerSetupAssistantFetchActivity__block_invoke_2;
  block[3] = &unk_1E9331828;
  block[4] = v4;
  v6 = v3;
  v9 = v6;
  v10 = &v11;
  dispatch_sync(v5, block);
  if (!*((_BYTE *)v12 + 24))
  {
    objc_msgSend(v6, "completion");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, 1);

  }
  _Block_object_dispose(&v11, 8);

}

void __60__TRIXPCActivityManager_registerSetupAssistantFetchActivity__block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint32_t v9;
  uint32_t v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  void *v14;
  _QWORD handler[5];
  NSObject *v16;
  int out_token;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = a1[4];
  if (!*(_QWORD *)(v1 + 16))
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v12 = "Can't trigger setup-assistant-fetch actions, server context not available.";
LABEL_12:
    _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_15;
  }
  v3 = *(_QWORD *)(v1 + 24);
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v12 = "Can't trigger setup-assistant-fetch actions, task queue not initialized.";
    goto LABEL_12;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "setup-assistant-fetch actions triggered", buf, 2u);
  }

  +[TRISetupAssistantFetchUtils registerFinalizeBlockForDownloadLatencyTelemetryWithServerContext:](TRISetupAssistantFetchUtils, "registerFinalizeBlockForDownloadLatencyTelemetryWithServerContext:", *(_QWORD *)(a1[4] + 16));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  out_token = 0;
  v7 = a1[4];
  v8 = *(NSObject **)(v7 + 8);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __60__TRIXPCActivityManager_registerSetupAssistantFetchActivity__block_invoke_242;
  handler[3] = &unk_1E9331850;
  handler[4] = v7;
  v5 = v6;
  v16 = v5;
  v9 = notify_register_dispatch("com.apple.trial.TaskQueueComplete", &out_token, v8, handler);
  if (v9)
  {
    v10 = v9;
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v19 = v10;
      _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", buf, 0xCu);
    }
  }
  else
  {
    +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
    v11 = objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1[4] + 24);
    +[TRISetupAssistantFetchTask task](TRISetupAssistantFetchTask, "task");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addTask:options:", v14, v11);

    objc_msgSend(*(id *)(a1[4] + 24), "resumeWithXPCActivityDescriptor:executeWhenSuspended:", a1[5], 0);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

LABEL_15:
}

void __60__TRIXPCActivityManager_registerSetupAssistantFetchActivity__block_invoke_242(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  int v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "task queue completed in asynch handler of setup-assistant-fetch", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "keyValueStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  +[TRISetupAssistantFetchUtils getValueInKeyValueStore:key:error:](TRISetupAssistantFetchUtils, "getValueInKeyValueStore:key:error:", v5, CFSTR("setup-assistant-fetch-activity-deadline-date"), &v30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v30;

  if (v6 && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E9363AC8) & 1) == 0)
  {
    v22 = v7;
    v23 = v6;
    v24 = a2;
    objc_msgSend(*(id *)(a1 + 40), "builtTelemetry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "client");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "logger");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "client");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "trackingId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v17, 0, 0, v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v10);
    }

    a2 = v24;
    v6 = v23;
    v7 = v22;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "keyValueStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v7;
  v19 = +[TRISetupAssistantFetchUtils setValueInKeyValueStore:key:value:error:](TRISetupAssistantFetchUtils, "setValueInKeyValueStore:key:value:error:", v18, CFSTR("setup-assistant-fetch-activity-deadline-date"), &unk_1E9363AC8, &v25);
  v20 = v25;

  if (v19)
  {
    notify_cancel(a2);
  }
  else
  {
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v32 = CFSTR("setup-assistant-fetch-activity-deadline-date");
      v33 = 2114;
      v34 = v20;
      _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Error writing data for %@ key in TRIKVStore: %{public}@. Not proceeding further", buf, 0x16u);
    }

  }
}

- (void)_registerHotfixTargetingActivity
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  +[TRILaunchDaemonActivityDescriptor clientHotfixCellularAllowBatteryDescriptor](TRILaunchDaemonActivityDescriptor, "clientHotfixCellularAllowBatteryDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__TRIXPCActivityManager__registerHotfixTargetingActivity__block_invoke;
  v7[3] = &unk_1E932F820;
  v7[4] = self;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:](TRIXPCActivitySupport, "registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:", v3, 0, v7);

  +[TRILaunchDaemonActivityDescriptor clientHotfixWifiDescriptor](TRILaunchDaemonActivityDescriptor, "clientHotfixWifiDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __57__TRIXPCActivityManager__registerHotfixTargetingActivity__block_invoke_244;
  v6[3] = &unk_1E932F820;
  v6[4] = self;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:](TRIXPCActivitySupport, "registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:", v5, 0, v6);

}

void __57__TRIXPCActivityManager__registerHotfixTargetingActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__TRIXPCActivityManager__registerHotfixTargetingActivity__block_invoke_2;
  block[3] = &unk_1E9331828;
  block[4] = v4;
  v6 = v3;
  v9 = v6;
  v10 = &v11;
  dispatch_sync(v5, block);
  if (!*((_BYTE *)v12 + 24))
  {
    objc_msgSend(v6, "completion");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, 1);

  }
  _Block_object_dispose(&v11, 8);

}

void __57__TRIXPCActivityManager__registerHotfixTargetingActivity__block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = *(_QWORD *)(a1[4] + 24);
  TRILogCategory_Server();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(Activity Manager) Hotfix running cellular activity", v5, 2u);
    }

    objc_msgSend(*(id *)(a1[4] + 24), "resumeWithXPCActivityDescriptor:executeWhenSuspended:", a1[5], 0);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v4, OS_LOG_TYPE_ERROR, "Can't carry out hotfix targeting activity, task queue not initialized.", buf, 2u);
    }

  }
}

void __57__TRIXPCActivityManager__registerHotfixTargetingActivity__block_invoke_244(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__TRIXPCActivityManager__registerHotfixTargetingActivity__block_invoke_2_245;
  block[3] = &unk_1E9331828;
  block[4] = v4;
  v6 = v3;
  v9 = v6;
  v10 = &v11;
  dispatch_sync(v5, block);
  if (!*((_BYTE *)v12 + 24))
  {
    objc_msgSend(v6, "completion");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, 1);

  }
  _Block_object_dispose(&v11, 8);

}

void __57__TRIXPCActivityManager__registerHotfixTargetingActivity__block_invoke_2_245(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = *(_QWORD *)(a1[4] + 24);
  TRILogCategory_Server();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(Activity Manager) Hotfix running wifi activity", v5, 2u);
    }

    objc_msgSend(*(id *)(a1[4] + 24), "resumeWithXPCActivityDescriptor:executeWhenSuspended:", a1[5], 0);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v4, OS_LOG_TYPE_ERROR, "Can't carry out hotfix targeting activity, task queue not initialized.", buf, 2u);
    }

  }
}

- (void)_registerPlaceholderTaskQueueActivity
{
  id v2;

  +[TRILaunchDaemonActivityDescriptor taskQueueDescriptor](TRILaunchDaemonActivityDescriptor, "taskQueueDescriptor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:](TRIXPCActivitySupport, "registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:", v2, 0, &__block_literal_global_8);

}

void __62__TRIXPCActivityManager__registerPlaceholderTaskQueueActivity__block_invoke(uint64_t a1, void *a2)
{
  void (**v2)(id, uint64_t);

  objc_msgSend(a2, "completion");
  v2 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  v2[2](v2, 1);

}

- (void)_registerClientTriggeredActivities
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  +[TRILaunchDaemonActivityDescriptor clientTriggeredCellularDescriptor](TRILaunchDaemonActivityDescriptor, "clientTriggeredCellularDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke;
  v9[3] = &unk_1E932F7F8;
  v9[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_2;
  v8[3] = &unk_1E932F820;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:](TRIXPCActivitySupport, "registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:", v3, v9, v8);

  +[TRILaunchDaemonActivityDescriptor clientTriggeredWifiDescriptor](TRILaunchDaemonActivityDescriptor, "clientTriggeredWifiDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[4] = self;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_4;
  v7[3] = &unk_1E932F7F8;
  v7[4] = self;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_5;
  v6[3] = &unk_1E932F820;
  +[TRIXPCActivitySupport registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:](TRIXPCActivitySupport, "registerActivityWithLaunchDaemonDescriptor:checkInBlock:asyncHandler:", v5, v7, v6);

}

void __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  +[TRIXPCActivityCriteria clientTriggeredCellularCriteria](TRIXPCActivityCriteria, "clientTriggeredCellularCriteria");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  +[TRILaunchDaemonActivityDescriptor clientTriggeredCellularDescriptor](TRILaunchDaemonActivityDescriptor, "clientTriggeredCellularDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setJitterForXPCActivity:withLabel:replacementCriteria:", v3, v6, v7);

}

void __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_3;
  v7[3] = &unk_1E932F8C8;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resumeWithXPCActivityDescriptor:executeWhenSuspended:", *(_QWORD *)(a1 + 40), 0);
}

void __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  +[TRIXPCActivityCriteria clientTriggeredWifiCriteria](TRIXPCActivityCriteria, "clientTriggeredWifiCriteria");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  +[TRILaunchDaemonActivityDescriptor clientTriggeredWifiDescriptor](TRILaunchDaemonActivityDescriptor, "clientTriggeredWifiDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setJitterForXPCActivity:withLabel:replacementCriteria:", v3, v6, v7);

}

void __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_6;
  v7[3] = &unk_1E932F8C8;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __59__TRIXPCActivityManager__registerClientTriggeredActivities__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resumeWithXPCActivityDescriptor:executeWhenSuspended:", *(_QWORD *)(a1 + 40), 0);
}

- (TRIServerContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (TRITaskQueue)taskQueue
{
  return self->_taskQueue;
}

- (void)setTaskQueue:(id)a3
{
  objc_storeStrong((id *)&self->_taskQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
