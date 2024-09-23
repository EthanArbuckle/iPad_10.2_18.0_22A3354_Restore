@implementation TRIFetchBMLTNotificationsTask

- (int)taskType
{
  return 29;
}

- (NSArray)tags
{
  void *v3;
  TRIBMLTDeployment *deployment;
  void *v5;

  v3 = (void *)objc_opt_new();
  deployment = self->_deployment;
  if (deployment)
  {
    -[TRIBMLTDeployment taskTag](deployment, "taskTag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  +[TRITaskUtils addAttribution:toTaskTags:](TRITaskUtils, "addAttribution:toTaskTags:", self->_taskAttribution, v3);
  return (NSArray *)v3;
}

- (unint64_t)requiredCapabilities
{
  void *v3;
  unint64_t v4;

  -[TRITaskAttributing networkOptions](self->_taskAttribution, "networkOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requiredCapability");

  if (-[TRIFetchBMLTNotificationsTask retryCount](self, "retryCount"))
    return v4 | 4;
  else
    return v4;
}

+ (id)taskWithTaskAttribution:(id)a3
{
  id v3;
  TRIFetchBMLTNotificationsTask *v4;

  v3 = a3;
  v4 = -[TRIFetchBMLTNotificationsTask initWithTaskAttribution:]([TRIFetchBMLTNotificationsTask alloc], "initWithTaskAttribution:", v3);

  return v4;
}

+ (id)taskWithDeployment:(id)a3 taskAttribution:(id)a4 bmltBatchNotificationIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  TRIFetchBMLTNotificationsTask *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[TRIFetchBMLTNotificationsTask initWithDeployment:taskAttribution:bmltBatchNotificationIdentifier:]([TRIFetchBMLTNotificationsTask alloc], "initWithDeployment:taskAttribution:bmltBatchNotificationIdentifier:", v9, v8, v7);

  return v10;
}

- (TRIFetchBMLTNotificationsTask)initWithTaskAttribution:(id)a3
{
  id v6;
  TRIFetchBMLTNotificationsTask *v7;
  uint64_t v8;
  NSMutableArray *nextTasks;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *bmltBatchNotificationIdentifier;
  id v15;
  void *v16;
  uint64_t v17;
  _PASLock *lock;
  void *v20;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TRIFetchBMLTNotificationsTask;
  v7 = -[TRIFetchBMLTNotificationsTask init](&v21, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("TRIFetchBMLTNotificationsTask.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskAttribution"));

    }
    objc_storeStrong((id *)&v7->_taskAttribution, a3);
    v8 = objc_opt_new();
    nextTasks = v7->_nextTasks;
    v7->_nextTasks = (NSMutableArray *)v8;

    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("com.apple.triald.BMLTNotification.%@"), v12);
    v13 = objc_claimAutoreleasedReturnValue();
    bmltBatchNotificationIdentifier = v7->_bmltBatchNotificationIdentifier;
    v7->_bmltBatchNotificationIdentifier = (NSString *)v13;

    v15 = objc_alloc(MEMORY[0x1E0D815F0]);
    v16 = (void *)objc_opt_new();
    v17 = objc_msgSend(v15, "initWithGuardedData:", v16);
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v17;

  }
  return v7;
}

- (TRIFetchBMLTNotificationsTask)initWithDeployment:(id)a3 taskAttribution:(id)a4 bmltBatchNotificationIdentifier:(id)a5
{
  id v10;
  id v11;
  id v12;
  TRIFetchBMLTNotificationsTask *v13;
  uint64_t v14;
  NSMutableArray *nextTasks;
  id v16;
  void *v17;
  uint64_t v18;
  _PASLock *lock;
  void *v21;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)TRIFetchBMLTNotificationsTask;
  v13 = -[TRIFetchBMLTNotificationsTask init](&v22, sel_init);
  if (v13)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("TRIFetchBMLTNotificationsTask.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskAttribution"));

    }
    objc_storeStrong((id *)&v13->_deployment, a3);
    objc_storeStrong((id *)&v13->_taskAttribution, a4);
    v14 = objc_opt_new();
    nextTasks = v13->_nextTasks;
    v13->_nextTasks = (NSMutableArray *)v14;

    objc_storeStrong((id *)&v13->_bmltBatchNotificationIdentifier, a5);
    v16 = objc_alloc(MEMORY[0x1E0D815F0]);
    v17 = (void *)objc_opt_new();
    v18 = objc_msgSend(v16, "initWithGuardedData:", v17);
    lock = v13->_lock;
    v13->_lock = (_PASLock *)v18;

  }
  return v13;
}

- (unint64_t)_processBMLTCatalogArtifact:(id)a3 deactivatedBMLTs:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  unint64_t v20;
  _QWORD v22[4];
  id v23;
  TRIFetchBMLTNotificationsTask *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D8232A5C]();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v8, "bmltCatalog");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bmltDeploymentIdArray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __86__TRIFetchBMLTNotificationsTask__processBMLTCatalogArtifact_deactivatedBMLTs_context___block_invoke;
  v30[3] = &unk_1E9335CE0;
  v16 = v12;
  v31 = v16;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v30);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  objc_msgSend(v10, "bmltDatabase");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __86__TRIFetchBMLTNotificationsTask__processBMLTCatalogArtifact_deactivatedBMLTs_context___block_invoke_2;
  v22[3] = &unk_1E9335D08;
  v19 = v9;
  v23 = v19;
  v24 = self;
  v25 = &v26;
  objc_msgSend(v17, "enumerateActiveTasksNotInList:usingTransaction:withBlock:", v18, 0, v22);

  v20 = v27[3];
  _Block_object_dispose(&v26, 8);

  objc_autoreleasePoolPop(v11);
  return v20;
}

void __86__TRIFetchBMLTNotificationsTask__processBMLTCatalogArtifact_deactivatedBMLTs_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)MEMORY[0x1E0DC09A8];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "taskId");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "id_p");

  v7 = (void *)objc_msgSend(v5, "initWithBackgroundMLTaskId:deploymentId:", v8, v6);
  objc_msgSend(v2, "addObject:", v7);

}

