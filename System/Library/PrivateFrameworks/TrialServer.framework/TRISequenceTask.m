@implementation TRISequenceTask

- (int)taskType
{
  return 15;
}

+ (id)task
{
  return (id)objc_opt_new();
}

- (TRISequenceTask)initWithTask:(id)a3 dependency:(id)a4
{
  id v8;
  id v9;
  TRISequenceTask *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TRISequenceTask;
  v10 = -[TRISequenceTask init](&v13, sel_init);
  if (v10)
  {
    if (!v8 && v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("TRISequenceTask.m"), 37, CFSTR("task must not be nil if dependency is nil"));

    }
    objc_storeStrong((id *)&v10->_task, a3);
    objc_storeStrong((id *)&v10->_dependentTask, a4);
  }

  return v10;
}

- (NSString)taskName
{
  objc_class *v2;

  if (self->_task)
  {
    -[TRITask taskName](self->_task, "taskName");
  }
  else
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
  }
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)metrics
{
  TRITask *task;

  task = self->_task;
  if (task)
  {
    if (-[TRITask conformsToProtocol:](task, "conformsToProtocol:", &unk_1EFC7B928))
      task = self->_task;
    else
      task = 0;
  }
  return (id)-[TRITask metrics](task, "metrics");
}

- (id)dimensions
{
  TRITask *task;

  task = self->_task;
  if (task)
  {
    if (-[TRITask conformsToProtocol:](task, "conformsToProtocol:", &unk_1EFC7B928))
      task = self->_task;
    else
      task = 0;
  }
  return (id)-[TRITask dimensions](task, "dimensions");
}

- (id)trialSystemTelemetry
{
  TRITask *task;

  task = self->_task;
  if (task)
  {
    if (-[TRITask conformsToProtocol:](task, "conformsToProtocol:", &unk_1EFC7B928))
      task = self->_task;
    else
      task = 0;
  }
  return (id)-[TRITask trialSystemTelemetry](task, "trialSystemTelemetry");
}

- (int)retryCount
{
  TRITask *task;

  task = self->_task;
  if (task)
  {
    if (-[TRITask conformsToProtocol:](task, "conformsToProtocol:", &unk_1EFC7C128))
      task = self->_task;
    else
      task = 0;
  }
  return -[TRITask retryCount](task, "retryCount");
}

- (void)setRetryCount:(int)a3
{
  TRITask *task;
  uint64_t v5;
  TRITask *v6;
  TRITask *v7;

  task = self->_task;
  if (task)
  {
    v5 = *(_QWORD *)&a3;
    if (-[TRITask conformsToProtocol:](task, "conformsToProtocol:", &unk_1EFC7C128))
    {
      v6 = self->_task;
      if (v6)
      {
        v7 = v6;
        -[TRITask setRetryCount:](v6, "setRetryCount:", v5);

      }
    }
  }
}

- (TRITask)lastTask
{
  return self->_task;
}

- (void)addTaskToEndOfSequence:(id)a3
{
  uint64_t v4;
  TRITask *task;
  TRISequenceTask *v6;
  TRITask *dependentTask;
  TRITask *v8;
  _QWORD *v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v9[4];
    task = v9;
    -[TRISequenceTask addTaskToEndOfSequence:](self, "addTaskToEndOfSequence:", v4);
    -[TRISequenceTask addTaskToEndOfSequence:](self, "addTaskToEndOfSequence:", *((_QWORD *)task + 3));
  }
  else
  {
    if (self->_task)
    {
      v6 = -[TRISequenceTask initWithTask:dependency:]([TRISequenceTask alloc], "initWithTask:dependency:", self->_task, self->_dependentTask);
      dependentTask = self->_dependentTask;
      self->_dependentTask = (TRITask *)v6;

    }
    v8 = v9;
    task = self->_task;
    self->_task = v8;
  }

}

- (NSArray)dependencies
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_dependentTask)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "addObject:", self->_dependentTask);
    -[TRITask dependencies](self->_task, "dependencies");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[TRITask dependencies](self->_task, "dependencies");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v5);

    }
  }
  else
  {
    -[TRITask dependencies](self->_task, "dependencies");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v3;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  return (id)-[TRITask runUsingContext:withTaskQueue:](self->_task, "runUsingContext:withTaskQueue:", a3, a4);
}

- (NSArray)tags
{
  return (NSArray *)-[TRITask tags](self->_task, "tags");
}

- (NSDate)startTime
{
  return (NSDate *)-[TRITask startTime](self->_task, "startTime");
}

