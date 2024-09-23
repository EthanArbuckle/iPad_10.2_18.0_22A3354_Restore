@implementation TRISelectRolloutNotificationListTask

- (int)taskType
{
  return 25;
}

- (NSArray)tags
{
  void *v3;

  v3 = (void *)objc_opt_new();
  +[TRITaskUtils addAttribution:toTaskTags:](TRITaskUtils, "addAttribution:toTaskTags:", self->_taskAttribution, v3);
  return (NSArray *)v3;
}

+ (id)taskWithNamespaceNames:(id)a3 taskAttribution:(id)a4
{
  id v5;
  id v6;
  TRISelectRolloutNotificationListTask *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[TRISelectRolloutNotificationListTask initWithNamespaceNames:taskAttribution:]([TRISelectRolloutNotificationListTask alloc], "initWithNamespaceNames:taskAttribution:", v6, v5);

  return v7;
}

- (TRISelectRolloutNotificationListTask)initWithNamespaceNames:(id)a3 taskAttribution:(id)a4
{
  id v7;
  id v8;
  TRISelectRolloutNotificationListTask *v9;
  TRISelectRolloutNotificationListTask *v10;
  uint64_t v11;
  NSMutableArray *nextTasks;
  id v13;
  void *v14;
  uint64_t v15;
  _PASLock *lock;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TRISelectRolloutNotificationListTask;
  v9 = -[TRISelectRolloutNotificationListTask init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_namespaceNames, a3);
    objc_storeStrong((id *)&v10->_taskAttribution, a4);
    v11 = objc_opt_new();
    nextTasks = v10->_nextTasks;
    v10->_nextTasks = (NSMutableArray *)v11;

    v13 = objc_alloc(MEMORY[0x1E0D815F0]);
    v14 = (void *)objc_opt_new();
    v15 = objc_msgSend(v13, "initWithGuardedData:", v14);
    lock = v10->_lock;
    v10->_lock = (_PASLock *)v15;

  }
  return v10;
}

- (void)_addNextTask:(id)a3
{
  -[NSMutableArray addObject:](self->_nextTasks, "addObject:", a3);
}

- (int64_t)nextTaskCount
{
  return -[NSMutableArray count](self->_nextTasks, "count");
}