void __86__TRIFetchBMLTNotificationsTask__processBMLTCatalogArtifact_deactivatedBMLTs_context___block_invoke_2(_QWORD *a1, void *a2)
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
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "bmltDeployment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shortDesc");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v6;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "_processBMLTCatalogArtifact deactivating BMLT %{public}@", (uint8_t *)&v12, 0xCu);

  }
  v7 = (void *)a1[4];
  objc_msgSend(v3, "bmltDeployment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  v9 = *(void **)(a1[5] + 24);
  objc_msgSend(v3, "bmltDeployment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIDeactivateBMLTDeploymentTask taskWithBMLTDeployment:triggerEvent:bmltBatchNotificationIdentifier:](TRIDeactivateBMLTDeploymentTask, "taskWithBMLTDeployment:triggerEvent:bmltBatchNotificationIdentifier:", v10, 5, *(_QWORD *)(a1[5] + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v11);

  ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
}

- (BOOL)_processBMLTArtifact:(id)a3 bmltsProcessed:(id)a4 deactivatedBMLTs:(id)a5 targeter:(id)a6 context:(id)a7 taskQueue:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  BOOL v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSMutableArray *v46;
  id v47;
  void *v48;
  NSMutableArray *v49;
  NSMutableArray *v50;
  NSMutableArray *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t i;
  void *v65;
  char v66;
  void *v67;
  uint64_t v68;
  void *v69;
  __CFString *v70;
  __CFString *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
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
  NSObject *v88;
  _BOOL4 v89;
  void *v90;
  void *v91;
  void *v92;
  const char *v93;
  NSObject *v94;
  void *v95;
  NSMutableArray *nextTasks;
  id v97;
  id v98;
  id v99;
  id v100;
  void *v101;
  int v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  id v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  id v120;
  id v121;
  _QWORD v122[4];
  id v123;
  uint8_t v124[128];
  uint8_t buf[4];
  void *v126;
  __int16 v127;
  id v128;
  __int16 v129;
  void *v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v114 = a8;
  v18 = (void *)MEMORY[0x1D8232A5C]();
  v115 = v13;
  objc_msgSend(v13, "deployment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  TRILogCategory_Server();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v19, "shortDesc");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "backgroundTask");
    v22 = v16;
    v23 = v15;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "selectedNamespace");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v126 = v21;
    v127 = 2114;
    v128 = v14;
    v129 = 2114;
    v130 = v25;
    _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEFAULT, "_processBMLTArtifact BMLT deployment %{public}@. bmltsProcessed %{public}@ for namespaces %{public}@.", buf, 0x20u);

    v15 = v23;
    v16 = v22;

  }
  if (objc_msgSend(v14, "containsObject:", v19))
  {
    TRILogCategory_Server();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v19, "shortDesc");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "backgroundMLTaskId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "backgroundTask");
      v111 = v19;
      v29 = v18;
      v30 = v16;
      v31 = v14;
      v32 = v17;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "selectedNamespace");
      v34 = v15;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v126 = v27;
      v127 = 2114;
      v128 = v28;
      v129 = 2114;
      v130 = v35;
      _os_log_impl(&dword_1D207F000, v26, OS_LOG_TYPE_INFO, "Ignoring BMLT deployment %{public}@ because BMLT task identifier %{public}@ has already been processed for namespaces %{public}@.", buf, 0x20u);

      v15 = v34;
      v17 = v32;
      v14 = v31;
      v16 = v30;
      v18 = v29;
      v19 = v111;

    }
    v36 = 0;
    goto LABEL_40;
  }
  objc_msgSend(v115, "deploymentType");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "intValue");

  if ((v38 - 2) < 2)
  {
    TRILogCategory_Server();
    v54 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
LABEL_16:

LABEL_17:
      v120 = 0;
      v121 = 0;
      objc_msgSend(v115, "backgroundTask");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v16, "targetBMLT:factorPackSetId:error:", v57, &v121, &v120);

      v110 = v15;
      if (v58 == 2)
      {
        TRILogCategory_Server();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v115, "deployment");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "shortDesc");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v126 = v74;
          _os_log_impl(&dword_1D207F000, v72, OS_LOG_TYPE_DEFAULT, "Targeting results in no-op for BMLT: %{public}@, skipping processing of record", buf, 0xCu);

LABEL_35:
        }
LABEL_38:
        v36 = 0;
LABEL_39:

        v15 = v110;
        goto LABEL_40;
      }
      if (!v58)
      {
        v112 = v19;
        v108 = v18;
        v106 = v14;
        v118 = 0u;
        v119 = 0u;
        v116 = 0u;
        v117 = 0u;
        -[TRIFetchBMLTNotificationsTask metrics](self, "metrics");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v116, v124, 16);
        if (v60)
        {
          v61 = v60;
          v62 = *(_QWORD *)v117;
          while (2)
          {
            v63 = v17;
            for (i = 0; i != v61; ++i)
            {
              if (*(_QWORD *)v117 != v62)
                objc_enumerationMutation(v59);
              objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * i), "name");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = objc_msgSend(CFSTR("targeting_error"), "isEqual:", v65);

              if ((v66 & 1) != 0)
              {
                v17 = v63;
                goto LABEL_37;
              }
            }
            v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v116, v124, 16);
            v17 = v63;
            if (v61)
              continue;
            break;
          }
        }

        objc_msgSend(v120, "userInfo");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("logMessage"));
        v68 = objc_claimAutoreleasedReturnValue();
        v69 = (void *)v68;
        v70 = CFSTR("unknown");
        if (v68)
          v70 = (__CFString *)v68;
        v71 = v70;

        objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:categoricalValue:", CFSTR("targeting_error"), v71);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        -[TRIFetchBMLTNotificationsTask _addMetric:](self, "_addMetric:", v59);
