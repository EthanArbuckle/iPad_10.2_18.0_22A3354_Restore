@implementation TRIMaintenanceTask

+ (id)task
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setRetryCount:", 0);
  return v2;
}

- (TRIMaintenanceTask)init
{
  TRIMaintenanceTask *v2;
  objc_class *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *channelCleanupQueue;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _PASLock *lock;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TRIMaintenanceTask;
  v2 = -[TRIMaintenanceTask init](&v16, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(v5, v6);
    channelCleanupQueue = v2->_channelCleanupQueue;
    v2->_channelCleanupQueue = (OS_dispatch_queue *)v7;

    v9 = (_QWORD *)objc_opt_new();
    v10 = (void *)v9[1];
    v9[1] = 0;

    v11 = (void *)v9[2];
    v9[2] = 0;

    v12 = (void *)v9[3];
    v9[3] = 0;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v9);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v13;

    v2->_isFlatbufferReadEnabled = _os_feature_enabled_impl();
    v2->_isFlatbufferWriteEnabled = _os_feature_enabled_impl();
    v2->_isFlatbufferTreatmentReadEnabled = _os_feature_enabled_impl();
    v2->_isFlatbufferTreatmentWriteEnabled = _os_feature_enabled_impl();

  }
  return v2;
}

- (int)taskType
{
  return 7;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t (**v10)(void);
  int v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  void *v15;
  uint64_t (**v16)(void);
  int v17;
  void *v18;
  uint64_t (**v19)(void);
  int v20;
  void *v21;
  void *v22;
  uint64_t (**v23)(void);
  int v24;
  _BOOL4 v25;
  void *v26;
  _BOOL4 v27;
  uint64_t (**v28)(void);
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t (**v36)(void);
  _BOOL4 v37;
  void *v38;
  void *v39;
  int v40;
  NSObject *v41;
  uint64_t (**v42)(void);
  int v43;
  void *v44;
  void *v45;
  int v46;
  NSObject *v47;
  uint64_t (**v48)(void);
  int v49;
  void *v50;
  void *v51;
  int v52;
  NSObject *v53;
  uint64_t (**v54)(void);
  int v55;
  void *v56;
  void *v57;
  int v58;
  NSObject *v59;
  uint64_t (**v60)(void);
  int v61;
  __objc2_class **v62;
  void *v63;
  void *v64;
  uint64_t (**v65)(void);
  int v66;
  id v67;
  TRIActiveExperimentsMetricRecorder *v69;
  uint64_t v70;
  _BOOL4 v71;
  uint64_t v72;
  uint8_t buf[4];
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  -[TRIBaseTask stateProvider](self, "stateProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeActivityDescriptorGrantingCapability:", 24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 1, 1, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v8, "shouldDefer");
    v10 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v11 = v10[2]();

    if (v11)
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Deferral requested before any maintenance task.";
LABEL_61:
        _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
        goto LABEL_62;
      }
      goto LABEL_62;
    }
    objc_msgSend(v5, "experimentDatabase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIMaintenanceTask _handleExpiredExperimentsWithExperimentDatabase:nextTasks:](self, "_handleExpiredExperimentsWithExperimentDatabase:nextTasks:", v15, v6);

    objc_msgSend(v8, "shouldDefer");
    v16 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v17 = v16[2]();

    if (v17)
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Deferral requested before handling expired BMLTs.";
        goto LABEL_61;
      }
