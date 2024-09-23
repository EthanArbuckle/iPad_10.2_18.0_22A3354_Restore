@implementation TRIBMLTTargetingTask

- (int)taskType
{
  return 30;
}

- (TRIBMLTTargetingTask)initWithBMLTDeployment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5 triggerEvent:(unint64_t)a6 bmltBatchNotificationIdentifier:(id)a7
{
  id v14;
  id v15;
  id v16;
  TRIBMLTTargetingTask *v17;
  TRIBMLTTaskSupport *v18;
  TRIBMLTTaskSupport *support;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  TRIBMLTTaskSupport *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  objc_super v33;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargetingTask.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltDeployment"));

  }
  if (objc_msgSend(v14, "deploymentId") == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargetingTask.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltDeployment.deploymentId != kTRIUnspecifiedDeploymentId"));

  }
  v33.receiver = self;
  v33.super_class = (Class)TRIBMLTTargetingTask;
  v17 = -[TRIBMLTTargetingTask init](&v33, sel_init);
  if (v17)
  {
    v18 = -[TRIBMLTTaskSupport initWithBMLTDeployment:]([TRIBMLTTaskSupport alloc], "initWithBMLTDeployment:", v14);
    support = v17->_support;
    v17->_support = v18;

    v17->_includeDependencies = a4;
    objc_storeStrong((id *)&v17->_taskAttribution, a5);
    v17->_triggerEvent = a6;
    objc_storeStrong((id *)&v17->_deployment, a3);
    objc_storeStrong((id *)&v17->_bmltBatchNotificationIdentifier, a7);
    v20 = (void *)objc_opt_new();
    objc_msgSend(v14, "backgroundMLTaskId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ensureBMLTFields");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setClientBmltId:", v21);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v14, "deploymentId"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setClientDeploymentId:", v24);

    +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:](TRITelemetryFactory, "containerOriginTelemetryForTaskAttribution:", v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v17->_support;
    v27 = (void *)MEMORY[0x1E0DC0F08];
    -[TRIBMLTTargetingTask _categoricalValueForTriggerEvent:](v17, "_categoricalValueForTriggerEvent:", v17->_triggerEvent);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "metricWithName:categoricalValue:", CFSTR("trigger_event"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIBMLTTaskSupport addMetric:](v26, "addMetric:", v29);

    -[TRIBMLTTaskSupport mergeTelemetry:](v17->_support, "mergeTelemetry:", v20);
    -[TRIBMLTTaskSupport mergeTelemetry:](v17->_support, "mergeTelemetry:", v25);

  }
  return v17;
}

+ (id)taskWithBMLTDeployment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5 triggerEvent:(unint64_t)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  TRIBMLTTargetingTask *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TRIBMLTTargetingTask *v16;

  v7 = a4;
  v9 = a5;
  v10 = a3;
  v11 = [TRIBMLTTargetingTask alloc];
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.triald.BMLTNotification.%@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[TRIBMLTTargetingTask initWithBMLTDeployment:includeDependencies:taskAttribution:triggerEvent:bmltBatchNotificationIdentifier:](v11, "initWithBMLTDeployment:includeDependencies:taskAttribution:triggerEvent:bmltBatchNotificationIdentifier:", v10, v7, v9, a6, v15);

  return v16;
}

+ (id)taskWithBMLTDeployment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5 triggerEvent:(unint64_t)a6 bmltBatchNotificationIdentifier:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  TRIBMLTTargetingTask *v14;

  v9 = a4;
  v11 = a7;
  v12 = a5;
  v13 = a3;
  v14 = -[TRIBMLTTargetingTask initWithBMLTDeployment:includeDependencies:taskAttribution:triggerEvent:bmltBatchNotificationIdentifier:]([TRIBMLTTargetingTask alloc], "initWithBMLTDeployment:includeDependencies:taskAttribution:triggerEvent:bmltBatchNotificationIdentifier:", v13, v9, v12, a6, v11);

  return v14;
}

- (TRIBMLTDeployment)bmltDeployment
{
  return -[TRIBMLTTaskSupport bmltDeployment](self->_support, "bmltDeployment");
}

