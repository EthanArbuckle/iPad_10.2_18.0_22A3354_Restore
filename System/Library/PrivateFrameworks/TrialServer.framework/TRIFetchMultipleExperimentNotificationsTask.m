@implementation TRIFetchMultipleExperimentNotificationsTask

- (int)taskType
{
  return 5;
}

- (NSString)taskName
{
  return (NSString *)CFSTR("TRIFetchExperimentsTask");
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
  v9.super_class = (Class)TRIFetchMultipleExperimentNotificationsTask;
  -[TRIBaseTask tags](&v9, sel_tags);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = v4;
  else
    v6 = MEMORY[0x1E0C9AA60];
  v7 = (void *)objc_msgSend(v3, "initWithArray:", v6);

  if (self->_rollbacksOnly)
    objc_msgSend(v7, "addObject:", CFSTR("rollbacksOnly"));
  +[TRITaskUtils addAttribution:toTaskTags:](TRITaskUtils, "addAttribution:toTaskTags:", self->_taskAttributing, v7);
  return (NSArray *)v7;
}

+ (id)taskWithStartingFetchDateOverride:(id)a3 namespaceNames:(id)a4 taskAttributing:(id)a5 rollbacksOnly:(BOOL)a6 limitedCarryOnly:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  TRIFetchMultipleExperimentNotificationsTask *v14;

  v7 = a7;
  v8 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[TRIFetchMultipleExperimentNotificationsTask initWithStartingFetchDateOverride:namespaceNames:taskAttributing:rollbacksOnly:limitedCarryOnly:]([TRIFetchMultipleExperimentNotificationsTask alloc], "initWithStartingFetchDateOverride:namespaceNames:taskAttributing:rollbacksOnly:limitedCarryOnly:", v13, v12, v11, v8, v7);

  return v14;
}

- (TRIFetchMultipleExperimentNotificationsTask)initWithStartingFetchDateOverride:(id)a3 namespaceNames:(id)a4 taskAttributing:(id)a5 rollbacksOnly:(BOOL)a6 limitedCarryOnly:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  TRIFetchMultipleExperimentNotificationsTask *v16;
  TRIFetchMultipleExperimentNotificationsTask *v17;
  uint64_t v18;
  NSMutableArray *nextTasks;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TRIFetchMultipleExperimentNotificationsTask;
  v16 = -[TRIFetchMultipleExperimentNotificationsTask init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_startingFetchDateOverride, a3);
    v17->_rollbacksOnly = a6;
    v17->_limitedCarryOnly = a7;
    objc_storeStrong((id *)&v17->_taskAttributing, a5);
    v18 = objc_opt_new();
    nextTasks = v17->_nextTasks;
    v17->_nextTasks = (NSMutableArray *)v18;

    objc_storeStrong((id *)&v17->_namespaceNames, a4);
  }

  return v17;
}

- (TRIFetchMultipleExperimentNotificationsTask)initWithStartingFetchDateOverride:(id)a3 container:(int)a4 team:(id)a5 rollbacksOnly:(BOOL)a6 withNamespaceNames:(id)a7
{
  id v11;
  id v12;
  TRIFetchMultipleExperimentNotificationsTask *v13;
  TRIFetchMultipleExperimentNotificationsTask *v14;
  uint64_t v15;
  NSMutableArray *nextTasks;
  objc_super v18;

  v11 = a3;
  v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)TRIFetchMultipleExperimentNotificationsTask;
  v13 = -[TRIFetchMultipleExperimentNotificationsTask init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_startingFetchDateOverride, a3);
    v14->_rollbacksOnly = a6;
    objc_storeStrong((id *)&v14->_namespaceNames, a7);
    v15 = objc_opt_new();
    nextTasks = v14->_nextTasks;
    v14->_nextTasks = (NSMutableArray *)v15;

  }
  return v14;
}

- (void)_addNextTask:(id)a3
{
  -[NSMutableArray addObject:](self->_nextTasks, "addObject:", a3);
}

- (int64_t)nextTaskCount
{
  return -[NSMutableArray count](self->_nextTasks, "count");
}

- (id)nextTasks
{
  return self->_nextTasks;
}

