@implementation TRIAssetPurger

- (TRIAssetPurger)initWithPaths:(id)a3 assetStore:(id)a4 purgeableNamespacesProvider:(id)a5 purgeableFactorPacksEnumerator:(id)a6 purgeableExperimentAndRolloutProvider:(id)a7 taskQueue:(id)a8 loggingClient:(id)a9
{
  id v16;
  id v17;
  TRIAssetPurger *v18;
  TRIAssetPurger *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)TRIAssetPurger;
  v18 = -[TRIAssetPurger init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_paths, a3);
    objc_storeStrong((id *)&v19->_assetStore, a4);
    objc_storeStrong((id *)&v19->_purgeableNamespacesProvider, a5);
    objc_storeStrong((id *)&v19->_purgeableFactorPacksEnumerator, a6);
    objc_storeStrong((id *)&v19->_purgeableExperimentAndRolloutProvider, a7);
    objc_storeStrong((id *)&v19->_taskQueue, a8);
    objc_storeStrong((id *)&v19->_loggingClient, a9);
  }

  return v19;
}

- (unint64_t)purgeableAssetSizeForPurgeabilityLevel:(int)a3
{
  uint64_t v3;
  void *v5;
  TRIPurgeableConstructs *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  TRIPurgeableExperimentAndRolloutProviding *purgeableExperimentAndRolloutProvider;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  TRIPurgeableExperimentAndRolloutProviding *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[8];
  _QWORD v33[4];
  id v34;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_opt_new();
  v6 = -[TRIPurgeableConstructs initWithPurgeabilityLevel:purgeableNamespacesProvider:paths:]([TRIPurgeableConstructs alloc], "initWithPurgeabilityLevel:purgeableNamespacesProvider:paths:", v3, self->_purgeableNamespacesProvider, self->_paths);
  v7 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __57__TRIAssetPurger_purgeableAssetSizeForPurgeabilityLevel___block_invoke;
  v33[3] = &unk_1E932F6C8;
  v8 = v5;
  v34 = v8;
  v9 = (void *)MEMORY[0x1D8232C48](v33);
  -[TRIAssetPurger _enumeratePurgeCandidatesForPurgeableConstructs:block:](self, "_enumeratePurgeCandidatesForPurgeableConstructs:block:", v6, v9);
  TRILogCategory_Server();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "Looking for regular purgeable factors.", buf, 2u);
  }

  purgeableExperimentAndRolloutProvider = self->_purgeableExperimentAndRolloutProvider;
  -[TRIPurgeableConstructs namespaceNamesPurgeableAtNamespaceLevel](v6, "namespaceNamesPurgeableAtNamespaceLevel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIPurgeableConstructs eagerPurgeableFactorsByNamespaceName](v6, "eagerPurgeableFactorsByNamespaceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIPurgeableConstructs cacheDeleteableFactorsByNamespaceName](v6, "cacheDeleteableFactorsByNamespaceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIPurgeableExperimentAndRolloutProviding purgeableExperimentAssetsFromNamespaces:eagerFactors:overriddenFactors:](purgeableExperimentAndRolloutProvider, "purgeableExperimentAssetsFromNamespaces:eagerFactors:overriddenFactors:", v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v7;
  v30[1] = 3221225472;
  v30[2] = __57__TRIAssetPurger_purgeableAssetSizeForPurgeabilityLevel___block_invoke_75;
  v30[3] = &unk_1E932F6F0;
  v16 = v8;
  v31 = v16;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v30);

  v17 = self->_purgeableExperimentAndRolloutProvider;
  -[TRIPurgeableConstructs namespaceNamesPurgeableAtNamespaceLevel](v6, "namespaceNamesPurgeableAtNamespaceLevel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIPurgeableConstructs eagerPurgeableFactorsByNamespaceName](v6, "eagerPurgeableFactorsByNamespaceName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIPurgeableConstructs cacheDeleteableFactorsByNamespaceName](v6, "cacheDeleteableFactorsByNamespaceName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIPurgeableExperimentAndRolloutProviding purgeableRolloutAssetsFromNamespaces:eagerFactors:overriddenFactors:](v17, "purgeableRolloutAssetsFromNamespaces:eagerFactors:overriddenFactors:", v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v7;
  v26 = 3221225472;
  v27 = __57__TRIAssetPurger_purgeableAssetSizeForPurgeabilityLevel___block_invoke_2;
  v28 = &unk_1E932F6F0;
  v29 = v16;
  v22 = v16;
  objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", &v25);

  v23 = -[TRIAssetStore removableAssetsSizeOlderThanNumScans:includedCacheDeletableAssetIds:](self->_assetStore, "removableAssetsSizeOlderThanNumScans:includedCacheDeletableAssetIds:", 0, v22, v25, v26, v27, v28);
  return v23;
}