LABEL_37:

        TRILogCategory_Server();
        v72 = objc_claimAutoreleasedReturnValue();
        v18 = v108;
        v14 = v106;
        v19 = v112;
        if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          goto LABEL_38;
        objc_msgSend(v112, "shortDesc");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v126 = v73;
        _os_log_error_impl(&dword_1D207F000, v72, OS_LOG_TYPE_ERROR, "Targeting BMLT deployment %{public}@ resulted in an error", buf, 0xCu);
        goto LABEL_35;
      }
      objc_msgSend(v115, "deployment");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v15, "containsObject:", v75);

      if (v76)
      {
        TRILogCategory_Server();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v19, "shortDesc");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v126 = v73;
          _os_log_impl(&dword_1D207F000, v72, OS_LOG_TYPE_DEFAULT, "Skipping activations for BMLT %{public}@ due to it not being in the catalog", buf, 0xCu);
          goto LABEL_35;
        }
        goto LABEL_38;
      }
      v109 = v18;
      objc_msgSend(v115, "deployment");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v78);

      objc_msgSend(v115, "backgroundTask");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v79, "hasEndDate"))
      {
        objc_msgSend(v115, "backgroundTask");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "endDate");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "date");
        v82 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v82 = 0;
      }

      objc_msgSend(v17, "bmltDatabase");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "backgroundTask");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "pluginId");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "addBackgroundMLTaskWithTaskDeployment:pluginId:status:endDate:artifact:", v19, v85, 0, v82, v115);

      objc_msgSend(v17, "bmltDatabase");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "taskRecordWithTaskDeployment:", v19);
      v72 = objc_claimAutoreleasedReturnValue();

      v36 = v72 != 0;
      v107 = v17;
      if (!v72)
      {
        TRILogCategory_Server();
        v94 = objc_claimAutoreleasedReturnValue();
        v18 = v109;
        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v19, "shortDesc");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "backgroundTask");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "selectedNamespace");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v126 = v103;
          v127 = 2114;
          v128 = v105;
          _os_log_error_impl(&dword_1D207F000, v94, OS_LOG_TYPE_ERROR, "Unexpected failure to find BMLT deployment %{public}@ for namespaces %{public}@.", buf, 0x16u);

          v18 = v109;
        }
        goto LABEL_54;
      }
      -[NSObject activeFactorPackSetId](v72, "activeFactorPackSetId");
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      TRILogCategory_Server();
      v88 = objc_claimAutoreleasedReturnValue();
      v89 = os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT);
      v18 = v109;
      if (v87)
      {
        if (v89)
        {
          objc_msgSend(v19, "shortDesc");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "backgroundTask");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "selectedNamespace");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v126 = v90;
          v127 = 2114;
          v128 = v92;
          v93 = "BMLT deployment %{public}@ was selected, but is already active. Scheduling re-activation for namespaces %{public}@";
LABEL_52:
          _os_log_impl(&dword_1D207F000, v88, OS_LOG_TYPE_DEFAULT, v93, buf, 0x16u);

          v18 = v109;
        }
      }
      else if (v89)
      {
        objc_msgSend(v19, "shortDesc");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "backgroundTask");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "selectedNamespace");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v126 = v90;
        v127 = 2114;
        v128 = v92;
        v93 = "BMLT deployment %{public}@ is selected and not yet active; scheduling activation for namespaces %{public}@.";
        goto LABEL_52;
      }

      objc_msgSend(v19, "backgroundMLTaskId");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "cancelTasksWithTag:", v95);

      nextTasks = self->_nextTasks;
      +[TRIBMLTTargetingTask taskWithBMLTDeployment:includeDependencies:taskAttribution:triggerEvent:bmltBatchNotificationIdentifier:](TRIBMLTTargetingTask, "taskWithBMLTDeployment:includeDependencies:taskAttribution:triggerEvent:bmltBatchNotificationIdentifier:", v19, 0, self->_taskAttribution, 0, self->_bmltBatchNotificationIdentifier);
      v94 = objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](nextTasks, "addObject:", v94);
LABEL_54:

      v17 = v107;
      goto LABEL_39;
    }
    objc_msgSend(v115, "deployment");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "shortDesc");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v126 = v56;
    _os_log_error_impl(&dword_1D207F000, v54, OS_LOG_TYPE_ERROR, "Found incompatible deployment type for BMLT: %{public}@", buf, 0xCu);
LABEL_57:

    goto LABEL_16;
  }
  if (!v38)
  {
    TRILogCategory_Server();
    v54 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    objc_msgSend(v115, "backgroundTask");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "taskId");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "backgroundTask");
    v97 = v17;
    v98 = v14;
    v99 = v16;
    v100 = v15;
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v101, "deploymentId");
    *(_DWORD *)buf = 138543618;
    v126 = v56;
    v127 = 1026;
    LODWORD(v128) = v102;
    _os_log_error_impl(&dword_1D207F000, v54, OS_LOG_TYPE_ERROR, "Unknown notification type for BMLT: %{public}@, deployment: %{public}d", buf, 0x12u);

    v15 = v100;
    v16 = v99;
    v14 = v98;
    v17 = v97;
    goto LABEL_57;
  }
  if (v38 != 4)
    goto LABEL_17;
  TRILogCategory_Server();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v115, "deployment");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "shortDesc");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v126 = v41;
    _os_log_impl(&dword_1D207F000, v39, OS_LOG_TYPE_DEFAULT, "Terminating BMLT due to termination notification: %{public}@", buf, 0xCu);

  }
  objc_msgSend(v115, "backgroundTask");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "taskId");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "cancelTasksWithTag:", v43);

  objc_msgSend(v115, "deployment");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "taskTag");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "cancelTasksWithTag:", v45);

  v46 = self->_nextTasks;
  v122[0] = MEMORY[0x1E0C809B0];
  v122[1] = 3221225472;
  v122[2] = __113__TRIFetchBMLTNotificationsTask__processBMLTArtifact_bmltsProcessed_deactivatedBMLTs_targeter_context_taskQueue___block_invoke;
  v122[3] = &unk_1E9332D38;
  v47 = v115;
  v123 = v47;
  -[NSMutableArray _pas_filteredArrayWithTest:](v46, "_pas_filteredArrayWithTest:", v122);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (NSMutableArray *)objc_msgSend(v48, "mutableCopy");
  v50 = self->_nextTasks;
  self->_nextTasks = v49;

  v51 = self->_nextTasks;
  objc_msgSend(v47, "deployment");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIDeactivateBMLTDeploymentTask taskWithBMLTDeployment:triggerEvent:bmltBatchNotificationIdentifier:](TRIDeactivateBMLTDeploymentTask, "taskWithBMLTDeployment:triggerEvent:bmltBatchNotificationIdentifier:", v52, 5, self->_bmltBatchNotificationIdentifier);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v51, "addObject:", v53);

  v36 = 1;