- (NSArray)tags
{
  return (NSArray *)-[TRIBMLTTaskSupport tags](self->_support, "tags");
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
  -[TRIBMLTTargetingTask bmltDeployment](self, "bmltDeployment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIFetchBMLTNotificationsTask taskWithDeployment:taskAttribution:bmltBatchNotificationIdentifier:](TRIFetchBMLTNotificationsTask, "taskWithDeployment:taskAttribution:bmltBatchNotificationIdentifier:", v3, self->_taskAttribution, self->_bmltBatchNotificationIdentifier);
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
  -[TRIBMLTTargetingTask bmltDeployment](self, "bmltDeployment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIContentTracker contentIdentifierForBMLTArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForBMLTArtifactWithDeployment:", v5);
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
  -[TRIBMLTTargetingTask bmltDeployment](self, "bmltDeployment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIContentTracker contentIdentifierForBMLTArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForBMLTArtifactWithDeployment:", v5);
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
      -[TRIBMLTTargetingTask bmltDeployment](self, "bmltDeployment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDesc");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for BMLT %{public}@", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (id)_taskResultWithStatus:(int)a3 wasEnrolled:(BOOL)a4 reportResults:(BOOL)a5 nextTasks:(id)a6 bmltHistoryDatabase:(id)a7
{
  _BOOL8 v7;
  id v8;

  v7 = a5;
  if (a6)
    v8 = a6;
  else
    v8 = (id)MEMORY[0x1E0C9AA60];
  return +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", *(_QWORD *)&a3, v7, v8, 0, a7);
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v7;
  id v8;
  id v9;
  TRISystemCovariates *v10;
  void *v11;
  uint64_t v12;
  TRIUserCovariates *v13;
  TRIBMLTTargeter *v14;
  void *v15;
  TRIBMLTTargeter *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  TRIBMLTTaskSupport *support;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  BOOL v33;
  id v34;
  void *v35;
  void *v36;
  TRIBMLTTargeter *v37;
  __CFString *v38;
  TRIBMLTTaskSupport *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSString *bmltBatchNotificationIdentifier;
  void *v53;
  uint64_t v54;
  TRIBMLTTargetingTask *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  TRIBMLTTargeter *v68;
  void *v69;
  NSString *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  TRIUserCovariates *v77;
  void *v78;
  void *context;
  char v80;
  unsigned __int8 v81;
  unsigned __int8 v82;
  id v83;
  void *v84;
  void *v85;
  TRIBMLTTargetingTask *v86;
  _BYTE buf[24];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargetingTask.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context != nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargetingTask.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskQueue != nil"));

LABEL_3:
  context = (void *)MEMORY[0x1D8232A5C]();
  v10 = [TRISystemCovariates alloc];
  objc_msgSend(v7, "paths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[TRISystemCovariates initWithPaths:](v10, "initWithPaths:", v11);

  v13 = -[TRIUserCovariates initWithContext:]([TRIUserCovariates alloc], "initWithContext:", v7);
  v14 = [TRIBMLTTargeter alloc];
  objc_msgSend(v7, "bmltDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v13;
  v78 = (void *)v12;
  v16 = -[TRIBMLTTargeter initWithDatabase:systemCovariateProvider:userCovariateProvider:](v14, "initWithDatabase:systemCovariateProvider:userCovariateProvider:", v15, v12, v13);

  v83 = 0;
  objc_msgSend(v7, "bmltDatabase");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIBMLTTargetingTask bmltDeployment](self, "bmltDeployment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "taskRecordWithTaskDeployment:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    TRILogCategory_Server();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[TRIBMLTTargetingTask bmltDeployment](self, "bmltDeployment");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "shortDesc");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v22;
      _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEFAULT, "Warning: unable to find TRIBackgroundMLTaskRecord for deployment %{public}@; issuing incomplete telemetry.",
        buf,
        0xCu);

    }
  }
  v76 = v9;
  *(_QWORD *)buf = 0;
  v82 = 1;
  v81 = 0;
  v80 = 0;
  v23 = (void *)MEMORY[0x1D8232A5C]();
  -[TRIBMLTTargetingTask bmltDeployment](self, "bmltDeployment");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  support = self->_support;
  objc_msgSend(v7, "bmltDatabase");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bmltHistoryDatabase");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[TRIBMLTTargetingTask _targetBMLTDeployment:appendingTelemetryToSupport:backgroundMLTaskDatabase:backgroundMLTaskHistoryDatabase:targeter:reportTelemetryToServer:factorPackSetIdToActivate:wasEnrolled:shouldDisenroll:error:](self, "_targetBMLTDeployment:appendingTelemetryToSupport:backgroundMLTaskDatabase:backgroundMLTaskHistoryDatabase:targeter:reportTelemetryToServer:factorPackSetIdToActivate:wasEnrolled:shouldDisenroll:error:", v24, support, v26, v27, v16, &v82, buf, &v81, &v80, &v83);

  if (v83)
  {
    v74 = v83;
    objc_msgSend(v74, "userInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("logMessage"));
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    v32 = CFSTR("unknown");
    if (v30)
      v32 = (__CFString *)v30;
    v33 = v28;
    v34 = v7;
    v35 = v23;
    v36 = v19;
    v37 = v16;
    v38 = v32;

    v39 = self->_support;
    objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:categoricalValue:", CFSTR("targeting_error"), v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v37;
    v19 = v36;
    v23 = v35;
    v7 = v34;
    v28 = v33;
    -[TRIBMLTTaskSupport addMetric:](v39, "addMetric:", v40);

  }
  objc_autoreleasePoolPop(v23);
  if (!v28)
  {
    bmltBatchNotificationIdentifier = self->_bmltBatchNotificationIdentifier;
    if (bmltBatchNotificationIdentifier)
      notify_post(-[NSString UTF8String](bmltBatchNotificationIdentifier, "UTF8String"));
    objc_msgSend(*(id *)buf, "ident");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIBMLTTargetingTask _allocationTelemetryWithEvent:factorPackSetId:bmltRecord:context:](self, "_allocationTelemetryWithEvent:factorPackSetId:bmltRecord:context:", 2, v53, v19, v7);

    v54 = v81;
    objc_msgSend(v7, "bmltHistoryDatabase");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = self;
    v56 = 3;
    v57 = v54;
    v58 = 1;
LABEL_17:
    -[TRIBMLTTargetingTask _taskResultWithStatus:wasEnrolled:reportResults:nextTasks:bmltHistoryDatabase:](v55, "_taskResultWithStatus:wasEnrolled:reportResults:nextTasks:bmltHistoryDatabase:", v56, v57, v58, 0, v46);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (!v80)
  {
    if (*(_QWORD *)buf)
    {
      -[TRIBMLTTargetingTask bmltDeployment](self, "bmltDeployment");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)buf, "ident");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRIActivateTargetedBMLTDeploymentTask taskWithBMLTDeployment:factorPackSetId:taskAttribution:bmltBatchNotificationIdentifier:](TRIActivateTargetedBMLTDeploymentTask, "taskWithBMLTDeployment:factorPackSetId:taskAttribution:bmltBatchNotificationIdentifier:", v60, v61, self->_taskAttribution, self->_bmltBatchNotificationIdentifier);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "artifact");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "earliestStartDateForActivationIfInFuture");
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "setStartTime:", v75);
      v84 = v46;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)buf, "ident");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIBMLTTargetingTask _allocationTelemetryWithEvent:factorPackSetId:bmltRecord:context:](self, "_allocationTelemetryWithEvent:factorPackSetId:bmltRecord:context:", 3, v64, v19, v7);

      v65 = v81;
      v66 = v82;
      objc_msgSend(v7, "bmltHistoryDatabase");
      v67 = v19;
      v68 = v16;
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIBMLTTargetingTask _taskResultWithStatus:wasEnrolled:reportResults:nextTasks:bmltHistoryDatabase:](self, "_taskResultWithStatus:wasEnrolled:reportResults:nextTasks:bmltHistoryDatabase:", 2, v65, v66, v63, v69);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v68;
      v19 = v67;

      goto LABEL_18;
    }
    v70 = self->_bmltBatchNotificationIdentifier;
    if (v70)
      notify_post(-[NSString UTF8String](v70, "UTF8String"));
    v71 = v81;
    objc_msgSend(v7, "bmltHistoryDatabase");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = self;
    v56 = 2;
    v57 = v71;
    v58 = 0;
    goto LABEL_17;
  }
  -[TRIBMLTTargetingTask bmltDeployment](self, "bmltDeployment");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "backgroundMLTaskId");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "cancelTasksWithTag:excludingTasks:", v42, v43);

  -[TRIBMLTTargetingTask bmltDeployment](self, "bmltDeployment");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIDeactivateBMLTDeploymentTask taskWithBMLTDeployment:triggerEvent:bmltBatchNotificationIdentifier:](TRIDeactivateBMLTDeploymentTask, "taskWithBMLTDeployment:triggerEvent:bmltBatchNotificationIdentifier:", v44, 2, self->_bmltBatchNotificationIdentifier);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)buf, "ident");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIBMLTTargetingTask _allocationTelemetryWithEvent:factorPackSetId:bmltRecord:context:](self, "_allocationTelemetryWithEvent:factorPackSetId:bmltRecord:context:", 3, v47, v19, v7);

  v48 = v81;
  v49 = v82;
  objc_msgSend(v7, "bmltHistoryDatabase");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIBMLTTargetingTask _taskResultWithStatus:wasEnrolled:reportResults:nextTasks:bmltHistoryDatabase:](self, "_taskResultWithStatus:wasEnrolled:reportResults:nextTasks:bmltHistoryDatabase:", 2, v48, v49, v46, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  objc_autoreleasePoolPop(context);

  return v51;
}

