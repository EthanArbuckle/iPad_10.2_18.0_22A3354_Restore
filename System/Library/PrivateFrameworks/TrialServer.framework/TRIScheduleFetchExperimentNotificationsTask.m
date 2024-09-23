@implementation TRIScheduleFetchExperimentNotificationsTask

- (int)taskType
{
  return 16;
}

- (TRIScheduleFetchExperimentNotificationsTask)initWithRollbacksOnly:(BOOL)a3 downloadOptions:(id)a4
{
  id v7;
  TRIScheduleFetchExperimentNotificationsTask *v8;
  TRIScheduleFetchExperimentNotificationsTask *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TRIScheduleFetchExperimentNotificationsTask;
  v8 = -[TRIScheduleFetchExperimentNotificationsTask init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_rollbacksOnly = a3;
    objc_storeStrong((id *)&v8->_options, a4);
  }

  return v9;
}

+ (id)taskWithRollbacksOnly:(BOOL)a3 downloadOptions:(id)a4
{
  _BOOL8 v4;
  id v5;
  TRIScheduleFetchExperimentNotificationsTask *v6;

  v4 = a3;
  v5 = a4;
  v6 = -[TRIScheduleFetchExperimentNotificationsTask initWithRollbacksOnly:downloadOptions:]([TRIScheduleFetchExperimentNotificationsTask alloc], "initWithRollbacksOnly:downloadOptions:", v4, v5);

  return v6;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6;
  TRITaskAttributionInternalInsecure *v7;
  NSObject *v8;
  NSMutableArray *v9;
  NSMutableArray *nextTasks;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *v15;
  NSMutableArray *v16;
  void *v17;
  NSMutableArray *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  _BOOL4 rollbacksOnly;
  void *v34;
  NSMutableArray *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  SEL v41;
  void *v42;
  id v43;
  TRITaskAttributionInternalInsecure *v44;
  id obj;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  TRIScheduleFetchExperimentNotificationsTask *v53;
  uint8_t buf[16];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[TRITaskAttributionInternalInsecure initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:]([TRITaskAttributionInternalInsecure alloc], "initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:", 0, 1, CFSTR("com.apple.triald"), self->_options);
  v46 = v6;
  if (+[TRIUserAdjustableSettings getExperimentOptOut:](TRIUserAdjustableSettings, "getExperimentOptOut:", v6))
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "Skipping scheduling of experiment notification fetch task due to user opt-out of experiments", buf, 2u);
    }

    v9 = (NSMutableArray *)objc_opt_new();
    nextTasks = self->_nextTasks;
    self->_nextTasks = v9;

    if (!self->_rollbacksOnly)
    {
      v11 = self->_nextTasks;
      +[TRISelectRolloutNotificationListTask taskWithNamespaceNames:taskAttribution:](TRISelectRolloutNotificationListTask, "taskWithNamespaceNames:taskAttribution:", 0, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v11, "addObject:", v12);

    }
    +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 2, 1, self->_nextTasks, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (NSMutableArray *)objc_opt_new();
    v15 = self->_nextTasks;
    self->_nextTasks = v14;

    v16 = self->_nextTasks;
    +[TRIFetchMultipleExperimentNotificationsTask taskWithStartingFetchDateOverride:namespaceNames:taskAttributing:rollbacksOnly:limitedCarryOnly:](TRIFetchMultipleExperimentNotificationsTask, "taskWithStartingFetchDateOverride:namespaceNames:taskAttributing:rollbacksOnly:limitedCarryOnly:", 0, 0, v7, self->_rollbacksOnly, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v16, "addObject:", v17);

    if (!self->_rollbacksOnly)
    {
      v18 = self->_nextTasks;
      +[TRISelectRolloutNotificationListTask taskWithNamespaceNames:taskAttribution:](TRISelectRolloutNotificationListTask, "taskWithNamespaceNames:taskAttribution:", 0, v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v18, "addObject:", v19);

    }
    v20 = (void *)objc_opt_new();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __77__TRIScheduleFetchExperimentNotificationsTask_runUsingContext_withTaskQueue___block_invoke;
    v51[3] = &unk_1E932F878;
    v21 = v20;
    v52 = v21;
    v53 = self;
    v22 = (void *)MEMORY[0x1D8232C48](v51);
    objc_msgSend(v46, "namespaceDatabase");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "enumerateAppContainerIdsForContainer:block:", 2, v22);

    if ((v24 & 1) != 0)
    {
      v41 = a2;
      v42 = v22;
      v43 = v21;
      v44 = v7;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      objc_msgSend(v21, "allValues");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v48;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v48 != v27)
              objc_enumerationMutation(obj);
            v29 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v28);
            objc_msgSend(v46, "namespaceDatabase");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "teamIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v31)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", v41, self, CFSTR("TRIScheduleFetchExperimentNotificationsTask.m"), 104, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("taskAttributing.teamIdentifier"));

            }
            v32 = objc_msgSend(v30, "hasUnfetchedNamespaceForTeamId:", v31);

            if (self->_rollbacksOnly || v32)
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              rollbacksOnly = self->_rollbacksOnly;
            }
            else
            {
              rollbacksOnly = 0;
              v34 = 0;
            }
            v35 = self->_nextTasks;
            +[TRIFetchMultipleExperimentNotificationsTask taskWithStartingFetchDateOverride:namespaceNames:taskAttributing:rollbacksOnly:limitedCarryOnly:](TRIFetchMultipleExperimentNotificationsTask, "taskWithStartingFetchDateOverride:namespaceNames:taskAttributing:rollbacksOnly:limitedCarryOnly:", v34, 0, v29, rollbacksOnly, 0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](v35, "addObject:", v36);

            ++v28;
          }
          while (v26 != v28);
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        }
        while (v26);
      }

      v38 = (void *)-[NSMutableArray copy](self->_nextTasks, "copy");
      +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 2, 1, v38, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v43;
      v7 = v44;
      v22 = v42;
    }
    else
    {
      TRILogCategory_Server();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v39, OS_LOG_TYPE_ERROR, "failed to schedule fetching experiments for all containers", buf, 2u);
      }

      v38 = (void *)-[NSMutableArray copy](self->_nextTasks, "copy");
      +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 3, 1, v38, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v13;
}