LABEL_40:

  objc_autoreleasePoolPop(v18);
  return v36;
}

uint64_t __113__TRIFetchBMLTNotificationsTask__processBMLTArtifact_bmltsProcessed_deactivatedBMLTs_targeter_context_taskQueue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(a2, "tags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deployment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsObject:", v5);

  return v6 ^ 1u;
}

- (id)fetchSingleDeploymentWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_semaphore_t v19;
  NSObject *v20;
  NSString *bmltBatchNotificationIdentifier;
  const char *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  os_signpost_id_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  int v31;
  TRIBMLTDeployment *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  void *v51;
  TRIBMLTDeployment *deployment;
  id v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  uint64_t v58;
  __CFString *v59;
  id v60;
  TRIFetchOptions *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[5];
  id v68;
  NSObject *v69;
  uint64_t *v70;
  _BYTE *v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  int v82;
  _QWORD handler[5];
  id v84;
  int out_token;
  uint8_t v86[128];
  uint8_t v87[4];
  id v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  __CFString *v92;
  _BYTE buf[24];
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v51 = (void *)objc_opt_class();
    deployment = self->_deployment;
    v53 = v51;
    -[TRIBMLTDeployment shortDesc](deployment, "shortDesc");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v51;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v54;
    _os_log_debug_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEBUG, "starting %{public}@ for single deployment with BMLT %{public}@", buf, 0x16u);

  }
  objc_msgSend(v4, "keyValueStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIFetchDateManager managerWithKeyValueStore:](TRIFetchDateManager, "managerWithKeyValueStore:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "namespaceDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "namespaceDescriptorsDefaultDir");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:](TRINamespaceDescriptorProvider, "providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[TRITaskAttributing triCloudKitContainer](self->_taskAttribution, "triCloudKitContainer");
  -[TRITaskAttributing teamIdentifier](self->_taskAttribution, "teamIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITaskAttributing applicationBundleIdentifier](self->_taskAttribution, "applicationBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRICKNativeArtifactProvider providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:](TRICKNativeArtifactProvider, "providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:", v12, v13, v14, v7, v11, v4);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRITaskAttributing networkOptions](self->_taskAttribution, "networkOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "allowsCellularAccess"))
  {
    objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("allows_cellular_download"), objc_msgSend(v15, "allowsCellularAccess"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIFetchBMLTNotificationsTask _addMetric:](self, "_addMetric:", v16);

  }
  if (!objc_msgSend(v15, "discretionaryBehavior"))
    goto LABEL_8;
  -[TRIBaseTask stateProvider](self, "stateProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activeActivityGrantingCapability:", objc_msgSend(v15, "requiredCapability"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v15, "setActivity:", v18);

LABEL_8:
    v61 = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:]([TRIFetchOptions alloc], "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v15, &unk_1E9363FC0);
    v19 = dispatch_semaphore_create(0);
    out_token = 0;
    TRILogCategory_Server();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      bmltBatchNotificationIdentifier = self->_bmltBatchNotificationIdentifier;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = bmltBatchNotificationIdentifier;
      _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEFAULT, "Registering BMLT (single) fetch notification %{public}@", buf, 0xCu);
    }

    v22 = -[NSString UTF8String](self->_bmltBatchNotificationIdentifier, "UTF8String");
    dispatch_get_global_queue(17, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __66__TRIFetchBMLTNotificationsTask_fetchSingleDeploymentWithContext___block_invoke;
    handler[3] = &unk_1E9331850;
    handler[4] = self;
    v25 = v4;
    v84 = v25;
    notify_register_dispatch(v22, &out_token, v23, handler);

    v79 = 0;
    v80 = &v79;
    v81 = 0x2020000000;
    v82 = 2;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v94 = __Block_byref_object_copy__46;
    v95 = __Block_byref_object_dispose__46;
    v96 = 0;
    v73 = 0;
    v74 = &v73;
    v75 = 0x3032000000;
    v76 = __Block_byref_object_copy__46;
    v77 = __Block_byref_object_dispose__46;
    v78 = 0;
    TRILogCategory_Server();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_signpost_id_generate(v26);

    TRILogCategory_Server();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      v60 = v4;
      -[TRIBMLTDeployment backgroundMLTaskId](self->_deployment, "backgroundMLTaskId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[TRIBMLTDeployment deploymentId](self->_deployment, "deploymentId");
      *(_DWORD *)v87 = 138543618;
      v88 = v30;
      v89 = 1024;
      LODWORD(v90) = v31;
      _os_signpost_emit_with_name_impl(&dword_1D207F000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "FetchBMLTNotificationWithDeployment", "bmlt: %{public}@, d: %d", v87, 0x12u);

      v4 = v60;
    }

    v32 = self->_deployment;
    v67[0] = v24;
    v67[1] = 3221225472;
    v67[2] = __66__TRIFetchBMLTNotificationsTask_fetchSingleDeploymentWithContext___block_invoke_51;
    v67[3] = &unk_1E9335D30;
    v67[4] = self;
    v70 = &v79;
    v71 = buf;
    v72 = &v73;
    v33 = v25;
    v68 = v33;
    v34 = v19;
    v69 = v34;
    objc_msgSend(v62, "fetchBMLTNotificationWithDeployment:options:completion:", v32, v61, v67);
    dispatch_semaphore_wait(v34, 0xFFFFFFFFFFFFFFFFLL);
    TRILogCategory_Server();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      v37 = v4;
      -[TRIBMLTDeployment backgroundMLTaskId](self->_deployment, "backgroundMLTaskId");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[TRIBMLTDeployment deploymentId](self->_deployment, "deploymentId");
      *(_DWORD *)v87 = 138543618;
      v88 = v38;
      v89 = 1024;
      LODWORD(v90) = v39;
      _os_signpost_emit_with_name_impl(&dword_1D207F000, v36, OS_SIGNPOST_INTERVAL_END, v27, "FetchBMLTNotificationWithDeployment", "bmlt: %{public}@, d: %d", v87, 0x12u);

      v4 = v37;
    }

    TRILogCategory_Server();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      v55 = v4;
      v56 = (id)objc_opt_class();
      -[TRIBMLTDeployment shortDesc](self->_deployment, "shortDesc");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = *((int *)v80 + 6);
      if (v58 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *((int *)v80 + 6));
        v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v59 = off_1E9335E18[v58];
      }
      *(_DWORD *)v87 = 138543874;
      v88 = v56;
      v89 = 2114;
      v90 = v57;
      v91 = 2114;
      v92 = v59;
      _os_log_debug_impl(&dword_1D207F000, v40, OS_LOG_TYPE_DEBUG, "Finished %{public}@ with BMLT %{public}@: %{public}@", v87, 0x20u);

      v4 = v55;
    }

    if (v74[5])
    {
      self->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:](TRICKNativeArtifactProvider, "isActivityDeferralError:");
      TRIFetchErrorParseToMetrics((void *)v74[5]);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v41, "count"))
      {
        v42 = v4;
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v43 = v41;
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v63, v86, 16);
        if (v44)
        {
          v45 = *(_QWORD *)v64;
          do
          {
            for (i = 0; i != v44; ++i)
            {
              if (*(_QWORD *)v64 != v45)
                objc_enumerationMutation(v43);
              -[TRIFetchBMLTNotificationsTask _addMetric:](self, "_addMetric:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
            }
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v63, v86, 16);
          }
          while (v44);
        }

        v4 = v42;
      }

    }
    v47 = *((unsigned int *)v80 + 6);
    if ((_DWORD)v47 == 3)
    {
      notify_post("com.apple.trial.bmlt.activated");
      -[TRIFetchBMLTNotificationsTask _mlruntimeNotifiedTelemetryWithRecords:serverContext:](self, "_mlruntimeNotifiedTelemetryWithRecords:serverContext:", 0, v33);
      v47 = *((unsigned int *)v80 + 6);
    }
    +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v47, 1, MEMORY[0x1E0C9AA60], *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v73, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v79, 8);
    goto LABEL_34;
  }
  TRILogCategory_Server();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v49, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", buf, 2u);
  }

  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 1, 1, MEMORY[0x1E0C9AA60], 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:

  return v48;
}

