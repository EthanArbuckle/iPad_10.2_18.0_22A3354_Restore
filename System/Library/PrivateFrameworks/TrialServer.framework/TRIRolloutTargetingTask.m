@implementation TRIRolloutTargetingTask

- (int)taskType
{
  return 22;
}

- (TRIRolloutTargetingTask)initWithRolloutDeployment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5 triggerEvent:(unint64_t)a6
{
  id v11;
  id v12;
  TRIRolloutTargetingTask *v13;
  TRIRolloutTaskSupport *v14;
  TRIRolloutTaskSupport *support;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  TRIRolloutTaskSupport *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  objc_super v29;

  v11 = a3;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutTargetingTask.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rolloutDeployment"));

  }
  if (objc_msgSend(v11, "deploymentId") == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutTargetingTask.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rolloutDeployment.deploymentId != kTRIUnspecifiedDeploymentId"));

  }
  v29.receiver = self;
  v29.super_class = (Class)TRIRolloutTargetingTask;
  v13 = -[TRIRolloutTargetingTask init](&v29, sel_init);
  if (v13)
  {
    v14 = -[TRIRolloutTaskSupport initWithRolloutDeployment:]([TRIRolloutTaskSupport alloc], "initWithRolloutDeployment:", v11);
    support = v13->_support;
    v13->_support = v14;

    v13->_includeDependencies = a4;
    objc_storeStrong((id *)&v13->_taskAttribution, a5);
    v13->_triggerEvent = a6;
    v16 = (void *)objc_opt_new();
    objc_msgSend(v11, "rolloutId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ensureRolloutFields");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setClientRolloutId:", v17);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "deploymentId"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClientDeploymentId:", v20);

    +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:](TRITelemetryFactory, "containerOriginTelemetryForTaskAttribution:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v13->_support;
    v23 = (void *)MEMORY[0x1E0DC0F08];
    -[TRIRolloutTargetingTask _categoricalValueForTriggerEvent:](v13, "_categoricalValueForTriggerEvent:", v13->_triggerEvent);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "metricWithName:categoricalValue:", CFSTR("trigger_event"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIRolloutTaskSupport addMetric:](v22, "addMetric:", v25);

    -[TRIRolloutTaskSupport mergeTelemetry:](v13->_support, "mergeTelemetry:", v16);
    -[TRIRolloutTaskSupport mergeTelemetry:](v13->_support, "mergeTelemetry:", v21);

  }
  return v13;
}

+ (id)taskWithRolloutDeployment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5 triggerEvent:(unint64_t)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  TRIRolloutTargetingTask *v11;

  v7 = a4;
  v9 = a5;
  v10 = a3;
  v11 = -[TRIRolloutTargetingTask initWithRolloutDeployment:includeDependencies:taskAttribution:triggerEvent:]([TRIRolloutTargetingTask alloc], "initWithRolloutDeployment:includeDependencies:taskAttribution:triggerEvent:", v10, v7, v9, a6);

  return v11;
}

- (TRIRolloutDeployment)rolloutDeployment
{
  return -[TRIRolloutTaskSupport rolloutDeployment](self->_support, "rolloutDeployment");
}

- (NSArray)tags
{
  return (NSArray *)-[TRIRolloutTaskSupport tags](self->_support, "tags");
}

- (NSArray)dependencies
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!self->_includeDependencies)
    return (NSArray *)0;
  -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIFetchSingleRolloutNotificationTask taskWithDeployment:taskAttributing:](TRIFetchSingleRolloutNotificationTask, "taskWithDeployment:taskAttributing:", v3, self->_taskAttribution);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)runEnqueueHandlerUsingContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIContentTracker contentIdentifierForRolloutArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForRolloutArtifactWithDeployment:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addRefWithContentIdentifier:", v7);
}

- (void)runDequeueHandlerUsingContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIContentTracker contentIdentifierForRolloutArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForRolloutArtifactWithDeployment:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentTracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v7, "dropRefWithContentIdentifier:", v6);
  if ((v4 & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDesc");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for rollout %{public}@", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (id)_systemCovariatesWithPaths:(id)a3
{
  id v3;
  TRISystemCovariates *v4;

  v3 = a3;
  v4 = -[TRISystemCovariates initWithPaths:]([TRISystemCovariates alloc], "initWithPaths:", v3);

  return v4;
}

- (id)_runTaskUsingContext:(id)a3 withTaskQueue:(id)a4 rolloutTargeter:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  TRIRolloutTargetingOperation *v24;
  void *v25;
  TRIRolloutTargetingOperation *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[4];
  id v73;
  __int128 *p_buf;
  char v75;
  unsigned __int8 v76;
  id v77;
  void *v78;
  __int128 buf;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  TRIRolloutTargetingTask *v84;
  void *v85;
  _QWORD v86[3];

  v86[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutTargetingTask.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context != nil"));

  }
  v71 = v12;
  if (v12)
  {
    if (v13)
      goto LABEL_5;
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutTargetingTask.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targeter != nil"));

    if (a6)
      goto LABEL_6;
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutTargetingTask.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskQueue != nil"));

  if (!v13)
    goto LABEL_28;
LABEL_5:
  if (a6)
    goto LABEL_6;
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutTargetingTask.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

LABEL_6:
  objc_msgSend(v11, "rolloutDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "recordWithDeployment:usingTransaction:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "rampId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)objc_opt_new();
      objc_msgSend(v16, "rampId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ensureRolloutFields");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setClientRampId:", v19);

      -[TRIRolloutTaskSupport mergeTelemetry:](self->_support, "mergeTelemetry:", v18);
    }
  }
  else
  {
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "shortDesc");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v23;
      _os_log_impl(&dword_1D207F000, v21, OS_LOG_TYPE_DEFAULT, "Warning: unable to find TRIRolloutRecord for deployment %{public}@; issuing incomplete telemetry.",
        (uint8_t *)&buf,
        0xCu);

    }
  }
  v77 = 0;
  v76 = 1;
  v75 = 0;
  v24 = [TRIRolloutTargetingOperation alloc];
  objc_msgSend(v11, "rolloutDatabase");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[TRIRolloutTargetingOperation initWithRolloutTargeter:rolloutDatabase:context:](v24, "initWithRolloutTargeter:rolloutDatabase:context:", v13, v25, v11);

  -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[TRIRolloutTargetingOperation targetRolloutDeployment:appendingTelemetryToSupport:reportTelemetryToServer:factorPackSetIdToActivate:shouldDisenroll:error:](v26, "targetRolloutDeployment:appendingTelemetryToSupport:reportTelemetryToServer:factorPackSetIdToActivate:shouldDisenroll:error:", v27, self->_support, &v76, &v77, &v75, a6);

  if (!v28)
  {
    -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "rolloutId");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rampId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "deploymentId");
    LOBYTE(v68) = 0;
    +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 5, v38, v39, v41, v77, 0, 0, v16, v68, v11);

    -[TRIRolloutTargetingTask _taskResultWithStatus:reportResults:nextTasks:](self, "_taskResultWithStatus:reportResults:nextTasks:", 3, 1, 0);
    v42 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v36 = (void *)v42;
    goto LABEL_17;
  }
  if (v75)
  {
    -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "rolloutId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "cancelTasksWithTag:excludingTasks:", v30, v31);

    -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "rolloutId");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIDisenrollRolloutTask taskWithRolloutId:triggerEvent:](TRIDisenrollRolloutTask, "taskWithRolloutId:triggerEvent:", v33, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[TRIRolloutTargetingTask _taskResultWithStatus:reportResults:nextTasks:](self, "_taskResultWithStatus:reportResults:nextTasks:", 2, v76, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  if (!v77)
  {
    -[TRIRolloutTargetingTask _taskResultWithStatus:reportResults:nextTasks:](self, "_taskResultWithStatus:reportResults:nextTasks:", 2, 0, 0);
    v42 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (self->_triggerEvent != 2)
  {
    -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "rolloutId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "cancelTasksWithTag:excludingTasks:", v45, v46);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__52;
  v82 = __Block_byref_object_dispose__52;
  v83 = (id)objc_opt_new();
  -[TRITaskAttributing networkOptions](self->_taskAttribution, "networkOptions");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "allowsCellularAccess");

  if (v48)
  {
    v49 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v11, "rolloutDatabase");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "recordWithDeployment:usingTransaction:", v51, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v52, "artifact");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "rollout");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v54, "selectedNamespaceArray");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __84__TRIRolloutTargetingTask__runTaskUsingContext_withTaskQueue_rolloutTargeter_error___block_invoke;
      v72[3] = &unk_1E9336300;
      v73 = v11;
      p_buf = &buf;
      objc_msgSend(v55, "enumerateObjectsUsingBlock:", v72);

    }
    objc_autoreleasePoolPop(v49);
  }
  -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "ident");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIActivateTargetedRolloutDeploymentTask taskWithDeployment:factorPackSetId:taskAttribution:capabilityModifier:](TRIActivateTargetedRolloutDeploymentTask, "taskWithDeployment:factorPackSetId:taskAttribution:capabilityModifier:", v56, v57, self->_taskAttribution, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "rolloutId");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rampId");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "deploymentId");
  objc_msgSend(v77, "ident");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v68) = 0;
  +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 1, v59, v60, v62, v63, 0, 0, v16, v68, v11);

  -[TRIRolloutTargetingTask _taskResultWithStatus:reportResults:nextTasks:](self, "_taskResultWithStatus:reportResults:nextTasks:", 2, v76, v69);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&buf, 8);
