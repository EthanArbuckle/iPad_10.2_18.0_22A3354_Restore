@implementation TRILimitedCarryProfileManager

- (TRILimitedCarryProfileManager)initWithTaskQueue:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  TRILimitedCarryProfileManager *v9;
  NSObject *v10;
  uint64_t v11;
  OS_dispatch_queue *profileProcessingQueue;
  TRILimitedCarryProfileManager *v13;
  TRILimitedCarryProfileManager *v14;
  TRILimitedCarryProfileManager *v15;
  _PASSimpleCoalescingTimer *v16;
  _PASSimpleCoalescingTimer *checkForUpdates;
  void *v18;
  void *v20;
  _QWORD block[4];
  TRILimitedCarryProfileManager *v22;
  uint8_t buf[16];
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)TRILimitedCarryProfileManager;
  v9 = -[TRILimitedCarryProfileManager init](&v24, sel_init);
  if (v9)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "Initializing profile connection observer", buf, 2u);
    }

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("TRILimitedCarryProfileManager.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskQueue"));

    }
    objc_storeWeak((id *)&v9->_taskQueue, v7);
    objc_storeWeak((id *)&v9->_context, v8);
    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.trial.profile-updates-timeout-coalesce", 17);
    v11 = objc_claimAutoreleasedReturnValue();
    profileProcessingQueue = v9->_profileProcessingQueue;
    v9->_profileProcessingQueue = (OS_dispatch_queue *)v11;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__TRILimitedCarryProfileManager_initWithTaskQueue_context___block_invoke;
    block[3] = &unk_1E932F918;
    v13 = v9;
    v14 = v13;
    v22 = v13;
    if (qword_1EFC74498 == -1)
    {
      v15 = v13;
    }
    else
    {
      dispatch_once(&qword_1EFC74498, block);
      v15 = v22;
    }
    v16 = (_PASSimpleCoalescingTimer *)(id)_MergedGlobals_46;

    checkForUpdates = v14->_checkForUpdates;
    v14->_checkForUpdates = v16;

    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerObserver:", v14);

  }
  return v9;
}

void __59__TRILimitedCarryProfileManager_initWithTaskQueue_context___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  _QWORD *v9;

  v2 = (void *)MEMORY[0x1D8232A5C]();
  v3 = objc_alloc(MEMORY[0x1E0D81618]);
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[3];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__TRILimitedCarryProfileManager_initWithTaskQueue_context___block_invoke_2;
  v8[3] = &unk_1E932F918;
  v9 = v4;
  v6 = objc_msgSend(v3, "initWithQueue:operation:", v5, v8);

  v7 = (void *)_MergedGlobals_46;
  _MergedGlobals_46 = v6;

  objc_autoreleasePoolPop(v2);
}

uint64_t __59__TRILimitedCarryProfileManager_initWithTaskQueue_context___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  TRILogCategory_Server();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D207F000, v2, OS_LOG_TYPE_DEFAULT, "Missed profile connection observer notification, checking profiles now", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_gatherProfileUpdatesAndScheduleRelatedTasks");
}

- (void)processLaunchEvent
{
  OS_os_transaction *v3;
  OS_os_transaction *txn;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (OS_os_transaction *)os_transaction_create();
  txn = self->_txn;
  self->_txn = v3;

  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Created transaction for Limited Carry manager", v6, 2u);
  }

  -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_checkForUpdates, "runAfterDelaySeconds:coalescingBehavior:", 1, 2.0);
}