LABEL_62:

      self->wasDeferred = 1;
      v67 = v9;
      goto LABEL_63;
    }
  }
  else
  {
    objc_msgSend(v5, "experimentDatabase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIMaintenanceTask _handleExpiredExperimentsWithExperimentDatabase:nextTasks:](self, "_handleExpiredExperimentsWithExperimentDatabase:nextTasks:", v14, v6);

  }
  objc_msgSend(v5, "bmltDatabase");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIMaintenanceTask _handleExpiredBMLTsWithBMLTDatabase:nextTasks:](self, "_handleExpiredBMLTsWithBMLTDatabase:nextTasks:", v18, v6);

  if (v8)
  {
    objc_msgSend(v8, "shouldDefer");
    v19 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v20 = v19[2]();

    if (v20)
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Deferral requested before handling orphaned namespaces.";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
    objc_msgSend(v5, "namespaceDatabase");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIMaintenanceTask _handleOrphanedNamespacesWithNamespaceDatabase:nextTasks:](self, "_handleOrphanedNamespacesWithNamespaceDatabase:nextTasks:", v22, v6);

    objc_msgSend(v8, "shouldDefer");
    v23 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v24 = v23[2]();

    if (v24)
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Deferral requested before any cleaning unused content.";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
  }
  else
  {
    objc_msgSend(v5, "namespaceDatabase");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIMaintenanceTask _handleOrphanedNamespacesWithNamespaceDatabase:nextTasks:](self, "_handleOrphanedNamespacesWithNamespaceDatabase:nextTasks:", v21, v6);

  }
  v25 = -[TRIMaintenanceTask _cleanupUnusedContentWithContext:nextTasks:](self, "_cleanupUnusedContentWithContext:nextTasks:", v5, v6);
  objc_msgSend(v5, "paths");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[TRIMaintenanceTask _cleanupLocalTempStorageWithPaths:](self, "_cleanupLocalTempStorageWithPaths:", v26);

  if (v8)
  {
    objc_msgSend(v8, "shouldDefer");
    v28 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v29 = v28[2]();

    if (v29)
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Deferral requested before push service sync.";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
    objc_msgSend(v5, "pushServiceMuxer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rolloutDatabase");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "experimentDatabase");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIMaintenanceTask _synchronizePushService:usingRolloutDatabase:experimentDatabase:](self, "_synchronizePushService:usingRolloutDatabase:experimentDatabase:", v33, v34, v35);

    objc_msgSend(v8, "shouldDefer");
    v36 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = v36[2]();

    if ((_DWORD)v34)
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Deferral requested before expiring old history records.";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
  }
  else
  {
    objc_msgSend(v5, "pushServiceMuxer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rolloutDatabase");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "experimentDatabase");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIMaintenanceTask _synchronizePushService:usingRolloutDatabase:experimentDatabase:](self, "_synchronizePushService:usingRolloutDatabase:experimentDatabase:", v30, v31, v32);

  }
  v71 = v27;
  v37 = v25;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1814400.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0;
  objc_msgSend(v5, "experimentHistoryDatabase");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "expireRecordsOlderThanDate:deletedCount:", v38, &v72);

  if (v40)
  {
    TRILogCategory_Server();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v74 = v72;
      _os_log_impl(&dword_1D207F000, v41, OS_LOG_TYPE_DEFAULT, "Expired %tu records from experiment history.", buf, 0xCu);
    }

  }
  if (v8)
  {
    objc_msgSend(v8, "shouldDefer");
    v42 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v43 = v42[2]();

    if (v43)
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Deferral requested before expiring old rollout history records.";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1814400.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0;
  objc_msgSend(v5, "rolloutHistoryDatabase");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "expireRecordsOlderThanDate:deletedCount:", v44, &v72);

  if (v46)
  {
    TRILogCategory_Server();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v74 = v72;
      _os_log_impl(&dword_1D207F000, v47, OS_LOG_TYPE_DEFAULT, "Expired %tu records from rollout history.", buf, 0xCu);
    }

  }
  if (v8)
  {
    objc_msgSend(v8, "shouldDefer");
    v48 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v49 = v48[2]();

    if (v49)
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Deferral requested before expiring old ML runtime evaluation history records.";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1814400.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0;
  objc_msgSend(v5, "evaluationHistoryDatabase");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "expireRecordsOlderThanDate:deletedCount:", v50, &v72);

  if (v52)
  {
    TRILogCategory_Server();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v74 = v72;
      _os_log_impl(&dword_1D207F000, v53, OS_LOG_TYPE_DEFAULT, "Expired %tu records from MLRuntime evaluation history.", buf, 0xCu);
    }

  }
  if (v8)
  {
    objc_msgSend(v8, "shouldDefer");
    v54 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v55 = v54[2]();

    if (v55)
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Deferral requested before expiring old BMLT history records.";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1814400.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0;
  objc_msgSend(v5, "bmltHistoryDatabase");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "expireRecordsOlderThanDate:deletedCount:", v56, &v72);

  if (v58)
  {
    TRILogCategory_Server();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v74 = v72;
      _os_log_impl(&dword_1D207F000, v59, OS_LOG_TYPE_DEFAULT, "Expired %tu records from BMLT history.", buf, 0xCu);
    }

  }
  if (v8)
  {
    objc_msgSend(v8, "shouldDefer");
    v60 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v61 = v60[2]();

    v62 = off_1E932E000;
    if (v61)
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Deferral requested before compacting database.";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
    objc_msgSend(v5, "underlyingDatabase");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "vacuum");

    objc_msgSend(v8, "shouldDefer");
    v65 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v66 = v65[2]();

    if (v66)
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v13 = "Deferral requested before reporting storage telemetry.";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
  }
  else
  {
    objc_msgSend(v5, "underlyingDatabase");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "vacuum");

    v62 = off_1E932E000;
  }
  v69 = -[TRIActiveExperimentsMetricRecorder initWithServerContext:]([TRIActiveExperimentsMetricRecorder alloc], "initWithServerContext:", v5);
  -[TRIActiveExperimentsMetricRecorder recordMetric](v69, "recordMetric");
  if (v37 && v71)
    v70 = 2;
  else
    v70 = 3;
  -[__objc2_class resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](v62[175], "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v70, 1, v6, 0);
  v67 = (id)objc_claimAutoreleasedReturnValue();

LABEL_63:
  return v67;
}

- (void)_handleExpiredExperimentsWithExperimentDatabase:(id)a3 nextTasks:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __80__TRIMaintenanceTask__handleExpiredExperimentsWithExperimentDatabase_nextTasks___block_invoke;
  v15 = &unk_1E93302A0;
  v8 = v7;
  v16 = v8;
  v17 = &v18;
  objc_msgSend(v6, "enumerateExperimentRecordsWithBlock:", &v12);
  TRILogCategory_Server();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[TRIBaseTask taskName](self, "taskName", v12, v13, v14, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *((_DWORD *)v19 + 6);
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    v24 = 1024;
    v25 = v11;
    _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduled deactivation of %u experiments", buf, 0x12u);

  }
  _Block_object_dispose(&v18, 8);

}

void __80__TRIMaintenanceTask__handleExpiredExperimentsWithExperimentDatabase_nextTasks___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isExpiredExperiment"))
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "experimentDeployment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "experimentId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "treatmentId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "scheduling deactivation of experiment %{public}@ with treatment %@", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(v3, "experimentDeployment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "experimentId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "experimentDeployment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v9, objc_msgSend(v10, "deploymentId"), 0, 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  }
}

- (void)_handleExpiredBMLTsWithBMLTDatabase:(id)a3 nextTasks:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __68__TRIMaintenanceTask__handleExpiredBMLTsWithBMLTDatabase_nextTasks___block_invoke;
  v15 = &unk_1E9330390;
  v8 = v7;
  v16 = v8;
  v17 = &v18;
  objc_msgSend(v6, "enumerateActiveTasksWithBlock:", &v12);
  TRILogCategory_Server();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[TRIBaseTask taskName](self, "taskName", v12, v13, v14, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *((_DWORD *)v19 + 6);
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    v24 = 1024;
    v25 = v11;
    _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduled deactivation of %u BMLTs", buf, 0x12u);

  }
  _Block_object_dispose(&v18, 8);

}

void __68__TRIMaintenanceTask__handleExpiredBMLTsWithBMLTDatabase_nextTasks___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isExpired"))
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "bmltDeployment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "backgroundMLTaskId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "activeFactorPackSetId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "scheduling deactivation of BMLT %{public}@ with active factor pack set ID %@", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(v3, "bmltDeployment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIDeactivateBMLTDeploymentTask taskWithBMLTDeployment:triggerEvent:](TRIDeactivateBMLTDeploymentTask, "taskWithBMLTDeployment:triggerEvent:", v8, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  }
}