- (NSString)description
{
  return (NSString *)-[TRITask description](self->_task, "description");
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[TRITask debugDescription](self->_task, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<SequenceTask: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (BOOL)_isTask:(id)a3 equalTo:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  char v8;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (v5 | v6)
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend((id)v5, "isEqual:", v6);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  TRISequenceTask *v4;
  TRISequenceTask *v5;
  char v6;
  objc_super v8;

  v4 = (TRISequenceTask *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TRISequenceTask;
    if (-[TRIBaseTask isEqual:](&v8, sel_isEqual_, v4))
    {
      v5 = v4;
      if (objc_msgSend((id)objc_opt_class(), "_isTask:equalTo:", self->_task, v5->_task))
        v6 = objc_msgSend((id)objc_opt_class(), "_isTask:equalTo:", self->_dependentTask, v5->_dependentTask);
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  TRITask *task;
  uint64_t v5;
  TRITask *dependentTask;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TRISequenceTask;
  v3 = -[TRIBaseTask hash](&v8, sel_hash);
  task = self->_task;
  if (task)
    v5 = -[TRITask hash](task, "hash");
  else
    v5 = 0;
  dependentTask = self->_dependentTask;
  if (dependentTask)
    dependentTask = (TRITask *)-[TRITask hash](dependentTask, "hash");
  return (unint64_t)dependentTask + 1369 * v3 + 37 * v5;
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  if (self->_task)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "setTask:", v4);

    v5 = -[TRITask taskType](self->_task, "taskType");
    objc_msgSend(v3, "task");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setType:", v5);

    -[TRITask serialize](self->_task, "serialize");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "task");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSerialized:", v7);

  }
  if (self->_dependentTask)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v3, "setDependentTask:", v9);

    v10 = -[TRITask taskType](self->_dependentTask, "taskType");
    objc_msgSend(v3, "dependentTask");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setType:", v10);

    -[TRITask serialize](self->_dependentTask, "serialize");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dependentTask");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSerialized:", v12);

  }
  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRISequenceTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISequenceTask.m"), 194, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  TRISequenceTask *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  +[TRIPBMessage parseFromData:error:](TRISequencePersistedTask, "parseFromData:error:", a3, &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (!v3)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v4;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRISequencePersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (objc_msgSend(v3, "hasTask"))
  {
    objc_msgSend(v3, "task");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __33__TRISequenceTask_parseFromData___block_invoke(v5);
    v6 = objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_14;
  }
  else
  {
    v6 = 0;
  }
  if (!objc_msgSend(v3, "hasDependentTask"))
  {
    v8 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v3, "dependentTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __33__TRISequenceTask_parseFromData___block_invoke(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (!v6)
    {
      TRILogCategory_Server();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "TRISequencePersistedTask encodes dependent task without primary task", buf, 2u);
      }

      v6 = 0;
      v10 = 0;
      goto LABEL_17;
    }
LABEL_16:
    v10 = -[TRISequenceTask initWithTask:dependency:]([TRISequenceTask alloc], "initWithTask:dependency:", v6, v8);
LABEL_17:

    goto LABEL_18;
  }
LABEL_14:
  v10 = 0;
LABEL_18:

  return v10;
}

id __33__TRISequenceTask_parseFromData___block_invoke(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if ((objc_msgSend(v1, "hasType") & 1) == 0)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11[0]) = 0;
      v7 = "TRISequencePersistedTask is missing task type";
LABEL_9:
      v8 = v6;
      v9 = 2;
LABEL_10:
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)v11, v9);
    }
LABEL_12:

    v5 = 0;
    goto LABEL_13;
  }
  if ((objc_msgSend(v1, "hasSerialized") & 1) == 0)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11[0]) = 0;
      v7 = "TRISequencePersistedTask is missing serialized task bytes";
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  +[TRITaskSupport sharedInstance](TRITaskSupport, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "taskClassForTaskType:", objc_msgSend(v1, "type"));

  if (!v3)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v11[0] = 67109120;
    v11[1] = objc_msgSend(v1, "type");
    v7 = "TRISequencePersistedTask encodes unsupported class type %d";
    v8 = v6;
    v9 = 8;
    goto LABEL_10;
  }
  objc_msgSend(v1, "serialized");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parseFromData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRISequenceTask)initWithCoder:(id)a3
{
  id v4;
  TRISequenceTask *v5;
  void *v6;
  TRISequenceTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRISequenceTask;
  v5 = -[TRISequenceTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRISequenceTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISequenceTask.m"), 255, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRISequenceTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (BOOL)wasDeferred
{
  return self->wasDeferred;
}

- (void)setWasDeferred:(BOOL)a3
{
  self->wasDeferred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentTask, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