- (id)_limitedCarryExperiments
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  os_log_t log;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  NSObject *v42;
  __int16 v43;
  NSObject *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorAtPath:", CFSTR("/private/var/Managed Preferences/mobile/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (id)objc_opt_new();
  v4 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v3, "nextObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    v7 = 0x1E0C99000uLL;
    while (!-[NSObject containsString:](v6, "containsString:", CFSTR("com.apple.internal.trial.limitedcarry"), log))
    {
LABEL_35:

      objc_autoreleasePoolPop(v4);
      v4 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v3, "nextObject");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_38;
    }
    v8 = *(void **)(v7 + 3736);
    objc_msgSend(CFSTR("/private/var/Managed Preferences/mobile/"), "stringByAppendingPathComponent:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPath:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0C99D80]);
    v40 = 0;
    v12 = (void *)objc_msgSend(v11, "initWithContentsOfURL:error:", v10, &v40);
    v13 = v40;
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v12)
      v16 = v13 == 0;
    else
      v16 = 0;
    if (!v16)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v42 = v6;
        v43 = 2112;
        v44 = v10;
        v45 = 2112;
        v46 = v13;
        _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Issue reading managed preferences for profile %@ at %@: %@", buf, 0x20u);
      }
      goto LABEL_33;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v6;
      _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "Found relevant managed preferences file: %@", buf, 0xCu);
    }

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Experiment"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_34;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Experiment"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ExperimentID"));
    v15 = objc_claimAutoreleasedReturnValue();

    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      TRILogCategory_Server();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v42 = v6;
        v43 = 2112;
        v44 = v15;
        _os_log_error_impl(&dword_1D207F000, v30, OS_LOG_TYPE_ERROR, "Limited carry profile %@ doesn't provide a valid experiment identifier, found: %@", buf, 0x16u);
      }

      goto LABEL_33;
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Experiment"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("DeploymentID"));
    v20 = objc_claimAutoreleasedReturnValue();

    if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      TRILogCategory_Server();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v42 = v6;
        v43 = 2112;
        v44 = v20;
        _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "Limited carry profile %@ doesn't provide a valid deployment identifier, found: %@", buf, 0x16u);
      }
      goto LABEL_32;
    }
    v36 = v20;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Experiment"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("NamespaceName"));
    v22 = objc_claimAutoreleasedReturnValue();

    v23 = v22;
    if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      TRILogCategory_Server();
      v31 = objc_claimAutoreleasedReturnValue();
      v38 = v31;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v42 = v6;
        v43 = 2112;
        v44 = v23;
        _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "Limited carry profile %@ doesn't provide a valid namespace name, found: %@", buf, 0x16u);
      }
      goto LABEL_31;
    }
    v24 = (void *)MEMORY[0x1E0DC0AD8];
    objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "namespaceDescriptorsDefaultDir");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v23;
    v27 = (void *)v25;
    v35 = v26;
    objc_msgSend(v24, "loadWithNamespaceName:fromDirectory:");
    v28 = objc_claimAutoreleasedReturnValue();

    v38 = (void *)v28;
    if (v28)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Experiment"));
      v29 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v29, v6);
    }
    else
    {
      TRILogCategory_Server();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        log = v29;
        TRILoggedNamespaceName(v35);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v42 = v15;
        v43 = 2112;
        v44 = v6;
        v45 = 2114;
        v46 = v32;
        _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "Found experiment %@ for installed profile %@ specifies namespace %{public}@, which is not registered with Trial", buf, 0x20u);

        v23 = v35;
        goto LABEL_30;
      }
    }
    v23 = v35;
LABEL_30:

LABEL_31:
    v20 = v36;

LABEL_32:
    v7 = 0x1E0C99000;
LABEL_33:

LABEL_34:
    goto LABEL_35;
  }
LABEL_38:
  objc_autoreleasePoolPop(v4);

  return v39;
}

- (void)removeProfileForExperiment:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRILimitedCarryProfileManager _limitedCarryExperiments](self, "_limitedCarryExperiments");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ExperimentID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "experimentId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("DeploymentID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v17 = objc_msgSend(v16, "longLongValue");
            if (objc_msgSend(v4, "deploymentId") != v17)
            {
              TRILogCategory_Server();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                v20 = objc_msgSend(v4, "deploymentId");
                *(_DWORD *)buf = 138412802;
                v26 = v16;
                v27 = 2112;
                v28 = v12;
                v29 = 1024;
                v30 = v20;
                _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "Found deployment %@ for experiment %@ from profile does not match deployment identifier for experiment record: %d", buf, 0x1Cu);
              }

              goto LABEL_16;
            }
          }
          objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeProfileWithIdentifier:", v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_16:

}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Profile connection observer received notification", v6, 2u);
  }

  -[_PASSimpleCoalescingTimer runImmediately](self->_checkForUpdates, "runImmediately");
}