- (BOOL)_cleanupTreatmentWithTreatmentId:(id)a3 paths:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  TRIClientTreatmentStorage *v9;
  BOOL v10;
  NSObject *v11;
  TRIFBClientTreatmentStorage *v12;
  BOOL v13;
  NSObject *v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TRILogCategory_Server();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "Removing treatment %@.", (uint8_t *)&v16, 0xCu);
  }

  v9 = -[TRIClientTreatmentStorage initWithPaths:]([TRIClientTreatmentStorage alloc], "initWithPaths:", v7);
  v10 = -[TRIClientTreatmentStorage removeTreatmentWithTreatmentId:](v9, "removeTreatmentWithTreatmentId:", v6);
  if (!v10)
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v6;
      _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Could not remove treatment %@.", (uint8_t *)&v16, 0xCu);
    }

  }
  if (self->_isFlatbufferTreatmentWriteEnabled)
  {
    v12 = -[TRIFBClientTreatmentStorage initWithPaths:]([TRIFBClientTreatmentStorage alloc], "initWithPaths:", v7);
    v13 = -[TRIFBClientTreatmentStorage removeTreatmentWithTreatmentId:](v12, "removeTreatmentWithTreatmentId:", v6);
    if (!v13)
    {
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = 138412290;
        v17 = v6;
        _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Could not remove treatment from flatbuffer storage:%@.", (uint8_t *)&v16, 0xCu);
      }

    }
    if (self->_isFlatbufferTreatmentReadEnabled)
      v10 = v13;

  }
  return v10;
}