- (id)_getNextTaskForExperiment:(id)a3 taskContext:(id)a4 taskQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableArray *nextTasks;
  void *v28;
  NSMutableArray *v29;
  NSMutableArray *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  NSObject *v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "experimentDeployment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchMultipleExperimentNotificationsTask.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("artifact.experimentDeployment"));

  }
  objc_msgSend(v9, "experimentId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchMultipleExperimentNotificationsTask.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("artifact.experimentId"));

  }
  objc_msgSend(v10, "experimentDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  switch(objc_msgSend(v9, "experimentType"))
  {
    case 0u:
      TRILogCategory_Server();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      objc_msgSend(v9, "experimentId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v19;
      _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "unknown experiment type for experiment id: %{public}@", buf, 0xCu);
      goto LABEL_27;
    case 1u:
    case 3u:
      TRILogCategory_Server();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "experimentId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = v17;
        _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "submit targeting task for experiment id: %{public}@", buf, 0xCu);

      }
      objc_msgSend(v9, "experimentDeployment");
      v18 = objc_claimAutoreleasedReturnValue();
      +[TRITargetingTask taskWithExperiment:includeDependencies:taskAttribution:](TRITargetingTask, "taskWithExperiment:includeDependencies:taskAttribution:", v18, 0, self->_taskAttributing);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 2u:
      TRILogCategory_Server();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "experimentDeployment");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "experimentId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v58 = v22;
        _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEFAULT, "rolling back experiment id: %{public}@", buf, 0xCu);

      }
      objc_msgSend(v9, "experimentId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cancelTasksWithTag:", v23);

      objc_msgSend(v9, "experimentDeployment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "taskTag");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cancelTasksWithTag:", v25);

      objc_msgSend(v9, "experimentId");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v26, objc_msgSend(v9, "deploymentId"), 0, 4, self->_taskAttributing);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      nextTasks = self->_nextTasks;
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __95__TRIFetchMultipleExperimentNotificationsTask__getNextTaskForExperiment_taskContext_taskQueue___block_invoke;
      v55[3] = &unk_1E9332D38;
      v56 = v9;
      -[NSMutableArray _pas_filteredArrayWithTest:](nextTasks, "_pas_filteredArrayWithTest:", v55);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (NSMutableArray *)objc_msgSend(v28, "mutableCopy");
      v30 = self->_nextTasks;
      self->_nextTasks = v29;

      v18 = v56;
      goto LABEL_29;
    case 5u:
      objc_msgSend(v9, "experiment");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "hasEndDate");

      if ((v32 & 1) == 0)
      {
        TRILogCategory_Server();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "experimentDeployment");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "experimentId");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v58 = v42;
          _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Experiment update notification missing endate. ID: %{public}@", buf, 0xCu);
          goto LABEL_26;
        }
LABEL_28:
        v15 = 0;
        goto LABEL_29;
      }
      if (!objc_msgSend(v9, "experimentState"))
      {
        TRILogCategory_Server();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v9, "experimentDeployment");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "experimentId");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v58 = v42;
          _os_log_impl(&dword_1D207F000, v18, OS_LOG_TYPE_INFO, "Update notification marked inactive, ignoring. ID: %{public}@", buf, 0xCu);
LABEL_26:

LABEL_27:
          goto LABEL_28;
        }
        goto LABEL_28;
      }
      objc_msgSend(v9, "experimentDeployment");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "experimentRecordWithExperimentDeployment:", v33);
      v18 = objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v9, "experiment");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "endDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "date");
        v36 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        if (v36 && objc_msgSend(v37, "compare:", v36) == 1)
        {
          TRILogCategory_Server();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v9, "experimentDeployment");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "experimentId");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v58 = v40;
            _os_log_impl(&dword_1D207F000, v39, OS_LOG_TYPE_INFO, "Experiment update end date occurs in the past, will schedule task for now if relevant. ID: %{public}@", buf, 0xCu);

          }
          v41 = 1;
        }
        else
        {
          v41 = 0;
        }
        switch(-[NSObject status](v18, "status"))
        {
          case 0:
          case 2:
          case 4:
            v44 = -[TRIFetchMultipleExperimentNotificationsTask _updateExperimentEndDateWithArtifact:context:database:scheduleDeactivationTask:scheduleDeactivationNow:](self, "_updateExperimentEndDateWithArtifact:context:database:scheduleDeactivationTask:scheduleDeactivationNow:", v9, v10, v14, 0, 0);
            goto LABEL_44;
          case 1:
            -[TRIFetchMultipleExperimentNotificationsTask _updateExperimentEndDateWithArtifact:context:database:scheduleDeactivationTask:scheduleDeactivationNow:](self, "_updateExperimentEndDateWithArtifact:context:database:scheduleDeactivationTask:scheduleDeactivationNow:", v9, v10, v14, 1, v41);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_45;
          case 3:
            TRILogCategory_Server();
            v45 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              goto LABEL_43;
            objc_msgSend(v9, "experimentDeployment");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "experimentId");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = -[NSObject status](v18, "status");
            *(_DWORD *)buf = 138543618;
            v58 = v47;
            v59 = 2048;
            v60 = v49;
            _os_log_impl(&dword_1D207F000, v45, OS_LOG_TYPE_INFO, "Experiment update for an experiment in finished state, ignoring. ID: %{public}@, state:%ld", buf, 0x16u);
            break;
          default:
            TRILogCategory_Server();
            v45 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              goto LABEL_43;
            objc_msgSend(v9, "experimentDeployment");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "experimentId");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = -[NSObject status](v18, "status");
            *(_DWORD *)buf = 138543618;
            v58 = v47;
            v59 = 2048;
            v60 = v48;
            _os_log_error_impl(&dword_1D207F000, v45, OS_LOG_TYPE_ERROR, "Experiment update for an experiment in unknown experiment state, ignoring. ID: %{public}@, state:%ld", buf, 0x16u);
            break;
        }

LABEL_43:
LABEL_44:
        v15 = 0;
