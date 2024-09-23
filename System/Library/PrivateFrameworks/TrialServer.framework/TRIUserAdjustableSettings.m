@implementation TRIUserAdjustableSettings

+ (void)updateExperimentOptOutStateWithServerContext:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIUserAdjustableSettings.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverContext"));

  }
  objc_msgSend(v5, "keyValueStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIUserAdjustableSettings.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverContext.keyValueStore"));

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__TRIUserAdjustableSettings_updateExperimentOptOutStateWithServerContext___block_invoke;
  block[3] = &unk_1E932FA70;
  v15 = v5;
  v16 = a1;
  v7 = qword_1EFC742D0;
  v8 = v5;
  v13 = v8;
  if (v7 == -1)
  {
    v9 = v8;
  }
  else
  {
    dispatch_once(&qword_1EFC742D0, block);
    v9 = v15;
  }
  v10 = (id)_MergedGlobals_39;

  objc_msgSend(v10, "runAfterDelaySeconds:coalescingBehavior:", 1, 5.0);
}

void __74__TRIUserAdjustableSettings_updateExperimentOptOutStateWithServerContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;

  v2 = (void *)MEMORY[0x1D8232A5C]();
  v3 = objc_alloc(MEMORY[0x1E0D81618]);
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.trial.user-optout-check-coalesce", 17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__TRIUserAdjustableSettings_updateExperimentOptOutStateWithServerContext___block_invoke_2;
  v9[3] = &unk_1E932FA70;
  v8 = *(_OWORD *)(a1 + 32);
  v5 = (id)v8;
  v10 = v8;
  v6 = objc_msgSend(v3, "initWithQueue:operation:", v4, v9);

  v7 = (void *)_MergedGlobals_39;
  _MergedGlobals_39 = v6;

  objc_autoreleasePoolPop(v2);
}

void __74__TRIUserAdjustableSettings_updateExperimentOptOutStateWithServerContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 40), "_optOutSoftwareUpdatePreferenceForAnyUser");
  objc_msgSend(*(id *)(a1 + 32), "keyValueStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIPersistentUserSettings settingsWithKeyValueStore:](TRIPersistentUserSettings, "settingsWithKeyValueStore:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "persistedOptOutStatus");
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109376;
    v7[1] = v5;
    v8 = 1024;
    v9 = v2;
    _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "Updating persisted experiment opt-out from: %d to: %d", (uint8_t *)v7, 0xEu);
  }

  objc_msgSend(v4, "persistOptOutStatus:", v2);
  if ((_DWORD)v2 == 1 && v5 != 1)
    +[TRIUserAdjustableSettings _deactivateAllActiveExperimentsWithServerContext:](TRIUserAdjustableSettings, "_deactivateAllActiveExperimentsWithServerContext:", *(_QWORD *)(a1 + 32));

}

+ (BOOL)getExperimentOptOut:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  const char *v12;
  void *v14;
  void *v15;
  uint8_t buf[4];
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIUserAdjustableSettings.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverContext"));

  }
  objc_msgSend(v5, "keyValueStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIUserAdjustableSettings.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverContext.keyValueStore"));

  }
  objc_msgSend(v5, "keyValueStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIPersistentUserSettings settingsWithKeyValueStore:](TRIPersistentUserSettings, "settingsWithKeyValueStore:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "persistedOptOutStatus");
  if (v9)
  {
    v10 = v9;
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v10 == 1;
      v12 = "Using persisted experiment opt-out: '%d'";
LABEL_10:
      _os_log_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 8u);
    }
  }
  else
  {
    v10 = objc_msgSend(a1, "_optOutSoftwareUpdatePreferenceForAnyUser");
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v10 == 1;
      v12 = "No persisted opt-out state, returning current setting: '%d'";
      goto LABEL_10;
    }
  }

  return v10 == 1;
}

+ (void)_deactivateAllActiveExperimentsWithServerContext:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint8_t v19[8];
  _QWORD v20[5];
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIUserAdjustableSettings.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverContext"));

  }
  objc_msgSend(v5, "taskQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "Deactivating all experiments per opt-out", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v22 = buf;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__31;
    v25 = __Block_byref_object_dispose__31;
    +[TRISequenceTask task](TRISequenceTask, "task");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "experimentDatabase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __78__TRIUserAdjustableSettings__deactivateAllActiveExperimentsWithServerContext___block_invoke;
    v20[3] = &unk_1E9332ED0;
    v20[4] = buf;
    v10 = objc_msgSend(v9, "enumerateExperimentRecordsWithBlock:", v20);

    if ((v10 & 1) == 0)
    {
      TRILogCategory_Server();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Unable to deactivate all active experiments (database query failed)", v19, 2u);
      }

    }
    +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taskQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "addTask:options:", *((_QWORD *)v22 + 5), v12);

    objc_msgSend(v5, "taskQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TRIRunningXPCActivityDescriptor initForImmediateWorkWithCapabilities:]([TRIRunningXPCActivityDescriptor alloc], "initForImmediateWorkWithCapabilities:", 0);
    objc_msgSend(v15, "resumeWithXPCActivityDescriptor:executeWhenSuspended:", v16, 0);

    if (v14 == 2)
    {
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Unable to deactivate all active experiments (failed to enqueue deactivation tasks)", v19, 2u);
      }

    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Skipping deactivation due to uninitialized task queue", buf, 2u);
    }

  }
}

void __78__TRIUserAdjustableSettings__deactivateAllActiveExperimentsWithServerContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (!objc_msgSend(v7, "deploymentEnvironment") && objc_msgSend(v7, "status") == 1)
  {
    objc_msgSend(v7, "treatmentId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v7, "experimentDeployment");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "experimentId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v5, 0xFFFFFFFFLL, 1, 12, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addTaskToEndOfSequence:", v6);
    }
  }

}

+ (unsigned)_optOutSoftwareUpdatePreferenceForAnyUser
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  CFTypeID v6;
  int Value;
  NSObject *v8;
  CFTypeID v9;
  NSObject *v11;
  int valuePtr;
  uint8_t buf[4];
  const __CFBoolean *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v3 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSynchronize(CFSTR("com.apple.softwareupdateservicesd"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v4 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("SUAutoInstallSystemDataFiles"), CFSTR("com.apple.softwareupdateservicesd"), v2, v3);
  if (!v4)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = 0;
      _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "Nothing to convert, value of opt-out preference: %{public}@", buf, 0xCu);
    }

    return 2;
  }
  v5 = v4;
  v6 = CFGetTypeID(v4);
  if (v6 == CFBooleanGetTypeID())
  {
    Value = CFBooleanGetValue(v5);
    goto LABEL_10;
  }
  v9 = CFGetTypeID(v5);
  if (v9 != CFNumberGetTypeID())
  {
LABEL_15:
    CFRelease(v5);
    return 2;
  }
  valuePtr = -1;
  if (!CFNumberGetValue(v5, kCFNumberIntType, &valuePtr))
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Failed to convert CFNumberRef value into int when getting opt-out preference: %{public}@", buf, 0xCu);
    }

    goto LABEL_15;
  }
  Value = valuePtr;
LABEL_10:
  CFRelease(v5);
  if (!Value)
    return 1;
  return 2;
}

@end