- (BOOL)_cleanupUnusedContentWithContext:(id)a3 nextTasks:(id)a4
{
  id v6;
  TRINamespaceResolverStorage *v7;
  void *v8;
  TRINamespaceResolverStorage *v9;
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  int v14;
  _BOOL4 v15;
  NSObject *v16;
  int v17;
  _BOOL4 v18;
  NSObject *v19;
  int v20;
  TRIFactorPackSetStorage *v21;
  void *v22;
  TRIFactorPackSetStorage *v23;
  _BOOL4 v24;
  NSObject *v25;
  int v26;
  TRIFactorPackStorage *v27;
  void *v28;
  TRIFactorPackStorage *v29;
  _BOOL4 v30;
  NSObject *v31;
  int v32;
  TRIFBFactorPackStorage *v33;
  void *v34;
  TRIFBFactorPackStorage *v35;
  int v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  int v40;
  TRINamespaceDescriptorSetStorage *v41;
  void *v42;
  TRINamespaceDescriptorSetStorage *v43;
  _BOOL4 v44;
  NSObject *v45;
  TRIClientTreatmentStorage *v46;
  void *v47;
  TRIClientTreatmentStorage *v48;
  _BOOL4 v49;
  NSObject *v50;
  TRIFBClientTreatmentStorage *v51;
  void *v52;
  TRIFBClientTreatmentStorage *v53;
  _BOOL4 v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  id v59;
  int v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t i;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  NSObject *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  _BOOL4 v84;
  int v85;
  void *v86;
  uint64_t v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  TRIAssetStoreDatabase *v98;
  void *v99;
  id v100;
  uint64_t v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  id v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  void *v115;
  id v116;
  id v117;
  id v118;
  TRIFactorPackSetStorage *v119;
  void *v120;
  TRIFactorPackSetStorage *v121;
  id v122;
  TRIFactorPackSetStorage *v123;
  uint64_t v124;
  TRIFactorPackSetStorage *v125;
  TRIFactorPackStorage *v126;
  void *v127;
  TRIFactorPackStorage *v128;
  TRIFactorPackStorage *v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  id v134;
  int v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t j;
  TRIAssetStore *v141;
  SEL v143;
  id v144;
  void *v146;
  id v147;
  uint64_t v148;
  id v149;
  id obj;
  uint64_t v151;
  TRIAssetStoreDatabase *v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _QWORD v157[4];
  id v158;
  id v159;
  _QWORD v160[4];
  TRIFactorPackStorage *v161;
  _QWORD v162[4];
  id v163;
  TRIFactorPackSetStorage *v164;
  _QWORD v165[4];
  id v166;
  TRIFactorPackSetStorage *v167;
  _QWORD v168[4];
  id v169;
  id v170;
  id v171;
  id v172;
  _QWORD v173[4];
  id v174;
  id v175;
  id v176;
  id v177;
  _QWORD v178[4];
  id v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  _QWORD v184[4];
  id v185;
  int v186;
  int v187;
  uint8_t v188[128];
  uint8_t buf[4];
  _BYTE v190[10];
  int v191;
  _BYTE v192[128];
  uint64_t v193;

  v193 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v144 = a4;
  v7 = [TRINamespaceResolverStorage alloc];
  objc_msgSend(v6, "paths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TRINamespaceResolverStorage initWithPaths:](v7, "initWithPaths:", v8);

  v187 = 0;
  v10 = -[TRINamespaceResolverStorage removeUnreferencedRolloutDeploymentsWithServerContext:removedCount:](v9, "removeUnreferencedRolloutDeploymentsWithServerContext:removedCount:", v6, &v187);
  if (v10)
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v190 = v187;
      _os_log_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEFAULT, "Removed %u unreferenced rollout deployment dirs.", buf, 8u);
    }

  }
  v187 = 0;
  v12 = -[TRINamespaceResolverStorage removeUnreferencedBMLTDeploymentsWithServerContext:removedCount:](v9, "removeUnreferencedBMLTDeploymentsWithServerContext:removedCount:", v6, &v187);
  if (v12)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v190 = v187;
      _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Removed %u unreferenced BMLT deployment metadata dirs.", buf, 8u);
    }

  }
  v14 = v10 && v12;
  v187 = 0;
  v15 = -[TRINamespaceResolverStorage removeUnreferencedExperimentDeploymentsWithServerContext:removedCount:](v9, "removeUnreferencedExperimentDeploymentsWithServerContext:removedCount:", v6, &v187);
  if (v15)
  {
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v190 = v187;
      _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "Removed %u unreferenced experiment deployment metadata dirs.", buf, 8u);
    }

  }
  v17 = v14 & v15;
  v187 = 0;
  v18 = -[TRINamespaceResolverStorage removeUnneededPromotionsWithRemovedCount:removeAll:](v9, "removeUnneededPromotionsWithRemovedCount:removeAll:", &v187, 0);
  if (v18)
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v190 = v187;
      _os_log_impl(&dword_1D207F000, v19, OS_LOG_TYPE_DEFAULT, "Removed %u unneeded promotion dirs.", buf, 8u);
    }

  }
  v20 = v17 & v18;

  v21 = [TRIFactorPackSetStorage alloc];
  objc_msgSend(v6, "paths");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[TRIFactorPackSetStorage initWithPaths:](v21, "initWithPaths:", v22);

  v187 = 0;
  v24 = -[TRIFactorPackSetStorage removeUnreferencedFactorPackSetsWithServerContext:removedCount:](v23, "removeUnreferencedFactorPackSetsWithServerContext:removedCount:", v6, &v187);
  if (v24)
  {
    TRILogCategory_Server();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v190 = v187;
      _os_log_impl(&dword_1D207F000, v25, OS_LOG_TYPE_DEFAULT, "Removed %u unreferenced factor pack sets.", buf, 8u);
    }

  }
  v26 = v20 & v24;

  v27 = [TRIFactorPackStorage alloc];
  objc_msgSend(v6, "paths");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[TRIFactorPackStorage initWithPaths:](v27, "initWithPaths:", v28);

  v187 = 0;
  v30 = -[TRIFactorPackStorage removeUnreferencedFactorPacksWithRemovedCount:](v29, "removeUnreferencedFactorPacksWithRemovedCount:", &v187);
  if (v30)
  {
    TRILogCategory_Server();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v190 = v187;
      _os_log_impl(&dword_1D207F000, v31, OS_LOG_TYPE_DEFAULT, "Removed %u unreferenced factor packs.", buf, 8u);
    }

  }
  v32 = v26 & v30;
  if (self->_isFlatbufferWriteEnabled)
  {
    v33 = [TRIFBFactorPackStorage alloc];
    objc_msgSend(v6, "paths");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[TRIFBFactorPackStorage initWithPaths:](v33, "initWithPaths:", v34);

    v186 = 0;
    v36 = -[TRIFBFactorPackStorage removeUnreferencedFactorLevelsWithRemovedCount:](v35, "removeUnreferencedFactorLevelsWithRemovedCount:", &v186);
    TRILogCategory_Server();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v190 = v36;
      *(_WORD *)&v190[4] = 1024;
      *(_DWORD *)&v190[6] = v186;
      _os_log_impl(&dword_1D207F000, v37, OS_LOG_TYPE_DEFAULT, "Removing unreferenced factor levels with flatbuffer storage was %d with removed count as: %u", buf, 0xEu);
    }

    if ((v36 & 1) == 0)
    {
      TRILogCategory_Server();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v38, OS_LOG_TYPE_ERROR, "Unable to remove unreferenced factor levels from factor levels storage", buf, 2u);
      }

    }
    if (v187 != v186)
    {
      TRILogCategory_Server();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v190 = v187;
        *(_WORD *)&v190[4] = 1024;
        *(_DWORD *)&v190[6] = v186;
        _os_log_impl(&dword_1D207F000, v39, OS_LOG_TYPE_INFO, "Counts for removed unreferenced factor levels dont match, pb:%d fp:%d", buf, 0xEu);
      }

    }
    if (self->_isFlatbufferReadEnabled)
      v40 = v36;
    else
      v40 = 1;
    v32 &= v40;

  }
  v41 = [TRINamespaceDescriptorSetStorage alloc];
  objc_msgSend(v6, "paths");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[TRINamespaceDescriptorSetStorage initWithPaths:](v41, "initWithPaths:", v42);

  v187 = 0;
  v44 = -[TRINamespaceDescriptorSetStorage removeUnreferencedNamespaceDescriptorSetsWithServerContext:removedCount:](v43, "removeUnreferencedNamespaceDescriptorSetsWithServerContext:removedCount:", v6, &v187);
  if (v44)
  {
    TRILogCategory_Server();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v190 = v187;
      _os_log_impl(&dword_1D207F000, v45, OS_LOG_TYPE_DEFAULT, "Removed %u unreferenced namespace descriptor sets.", buf, 8u);
    }

  }
  v46 = [TRIClientTreatmentStorage alloc];
  objc_msgSend(v6, "paths");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[TRIClientTreatmentStorage initWithPaths:](v46, "initWithPaths:", v47);

  v187 = 0;
  v49 = -[TRIClientTreatmentStorage removeUnreferencedTreatmentsWithRemovedCount:](v48, "removeUnreferencedTreatmentsWithRemovedCount:", &v187);
  if (v49)
  {
    TRILogCategory_Server();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v190 = v187;
      _os_log_impl(&dword_1D207F000, v50, OS_LOG_TYPE_DEFAULT, "Removed %u unreferenced treatments.", buf, 8u);
    }

  }
  v146 = v6;
  if (self->_isFlatbufferTreatmentWriteEnabled)
  {
    v51 = [TRIFBClientTreatmentStorage alloc];
    objc_msgSend(v6, "paths");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[TRIFBClientTreatmentStorage initWithPaths:](v51, "initWithPaths:", v52);

    v186 = 0;
    v54 = -[TRIFBClientTreatmentStorage removeUnreferencedTreatmentsWithRemovedCount:](v53, "removeUnreferencedTreatmentsWithRemovedCount:", &v186);
    if (v54)
    {
      TRILogCategory_Server();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v190 = v186;
        _os_log_impl(&dword_1D207F000, v55, OS_LOG_TYPE_DEFAULT, "Removed %u unreferenced treatments from flatbuffers.", buf, 8u);
      }

    }
    if (v187 != v186)
    {
      TRILogCategory_Server();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v190 = v186;
        *(_WORD *)&v190[4] = 1024;
        *(_DWORD *)&v190[6] = v187;
        _os_log_impl(&dword_1D207F000, v56, OS_LOG_TYPE_INFO, "Counts for removal of unreferenced treatments from flatbuffers:%u and protobuf:%u do not match", buf, 0xEu);
      }

    }
    if (self->_isFlatbufferTreatmentReadEnabled)
      v49 = v54;

    v6 = v146;
  }

  v57 = (void *)objc_opt_new();
  objc_msgSend(v6, "contentTracker");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v184[0] = MEMORY[0x1E0C809B0];
  v184[1] = 3221225472;
  v184[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke;
  v184[3] = &unk_1E93303B8;
  v59 = v57;
  v185 = v59;
  v60 = v44 & v49 & objc_msgSend(v58, "enumerateTrackedItemsWithBlock:", v184) & v32;

  v182 = 0u;
  v183 = 0u;
  v180 = 0u;
  v181 = 0u;
  obj = v59;
  v151 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v180, v192, 16);
  if (v151)
  {
    v143 = a2;
    v61 = 0x1E932D000uLL;
    v62 = *(_QWORD *)v181;
    v148 = *(_QWORD *)v181;
    do
    {
      for (i = 0; i != v151; ++i)
      {
        if (*(_QWORD *)v181 != v62)
          objc_enumerationMutation(obj);
        v64 = *(_QWORD *)(*((_QWORD *)&v180 + 1) + 8 * i);
        v65 = (void *)MEMORY[0x1D8232A5C]();
        objc_msgSend(*(id *)(v61 + 3472), "decodeContentIdentifier:", v64);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v66;
        v68 = v60 & (v66 != 0);
        if (v66)
        {
          switch(objc_msgSend(v66, "type"))
          {
            case 0u:
              objc_msgSend(v67, "experiment");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v69)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v94, "handleFailureInMethod:object:file:lineNumber:description:", v143, self, CFSTR("TRIMaintenanceTask.m"), 554, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentDeployment"));

                v6 = v146;
              }
              objc_msgSend(v6, "experimentDatabase");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "experimentRecordWithExperimentDeployment:", v69);
              v71 = (void *)objc_claimAutoreleasedReturnValue();

              if (v71)
              {
                if (objc_msgSend(v71, "status") != 4 || objc_msgSend(v71, "isExpiredExperiment"))
                {
                  objc_msgSend(v146, "contentTracker");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v72, "clearRefsWithContentIdentifier:", v64);

                  v62 = v148;
                  objc_msgSend(v146, "experimentDatabase");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  v74 = objc_msgSend(v73, "removeExperimentRecordWithExperimentDeployment:", v69);

                  if (!v74)
                    v68 = 0;
                }
                objc_msgSend(v146, "limitedCarryManager");
                v75 = objc_claimAutoreleasedReturnValue();
                -[NSObject removeProfileForExperiment:](v75, "removeProfileForExperiment:", v69);
              }
              else
              {
                TRILogCategory_Server();
                v75 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v69, "experimentId");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  v93 = objc_msgSend(v69, "deploymentId");
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)v190 = v92;
                  *(_WORD *)&v190[8] = 1024;
                  v191 = v93;
                  _os_log_error_impl(&dword_1D207F000, v75, OS_LOG_TYPE_ERROR, "Could not find experiment record for experiment deployment with experiment id: %{public}@ & deployment id:  %d", buf, 0x12u);

                }
              }

              v6 = v146;
              break;
            case 1u:
              objc_msgSend(v67, "treatment");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v69)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v96, "handleFailureInMethod:object:file:lineNumber:description:", v143, self, CFSTR("TRIMaintenanceTask.m"), 598, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("desc"));

                v6 = v146;
              }
              objc_msgSend(v69, "container");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "paths");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              if (v79)
              {
                objc_msgSend(v69, "container");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "pathsForContainer:asClientProcess:", v81, 0);
                v82 = objc_claimAutoreleasedReturnValue();

                v80 = (void *)v82;
              }

              if (v80)
              {
                objc_msgSend(v69, "treatmentId");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                v84 = -[TRIMaintenanceTask _cleanupTreatmentWithTreatmentId:paths:](self, "_cleanupTreatmentWithTreatmentId:paths:", v83, v80);

                if (!v84)
                {
                  v85 = 0;
                  v6 = v146;
                  goto LABEL_99;
                }
              }
              else
              {
                TRILogCategory_Server();
                v88 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v69, "container");
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v89, "identifier");
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  *(_QWORD *)v190 = v90;
                  _os_log_impl(&dword_1D207F000, v88, OS_LOG_TYPE_DEFAULT, "Not removing treatment from missing app container: %{public}@", buf, 0xCu);

                }
              }
              v6 = v146;
              objc_msgSend(v146, "contentTracker");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "clearRefsWithContentIdentifier:", v64);

              v85 = 1;
