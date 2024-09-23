@implementation TRIFetchRolloutNotificationListTask

- (int)taskType
{
  return 23;
}

- (NSArray)tags
{
  void *v3;

  v3 = (void *)objc_opt_new();
  +[TRITaskUtils addAttribution:toTaskTags:](TRITaskUtils, "addAttribution:toTaskTags:", self->_taskAttribution, v3);
  return (NSArray *)v3;
}

+ (id)taskWithStartingFetchDateOverride:(id)a3 namespaceNames:(id)a4 taskAttribution:(id)a5
{
  id v7;
  id v8;
  id v9;
  TRIFetchRolloutNotificationListTask *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[TRIFetchRolloutNotificationListTask initWithStartingFetchDateOverride:namespaceNames:taskAttribution:]([TRIFetchRolloutNotificationListTask alloc], "initWithStartingFetchDateOverride:namespaceNames:taskAttribution:", v9, v8, v7);

  return v10;
}

- (TRIFetchRolloutNotificationListTask)initWithStartingFetchDateOverride:(id)a3 namespaceNames:(id)a4 taskAttribution:(id)a5
{
  id v9;
  id v10;
  id v11;
  TRIFetchRolloutNotificationListTask *v12;
  TRIFetchRolloutNotificationListTask *v13;
  uint64_t v14;
  NSMutableArray *nextTasks;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TRIFetchRolloutNotificationListTask;
  v12 = -[TRIFetchRolloutNotificationListTask init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_startingFetchDateOverride, a3);
    objc_storeStrong((id *)&v13->_namespaceNames, a4);
    objc_storeStrong((id *)&v13->_taskAttribution, a5);
    v14 = objc_opt_new();
    nextTasks = v13->_nextTasks;
    v13->_nextTasks = (NSMutableArray *)v14;

  }
  return v13;
}

- (void)_addNextTask:(id)a3
{
  -[NSMutableArray addObject:](self->_nextTasks, "addObject:", a3);
}

- (int64_t)nextTaskCount
{
  return -[NSMutableArray count](self->_nextTasks, "count");
}