LABEL_45:

      }
      else
      {
        TRILogCategory_Server();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "experimentDeployment");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "experimentId");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v58 = v51;
          _os_log_error_impl(&dword_1D207F000, v36, OS_LOG_TYPE_ERROR, "Missing existing experiment for an experiment update, ignoring. ID: %{public}@", buf, 0xCu);

        }
        v15 = 0;
      }

LABEL_29:
LABEL_30:

      return v15;
    default:
      goto LABEL_30;
  }
}

uint64_t __95__TRIFetchMultipleExperimentNotificationsTask__getNextTaskForExperiment_taskContext_taskQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "experiment"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(*(id *)(a1 + 32), "experimentDeployment"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "isEqualToDeployment:", v5),
        v5,
        v4,
        v6))
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "experimentId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Clearing out targeting task due to found rollback for %{public}@", (uint8_t *)&v11, 0xCu);

    }
    v9 = 0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)_nameForNotificationType:(int)a3
{
  uint64_t v3;
  __CFString *v4;
  void *v5;

  if (a3 == 1)
  {
    v4 = CFSTR("experiment");
  }
  else
  {
    v3 = *(_QWORD *)&a3;
    if (a3 == 3)
    {
      v4 = CFSTR("rollout");
    }
    else
    {
      TRICloudKitSupport_NotificationType_EnumDescriptor();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "enumNameForValue:", v3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v4;
}

- (BOOL)_processExperiment:(id)a3 taskContext:(id)a4 taskQueue:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  int v18;
  int v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "experimentDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "namespaceDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "paths");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "experimentDeployment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  if (objc_msgSend(v7, "hasDeploymentId"))
  {
    if (v13)
    {
      objc_msgSend(v10, "experimentRecordWithExperimentDeployment:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v15;
      if (v15)
      {
        if (objc_msgSend(v15, "isManuallyTargeted"))
        {
          TRILogCategory_Server();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v60 = v13;
            _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "Found existing manually targeted experiment record for %{public}@. Not processing this experiment notification", buf, 0xCu);
          }
          v17 = 0;
          goto LABEL_42;
        }
      }
    }
  }
  v52 = v14;
  v53 = v9;
  v18 = objc_msgSend(v7, "experimentType");
  v19 = objc_msgSend(v7, "experimentType");
  objc_msgSend(v7, "encodedExperimentDefinition");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v7, "encodedExperimentDefinition");
    v48 = v18;
    v21 = v19;
    v22 = v7;
    v23 = v8;
    v24 = v13;
    v25 = v12;
    v26 = v10;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "length") != 0;

    v10 = v26;
    v12 = v25;
    v13 = v24;
    v8 = v23;
    v7 = v22;
    v19 = v21;
    v18 = v48;
  }
  else
  {
    v28 = 0;
  }

  objc_msgSend(v7, "experimentId");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v53;
  if (!v29)
    goto LABEL_37;
  if (v18 == 2)
    v28 = 1;

  if (!v28)
  {
    if (v19 == 5)
      goto LABEL_21;
LABEL_37:
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[TRIFetchMultipleExperimentNotificationsTask _nameForNotificationType:](self, "_nameForNotificationType:", objc_msgSend(v7, "experimentType"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v30;
      _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "empty %{public}@", buf, 0xCu);
      goto LABEL_39;
    }
LABEL_40:
    v17 = 0;
LABEL_41:
    v14 = v52;
    goto LABEL_42;
  }
  if (v18 != 2 && v19 != 5 && (objc_msgSend(v7, "saveWithDatabase:paths:", v10, v12) & 1) == 0)
  {
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[TRIFetchMultipleExperimentNotificationsTask _nameForNotificationType:](self, "_nameForNotificationType:", objc_msgSend(v7, "experimentType"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "experimentId");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v30;
      v61 = 2114;
      v62 = v31;
      _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Unable to save %{public}@ with id %{public}@.", buf, 0x16u);

      v9 = v53;
LABEL_39:

      goto LABEL_40;
    }
    goto LABEL_40;
  }
LABEL_21:
  if (!objc_msgSend(v7, "deploymentEnvironment")
    || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "experimentType")),
        v32 = (void *)objc_claimAutoreleasedReturnValue(),
        v33 = objc_msgSend(&unk_1E9363828, "containsObject:", v32),
        v32,
        (v33 & 1) != 0))
  {
    objc_msgSend(v7, "namespaces");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v53;
    if (v34)
    {
      v47 = v12;
      v49 = v10;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      objc_msgSend(v7, "namespaces");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v55 != v38)
              objc_enumerationMutation(v35);
            v40 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
            objc_msgSend(v11, "dynamicNamespaceRecordWithNamespaceName:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if (v41)
              objc_msgSend(v11, "setFetched:forDynamicNamespaceName:", 1, v40);
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
        }
        while (v37);
      }

      v9 = v53;
      v12 = v47;
      v10 = v49;
    }
    -[TRIFetchMultipleExperimentNotificationsTask _getNextTaskForExperiment:taskContext:taskQueue:](self, "_getNextTaskForExperiment:taskContext:taskQueue:", v7, v8, v9);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
      -[TRIFetchMultipleExperimentNotificationsTask _addNextTask:](self, "_addNextTask:", v16);
    v17 = 1;
    goto LABEL_41;
  }
  TRILogCategory_Server();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    TRICloudKitSupport_NotificationType_EnumDescriptor();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "textFormatNameForValue:", objc_msgSend(v7, "experimentType"));
    v50 = v10;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    TRIDeploymentEnvironment_EnumDescriptor();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "textFormatNameForValue:", objc_msgSend(v7, "deploymentEnvironment"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v60 = v44;
    v61 = 2112;
    v62 = v46;
    _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring unsupported notification of type %@ for deploymentEnvironment %@.", buf, 0x16u);

    v10 = v50;
  }
  v17 = 0;
  v14 = v52;
  v9 = v53;