- ($A5A652246548B43F8BC05201A1C72A70)_processRolloutArtifact:(id)a3 rolloutsProcessed:(id)a4 remainingNamespaces:(id)a5 targeter:(id)a6 context:(id)a7 taskQueue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  $A5A652246548B43F8BC05201A1C72A70 v31;
  void *v32;
  id v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t i;
  void *v42;
  char v43;
  void *v44;
  uint64_t v45;
  void *v46;
  __CFString *v47;
  __CFString *v48;
  NSObject *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  TRIRolloutRecord *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  TRIRolloutRecord *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  _BOOL4 v80;
  void *v81;
  void *v82;
  void *v83;
  const char *v84;
  NSObject *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  id v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  id v99;
  id v100;
  void (**v101)(_QWORD, _QWORD, _QWORD);
  void *v102;
  uint64_t v104;
  uint64_t v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  id v115;
  id v116;
  id v117;
  _QWORD v118[4];
  id v119;
  id v120;
  _QWORD v121[4];
  id v122;
  _BYTE v123[128];
  uint8_t v124[128];
  uint8_t buf[4];
  void *v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  void *v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v106 = a8;
  v105 = MEMORY[0x1D8232A5C]();
  v19 = MEMORY[0x1E0C809B0];
  v121[0] = MEMORY[0x1E0C809B0];
  v121[1] = 3221225472;
  v121[2] = __129__TRISelectRolloutNotificationListTask__processRolloutArtifact_rolloutsProcessed_remainingNamespaces_targeter_context_taskQueue___block_invoke;
  v121[3] = &unk_1E9335120;
  v20 = v16;
  v21 = v15;
  v22 = v20;
  v122 = v20;
  v104 = MEMORY[0x1D8232C48](v121);
  objc_msgSend(v14, "deployment");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rolloutId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a7) = objc_msgSend(v21, "containsObject:", v24);

  if ((_DWORD)a7)
  {
    TRILogCategory_Server();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v23, "shortDesc");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "rolloutId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      _NamespaceNamesForArtifact(v14);
      v28 = v18;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v126 = v26;
      v127 = 2114;
      v128 = v27;
      v129 = 2114;
      v130 = v29;
      _os_log_impl(&dword_1D207F000, v25, OS_LOG_TYPE_INFO, "Ignoring rollout deployment %{public}@ because rolloutId %{public}@ has already been processed for namespaces %{public}@.", buf, 0x20u);

      v18 = v28;
    }

    v30 = (void *)v104;
    v31.var0 = (*(unsigned __int8 (**)(uint64_t))(v104 + 16))(v104);
    v32 = (void *)v105;
    goto LABEL_59;
  }
  v102 = v18;
  v118[0] = v19;
  v118[1] = 3221225472;
  v118[2] = __129__TRISelectRolloutNotificationListTask__processRolloutArtifact_rolloutsProcessed_remainingNamespaces_targeter_context_taskQueue___block_invoke_23;
  v118[3] = &unk_1E9335148;
  v119 = v21;
  v33 = v22;
  v120 = v33;
  v101 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v118);
  v116 = 0;
  v117 = 0;
  v115 = 0;
  objc_msgSend(v14, "rollout");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v17, "targetRollout:factorPackSetId:relatedRampDeployment:error:", v34, &v117, &v116, &v115);

  if (v35 != 3)
  {
    if (v35 != 2)
    {
      v100 = v17;
      if (!(_BYTE)v35)
      {
        v99 = v22;
        v113 = 0u;
        v114 = 0u;
        v111 = 0u;
        v112 = 0u;
        -[TRISelectRolloutNotificationListTask metrics](self, "metrics");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v111, v124, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v112;
          while (2)
          {
            v40 = v21;
            for (i = 0; i != v38; ++i)
            {
              if (*(_QWORD *)v112 != v39)
                objc_enumerationMutation(v36);
              objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * i), "name");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(CFSTR("targeting_error"), "isEqual:", v42);

              if ((v43 & 1) != 0)
              {
                v21 = v40;
                goto LABEL_39;
              }
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v111, v124, 16);
            v21 = v40;
            if (v38)
              continue;
            break;
          }
        }

        objc_msgSend(v115, "userInfo");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("logMessage"));
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)v45;
        v47 = CFSTR("unknown");
        if (v45)
          v47 = (__CFString *)v45;
        v48 = v47;

        objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:categoricalValue:", CFSTR("targeting_error"), v48);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        -[TRISelectRolloutNotificationListTask _addMetric:](self, "_addMetric:", v36);
LABEL_39:

        v30 = (void *)v104;
        v31.var0 = (*(unsigned __int8 (**)(uint64_t))(v104 + 16))(v104);
        v22 = v99;
        v17 = v100;
        goto LABEL_58;
      }
      goto LABEL_25;
    }
LABEL_50:
    v30 = (void *)v104;
    v31.var0 = (*(unsigned __int8 (**)(uint64_t))(v104 + 16))(v104);
    goto LABEL_58;
  }
  TRILogCategory_Server();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v23, "shortDesc");
    v50 = v17;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v126 = v51;
    _os_log_impl(&dword_1D207F000, v49, OS_LOG_TYPE_DEFAULT, "Rollout deployment %{public}@ will not be applied because it represents an already-active ramp. Prior deployment will be reprocessed.", buf, 0xCu);

    v17 = v50;
  }

  objc_msgSend(v102, "rolloutDatabase");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v116;
  if (!v53)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v94 = v17;
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISelectRolloutNotificationListTask.m"), 171, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("relatedRampDeployment"));

    v17 = v94;
  }
  objc_msgSend(v52, "recordWithDeployment:usingTransaction:", v53, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v54)
  {
    TRILogCategory_Server();
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v116, "shortDesc");
      v91 = v17;
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      _NamespaceNamesForArtifact(v14);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v126 = v92;
      v127 = 2114;
      v128 = v93;
      _os_log_error_impl(&dword_1D207F000, v85, OS_LOG_TYPE_ERROR, "Unexpected failure to find related ramp deployment %{public}@ for namespaces %{public}@.", buf, 0x16u);

      v17 = v91;
    }

    goto LABEL_50;
  }
  v100 = v17;
  objc_msgSend(v54, "artifact");
  v55 = objc_claimAutoreleasedReturnValue();

  v56 = v116;
  v23 = v56;
  v14 = (id)v55;