- (void)_processRolloutArtifact:(id)a3 context:(id)a4 taskQueue:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  TRIRolloutRecord *v13;
  void *v14;
  void *v15;
  void *v16;
  TRIRolloutRecord *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "rollout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hasRampId"))
  {
    objc_msgSend(v7, "rollout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rampId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    TRIValidateRampId();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  v13 = [TRIRolloutRecord alloc];
  objc_msgSend(v7, "deployment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "namespaceNames");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rollout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v25) = objc_msgSend(v16, "hasShadowEvaluation");
  v17 = -[TRIRolloutRecord initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:](v13, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:", v14, v12, 0, 0, 0, 0, 0, v15, v25, v7);

  objc_msgSend(v8, "rolloutDatabase");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "addNewRolloutWithRecord:", v17);
  if ((v19 & 1) != 0)
  {
    objc_msgSend(v7, "deployment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIRolloutTargetingTask taskWithRolloutDeployment:includeDependencies:taskAttribution:triggerEvent:](TRIRolloutTargetingTask, "taskWithRolloutDeployment:includeDependencies:taskAttribution:triggerEvent:", v20, 0, self->_taskAttribution, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIFetchRolloutNotificationListTask _addNextTask:](self, "_addNextTask:", v21);

  }
  else
  {
    TRILogCategory_Server();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "deployment");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "shortDesc");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v24;
      _os_log_impl(&dword_1D207F000, v22, OS_LOG_TYPE_DEFAULT, "Skipping RolloutNotification for rollout %{public}@ which is already present in the database.", buf, 0xCu);

    }
  }

}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6;
  TRIFetchRolloutNotificationListTask *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  dispatch_semaphore_t v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  NSDate *startingFetchDateOverride;
  NSSet *namespaceNames;
  id v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v42;
  void *v43;
  TRIFetchOptions *v44;
  void *v45;
  id v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[16];
  _QWORD v53[5];
  id v54;
  id v55;
  NSObject *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint8_t *v59;
  uint8_t *v60;
  uint8_t buf[8];
  uint8_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  int v74;
  uint8_t v75[8];
  uint8_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v46 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v43 = (void *)os_transaction_create();
  objc_msgSend(v6, "keyValueStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIFetchDateManager managerWithKeyValueStore:](TRIFetchDateManager, "managerWithKeyValueStore:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "namespaceDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "namespaceDescriptorsDefaultDir");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:](TRINamespaceDescriptorProvider, "providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v10, v12);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[TRITaskAttributing triCloudKitContainer](v7->_taskAttribution, "triCloudKitContainer");
  -[TRITaskAttributing teamIdentifier](v7->_taskAttribution, "teamIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITaskAttributing applicationBundleIdentifier](v7->_taskAttribution, "applicationBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRICKNativeArtifactProvider providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:](TRICKNativeArtifactProvider, "providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:", v13, v14, v15, v9, v47, v6);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRITaskAttributing networkOptions](v7->_taskAttribution, "networkOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "allowsCellularAccess"))
  {
    objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("allows_cellular_download"), objc_msgSend(v16, "allowsCellularAccess"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIFetchRolloutNotificationListTask _addMetric:](v7, "_addMetric:", v17);

  }
  if (!objc_msgSend(v16, "discretionaryBehavior"))
    goto LABEL_6;
  -[TRIBaseTask stateProvider](v7, "stateProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activeActivityGrantingCapability:", objc_msgSend(v16, "requiredCapability"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v16, "setActivity:", v19);

LABEL_6:
    v20 = dispatch_semaphore_create(0);
    v44 = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:]([TRIFetchOptions alloc], "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v16, &unk_1E9363E70);
    *(_QWORD *)v75 = 0;
    v76 = v75;
    v77 = 0x3032000000;
    v78 = __Block_byref_object_copy__29;
    v79 = __Block_byref_object_dispose__29;
    v80 = 0;
    v71 = 0;
    v72 = &v71;
    v73 = 0x2020000000;
    v74 = 0;
    v65 = 0;
    v66 = &v65;
    v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__29;
    v69 = __Block_byref_object_dispose__29;
    v70 = 0;
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_signpost_id_generate(v21);

    TRILogCategory_Server();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D207F000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "FetchRolloutNotificationsDateAscending", (const char *)&unk_1D220A8CD, buf, 2u);
    }

    v42 = v9;
    *(_QWORD *)buf = 0;
    v62 = buf;
    v63 = 0x2020000000;
    v64 = 0;
    startingFetchDateOverride = v7->_startingFetchDateOverride;
    namespaceNames = v7->_namespaceNames;
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __69__TRIFetchRolloutNotificationListTask_runUsingContext_withTaskQueue___block_invoke;
    v53[3] = &unk_1E9333C40;
    v58 = &v65;
    v59 = v75;
    v57 = &v71;
    v53[4] = v7;
    v27 = v6;
    v54 = v27;
    v55 = v46;
    v60 = buf;
    v28 = v20;
    v56 = v28;
    objc_msgSend(v45, "fetchRolloutNotificationsDateAscendingWithOptions:lastFetchDateOverride:namespaceNames:completion:", v44, startingFetchDateOverride, namespaceNames, v53);
    dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
    TRILogCategory_Server();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)v52 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D207F000, v30, OS_SIGNPOST_INTERVAL_END, v22, "FetchRolloutNotificationsDateAscending", (const char *)&unk_1D220A8CD, v52, 2u);
    }

    if (v66[5])
    {
      v7->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:](TRICKNativeArtifactProvider, "isActivityDeferralError:");
      TRIFetchErrorParseToMetrics((void *)v66[5]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "count"))
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v32 = v31;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v81, 16);
        if (v33)
        {
          v34 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v49 != v34)
                objc_enumerationMutation(v32);
              -[TRIFetchRolloutNotificationListTask _addMetric:](v7, "_addMetric:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i), v42);
            }
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v81, 16);
          }
          while (v33);
        }

        v9 = v42;
      }

    }
    v36 = *((unsigned int *)v72 + 6);
    if ((_DWORD)v36 == 2)
    {
      objc_msgSend(v27, "xpcActivityManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "postponeCellularActivity");

      v36 = *((unsigned int *)v72 + 6);
    }
    v38 = (void *)-[NSMutableArray copy](v7->_nextTasks, "copy", v42);
    +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v36, 1, v38, *((_QWORD *)v76 + 5));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v65, 8);

    _Block_object_dispose(&v71, 8);
    _Block_object_dispose(v75, 8);

    goto LABEL_29;
  }
  TRILogCategory_Server();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v75 = 0;
    _os_log_impl(&dword_1D207F000, v40, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", v75, 2u);
  }

  v28 = -[NSMutableArray copy](v7->_nextTasks, "copy");
  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 1, 1, v28, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

  objc_sync_exit(v7);
  return v39;
}

void __69__TRIFetchRolloutNotificationListTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, unint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a2 <= 1)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    goto LABEL_3;
  }
  if (a2 == 2)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (v10)
    {
      *(_DWORD *)(v12 + 24) = 1;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a4);
      goto LABEL_7;
    }
LABEL_3:
    *(_DWORD *)(v12 + 24) = 3;
LABEL_7:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a5);
LABEL_8:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
    goto LABEL_9;
  }
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "_processRolloutArtifact:context:taskQueue:", v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  }
  if (a2 != 3)
  {
    if (a2 == 4)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
      {
        TRILogCategory_Server();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Fetch status success but 0 results fetched.", (uint8_t *)&v16, 2u);
        }

      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 2;
    }
    goto LABEL_8;
  }
  TRILogCategory_Server();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    v16 = 134217984;
    v17 = v15;
    _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "Fetched %ld results, with more results pending.", (uint8_t *)&v16, 0xCu);
  }