LABEL_42:

  return v17;
}

- (id)_updateExperimentEndDateWithArtifact:(id)a3 context:(id)a4 database:(id)a5 scheduleDeactivationTask:(BOOL)a6 scheduleDeactivationNow:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  TRIFetchMultipleExperimentNotificationsTask *v23;
  uint64_t *v24;
  BOOL v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__20;
  v31 = __Block_byref_object_dispose__20;
  v32 = 0;
  objc_msgSend(v13, "experimentDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __150__TRIFetchMultipleExperimentNotificationsTask__updateExperimentEndDateWithArtifact_context_database_scheduleDeactivationTask_scheduleDeactivationNow___block_invoke;
  v20[3] = &unk_1E9332D60;
  v16 = v12;
  v21 = v16;
  v17 = v14;
  v25 = a6;
  v23 = self;
  v24 = &v27;
  v26 = a7;
  v22 = v17;
  objc_msgSend(v15, "writeTransactionWithFailableBlock:", v20);

  v18 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v18;
}

uint64_t __150__TRIFetchMultipleExperimentNotificationsTask__updateExperimentEndDateWithArtifact_context_database_scheduleDeactivationTask_scheduleDeactivationNow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  unsigned __int8 *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "experimentDeployment");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        objc_msgSend(*(id *)(a1 + 32), "experimentId"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Failed to update experiment end date due to missing information, ignoring.", (uint8_t *)&v29, 2u);
    }
    goto LABEL_13;
  }
  v7 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "experiment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "experimentDeployment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "updateEndDate:forExperimentDeployment:usingTransaction:", v10, v11, v3);

  TRILogCategory_Server();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "experimentDeployment");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "experimentId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543362;
      v30 = v28;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Failed to update experiment end date, ignoring. ID: %{public}@", (uint8_t *)&v29, 0xCu);

    }
LABEL_13:
    v21 = (unsigned __int8 *)MEMORY[0x1E0D81680];
    goto LABEL_14;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "experimentDeployment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "experimentId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "experiment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = v15;
    v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "Updated experiment end date for experiment id: %{public}@ . New End Date: %{public}@", (uint8_t *)&v29, 0x16u);

  }
  if (!*(_BYTE *)(a1 + 64))
  {
    v21 = (unsigned __int8 *)MEMORY[0x1E0D81678];
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(a1 + 32), "experimentId");
  v14 = objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(*(id *)(a1 + 32), "deploymentId");
  v19 = *(unsigned __int8 *)(a1 + 65);
  if (*(_BYTE *)(a1 + 65))
  {
    v20 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "experiment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:startTime:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:startTime:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v14, v18, v20, 0, 25, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 64));
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v26 = *(void **)(v25 + 40);
  *(_QWORD *)(v25 + 40) = v24;

  if (!v19)
  {

  }
  v21 = (unsigned __int8 *)MEMORY[0x1E0D81678];
LABEL_14:

LABEL_15:
  v22 = *v21;

  return v22;
}

