@implementation TRIConfigurationTask

- (int)taskType
{
  return 13;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x1E0DC0B90];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "paths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithPaths:", v7);
  objc_msgSend(v8, "createPersistentDeviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = 2;
  else
    v10 = 3;
  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v10, 1, MEMORY[0x1E0C9AA60], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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

  -[TRIConfigurationTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIConfigurationTask.m"), 45, CFSTR("Unexpected failure to serialize %@"), v9);

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
  +[TRIPBMessage parseFromData:error:](TRIConfigurationPersistedTask, "parseFromData:error:", a3, &v8);
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
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIConfigurationPersistedTask: %{public}@", buf, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIConfigurationTask)initWithCoder:(id)a3
{
  id v4;
  TRIConfigurationTask *v5;
  void *v6;
  TRIConfigurationTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIConfigurationTask;
  v5 = -[TRIConfigurationTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIConfigurationTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIConfigurationTask.m"), 63, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIConfigurationTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

@end
