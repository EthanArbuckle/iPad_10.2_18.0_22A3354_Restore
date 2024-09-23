@implementation TRISubscribeChannelTask

- (int)taskType
{
  return 27;
}

- (TRISubscribeChannelTask)initWithExperiment:(id)a3
{
  id v6;
  TRISubscribeChannelTask *v7;
  TRISubscribeChannelTask *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISubscribeChannelTask.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentId"));

  }
  v11.receiver = self;
  v11.super_class = (Class)TRISubscribeChannelTask;
  v7 = -[TRISubscribeChannelTask init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_experimentId, a3);

  return v8;
}

+ (id)taskWithExperimentId:(id)a3 startTime:(id)a4
{
  id v5;
  id v6;
  TRISubscribeChannelTask *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[TRISubscribeChannelTask initWithExperiment:]([TRISubscribeChannelTask alloc], "initWithExperiment:", v6);

  -[TRISubscribeChannelTask setStartTime:](v7, "setStartTime:", v5);
  return v7;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSString *experimentId;
  void *v16;
  int v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(MEMORY[0x1E0DC09C0], "currentEnvironment");
  objc_msgSend(MEMORY[0x1E0DC0B90], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "populationType");

  if (v8 == 3 && v6 == 3)
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      experimentId = self->_experimentId;
      v18 = 138543362;
      v19 = experimentId;
      _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "Skipping subscribing to cloud channel for experiment %{public}@ because it is deployed to UAT", (uint8_t *)&v18, 0xCu);
    }

    v11 = MEMORY[0x1E0C9AA60];
    v12 = 4;
    v13 = 1;
  }
  else
  {
    objc_msgSend(v5, "pushServiceMuxer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subscribeForExperimentId:", self->_experimentId);

    v11 = MEMORY[0x1E0C9AA60];
    v12 = 2;
    v13 = 0;
  }
  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v12, v13, v11, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  TRISubscribeChannelTask *v4;
  TRISubscribeChannelTask *v5;
  char v6;
  objc_super v8;

  v4 = (TRISubscribeChannelTask *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TRISubscribeChannelTask;
    if (-[TRIBaseTask isEqual:](&v8, sel_isEqual_, v4)
      && -[TRISubscribeChannelTask isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      if (-[NSString isEqualToString:](self->_experimentId, "isEqualToString:", v5->_experimentId))
        v6 = objc_msgSend(MEMORY[0x1E0C99D68], "triIsDate:equalToDate:", self->_startTime, v5->_startTime);
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
  NSUInteger v4;
  NSDate *startTime;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TRISubscribeChannelTask;
  v3 = -[TRIBaseTask hash](&v7, sel_hash);
  v4 = -[NSString hash](self->_experimentId, "hash");
  startTime = self->_startTime;
  if (startTime)
    startTime = (NSDate *)-[NSDate hash](startTime, "hash");
  return (unint64_t)startTime + 1369 * v3 + 37 * v4;
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setExperimentId:", self->_experimentId);
  -[TRISubscribeChannelTask startTime](self, "startTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC0F50]);
    -[TRISubscribeChannelTask startTime](self, "startTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithDate:", v6);
    objc_msgSend(v3, "setStartTimestamp:", v7);

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

  -[TRISubscribeChannelTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISubscribeChannelTask.m"), 114, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  const char *v15;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  +[TRIPBMessage parseFromData:error:](TRISubscribeChannelPersistedTask, "parseFromData:error:", a3, &v20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v20;
  if (!v3)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v4;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRISubscribePersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if ((objc_msgSend(v3, "hasExperimentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v18;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);

    }
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v14;
    v15 = "Cannot decode message of type %@ with missing field: experimentId";
    goto LABEL_17;
  }
  objc_msgSend(v3, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_13:
      v11 = 0;
      goto LABEL_14;
    }
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v14;
    v15 = "Cannot decode message of type %@ with field of length 0: experimentId";
LABEL_17:
    _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);

    goto LABEL_13;
  }
  v7 = (void *)objc_opt_class();
  objc_msgSend(v3, "experimentId");
  v8 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasStartTimestamp") & 1) != 0)
  {
    objc_msgSend(v3, "startTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "taskWithExperimentId:startTime:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "taskWithExperimentId:startTime:", v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_14:

  return v11;
}

- (unint64_t)requiredCapabilities
{
  return 0;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%@>"), objc_opt_class(), self->_experimentId);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRISubscribeChannelTask)initWithCoder:(id)a3
{
  id v4;
  TRISubscribeChannelTask *v5;
  void *v6;
  TRISubscribeChannelTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRISubscribeChannelTask;
  v5 = -[TRISubscribeChannelTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRISubscribeChannelTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISubscribeChannelTask.m"), 144, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRISubscribeChannelTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

@end