- (void)updateStatusForNamespacesWithContext:(id)a3
{
  id v4;
  void *v5;
  NSSet *v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  NSSet *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = self->_namespaceNames;
  v29 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v31;
    *(_QWORD *)&v7 = 138543362;
    v26 = v7;
    v27 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
        objc_msgSend(v4, "namespaceDatabase", v26);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dynamicNamespaceRecordWithNamespaceName:", v9);
        v11 = objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend((id)v11, "appContainer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "paths");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend((id)v11, "appContainer");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "pathsForContainer:asClientProcess:", v14, 0);
            v15 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)v15;
          }

          if (!v13)
          {
LABEL_13:
            TRILogCategory_Server();
            v16 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              goto LABEL_25;
            objc_msgSend((id)v11, "appContainer");
            v20 = objc_claimAutoreleasedReturnValue();
            -[NSObject identifier](v20, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v26;
            v35 = v21;
            _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "updateStatusForNamespacesWithContext skipping missing app container: %{public}@", buf, 0xCu);

            goto LABEL_24;
          }
        }
        else
        {
          objc_msgSend(v4, "paths");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
            goto LABEL_13;
        }
        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B18]), "initWithPaths:", v13);
        -[NSObject statusForNamespaceWithName:](v16, "statusForNamespaceWithName:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = v17;
          v19 = objc_msgSend(v17, "copyWithReplacementLastFetchAttempt:", v5);

          v20 = objc_msgSend((id)v19, "copyWithReplacementLastFetchWasSuccess:", 1);
        }
        else
        {
          v22 = v5;
          v23 = (void *)MEMORY[0x1E0DC0AD8];
          objc_msgSend(v13, "namespaceDescriptorsDefaultDir");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "loadWithNamespaceName:fromDirectory:", v9, v24);
          v19 = objc_claimAutoreleasedReturnValue();

          if (!(v11 | v19))
          {
            TRILogCategory_Server();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v26;
              v35 = v9;
              _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "expected namespace to be registered, but could not find descriptor: %{public}@", buf, 0xCu);
            }
            v5 = v22;
            v6 = v27;
            goto LABEL_24;
          }
          if (v19)
            v25 = objc_msgSend((id)v19, "downloadNCV");
          else
            v25 = objc_msgSend((id)v11, "compatibilityVersion");
          v5 = v22;
          v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B10]), "initWithNamespaceName:compatibilityVersion:lastFetchAttempt:lastFetchWasSuccess:", v9, v25, v22, 1);
          v6 = v27;
        }

        -[NSObject saveStatus:](v16, "saveStatus:", v20);
LABEL_24:

LABEL_25:
        ++v8;
      }
      while (v29 != v8);
      v29 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v29);
  }

}

