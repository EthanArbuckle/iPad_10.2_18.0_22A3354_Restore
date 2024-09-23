@implementation TRIFetchExperimentTask

- (int)taskType
{
  return 4;
}

+ (id)taskWithExperimentDeployment:(id)a3 taskAttributing:(id)a4
{
  id v5;
  id v6;
  TRIFetchExperimentTask *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[TRIFetchExperimentTask initWithExperimentDeployment:taskAttributing:]([TRIFetchExperimentTask alloc], "initWithExperimentDeployment:taskAttributing:", v6, v5);

  return v7;
}

- (TRIFetchExperimentTask)initWithExperimentDeployment:(id)a3 taskAttributing:(id)a4
{
  id v7;
  id v8;
  TRIFetchExperimentTask *v9;
  TRIFetchExperimentTask *v10;
  TRITrialSystemTelemetry *trialSystemTelemetry;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchExperimentTask.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentDeployment"));

  }
  if ((objc_msgSend(v7, "hasDeploymentId") & 1) != 0)
  {
    if (v8)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchExperimentTask.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentDeployment.hasDeploymentId"));

    if (v8)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchExperimentTask.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskAttributing"));

LABEL_5:
  v16.receiver = self;
  v16.super_class = (Class)TRIFetchExperimentTask;
  v9 = -[TRIExperimentBaseTask initWithExperiment:](&v16, sel_initWithExperiment_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_taskAttributing, a4);
    trialSystemTelemetry = v10->_trialSystemTelemetry;
    v10->_trialSystemTelemetry = 0;

  }
  return v10;
}

- (void)runEnqueueHandlerUsingContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForExperimentArtifactWithDeployment:", v5);
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
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForExperimentArtifactWithDeployment:", v5);
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
      -[TRIExperimentBaseTask experiment](self, "experiment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDesc");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for experiment %{public}@", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (id)_nextTasksForRunStatus:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a3 != 3)
    return MEMORY[0x1E0C9AA60];
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v5, objc_msgSend(v6, "deploymentId"), 0, 3, self->_taskAttributing);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  TRIFetchExperimentTask *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  dispatch_semaphore_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  TRITrialSystemTelemetry *trialSystemTelemetry;
  uint64_t v30;
  TRITrialSystemTelemetry *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  __CFString *v48;
  void *v49;
  TRIFetchOptions *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  TRIFetchExperimentTask *v62;
  id v63;
  NSObject *v64;
  uint64_t *v65;
  _BYTE *v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  int v84;
  uint8_t v85[128];
  uint8_t v86[4];
  uint64_t v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  __CFString *v91;
  _BYTE buf[24];
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v55 = a4;
  if (!+[TRIUserAdjustableSettings getExperimentOptOut:](TRIUserAdjustableSettings, "getExperimentOptOut:", v6))
  {
    v9 = self;
    objc_sync_enter(v9);
    v49 = (void *)os_transaction_create();
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v41 = objc_opt_class();
      -[TRIExperimentBaseTask experiment](v9, "experiment");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "shortDesc");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v41;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v43;
      _os_log_debug_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEBUG, "starting %@ with experiment %{public}@", buf, 0x16u);

    }
    objc_msgSend(v6, "experimentDatabase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIExperimentBaseTask experiment](v9, "experiment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "experimentRecordWithExperimentDeployment:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (objc_msgSend(v13, "type") == 3)
        -[TRIExperimentBaseTask logAsRollout:](v9, "logAsRollout:", 1);
      objc_msgSend(v13, "artifact");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v52 = 0;
    }
    objc_msgSend(v6, "keyValueStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIFetchDateManager managerWithKeyValueStore:](TRIFetchDateManager, "managerWithKeyValueStore:", v14);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "namespaceDatabase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paths");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "namespaceDescriptorsDefaultDir");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:](TRINamespaceDescriptorProvider, "providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v15, v17);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = -[TRITaskAttributing triCloudKitContainer](v9->_taskAttributing, "triCloudKitContainer");
    -[TRITaskAttributing teamIdentifier](v9->_taskAttributing, "teamIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRITaskAttributing applicationBundleIdentifier](v9->_taskAttributing, "applicationBundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:](TRICKNativeArtifactProvider, "providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:", v18, v19, v20, v54, v53, v6);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    -[TRITaskAttributing networkOptions](v9->_taskAttributing, "networkOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "allowsCellularAccess"))
    {
      objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("allows_cellular_download"), objc_msgSend(v21, "allowsCellularAccess"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIExperimentBaseTask addMetric:](v9, "addMetric:", v22);

    }
    if (objc_msgSend(v21, "discretionaryBehavior"))
    {
      -[TRIBaseTask stateProvider](v9, "stateProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "activeActivityGrantingCapability:", objc_msgSend(v21, "requiredCapability"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        TRILogCategory_Server();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D207F000, v39, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", buf, 2u);
        }

        +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 1, 0, MEMORY[0x1E0C9AA60], 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      objc_msgSend(v21, "setActivity:", v24);

    }
    v50 = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:]([TRIFetchOptions alloc], "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v21, &unk_1E9363FA8);
    v25 = dispatch_semaphore_create(0);
    v81 = 0;
    v82 = &v81;
    v83 = 0x2020000000;
    v84 = 2;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v93 = __Block_byref_object_copy__45;
    v94 = __Block_byref_object_dispose__45;
    v95 = 0;
    v75 = 0;
    v76 = &v75;
    v77 = 0x3032000000;
    v78 = __Block_byref_object_copy__45;
    v79 = __Block_byref_object_dispose__45;
    v80 = 0;
    v69 = 0;
    v70 = &v69;
    v71 = 0x3032000000;
    v72 = __Block_byref_object_copy__45;
    v73 = __Block_byref_object_dispose__45;
    v74 = 0;
    -[TRIExperimentBaseTask experiment](v9, "experiment");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __56__TRIFetchExperimentTask_runUsingContext_withTaskQueue___block_invoke;
    v60[3] = &unk_1E9335BE8;
    v65 = &v81;
    v66 = buf;
    v67 = &v75;
    v68 = &v69;
    v61 = v52;
    v62 = v9;
    v63 = v6;
    v27 = v25;
    v64 = v27;
    objc_msgSend(v51, "fetchExperimentWithExperimentDeployment:options:completion:", v26, v50, v60);

    dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
    TRILogCategory_Server();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v44 = objc_opt_class();
      -[TRIExperimentBaseTask experiment](v9, "experiment");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "shortDesc");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = *((int *)v82 + 6);
      if (v47 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *((int *)v82 + 6), v49);
        v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v48 = off_1E9335C08[v47];
      }
      *(_DWORD *)v86 = 138412802;
      v87 = v44;
      v88 = 2114;
      v89 = v46;
      v90 = 2114;
      v91 = v48;
      _os_log_debug_impl(&dword_1D207F000, v28, OS_LOG_TYPE_DEBUG, "finished %@ with experiment %{public}@ - %{public}@", v86, 0x20u);

    }
    trialSystemTelemetry = v9->_trialSystemTelemetry;
    if (!trialSystemTelemetry)
    {
      v30 = objc_opt_new();
      v31 = v9->_trialSystemTelemetry;
      v9->_trialSystemTelemetry = (TRITrialSystemTelemetry *)v30;

      trialSystemTelemetry = v9->_trialSystemTelemetry;
    }
    -[TRITrialSystemTelemetry setClientDeploymentEnv:](trialSystemTelemetry, "setClientDeploymentEnv:", v70[5]);
    if (v76[5])
    {
      v9->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:](TRICKNativeArtifactProvider, "isActivityDeferralError:");
      TRIFetchErrorParseToMetrics((void *)v76[5]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "count"))
      {
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v33 = v32;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v56, v85, 16);
        if (v34)
        {
          v35 = *(_QWORD *)v57;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v57 != v35)
                objc_enumerationMutation(v33);
              -[TRIExperimentBaseTask addMetric:](v9, "addMetric:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i));
            }
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v56, v85, 16);
          }
          while (v34);
        }

      }
    }
    v37 = *((unsigned int *)v82 + 6);
    -[TRIFetchExperimentTask _nextTasksForRunStatus:](v9, "_nextTasksForRunStatus:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v37, 0, v38, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(&v75, 8);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v81, 8);

LABEL_35:
    objc_sync_exit(v9);

    goto LABEL_36;
  }
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Skipping TRIFetchExperimentTask due to user opt-out of experiments", buf, 2u);
  }

  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 4, 0, MEMORY[0x1E0C9AA60], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:

  return v8;
}