LABEL_25:
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  objc_msgSend(v14, "namespaceNames");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v107, v123, 16);
  if (!v58)
    goto LABEL_33;
  v59 = v58;
  v60 = *(_QWORD *)v108;
  while (2)
  {
    for (j = 0; j != v59; ++j)
    {
      if (*(_QWORD *)v108 != v60)
        objc_enumerationMutation(v57);
      if ((objc_msgSend(v33, "containsObject:", *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * j)) & 1) != 0)
      {

        objc_msgSend(v23, "rolloutId");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "namespaceNames");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *))v101)[2](v101, v66, v67);

        v68 = [TRIRolloutRecord alloc];
        objc_msgSend(v14, "rollout");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v69, "hasRampId");
        if (v70)
        {
          objc_msgSend(v14, "rollout");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "rampId");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          TRIValidateRampId();
          v71 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v71 = 0;
        }
        objc_msgSend(v14, "namespaceNames");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "rollout");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v96) = objc_msgSend(v73, "hasShadowEvaluation");
        v74 = -[TRIRolloutRecord initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:](v68, "initWithDeployment:rampId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:namespaces:isShadow:artifact:", v23, v71, 0, 0, 0, 0, 0, v72, v96, v14);

        if (v70)
        {

        }
        objc_msgSend(v102, "rolloutDatabase");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "addNewRolloutWithRecord:", v74);

        objc_msgSend(v102, "rolloutDatabase");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "recordWithDeployment:usingTransaction:", v23, 0);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v100;
        if (!v77)
        {
          TRILogCategory_Server();
          v86 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v23, "shortDesc");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            _NamespaceNamesForArtifact(v14);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v126 = v87;
            v127 = 2114;
            v128 = v88;
            _os_log_error_impl(&dword_1D207F000, v86, OS_LOG_TYPE_ERROR, "Unexpected failure to find rollout deployment %{public}@ for namespaces %{public}@.", buf, 0x16u);

            v17 = v100;
          }
          goto LABEL_57;
        }
        objc_msgSend(v77, "activeFactorPackSetId");
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        TRILogCategory_Server();
        v79 = objc_claimAutoreleasedReturnValue();
        v80 = os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT);
        if (v78)
        {
          if (v80)
          {
            objc_msgSend(v23, "shortDesc");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            _NamespaceNamesForArtifact(v14);
            v82 = v100;
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v126 = v81;
            v127 = 2114;
            v128 = v83;
            v84 = "Rollout deployment %{public}@ was selected, but is already active. Scheduling re-activation for namespaces %{public}@";
LABEL_55:
            _os_log_impl(&dword_1D207F000, v79, OS_LOG_TYPE_DEFAULT, v84, buf, 0x16u);

            v17 = v82;
          }
        }
        else if (v80)
        {
          objc_msgSend(v23, "shortDesc");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          _NamespaceNamesForArtifact(v14);
          v82 = v100;
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v126 = v81;
          v127 = 2114;
          v128 = v83;
          v84 = "Rollout deployment %{public}@ is selected and not yet active; scheduling activation for namespaces %{public}@.";
          goto LABEL_55;
        }

        objc_msgSend(v23, "rolloutId");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "cancelTasksWithTag:", v89);

        +[TRIRolloutTargetingTask taskWithRolloutDeployment:includeDependencies:taskAttribution:triggerEvent:](TRIRolloutTargetingTask, "taskWithRolloutDeployment:includeDependencies:taskAttribution:triggerEvent:", v23, 0, self->_taskAttribution, 0);
        v86 = objc_claimAutoreleasedReturnValue();
        -[TRISelectRolloutNotificationListTask _addNextTask:](self, "_addNextTask:", v86);
LABEL_57:

        v30 = (void *)v104;
        v31.var0 = (*(unsigned __int8 (**)(uint64_t))(v104 + 16))(v104);

        goto LABEL_58;
      }
    }
    v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v107, v123, 16);
    if (v59)
      continue;
    break;
  }
LABEL_33:

  objc_msgSend(v23, "rolloutId");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "namespaceNames");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *))v101)[2](v101, v62, v63);

  TRILogCategory_Server();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v23, "shortDesc");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v126 = v65;
    _os_log_impl(&dword_1D207F000, v64, OS_LOG_TYPE_DEFAULT, "Ignoring rollout deployment %{public}@ because it does not impact unhandled namespaces.", buf, 0xCu);

  }
  v30 = (void *)v104;
  v31.var0 = (*(unsigned __int8 (**)(uint64_t))(v104 + 16))(v104);
  v17 = v100;