- (BOOL)_checkIfAnyTreatmentPresent:(id)a3 usingContext:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;

  v5 = (void *)MEMORY[0x1E0DC0AE8];
  v6 = a3;
  objc_msgSend(a4, "paths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "factorProviderWithPaths:namespaceName:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
    v9 = 55;
  else
    v9 = 23;
  v10 = objc_msgSend(v8, "hasAnyTreatmentInLayers:", v9);

  return v10;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  TRIFetchMultipleExperimentNotificationsTask *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  dispatch_semaphore_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  int v37;
  NSSet *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  uint64_t v42;
  NSObject *v43;
  TRIFetchOptions *v44;
  NSSet *namespaceNames;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  uint64_t v49;
  uint64_t v50;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  dispatch_semaphore_t dsema;
  TRIFetchOptions *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[5];
  id v77;
  id v78;
  dispatch_semaphore_t v79;
  uint64_t *v80;
  uint64_t *v81;
  uint8_t *v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  int v97;
  uint8_t buf[8];
  uint8_t *v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;
  _BYTE v104[128];
  _BYTE v105[128];
  uint8_t v106[128];
  uint8_t v107[4];
  void *v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!+[TRIUserAdjustableSettings getExperimentOptOut:](TRIUserAdjustableSettings, "getExperimentOptOut:", v6))
  {
    v10 = self;
    objc_sync_enter(v10);
    v11 = (void *)os_transaction_create();
    objc_msgSend(v6, "keyValueStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIFetchDateManager managerWithKeyValueStore:](TRIFetchDateManager, "managerWithKeyValueStore:", v12);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "namespaceDatabase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paths");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "namespaceDescriptorsDefaultDir");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:](TRINamespaceDescriptorProvider, "providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v13, v15);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[TRITaskAttributing triCloudKitContainer](v10->_taskAttributing, "triCloudKitContainer");
    -[TRITaskAttributing teamIdentifier](v10->_taskAttributing, "teamIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRITaskAttributing applicationBundleIdentifier](v10->_taskAttributing, "applicationBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:](TRICKNativeArtifactProvider, "providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:", v16, v17, v18, v62, v61, v6);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    -[TRITaskAttributing networkOptions](v10->_taskAttributing, "networkOptions");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v57;
    if (objc_msgSend(v63, "allowsCellularAccess"))
    {
      objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("allows_cellular_download"), objc_msgSend(v63, "allowsCellularAccess"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIFetchMultipleExperimentNotificationsTask _addMetric:](v10, "_addMetric:", v20);

    }
    if (objc_msgSend(v63, "discretionaryBehavior"))
    {
      -[TRIBaseTask stateProvider](v10, "stateProvider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "activeActivityGrantingCapability:", objc_msgSend(v63, "requiredCapability"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        TRILogCategory_Server();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D207F000, v43, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", buf, 2u);
        }

        v44 = (TRIFetchOptions *)-[NSMutableArray copy](v10->_nextTasks, "copy");
        +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 1, 1, v44, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_60;
      }
      objc_msgSend(v63, "setActivity:", v22);

    }
    v59 = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:]([TRIFetchOptions alloc], "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v63, &unk_1E9363E28);
    v23 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    v99 = buf;
    v100 = 0x3032000000;
    v101 = __Block_byref_object_copy__20;
    v102 = __Block_byref_object_dispose__20;
    v103 = 0;
    v94 = 0;
    v95 = &v94;
    v96 = 0x2020000000;
    v97 = 0;
    v90 = 0;
    v91 = &v90;
    v92 = 0x2020000000;
    v93 = 0;
    v84 = 0;
    v85 = &v84;
    v86 = 0x3032000000;
    v87 = __Block_byref_object_copy__20;
    v88 = __Block_byref_object_dispose__20;
    v89 = 0;
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __77__TRIFetchMultipleExperimentNotificationsTask_runUsingContext_withTaskQueue___block_invoke;
    v76[3] = &unk_1E9332D88;
    v81 = &v84;
    v82 = buf;
    v80 = &v94;
    v76[4] = v10;
    v24 = v6;
    v77 = v24;
    v78 = v7;
    v83 = &v90;
    dsema = v23;
    v79 = dsema;
    v60 = (void *)MEMORY[0x1D8232C48](v76);
    objc_msgSend(v24, "xpcActivityManager");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "limitedCarryManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      if (!v10->_rollbacksOnly)
      {
        objc_msgSend(v24, "limitedCarryManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "fetchExperimentNotificationsForLimitedCarryExperimentWithManager:options:rollbacksOnly:completion:", v26, v59, 0, v60);

        dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
      }
      objc_msgSend(v24, "limitedCarryManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "fetchExperimentNotificationsForLimitedCarryExperimentWithManager:options:rollbacksOnly:completion:", v27, v59, 1, v60);

      dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
      if (v10->_limitedCarryOnly)
      {
        v28 = *((unsigned int *)v95 + 6);
        if ((_DWORD)v28 == 2)
        {
          objc_msgSend(v56, "postponeCellularActivity");
          v28 = *((unsigned int *)v95 + 6);
        }
        v29 = (void *)-[NSMutableArray copy](v10->_nextTasks, "copy");
        +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v28, 1, v29, *((_QWORD *)v99 + 5));
        v30 = objc_claimAutoreleasedReturnValue();
        goto LABEL_59;
      }
    }
    else
    {
      TRILogCategory_Server();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v24, "limitedCarryManager");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v107 = 138543362;
        v108 = v52;
        _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "Unable to fetch limited carry experiments as limitedCarryManager is: %{public}@", v107, 0xCu);

      }
    }
    objc_msgSend(v57, "fetchExperimentNotificationsWithNamespaceNames:rollbacksOnly:lastFetchDateOverride:options:completion:", v10->_namespaceNames, v10->_rollbacksOnly, v10->_startingFetchDateOverride, v59, v60);
    dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    if (v85[5])
    {
      v10->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:](TRICKNativeArtifactProvider, "isActivityDeferralError:");
      TRIFetchErrorParseToMetrics((void *)v85[5]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "count"))
      {
        v54 = v11;
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v33 = v32;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v72, v106, 16);
        if (v34)
        {
          v35 = *(_QWORD *)v73;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v73 != v35)
                objc_enumerationMutation(v33);
              -[TRIFetchMultipleExperimentNotificationsTask _addMetric:](v10, "_addMetric:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i));
            }
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v72, v106, 16);
          }
          while (v34);
        }

        v11 = v54;
        v19 = v57;
      }

    }
    v37 = *((_DWORD *)v95 + 6);
    if (v37 == 3)
    {
      namespaceNames = v10->_namespaceNames;
      if (!namespaceNames)
      {
LABEL_58:
        v50 = *((unsigned int *)v95 + 6);
        v29 = (void *)-[NSMutableArray copy](v10->_nextTasks, "copy");
        +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v50, 1, v29, *((_QWORD *)v99 + 5));
        v30 = objc_claimAutoreleasedReturnValue();
LABEL_59:
        v9 = (void *)v30;

        _Block_object_dispose(&v84, 8);
        _Block_object_dispose(&v90, 8);
        _Block_object_dispose(&v94, 8);
        _Block_object_dispose(buf, 8);

        v44 = v59;
LABEL_60:

        objc_sync_exit(v10);
        goto LABEL_61;
      }
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v38 = namespaceNames;
      v46 = -[NSSet countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v64, v104, 16);
      if (!v46)
      {
LABEL_57:

        goto LABEL_58;
      }
      v53 = v7;
      v55 = v11;
      v47 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v65 != v47)
            objc_enumerationMutation(v38);
          v49 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0DC0B18], "updateStatusFetchSuccess:forNamespaceName:withContext:", 0, v49, v24, v53);
          objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadFailedForKey:withError:", v49, 0);
        }
        v46 = -[NSSet countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v64, v104, 16);
      }
      while (v46);
    }
    else
    {
      if (v37 != 2)
        goto LABEL_58;
      objc_msgSend(v56, "postponeCellularActivity");
      -[TRIFetchMultipleExperimentNotificationsTask updateStatusForNamespacesWithContext:](v10, "updateStatusForNamespacesWithContext:", v24);
      if (v91[3])
        goto LABEL_58;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v38 = v10->_namespaceNames;
      v39 = -[NSSet countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v68, v105, 16);
      if (!v39)
        goto LABEL_57;
      v53 = v7;
      v55 = v11;
      v40 = *(_QWORD *)v69;
      do
      {
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v69 != v40)
            objc_enumerationMutation(v38);
          v42 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k);
          if (-[TRIFetchMultipleExperimentNotificationsTask _checkIfAnyTreatmentPresent:usingContext:](v10, "_checkIfAnyTreatmentPresent:usingContext:", v42, v24, v53))
          {
            objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadCompletedForKey:", v42);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0DC0B18], "updateStatusFetchSuccess:forNamespaceName:withContext:", 0, v42, v24);
            objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadFailedForKey:withError:", v42, 0);
          }
        }
        v39 = -[NSSet countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v68, v105, 16);
      }
      while (v39);
    }
    v7 = v53;
    v11 = v55;
    v19 = v57;
    goto LABEL_57;
  }
  TRILogCategory_Server();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "Skipping scheduled fetch of experiment notifications due to user opt-out of experiments", buf, 2u);
  }

  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 4, 1, MEMORY[0x1E0C9AA60], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_61:

  return v9;
}

