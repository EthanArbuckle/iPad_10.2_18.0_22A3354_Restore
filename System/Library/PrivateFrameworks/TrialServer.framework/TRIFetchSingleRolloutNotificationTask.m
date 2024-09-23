@implementation TRIFetchSingleRolloutNotificationTask

- (int)taskType
{
  return 19;
}

- (NSArray)tags
{
  void *v3;
  void *v4;
  void *v5;

  -[TRIRolloutTaskSupport tags](self->_support, "tags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  +[TRITaskUtils addAttribution:toTaskTags:](TRITaskUtils, "addAttribution:toTaskTags:", self->_taskAttributing, v5);
  return (NSArray *)v5;
}

- (TRIFetchSingleRolloutNotificationTask)initWithDeployment:(id)a3 taskAttributing:(id)a4
{
  id v8;
  id v9;
  void *v10;
  TRIFetchSingleRolloutNotificationTask *v11;
  TRIFetchSingleRolloutNotificationTask *v12;
  TRIRolloutTaskSupport *v13;
  TRIRolloutTaskSupport *support;
  void *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchSingleRolloutNotificationTask.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchSingleRolloutNotificationTask.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskAttributing"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)TRIFetchSingleRolloutNotificationTask;
  v11 = -[TRIFetchSingleRolloutNotificationTask init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_deployment, a3);
    objc_storeStrong((id *)&v12->_taskAttributing, a4);
    v13 = -[TRIRolloutTaskSupport initWithRolloutDeployment:]([TRIRolloutTaskSupport alloc], "initWithRolloutDeployment:", v8);
    support = v12->_support;
    v12->_support = v13;

    +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:](TRITelemetryFactory, "containerOriginTelemetryForTaskAttribution:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIRolloutTaskSupport mergeTelemetry:](v12->_support, "mergeTelemetry:", v15);

  }
  return v12;
}

+ (id)taskWithDeployment:(id)a3 taskAttributing:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDeployment:taskAttributing:", v7, v6);

  return v8;
}

- (void)runEnqueueHandlerUsingContext:(id)a3
{
  TRIRolloutDeployment *deployment;
  id v4;
  void *v5;
  id v6;

  deployment = self->_deployment;
  v4 = a3;
  +[TRIContentTracker contentIdentifierForRolloutArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForRolloutArtifactWithDeployment:", deployment);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentTracker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addRefWithContentIdentifier:", v6);
}