LABEL_58:
  v18 = v102;
  v32 = (void *)v105;

LABEL_59:
  objc_autoreleasePoolPop(v32);

  return v31;
}

BOOL __129__TRISelectRolloutNotificationListTask__processRolloutArtifact_rolloutsProcessed_remainingNamespaces_targeter_context_taskQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "count") != 0;
}

void __129__TRISelectRolloutNotificationListTask__processRolloutArtifact_rolloutsProcessed_remainingNamespaces_targeter_context_taskQueue___block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 40), "removeObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  TRIRolloutTargeter *v19;
  void *v20;
  TRISystemCovariates *v21;
  void *v22;
  TRISystemCovariates *v23;
  TRIUserCovariates *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  dispatch_semaphore_t v39;
  NSObject *v40;
  NSObject *v41;
  os_signpost_id_t v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  void *v63;
  id v64;
  void *v65;
  TRIFetchOptions *v66;
  void *v67;
  void *context;
  void *v69;
  void *v70;
  id v71;
  TRIRolloutTargeter *v72;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t v79[16];
  _QWORD v80[4];
  id v81;
  TRISelectRolloutNotificationListTask *v82;
  id v83;
  TRIRolloutTargeter *v84;
  id v85;
  id v86;
  NSObject *v87;
  uint64_t *v88;
  uint64_t *v89;
  _BYTE *v90;
  _QWORD *v91;
  _QWORD v92[4];
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  int v102;
  _QWORD v103[4];
  id v104;
  uint8_t v105[128];
  _BYTE buf[24];
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v71 = a4;
  context = (void *)MEMORY[0x1D8232A5C]();
  v69 = (void *)os_transaction_create();
  objc_msgSend(v6, "keyValueStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIFetchDateManager managerWithKeyValueStore:](TRIFetchDateManager, "managerWithKeyValueStore:", v7);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "namespaceDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "namespaceDescriptorsDefaultDir");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:](TRINamespaceDescriptorProvider, "providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v8, v10);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[TRITaskAttributing triCloudKitContainer](self->_taskAttribution, "triCloudKitContainer");
  -[TRITaskAttributing teamIdentifier](self->_taskAttribution, "teamIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITaskAttributing applicationBundleIdentifier](self->_taskAttribution, "applicationBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRICKNativeArtifactProvider providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:](TRICKNativeArtifactProvider, "providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:", v11, v12, v13, v73, v74, v6);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRITaskAttributing networkOptions](self->_taskAttribution, "networkOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "allowsCellularAccess"))
  {
    objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("allows_cellular_download"), objc_msgSend(v14, "allowsCellularAccess"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRISelectRolloutNotificationListTask _addMetric:](self, "_addMetric:", v15);

  }
  if (!objc_msgSend(v14, "discretionaryBehavior"))
    goto LABEL_6;
  v16 = objc_msgSend(v14, "requiredCapability");
  -[TRIBaseTask stateProvider](self, "stateProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activeActivityGrantingCapability:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v14, "setActivity:", v18);

LABEL_6:
    v19 = [TRIRolloutTargeter alloc];
    objc_msgSend(v6, "rolloutDatabase");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = [TRISystemCovariates alloc];
    objc_msgSend(v6, "paths");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[TRISystemCovariates initWithPaths:](v21, "initWithPaths:", v22);
    v24 = -[TRIUserCovariates initWithContext:]([TRIUserCovariates alloc], "initWithContext:", v6);
    v72 = -[TRIRolloutTargeter initWithDatabase:systemCovariateProvider:userCovariateProvider:](v19, "initWithDatabase:systemCovariateProvider:userCovariateProvider:", v20, v23, v24);

    v25 = (void *)objc_opt_new();
    v103[0] = MEMORY[0x1E0C809B0];
    v103[1] = 3221225472;
    v103[2] = __70__TRISelectRolloutNotificationListTask_runUsingContext_withTaskQueue___block_invoke;
    v103[3] = &unk_1E9335170;
    v26 = v25;
    v104 = v26;
    objc_msgSend(v74, "enumerateDefaultDescriptorsWithBlock:", v103);
    -[TRISelectRolloutNotificationListTask namespaceNames](self, "namespaceNames");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (v28)
    {
      -[TRISelectRolloutNotificationListTask namespaceNames](self, "namespaceNames");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "intersectSet:", v29);

    }
    if (objc_msgSend(v26, "count"))
    {
      v30 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v26, "allObjects");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v26, "count");
      if (v32 >= 3)
        v33 = 3;
      else
        v33 = v32;
      objc_msgSend(v31, "subarrayWithRange:", 0, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "componentsJoinedByString:", CFSTR(", "));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      TRILogCategory_Server();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = objc_msgSend(v26, "count");
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v37;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v35;
        _os_log_impl(&dword_1D207F000, v36, OS_LOG_TYPE_DEFAULT, "Selecting best rollout deployments for %tu namespaces: [%{public}@, ...].", buf, 0x16u);
      }

      objc_autoreleasePoolPop(v30);
      v38 = (void *)objc_opt_new();
      v39 = dispatch_semaphore_create(0);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v107 = __Block_byref_object_copy__39;
      v108 = __Block_byref_object_dispose__39;
      v109 = 0;
      v99 = 0;
      v100 = &v99;
      v101 = 0x2020000000;
      v102 = 0;
      v93 = 0;
      v94 = &v93;
      v95 = 0x3032000000;
      v96 = __Block_byref_object_copy__39;
      v97 = __Block_byref_object_dispose__39;
      v98 = 0;
      v92[0] = 0;
      v92[1] = v92;
      v92[2] = 0x2020000000;
      v92[3] = 0;
      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = __70__TRISelectRolloutNotificationListTask_runUsingContext_withTaskQueue___block_invoke_49;
      v80[3] = &unk_1E9335198;
      v88 = &v99;
      v89 = &v93;
      v90 = buf;
      v81 = v26;
      v82 = self;
      v64 = v38;
      v83 = v64;
      v84 = v72;
      v85 = v6;
      v86 = v71;
      v91 = v92;
      v40 = v39;
      v87 = v40;
      v67 = (void *)MEMORY[0x1D8232C48](v80);
      v66 = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:]([TRIFetchOptions alloc], "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v14, &unk_1E9363F30);
      TRILogCategory_Server();
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = os_signpost_id_generate(v41);

      TRILogCategory_Server();
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
      {
        *(_WORD *)v79 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D207F000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v42, "FetchRolloutNotificationsDateDescending", (const char *)&unk_1D220A8CD, v79, 2u);
      }

      objc_msgSend(v70, "fetchRolloutNotificationsDateDescendingWithOptions:completion:", v66, v67);
      dispatch_semaphore_wait(v40, 0xFFFFFFFFFFFFFFFFLL);
      TRILogCategory_Server();
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = v45;
      if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
      {
        *(_WORD *)v79 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D207F000, v46, OS_SIGNPOST_INTERVAL_END, v42, "FetchRolloutNotificationsDateDescending", (const char *)&unk_1D220A8CD, v79, 2u);
      }

      if (v94[5])
      {
        self->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:](TRICKNativeArtifactProvider, "isActivityDeferralError:", v64);
        TRIFetchErrorParseToMetrics((void *)v94[5]);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v47, "count"))
        {
          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          v48 = v47;
          v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v75, v105, 16);
          if (v49)
          {
            v50 = *(_QWORD *)v76;
            do
            {
              for (i = 0; i != v49; ++i)
              {
                if (*(_QWORD *)v76 != v50)
                  objc_enumerationMutation(v48);
                -[TRISelectRolloutNotificationListTask _addMetric:](self, "_addMetric:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i));
              }
              v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v75, v105, 16);
            }
            while (v49);
          }

        }
      }
      -[TRISelectRolloutNotificationListTask namespaceNames](self, "namespaceNames", v64);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (v52)
      {
        v53 = (void *)MEMORY[0x1E0DC0A00];
        -[TRISelectRolloutNotificationListTask namespaceNames](self, "namespaceNames");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "allObjects");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "immediateDownloadNotificationKeyForNamespaceNames:", v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v56 = 0;
      }

      if (*((_DWORD *)v100 + 6) == 2)
      {
        v60 = 2;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC0A00], "notifyDownloadFailedForKey:withCloudKitError:", v56, v94[5]);
        v60 = *((unsigned int *)v100 + 6);
      }
      v61 = (void *)-[NSMutableArray copy](self->_nextTasks, "copy");
      +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v60, 1, v61, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(v92, 8);
      _Block_object_dispose(&v93, 8);

      _Block_object_dispose(&v99, 8);
      _Block_object_dispose(buf, 8);

    }
    else
    {
      TRILogCategory_Server();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        -[TRISelectRolloutNotificationListTask namespaceNames](self, "namespaceNames");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v63;
        _os_log_error_impl(&dword_1D207F000, v57, OS_LOG_TYPE_ERROR, "Request to select best rollout deployments specified unregistered namespaces: %{public}@", buf, 0xCu);

      }
      +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 2, 1, MEMORY[0x1E0C9AA60], 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_45;
  }
  TRILogCategory_Server();
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v59, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", buf, 2u);
  }

  v72 = (TRIRolloutTargeter *)-[NSMutableArray copy](self->_nextTasks, "copy");
  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 1, 1, v72, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_45:

  objc_autoreleasePoolPop(context);
  return v58;
}

void __70__TRISelectRolloutNotificationListTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "namespaceName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __70__TRISelectRolloutNotificationListTask_runUsingContext_withTaskQueue___block_invoke_49(uint64_t a1, unint64_t a2, void *a3, void *a4, void *a5, _BYTE *a6)
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a2 <= 1)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    goto LABEL_3;
  }
  if (a2 == 2)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    if (v12)
    {
      *(_DWORD *)(v14 + 24) = 1;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), a4);
      goto LABEL_7;
    }
LABEL_3:
    *(_DWORD *)(v14 + 24) = 3;
LABEL_7:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), a5);
LABEL_8:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 80));
    goto LABEL_9;
  }
  if (v11)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v11, "namespaceNames", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (!v16)
    {
LABEL_19:

      goto LABEL_9;
    }
    v17 = v16;
    v18 = *(_QWORD *)v25;
LABEL_13:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v18)
        objc_enumerationMutation(v15);
      if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v19)) & 1) != 0)
        break;
      if (v17 == ++v19)
      {
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        if (v17)
          goto LABEL_13;
        goto LABEL_19;
      }
    }

    v20 = objc_msgSend(*(id *)(a1 + 40), "_processRolloutArtifact:rolloutsProcessed:remainingNamespaces:targeter:context:taskQueue:", v11, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
    if (v20)
      goto LABEL_21;
    if (a6)
      *a6 = 1;
    if (a2 - 3 >= 2)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_21:
  if (a2 != 3)
  {
    if (a2 != 4)
      goto LABEL_8;
LABEL_30:
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
    {
      TRILogCategory_Server();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D207F000, v23, OS_LOG_TYPE_DEFAULT, "Fetch status success but 0 results fetched.", buf, 2u);
      }

    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 2;
    goto LABEL_8;
  }
  TRILogCategory_Server();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
    *(_DWORD *)buf = 134217984;
    v29 = v22;
    _os_log_impl(&dword_1D207F000, v21, OS_LOG_TYPE_DEFAULT, "Fetched %ld results, with more results pending.", buf, 0xCu);
  }

