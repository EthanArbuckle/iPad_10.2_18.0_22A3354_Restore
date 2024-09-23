@implementation TRIDisenrollRolloutTask

- (TRIDisenrollRolloutTask)initWithRolloutId:(id)a3 triggerEvent:(unint64_t)a4
{
  id v8;
  TRIDisenrollRolloutTask *v9;
  TRIDisenrollRolloutTask *v10;
  NSObject *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _PASLock *lock;
  const __CFString *v18;
  void *v19;
  objc_super v20;
  uint8_t buf[4];
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDisenrollRolloutTask.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rolloutId"));

  }
  v20.receiver = self;
  v20.super_class = (Class)TRIDisenrollRolloutTask;
  v9 = -[TRIDisenrollRolloutTask init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rolloutId, a3);
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      if (a4 - 1 > 2)
        v18 = CFSTR("unknown");
      else
        v18 = off_1E93330F0[a4 - 1];
      *(_DWORD *)buf = 138412290;
      v22 = v18;
      _os_log_debug_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEBUG, "Initiating TRIDisenrollRolloutTask with trigger event: %@", buf, 0xCu);
    }

    v10->_triggerEvent = a4;
    v12 = (_QWORD *)objc_opt_new();
    v13 = (void *)v12[1];
    v12[1] = 0;

    v14 = (void *)v12[2];
    v12[2] = 0;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v12);
    lock = v10->_lock;
    v10->_lock = (_PASLock *)v15;

  }
  return v10;
}

+ (id)taskWithRolloutId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRolloutId:triggerEvent:", v4, 0);

  return v5;
}

+ (id)taskWithRolloutId:(id)a3 triggerEvent:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRolloutId:triggerEvent:", v6, a4);

  return v7;
}

- (int)taskType
{
  return 26;
}

- (NSArray)tags
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_rolloutId;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  unint64_t v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  TRITaskRunResult *v25;
  TRITaskRunResult *v26;
  uint64_t v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  TRIDisenrollRolloutTask *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a4;
  v81 = 0;
  v82 = &v81;
  v83 = 0x3032000000;
  v84 = __Block_byref_object_copy__23;
  v85 = __Block_byref_object_dispose__23;
  v86 = 0;
  v76 = 0;
  v77 = 0;
  v78 = &v77;
  v79 = 0x2020000000;
  v80 = 0;
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__23;
  v75 = __Block_byref_object_dispose__23;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__23;
  v69 = __Block_byref_object_dispose__23;
  v70 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__23;
  v63 = __Block_byref_object_dispose__23;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__23;
  v57 = __Block_byref_object_dispose__23;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__23;
  v51 = __Block_byref_object_dispose__23;
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  v52 = v7;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __57__TRIDisenrollRolloutTask_runUsingContext_withTaskQueue___block_invoke;
  v37[3] = &unk_1E9333030;
  v40 = &v77;
  v9 = v6;
  v38 = v9;
  v39 = self;
  v41 = &v53;
  v42 = &v59;
  v43 = &v71;
  v44 = &v47;
  v45 = &v65;
  v46 = &v81;
  v10 = (void *)MEMORY[0x1D8232C48](v37);
  objc_msgSend(v9, "rolloutDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "writeTransactionWithFailableBlock:", v10);

  if (*((_BYTE *)v78 + 24))
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v12 = (id)v82[5];
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v87, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(MEMORY[0x1E0DC0B20], "notifyUpdateForNamespaceName:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v87, 16);
      }
      while (v13);
    }

  }
  v16 = self->_triggerEvent - 1;
  if (v16 > 2)
    v17 = CFSTR("unknown");
  else
    v17 = off_1E93330F0[v16];
  objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:categoricalValue:", CFSTR("trigger_event"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIDisenrollRolloutTask addMetric:](self, "addMetric:", v18);

  if (*((_BYTE *)v78 + 24))
    v19 = 2;
  else
    v19 = 3;
  v20 = v66[5];
  if (*((_BYTE *)v78 + 24))
  {
    if (v20)
    {
      v21 = (void *)v48[5];
      v30[0] = v8;
      v30[1] = 3221225472;
      v30[2] = __57__TRIDisenrollRolloutTask_runUsingContext_withTaskQueue___block_invoke_39;
      v30[3] = &unk_1E9333058;
      v32 = &v65;
      v31 = v9;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v30);
      v22 = v31;
LABEL_21:

    }
  }
  else if (v20)
  {
    objc_msgSend((id)v54[5], "rolloutId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v72[5];
    v24 = objc_msgSend((id)v54[5], "deploymentId");
    LOBYTE(v28) = 0;
    +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 8, v22, v23, v24, v60[5], 0, 0, v66[5], v28, v9);
    goto LABEL_21;
  }
  v25 = [TRITaskRunResult alloc];
  v26 = -[TRITaskRunResult initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](v25, "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v19, 1, MEMORY[0x1E0C9AA60], 0);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);

  return v26;
}

uint64_t __57__TRIDisenrollRolloutTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  TRINamespaceResolverStorage *v28;
  void *v29;
  TRINamespaceResolverStorage *v30;
  unsigned __int8 *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v41;
  int v42;
  objc_class *v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "rolloutDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "deactivateDeploymentsWithRolloutId:deactivatedDeployment:deactivatedFactorPackSetId:deactivatedRampId:deactivationStateTransitions:usingTransaction:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)+ 40), v3);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      +[TRIContentTracker contentIdentifierForRolloutArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForRolloutArtifactWithDeployment:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "contentTracker");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "dropRefWithContentIdentifier:", v5);

      if ((v7 & 1) == 0)
      {
        TRILogCategory_Server();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "rolloutId");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "deploymentId");
          v43 = (objc_class *)objc_opt_class();
          NSStringFromClass(v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v47 = v41;
          v48 = 1024;
          v49 = v42;
          v50 = 2114;
          v51 = v44;
          _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Unable to decrement ref for rollout deployment: (r: %{public}@, d: %d) in %{public}@", buf, 0x1Cu);

        }
      }

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
        && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "activationEventDatabase");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "rolloutId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "activationEventRecordWithParentId:factorPackSetId:deploymentId:", v10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "deploymentId"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(v11, "osBuild");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setPrevOsBuild:", v13);

          objc_msgSend(v11, "regionCode");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setPrevRegionCode:", v14);

          objc_msgSend(v11, "languageCode");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setPrevLanguageCode:", v15);

          v16 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "languageCode");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "regionCode");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v11, "regionCode");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringWithFormat:", CFSTR("%@-%@"), v17, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v16, "stringWithFormat:", CFSTR("%@-%@"), v17, &stru_1E9336E60);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend(v12, "setPrevBcp47DeviceLocale:", v20);
          objc_msgSend(v11, "carrierBundleIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setPrevCarrierBundleIdentifier:", v22);

          objc_msgSend(v11, "carrierCountryIsoCode");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setPrevCarrierCountryIsoCode:", v23);

          objc_msgSend(*(id *)(a1 + 40), "mergeTelemetry:", v12);
          objc_msgSend(*(id *)(a1 + 32), "activationEventDatabase");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "rolloutId");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "deleteRecordWithParentId:factorPackSetId:deploymentId:", v25, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "deploymentId"));

          if (!v26)
          {
            TRILogCategory_Server();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "rolloutId");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v47 = v45;
              _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Unable to clear record for dis-enrolled rollout: %{public}@", buf, 0xCu);

            }
          }

        }
      }
    }
    v28 = [TRINamespaceResolverStorage alloc];
    objc_msgSend(*(id *)(a1 + 32), "paths");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[TRINamespaceResolverStorage initWithPaths:](v28, "initWithPaths:", v29);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[TRINamespaceResolverStorage overwriteActiveFactorProvidersUsingTransaction:fromContext:](v30, "overwriteActiveFactorProvidersUsingTransaction:fromContext:", v3, *(_QWORD *)(a1 + 32));
    v31 = (unsigned __int8 *)MEMORY[0x1E0D81680];
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "rolloutDatabase");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "recordWithDeployment:usingTransaction:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v3);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        v35 = *(void **)(v34 + 40);
        *(_QWORD *)(v34 + 40) = v33;

        v36 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
        if (v36)
        {
          objc_msgSend(v36, "namespaces");
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
          v39 = *(void **)(v38 + 40);
          *(_QWORD *)(v38 + 40) = v37;

        }
      }
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        v31 = (unsigned __int8 *)MEMORY[0x1E0D81678];
    }
    v21 = *v31;

  }
  else
  {
    v21 = *MEMORY[0x1E0D81680];
  }

  return v21;
}

void __57__TRIDisenrollRolloutTask_runUsingContext_withTaskQueue___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v5 = a2;
  v6 = objc_msgSend(v15, "isEqualToString:", CFSTR("obsoleted-unknown-previous-state"));
  objc_msgSend(v5, "deployment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rolloutId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rampId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deployment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "deploymentId");
  if (v6)
  {
    objc_msgSend(v5, "targetedFactorPackSetId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "namespaces");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v14) = 1;
    +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 4, v8, v9, v11, v12, v13, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v14, *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v5, "activeFactorPackSetId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "namespaces");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v14) = 0;
    +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 4, v8, v9, v11, v12, v13, v15, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v14, *(_QWORD *)(a1 + 32));
  }

}