void __56__TRIFetchExperimentTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  TRIUserCovariates *v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  const char *v45;
  NSObject *v46;
  uint32_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  TRIUserCovariates *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[128];
  uint8_t buf[4];
  id v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a2 != 4)
  {
    TRILogCategory_Server();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v68 = v11;
      _os_log_impl(&dword_1D207F000, v34, OS_LOG_TYPE_DEFAULT, "error: %{public}@", buf, 0xCu);
    }

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a4);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a5);
    goto LABEL_34;
  }
  if (!v9)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 2;
      TRIDeploymentEnvironment_EnumDescriptor();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "textFormatNameForValue:", objc_msgSend(*(id *)(a1 + 32), "deploymentEnvironment"));
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v38 = *(void **)(v37 + 40);
      *(_QWORD *)(v37 + 40) = v36;

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
      {
        v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), (int)objc_msgSend(*(id *)(a1 + 32), "deploymentEnvironment"));
        v40 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        v41 = *(void **)(v40 + 40);
        *(_QWORD *)(v40 + 40) = v39;

      }
      goto LABEL_34;
    }
    TRILogCategory_Server();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "experiment");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "shortDesc");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v44;
      _os_log_impl(&dword_1D207F000, v42, OS_LOG_TYPE_DEFAULT, "no experiment artifact received for %{public}@", buf, 0xCu);
      goto LABEL_30;
    }
    goto LABEL_33;
  }
  TRIDeploymentEnvironment_EnumDescriptor();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textFormatNameForValue:", objc_msgSend(v9, "deploymentEnvironment"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), (int)objc_msgSend(v9, "deploymentEnvironment"));
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
  objc_msgSend(v9, "experimentId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    TRILogCategory_Server();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "experiment");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "shortDesc");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v44;
      v45 = "artifact experiment id is nil in result for %{public}@";
      v46 = v42;
      v47 = 12;
LABEL_27:
      _os_log_error_impl(&dword_1D207F000, v46, OS_LOG_TYPE_ERROR, v45, buf, v47);
LABEL_30:

    }
LABEL_33:

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 3;
    goto LABEL_34;
  }
  objc_msgSend(*(id *)(a1 + 40), "experiment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "experimentDeployment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqualToDeployment:", v21);

  if ((v22 & 1) == 0)
  {
    TRILogCategory_Server();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "experiment");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "experimentDeployment");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v68 = v43;
      v69 = 2114;
      v70 = v44;
      v45 = "mismatch in experiment deployment: %{public}@ != %{public}@";
      v46 = v42;
      v47 = 22;
      goto LABEL_27;
    }
    goto LABEL_33;
  }
  objc_msgSend(*(id *)(a1 + 48), "experimentDatabase");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v9, "hasNamespacesAvailableForExperimentWithDatabase:", v23);

  if ((v24 & 1) == 0)
  {
    TRILogCategory_Server();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "experimentDeployment");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "shortDesc");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      TRICloudKitSupport_NotificationType_EnumDescriptor();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "textFormatNameForValue:", objc_msgSend(v9, "experimentType"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v68 = v56;
      v69 = 2112;
      v70 = v58;
      _os_log_error_impl(&dword_1D207F000, v42, OS_LOG_TYPE_ERROR, "No namespace available for deployment %{public}@ of type %@", buf, 0x16u);

    }
    goto LABEL_33;
  }
  objc_msgSend(*(id *)(a1 + 48), "namespaceDatabase");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[TRIUserCovariates initWithContext:]([TRIUserCovariates alloc], "initWithContext:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v9, "namespaces");
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
  v29 = v27;
  if (v28)
  {
    v30 = v28;
    v61 = v26;
    v31 = *(_QWORD *)v63;
LABEL_10:
    v32 = 0;
    while (1)
    {
      if (*(_QWORD *)v63 != v31)
        objc_enumerationMutation(v27);
      objc_msgSend(v25, "dynamicNamespaceRecordWithNamespaceName:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v32));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
        break;
      if (v30 == ++v32)
      {
        v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
        if (v30)
          goto LABEL_10;
        v29 = v27;
        v26 = v61;
        goto LABEL_37;
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "applicationBundleIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v61;
    if (!v29)
      goto LABEL_38;
    objc_msgSend(MEMORY[0x1E0DC0FB0], "dimensionWithName:value:", CFSTR("client_app_bundle_id"), v29);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addDimension:", v48);
    -[TRIUserCovariates tri_shortVersionStringForBundleId:](v61, "tri_shortVersionStringForBundleId:", v29);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC0FB0], "dimensionWithName:value:", CFSTR("client_app_version"), v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addDimension:", v50);

    v26 = v61;
  }
LABEL_37:

LABEL_38:
  objc_msgSend(*(id *)(a1 + 48), "experimentDatabase");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "paths");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v9, "saveWithDatabase:paths:", v51, v52);

  if ((v53 & 1) == 0)
  {
    TRILogCategory_Server();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "experiment");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "shortDesc");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v60;
      _os_log_error_impl(&dword_1D207F000, v54, OS_LOG_TYPE_ERROR, "could not save experiment %{public}@", buf, 0xCu);

    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }

LABEL_34:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExperimentId:", v5);

  -[TRIExperimentBaseTask experiment](self, "experiment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeploymentId:", objc_msgSend(v6, "deploymentId"));

  -[TRITaskAttributing asPersistedTaskAttribution](self->_taskAttributing, "asPersistedTaskAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskAttribution:", v7);

  objc_msgSend(v3, "setRetryCount:", -[TRIFetchExperimentTask retryCount](self, "retryCount"));
  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIFetchExperimentTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchExperimentTask.m"), 270, CFSTR("Unexpected failure to serialize %@"), v9);

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
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  const char *v20;
  objc_class *v21;
  objc_class *v22;
  objc_class *v23;
  objc_class *v24;
  void *v25;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  +[TRIPBMessage parseFromData:error:](TRIFetchExperimentPersistedTask, "parseFromData:error:", a3, &v27);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v27;
  if (!v3)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_25:
      v12 = 0;
      goto LABEL_26;
    }
    *(_DWORD *)buf = 138543362;
    v29 = v4;
    v14 = "Unable to parse buffer as TRIFetchExperimentPersistedTask: %{public}@";
    v15 = v8;
    v16 = 12;
LABEL_12:
    _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    goto LABEL_25;
  }
  if ((objc_msgSend(v3, "hasExperimentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v25;
      _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);

    }
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v19;
    v20 = "Cannot decode message of type %@ with missing field: experimentId";
    goto LABEL_23;
  }
  objc_msgSend(v3, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v19;
    v20 = "Cannot decode message of type %@ with field of length 0: experimentId";
LABEL_23:
    _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);

    goto LABEL_25;
  }
  if ((objc_msgSend(v3, "hasDeploymentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v19;
    v20 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_23;
  }
  if ((objc_msgSend(v3, "hasTaskAttribution") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v19;
    v20 = "Cannot decode message of type %@ with missing field: taskAttribution";
    goto LABEL_23;
  }
  if (objc_msgSend(v3, "deploymentId") == -1)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v14 = "TRIFetchExperimentPersistedTask encodes unspecified deploymentId.";
    v15 = v8;
    v16 = 2;
    goto LABEL_12;
  }
  objc_msgSend(v3, "taskAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:](TRITaskAttributionInternalInsecure, "taskAttributionFromPersistedTask:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0DC0A30]);
    objc_msgSend(v3, "experimentId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithExperimentId:deploymentId:", v10, objc_msgSend(v3, "deploymentId"));

    objc_msgSend((id)objc_opt_class(), "taskWithExperimentDeployment:taskAttributing:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "hasRetryCount"))
      v13 = objc_msgSend(v3, "retryCount");
    else
      v13 = 0;
    objc_msgSend(v12, "setRetryCount:", v13);
  }
  else
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    v12 = 0;
  }

LABEL_26:
  return v12;
}

- (unint64_t)requiredCapabilities
{
  void *v3;
  unint64_t v4;

  -[TRITaskAttributing networkOptions](self->_taskAttributing, "networkOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requiredCapability");

  if (-[TRIFetchExperimentTask retryCount](self, "retryCount"))
    return v4 | 4;
  else
    return v4;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortDesc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@,r:%d>"), v4, v6, -[TRIFetchExperimentTask retryCount](self, "retryCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)metrics
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIFetchExperimentTask;
  -[TRIExperimentBaseTask metrics](&v3, sel_metrics);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dimensions
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIFetchExperimentTask;
  -[TRIExperimentBaseTask dimensions](&v3, sel_dimensions);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)trialSystemTelemetry
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TRIFetchExperimentTask;
  -[TRIExperimentBaseTask trialSystemTelemetry](&v7, sel_trialSystemTelemetry);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = (void *)objc_opt_new();
  -[TRITaskAttributing teamIdentifier](self->_taskAttributing, "teamIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientTeamId:", v4);

  if (self->_trialSystemTelemetry)
    objc_msgSend(v3, "mergeFrom:");
  if ((objc_msgSend(v3, "hasContainerOriginFields") & 1) == 0)
  {
    +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:](TRITelemetryFactory, "containerOriginTelemetryForTaskAttribution:", self->_taskAttributing);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mergeFrom:", v5);

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFetchExperimentTask)initWithCoder:(id)a3
{
  id v4;
  TRIFetchExperimentTask *v5;
  void *v6;
  TRIFetchExperimentTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchExperimentTask;
  v5 = -[TRIFetchExperimentTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIFetchExperimentTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchExperimentTask.m"), 349, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIFetchExperimentTask serialize](self, "serialize");
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
  objc_storeStrong((id *)&self->_trialSystemTelemetry, 0);
  objc_storeStrong((id *)&self->_taskAttributing, 0);
}

@end