uint64_t __66__TRIFetchBMLTNotificationsTask_fetchSingleDeploymentWithContext___block_invoke(uint64_t a1, int a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_mlruntimeNotifiedTelemetryWithRecords:serverContext:", 1, *(_QWORD *)(a1 + 40));
  notify_post("com.apple.trial.bmlt.activated");
  return notify_cancel(a2);
}

void __66__TRIFetchBMLTNotificationsTask_fetchSingleDeploymentWithContext___block_invoke_51(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
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
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a2 == 4)
  {
    if (v9)
    {
      objc_msgSend(v9, "backgroundTask");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "hasEndDate"))
      {
        objc_msgSend(v9, "backgroundTask");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "endDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = 0;
      }

      objc_msgSend(*(id *)(a1 + 40), "bmltDatabase");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      objc_msgSend(v9, "backgroundTask");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pluginId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v20, "addBackgroundMLTaskWithTaskDeployment:pluginId:status:endDate:artifact:", v21, v23, 0, v15, v9);

      if (v24 != 1)
      {
        TRILogCategory_Server();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "shortDesc");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138543362;
          v28 = v26;
          _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Unexpected conflict when saving BMLT to database: %{public}@", (uint8_t *)&v27, 0xCu);

        }
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 3;
      }

    }
    else
    {
      TRILogCategory_Server();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "shortDesc");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543362;
        v28 = v19;
        _os_log_impl(&dword_1D207F000, v18, OS_LOG_TYPE_DEFAULT, "No valid and compatible BMLT artifact was received for %{public}@.", (uint8_t *)&v27, 0xCu);

      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 3;
    }
  }
  else
  {
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "shortDesc");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v17;
      v29 = 2114;
      v30 = v11;
      _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "Unable to fetch BMLT notification %{public}@: %{public}@", (uint8_t *)&v27, 0x16u);

    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a4);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  TRITaskRunResult *v12;
  TRITaskRunResult *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  TRIBMLTTargeter *v27;
  void *v28;
  TRISystemCovariates *v29;
  void *v30;
  TRISystemCovariates *v31;
  TRIUserCovariates *v32;
  dispatch_semaphore_t v33;
  uint64_t v34;
  id v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  os_signpost_id_t v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  id v44;
  id v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  os_signpost_id_t v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  void *v63;
  id v64;
  TRIBMLTTargeter *v65;
  id v66;
  void *v67;
  TRIBMLTTargeter *v68;
  void *v69;
  void *v70;
  TRIFetchOptions *v71;
  void *v72;
  void *v73;
  void *context;
  void *v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[5];
  id v82;
  id v83;
  TRIBMLTTargeter *v84;
  id v85;
  id v86;
  NSObject *v87;
  uint64_t *v88;
  uint64_t *v89;
  __int128 *p_buf;
  uint64_t *v91;
  uint64_t *v92;
  uint8_t v93[8];
  _QWORD v94[5];
  id v95;
  id v96;
  NSObject *v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  int v116;
  uint8_t v117[128];
  __int128 buf;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t);
  void (*v121)(uint64_t);
  id v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v76 = a4;
  context = (void *)MEMORY[0x1D8232A5C]();
  v75 = (void *)os_transaction_create();
  if (!self->_deployment)
  {
    objc_msgSend(v6, "keyValueStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIFetchDateManager managerWithKeyValueStore:](TRIFetchDateManager, "managerWithKeyValueStore:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "namespaceDatabase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paths");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "namespaceDescriptorsDefaultDir");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:](TRINamespaceDescriptorProvider, "providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v15, v17);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = -[TRITaskAttributing triCloudKitContainer](self->_taskAttribution, "triCloudKitContainer");
    -[TRITaskAttributing teamIdentifier](self->_taskAttribution, "teamIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRITaskAttributing applicationBundleIdentifier](self->_taskAttribution, "applicationBundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:](TRICKNativeArtifactProvider, "providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:", v18, v19, v20, v8, v70, v6);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    -[TRITaskAttributing networkOptions](self->_taskAttribution, "networkOptions");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v73;
    if (objc_msgSend(v73, "allowsCellularAccess"))
    {
      objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("allows_cellular_download"), objc_msgSend(v73, "allowsCellularAccess"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIFetchBMLTNotificationsTask _addMetric:](self, "_addMetric:", v22);

      v21 = v73;
    }
    if (objc_msgSend(v21, "discretionaryBehavior"))
    {
      v23 = objc_msgSend(v21, "requiredCapability");
      -[TRIBaseTask stateProvider](self, "stateProvider");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "activeActivityGrantingCapability:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        TRILogCategory_Server();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1D207F000, v61, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", (uint8_t *)&buf, 2u);
        }

        v44 = (id)-[NSMutableArray copy](self->_nextTasks, "copy");
        +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 1, 1, v44, 0);
        v13 = (TRITaskRunResult *)objc_claimAutoreleasedReturnValue();
        goto LABEL_45;
      }
      objc_msgSend(v73, "setActivity:", v25);

    }
    v26 = (void *)objc_opt_new();
    v67 = (void *)objc_opt_new();
    v27 = [TRIBMLTTargeter alloc];
    objc_msgSend(v6, "bmltDatabase");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = [TRISystemCovariates alloc];
    objc_msgSend(v6, "paths");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[TRISystemCovariates initWithPaths:](v29, "initWithPaths:", v30);
    v32 = -[TRIUserCovariates initWithContext:]([TRIUserCovariates alloc], "initWithContext:", v6);
    v65 = -[TRIBMLTTargeter initWithDatabase:systemCovariateProvider:userCovariateProvider:](v27, "initWithDatabase:systemCovariateProvider:userCovariateProvider:", v28, v31, v32);

    v33 = dispatch_semaphore_create(0);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v119 = 0x3032000000;
    v120 = __Block_byref_object_copy__46;
    v121 = __Block_byref_object_dispose__46;
    v122 = 0;
    v113 = 0;
    v114 = &v113;
    v115 = 0x2020000000;
    v116 = 0;
    v107 = 0;
    v108 = &v107;
    v109 = 0x3032000000;
    v110 = __Block_byref_object_copy__46;
    v111 = __Block_byref_object_dispose__46;
    v112 = 0;
    v103 = 0;
    v104 = &v103;
    v105 = 0x2020000000;
    v106 = 0;
    v99 = 0;
    v100 = &v99;
    v101 = 0x2020000000;
    v102 = 0;
    v71 = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:]([TRIFetchOptions alloc], "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v73, &unk_1E9363FC0);
    v34 = MEMORY[0x1E0C809B0];
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __63__TRIFetchBMLTNotificationsTask_runUsingContext_withTaskQueue___block_invoke;
    v94[3] = &unk_1E9335D58;
    v98 = &v99;
    v94[4] = self;
    v35 = v26;
    v95 = v35;
    v36 = v6;
    v96 = v36;
    v37 = v33;
    v97 = v37;
    v69 = (void *)MEMORY[0x1D8232C48](v94);
    TRILogCategory_Server();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = os_signpost_id_generate(v38);

    TRILogCategory_Server();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      *(_WORD *)v93 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D207F000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "FetchBMLTCatalogNotification", (const char *)&unk_1D220A8CD, v93, 2u);
    }

    objc_msgSend(v72, "fetchBMLTCatalogNotificationWithOptions:completion:", v71, v69);
    dispatch_semaphore_wait(v37, 0xFFFFFFFFFFFFFFFFLL);
    TRILogCategory_Server();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_WORD *)v93 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D207F000, v43, OS_SIGNPOST_INTERVAL_END, v39, "FetchBMLTCatalogNotification", (const char *)&unk_1D220A8CD, v93, 2u);
    }

    v81[0] = v34;
    v81[1] = 3221225472;
    v81[2] = __63__TRIFetchBMLTNotificationsTask_runUsingContext_withTaskQueue___block_invoke_58;
    v81[3] = &unk_1E9335DA8;
    v89 = &v107;
    p_buf = &buf;
    v88 = &v113;
    v81[4] = self;
    v64 = v67;
    v82 = v64;
    v44 = v35;
    v83 = v44;
    v68 = v65;
    v84 = v68;
    v45 = v36;
    v85 = v45;
    v86 = v76;
    v91 = &v103;
    v92 = &v99;
    v46 = v37;
    v87 = v46;
    v47 = (void *)MEMORY[0x1D8232C48](v81);
    TRILogCategory_Server();
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = os_signpost_id_generate(v48);

    TRILogCategory_Server();
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
    {
      *(_WORD *)v93 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D207F000, v51, OS_SIGNPOST_INTERVAL_BEGIN, v49, "FetchBMLTNotificationsDateDescending", (const char *)&unk_1D220A8CD, v93, 2u);
    }

    objc_msgSend(v72, "fetchBMLTNotificationsWithOptions:completion:", v71, v47);
    dispatch_semaphore_wait(v46, 0xFFFFFFFFFFFFFFFFLL);
    TRILogCategory_Server();
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      *(_WORD *)v93 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D207F000, v53, OS_SIGNPOST_INTERVAL_END, v49, "FetchBMLTNotificationsDateDescending", (const char *)&unk_1D220A8CD, v93, 2u);
    }

    if (!v104[3] && !v100[3] && *((_DWORD *)v114 + 6) == 2)
    {
      notify_post("com.apple.trial.bmlt.activated");
      -[TRIFetchBMLTNotificationsTask _mlruntimeNotifiedTelemetryWithRecords:serverContext:](self, "_mlruntimeNotifiedTelemetryWithRecords:serverContext:", 0, v45);
    }
    if (v108[5])
    {
      self->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:](TRICKNativeArtifactProvider, "isActivityDeferralError:");
      TRIFetchErrorParseToMetrics((void *)v108[5]);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v54, "count"))
      {
        v66 = v44;
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v55 = v54;
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v77, v117, 16);
        if (v56)
        {
          v57 = *(_QWORD *)v78;
          do
          {
            for (i = 0; i != v56; ++i)
            {
              if (*(_QWORD *)v78 != v57)
                objc_enumerationMutation(v55);
              -[TRIFetchBMLTNotificationsTask _addMetric:](self, "_addMetric:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i));
            }
            v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v77, v117, 16);
          }
          while (v56);
        }

        v44 = v66;
      }

    }
    v59 = *((unsigned int *)v114 + 6);
    v60 = (void *)-[NSMutableArray copy](self->_nextTasks, "copy");
    +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v59, 1, v60, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    v13 = (TRITaskRunResult *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v99, 8);
    _Block_object_dispose(&v103, 8);
    _Block_object_dispose(&v107, 8);

    _Block_object_dispose(&v113, 8);
    _Block_object_dispose(&buf, 8);