- (void)_gatherProfileUpdatesAndScheduleRelatedTasks
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  OS_os_transaction *txn;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  __CFString *v35;
  void *v36;
  TRITaskAttributionInternalInsecure *v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  TRILimitedCarryProfileManager *v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  const __CFString *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  -[TRILimitedCarryProfileManager _limitedCarryExperiments](self, "_limitedCarryExperiments");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  -[TRILimitedCarryProfileManager _getStoredLimitedCarryExperimentsWithError:](self, "_getStoredLimitedCarryExperimentsWithError:", &v53);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v57 = CFSTR("com.apple.internal.trial.limitedcarry.db");
      v58 = 2114;
      v59 = v53;
      _os_log_error_impl(&dword_1D207F000, v4, OS_LOG_TYPE_ERROR, "Error reading data for %@ key in TRIKVStore: %{public}@. ", buf, 0x16u);
    }

  }
  v41 = self;
  +[TRISequenceTask task](TRISequenceTask, "task");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  v40 = v6 != 0;
  if (!v6)
  {
    v9 = 0;
    v24 = v5;
LABEL_28:

    goto LABEL_29;
  }
  v7 = v6;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v50;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v50 != v10)
        objc_enumerationMutation(v5);
      v12 = *(const __CFString **)(*((_QWORD *)&v49 + 1) + 8 * i);
      objc_msgSend(v43, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (__CFString *)v14;
      if (!v13)
      {
        TRILogCategory_Server();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v57 = v15;
          _os_log_impl(&dword_1D207F000, v22, OS_LOG_TYPE_DEFAULT, "Found removed profile: %@", buf, 0xCu);
        }

        -[__CFString objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("ExperimentID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("DeploymentID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "longLongValue");
        v20 = v17;
        v21 = 4;
        goto LABEL_19;
      }
      if (!v14)
      {
        TRILogCategory_Server();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v57 = v12;
          _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Error with profile found in database for identifier: %{public}@, profile value was nil. ", buf, 0xCu);
        }

        txn = (OS_os_transaction *)v5;
        goto LABEL_49;
      }
      if ((objc_msgSend(v13, "isEqual:", v14) & 1) == 0)
      {
        TRILogCategory_Server();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v57 = v15;
          v58 = 2112;
          v59 = v13;
          _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "Found replaced profile: %@ -> %@", buf, 0x16u);
        }

        -[__CFString objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("ExperimentID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("DeploymentID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "longLongValue");
        v9 = 1;
        v20 = v17;
        v21 = 11;
LABEL_19:
        +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v20, v19, 1, v21, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addTaskToEndOfSequence:", v23);

        v8 = 1;
      }

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v7)
      continue;
    break;
  }

  if ((v8 & 1) != 0)
  {
    +[TRIMaintenanceTask task](TRIMaintenanceTask, "task");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addTaskToEndOfSequence:", v24);
    goto LABEL_28;
  }
  v40 = 0;
LABEL_29:
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v27 = v43;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v46 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
        objc_msgSend(v5, "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
        {
          TRILogCategory_Server();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v27, "objectForKeyedSubscript:", v32);
            v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v57 = v35;
            _os_log_impl(&dword_1D207F000, v34, OS_LOG_TYPE_DEFAULT, "Found new profile: %@", buf, 0xCu);

          }
          v9 = 1;
        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v29);
  }

  -[TRILimitedCarryProfileManager setLcExperiments:](v41, "setLcExperiments:", v27);
  if ((v9 & 1) != 0)
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0A10]), "initWithAllowsCellular:discretionaryBehavior:", 1, 0);
    v37 = -[TRITaskAttributionInternalInsecure initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:]([TRITaskAttributionInternalInsecure alloc], "initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:", 0, 1, CFSTR("com.apple.triald"), v36);
    +[TRIFetchMultipleExperimentNotificationsTask taskWithStartingFetchDateOverride:namespaceNames:taskAttributing:rollbacksOnly:limitedCarryOnly:](TRIFetchMultipleExperimentNotificationsTask, "taskWithStartingFetchDateOverride:namespaceNames:taskAttributing:rollbacksOnly:limitedCarryOnly:", 0, 0, v37, 0, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addTaskToEndOfSequence:", v38);

    goto LABEL_43;
  }
  if (v40)
  {
LABEL_43:
    -[TRILimitedCarryProfileManager _enqueueTask:](v41, "_enqueueTask:", v42);
    v44 = 0;
    if (!-[TRILimitedCarryProfileManager _setStoredLimitedCarryExperimentsWithError:](v41, "_setStoredLimitedCarryExperimentsWithError:", &v44))
    {
      TRILogCategory_Server();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v57 = CFSTR("com.apple.internal.trial.limitedcarry.db");
        v58 = 2114;
        v59 = v44;
        _os_log_error_impl(&dword_1D207F000, v39, OS_LOG_TYPE_ERROR, "Error writing data for %@ key in TRIKVStore: %{public}@. Not proceeding further", buf, 0x16u);
      }

    }
  }
  txn = v41->_txn;
  v41->_txn = 0;