void __77__TRIFetchMultipleExperimentNotificationsTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint8_t v18[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a2 == 2)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (v10)
    {
      *(_DWORD *)(v12 + 24) = 1;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a4);
LABEL_7:
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a5);
      goto LABEL_8;
    }
LABEL_6:
    *(_DWORD *)(v12 + 24) = 3;
    goto LABEL_7;
  }
  if (!a2)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    goto LABEL_6;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(a1 + 32), "_processExperiment:taskContext:taskQueue:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }
  if (a2 == 4 && v9)
  {
    if (!objc_msgSend(v9, "count"))
    {
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "Fetch status success but 0 results fetched.", v18, 2u);
      }

    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 2;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 2;
    if (a2 == 3)
      goto LABEL_9;
  }
LABEL_8:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
LABEL_9:

}

- (BOOL)isEqual:(id)a3
{
  TRIFetchMultipleExperimentNotificationsTask *v4;
  TRIFetchMultipleExperimentNotificationsTask *v5;
  NSDate *startingFetchDateOverride;
  NSSet *v7;
  NSSet *v8;
  NSSet *v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  objc_super v14;

  v4 = (TRIFetchMultipleExperimentNotificationsTask *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)TRIFetchMultipleExperimentNotificationsTask;
    if (-[TRIBaseTask isEqual:](&v14, sel_isEqual_, v4))
    {
      v5 = v4;
      if (!-[TRITaskAttributing isEqual:](self->_taskAttributing, "isEqual:", v5->_taskAttributing))
        goto LABEL_19;
      startingFetchDateOverride = self->_startingFetchDateOverride;
      if ((unint64_t)startingFetchDateOverride | (unint64_t)v5->_startingFetchDateOverride)
      {
        if (!-[NSDate isEqual:](startingFetchDateOverride, "isEqual:"))
          goto LABEL_19;
      }
      v7 = self->_namespaceNames;
      v8 = v5->_namespaceNames;
      if (v7 == v8)
      {

      }
      else
      {
        v9 = v8;
        if (v7)
          v10 = v8 == 0;
        else
          v10 = 1;
        if (v10)
        {

          goto LABEL_19;
        }
        v12 = -[NSSet isEqualToSet:](v7, "isEqualToSet:", v8);

        if (!v12)
          goto LABEL_19;
      }
      if (self->_rollbacksOnly == v5->_rollbacksOnly)
      {
        v11 = self->_limitedCarryOnly == v5->_limitedCarryOnly;
LABEL_20:

        goto LABEL_21;
      }
LABEL_19:
      v11 = 0;
      goto LABEL_20;
    }
    v11 = 0;
  }
LABEL_21:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSDate *startingFetchDateOverride;
  uint64_t v5;
  NSSet *namespaceNames;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TRIFetchMultipleExperimentNotificationsTask;
  v3 = -[TRIBaseTask hash](&v8, sel_hash);
  startingFetchDateOverride = self->_startingFetchDateOverride;
  if (startingFetchDateOverride)
    v5 = -[NSDate hash](startingFetchDateOverride, "hash");
  else
    v5 = 0;
  namespaceNames = self->_namespaceNames;
  if (namespaceNames)
    namespaceNames = (NSSet *)-[NSSet hash](namespaceNames, "hash");
  return self->_limitedCarryOnly + 37 * (self->_rollbacksOnly + 37 * ((_QWORD)namespaceNames + 1369 * v3 + 37 * v5));
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%@>"), objc_opt_class(), self->_startingFetchDateOverride);
}

- (void)_addMetric:(id)a3
{
  TRIFetchMultipleExperimentNotificationsTask *v4;
  NSMutableArray *metrics;
  uint64_t v6;
  NSMutableArray *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  metrics = v4->_metrics;
  if (!metrics)
  {
    v6 = objc_opt_new();
    v7 = v4->_metrics;
    v4->_metrics = (NSMutableArray *)v6;

    metrics = v4->_metrics;
  }
  -[NSMutableArray addObject:](metrics, "addObject:", v8);
  objc_sync_exit(v4);

}

