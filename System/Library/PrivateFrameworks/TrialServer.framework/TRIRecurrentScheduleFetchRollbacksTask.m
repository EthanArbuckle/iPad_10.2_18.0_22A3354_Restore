@implementation TRIRecurrentScheduleFetchRollbacksTask

+ (id)taskWithAttribution:(id)a3
{
  id v3;
  TRIRecurrentScheduleFetchRollbacksTask *v4;

  v3 = a3;
  v4 = -[TRIRecurrentScheduleFetchRollbacksTask initWithTaskAttribution:isRepeatedInstance:]([TRIRecurrentScheduleFetchRollbacksTask alloc], "initWithTaskAttribution:isRepeatedInstance:", v3, 0);

  return v4;
}

- (TRIRecurrentScheduleFetchRollbacksTask)initWithTaskAttribution:(id)a3 isRepeatedInstance:(BOOL)a4
{
  id v7;
  TRIRecurrentScheduleFetchRollbacksTask *v8;
  TRIRecurrentScheduleFetchRollbacksTask *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIRecurrentScheduleFetchRollbacksTask;
  v8 = -[TRIRecurrentScheduleFetchRollbacksTask init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_taskAttribution, a3);
    v9->_isRepeatedInstance = a4;
  }

  return v9;
}

- (NSArray)tags
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v9.receiver = self;
  v9.super_class = (Class)TRIRecurrentScheduleFetchRollbacksTask;
  -[TRIBaseTask tags](&v9, sel_tags);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = v4;
  else
    v6 = MEMORY[0x1E0C9AA60];
  v7 = (void *)objc_msgSend(v3, "initWithArray:", v6);

  objc_msgSend(v7, "addObject:", CFSTR("ScheduleFetchRollbacks"));
  +[TRITaskUtils addAttribution:toTaskTags:](TRITaskUtils, "addAttribution:toTaskTags:", self->_taskAttribution, v7);
  return (NSArray *)v7;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  NSObject *v4;
  uint8_t v6[16];

  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "TRIRecurrentScheduleFetchRollbacksTask is deprecated. Completing task without completing any work", v6, 2u);
  }

  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 2, 0, MEMORY[0x1E0C9AA60], 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  TRIRecurrentScheduleFetchRollbacksTask *v4;
  TRITaskAttributing *taskAttribution;
  TRIRecurrentScheduleFetchRollbacksTask *v6;
  void *v7;
  void *v8;
  TRITaskAttributing *v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = (TRIRecurrentScheduleFetchRollbacksTask *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)TRIRecurrentScheduleFetchRollbacksTask;
    if (-[TRIBaseTask isEqual:](&v14, sel_isEqual_, v4))
    {
      taskAttribution = self->_taskAttribution;
      v6 = v4;
      -[TRITaskAttributing asPersistedTaskAttribution](taskAttribution, "asPersistedTaskAttribution");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v6->_taskAttribution;

      -[TRITaskAttributing asPersistedTaskAttribution](v9, "asPersistedTaskAttribution");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "isEqual:", v11);

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TRIRecurrentScheduleFetchRollbacksTask;
  v3 = 37 * -[TRIBaseTask hash](&v8, sel_hash);
  v4 = v3 + (int)-[TRITaskAttributing triCloudKitContainer](self->_taskAttribution, "triCloudKitContainer");
  -[TRITaskAttributing teamIdentifier](self->_taskAttribution, "teamIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + 37 * v4;

  return v6;
}

- (int)taskType
{
  return 18;
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[TRITaskAttributing asPersistedTaskAttribution](self->_taskAttribution, "asPersistedTaskAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskAttribution:", v4);

  objc_msgSend(v3, "setIsRepeatedInstance:", self->_isRepeatedInstance);
  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIRecurrentScheduleFetchRollbacksTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRecurrentScheduleFetchRollbacksTask.m"), 113, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  TRIRecurrentScheduleFetchRollbacksTask *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  objc_class *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  +[TRIPBMessage parseFromData:error:](TRIRecurrentScheduleFetchRollbacksPersistedTask, "parseFromData:error:", a3, &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (!v3)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v4;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIRecurrentScheduleFetchRollbacksPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_16;
  }
  if ((objc_msgSend(v3, "hasTaskAttribution") & 1) == 0)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      v10 = "Cannot decode message of type %@ with missing field: taskAttribution";
LABEL_12:
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);

    }
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((objc_msgSend(v3, "hasIsRepeatedInstance") & 1) == 0)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      v10 = "Cannot decode message of type %@ with missing field: isRepeatedInstance";
      goto LABEL_12;
    }
    goto LABEL_16;
  }
  objc_msgSend(v3, "taskAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:](TRITaskAttributionInternalInsecure, "taskAttributionFromPersistedTask:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "failed to construct TRITaskAttributionInternalInsecure object", buf, 2u);
    }

    v6 = 0;
    goto LABEL_16;
  }
  v7 = -[TRIRecurrentScheduleFetchRollbacksTask initWithTaskAttribution:isRepeatedInstance:]([TRIRecurrentScheduleFetchRollbacksTask alloc], "initWithTaskAttribution:isRepeatedInstance:", v6, objc_msgSend(v3, "isRepeatedInstance"));
LABEL_17:

  return v7;
}

- (unint64_t)requiredCapabilities
{
  void *v2;
  unint64_t v3;

  -[TRITaskAttributing networkOptions](self->_taskAttribution, "networkOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiredCapability");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIRecurrentScheduleFetchRollbacksTask)initWithCoder:(id)a3
{
  id v4;
  TRIRecurrentScheduleFetchRollbacksTask *v5;
  void *v6;
  TRIRecurrentScheduleFetchRollbacksTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIRecurrentScheduleFetchRollbacksTask;
  v5 = -[TRIRecurrentScheduleFetchRollbacksTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIRecurrentScheduleFetchRollbacksTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRecurrentScheduleFetchRollbacksTask.m"), 148, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIRecurrentScheduleFetchRollbacksTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskAttribution, 0);
}

@end