LABEL_99:
              v62 = v148;
              v68 &= v85;

              v61 = 0x1E932D000;
              break;
            case 2u:
              objc_msgSend(v67, "rollout");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v69)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "handleFailureInMethod:object:file:lineNumber:description:", v143, self, CFSTR("TRIMaintenanceTask.m"), 618, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rolloutDeployment"));

              }
              objc_msgSend(v6, "contentTracker");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "clearRefsWithContentIdentifier:", v64);

              objc_msgSend(v6, "rolloutDatabase");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v78 = objc_msgSend(v77, "removeRecordWithDeployment:usingRefCounting:", v69, 1);
              goto LABEL_89;
            case 4u:
              objc_msgSend(v67, "bmlt");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v69)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "handleFailureInMethod:object:file:lineNumber:description:", v143, self, CFSTR("TRIMaintenanceTask.m"), 637, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltDeployment"));

              }
              objc_msgSend(v6, "contentTracker");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "clearRefsWithContentIdentifier:", v64);

              objc_msgSend(v6, "bmltDatabase");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v78 = objc_msgSend(v77, "removeRecordWithDeployment:", v69);
LABEL_89:
              v87 = v78;

              if (!v87)
                v68 = 0;
              v61 = 0x1E932D000;
              v62 = v148;
              break;
            default:
              goto LABEL_101;
          }
        }
        else
        {
          objc_msgSend(v6, "contentTracker");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "clearRefsWithContentIdentifier:", v64);
        }

