@implementation TRISetupAssistantFetchTask

- (int)taskType
{
  return 24;
}

+ (id)task
{
  return (id)objc_opt_new();
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  TRITaskAttributionInternalInsecure *v30;
  void *v31;
  TRITaskAttributionInternalInsecure *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  id v41;
  id v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  TRITaskAttributionInternalInsecure *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = (void *)MEMORY[0x1E0DC0AD8];
  objc_msgSend(v5, "paths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "namespaceDescriptorsDefaultDir");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descriptorsForDirectory:filterBlock:", v10, &__block_literal_global_29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  TRILogCategory_Server();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    v42 = v5;
    if (v14)
    {
      *(_DWORD *)buf = 134217984;
      v49 = objc_msgSend(v11, "count");
      _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "TRISetupAssistantFetchTask: found %lu descriptors with enableFetchDuringSetupAssistant enabled", buf, 0xCu);
    }
    v43 = v7;
    v41 = v6;

    v15 = (void *)objc_opt_new();
    v16 = (void *)objc_opt_new();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v17 = v11;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v45 != v21)
            objc_enumerationMutation(v17);
          v23 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if (!-[__CFString length](v20, "length"))
          {
            objc_msgSend(v23, "resourceAttributionIdentifier");
            v24 = objc_claimAutoreleasedReturnValue();

            v20 = (__CFString *)v24;
          }
          objc_msgSend(v23, "namespaceName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v25);

          objc_msgSend(v23, "namespaceName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v26);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v19);
    }
    else
    {
      v20 = 0;
    }

    if (!-[__CFString length](v20, "length"))
    {

      v20 = CFSTR("com.apple.triald");
    }
    v5 = v42;
    v7 = v43;
    if (+[TRISetupAssistantFetchUtils removeNamespaceNamesWithRolloutForServerContext:namespaceNames:](TRISetupAssistantFetchUtils, "removeNamespaceNamesWithRolloutForServerContext:namespaceNames:", v42, v16))
    {
      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v15, "minusSet:", v16);
        if (objc_msgSend(v15, "count"))
        {
          TRILogCategory_Server();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v15, "allObjects");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "allObjects");
            v30 = (TRITaskAttributionInternalInsecure *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v49 = (uint64_t)v29;
            v50 = 2114;
            v51 = v30;
            _os_log_impl(&dword_1D207F000, v28, OS_LOG_TYPE_DEFAULT, "TRISetupAssistantFetchTask: ncv-compatible rollout v2 are present for namespace names: %@ and are NOT present for  namespace names: %{public}@", buf, 0x16u);

          }
        }
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0A10]), "initWithAllowsCellular:discretionaryBehavior:", 0, 0);
        v32 = -[TRITaskAttributionInternalInsecure initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:]([TRITaskAttributionInternalInsecure alloc], "initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:", 0, 1, v20, v31);
        TRILogCategory_Server();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v49 = (uint64_t)v16;
          v50 = 2112;
          v51 = v32;
          _os_log_impl(&dword_1D207F000, v33, OS_LOG_TYPE_DEFAULT, "TRISetupAssistantFetchTask: submitting TRISelectRolloutNotificationListTask with the following namespace names: %{public}@ and task attributing: %@", buf, 0x16u);
        }

        +[TRISelectRolloutNotificationListTask taskWithNamespaceNames:taskAttribution:](TRISelectRolloutNotificationListTask, "taskWithNamespaceNames:taskAttribution:", v16, v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addObject:", v34);

        v35 = (void *)objc_msgSend(v43, "copy");
        +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 2, 1, v35, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v43;
        goto LABEL_36;
      }
      TRILogCategory_Server();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D207F000, v39, OS_LOG_TYPE_DEFAULT, "TRISetupAssistantFetchTask: download is not needed, ncv-compatible rollouts v2 are all present on the device for namespaces names with enableFetchDuringSetupAssistant flag enabled", buf, 2u);
      }

      v37 = MEMORY[0x1E0C9AA60];
      v38 = 2;
    }
    else
    {
      TRILogCategory_Server();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v36, OS_LOG_TYPE_ERROR, "The rollout database query failed.", buf, 2u);
      }

      v37 = MEMORY[0x1E0C9AA60];
      v38 = 3;
    }
    +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v38, 1, v37, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:

    v6 = v41;
    goto LABEL_37;
  }
  if (v14)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "TRISetupAssistantFetchTask: did not find descriptors with enableFetchDuringSetupAssistant enabled", buf, 2u);
  }

  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 2, 1, MEMORY[0x1E0C9AA60], 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:

  return v27;
}

uint64_t __60__TRISetupAssistantFetchTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enableFetchDuringSetupAssistant");
}

- (id)_asPersistedTask
{
  return (id)objc_opt_new();
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRISetupAssistantFetchTask _asPersistedTask](self, "_asPersistedTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISetupAssistantFetchTask.m"), 136, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  +[TRIPBMessage parseFromData:error:](TRISetupAssistantFetchPersistedTask, "parseFromData:error:", a3, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    v5 = (void *)objc_opt_new();
  }
  else
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRISetupAssistantFetchTask: %{public}@", buf, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRISetupAssistantFetchTask)initWithCoder:(id)a3
{
  id v4;
  TRISetupAssistantFetchTask *v5;
  void *v6;
  TRISetupAssistantFetchTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRISetupAssistantFetchTask;
  v5 = -[TRISetupAssistantFetchTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRISetupAssistantFetchTask *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISetupAssistantFetchTask.m"), 154, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRISetupAssistantFetchTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

@end