- (BOOL)isEqual:(id)a3
{
  TRIDisenrollRolloutTask *v4;
  BOOL v5;
  objc_super v7;

  v4 = (TRIDisenrollRolloutTask *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TRIDisenrollRolloutTask;
    v5 = -[TRIBaseTask isEqual:](&v7, sel_isEqual_, v4)
      && -[TRIDisenrollRolloutTask isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
      && -[NSString isEqualToString:](self->_rolloutId, "isEqualToString:", v4->_rolloutId);
  }

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TRIDisenrollRolloutTask;
  v3 = -[TRIBaseTask hash](&v5, sel_hash);
  return -[NSString hash](self->_rolloutId, "hash") + 37 * v3;
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
  v7[2] = __37__TRIDisenrollRolloutTask_addMetric___block_invoke;
  v7[3] = &unk_1E9333080;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __37__TRIDisenrollRolloutTask_addMetric___block_invoke(uint64_t a1, _QWORD *a2)
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
  v7[2] = __42__TRIDisenrollRolloutTask_mergeTelemetry___block_invoke;
  v7[3] = &unk_1E9333080;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __42__TRIDisenrollRolloutTask_mergeTelemetry___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v6 = a2;
  v3 = (void *)v6[2];
  if (v3)
  {
    objc_msgSend(v3, "mergeFrom:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v5 = (void *)v6[2];
    v6[2] = v4;

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
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  lock = self->_lock;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__TRIDisenrollRolloutTask_metrics__block_invoke;
  v5[3] = &unk_1E93330A8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__TRIDisenrollRolloutTask_metrics__block_invoke(uint64_t a1, uint64_t a2)
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

- (id)trialSystemTelemetry
{
  void *v3;
  _PASLock *lock;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = (void *)MEMORY[0x1D8232A5C](self, a2);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__23;
  v12 = __Block_byref_object_dispose__23;
  v13 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__TRIDisenrollRolloutTask_trialSystemTelemetry__block_invoke;
  v7[3] = &unk_1E93330D0;
  v7[4] = self;
  v7[5] = &v8;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  v5 = (void *)objc_msgSend((id)v9[5], "copy");
  _Block_object_dispose(&v8, 8);

  objc_autoreleasePoolPop(v3);
  return v5;
}

void __47__TRIDisenrollRolloutTask_trialSystemTelemetry__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;

  v12 = a2;
  v3 = (void *)v12[2];
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = v3;
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DC0FA8]);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }

  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(*(_QWORD *)(v9 + 8) + 40), "ensureRolloutFields");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClientRolloutId:", v10);

}

- (id)dimensions
{
  return 0;
}

- (id)_asPersistedTask
{
  void *v3;
  unint64_t triggerEvent;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setRolloutId:", self->_rolloutId);
  triggerEvent = self->_triggerEvent;
  if (triggerEvent <= 3)
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

  -[TRIDisenrollRolloutTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDisenrollRolloutTask.m"), 309, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
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
  +[TRIPBMessage parseFromData:error:](TRIDisenrollRolloutPersistedTask, "parseFromData:error:", a3, &v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v20;
  if (!v4)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v5;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIDisenrollRolloutPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_15;
  }
  if ((objc_msgSend(v4, "hasRolloutId") & 1) == 0)
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
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: rolloutId", buf, 0xCu);

    }
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v14;
    v15 = "Cannot decode message of type %@ with missing field: rolloutId";
    goto LABEL_18;
  }
  objc_msgSend(v4, "rolloutId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_15:
      v11 = 0;
      goto LABEL_16;
    }
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v14;
    v15 = "Cannot decode message of type %@ with field of length 0: rolloutId";
LABEL_18:
    _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);

    goto LABEL_15;
  }
  v8 = objc_msgSend(v4, "triggerEvent") - 2;
  if (v8 < 3)
    v9 = v8 + 1;
  else
    v9 = 0;
  objc_msgSend(v4, "rolloutId");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "taskWithRolloutId:triggerEvent:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v11;
}

- (unint64_t)requiredCapabilities
{
  return 0;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%@>"), objc_opt_class(), self->_rolloutId);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIDisenrollRolloutTask)initWithCoder:(id)a3
{
  id v4;
  TRIDisenrollRolloutTask *v5;
  void *v6;
  TRIDisenrollRolloutTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIDisenrollRolloutTask;
  v5 = -[TRIDisenrollRolloutTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIDisenrollRolloutTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDisenrollRolloutTask.m"), 353, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIDisenrollRolloutTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_rolloutId, 0);
}

@end