LABEL_101:
        objc_autoreleasePoolPop(v65);
        v60 = v68 != 0;
      }
      v151 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v180, v192, 16);
    }
    while (v151);
  }

  v98 = [TRIAssetStoreDatabase alloc];
  objc_msgSend(v6, "paths");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = -[TRIAssetStoreDatabase initWithPaths:storageManagement:](v98, "initWithPaths:storageManagement:", v99, 0);

  v100 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v178[0] = MEMORY[0x1E0C809B0];
  v101 = MEMORY[0x1E0C809B0];
  v178[1] = 3221225472;
  v178[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_60;
  v178[3] = &unk_1E932F2B8;
  v102 = v100;
  v179 = v102;
  -[TRIAssetStoreDatabase enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock:](v152, "enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock:", v178);
  v103 = objc_alloc(MEMORY[0x1E0DC09F8]);
  objc_msgSend(v6, "paths");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = (void *)objc_msgSend(v103, "initWithPaths:factorsState:", v104, 0);

  v106 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v107 = v6;
  v108 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v107, "rolloutDatabase");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v173[0] = v101;
  v173[1] = 3221225472;
  v173[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_2;
  v173[3] = &unk_1E9330408;
  v110 = v105;
  v174 = v110;
  v111 = v102;
  v175 = v111;
  v176 = v108;
  v112 = v106;
  v177 = v112;
  v113 = v108;
  objc_msgSend(v109, "enumerateActiveRecordsWithVisibility:usingTransaction:block:", 1, 0, v173);

  v114 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v107, "bmltDatabase");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v168[0] = v101;
  v168[1] = 3221225472;
  v168[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_66;
  v168[3] = &unk_1E9330430;
  v169 = v110;
  v170 = v111;
  v171 = v114;
  v172 = v112;
  v116 = v112;
  v117 = v114;
  v149 = v111;
  v118 = v110;
  objc_msgSend(v115, "enumerateTaskRecordsWithBlock:", v168);

  v119 = [TRIFactorPackSetStorage alloc];
  objc_msgSend(v107, "paths");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = -[TRIFactorPackSetStorage initWithPaths:](v119, "initWithPaths:", v120);

  v165[0] = v101;
  v165[1] = 3221225472;
  v165[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_68;
  v165[3] = &unk_1E9330458;
  v122 = v144;
  v166 = v122;
  v123 = v121;
  v167 = v123;
  objc_msgSend(v113, "enumerateObjectsUsingBlock:", v165);
  v162[0] = v101;
  v124 = v101;
  v162[1] = 3221225472;
  v162[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_72;
  v162[3] = &unk_1E9330480;
  v147 = v122;
  v163 = v147;
  v164 = v123;
  v125 = v123;
  objc_msgSend(v117, "enumerateObjectsUsingBlock:", v162);
  v126 = [TRIFactorPackStorage alloc];
  objc_msgSend(v107, "paths");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = -[TRIFactorPackStorage initWithPaths:](v126, "initWithPaths:", v127);

  v160[0] = v124;
  v160[1] = 3221225472;
  v160[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_74;
  v160[3] = &unk_1E932FE30;
  v161 = v128;
  v129 = v128;
  objc_msgSend(v116, "enumerateKeysAndObjectsUsingBlock:", v160);

  v130 = (void *)objc_opt_new();
  objc_msgSend(v107, "paths");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "addObject:", v131);

  objc_msgSend(v107, "namespaceDatabase");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v157[0] = v124;
  v157[1] = 3221225472;
  v157[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_76;
  v157[3] = &unk_1E93304A8;
  v133 = v107;
  v158 = v133;
  v134 = v130;
  v159 = v134;
  v135 = v60 & objc_msgSend(v132, "enumerateDynamicNamespaceRecordsWithBlock:", v157);

  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  v136 = v134;
  v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v153, v188, 16);
  if (v137)
  {
    v138 = v137;
    v139 = *(_QWORD *)v154;
    do
    {
      for (j = 0; j != v138; ++j)
      {
        if (*(_QWORD *)v154 != v139)
          objc_enumerationMutation(v136);
        v141 = -[TRIAssetStore initWithPaths:]([TRIAssetStore alloc], "initWithPaths:", *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * j));
        v135 &= -[TRIAssetStore collectGarbageOlderThanNumScans:deletedAssetSize:](v141, "collectGarbageOlderThanNumScans:deletedAssetSize:", 2, 0);

      }
      v138 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v153, v188, 16);
    }
    while (v138);
  }

  return v135;
}

void __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "str");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = (uint64_t)v7;
      v12 = 2048;
      v13 = a3;
      _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: refCount %lld", (uint8_t *)&v10, 0x16u);

    }
    if (a3 <= 0)
    {
      if (a3 < 0)
      {
        notify_post("com.apple.trial.MaintenanceFoundNegativeRefcount");
        TRILogCategory_Server();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v5, "str");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 134218242;
          v11 = a3;
          v12 = 2114;
          v13 = (uint64_t)v9;
          _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "refCount went negative (%lld) for content identifier %{public}@", (uint8_t *)&v10, 0x16u);

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    }
  }

}