void __57__TRIAssetPurger_purgeableAssetSizeForPurgeabilityLevel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v9);
        }
        else
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v9);

        }
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "unionSet:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

void __57__TRIAssetPurger_purgeableAssetSizeForPurgeabilityLevel___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v10);
  }
  else
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v6);

}

void __57__TRIAssetPurger_purgeableAssetSizeForPurgeabilityLevel___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v10);
  }
  else
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v6);

}

- (unint64_t)purgeAssetsForPurgeabilityLevel:(int)a3 requestedPurgeAmount:(int64_t)a4
{
  uint64_t v5;
  char v7;
  unint64_t v8;
  TRIPurgeableExperimentAndRolloutProviding *purgeableExperimentAndRolloutProvider;
  void *v10;
  void *v11;
  void *v12;
  TRIPurgeableExperimentAndRolloutProviding *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  dispatch_semaphore_t v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  TRITaskQueuing *taskQueue;
  void *v39;
  char v40;
  NSObject *v41;
  TRITaskQueuing *v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v50;
  TRITaskQueuing *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  TRITaskQueuing *v55;
  void *v56;
  void *v57;
  void *v58;
  TRIPurgeableConstructs *v59;
  uint64_t v60;
  _QWORD handler[4];
  NSObject *v62;
  int out_token;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[7];
  int v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  _BYTE v80[128];
  uint8_t v81[128];
  uint8_t buf[4];
  uint64_t v83;
  __int16 v84;
  int64_t v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = 0;
  if (a4)
  {
    v5 = *(_QWORD *)&a3;
    if (a3 == 2)
      v7 = 1;
    else
      v7 = 2;
    v75 = 0;
    -[TRIAssetStore collectGarbageOlderThanNumScans:deletedAssetSize:](self->_assetStore, "collectGarbageOlderThanNumScans:deletedAssetSize:", 0, &v75);
    v8 = v77[3] + v75;
    v77[3] = v8;
    if (v8 < a4)
    {
      v59 = -[TRIPurgeableConstructs initWithPurgeabilityLevel:purgeableNamespacesProvider:paths:]([TRIPurgeableConstructs alloc], "initWithPurgeabilityLevel:purgeableNamespacesProvider:paths:", v5, self->_purgeableNamespacesProvider, self->_paths);
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __71__TRIAssetPurger_purgeAssetsForPurgeabilityLevel_requestedPurgeAmount___block_invoke;
      v72[3] = &unk_1E932F718;
      v74 = v7;
      v72[4] = self;
      v72[5] = &v76;
      v72[6] = a4;
      v73 = v5;
      v58 = (void *)MEMORY[0x1D8232C48](v72);
      -[TRIAssetPurger _enumeratePurgeCandidatesForPurgeableConstructs:block:](self, "_enumeratePurgeCandidatesForPurgeableConstructs:block:", v59, v58);
      if (v77[3] >= (unint64_t)a4)
      {
        TRILogCategory_Server();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          v46 = v77[3];
          *(_DWORD *)buf = 134218240;
          v83 = v46;
          v84 = 2048;
          v85 = a4;
          _os_log_impl(&dword_1D207F000, v45, OS_LOG_TYPE_DEFAULT, "Found %llu bytes to purge. Cache delete only requested %llu so no need to look for regular assets to purge.", buf, 0x16u);
        }

        v8 = v77[3];
        goto LABEL_47;
      }
      purgeableExperimentAndRolloutProvider = self->_purgeableExperimentAndRolloutProvider;
      -[TRIPurgeableConstructs namespaceNamesPurgeableAtNamespaceLevel](v59, "namespaceNamesPurgeableAtNamespaceLevel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIPurgeableConstructs eagerPurgeableFactorsByNamespaceName](v59, "eagerPurgeableFactorsByNamespaceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIPurgeableConstructs cacheDeleteableFactorsByNamespaceName](v59, "cacheDeleteableFactorsByNamespaceName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIPurgeableExperimentAndRolloutProviding purgeableExperimentsFromNamespaces:eagerFactors:overriddenFactors:](purgeableExperimentAndRolloutProvider, "purgeableExperimentsFromNamespaces:eagerFactors:overriddenFactors:", v10, v11, v12);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = self->_purgeableExperimentAndRolloutProvider;
      -[TRIPurgeableConstructs namespaceNamesPurgeableAtNamespaceLevel](v59, "namespaceNamesPurgeableAtNamespaceLevel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIPurgeableConstructs eagerPurgeableFactorsByNamespaceName](v59, "eagerPurgeableFactorsByNamespaceName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIPurgeableConstructs cacheDeleteableFactorsByNamespaceName](v59, "cacheDeleteableFactorsByNamespaceName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIPurgeableExperimentAndRolloutProviding purgeableRolloutsFromNamespaces:eagerFactors:overriddenFactors:](v13, "purgeableRolloutsFromNamespaces:eagerFactors:overriddenFactors:", v14, v15, v16);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend(v57, "count");
        v19 = objc_msgSend(v56, "count");
        *(_DWORD *)buf = 134218240;
        v83 = v18;
        v84 = 2048;
        v85 = v19;
        _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "Found %lu experiments and %lu rollouts to deactivate in response to cache delete request.", buf, 0x16u);
      }

      if (objc_msgSend(v57, "count") || objc_msgSend(v56, "count"))
      {
        +[TRISequenceTask task](TRISequenceTask, "task");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v70 = 0u;
        v71 = 0u;
        v69 = 0u;
        v68 = 0u;
        v21 = v57;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v69;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v69 != v23)
                objc_enumerationMutation(v21);
              v25 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
              objc_msgSend(v25, "experimentId");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v26, objc_msgSend(v25, "deploymentId"), 1, 24, 0);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v20, "addTaskToEndOfSequence:", v27);
            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
          }
          while (v22);
        }

        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v28 = v56;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
        if (v29)
        {
          v30 = *(_QWORD *)v65;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v65 != v30)
                objc_enumerationMutation(v28);
              +[TRIDisenrollRolloutTask taskWithRolloutId:triggerEvent:](TRIDisenrollRolloutTask, "taskWithRolloutId:triggerEvent:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j), 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "addTaskToEndOfSequence:", v32);

            }
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
          }
          while (v29);
        }

        +[TRIMaintenanceTask task](TRIMaintenanceTask, "task");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addTaskToEndOfSequence:", v33);

        v34 = dispatch_semaphore_create(0);
        if (qword_1EFC74118 != -1)
          dispatch_once(&qword_1EFC74118, &__block_literal_global_0);
        v35 = MEMORY[0x1E0C809B0];
        v36 = (id)_MergedGlobals_30;
        out_token = 0;
        handler[0] = v35;
        handler[1] = 3221225472;
        handler[2] = __71__TRIAssetPurger_purgeAssetsForPurgeabilityLevel_requestedPurgeAmount___block_invoke_2;
        handler[3] = &unk_1E932F780;
        v37 = v34;
        v62 = v37;
        notify_register_dispatch("com.apple.trial.TaskQueueComplete", &out_token, v36, handler);
        taskQueue = self->_taskQueue;
        +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[TRITaskQueuing addTask:options:](taskQueue, "addTask:options:", v20, v39);

        if (v40 == 2)
        {
          TRILogCategory_Server();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D207F000, v41, OS_LOG_TYPE_ERROR, "Failed to queue cache delete deactivation tasks.", buf, 2u);
          }

        }
        v42 = self->_taskQueue;
        v43 = -[TRIRunningXPCActivityDescriptor initForImmediateWorkWithCapabilities:]([TRIRunningXPCActivityDescriptor alloc], "initForImmediateWorkWithCapabilities:", 0);
        -[TRITaskQueuing resumeWithXPCActivityDescriptor:executeWhenSuspended:](v42, "resumeWithXPCActivityDescriptor:executeWhenSuspended:", v43, 0);

        if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v37, 30.0))
        {
          TRILogCategory_Server();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D207F000, v44, OS_LOG_TYPE_DEFAULT, "Timeout while waiting for cache delete deactivation tasks to be completed.", buf, 2u);
          }

          -[TRIAssetPurger _logDeactivationsMetricWithConcludedInTime:](self, "_logDeactivationsMetricWithConcludedInTime:", 0);
        }
        else
        {
          TRILogCategory_Server();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D207F000, v47, OS_LOG_TYPE_DEFAULT, "Cache delete deactivation tasks completed successfuly. Starting garbage collection to remove newly unreferenced assets.", buf, 2u);
          }

          v60 = 0;
          -[TRIAssetStore collectGarbageOlderThanNumScans:deletedAssetSize:](self->_assetStore, "collectGarbageOlderThanNumScans:deletedAssetSize:", 0, &v60);
          TRILogCategory_Server();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v83 = v60;
            _os_log_impl(&dword_1D207F000, v48, OS_LOG_TYPE_DEFAULT, "Cache delete update: Purged %llu bytes from regular factors.", buf, 0xCu);
          }

          -[TRIAssetPurger _logDeactivationsMetricWithConcludedInTime:](self, "_logDeactivationsMetricWithConcludedInTime:", 1);
          v77[3] += v60;
        }

      }
      else
      {
        if ((_DWORD)v5 != 2)
          goto LABEL_46;
        TRILogCategory_Server();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D207F000, v50, OS_LOG_TYPE_DEFAULT, "Queuing maintenance task with no experiments or rollouts to deactivate.", buf, 2u);
        }

        v51 = self->_taskQueue;
        v52 = (void *)objc_opt_new();
        +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v51) = -[TRITaskQueuing addTask:options:](v51, "addTask:options:", v52, v53);

        if (v51 == 2)
        {
          TRILogCategory_Server();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D207F000, v54, OS_LOG_TYPE_ERROR, "Failed to queue maintenance task.", buf, 2u);
          }

        }
        v55 = self->_taskQueue;
        v20 = -[TRIRunningXPCActivityDescriptor initForImmediateWorkWithCapabilities:]([TRIRunningXPCActivityDescriptor alloc], "initForImmediateWorkWithCapabilities:", 0);
        -[TRITaskQueuing resumeWithXPCActivityDescriptor:executeWhenSuspended:](v55, "resumeWithXPCActivityDescriptor:executeWhenSuspended:", v20, 0);
      }