- (BOOL)_targetBMLTDeployment:(id)a3 appendingTelemetryToSupport:(id)a4 backgroundMLTaskDatabase:(id)a5 backgroundMLTaskHistoryDatabase:(id)a6 targeter:(id)a7 reportTelemetryToServer:(BOOL *)a8 factorPackSetIdToActivate:(id *)a9 wasEnrolled:(BOOL *)a10 shouldDisenroll:(BOOL *)a11 error:(id *)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  TRIBMLTTargetingTask *v26;
  void *v27;
  uint64_t v28;
  char v29;
  BOOL v30;
  __CFString *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  id v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  NSObject *v48;
  __CFString *v49;
  __CFString *v50;
  const char *v51;
  NSObject *v52;
  uint32_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  NSObject *v58;
  _BOOL4 v59;
  void *v60;
  const char *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  _BOOL4 v66;
  __CFString *v67;
  const char *v68;
  const __CFString *v69;
  void *v70;
  void *v71;
  char v72;
  __CFString *v73;
  char v74;
  void *v75;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  __CFString *v93;
  uint8_t buf[4];
  const __CFString *v95;
  __int16 v96;
  __CFString *v97;
  __int16 v98;
  __CFString *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  if (v18)
  {
    if (v19)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargetingTask.m"), 295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment != nil"));

    if (v19)
    {
LABEL_3:
      if (v20)
        goto LABEL_4;
LABEL_73:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargetingTask.m"), 297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltDatabase != nil"));

      if (v21)
        goto LABEL_5;
      goto LABEL_74;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargetingTask.m"), 296, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("support != nil"));

  if (!v20)
    goto LABEL_73;