LABEL_9:
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TRISelectRolloutNotificationListTask;
  if (-[TRIBaseTask isEqual:](&v12, sel_isEqual_, v4))
  {
    v5 = v4;
    if (-[TRITaskAttributing isEqual:](self->_taskAttribution, "isEqual:", v5[4]))
    {
      -[TRISelectRolloutNotificationListTask namespaceNames](self, "namespaceNames");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "namespaceNames");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

        goto LABEL_10;
      }
      v8 = v7;
      if (v6 && v7)
      {
        v9 = objc_msgSend(v6, "isEqualToSet:", v7);

        if ((v9 & 1) == 0)
          goto LABEL_12;
LABEL_10:
        v10 = 1;
LABEL_13:

        goto LABEL_14;
      }

    }
LABEL_12:
    v10 = 0;
    goto LABEL_13;
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TRISelectRolloutNotificationListTask;
  v3 = -[TRIBaseTask hash](&v8, sel_hash);
  -[TRISelectRolloutNotificationListTask namespaceNames](self, "namespaceNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TRISelectRolloutNotificationListTask namespaceNames](self, "namespaceNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash");

  }
  else
  {
    v6 = 0;
  }

  return -[TRITaskAttributing hash](self->_taskAttribution, "hash") + 37 * (v6 + 37 * v3);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TRISelectRolloutNotificationListTask namespaceNames](self, "namespaceNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
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
  v7[2] = __51__TRISelectRolloutNotificationListTask__addMetric___block_invoke;
  v7[3] = &unk_1E93351C0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __51__TRISelectRolloutNotificationListTask__addMetric___block_invoke(uint64_t a1, _QWORD *a2)
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
  v7[2] = __54__TRISelectRolloutNotificationListTask__addDimension___block_invoke;
  v7[3] = &unk_1E93351C0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __54__TRISelectRolloutNotificationListTask__addDimension___block_invoke(uint64_t a1, _QWORD *a2)
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
  v9 = __Block_byref_object_copy__39;
  v10 = __Block_byref_object_dispose__39;
  lock = self->_lock;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__TRISelectRolloutNotificationListTask_metrics__block_invoke;
  v5[3] = &unk_1E93351E8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__TRISelectRolloutNotificationListTask_metrics__block_invoke(uint64_t a1, uint64_t a2)
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
  v9 = __Block_byref_object_copy__39;
  v10 = __Block_byref_object_dispose__39;
  lock = self->_lock;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__TRISelectRolloutNotificationListTask_dimensions__block_invoke;
  v5[3] = &unk_1E93351E8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __50__TRISelectRolloutNotificationListTask_dimensions__block_invoke(uint64_t a1, uint64_t a2)
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
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  -[TRITaskAttributing asPersistedTaskAttribution](self->_taskAttribution, "asPersistedTaskAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskAttribution:", v4);

  -[TRISelectRolloutNotificationListTask namespaceNames](self, "namespaceNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[TRISelectRolloutNotificationListTask namespaceNames](self, "namespaceNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v3, "setNamespacesArray:", v9);

  }
  objc_msgSend(v3, "setRetryCount:", -[TRISelectRolloutNotificationListTask retryCount](self, "retryCount"));
  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRISelectRolloutNotificationListTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISelectRolloutNotificationListTask.m"), 547, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  objc_class *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  +[TRIPBMessage parseFromData:error:](TRISelectRolloutNotificationListPersistedTask, "parseFromData:error:", a3, &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  if (!v4)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v5;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRISelectRolloutNotificationListPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if ((objc_msgSend(v4, "hasTaskAttribution") & 1) == 0)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v15;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: taskAttribution", buf, 0xCu);

    }