uint64_t __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_60(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  id obj;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  int v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = a2;
  objc_msgSend(v18, "namespaces");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "factorPackIdForRolloutWithNamespaceName:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = *(void **)(a1 + 40);
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_3;
          v20[3] = &unk_1E93303E0;
          v10 = v8;
          v21 = v10;
          objc_msgSend(v9, "_pas_filteredSetWithTest:", v20);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          if (v12)
          {
            TRILogCategory_Server();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v18, "deployment");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "rolloutId");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "deployment");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "deploymentId");
              *(_DWORD *)buf = 138543618;
              v27 = v15;
              v28 = 1024;
              v29 = v17;
              _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Rollout %{public}@.%d contains maRefs file without DB reference.", buf, 0x12u);

            }
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v18);
            objc_msgSend(*(id *)(a1 + 56), "setValue:forKey:", v10, v7);

            goto LABEL_15;
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_15:

}

uint64_t __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsString:", *(_QWORD *)(a1 + 32));
}

void __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_66(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "artifact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSelectedNamespace");

  if (v6)
  {
    objc_msgSend(v3, "artifact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundTask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectedNamespace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 32);
    objc_msgSend(v9, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "factorPackIdForBmltWithNamespaceName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = *(void **)(a1 + 40);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_2_67;
      v23[3] = &unk_1E93303E0;
      v14 = v12;
      v24 = v14;
      objc_msgSend(v13, "_pas_filteredSetWithTest:", v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        TRILogCategory_Server();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v3, "bmltDeployment");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "backgroundMLTaskId");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "bmltDeployment");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "deploymentId");
          *(_DWORD *)buf = 138543618;
          v26 = v20;
          v27 = 1024;
          v28 = v22;
          _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "BMLT %{public}@.%d contains maRefs file without DB reference.", buf, 0x12u);

        }
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
        v17 = *(void **)(a1 + 56);
        objc_msgSend(v9, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setValue:forKey:", v14, v18);

      }
    }

  }
}

uint64_t __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_2_67(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsString:", *(_QWORD *)(a1 + 32));
}

void __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "deployment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rolloutId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIDisenrollRolloutTask taskWithRolloutId:triggerEvent:](TRIDisenrollRolloutTask, "taskWithRolloutId:triggerEvent:", v6, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  objc_msgSend(v3, "activeFactorPackSetId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(v3, "activeFactorPackSetId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathForFactorPackSetWithId:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v13 = objc_msgSend(v12, "removeItemAtPath:error:", v11, &v17);
    v14 = v17;

    if ((v13 & 1) == 0)
    {
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "activeFactorPackSetId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v19 = v16;
        v20 = 2114;
        v21 = v11;
        v22 = 2114;
        v23 = v14;
        _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Unable to cleanup factor pack set %{public}@ at %{public}@: %{public}@", buf, 0x20u);

      }
    }

  }
}

void __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "bmltDeployment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIDeactivateBMLTDeploymentTask taskWithBMLTDeployment:triggerEvent:](TRIDeactivateBMLTDeploymentTask, "taskWithBMLTDeployment:triggerEvent:", v5, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  objc_msgSend(v3, "activeFactorPackSetId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v3, "activeFactorPackSetId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathForFactorPackSetWithId:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v12 = objc_msgSend(v11, "removeItemAtPath:error:", v10, &v16);
    v13 = v16;

    if ((v12 & 1) == 0)
    {
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "activeFactorPackSetId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v18 = v15;
        v19 = 2114;
        v20 = v10;
        v21 = 2114;
        v22 = v13;
        _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Unable to cleanup factor pack set %{public}@ at %{public}@: %{public}@", buf, 0x20u);

      }
    }

  }
}

void __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_74(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  NSObject *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TRIValidateFactorPackId();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "pathForFactorPackWithId:namespaceName:", v4, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "legacyPathForFactorPackWithId:namespaceName:", v4, v3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v9 = objc_msgSend(v8, "removeItemAtPath:error:", v5, &v16);
      v10 = v16;

      if ((v9 & 1) == 0)
      {
        TRILogCategory_Server();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v18 = v4;
          v19 = 2114;
          v20 = v5;
          v21 = 2114;
          v22 = v10;
          _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Unable to cleanup factor pack %{public}@ at %{public}@: %{public}@", buf, 0x20u);
        }

      }
      if (!v7)
        goto LABEL_14;
    }
    else
    {
      v10 = 0;
      if (!v6)
      {
LABEL_14:

        goto LABEL_15;
      }
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v13 = objc_msgSend(v12, "removeItemAtPath:error:", v7, &v15);
    v10 = v15;

    if ((v13 & 1) == 0)
    {
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v18 = v4;
        v19 = 2114;
        v20 = v7;
        v21 = 2114;
        v22 = v10;
        _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Unable to cleanup legacy factor pack %{public}@ at %{public}@: %{public}@", buf, 0x20u);
      }

    }
    goto LABEL_14;
  }
LABEL_15:

}

void __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_76(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "paths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathsForContainer:asClientProcess:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
  else
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "appContainer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Not GC'ing AssetStore in missing app container: %{public}@", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (void)_handleOrphanedNamespacesWithNamespaceDatabase:(id)a3 nextTasks:(id)a4
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __79__TRIMaintenanceTask__handleOrphanedNamespacesWithNamespaceDatabase_nextTasks___block_invoke;
  v29[3] = &unk_1E93304D0;
  v6 = v5;
  v30 = v6;
  objc_msgSend(v4, "enumerateDynamicNamespaceRecordsWithBlock:", v29);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v13, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v4, "removeDynamicNamespaceRecordWithNamespaceName:", v14);

        TRILogCategory_Server();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v15)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v13, "name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "appContainer");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v32 = v18;
            v33 = 2114;
            v34 = v20;
            _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "removed dynamic namespace %{public}@ registered to app container %{public}@", buf, 0x16u);

          }
          ++v10;
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v13, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v32 = v21;
            _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Unable to deregister namespace %{public}@", buf, 0xCu);

          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  TRILogCategory_Server();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    -[TRIBaseTask taskName](self, "taskName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v23;
    v33 = 1024;
    LODWORD(v34) = v10;
    _os_log_impl(&dword_1D207F000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ deregistered %u dynamic namespaces", buf, 0x12u);

  }
}

