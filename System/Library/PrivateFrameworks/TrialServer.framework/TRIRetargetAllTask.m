@implementation TRIRetargetAllTask

- (int)taskType
{
  return 11;
}

+ (id)taskWithTaskAttribution:(id)a3
{
  id v3;
  TRIRetargetAllTask *v4;

  v3 = a3;
  v4 = -[TRIRetargetAllTask initWithTaskAttribution:]([TRIRetargetAllTask alloc], "initWithTaskAttribution:", v3);

  return v4;
}

- (TRIRetargetAllTask)initWithTaskAttribution:(id)a3
{
  id v5;
  TRIRetargetAllTask *v6;
  TRIRetargetAllTask *v7;
  void **p_taskAttribution;
  TRITaskAttributionInternalInsecure *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TRIRetargetAllTask;
  v6 = -[TRIRetargetAllTask init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    p_taskAttribution = (void **)&v6->_taskAttribution;
    objc_storeStrong((id *)&v6->_taskAttribution, a3);
    if (!*p_taskAttribution)
    {
      v9 = [TRITaskAttributionInternalInsecure alloc];
      objc_msgSend(MEMORY[0x1E0DC0A10], "inexpensiveOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[TRITaskAttributionInternalInsecure initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:](v9, "initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:", 0, 1, CFSTR("com.apple.triald"), v10);
      v12 = *p_taskAttribution;
      *p_taskAttribution = (void *)v11;

    }
  }

  return v7;
}

+ (id)task
{
  return -[TRIRetargetAllTask initWithTaskAttribution:]([TRIRetargetAllTask alloc], "initWithTaskAttribution:", 0);
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  int v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;

  v6 = a3;
  v25 = a4;
  v7 = (void *)objc_opt_new();
  v8 = (void *)MEMORY[0x1D8232A5C]();
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E9363F48, &unk_1E9363F60, &unk_1E9363F78, 0);
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "experimentDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __52__TRIRetargetAllTask_runUsingContext_withTaskQueue___block_invoke;
  v30[3] = &unk_1E9330B50;
  v30[4] = self;
  v12 = v7;
  v31 = v12;
  v24 = (void *)v9;
  LODWORD(v9) = objc_msgSend(v10, "enumerateExperimentRecordsMatchingStatuses:block:", v9, v30);
  objc_msgSend(v6, "rolloutDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v11;
  v28[1] = 3221225472;
  v28[2] = __52__TRIRetargetAllTask_runUsingContext_withTaskQueue___block_invoke_20;
  v28[3] = &unk_1E9335950;
  v28[4] = self;
  v14 = v12;
  v29 = v14;
  v15 = 3;
  v16 = objc_msgSend(v13, "enumerateActiveRecordsWithVisibility:usingTransaction:block:", 3, 0, v28);
  objc_msgSend(v6, "bmltDatabase");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __52__TRIRetargetAllTask_runUsingContext_withTaskQueue___block_invoke_2;
  v26[3] = &unk_1E9335978;
  v26[4] = self;
  v18 = v14;
  v27 = v18;
  v19 = objc_msgSend(v17, "enumerateActiveTasksWithBlock:", v26);
  if ((_DWORD)v9 && v16 && v19)
  {
    -[TRIRetargetAllTask setNextTasks:](self, "setNextTasks:", v18);
    v15 = 2;
  }
  objc_msgSend(MEMORY[0x1E0DC0B90], "updateSystemInfoUsingContext:", v6);
  -[TRIRetargetAllTask nextTasks](self, "nextTasks");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");
  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v15, 1, v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __52__TRIRetargetAllTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isManuallyTargeted"))
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "experimentDeployment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortDesc");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Retargeting is being suppressed for manually-targeted experiment: %@", (uint8_t *)&v9, 0xCu);

    }
  }
  else if ((objc_msgSend(v3, "isShadow") & 1) == 0)
  {
    objc_msgSend(v3, "experimentDeployment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRITargetingTask taskWithExperiment:includeDependencies:taskAttribution:](TRITargetingTask, "taskWithExperiment:includeDependencies:taskAttribution:", v7, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }

}

void __52__TRIRetargetAllTask_runUsingContext_withTaskQueue___block_invoke_20(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "deployment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIRolloutTargetingTask taskWithRolloutDeployment:includeDependencies:taskAttribution:triggerEvent:](TRIRolloutTargetingTask, "taskWithRolloutDeployment:includeDependencies:taskAttribution:triggerEvent:", v3, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 2);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
}

void __52__TRIRetargetAllTask_runUsingContext_withTaskQueue___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "bmltDeployment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIBMLTTargetingTask taskWithBMLTDeployment:includeDependencies:taskAttribution:triggerEvent:](TRIBMLTTargetingTask, "taskWithBMLTDeployment:includeDependencies:taskAttribution:triggerEvent:", v3, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[TRITaskAttributing asPersistedTaskAttribution](self->_taskAttribution, "asPersistedTaskAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskAttribution:", v4);

  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIRetargetAllTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRetargetAllTask.m"), 136, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  +[TRIPBMessage parseFromData:error:](TRIRetargetAllPersistedTask, "parseFromData:error:", a3, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (v4)
  {
    if (objc_msgSend(v4, "hasTaskAttribution"))
    {
      objc_msgSend(v4, "taskAttribution");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:](TRITaskAttributionInternalInsecure, "taskAttributionFromPersistedTask:", v6);
      v7 = objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        TRILogCategory_Server();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v8 = "invalid de-serialized TRITaskAttribution pb message";
          v9 = v7;
          v10 = 2;
LABEL_12:
          _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
          goto LABEL_7;
        }
        goto LABEL_7;
      }
    }
    else
    {
      v7 = 0;
    }
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTaskAttribution:", v7);
    goto LABEL_10;
  }
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v5;
    v8 = "Unable to parse buffer as TRIRetargetAllPersistedTask: %{public}@";
    v9 = v7;
    v10 = 12;
    goto LABEL_12;
  }
LABEL_7:
  v11 = 0;
LABEL_10:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIRetargetAllTask)initWithCoder:(id)a3
{
  id v4;
  TRIRetargetAllTask *v5;
  void *v6;
  TRIRetargetAllTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIRetargetAllTask;
  v5 = -[TRIRetargetAllTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIRetargetAllTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRetargetAllTask.m"), 164, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIRetargetAllTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (NSArray)nextTasks
{
  return self->_nextTasks;
}

- (void)setNextTasks:(id)a3
{
  objc_storeStrong((id *)&self->_nextTasks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextTasks, 0);
  objc_storeStrong((id *)&self->_taskAttribution, 0);
}

@end