LABEL_46:
      v8 = v77[3];

LABEL_47:
    }
  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(&v76, 8);
  return v8;
}

void __71__TRIAssetPurger_purgeAssetsForPurgeabilityLevel_requestedPurgeAmount___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  TRIFactorPackStorage *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  TRIFBFactorPackStorage *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _BYTE *v35;
  void *v36;
  TRIClientTreatmentStorage *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  __CFString *v50;
  NSObject *v51;
  __CFString *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  __CFString *v58;
  void *v59;
  void *v60;
  _BYTE *v61;
  __CFString *v62;
  __CFString *v63;
  uint64_t v64;
  uint8_t buf[4];
  __CFString *v66;
  __int16 v67;
  __CFString *v68;
  __int16 v69;
  __CFString *v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "factorPackId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("factor pack");
  if (!v7)
    v8 = CFSTR("treatment");
  v9 = v8;

  objc_msgSend(v6, "factorPackId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v6, "treatmentId");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  TRILogCategory_Server();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "namespaceName");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "purgeableAssetFactorNames");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v66 = v9;
    v67 = 2114;
    v68 = v13;
    v69 = 2114;
    v70 = v15;
    v71 = 2048;
    v72 = objc_msgSend(v16, "count");
    _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "Found purgeable %@ %{public}@ for namespace %{public}@ with %lu purgeable factors", buf, 0x2Au);

  }
  objc_msgSend(v6, "purgeableAssetFactorNames");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    objc_msgSend(v6, "factorPackId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v63 = v13;
      v20 = -[TRIFactorPackStorage initWithPaths:]([TRIFactorPackStorage alloc], "initWithPaths:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(v6, "factorPackId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "namespaceName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "purgeableAssetFactorNames");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[TRIFactorPackStorage updateSavedFactorPackWithId:namespaceName:deletingAssetsWithFactorNames:inUseAssetBehavior:](v20, "updateSavedFactorPackWithId:namespaceName:deletingAssetsWithFactorNames:inUseAssetBehavior:", v21, v22, v23, *(unsigned __int8 *)(a1 + 60));

      if (_os_feature_enabled_impl())
      {
        v62 = v9;
        objc_msgSend(v6, "factorPackId");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "namespaceName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIFactorPackStorage pathForFactorPackWithId:namespaceName:](v20, "pathForFactorPackWithId:namespaceName:", v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "fileExistsAtPath:", v29))
        {
          v60 = v27;
          v61 = a4;
          v30 = -[TRIFBFactorPackStorage initWithPaths:]([TRIFBFactorPackStorage alloc], "initWithPaths:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
          objc_msgSend(v6, "factorPackId");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "namespaceName");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "purgeableAssetFactorNames");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v30;
          LOBYTE(v30) = -[TRIFBFactorPackStorage updateSavedFactorLevelsWithFactorPackId:namespaceName:deletingAssetsWithFactorNames:inUseAssetBehavior:](v30, "updateSavedFactorLevelsWithFactorPackId:namespaceName:deletingAssetsWithFactorNames:inUseAssetBehavior:", v31, v32, v33, *(unsigned __int8 *)(a1 + 60));

          if ((v30 & 1) == 0)
          {
            TRILogCategory_Server();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v6, "factorPackId");
              v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v66 = v58;
              _os_log_error_impl(&dword_1D207F000, v34, OS_LOG_TYPE_ERROR, "Flatbuffer Factor Storage: Not able to delete assets in FactorPack %@", buf, 0xCu);

            }
          }

          v27 = v60;
          a4 = v61;
        }

        v9 = v62;
      }
      v35 = a4;

      v13 = v63;
    }
    else
    {
      v35 = a4;
      v24 = 1;
    }
    objc_msgSend(v6, "treatmentId");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = -[TRIClientTreatmentStorage initWithPaths:]([TRIClientTreatmentStorage alloc], "initWithPaths:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(v6, "treatmentId");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "purgeableAssetFactorNames");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "namespaceName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIClientTreatmentStorage updateSavedTreatmentWithTreatmentId:deletingAssetsWithFactorNames:forNamespaceName:forRollouts:inUseAssetDeletionBehavior:](v37, "updateSavedTreatmentWithTreatmentId:deletingAssetsWithFactorNames:forNamespaceName:forRollouts:inUseAssetDeletionBehavior:", v38, v39, v40, 0, *(unsigned __int8 *)(a1 + 60));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v41)
        LOBYTE(v24) = 0;

      if ((v24 & 1) != 0)
        goto LABEL_24;
    }
    else if (v24)
    {
LABEL_24:
      TRILogCategory_Server();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "purgeableAssetFactorNames");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "count");
        *(_DWORD *)buf = 134218498;
        v66 = (__CFString *)v44;
        v67 = 2112;
        v68 = v9;
        v69 = 2114;
        v70 = v13;
        _os_log_impl(&dword_1D207F000, v42, OS_LOG_TYPE_DEFAULT, "Successfully removed %lu factors from %@ %{public}@", buf, 0x20u);

      }
      v45 = (void *)MEMORY[0x1E0DC0B20];
      objc_msgSend(v6, "namespaceName");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "notifyUpdateForNamespaceName:", v46);

      v64 = 0;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "collectGarbageOlderThanNumScans:deletedAssetSize:", 0, &v64);
      v47 = v64;
      if (!v64)
      {
        TRILogCategory_Server();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D207F000, v48, OS_LOG_TYPE_ERROR, "Running garbage collection after removing factors from factor pack did not result in any purged assets", buf, 2u);
        }

        v47 = v64;
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v47;
      TRILogCategory_Server();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = *(__CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        *(_DWORD *)buf = 134217984;
        v66 = v50;
        _os_log_impl(&dword_1D207F000, v49, OS_LOG_TYPE_DEFAULT, "Cache delete update: Purged %llu bytes so far", buf, 0xCu);
      }

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= *(_QWORD *)(a1 + 48))
      {
        TRILogCategory_Server();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = *(__CFString **)(a1 + 48);
          v53 = *(__CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          *(_DWORD *)buf = 134218240;
          v66 = v53;
          v67 = 2048;
          v68 = v52;
          _os_log_impl(&dword_1D207F000, v51, OS_LOG_TYPE_DEFAULT, "Found %llu bytes to purge. Cache delete only requested %llu so no need to continue purging.", buf, 0x16u);
        }

        *v35 = 1;
      }
      v54 = *(void **)(a1 + 32);
      objc_msgSend(v6, "purgeableAssetFactorNames");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "namespaceName");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "_logPurgedAssetWithFactorNames:namespaceName:purgeabilityLevel:", v55, v56, *(unsigned int *)(a1 + 56));

      goto LABEL_41;
    }
    TRILogCategory_Server();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v66 = v9;
      v67 = 2112;
      v68 = v13;
      _os_log_impl(&dword_1D207F000, v57, OS_LOG_TYPE_DEFAULT, "Not able to delete assets in %@ %@, moving on to next object", buf, 0x16u);
    }

  }