- (void)runDequeueHandlerUsingContext:(id)a3
{
  TRIRolloutDeployment *deployment;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  deployment = self->_deployment;
  v5 = a3;
  +[TRIContentTracker contentIdentifierForRolloutArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForRolloutArtifactWithDeployment:", deployment);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentTracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v7, "dropRefWithContentIdentifier:", v6);
  if ((v5 & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[TRIRolloutDeployment shortDesc](self->_deployment, "shortDesc");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for rollout %{public}@", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6;
  id v7;
  TRIFetchSingleRolloutNotificationTask *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  TRITaskRunResult *v15;
  TRITaskRunResult *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  TRIRolloutTaskSupport *support;
  void *v28;
  void *v29;
  void *v30;
  dispatch_semaphore_t v31;
  NSObject *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  int v37;
  TRIRolloutDeployment *deployment;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  NSObject *v50;
  id v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  __CFString *v57;
  NSObject *v58;
  TRIFetchOptions *v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[5];
  id v67;
  NSObject *v68;
  uint64_t *v69;
  _BYTE *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  int v81;
  uint8_t v82[128];
  uint8_t v83[4];
  id v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  __CFString *v88;
  _BYTE buf[24];
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = os_transaction_create();
  TRILogCategory_Server();
  v10 = objc_claimAutoreleasedReturnValue();
  v60 = v7;
  v61 = (void *)v9;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v52 = (id)objc_opt_class();
    -[TRIRolloutDeployment shortDesc](v8->_deployment, "shortDesc");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v52;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v53;
    _os_log_debug_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEBUG, "starting %{public}@ with rollout %{public}@", buf, 0x16u);

  }
  objc_msgSend(v6, "rolloutDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordWithDeployment:usingTransaction:", v8->_deployment, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v6, "keyValueStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIFetchDateManager managerWithKeyValueStore:](TRIFetchDateManager, "managerWithKeyValueStore:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "namespaceDatabase");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paths");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "namespaceDescriptorsDefaultDir");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:](TRINamespaceDescriptorProvider, "providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = -[TRITaskAttributing triCloudKitContainer](v8->_taskAttributing, "triCloudKitContainer");
    -[TRITaskAttributing teamIdentifier](v8->_taskAttributing, "teamIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRITaskAttributing applicationBundleIdentifier](v8->_taskAttributing, "applicationBundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:](TRICKNativeArtifactProvider, "providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:", v23, v24, v25, v18, v22, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[TRITaskAttributing networkOptions](v8->_taskAttributing, "networkOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "allowsCellularAccess"))
    {
      support = v8->_support;
      objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("allows_cellular_download"), objc_msgSend(v26, "allowsCellularAccess"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIRolloutTaskSupport addMetric:](support, "addMetric:", v28);

    }
    if (objc_msgSend(v26, "discretionaryBehavior"))
    {
      -[TRIBaseTask stateProvider](v8, "stateProvider");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "activeActivityGrantingCapability:", objc_msgSend(v26, "requiredCapability"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        TRILogCategory_Server();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D207F000, v50, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", buf, 2u);
        }

        +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 1, 1, MEMORY[0x1E0C9AA60], 0);
        v16 = (TRITaskRunResult *)objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      objc_msgSend(v26, "setActivity:", v30);

    }
    v59 = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:]([TRIFetchOptions alloc], "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v26, &unk_1E9363AF8);
    v31 = dispatch_semaphore_create(0);
    v78 = 0;
    v79 = &v78;
    v80 = 0x2020000000;
    v81 = 2;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v90 = __Block_byref_object_copy__16;
    v91 = __Block_byref_object_dispose__16;
    v92 = 0;
    v72 = 0;
    v73 = &v72;
    v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__16;
    v76 = __Block_byref_object_dispose__16;
    v77 = 0;
    TRILogCategory_Server();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_signpost_id_generate(v32);

    TRILogCategory_Server();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      -[TRIRolloutDeployment rolloutId](v8->_deployment, "rolloutId");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[TRIRolloutDeployment deploymentId](v8->_deployment, "deploymentId");
      *(_DWORD *)v83 = 138543618;
      v84 = v36;
      v85 = 1024;
      LODWORD(v86) = v37;
      _os_signpost_emit_with_name_impl(&dword_1D207F000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "FetchRolloutNotificationWithDeployment", "r: %{public}@, d: %d", v83, 0x12u);

    }
    deployment = v8->_deployment;
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __71__TRIFetchSingleRolloutNotificationTask_runUsingContext_withTaskQueue___block_invoke;
    v66[3] = &unk_1E9331C10;
    v66[4] = v8;
    v69 = &v78;
    v70 = buf;
    v71 = &v72;
    v67 = v6;
    v39 = v31;
    v68 = v39;
    objc_msgSend(v12, "fetchRolloutNotificationWithDeployment:options:completion:", deployment, v59, v66);
    dispatch_semaphore_wait(v39, 0xFFFFFFFFFFFFFFFFLL);
    TRILogCategory_Server();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      -[TRIRolloutDeployment rolloutId](v8->_deployment, "rolloutId");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[TRIRolloutDeployment deploymentId](v8->_deployment, "deploymentId");
      *(_DWORD *)v83 = 138543618;
      v84 = v42;
      v85 = 1024;
      LODWORD(v86) = v43;
      _os_signpost_emit_with_name_impl(&dword_1D207F000, v41, OS_SIGNPOST_INTERVAL_END, v33, "FetchRolloutNotificationWithDeployment", "r: %{public}@, d: %d", v83, 0x12u);

    }
    TRILogCategory_Server();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      v54 = (id)objc_opt_class();
      -[TRIRolloutDeployment shortDesc](v8->_deployment, "shortDesc");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = *((int *)v79 + 6);
      if (v56 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *((int *)v79 + 6));
        v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v57 = off_1E9331C30[v56];
      }
      *(_DWORD *)v83 = 138543874;
      v84 = v54;
      v85 = 2114;
      v86 = v55;
      v87 = 2114;
      v88 = v57;
      _os_log_debug_impl(&dword_1D207F000, v44, OS_LOG_TYPE_DEBUG, "Finished %{public}@ with rollout %{public}@: %{public}@", v83, 0x20u);

    }
    if (v73[5])
    {
      v8->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:](TRICKNativeArtifactProvider, "isActivityDeferralError:");
      TRIFetchErrorParseToMetrics((void *)v73[5]);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v45, "count"))
      {
        v58 = v39;
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v46 = v45;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
        if (v47)
        {
          v48 = *(_QWORD *)v63;
          do
          {
            for (i = 0; i != v47; ++i)
            {
              if (*(_QWORD *)v63 != v48)
                objc_enumerationMutation(v46);
              -[TRIRolloutTaskSupport addMetric:](v8->_support, "addMetric:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i));
            }
            v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
          }
          while (v47);
        }

        v39 = v58;
      }

    }
    +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", *((unsigned int *)v79 + 6), 1, MEMORY[0x1E0C9AA60], *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v16 = (TRITaskRunResult *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v72, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v78, 8);