LABEL_45:
    goto LABEL_46;
  }
  objc_msgSend(v6, "bmltDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "taskRecordWithTaskDeployment:", self->_deployment);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  TRILogCategory_Server();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[TRIBMLTDeployment shortDesc](self->_deployment, "shortDesc");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "Skipping CloudKit fetch of BMLT notification for %{public}@: already present.", (uint8_t *)&buf, 0xCu);

    }
    v12 = [TRITaskRunResult alloc];
    v13 = -[TRITaskRunResult initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](v12, "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 2, 0, MEMORY[0x1E0C9AA60], 0);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[TRIBMLTDeployment shortDesc](self->_deployment, "shortDesc");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v63;
      _os_log_debug_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEBUG, "CloudKit fetch of BMLT notification for %{public}@", (uint8_t *)&buf, 0xCu);

    }
    -[TRIFetchBMLTNotificationsTask fetchSingleDeploymentWithContext:](self, "fetchSingleDeploymentWithContext:", v6);
    v13 = (TRITaskRunResult *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
LABEL_46:

  objc_autoreleasePoolPop(context);
  return v13;
}

void __63__TRIFetchBMLTNotificationsTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, unint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a2 <= 1)
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v11;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "BMLT catalog fetch failed. Notifications fetching will continue but no BMLTs will be deactivated. Error %@", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_14;
  }
  if (a2 == 2)
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v11;
      v13 = "BMLT catalog fetch was asked to retry. Notifications fetching will continue but no BMLTs will be deactivated. Error %@";