LABEL_49:

}

- ($A5A652246548B43F8BC05201A1C72A70)_enqueueTask:(id)a3
{
  TRITaskQueuing **p_taskQueue;
  id v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  $A5A652246548B43F8BC05201A1C72A70 v8;
  id v9;
  NSObject *v10;
  uint8_t v12[16];
  uint8_t buf[16];

  p_taskQueue = &self->_taskQueue;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_taskQueue);
  if (!WeakRetained)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Unable to add tasks to task queue for Limited Carry profile update, task queue was nil", buf, 2u);
    }

  }
  +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8.var0 = objc_msgSend(WeakRetained, "addTask:options:", v4, v7);

  v9 = -[TRIRunningXPCActivityDescriptor initForImmediateWorkWithCapabilities:]([TRIRunningXPCActivityDescriptor alloc], "initForImmediateWorkWithCapabilities:", 7);
  objc_msgSend(WeakRetained, "resumeWithXPCActivityDescriptor:executeWhenSuspended:", v9, 0);

  if (v8.var0 == 2)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Unable to add task for profile list changed notification", v12, 2u);
    }

  }
  return v8;
}

- (BOOL)_setStoredLimitedCarryExperimentsWithError:(id *)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id WeakRetained;
  void *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  void *v17;
  uint8_t buf[8];
  id v19;

  -[TRILimitedCarryProfileManager lcExperiments](self, "lcExperiments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRILimitedCarryProfileManager.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.lcExperiments != nil"));

  }
  v7 = (void *)MEMORY[0x1E0CB36F8];
  -[TRILimitedCarryProfileManager lcExperiments](self, "lcExperiments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v7, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;

  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    objc_msgSend(WeakRetained, "keyValueStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "setBlob:forKey:usingTransaction:", v9, CFSTR("com.apple.internal.trial.limitedcarry.db"), 0);
      v13 = 1;
    }
    else
    {
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Setting persisted Limited Carry profile information failed, key-value store was nil", buf, 2u);
      }

      v12 = 0;
      v13 = 0;
    }
  }
  else
  {
    if (!a3)
    {
      v13 = 0;
      goto LABEL_12;
    }
    v14 = v10;
    v13 = 0;
    v12 = *a3;
    *a3 = v14;
  }

LABEL_12:
  return v13;
}

- (id)_getStoredLimitedCarryExperimentsWithError:(id *)a3
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v17;
  uint8_t buf[16];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_msgSend(WeakRetained, "keyValueStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Getting persisted Limited Carry profile information failed, key-value store was nil", buf, 2u);
    }
    goto LABEL_10;
  }
  objc_msgSend(v5, "blobForKey:usingTransaction:", CFSTR("com.apple.internal.trial.limitedcarry.db"), 0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (a3)
    {
      v15 = *a3;
      *a3 = 0;

    }
    v7 = 0;
LABEL_10:
    v11 = 0;
    goto LABEL_14;
  }
  v7 = v6;
  v8 = (void *)MEMORY[0x1E0C99E60];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v19[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v10, v7, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;
  v13 = v17;
  if (v11)
  {
    v14 = v11;
  }
  else if (a3)
  {
    objc_storeStrong(a3, v12);
  }

LABEL_14:
  return v11;
}

- (void)setLcExperiments:(id)a3
{
  objc_storeStrong((id *)&self->_lcExperiments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lcExperiments, 0);
  objc_storeStrong((id *)&self->_txn, 0);
  objc_storeStrong((id *)&self->_checkForUpdates, 0);
  objc_storeStrong((id *)&self->_profileProcessingQueue, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_taskQueue);
}

@end