- (void)_addDimension:(id)a3
{
  TRIFetchMultipleExperimentNotificationsTask *v4;
  NSMutableArray *dimensions;
  uint64_t v6;
  NSMutableArray *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  dimensions = v4->_dimensions;
  if (!dimensions)
  {
    v6 = objc_opt_new();
    v7 = v4->_dimensions;
    v4->_dimensions = (NSMutableArray *)v6;

    dimensions = v4->_dimensions;
  }
  -[NSMutableArray addObject:](dimensions, "addObject:", v8);
  objc_sync_exit(v4);

}

- (id)metrics
{
  TRIFetchMultipleExperimentNotificationsTask *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_metrics, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (id)dimensions
{
  TRIFetchMultipleExperimentNotificationsTask *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_dimensions, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (id)trialSystemTelemetry
{
  return +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:](TRITelemetryFactory, "containerOriginTelemetryForTaskAttribution:", self->_taskAttributing);
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[TRITaskAttributing asPersistedTaskAttribution](self->_taskAttributing, "asPersistedTaskAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskAttribution:", v4);

  if (self->_startingFetchDateOverride)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0F50]), "initWithDate:", self->_startingFetchDateOverride);
    objc_msgSend(v3, "setEarliestTimestamp:", v5);

  }
  if (-[NSSet count](self->_namespaceNames, "count"))
  {
    -[NSSet allObjects](self->_namespaceNames, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v3, "setNamespacesArray:", v7);

  }
  objc_msgSend(v3, "setRollbacksOnly:", self->_rollbacksOnly);
  objc_msgSend(v3, "setLimitedCarryOnly:", self->_limitedCarryOnly);
  objc_msgSend(v3, "setRetryCount:", -[TRIFetchMultipleExperimentNotificationsTask retryCount](self, "retryCount"));
  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIFetchMultipleExperimentNotificationsTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchMultipleExperimentNotificationsTask.m"), 694, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  const char *v12;
  void *v13;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_class *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  +[TRIPBMessage parseFromData:error:](TRIFetchExperimentNotificationsPersistedTask, "parseFromData:error:", a3, &v23);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v23;
  if (!v4)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v5;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIFetchExperimentNotificationsPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "hasRollbacksOnly") & 1) == 0)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      v13 = 0;
      goto LABEL_13;
    }
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v11;
    v12 = "Cannot decode message of type %@ with missing field: rollbacksOnly";
LABEL_30:
    _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);

    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "hasTaskAttribution") & 1) == 0)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v11;
    v12 = "Cannot decode message of type %@ with missing field: taskAttribution";
    goto LABEL_30;
  }
  objc_msgSend(v4, "taskAttribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:](TRITaskAttributionInternalInsecure, "taskAttributionFromPersistedTask:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v4, "hasEarliestTimestamp"))
    {
      objc_msgSend(v4, "earliestTimestamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "date");
      v9 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    if (objc_msgSend(v4, "namespacesArray_Count"))
    {
      v15 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v4, "namespacesArray");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithArray:", v16);

    }
    else
    {
      v17 = 0;
    }
    v18 = objc_alloc((Class)a1);
    v19 = objc_msgSend(v4, "rollbacksOnly");
    if (objc_msgSend(v4, "limitedCarryOnly"))
      v20 = objc_msgSend(v4, "limitedCarryOnly");
    else
      v20 = 0;
    v13 = (void *)objc_msgSend(v18, "initWithStartingFetchDateOverride:namespaceNames:taskAttributing:rollbacksOnly:limitedCarryOnly:", v9, v17, v7, v19, v20);
    if (objc_msgSend(v4, "hasRetryCount"))
      v21 = objc_msgSend(v4, "retryCount");
    else
      v21 = 0;
    objc_msgSend(v13, "setRetryCount:", v21);

  }
  else
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    v13 = 0;
  }

LABEL_13:
  return v13;
}

- (unint64_t)requiredCapabilities
{
  unint64_t v3;
  void *v4;

  if (self->_rollbacksOnly)
  {
    v3 = 2;
  }
  else
  {
    -[TRITaskAttributing networkOptions](self->_taskAttributing, "networkOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "requiredCapability");

  }
  if (-[TRIFetchMultipleExperimentNotificationsTask retryCount](self, "retryCount"))
    return v3 | 4;
  else
    return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFetchMultipleExperimentNotificationsTask)initWithCoder:(id)a3
{
  id v4;
  TRIFetchMultipleExperimentNotificationsTask *v5;
  void *v6;
  TRIFetchMultipleExperimentNotificationsTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchMultipleExperimentNotificationsTask;
  v5 = -[TRIFetchMultipleExperimentNotificationsTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIFetchMultipleExperimentNotificationsTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchMultipleExperimentNotificationsTask.m"), 743, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIFetchMultipleExperimentNotificationsTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (int)retryCount
{
  return self->retryCount;
}

- (void)setRetryCount:(int)a3
{
  self->retryCount = a3;
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
  objc_storeStrong((id *)&self->_namespaceNames, 0);
  objc_storeStrong((id *)&self->_taskAttributing, 0);
  objc_storeStrong((id *)&self->_startingFetchDateOverride, 0);
  objc_storeStrong((id *)&self->_nextTasks, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