LABEL_4:
  if (v21)
    goto LABEL_5;
LABEL_74:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargetingTask.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltHistoryDatabase != nil"));

LABEL_5:
  v92 = v21;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargetingTask.m"), 299, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targeter != nil"));

  }
  if (!a8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargetingTask.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reportTelemetryToServer != nil"));

  }
  *a8 = 1;
  if (!a9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargetingTask.m"), 302, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetIdToActivate != nil"));

  }
  v23 = *a9;
  *a9 = 0;

  if (!a10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargetingTask.m"), 304, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("wasEnrolled != NULL"));

  }
  *a10 = 0;
  if (!a11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargetingTask.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shouldDisenroll != NULL"));

  }
  *a11 = 0;
  if (!a12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargetingTask.m"), 308, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

  }
  objc_msgSend(v20, "taskRecordWithTaskDeployment:", v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (!v24)
  {
    +[TRIBMLTTargeter targetingErrorWithDeployment:errorType:](TRIBMLTTargeter, "targetingErrorWithDeployment:errorType:", v18, CFSTR("BMLT artifact not found"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *a12;
    *a12 = v34;

    v30 = 0;
    goto LABEL_70;
  }
  v90 = v20;
  v26 = self;
  objc_msgSend(v24, "artifact");
  v91 = v22;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "backgroundTask");
  v28 = objc_claimAutoreleasedReturnValue();

  v22 = v91;
  v93 = 0;
  v89 = (void *)v28;
  v29 = objc_msgSend(v91, "targetBMLT:factorPackSetId:error:", v28, &v93, a12);
  v30 = 0;
  switch(v29)
  {
    case 0:
      goto LABEL_69;
    case 1:
      *a10 = 1;
      v31 = v93;
      if (!v93)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "handleFailureInMethod:object:file:lineNumber:description:", a2, v26, CFSTR("TRIBMLTTargetingTask.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assignedFactorPackSetId"));

        v31 = v93;
      }
      -[__CFString ident](v31, "ident");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "isEqualToString:", CFSTR("empty-fp-set")))
      {
        v33 = CFSTR("empty");
      }
      else
      {
        -[__CFString ident](v93, "ident");
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v40 = v33;

      v41 = (void *)objc_opt_new();
      objc_msgSend(v41, "ensureBMLTFields");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setClientBmltFactorPackSetId:", v40);

      if ((-[__CFString targetingRuleIndex](v93, "targetingRuleIndex") & 0x80000000) == 0)
      {
        v43 = -[__CFString targetingRuleIndex](v93, "targetingRuleIndex");
        objc_msgSend(v41, "ensureBMLTFields");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setClientBmltTargetingRuleGroupOrdinal:", v43);

      }
      objc_msgSend(v19, "mergeTelemetry:", v41);

      v22 = v91;
      goto LABEL_32;
    case 2:
      v36 = v93;
      v93 = 0;

      if (objc_msgSend(v25, "status") == 1)
        *a11 = 1;
      *a8 = 0;
      v37 = (void *)objc_opt_new();
      objc_msgSend(v37, "ensureBMLTFields");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setClientBmltFactorPackSetId:", CFSTR("no-op"));

      objc_msgSend(v19, "mergeTelemetry:", v37);
      goto LABEL_65;
    case 3:
      v30 = 1;
      *a11 = 1;
      v37 = (void *)objc_opt_new();
      objc_msgSend(v37, "ensureBMLTFields");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setClientBmltFactorPackSetId:", CFSTR("disenroll"));

      objc_msgSend(v19, "mergeTelemetry:", v37);
      goto LABEL_68;
    default:
LABEL_32:
      objc_msgSend(v25, "activeFactorPackSetId");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
      {

LABEL_35:
        v47 = CFSTR("(Retargeting) ");
        goto LABEL_36;
      }
      objc_msgSend(v25, "targetedFactorPackSetId");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
        goto LABEL_35;
      v47 = &stru_1E9336E60;
LABEL_36:
      if (v93)
      {
        TRILogCategory_Server();
        v48 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          goto LABEL_42;
        v49 = v93;
        objc_msgSend(v18, "shortDesc");
        v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v95 = v47;
        v96 = 2114;
        v97 = v49;
        v22 = v91;
        v98 = 2114;
        v99 = v50;
        v51 = "%{public}@Enrolling in factor pack set id %{public}@ for BMLT %{public}@";
        v52 = v48;
        v53 = 32;
      }
      else
      {
        *a8 = 0;
        TRILogCategory_Server();
        v48 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          goto LABEL_42;
        objc_msgSend(v18, "shortDesc");
        v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v95 = v47;
        v96 = 2114;
        v97 = v50;
        v51 = "%{public}@Targeting resulted in the default treatment (non-enrollment) for BMLT %{public}@";
        v52 = v48;
        v53 = 22;
      }
      _os_log_impl(&dword_1D207F000, v52, OS_LOG_TYPE_DEFAULT, v51, buf, v53);

LABEL_42:
      if (!v93)
      {
        v30 = 1;
        goto LABEL_69;
      }
      objc_msgSend(v25, "targetedFactorPackSetId");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (v54)
      {
        -[__CFString ident](v93, "ident");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "targetedFactorPackSetId");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v55, "isEqualToString:", v56);

        TRILogCategory_Server();
        v58 = objc_claimAutoreleasedReturnValue();
        v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
        v60 = v90;
        if (v57)
        {
          if (v59)
          {
            *(_WORD *)buf = 0;
            v61 = "Retargeting resulted in no change to the targetedFactorPackSetId.";
LABEL_52:
            _os_log_impl(&dword_1D207F000, v58, OS_LOG_TYPE_DEFAULT, v61, buf, 2u);
            goto LABEL_53;
          }
          goto LABEL_53;
        }
        if (v59)
        {
          objc_msgSend(v25, "targetedFactorPackSetId");
          v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v95 = v67;
          v96 = 2114;
          v97 = v93;
          v68 = "Retargeting resulted in targetedFactorPackSetId change: %{public}@ --> %{public}@";
LABEL_59:
          _os_log_impl(&dword_1D207F000, v58, OS_LOG_TYPE_DEFAULT, v68, buf, 0x16u);

        }
      }
      else
      {
        objc_msgSend(v25, "activeFactorPackSetId");
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        v60 = v90;
        if (!v62)
          goto LABEL_62;
        -[__CFString ident](v93, "ident");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "activeFactorPackSetId");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v63, "isEqualToString:", v64);

        TRILogCategory_Server();
        v58 = objc_claimAutoreleasedReturnValue();
        v66 = os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
        if (v65)
        {
          if (v66)
          {
            *(_WORD *)buf = 0;
            v61 = "Retargeting resulted in no change to the activeFactorPackSetId. Still attempting activation";
            goto LABEL_52;
          }
LABEL_53:

          *a8 = 0;
          goto LABEL_61;
        }
        if (v66)
        {
          v69 = v93;
          objc_msgSend(v25, "activeFactorPackSetId");
          v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v95 = v69;
          v96 = 2114;
          v97 = v67;
          v68 = "Retargeting result: targeted %{public}@, previously active: %{public}@";
          goto LABEL_59;
        }
      }