LABEL_34:

    goto LABEL_35;
  }
  TRILogCategory_Server();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[TRIRolloutDeployment shortDesc](v8->_deployment, "shortDesc");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v14;
    _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Skipping CloudKit fetch of rollout notification for %{public}@: already present.", buf, 0xCu);

  }
  v15 = [TRITaskRunResult alloc];
  v16 = -[TRITaskRunResult initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](v15, "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 2, 0, MEMORY[0x1E0C9AA60], 0);
LABEL_35:

  objc_sync_exit(v8);
  return v16;
}

void __71__TRIFetchSingleRolloutNotificationTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  TRIRolloutRecord *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  TRIRolloutRecord *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a2 == 4)
  {
    if (v9)
    {
      objc_msgSend(v9, "rollout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "hasRampId"))
      {
        objc_msgSend(v9, "rollout");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "rampId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        TRIValidateRampId();
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15 || !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
          goto LABEL_15;
        v12 = (void *)objc_opt_new();
        objc_msgSend(v12, "ensureRolloutFields");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setClientRampId:", v15);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "mergeTelemetry:", v12);
      }
      else
      {
        v15 = 0;
      }

LABEL_15:
      v21 = [TRIRolloutRecord alloc];
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      objc_msgSend(v9, "namespaceNames");
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "rollout");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v29) = objc_msgSend(v24, "hasShadowEvaluation");
      v25 = -[TRIRolloutRecord initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:](v21, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:", v22, v15, 0, 0, 0, 0, 0, v23, v29, v9);

      objc_msgSend(*(id *)(a1 + 40), "rolloutDatabase");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v23) = objc_msgSend(v26, "addNewRolloutWithRecord:", v25);

      if ((v23 & 1) == 0)
      {
        TRILogCategory_Server();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "shortDesc");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v31 = v28;
          _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Unexpected conflict when saving rollout to database: %{public}@", buf, 0xCu);

        }
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 3;
      }

      goto LABEL_20;
    }
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "shortDesc");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v20;
      _os_log_impl(&dword_1D207F000, v19, OS_LOG_TYPE_DEFAULT, "No valid and compatible rollout artifact was received for %{public}@.", buf, 0xCu);

    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 3;
  }
  else
  {
    TRILogCategory_Server();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "shortDesc");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v18;
      v32 = 2114;
      v33 = v11;
      _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "Unable to fetch rollout notification %{public}@: %{public}@", buf, 0x16u);

    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a4);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a5);
  }