void __79__TRIMaintenanceTask__handleOrphanedNamespacesWithNamespaceDatabase_nextTasks___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "appContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "fetchStatus") == 2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (BOOL)_cleanupLocalTempStorageWithPaths:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "localTempDir");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[TRITempDirScopeGuard ifUnreferencedCleanupPath:](TRITempDirScopeGuard, "ifUnreferencedCleanupPath:", v3);

  return v4;
}

- (void)_synchronizePushService:(id)a3 usingRolloutDatabase:(id)a4 experimentDatabase:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *channelCleanupQueue;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_opt_new();
  v12 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __86__TRIMaintenanceTask__synchronizePushService_usingRolloutDatabase_experimentDatabase___block_invoke;
  v25[3] = &unk_1E93304F8;
  v13 = v11;
  v26 = v13;
  objc_msgSend(v10, "enumerateActiveRecordsWithVisibility:usingTransaction:block:", 1, 0, v25);

  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __86__TRIMaintenanceTask__synchronizePushService_usingRolloutDatabase_experimentDatabase___block_invoke_2;
  v23[3] = &unk_1E9330520;
  v14 = (id)objc_opt_new();
  v24 = v14;
  objc_msgSend(v9, "enumerateActiveExperimentRecordsWithVisibility:block:", 1, v23);

  channelCleanupQueue = self->_channelCleanupQueue;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __86__TRIMaintenanceTask__synchronizePushService_usingRolloutDatabase_experimentDatabase___block_invoke_3;
  block[3] = &unk_1E9330548;
  v20 = v8;
  v21 = v13;
  v22 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v8;
  dispatch_async(channelCleanupQueue, block);

}

void __86__TRIMaintenanceTask__synchronizePushService_usingRolloutDatabase_experimentDatabase___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "deployment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __86__TRIMaintenanceTask__synchronizePushService_usingRolloutDatabase_experimentDatabase___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "experimentDeployment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __86__TRIMaintenanceTask__synchronizePushService_usingRolloutDatabase_experimentDatabase___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ensureSubscriptionsExistOnlyForRolloutDeployments:experimentIds:maxChannelsAllowed:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 75);
}

- (void)addMetric:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__TRIMaintenanceTask_addMetric___block_invoke;
  v7[3] = &unk_1E9330570;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __32__TRIMaintenanceTask_addMetric___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)a2[1];
  if (!v3)
  {
    v5 = a2;
    v6 = objc_opt_new();
    v7 = (void *)a2[1];
    a2[1] = v6;

    v3 = (void *)a2[1];
  }
  return objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)addDimension:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__TRIMaintenanceTask_addDimension___block_invoke;
  v7[3] = &unk_1E9330570;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __35__TRIMaintenanceTask_addDimension___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)a2[2];
  if (!v3)
  {
    v5 = a2;
    v6 = objc_opt_new();
    v7 = (void *)a2[2];
    a2[2] = v6;

    v3 = (void *)a2[2];
  }
  return objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)mergeTelemetry:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__TRIMaintenanceTask_mergeTelemetry___block_invoke;
  v7[3] = &unk_1E9330570;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __37__TRIMaintenanceTask_mergeTelemetry___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v6 = a2;
  v3 = (void *)v6[3];
  if (v3)
  {
    objc_msgSend(v3, "mergeFrom:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v5 = (void *)v6[3];
    v6[3] = v4;

  }
}

- (id)metrics
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  lock = self->_lock;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__TRIMaintenanceTask_metrics__block_invoke;
  v5[3] = &unk_1E9330598;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __29__TRIMaintenanceTask_metrics__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(void **)(a2 + 8);
  if (v3)
  {
    v4 = objc_msgSend(v3, "copy");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (id)dimensions
{
  void *v3;
  void *v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1D8232A5C](self, a2);
  v4 = (void *)objc_opt_new();
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__TRIMaintenanceTask_dimensions__block_invoke;
  v8[3] = &unk_1E9330570;
  v6 = v4;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);

  objc_autoreleasePoolPop(v3);
  return v6;
}

uint64_t __32__TRIMaintenanceTask_dimensions__block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 16))
    return objc_msgSend(*(id *)(result + 32), "addObjectsFromArray:");
  return result;
}

- (id)trialSystemTelemetry
{
  id v3;
  _PASLock *lock;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  v3 = objc_alloc_init(MEMORY[0x1E0DC0FA8]);
  lock = self->_lock;
  v13 = v3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__TRIMaintenanceTask_trialSystemTelemetry__block_invoke;
  v7[3] = &unk_1E9330598;
  v7[4] = &v8;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  v5 = (void *)objc_msgSend((id)v9[5], "copy");
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __42__TRIMaintenanceTask_trialSystemTelemetry__block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 24))
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40), "mergeFrom:");
  return result;
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

  -[TRIMaintenanceTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIMaintenanceTask.m"), 922, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  +[TRIPBMessage parseFromData:error:](TRIMaintenancePersistedTask, "parseFromData:error:", a3, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v3)
  {
    v5 = (void *)objc_opt_new();
    if (objc_msgSend(v3, "hasRetryCount"))
      v6 = objc_msgSend(v3, "retryCount");
    else
      v6 = 0;
    objc_msgSend(v5, "setRetryCount:", v6);
  }
  else
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v4;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIMaintenancePersistedTask: %{public}@", buf, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIMaintenanceTask)initWithCoder:(id)a3
{
  id v4;
  TRIMaintenanceTask *v5;
  void *v6;
  TRIMaintenanceTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIMaintenanceTask;
  v5 = -[TRIMaintenanceTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIMaintenanceTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIMaintenanceTask.m"), 941, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIMaintenanceTask serialize](self, "serialize");
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
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_channelCleanupQueue, 0);
}

@end