LABEL_13:
      _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (v9)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_processBMLTCatalogArtifact:deactivatedBMLTs:context:", v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (a2 != 3)
  {
    if (a2 != 4)
    {
LABEL_15:
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
      goto LABEL_16;
    }
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v15 = 134217984;
      v16 = v14;
      v13 = "BMLT catalog fetch status success with %ld BMLTs to deactivate";
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:

}

void __63__TRIFetchBMLTNotificationsTask_runUsingContext_withTaskQueue___block_invoke_58(uint64_t a1, unint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  _BOOL4 v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  __int128 *p_buf;
  int out_token;
  uint8_t v30[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int128 buf;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a2 <= 1)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 3;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), a5);
LABEL_20:
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v35 = 0x2020000000;
    v36 = 0;
    v36 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24)
        + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
    if (v36)
    {
      out_token = 0;
      TRILogCategory_Server();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
        v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
        *(_DWORD *)v30 = 138543618;
        v31 = v21;
        v32 = 2048;
        v33 = v22;
        _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEFAULT, "Registering BMLT bulk fetch notification %{public}@ for %lu records.", v30, 0x16u);
      }

      v23 = (const char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "UTF8String");
      dispatch_get_global_queue(17, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __63__TRIFetchBMLTNotificationsTask_runUsingContext_withTaskQueue___block_invoke_59;
      v26[3] = &unk_1E9335D80;
      v25 = *(_QWORD *)(a1 + 32);
      p_buf = &buf;
      v26[4] = v25;
      v27 = *(id *)(a1 + 64);
      notify_register_dispatch(v23, &out_token, v24, v26);

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 80));
    _Block_object_dispose(&buf, 8);
    goto LABEL_25;
  }
  if (a2 == 2)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    if (v10)
    {
      *(_DWORD *)(v12 + 24) = 1;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), a4);
    }
    else
    {
      *(_DWORD *)(v12 + 24) = 3;
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), a5);
    goto LABEL_20;
  }
  if (v9
    && objc_msgSend(*(id *)(a1 + 32), "_processBMLTArtifact:bmltsProcessed:deactivatedBMLTs:targeter:context:taskQueue:", v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72)))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
  }
  if (a2 != 3)
  {
    if (a2 != 4)
      goto LABEL_20;
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) == 0;
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        LOWORD(buf) = 0;
        v17 = "BMLT fetch status success but 0 results fetched.";
        v18 = v14;
        v19 = 2;
        goto LABEL_18;
      }
    }
    else if (v15)
    {
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v16;
      v17 = "BMLT fetch status success with %ld results";
      v18 = v14;
      v19 = 12;
LABEL_18:
      _os_log_impl(&dword_1D207F000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&buf, v19);
    }

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 2;
    goto LABEL_20;
  }
LABEL_25:

}

void __63__TRIFetchBMLTNotificationsTask_runUsingContext_withTaskQueue___block_invoke_59(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(_QWORD *)(v3 + 24) - 1;
  *(_QWORD *)(v3 + 24) = v4;
  if (!v4)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "com.apple.trial.bmlt.activated";
      _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "All fetched BMLTs have been processed. Sending a %s notification.", (uint8_t *)&v10, 0xCu);
    }

    notify_post("com.apple.trial.bmlt.activated");
    objc_msgSend(*(id *)(a1 + 32), "_mlruntimeNotifiedTelemetryWithRecords:serverContext:", 1, *(_QWORD *)(a1 + 40));
    notify_cancel(a2);
  }
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v10 = 134218242;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "%lu BMLTs remain to be processed for notification: %@.", (uint8_t *)&v10, 0x16u);
  }

}

+ (id)categoricalValueForBMLTNotificationEvent:(unint64_t)a3
{
  if (a3)
    return CFSTR("bmlt-fetched-without-records");
  else
    return CFSTR("bmlt-fetched-with-records");
}