LABEL_61:
      v22 = v91;
LABEL_62:
      -[__CFString ident](v93, "ident");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[__CFString targetingRuleIndex](v93, "targetingRuleIndex") & 0x80000000) != 0)
      {
        v74 = objc_msgSend(v60, "targetTaskDeployment:toFactorPackSetId:targetingRuleIndex:usingTransaction:", v18, v70, 0, 0);

        if ((v74 & 1) != 0)
          goto LABEL_64;
LABEL_67:
        +[TRIBMLTTargeter targetingErrorWithDeployment:errorType:](TRIBMLTTargeter, "targetingErrorWithDeployment:errorType:", v18, CFSTR("failed update database"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        v37 = *a12;
        *a12 = v75;
        goto LABEL_68;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[__CFString targetingRuleIndex](v93, "targetingRuleIndex"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v60, "targetTaskDeployment:toFactorPackSetId:targetingRuleIndex:usingTransaction:", v18, v70, v71, 0);

      if ((v72 & 1) == 0)
        goto LABEL_67;
LABEL_64:
      v73 = v93;
      v37 = *a9;
      *a9 = v73;
LABEL_65:
      v30 = 1;
LABEL_68:

LABEL_69:
      v20 = v90;
LABEL_70:

      return v30;
  }
}

- (id)_categoricalValueForTriggerEvent:(unint64_t)a3
{
  if (a3)
    return CFSTR("bmlt-retargeting");
  else
    return CFSTR("bmlt-routine-fetch");
}

- (void)_allocationTelemetryWithEvent:(unsigned __int8)a3 factorPackSetId:(id)a4 bmltRecord:(id)a5 context:(id)a6
{
  uint64_t v8;
  TRIBMLTDeployment *deployment;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v8 = a3;
  deployment = self->_deployment;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  -[TRIBMLTDeployment backgroundMLTaskId](deployment, "backgroundMLTaskId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRILighthouseBitacoraHandler emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:", v14, -[TRIBMLTDeployment deploymentId](self->_deployment, "deploymentId"), 0, (_DWORD)v8 == 3);

  -[TRIBMLTDeployment backgroundMLTaskId](self->_deployment, "backgroundMLTaskId");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  +[TRITaskUtils updateBMLTHistoryDatabaseWithAllocationStatus:forBMLT:deployment:fps:bmltRecord:context:](TRITaskUtils, "updateBMLTHistoryDatabaseWithAllocationStatus:forBMLT:deployment:fps:bmltRecord:context:", v8, v15, -[TRIBMLTDeployment deploymentId](self->_deployment, "deploymentId"), v13, v12, v11);

}

- (id)metrics
{
  return -[TRIBMLTTaskSupport metrics](self->_support, "metrics");
}

- (id)dimensions
{
  return -[TRIBMLTTaskSupport dimensions](self->_support, "dimensions");
}

- (id)trialSystemTelemetry
{
  return -[TRIBMLTTaskSupport trialSystemTelemetry](self->_support, "trialSystemTelemetry");
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t triggerEvent;
  uint64_t v9;

  v3 = (void *)objc_opt_new();
  -[TRIBMLTTargetingTask bmltDeployment](self, "bmltDeployment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundMLTaskId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundMlTaskId:", v5);

  -[TRIBMLTTargetingTask bmltDeployment](self, "bmltDeployment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeploymentId:", objc_msgSend(v6, "deploymentId"));

  objc_msgSend(v3, "setIncludeDependencies:", self->_includeDependencies);
  -[TRITaskAttributing asPersistedTaskAttribution](self->_taskAttribution, "asPersistedTaskAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskAttribution:", v7);

  triggerEvent = self->_triggerEvent;
  if (triggerEvent)
  {
    if (triggerEvent != 1)
      goto LABEL_6;
    v9 = 2;
  }
  else
  {
    v9 = 1;
  }
  objc_msgSend(v3, "setTriggerEvent:", v9);
LABEL_6:
  if (self->_bmltBatchNotificationIdentifier)
    objc_msgSend(v3, "setBmltBatchNotificationId:");
  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIBMLTTargetingTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargetingTask.m"), 511, CFSTR("Unexpected failure to serialize %@"), v9);

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
  _BOOL8 v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  const char *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  void *v18;
  objc_class *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  +[TRIPBMessage parseFromData:error:](TRIBMLTTargetingPersistedTask, "parseFromData:error:", a3, &v28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v28;
  if (!v3)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v4;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIBMLTTargetingPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_25;
  }
  if ((objc_msgSend(v3, "hasBackgroundMlTaskId") & 1) == 0)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v21;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: backgroundMlTaskId", buf, 0xCu);

    }
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v12;
    v13 = "Cannot decode message of type %@ with missing field: backgroundMlTaskId";
    goto LABEL_24;
  }
  objc_msgSend(v3, "backgroundMlTaskId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v12;
    v13 = "Cannot decode message of type %@ with field of length 0: backgroundMlTaskId";
LABEL_24:
    _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);

    goto LABEL_25;
  }
  if ((objc_msgSend(v3, "hasDeploymentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v12;
    v13 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_24;
  }
  if ((objc_msgSend(v3, "hasIncludeDependencies") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v12;
    v13 = "Cannot decode message of type %@ with missing field: includeDependencies";
    goto LABEL_24;
  }
  if ((objc_msgSend(v3, "hasTaskAttribution") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v12;
      v13 = "Cannot decode message of type %@ with missing field: taskAttribution";
      goto LABEL_24;
    }
LABEL_25:
    v18 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v3, "taskAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:](TRITaskAttributionInternalInsecure, "taskAttributionFromPersistedTask:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v3, "hasTriggerEvent"))
      v9 = objc_msgSend(v3, "triggerEvent") == 2;
    else
      v9 = 0;
    v23 = objc_alloc(MEMORY[0x1E0DC09A8]);
    objc_msgSend(v3, "backgroundMlTaskId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v23, "initWithBackgroundMLTaskId:deploymentId:", v24, objc_msgSend(v3, "deploymentId"));

    v25 = (void *)objc_opt_class();
    v26 = objc_msgSend(v3, "includeDependencies");
    if ((objc_msgSend(v3, "hasBmltBatchNotificationId") & 1) != 0)
    {
      objc_msgSend(v3, "bmltBatchNotificationId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "taskWithBMLTDeployment:includeDependencies:taskAttribution:triggerEvent:bmltBatchNotificationIdentifier:", v22, v26, v8, v9, v27);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v25, "taskWithBMLTDeployment:includeDependencies:taskAttribution:triggerEvent:bmltBatchNotificationIdentifier:", v22, v26, v8, v9, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    TRILogCategory_Server();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    v18 = 0;
  }

LABEL_26:
  return v18;
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
  v10.super_class = (Class)TRIBMLTTargetingTask;
  if (-[TRIBaseTask isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    -[TRIBMLTTargetingTask bmltDeployment](self, "bmltDeployment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bmltDeployment");
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
  v7.super_class = (Class)TRIBMLTTargetingTask;
  v3 = -[TRIBaseTask hash](&v7, sel_hash);
  -[TRIBMLTTargetingTask bmltDeployment](self, "bmltDeployment");
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
  -[TRIBMLTTargetingTask bmltDeployment](self, "bmltDeployment");
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

- (TRIBMLTTargetingTask)initWithCoder:(id)a3
{
  id v4;
  TRIBMLTTargetingTask *v5;
  void *v6;
  TRIBMLTTargetingTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIBMLTTargetingTask;
  v5 = -[TRIBMLTTargetingTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIBMLTTargetingTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargetingTask.m"), 586, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIBMLTTargetingTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bmltBatchNotificationIdentifier, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
  objc_storeStrong((id *)&self->_taskAttribution, 0);
  objc_storeStrong((id *)&self->_support, 0);
}

@end