LABEL_41:

}

void __71__TRIAssetPurger_purgeAssetsForPurgeabilityLevel_requestedPurgeAmount___block_invoke_94()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.trial.status", 17);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_30;
  _MergedGlobals_30 = v1;

  objc_autoreleasePoolPop(v0);
}

intptr_t __71__TRIAssetPurger_purgeAssetsForPurgeabilityLevel_requestedPurgeAmount___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  TRILogCategory_Server();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D207F000, v2, OS_LOG_TYPE_DEFAULT, "Task queue completion notification received for cache delete deactivation tasks.", v4, 2u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_logPurgedAssetWithFactorNames:(id)a3 namespaceName:(id)a4 purgeabilityLevel:(int)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v22 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v20 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v12 = (void *)objc_opt_new();
        objc_msgSend(v12, "ensureOnDemandFactorFields");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setFactorName:", v11);
        objc_msgSend(v13, "setNamespaceName:", v22);
        objc_msgSend(v12, "ensureAssetPurgeFields");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPurgeabilityLevel:", objc_msgSend(MEMORY[0x1E0DC0F88], "assetPurgeFieldsPurgeabilityLevelFromPurgeabilityLevel:", a5));
        objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:", CFSTR("on_demand_assets_purged"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIClient logger](self->_loggingClient, "logger");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIClient trackingId](self->_loggingClient, "trackingId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v17, v18, 0, v12);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

}