LABEL_17:

  return v36;
}

void __84__TRIRolloutTargetingTask__runTaskUsingContext_withTaskQueue_rolloutTargeter_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  TRITaskCapabilityModifier *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = (void *)MEMORY[0x1E0DC0AD8];
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "paths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "namespaceDescriptorsDefaultDir");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadWithNamespaceName:fromDirectory:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "expensiveNetworkingAllowed") & 1) == 0)
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v13;
      _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "Changing TRIFetchFactorPackSetTask to require inexpensive networking since %@ does not support expensive networking", (uint8_t *)&v17, 0xCu);

    }
    v14 = -[TRITaskCapabilityModifier initWithAdd:remove:]([TRITaskCapabilityModifier alloc], "initWithAdd:remove:", 1, 2);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    *a4 = 1;
  }

}

- (id)_taskResultWithStatus:(int)a3 reportResults:(BOOL)a4 nextTasks:(id)a5
{
  if (!a5)
    a5 = (id)MEMORY[0x1E0C9AA60];
  return +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", *(_QWORD *)&a3, a4, a5, 0);
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  TRIUserCovariates *v11;
  TRIRolloutTargeter *v12;
  void *v13;
  TRIRolloutTargeter *v14;
  void *v15;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v6, "paths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIRolloutTargetingTask _systemCovariatesWithPaths:](self, "_systemCovariatesWithPaths:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[TRIUserCovariates initWithContext:]([TRIUserCovariates alloc], "initWithContext:", v6);
  v12 = [TRIRolloutTargeter alloc];
  objc_msgSend(v6, "rolloutDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[TRIRolloutTargeter initWithDatabase:systemCovariateProvider:userCovariateProvider:](v12, "initWithDatabase:systemCovariateProvider:userCovariateProvider:", v13, v10, v11);

  v17 = 0;
  -[TRIRolloutTargetingTask _runTaskUsingContext:withTaskQueue:rolloutTargeter:error:](self, "_runTaskUsingContext:withTaskQueue:rolloutTargeter:error:", v6, v7, v14, &v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  return v15;
}

- (id)_categoricalValueForTriggerEvent:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("hotfix");
  else
    return CFSTR("routine-fetch");
}

- (id)metrics
{
  return -[TRIRolloutTaskSupport metrics](self->_support, "metrics");
}

- (id)dimensions
{
  return -[TRIRolloutTaskSupport dimensions](self->_support, "dimensions");
}

- (id)trialSystemTelemetry
{
  return -[TRIRolloutTaskSupport trialSystemTelemetry](self->_support, "trialSystemTelemetry");
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t triggerEvent;

  v3 = (void *)objc_opt_new();
  -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rolloutId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRolloutId:", v5);

  -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeploymentId:", objc_msgSend(v6, "deploymentId"));

  objc_msgSend(v3, "setIncludeDependencies:", self->_includeDependencies);
  -[TRITaskAttributing asPersistedTaskAttribution](self->_taskAttribution, "asPersistedTaskAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskAttribution:", v7);

  triggerEvent = self->_triggerEvent;
  if (triggerEvent <= 2)
    objc_msgSend(v3, "setTriggerEvent:", (triggerEvent + 1));
  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIRolloutTargetingTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutTargetingTask.m"), 311, CFSTR("Unexpected failure to serialize %@"), v9);

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
  int v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  const char *v14;
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  void *v19;
  objc_class *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  +[TRIPBMessage parseFromData:error:](TRIRolloutTargetingPersistedTask, "parseFromData:error:", a3, &v26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v26;
  if (!v3)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v4;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIRolloutTargetingPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_27;
  }
  if ((objc_msgSend(v3, "hasRolloutId") & 1) == 0)
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v22;
      _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: rolloutId", buf, 0xCu);

    }
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v13;
    v14 = "Cannot decode message of type %@ with missing field: rolloutId";
    goto LABEL_26;
  }
  objc_msgSend(v3, "rolloutId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v13;
    v14 = "Cannot decode message of type %@ with field of length 0: rolloutId";
LABEL_26:
    _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);

    goto LABEL_27;
  }
  if ((objc_msgSend(v3, "hasDeploymentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v13;
    v14 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_26;
  }
  if ((objc_msgSend(v3, "hasIncludeDependencies") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v13;
    v14 = "Cannot decode message of type %@ with missing field: includeDependencies";
    goto LABEL_26;
  }
  if ((objc_msgSend(v3, "hasTaskAttribution") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v13;
      v14 = "Cannot decode message of type %@ with missing field: taskAttribution";
      goto LABEL_26;
    }
LABEL_27:
    v19 = 0;
    goto LABEL_28;
  }
  objc_msgSend(v3, "taskAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:](TRITaskAttributionInternalInsecure, "taskAttributionFromPersistedTask:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v3, "hasTriggerEvent"))
    {
      v9 = objc_msgSend(v3, "triggerEvent");
      if (v9 == 3)
        v10 = 2;
      else
        v10 = v9 == 2;
    }
    else
    {
      v10 = 0;
    }
    v24 = objc_alloc(MEMORY[0x1E0DC0B60]);
    objc_msgSend(v3, "rolloutId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v24, "initWithRolloutId:deploymentId:", v25, objc_msgSend(v3, "deploymentId"));

    objc_msgSend((id)objc_opt_class(), "taskWithRolloutDeployment:includeDependencies:taskAttribution:triggerEvent:", v23, objc_msgSend(v3, "includeDependencies"), v8, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    TRILogCategory_Server();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    v19 = 0;
  }

LABEL_28:
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TRIRolloutTargetingTask;
  if (-[TRIBaseTask isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rolloutDeployment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToDeployment:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TRIRolloutTargetingTask;
  v3 = -[TRIBaseTask hash](&v7, sel_hash);
  -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") + 37 * v3;

  return v5;
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[TRIRolloutTargetingTask rolloutDeployment](self, "rolloutDeployment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortDesc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%@>"), v4, v6);

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIRolloutTargetingTask)initWithCoder:(id)a3
{
  id v4;
  TRIRolloutTargetingTask *v5;
  void *v6;
  TRIRolloutTargetingTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIRolloutTargetingTask;
  v5 = -[TRIRolloutTargetingTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIRolloutTargetingTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutTargetingTask.m"), 388, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIRolloutTargetingTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskAttribution, 0);
  objc_storeStrong((id *)&self->_support, 0);
}

@end
