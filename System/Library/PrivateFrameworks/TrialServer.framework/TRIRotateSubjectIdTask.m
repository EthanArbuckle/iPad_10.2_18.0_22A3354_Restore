@implementation TRIRotateSubjectIdTask

- (int)taskType
{
  return 9;
}

+ (id)task
{
  return +[TRIRotateSubjectIdTask taskWithDeviceId:nextRotationDate:forceUpdate:](TRIRotateSubjectIdTask, "taskWithDeviceId:nextRotationDate:forceUpdate:", 0, 0, 0);
}

- (TRIRotateSubjectIdTask)initWithDeviceId:(id)a3 nextRotationDate:(id)a4 forceUpdate:(BOOL)a5
{
  id v10;
  id v11;
  TRIRotateSubjectIdTask *v12;
  TRIRotateSubjectIdTask *v13;
  void *v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  if (v10 && (unint64_t)objc_msgSend(v10, "length") <= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRotateSubjectIdTask.m"), 51, CFSTR("TRIRotateSubjectIdTask instantiated with unreasonably short deviceId: \"%@\"), v10);

  }
  v16.receiver = self;
  v16.super_class = (Class)TRIRotateSubjectIdTask;
  v12 = -[TRIRotateSubjectIdTask init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deviceId, a3);
    objc_storeStrong((id *)&v13->_nextRotationDate, a4);
    v13->_forceUpdate = a5;
  }

  return v13;
}

+ (id)taskWithDeviceId:(id)a3 nextRotationDate:(id)a4 forceUpdate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDeviceId:nextRotationDate:forceUpdate:", v9, v8, v5);

  return v10;
}

- (NSArray)tags
{
  return 0;
}

- (id)runTaskUsingContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *deviceId;
  void *v18;
  void *v19;
  NSString *v20;
  NSString *v21;
  NSDate *v22;
  NSDate *nextRotationDate;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  char v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  _BOOL4 v42;
  const char *v43;
  void *v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC0B80];
  objc_msgSend(v4, "paths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultProviderWithPaths:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_forceUpdate)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextRotationDate");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = (void *)v9,
        objc_msgSend(v7, "nextRotationDate"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "compare:", v8),
        v11,
        v10,
        v12 != 1))
  {

LABEL_8:
    objc_msgSend(v4, "client");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trackingId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "subject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rotateSubject");
    deviceId = self->_deviceId;
    objc_msgSend(v7, "subject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (deviceId)
    {
      objc_msgSend(v18, "setDeviceId:", deviceId);
    }
    else
    {
      objc_msgSend(v18, "deviceId");
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      v21 = self->_deviceId;
      self->_deviceId = v20;

    }
    if (self->_nextRotationDate)
    {
      objc_msgSend(v7, "setNextRotationDate:");
    }
    else
    {
      objc_msgSend(v7, "nextRotationDate");
      v22 = (NSDate *)objc_claimAutoreleasedReturnValue();
      nextRotationDate = self->_nextRotationDate;
      self->_nextRotationDate = v22;

    }
    if (!objc_msgSend(v7, "save"))
    {
      v32 = 3;
      v26 = v7;
LABEL_30:
      +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v32, 1, MEMORY[0x1E0C9AA60], 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v26;
      goto LABEL_31;
    }
    v24 = (void *)MEMORY[0x1E0DC0B80];
    objc_msgSend(v4, "paths");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "defaultProviderWithPaths:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "subject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "hasDeviceId");
    v29 = v28;
    if (v28 && v16)
    {
      objc_msgSend(v26, "subject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v16, "isEqual:", v30);

      if ((v31 & 1) != 0)
      {
LABEL_25:
        objc_msgSend(v26, "subject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "deviceId");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        TRILogCategory_Server();
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
        if (v40)
        {
          if (v42)
          {
            *(_WORD *)buf = 0;
            v43 = "subject rotated but device id was not changed";
LABEL_33:
            _os_log_error_impl(&dword_1D207F000, v41, OS_LOG_TYPE_ERROR, v43, buf, 2u);
          }
        }
        else if (v42)
        {
          *(_WORD *)buf = 0;
          v43 = "subject rotated but device id is nil";
          goto LABEL_33;
        }

        v32 = 3;
        goto LABEL_30;
      }
    }
    else
    {

      if ((v29 & 1) == 0)
        goto LABEL_25;
      if (!v16)
        goto LABEL_24;
    }
    objc_msgSend(v4, "client");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "shouldLogAtLevel:", 20);

    if (v34)
    {
      objc_msgSend(v4, "client");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "logger");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:", CFSTR("SubjectIdEnd"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v8, v38, 0, 0);

    }