- (void)_logDeactivationsMetricWithConcludedInTime:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("cache_delete_deactivations_concluded_in_time"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClient logger](self->_loggingClient, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClient trackingId](self->_loggingClient, "trackingId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v6, v7, 0, 0);

}

- (void)_enumeratePurgeCandidatesForPurgeableConstructs:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  TRIPurgeableOnDemandFactorsEnumerating *purgeableFactorPacksEnumerator;
  void *v20;
  TRIPurgeableOnDemandFactorsEnumerating *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __72__TRIAssetPurger__enumeratePurgeCandidatesForPurgeableConstructs_block___block_invoke;
  v27[3] = &unk_1E932F7A8;
  v28 = v7;
  v9 = v7;
  v10 = (void *)MEMORY[0x1D8232C48](v27);
  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "eagerPurgeableFactorsByNamespaceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = v8;
  v25[1] = 3221225472;
  v25[2] = __72__TRIAssetPurger__enumeratePurgeCandidatesForPurgeableConstructs_block___block_invoke_2;
  v25[3] = &unk_1E932F7D0;
  v15 = v6;
  v26 = v15;
  v16 = (void *)MEMORY[0x1D8232C48](v25);
  -[TRIPurgeableOnDemandFactorsEnumerating enumerateRolloutOnDemandFactorsPurgeCandidatesFromNamespaceNames:purgeableFactorFilterBlock:block:](self->_purgeableFactorPacksEnumerator, "enumerateRolloutOnDemandFactorsPurgeCandidatesFromNamespaceNames:purgeableFactorFilterBlock:block:", v14, v16, v10);
  -[TRIPurgeableOnDemandFactorsEnumerating enumerateExperimentOnDemandFactorsPurgeCandidatesFromNamespaceNames:purgeableFactorFilterBlock:block:](self->_purgeableFactorPacksEnumerator, "enumerateExperimentOnDemandFactorsPurgeCandidatesFromNamespaceNames:purgeableFactorFilterBlock:block:", v14, v16, v10);

  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __72__TRIAssetPurger__enumeratePurgeCandidatesForPurgeableConstructs_block___block_invoke_3;
  v23[3] = &unk_1E932F7D0;
  v24 = v15;
  v17 = v15;
  v18 = (void *)MEMORY[0x1D8232C48](v23);
  purgeableFactorPacksEnumerator = self->_purgeableFactorPacksEnumerator;
  objc_msgSend(v17, "namespaceNamesPurgeableAtNamespaceLevel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIPurgeableOnDemandFactorsEnumerating enumerateRolloutOnDemandFactorsPurgeCandidatesFromNamespaceNames:purgeableFactorFilterBlock:block:](purgeableFactorPacksEnumerator, "enumerateRolloutOnDemandFactorsPurgeCandidatesFromNamespaceNames:purgeableFactorFilterBlock:block:", v20, v18, v10);

  v21 = self->_purgeableFactorPacksEnumerator;
  objc_msgSend(v17, "namespaceNamesPurgeableAtNamespaceLevel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIPurgeableOnDemandFactorsEnumerating enumerateExperimentOnDemandFactorsPurgeCandidatesFromNamespaceNames:purgeableFactorFilterBlock:block:](v21, "enumerateExperimentOnDemandFactorsPurgeCandidatesFromNamespaceNames:purgeableFactorFilterBlock:block:", v22, v18, v10);

}

uint64_t __72__TRIAssetPurger__enumeratePurgeCandidatesForPurgeableConstructs_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__TRIAssetPurger__enumeratePurgeCandidatesForPurgeableConstructs_block___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "eagerPurgeableFactorsByNamespaceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "containsObject:", v6);
  return v9;
}

uint64_t __72__TRIAssetPurger__enumeratePurgeCandidatesForPurgeableConstructs_block___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "cacheDeleteableFactorsByNamespaceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v8, "containsObject:", v6);
  return v5 ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingClient, 0);
  objc_storeStrong((id *)&self->_assetStore, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_purgeableExperimentAndRolloutProvider, 0);
  objc_storeStrong((id *)&self->_purgeableFactorPacksEnumerator, 0);
  objc_storeStrong((id *)&self->_purgeableNamespacesProvider, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