LABEL_20:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (BOOL)isEqual:(id)a3
{
  TRIFetchSingleRolloutNotificationTask *v4;
  TRIFetchSingleRolloutNotificationTask *v5;
  char v6;
  objc_super v8;

  v4 = (TRIFetchSingleRolloutNotificationTask *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TRIFetchSingleRolloutNotificationTask;
    if (-[TRIBaseTask isEqual:](&v8, sel_isEqual_, v4)
      && -[TRIFetchSingleRolloutNotificationTask isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      if (-[TRIRolloutDeployment isEqualToDeployment:](self->_deployment, "isEqualToDeployment:", v5->_deployment))v6 = -[TRITaskAttributing isEqual:](self->_taskAttributing, "isEqual:", v5->_taskAttributing);
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
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TRIFetchSingleRolloutNotificationTask;
  v3 = -[TRIBaseTask hash](&v6, sel_hash);
  v4 = -[TRIRolloutDeployment hash](self->_deployment, "hash") + 37 * v3;
  return -[TRITaskAttributing hash](self->_taskAttributing, "hash") + 37 * v4;
}

- (id)dimensions
{
  return -[TRIRolloutTaskSupport dimensions](self->_support, "dimensions");
}

- (id)metrics
{
  return -[TRIRolloutTaskSupport metrics](self->_support, "metrics");
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

  v3 = (void *)objc_opt_new();
  -[TRIRolloutDeployment rolloutId](self->_deployment, "rolloutId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRolloutId:", v4);

  objc_msgSend(v3, "setDeploymentId:", -[TRIRolloutDeployment deploymentId](self->_deployment, "deploymentId"));
  -[TRITaskAttributing asPersistedTaskAttribution](self->_taskAttributing, "asPersistedTaskAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskAttribution:", v5);

  objc_msgSend(v3, "setRetryCount:", -[TRIFetchSingleRolloutNotificationTask retryCount](self, "retryCount"));
  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIFetchSingleRolloutNotificationTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchSingleRolloutNotificationTask.m"), 278, CFSTR("Unexpected failure to serialize %@"), v9);

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
  NSObject *v13;
  objc_class *v14;
  void *v15;
  const char *v16;
  objc_class *v17;
  objc_class *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  +[TRIPBMessage parseFromData:error:](TRIFetchSingleRolloutNotificationPersistedTask, "parseFromData:error:", a3, &v24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v24;
  if (!v3)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v4;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIFetchSingleRolloutNotificationPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_24;
  }
  if ((objc_msgSend(v3, "hasRolloutId") & 1) == 0)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v23;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: rolloutId", buf, 0xCu);

    }
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v15;
    v16 = "Cannot decode message of type %@ with missing field: rolloutId";
    goto LABEL_23;
  }
  objc_msgSend(v3, "rolloutId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v15;
    v16 = "Cannot decode message of type %@ with field of length 0: rolloutId";
LABEL_23:
    _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);

    goto LABEL_24;
  }
  if ((objc_msgSend(v3, "hasDeploymentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v15;
    v16 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_23;
  }
  if ((objc_msgSend(v3, "hasTaskAttribution") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v15;
    v16 = "Cannot decode message of type %@ with missing field: taskAttribution";
    goto LABEL_23;
  }
  if ((objc_msgSend(v3, "hasRetryCount") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v15;
      v16 = "Cannot decode message of type %@ with missing field: retryCount";
      goto LABEL_23;
    }
LABEL_24:
    v12 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v3, "taskAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:](TRITaskAttributionInternalInsecure, "taskAttributionFromPersistedTask:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0DC0B60]);
    objc_msgSend(v3, "rolloutId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithRolloutId:deploymentId:", v10, objc_msgSend(v3, "deploymentId"));

    objc_msgSend((id)objc_opt_class(), "taskWithDeployment:taskAttributing:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRetryCount:", objc_msgSend(v3, "retryCount"));
  }
  else
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    v12 = 0;
  }

LABEL_25:
  return v12;
}

- (unint64_t)requiredCapabilities
{
  void *v3;
  unint64_t v4;

  -[TRITaskAttributing networkOptions](self->_taskAttributing, "networkOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requiredCapability");

  if (-[TRIFetchSingleRolloutNotificationTask retryCount](self, "retryCount"))
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TRIRolloutDeployment shortDesc](self->_deployment, "shortDesc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@,r:%d>"), v4, v5, -[TRIFetchSingleRolloutNotificationTask retryCount](self, "retryCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFetchSingleRolloutNotificationTask)initWithCoder:(id)a3
{
  id v4;
  TRIFetchSingleRolloutNotificationTask *v5;
  void *v6;
  TRIFetchSingleRolloutNotificationTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchSingleRolloutNotificationTask;
  v5 = -[TRIFetchSingleRolloutNotificationTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIFetchSingleRolloutNotificationTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchSingleRolloutNotificationTask.m"), 322, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIFetchSingleRolloutNotificationTask serialize](self, "serialize");
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
  objc_storeStrong((id *)&self->_support, 0);
  objc_storeStrong((id *)&self->_taskAttributing, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
}

@end