LABEL_24:
    objc_msgSend(MEMORY[0x1E0DC0B88], "notifySubjectRotation");
    v32 = 2;
    goto LABEL_30;
  }
  TRILogCategory_Server();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "nextRotationDate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v48 = v45;
    _os_log_debug_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEBUG, "Not yet rotating subject id.  Next rotation date is %@", buf, 0xCu);

  }
  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 2, 0, MEMORY[0x1E0C9AA60], 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  TRIRotateSubjectIdTask *v4;
  TRIRotateSubjectIdTask *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  char v10;
  BOOL v11;
  objc_super v13;

  v4 = (TRIRotateSubjectIdTask *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TRIRotateSubjectIdTask;
    if (-[TRIBaseTask isEqual:](&v13, sel_isEqual_, v4))
    {
      v5 = v4;
      if (self->_forceUpdate == v5->_forceUpdate)
      {
        v6 = self->_deviceId;
        v7 = v5->_deviceId;
        if (v6 == v7)
        {

LABEL_15:
          v10 = objc_msgSend(MEMORY[0x1E0C99D68], "triIsDate:equalToDate:", self->_nextRotationDate, v5->_nextRotationDate);
LABEL_17:

          goto LABEL_18;
        }
        v8 = v7;
        if (v6)
          v9 = v7 == 0;
        else
          v9 = 1;
        if (v9)
        {

        }
        else
        {
          v11 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

          if (v11)
            goto LABEL_15;
        }
      }
      v10 = 0;
      goto LABEL_17;
    }
    v10 = 0;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  _BOOL8 forceUpdate;
  NSString *deviceId;
  uint64_t v6;
  NSDate *nextRotationDate;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TRIRotateSubjectIdTask;
  v3 = -[TRIBaseTask hash](&v9, sel_hash);
  forceUpdate = self->_forceUpdate;
  deviceId = self->_deviceId;
  if (deviceId)
    v6 = -[NSString hash](deviceId, "hash");
  else
    v6 = 0;
  nextRotationDate = self->_nextRotationDate;
  if (nextRotationDate)
    nextRotationDate = (NSDate *)-[NSDate hash](nextRotationDate, "hash");
  return (unint64_t)nextRotationDate + 50653 * v3 + 1369 * forceUpdate + 37 * v6;
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setForceUpdate:", self->_forceUpdate);
  if (self->_deviceId)
    objc_msgSend(v3, "setDeviceId:");
  if (self->_nextRotationDate)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0F50]), "initWithDate:", self->_nextRotationDate);
    objc_msgSend(v3, "setNextRotationTimestamp:", v4);

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

  -[TRIRotateSubjectIdTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRotateSubjectIdTask.m"), 190, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  objc_class *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  +[TRIPBMessage parseFromData:error:](TRIRotateSubjectIdPersistedTask, "parseFromData:error:", a3, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  if (!v4)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v5;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIRotateSubjectIdPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if ((objc_msgSend(v4, "hasForceUpdate") & 1) == 0)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: forceUpdate", buf, 0xCu);

    }
LABEL_13:
    v8 = 0;
    goto LABEL_21;
  }
  if (objc_msgSend(v4, "hasDeviceId"))
  {
    objc_msgSend(v4, "deviceId");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && (unint64_t)-[NSObject length](v6, "length") <= 7)
    {
      TRILogCategory_Server();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)a1, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v7;
        _os_log_error_impl(&dword_1D207F000, (os_log_t)a1, OS_LOG_TYPE_ERROR, "TRIRotateSubjectIdPersistedTask contains unreasonably short deviceId: \"%@\", buf, 0xCu);
      }
      v8 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    v7 = 0;
  }
  v9 = (void *)objc_opt_class();
  v10 = objc_msgSend(v4, "hasNextRotationTimestamp");
  if (v10)
  {
    objc_msgSend(v4, "nextRotationTimestamp");
    a1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v9, "taskWithDeviceId:nextRotationDate:forceUpdate:", v7, v11, objc_msgSend(v4, "forceUpdate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

LABEL_20:
  }
LABEL_21:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIRotateSubjectIdTask)initWithCoder:(id)a3
{
  id v4;
  TRIRotateSubjectIdTask *v5;
  void *v6;
  TRIRotateSubjectIdTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIRotateSubjectIdTask;
  v5 = -[TRIRotateSubjectIdTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIRotateSubjectIdTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRotateSubjectIdTask.m"), 221, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIRotateSubjectIdTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextRotationDate, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
}

@end