LABEL_10:
    v11 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v4, "taskAttribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:](TRITaskAttributionInternalInsecure, "taskAttributionFromPersistedTask:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v4, "namespacesArray_Count"))
    {
      v8 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v4, "namespacesArray");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "initWithArray:", v9);

    }
    else
    {
      v10 = 0;
    }
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNamespaceNames:taskAttribution:", v10, v7);
    if (objc_msgSend(v4, "hasRetryCount"))
      v12 = objc_msgSend(v4, "retryCount");
    else
      v12 = 0;
    objc_msgSend(v11, "setRetryCount:", v12);
  }
  else
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    v11 = 0;
  }

LABEL_20:
  return v11;
}

- (unint64_t)requiredCapabilities
{
  void *v3;
  unint64_t v4;

  -[TRITaskAttributing networkOptions](self->_taskAttribution, "networkOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "requiredCapability");

  if (-[TRISelectRolloutNotificationListTask retryCount](self, "retryCount"))
    return v4 | 4;
  else
    return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRISelectRolloutNotificationListTask)initWithCoder:(id)a3
{
  id v4;
  TRISelectRolloutNotificationListTask *v5;
  void *v6;
  TRISelectRolloutNotificationListTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRISelectRolloutNotificationListTask;
  v5 = -[TRISelectRolloutNotificationListTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRISelectRolloutNotificationListTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISelectRolloutNotificationListTask.m"), 587, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRISelectRolloutNotificationListTask serialize](self, "serialize");
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

- (NSSet)namespaceNames
{
  return self->_namespaceNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceNames, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_taskAttribution, 0);
  objc_storeStrong((id *)&self->_nextTasks, 0);
}

@end