void __77__TRIScheduleFetchExperimentNotificationsTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  TRITaskAttributionInternalInsecure *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8
    || (objc_msgSend(v8, "applicationBundleIdentifier"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        a4 == 2)
    && !v10)
  {
    v11 = -[TRITaskAttributionInternalInsecure initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:]([TRITaskAttributionInternalInsecure alloc], "initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:", v7, 2, v12, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v7);

  }
}

- (id)nextTasksForRunStatus:(int)a3
{
  return self->_nextTasks;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TRIScheduleFetchExperimentNotificationsTask;
  if (-[TRIBaseTask isEqual:](&v7, sel_isEqual_, v4) && self->_rollbacksOnly == *((unsigned __int8 *)v4 + 24))
    v5 = -[TRIDownloadOptions isEqual:](self->_options, "isEqual:", v4[5]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIScheduleFetchExperimentNotificationsTask;
  return self->_rollbacksOnly + 37 * -[TRIBaseTask hash](&v3, sel_hash);
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setRollbacksOnly:", self->_rollbacksOnly);
  -[TRIDownloadOptions serializeToPersistedBehavior](self->_options, "serializeToPersistedBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNetworkBehavior:", v4);

  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIScheduleFetchExperimentNotificationsTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIScheduleFetchExperimentNotificationsTask.m"), 160, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_class *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  +[TRIPBMessage parseFromData:error:](TRIScheduleFetchExperimentNotificationsPersistedTask, "parseFromData:error:", a3, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v3)
  {
    if ((objc_msgSend(v3, "hasRollbacksOnly") & 1) != 0)
    {
      if (objc_msgSend(v3, "hasNetworkBehavior"))
      {
        objc_msgSend(v3, "networkBehavior");
        v5 = objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0A10]), "initFromPersistedBehavior:", v5);
          if (v6)
            goto LABEL_14;
        }
      }
      else
      {
        v5 = 0;
      }
      objc_msgSend(MEMORY[0x1E0DC0A10], "inexpensiveOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      +[TRIScheduleFetchExperimentNotificationsTask taskWithRollbacksOnly:downloadOptions:](TRIScheduleFetchExperimentNotificationsTask, "taskWithRollbacksOnly:downloadOptions:", objc_msgSend(v3, "rollbacksOnly"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: rollbacksOnly", buf, 0xCu);

    }
  }
  else
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v4;
      _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIScheduleFetchExperimentNotificationsPersistedTask: %{public}@", buf, 0xCu);
    }
  }
  v7 = 0;
LABEL_15:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIScheduleFetchExperimentNotificationsTask)initWithCoder:(id)a3
{
  id v4;
  TRIScheduleFetchExperimentNotificationsTask *v5;
  void *v6;
  TRIScheduleFetchExperimentNotificationsTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIScheduleFetchExperimentNotificationsTask;
  v5 = -[TRIScheduleFetchExperimentNotificationsTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIScheduleFetchExperimentNotificationsTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIScheduleFetchExperimentNotificationsTask.m"), 186, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIScheduleFetchExperimentNotificationsTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_nextTasks, 0);
}

@end