LABEL_9:
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  NSDate *v6;
  NSDate *v7;
  NSDate *v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  NSSet *v12;
  NSSet *v13;
  NSSet *v14;
  BOOL v15;
  BOOL v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TRIFetchRolloutNotificationListTask;
  if (-[TRIBaseTask isEqual:](&v18, sel_isEqual_, v4))
  {
    v5 = (id *)v4;
    v6 = self->_startingFetchDateOverride;
    v7 = (NSDate *)v5[6];
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      if (v6)
        v9 = v7 == 0;
      else
        v9 = 1;
      if (v9)
      {

        goto LABEL_23;
      }
      v11 = -[NSDate isEqualToDate:](v6, "isEqualToDate:", v7);

      if (!v11)
        goto LABEL_23;
    }
    if (-[TRITaskAttributing isEqual:](self->_taskAttribution, "isEqual:", v5[8]))
    {
      v12 = self->_namespaceNames;
      v13 = (NSSet *)v5[7];
      if (v12 == v13)
      {

LABEL_22:
        v10 = 1;
LABEL_24:

        goto LABEL_25;
      }
      v14 = v13;
      if (v12)
        v15 = v13 == 0;
      else
        v15 = 1;
      if (v15)
      {

      }
      else
      {
        v16 = -[NSSet isEqualToSet:](v12, "isEqualToSet:", v13);

        if (v16)
          goto LABEL_22;
      }
    }
LABEL_23:
    v10 = 0;
    goto LABEL_24;
  }
  v10 = 0;
LABEL_25:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSDate *startingFetchDateOverride;
  uint64_t v5;
  NSSet *namespaceNames;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TRIFetchRolloutNotificationListTask;
  v3 = -[TRIBaseTask hash](&v8, sel_hash);
  startingFetchDateOverride = self->_startingFetchDateOverride;
  if (startingFetchDateOverride)
    v5 = -[NSDate hash](startingFetchDateOverride, "hash");
  else
    v5 = 0;
  namespaceNames = self->_namespaceNames;
  if (namespaceNames)
    namespaceNames = (NSSet *)-[NSSet hash](namespaceNames, "hash");
  return -[TRITaskAttributing hash](self->_taskAttribution, "hash")
       + 37 * ((_QWORD)namespaceNames + 1369 * v3 + 37 * v5);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%@,%@>"), objc_opt_class(), self->_startingFetchDateOverride, self->_namespaceNames);
}

- (void)_addMetric:(id)a3
{
  TRIFetchRolloutNotificationListTask *v4;
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
  TRIFetchRolloutNotificationListTask *v4;
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
  TRIFetchRolloutNotificationListTask *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_metrics, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (id)dimensions
{
  TRIFetchRolloutNotificationListTask *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_dimensions, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (id)trialSystemTelemetry
{
  return +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:](TRITelemetryFactory, "containerOriginTelemetryForTaskAttribution:", self->_taskAttribution);
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[TRITaskAttributing asPersistedTaskAttribution](self->_taskAttribution, "asPersistedTaskAttribution");
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
  objc_msgSend(v3, "setRetryCount:", -[TRIFetchRolloutNotificationListTask retryCount](self, "retryCount"));
  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIFetchRolloutNotificationListTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchRolloutNotificationListTask.m"), 318, CFSTR("Unexpected failure to serialize %@"), v9);

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
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  +[TRIPBMessage parseFromData:error:](TRIFetchRolloutNotificationListPersistedTask, "parseFromData:error:", a3, &v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v18;
  if (!v4)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v5;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIFetchRolloutNotificationListPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if ((objc_msgSend(v4, "hasTaskAttribution") & 1) == 0)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v17;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: taskAttribution", buf, 0xCu);

    }
LABEL_10:
    v10 = 0;
    goto LABEL_23;
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
      v11 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v4, "namespacesArray");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithArray:", v12);

    }
    else
    {
      v13 = 0;
    }
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStartingFetchDateOverride:namespaceNames:taskAttribution:", v9, v13, v7);
    if (objc_msgSend(v4, "hasRetryCount"))
      v14 = objc_msgSend(v4, "retryCount");
    else
      v14 = 0;
    objc_msgSend(v10, "setRetryCount:", v14);

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
    v10 = 0;
  }

LABEL_23:
  return v10;
}

- (unint64_t)requiredCapabilities
{
  void *v3;
  unint64_t v4;

  -[TRITaskAttributing networkOptions](self->_taskAttribution, "networkOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requiredCapability");

  if (-[TRIFetchRolloutNotificationListTask retryCount](self, "retryCount"))
    return v4 | 4;
  else
    return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFetchRolloutNotificationListTask)initWithCoder:(id)a3
{
  id v4;
  TRIFetchRolloutNotificationListTask *v5;
  void *v6;
  TRIFetchRolloutNotificationListTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchRolloutNotificationListTask;
  v5 = -[TRIFetchRolloutNotificationListTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIFetchRolloutNotificationListTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchRolloutNotificationListTask.m"), 363, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIFetchRolloutNotificationListTask serialize](self, "serialize");
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
  objc_storeStrong((id *)&self->_taskAttribution, 0);
  objc_storeStrong((id *)&self->_namespaceNames, 0);
  objc_storeStrong((id *)&self->_startingFetchDateOverride, 0);
  objc_storeStrong((id *)&self->_nextTasks, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