- (void)_mlruntimeNotifiedTelemetryWithRecords:(BOOL)a3 serverContext:(id)a4
{
  _BOOL8 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = !a3;
  v6 = a4;
  +[TRIFetchBMLTNotificationsTask categoricalValueForBMLTNotificationEvent:](TRIFetchBMLTNotificationsTask, "categoricalValueForBMLTNotificationEvent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:categoricalValue:", CFSTR("bmlt_completed_fetch"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "trackingId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIFetchBMLTNotificationsTask dimensions](self, "dimensions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v12, v13, v14, 0);

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TRIFetchBMLTNotificationsTask;
  if (-[TRIBaseTask isEqual:](&v7, sel_isEqual_, v4))
    v5 = -[TRITaskAttributing isEqual:](self->_taskAttribution, "isEqual:", v4[4]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TRIFetchBMLTNotificationsTask;
  v3 = -[TRIBaseTask hash](&v5, sel_hash);
  return -[TRITaskAttributing hash](self->_taskAttribution, "hash") + 37 * v3;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@,r:%d>"), objc_opt_class(), -[TRIFetchBMLTNotificationsTask retryCount](self, "retryCount"));
}

- (void)_addMetric:(id)a3
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
  v7[2] = __44__TRIFetchBMLTNotificationsTask__addMetric___block_invoke;
  v7[3] = &unk_1E9335DD0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __44__TRIFetchBMLTNotificationsTask__addMetric___block_invoke(uint64_t a1, _QWORD *a2)
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

- (void)_addDimension:(id)a3
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
  v7[2] = __47__TRIFetchBMLTNotificationsTask__addDimension___block_invoke;
  v7[3] = &unk_1E9335DD0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __47__TRIFetchBMLTNotificationsTask__addDimension___block_invoke(uint64_t a1, _QWORD *a2)
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
  v9 = __Block_byref_object_copy__46;
  v10 = __Block_byref_object_dispose__46;
  lock = self->_lock;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__TRIFetchBMLTNotificationsTask_metrics__block_invoke;
  v5[3] = &unk_1E9335DF8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__TRIFetchBMLTNotificationsTask_metrics__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(*(id *)(a2 + 8), "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)dimensions
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
  v9 = __Block_byref_object_copy__46;
  v10 = __Block_byref_object_dispose__46;
  lock = self->_lock;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__TRIFetchBMLTNotificationsTask_dimensions__block_invoke;
  v5[3] = &unk_1E9335DF8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__TRIFetchBMLTNotificationsTask_dimensions__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(*(id *)(a2 + 16), "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)trialSystemTelemetry
{
  void *v3;
  void *v4;

  +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:](TRITelemetryFactory, "containerOriginTelemetryForTaskAttribution:", self->_taskAttribution);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITaskAttributing teamIdentifier](self->_taskAttribution, "teamIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientTeamId:", v4);

  return v3;
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;
  TRIBMLTDeployment *deployment;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[TRITaskAttributing asPersistedTaskAttribution](self->_taskAttribution, "asPersistedTaskAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskAttribution:", v4);

  objc_msgSend(v3, "setRetryCount:", -[TRIFetchBMLTNotificationsTask retryCount](self, "retryCount"));
  deployment = self->_deployment;
  if (deployment)
  {
    -[TRIBMLTDeployment backgroundMLTaskId](deployment, "backgroundMLTaskId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundMlTaskId:", v6);

    objc_msgSend(v3, "setDeploymentId:", -[TRIBMLTDeployment deploymentId](self->_deployment, "deploymentId"));
  }
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

  -[TRIFetchBMLTNotificationsTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchBMLTNotificationsTask.m"), 793, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  +[TRIPBMessage parseFromData:error:](TRIFetchBMLTNotificationsPersistedTask, "parseFromData:error:", a3, &v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v18;
  if (!v3)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v4;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIFetchBMLTNotificationsPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_17;
  }
  if ((objc_msgSend(v3, "hasTaskAttribution") & 1) == 0)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: taskAttribution", buf, 0xCu);

    }
    goto LABEL_17;
  }
  objc_msgSend(v3, "taskAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:](TRITaskAttributionInternalInsecure, "taskAttributionFromPersistedTask:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    TRILogCategory_Server();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }

    v6 = 0;
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "hasBackgroundMlTaskId") && objc_msgSend(v3, "hasDeploymentId"))
  {
    v7 = (void *)MEMORY[0x1E0DC09A8];
    objc_msgSend(v3, "backgroundMlTaskId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deploymentWithBackgroundMLTaskId:deploymentId:", v8, objc_msgSend(v3, "deploymentId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v3, "hasBmltBatchNotificationId") & 1) != 0)
    {
      objc_msgSend(v3, "bmltBatchNotificationId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRIFetchBMLTNotificationsTask taskWithDeployment:taskAttribution:bmltBatchNotificationIdentifier:](TRIFetchBMLTNotificationsTask, "taskWithDeployment:taskAttribution:bmltBatchNotificationIdentifier:", v9, v6, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[TRIFetchBMLTNotificationsTask taskWithDeployment:taskAttribution:bmltBatchNotificationIdentifier:](TRIFetchBMLTNotificationsTask, "taskWithDeployment:taskAttribution:bmltBatchNotificationIdentifier:", v9, v6, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v3, "hasRetryCount"))
      v17 = objc_msgSend(v3, "retryCount");
    else
      v17 = 0;
    objc_msgSend(v11, "setRetryCount:", v17);

  }
  else
  {
    +[TRIFetchBMLTNotificationsTask taskWithTaskAttribution:](TRIFetchBMLTNotificationsTask, "taskWithTaskAttribution:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "hasRetryCount"))
      v14 = objc_msgSend(v3, "retryCount");
    else
      v14 = 0;
    objc_msgSend(v11, "setRetryCount:", v14);
  }
LABEL_18:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFetchBMLTNotificationsTask)initWithCoder:(id)a3
{
  id v4;
  TRIFetchBMLTNotificationsTask *v5;
  void *v6;
  TRIFetchBMLTNotificationsTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchBMLTNotificationsTask;
  v5 = -[TRIFetchBMLTNotificationsTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIFetchBMLTNotificationsTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchBMLTNotificationsTask.m"), 833, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIFetchBMLTNotificationsTask serialize](self, "serialize");
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
  objc_storeStrong((id *)&self->_bmltBatchNotificationIdentifier, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
  objc_storeStrong((id *)&self->_taskAttribution, 0);
  objc_storeStrong((id *)&self->_nextTasks, 0);
}

@end
