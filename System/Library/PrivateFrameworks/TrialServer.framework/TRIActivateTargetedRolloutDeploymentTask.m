@implementation TRIActivateTargetedRolloutDeploymentTask

- (TRIActivateTargetedRolloutDeploymentTask)initWithDeployment:(id)a3 factorPackSetId:(id)a4 taskAttribution:(id)a5 capabilityModifier:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  TRIActivateTargetedRolloutDeploymentTask *v16;
  TRIActivateTargetedRolloutDeploymentTask *v17;
  TRIRolloutTaskSupport *v18;
  TRIRolloutTaskSupport *support;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedRolloutDeploymentTask.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedRolloutDeploymentTask.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  if (!v13)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedRolloutDeploymentTask.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskAttribution"));

LABEL_4:
  v32.receiver = self;
  v32.super_class = (Class)TRIActivateTargetedRolloutDeploymentTask;
  v16 = -[TRIActivateTargetedRolloutDeploymentTask init](&v32, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_deployment, a3);
    objc_storeStrong((id *)&v17->_factorPackSetId, a4);
    objc_storeStrong((id *)&v17->_taskAttribution, a5);
    v18 = -[TRIRolloutTaskSupport initWithRolloutDeployment:]([TRIRolloutTaskSupport alloc], "initWithRolloutDeployment:", v17->_deployment);
    support = v17->_support;
    v17->_support = v18;

    objc_storeStrong((id *)&v17->_capabilityModifier, a6);
    v20 = (void *)objc_opt_new();
    objc_msgSend(v12, "rolloutId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ensureRolloutFields");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setClientRolloutId:", v21);

    loggableFactorPackSetIdFromFactorPackSetId(v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ensureRolloutFields");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setClientFactorPackSetId:", v23);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "deploymentId"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setClientDeploymentId:", v26);

    +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:](TRITelemetryFactory, "containerOriginTelemetryForTaskAttribution:", v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIRolloutTaskSupport mergeTelemetry:](v17->_support, "mergeTelemetry:", v20);
    -[TRIRolloutTaskSupport mergeTelemetry:](v17->_support, "mergeTelemetry:", v27);

  }
  return v17;
}

+ (id)taskWithDeployment:(id)a3 factorPackSetId:(id)a4 taskAttribution:(id)a5 capabilityModifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDeployment:factorPackSetId:taskAttribution:capabilityModifier:", v13, v12, v11, v10);

  return v14;
}

- (int)taskType
{
  return 21;
}

- (NSArray)tags
{
  return (NSArray *)-[TRIRolloutTaskSupport tags](self->_support, "tags");
}

- (NSArray)dependencies
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  +[TRIFetchSingleRolloutNotificationTask taskWithDeployment:taskAttributing:](TRIFetchSingleRolloutNotificationTask, "taskWithDeployment:taskAttributing:", self->_deployment, self->_taskAttribution);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  +[TRIFetchFactorPackSetTask taskWithFactorPackSetId:taskAttribution:rolloutDeployment:capabilityModifier:](TRIFetchFactorPackSetTask, "taskWithFactorPackSetId:taskAttribution:rolloutDeployment:capabilityModifier:", self->_factorPackSetId, self->_taskAttribution, self->_deployment, self->_capabilityModifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)runEnqueueHandlerUsingContext:(id)a3
{
  TRIFactorPackSetId *factorPackSetId;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  factorPackSetId = self->_factorPackSetId;
  v5 = a3;
  +[TRIContentTracker contentIdentifierForFactorPackSetWithId:](TRIContentTracker, "contentIdentifierForFactorPackSetWithId:", factorPackSetId);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addRefWithContentIdentifier:", v9);

  +[TRIContentTracker contentIdentifierForRolloutArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForRolloutArtifactWithDeployment:", self->_deployment);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addRefWithContentIdentifier:", v7);
}

- (void)runDequeueHandlerUsingContext:(id)a3
{
  TRIFactorPackSetId *factorPackSetId;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  factorPackSetId = self->_factorPackSetId;
  v5 = a3;
  +[TRIContentTracker contentIdentifierForFactorPackSetWithId:](TRIContentTracker, "contentIdentifierForFactorPackSetWithId:", factorPackSetId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentTracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dropRefWithContentIdentifier:", v6);

  +[TRIContentTracker contentIdentifierForRolloutArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForRolloutArtifactWithDeployment:", self->_deployment);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentTracker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v9, "dropRefWithContentIdentifier:", v8);
  if ((v5 & 1) == 0)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[TRIRolloutDeployment shortDesc](self->_deployment, "shortDesc");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for rollout %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }

}

- (BOOL)_notifyUpdatedShadowEvaluationsWithDeployments:(id)a3 context:(id)a4 usingTransaction:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __CFString *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  BOOL v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  id obj;
  uint64_t v57;
  uint64_t v58;
  void *context;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  const __CFString *v69;
  __int16 v70;
  __CFString *v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v49 = objc_msgSend(&unk_1E9363870, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
  if (v49)
  {
    v10 = *(_QWORD *)v65;
    v52 = v8;
    v53 = v9;
    v51 = v7;
    v48 = *(_QWORD *)v65;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v65 != v10)
          objc_enumerationMutation(&unk_1E9363870);
        v50 = v11;
        v55 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v11);
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        obj = v7;
        v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
        if (v58)
        {
          v57 = *(_QWORD *)v61;
          while (2)
          {
            for (i = 0; i != v58; ++i)
            {
              if (*(_QWORD *)v61 != v57)
                objc_enumerationMutation(obj);
              v13 = *(__CFString **)(*((_QWORD *)&v60 + 1) + 8 * i);
              v14 = (void *)MEMORY[0x1D8232A5C]();
              objc_msgSend(v8, "rolloutDatabase");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "recordWithDeployment:usingTransaction:", v13, v9);
              v16 = objc_claimAutoreleasedReturnValue();

              if (!v16)
              {
                TRILogCategory_Server();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v69 = v13;
                  _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Unexpected failure to find record for rollout deployment %{public}@.", buf, 0xCu);
                }
                goto LABEL_37;
              }
              -[NSObject artifact](v16, "artifact");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "rollout");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "shadowEvaluation");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "typeOneOfCase");

              context = v14;
              if (v20 == 1)
              {
                -[NSObject activeFactorPackSetId](v16, "activeFactorPackSetId");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (v21)
                  v22 = 1;
                else
                  v22 = 2;

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v23, "isEqualToNumber:", v55);

                if (v24)
                {
                  TRILogCategory_Server();
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    -[NSObject activeFactorPackSetId](v16, "activeFactorPackSetId");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v27 = CFSTR("activated");
                    if (!v26)
                      v27 = CFSTR("deactivated");
                    v69 = v27;
                    v70 = 2112;
                    v71 = v13;
                    _os_log_impl(&dword_1D207F000, v25, OS_LOG_TYPE_DEFAULT, "Notifying MLRuntime of %@ shadow evaluation for rollout deployment %@.", buf, 0x16u);

                  }
                  -[NSObject activeFactorPackSetId](v16, "activeFactorPackSetId");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = v28 ? (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B68]), "initWithDeployment:", v13) : 0;

                  v30 = objc_alloc(MEMORY[0x1E0DC0A20]);
                  -[NSObject artifact](v16, "artifact");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "rollout");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "shadowEvaluation");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "mlRuntime");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "evaluationId");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = (void *)objc_opt_new();
                  v37 = (void *)objc_msgSend(v30, "initWithType:evaluationId:date:evalState:", v22, v35, v36, v54);

                  v38 = objc_alloc(MEMORY[0x1E0DC0AC8]);
                  -[NSObject artifact](v16, "artifact");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "rollout");
                  v40 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v40, "shadowEvaluation");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "mlRuntime");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = (void *)objc_msgSend(v38, "initWithEvaluation:status:", v42, v37);

                  v8 = v52;
                  objc_msgSend(v52, "evaluationHistoryDatabase");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v40) = objc_msgSend(v44, "addRecord:usingTransaction:", v43, v53);

                  v9 = v53;
                  if ((v40 & 1) == 0)
                  {
                    v14 = context;
LABEL_37:

                    objc_autoreleasePoolPop(v14);
                    v46 = 0;
                    v7 = v51;
                    goto LABEL_38;
                  }
                }
              }
              else
              {
                TRILogCategory_Server();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  -[__CFString shortDesc](v13, "shortDesc");
                  v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v69 = v45;
                  _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "Don't know how to handle shadow evaluation on rollout deployment %{public}@ with unspecified type.", buf, 0xCu);

                  v9 = v53;
                }

              }
              objc_autoreleasePoolPop(context);
            }
            v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
            if (v58)
              continue;
            break;
          }
        }

        v11 = v50 + 1;
        v7 = v51;
        v10 = v48;
      }
      while (v50 + 1 != v49);
      v46 = 1;
      v49 = objc_msgSend(&unk_1E9363870, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
    }
    while (v49);
  }
  else
  {
    v46 = 1;
  }
LABEL_38:

  return v46;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6;
  TRITaskRunResult *v7;
  void *v8;
  TRISystemCovariates *v9;
  void *v10;
  TRISystemCovariates *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  TRITaskRunResult *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  TRITaskRunResult *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  TRIFactorPackSetId *factorPackSetId;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  int v54;
  NSObject *v55;
  void *v56;
  TRIFactorPackSetId *v57;
  TRITaskRunResult *v58;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  char v65;
  TRINamespaceResolverStorage *v66;
  void *v67;
  TRIRolloutDeployment *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t j;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t k;
  uint64_t v84;
  NSObject *v85;
  void *v86;
  void *v87;
  TRITaskRunResult *v88;
  TRITaskRunResult *v89;
  void *v90;
  void *v91;
  TRIRolloutDeployment *deployment;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  id v103;
  void *v104;
  id v105;
  id v106;
  void *v107;
  id v108;
  TRINamespaceResolverStorage *v109;
  void *v110;
  void *v111;
  void *v112;
  TRITaskRunResult *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  __CFString *v119;
  void *v120;
  void *v121;
  void *v122;
  TRISystemCovariates *v123;
  id v124;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _QWORD v134[5];
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  __CFString *v141;
  id v142;
  id v143;
  id v144;
  TRINamespaceResolverStorage *v145;
  id v146;
  _BYTE *v147;
  BOOL v148;
  BOOL v149;
  char v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  uint8_t v155[4];
  uint64_t v156;
  _BYTE v157[128];
  TRIActivateTargetedRolloutDeploymentTask *v158;
  uint8_t v159[128];
  _BYTE buf[24];
  char v161;
  _BYTE v162[128];
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v124 = a4;
  v7 = [TRITaskRunResult alloc];
  v113 = -[TRITaskRunResult initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](v7, "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 3, 1, MEMORY[0x1E0C9AA60], 0);
  v8 = (void *)objc_opt_new();
  v112 = (void *)objc_opt_new();
  v9 = [TRISystemCovariates alloc];
  v121 = v6;
  objc_msgSend(v6, "paths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TRISystemCovariates initWithPaths:](v9, "initWithPaths:", v10);

  v123 = v11;
  -[TRISystemCovariates dictionary](v11, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForKey:", CFSTR("OSBuild"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRISystemCovariates dictionary](v11, "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForKey:", CFSTR("UserSettingsLanguageCode"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRISystemCovariates dictionary](v11, "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueForKey:", CFSTR("UserSettingsRegionCode"));
  v119 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[TRISystemCovariates dictionary](v11, "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForKey:", CFSTR("BCP47DeviceLocale"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  if (v118)
  {
    objc_msgSend(v118, "componentsSeparatedByString:", CFSTR("-"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v118, "componentsSeparatedByString:", CFSTR("-"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastObject");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v20 = &stru_1E9336E60;
    if (v19)
      v20 = v19;
    v119 = v20;

    v120 = (void *)v17;
  }
  -[TRISystemCovariates dictionary](v11, "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "valueForKey:", CFSTR("CarrierBundleIdentifier"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRISystemCovariates dictionary](v11, "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "valueForKey:", CFSTR("CarrierCountryIsoCode"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRISystemCovariates dictionary](v11, "dictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "valueForKey:", CFSTR("DiagnosticsUsageEnabled"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24 != 0;

  -[TRISystemCovariates dictionary](v11, "dictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "valueForKey:", CFSTR("HasANE"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 != 0;

  -[TRISystemCovariates dictionary](v11, "dictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "valueForKey:", CFSTR("ANEVersion"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v117)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedRolloutDeploymentTask.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("osBuild"));

  }
  if (!v120)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedRolloutDeploymentTask.m"), 211, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("languageCode"));

  }
  if (!v119)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedRolloutDeploymentTask.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regionCode"));

  }
  if (!v116)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedRolloutDeploymentTask.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("carrierBundleId"));

  }
  if (!v115)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedRolloutDeploymentTask.m"), 214, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("carrierCountryCode"));

  }
  if (!v114)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedRolloutDeploymentTask.m"), 215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aneVersion"));

  }
  objc_msgSend(v121, "rolloutDatabase");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "recordWithDeployment:usingTransaction:", self->_deployment, 0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  if (v122)
  {
    objc_msgSend(v121, "namespaceDatabase");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "paths");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "namespaceDescriptorsDefaultDir");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:](TRINamespaceDescriptorProvider, "providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v31, v33);
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v122, "artifact");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "rollout");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRISetupAssistantFetchUtils getIncompatibleNamespaceNamesForTriClientRollout:namespaceDescriptorProvider:](TRISetupAssistantFetchUtils, "getIncompatibleNamespaceNamesForTriClientRollout:namespaceDescriptorProvider:", v35, v111);
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v110, "count"))
    {
      TRILogCategory_Server();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        deployment = self->_deployment;
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = deployment;
        _os_log_error_impl(&dword_1D207F000, v36, OS_LOG_TYPE_ERROR, "Rollout deployment %{public}@ does not match the device NCVs. Completing task without activating deployment.", buf, 0xCu);
      }

      v37 = [TRITaskRunResult alloc];
      v38 = -[TRITaskRunResult initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](v37, "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 2, 0, MEMORY[0x1E0C9AA60], 0);
      goto LABEL_35;
    }
    v43 = (void *)objc_opt_new();
    objc_msgSend(v122, "rampId");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v122, "rampId");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "ensureRolloutFields");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setClientRampId:", v45);

    }
    factorPackSetId = self->_factorPackSetId;
    objc_msgSend(v122, "targetedFactorPackSetId");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TRIFactorPackSetId isEqual:](factorPackSetId, "isEqual:", v48))
    {
      objc_msgSend(v122, "targetedTargetingRuleIndex");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = v122;
      if (!v49)
      {
LABEL_31:
        -[TRIRolloutTaskSupport mergeTelemetry:](self->_support, "mergeTelemetry:", v43);

        objc_msgSend(v50, "activeFactorPackSetId");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "isEqualToString:", self->_factorPackSetId);

        if (!v54)
        {
          v60 = v122;
          if (objc_msgSend(v122, "isShadow"))
          {
            objc_msgSend(v112, "addObject:", self->_deployment);
          }
          else
          {
            v153 = 0u;
            v154 = 0u;
            v151 = 0u;
            v152 = 0u;
            objc_msgSend(v122, "namespaces");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v151, v162, 16);
            if (v62)
            {
              v63 = *(_QWORD *)v152;
              do
              {
                for (i = 0; i != v62; ++i)
                {
                  if (*(_QWORD *)v152 != v63)
                    objc_enumerationMutation(v61);
                  objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v151 + 1) + 8 * i));
                }
                v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v151, v162, 16);
              }
              while (v62);
            }

            v60 = v122;
          }
          v65 = objc_msgSend(v60, "isShadow");
          v66 = [TRINamespaceResolverStorage alloc];
          objc_msgSend(v121, "paths");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = -[TRINamespaceResolverStorage initWithPaths:](v66, "initWithPaths:", v67);

          v68 = self->_deployment;
          objc_msgSend(v122, "rampId");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v68) = -[TRINamespaceResolverStorage rewriteRolloutDeployment:rampId:targetedFactorPackSetId:](v109, "rewriteRolloutDeployment:rampId:targetedFactorPackSetId:", v68, v69, self->_factorPackSetId);

          if ((v68 & 1) != 0)
          {
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            v161 = 0;
            v70 = (void *)objc_opt_new();
            v71 = (void *)objc_opt_new();
            v134[0] = MEMORY[0x1E0C809B0];
            v134[1] = 3221225472;
            v134[2] = __74__TRIActivateTargetedRolloutDeploymentTask_runUsingContext_withTaskQueue___block_invoke;
            v134[3] = &unk_1E9333C90;
            v134[4] = self;
            v106 = v122;
            v135 = v106;
            v147 = buf;
            v108 = v121;
            v136 = v108;
            v105 = v70;
            v137 = v105;
            v103 = v71;
            v138 = v103;
            v139 = v117;
            v140 = v120;
            v141 = v119;
            v142 = v116;
            v143 = v115;
            v148 = v25;
            v149 = v28;
            v144 = v114;
            v150 = v65;
            v145 = v109;
            v146 = v112;
            v107 = (void *)MEMORY[0x1D8232C48](v134);
            objc_msgSend(v108, "rolloutDatabase");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "writeTransactionWithFailableBlock:", v107);

            if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
            {
              v132 = 0u;
              v133 = 0u;
              v130 = 0u;
              v131 = 0u;
              v73 = v105;
              v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v130, v159, 16);
              if (v74)
              {
                v75 = *(_QWORD *)v131;
                do
                {
                  for (j = 0; j != v74; ++j)
                  {
                    if (*(_QWORD *)v131 != v75)
                      objc_enumerationMutation(v73);
                    objc_msgSend(*(id *)(*((_QWORD *)&v130 + 1) + 8 * j), "taskTag");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    v158 = self;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v158, 1);
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v124, "cancelTasksWithTag:excludingTasks:", v77, v78);

                  }
                  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v130, v159, 16);
                }
                while (v74);
              }

              objc_msgSend(v108, "pushServiceMuxer");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "subscribeForRolloutDeployment:", self->_deployment);

              v128 = 0u;
              v129 = 0u;
              v126 = 0u;
              v127 = 0u;
              v80 = v8;
              v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v126, v157, 16);
              if (v81)
              {
                v82 = *(_QWORD *)v127;
                do
                {
                  for (k = 0; k != v81; ++k)
                  {
                    if (*(_QWORD *)v127 != v82)
                      objc_enumerationMutation(v80);
                    v84 = *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * k);
                    TRILogCategory_Server();
                    v85 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v155 = 138543362;
                      v156 = v84;
                      _os_log_impl(&dword_1D207F000, v85, OS_LOG_TYPE_DEFAULT, "notify about updates to namespace %{public}@", v155, 0xCu);
                    }

                    objc_msgSend(MEMORY[0x1E0DC0B20], "notifyUpdateForNamespaceName:", v84);
                  }
                  v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v126, v157, 16);
                }
                while (v81);
              }

              -[TRIRolloutDeployment rolloutId](self->_deployment, "rolloutId");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "rampId");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v102) = 0;
              +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 3, v86, v87, -[TRIRolloutDeployment deploymentId](self->_deployment, "deploymentId"), self->_factorPackSetId, 0, 0, v106, v102, v108, v103);

              v88 = [TRITaskRunResult alloc];
              v89 = -[TRITaskRunResult initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](v88, "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 2, 1, MEMORY[0x1E0C9AA60], 0);
            }
            else
            {
              -[TRIRolloutDeployment rolloutId](self->_deployment, "rolloutId");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "rampId");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v102) = 0;
              +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 7, v94, v95, -[TRIRolloutDeployment deploymentId](self->_deployment, "deploymentId"), self->_factorPackSetId, 0, 0, v106, v102, v108, v103, v105);

              v89 = v113;
            }
            v42 = v89;

            _Block_object_dispose(buf, 8);
          }
          else
          {
            -[TRIRolloutDeployment rolloutId](self->_deployment, "rolloutId");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "rampId");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v102) = 0;
            +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 7, v90, v91, -[TRIRolloutDeployment deploymentId](self->_deployment, "deploymentId"), self->_factorPackSetId, 0, 0, v122, v102, v121);

            v42 = v113;
          }

          goto LABEL_36;
        }
        TRILogCategory_Server();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          -[TRIRolloutDeployment shortDesc](self->_deployment, "shortDesc");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = self->_factorPackSetId;
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v56;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v57;
          _os_log_impl(&dword_1D207F000, v55, OS_LOG_TYPE_DEFAULT, "Rollout deployment %{public}@ has already activated factor pack set %{public}@. Completing task without activating deployment again.", buf, 0x16u);

        }
        v58 = [TRITaskRunResult alloc];
        v38 = -[TRITaskRunResult initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](v58, "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 2, 0, MEMORY[0x1E0C9AA60], 0);
LABEL_35:
        v42 = (TRITaskRunResult *)v38;
LABEL_36:

        goto LABEL_37;
      }
      objc_msgSend(v122, "targetedTargetingRuleIndex");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v48, "intValue");
      objc_msgSend(v43, "ensureRolloutFields");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setClientTargetingRuleGroupOrdinal:", v51);

    }
    v50 = v122;

    goto LABEL_31;
  }
  TRILogCategory_Server();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    -[TRIRolloutDeployment shortDesc](self->_deployment, "shortDesc");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v93;
    _os_log_error_impl(&dword_1D207F000, v39, OS_LOG_TYPE_ERROR, "Unexpected failure to lookup rollout record for deployment %{public}@.", buf, 0xCu);

  }
  -[TRIRolloutDeployment rolloutId](self->_deployment, "rolloutId");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(0, "rampId");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v102) = 0;
  +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 7, v40, v41, -[TRIRolloutDeployment deploymentId](self->_deployment, "deploymentId"), self->_factorPackSetId, 0, 0, 0, v102, v121);

  v42 = v113;
LABEL_37:

  return v42;
}

uint64_t __74__TRIActivateTargetedRolloutDeploymentTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  void *v27;
  void *v28;
  char v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  void *v67;
  char v68;
  NSObject *v69;
  void *v70;
  void *v71;
  char v72;
  NSObject *v73;
  void *v74;
  int v75;
  objc_class *v76;
  void *v77;
  void *v78;
  objc_class *v79;
  void *v80;
  void *v81;
  unsigned __int8 *v82;
  void *v84;
  int v85;
  objc_class *v86;
  void *v87;
  void *v88;
  objc_class *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  id v98;
  id obj;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[4];
  id v110;
  id v111;
  uint8_t v112[128];
  uint8_t buf[4];
  void *v114;
  __int16 v115;
  _BYTE v116[14];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v100 = (void *)objc_opt_new();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 40), "targetedFactorPackSetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v5))
  {
    objc_msgSend(*(id *)(a1 + 40), "targetedTargetingRuleIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  objc_msgSend(*(id *)(a1 + 48), "rolloutDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) = objc_msgSend(v7, "activateDeployment:withFactorPackSetId:targetingRuleIndex:deactivatedDeployments:deactivatedFactorPackSetIds:deactivationStateTransitions:usingTransaction:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), v6, *(_QWORD *)(a1 + 56), v100, *(_QWORD *)(a1 + 64), v3);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24))
  {
    v8 = *(void **)(a1 + 64);
    v109[0] = MEMORY[0x1E0C809B0];
    v109[1] = 3221225472;
    v109[2] = __74__TRIActivateTargetedRolloutDeploymentTask_runUsingContext_withTaskQueue___block_invoke_2;
    v109[3] = &unk_1E9333C68;
    v110 = *(id *)(a1 + 40);
    v111 = *(id *)(a1 + 48);
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v109);
    objc_msgSend(*(id *)(a1 + 48), "activationEventDatabase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "rolloutId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(v11 + 56);
    v13 = objc_msgSend(*(id *)(v11 + 48), "deploymentId");
    if (*(_QWORD *)(a1 + 88))
      v14 = *(const __CFString **)(a1 + 88);
    else
      v14 = &stru_1E9336E60;
    LOWORD(v94) = *(_WORD *)(a1 + 144);
    v15 = objc_msgSend(v9, "addRecordWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleId:carrierCountryCode:diagnosticsUsageEnabled:hasAne:aneVersion:transaction:", v10, v12, v13, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v14, *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), v94, *(_QWORD *)(a1 + 112), v3);

    if (!v15)
    {
      TRILogCategory_Server();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v91 = *(_QWORD *)(a1 + 32);
        v92 = *(void **)(v91 + 56);
        v93 = *(_QWORD *)(v91 + 48);
        *(_DWORD *)buf = 138412546;
        v114 = v92;
        v115 = 2114;
        *(_QWORD *)v116 = v93;
        _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "error during activation of factorPackSetId {public}%@ for rollout %{public}@: failed to update activation event database", buf, 0x16u);
      }

    }
    if (*(_BYTE *)(a1 + 146))
    {
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        *(_DWORD *)buf = 138543362;
        v114 = v18;
        v19 = "Rollout deployment %{public}@ is shadow-installed, no associated activation.";
LABEL_19:
        _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) = objc_msgSend(*(id *)(a1 + 120), "overwriteActiveFactorProvidersUsingTransaction:fromContext:", v3, *(_QWORD *)(a1 + 48));
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24))
      {
        v82 = (unsigned __int8 *)MEMORY[0x1E0D81680];
LABEL_63:
        v20 = *v82;

        goto LABEL_64;
      }
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        *(_DWORD *)buf = 138543362;
        v114 = v21;
        v19 = "Activated rollout deployment: %{public}@";
        goto LABEL_19;
      }
    }
    v98 = v3;

    v22 = 0x1E932D000uLL;
    +[TRIContentTracker contentIdentifierForRolloutArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForRolloutArtifactWithDeployment:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "contentTracker");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "addRefWithContentIdentifier:", v23);

    if ((v25 & 1) == 0)
    {
      TRILogCategory_Server();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "rolloutId");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "deploymentId");
        v86 = (objc_class *)objc_opt_class();
        NSStringFromClass(v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v114 = v84;
        v115 = 1024;
        *(_DWORD *)v116 = v85;
        *(_WORD *)&v116[4] = 2114;
        *(_QWORD *)&v116[6] = v87;
        _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "Unable to increment ref for rollout deployment: (r: %{public}@, d: %d) in %{public}@", buf, 0x1Cu);

        v22 = 0x1E932D000;
      }

    }
    objc_msgSend(*(id *)(v22 + 3472), "contentIdentifierForFactorPackSetWithId:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "contentTracker");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "addRefWithContentIdentifier:", v27);

    if ((v29 & 1) == 0)
    {
      TRILogCategory_Server();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v88 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
        v89 = (objc_class *)objc_opt_class();
        NSStringFromClass(v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v114 = v88;
        v115 = 2114;
        *(_QWORD *)v116 = v90;
        _os_log_error_impl(&dword_1D207F000, v30, OS_LOG_TYPE_ERROR, "Unable to increment ref for factor pack set: %{public}@ in %{public}@", buf, 0x16u);

      }
    }
    v96 = v6;

    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    obj = *(id *)(a1 + 56);
    v3 = v98;
    v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
    if (v103)
    {
      v102 = *(_QWORD *)v106;
      v97 = a1;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v106 != v102)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v31);
          v33 = (void *)MEMORY[0x1D8232A5C]();
          objc_msgSend(*(id *)(a1 + 48), "rolloutDatabase");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "recordWithDeployment:usingTransaction:", v32, v3);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            v104 = v33;
            objc_msgSend(v100, "objectForKeyedSubscript:", v32);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              objc_msgSend(*(id *)(a1 + 48), "activationEventDatabase");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "deployment");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "rolloutId");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "deployment");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "activationEventRecordWithParentId:factorPackSetId:deploymentId:", v39, v36, objc_msgSend(v40, "deploymentId"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              if (v41)
              {
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "trialSystemTelemetry");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v42, "hasPrevOsBuild");

                if ((v43 & 1) == 0)
                {
                  v44 = (void *)objc_opt_new();
                  objc_msgSend(v41, "osBuild");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "setPrevOsBuild:", v45);

                  objc_msgSend(v41, "regionCode");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "setPrevRegionCode:", v46);

                  objc_msgSend(v41, "languageCode");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "setPrevLanguageCode:", v47);

                  v48 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v41, "languageCode");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "regionCode");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v50)
                  {
                    objc_msgSend(v41, "regionCode");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "stringWithFormat:", CFSTR("%@-%@"), v49, v51);
                    v52 = (void *)objc_claimAutoreleasedReturnValue();

                    a1 = v97;
                  }
                  else
                  {
                    objc_msgSend(v48, "stringWithFormat:", CFSTR("%@-%@"), v49, &stru_1E9336E60);
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                  }

                  objc_msgSend(v44, "setPrevBcp47DeviceLocale:", v52);
                  objc_msgSend(v41, "carrierBundleIdentifier");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "setPrevCarrierBundleIdentifier:", v53);

                  objc_msgSend(v41, "carrierCountryIsoCode");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "setPrevCarrierCountryIsoCode:", v54);

                  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "mergeTelemetry:", v44);
                }
              }
              v101 = v41;
              objc_msgSend(v35, "deployment");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "rolloutId");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "rampId");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "deployment");
              v58 = a1;
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v95) = 0;
              +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 4, v56, v57, objc_msgSend(v59, "deploymentId"), v36, 0, 0, v35, v95, *(_QWORD *)(v58 + 48));

              objc_msgSend(*(id *)(v58 + 48), "activationEventDatabase");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "deployment");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "rolloutId");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "deployment");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = objc_msgSend(v60, "deleteRecordWithParentId:factorPackSetId:deploymentId:", v62, v36, objc_msgSend(v63, "deploymentId"));

              v22 = 0x1E932D000uLL;
              if (!v64)
              {
                TRILogCategory_Server();
                v65 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v32, "rolloutId");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v114 = v81;
                  _os_log_error_impl(&dword_1D207F000, v65, OS_LOG_TYPE_ERROR, "Unable to clear activation record for deactivated rollout: %{public}@", buf, 0xCu);

                }
                v58 = v97;
              }
              +[TRIContentTracker contentIdentifierForFactorPackSetWithId:](TRIContentTracker, "contentIdentifierForFactorPackSetWithId:", v36);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v58 + 48), "contentTracker");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = objc_msgSend(v67, "dropRefWithContentIdentifier:", v66);

              a1 = v58;
              if ((v68 & 1) == 0)
              {
                TRILogCategory_Server();
                v69 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                {
                  v78 = *(void **)(*(_QWORD *)(v58 + 32) + 56);
                  v79 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v79);
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v114 = v78;
                  v22 = 0x1E932D000;
                  v115 = 2114;
                  *(_QWORD *)v116 = v80;
                  _os_log_error_impl(&dword_1D207F000, v69, OS_LOG_TYPE_ERROR, "Unable to decrement ref for factor pack set: %{public}@ in %{public}@", buf, 0x16u);

                }
              }

              v3 = v98;
            }
            if (objc_msgSend(v35, "isShadow"))
              objc_msgSend(*(id *)(a1 + 128), "addObject:", v32);

            v33 = v104;
          }
          objc_msgSend(*(id *)(v22 + 3472), "contentIdentifierForRolloutArtifactWithDeployment:", v32);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "contentTracker");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v71, "dropRefWithContentIdentifier:", v70);

          if ((v72 & 1) == 0)
          {
            TRILogCategory_Server();
            v73 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v32, "rolloutId");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = objc_msgSend(v32, "deploymentId");
              v76 = (objc_class *)objc_opt_class();
              NSStringFromClass(v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v114 = v74;
              v115 = 1024;
              *(_DWORD *)v116 = v75;
              v3 = v98;
              *(_WORD *)&v116[4] = 2114;
              *(_QWORD *)&v116[6] = v77;
              _os_log_error_impl(&dword_1D207F000, v73, OS_LOG_TYPE_ERROR, "Unable to decrement ref for rollout deployment: (r: %{public}@, d: %d) in %{public}@", buf, 0x1Cu);

              v22 = 0x1E932D000;
            }

          }
          objc_autoreleasePoolPop(v33);
          ++v31;
        }
        while (v103 != v31);
        v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
      }
      while (v103);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_notifyUpdatedShadowEvaluationsWithDeployments:context:usingTransaction:", *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 48), v3);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24))
      v82 = (unsigned __int8 *)MEMORY[0x1E0D81678];
    else
      v82 = (unsigned __int8 *)MEMORY[0x1E0D81680];
    v6 = v96;
    goto LABEL_63;
  }
  v20 = *MEMORY[0x1E0D81680];
LABEL_64:

  return v20;
}

void __74__TRIActivateTargetedRolloutDeploymentTask_runUsingContext_withTaskQueue___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 4, v8, v9, v11, v12, v13, 0, *(_QWORD *)(a1 + 32), v14, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v5, "activeFactorPackSetId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "namespaces");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v14) = 0;
    +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 4, v8, v9, v11, v12, v13, v15, *(_QWORD *)(a1 + 32), v14, *(_QWORD *)(a1 + 40));
  }

}

- (BOOL)isEqual:(id)a3
{
  TRIActivateTargetedRolloutDeploymentTask *v4;
  TRIActivateTargetedRolloutDeploymentTask *v5;
  char v6;
  objc_super v8;

  v4 = (TRIActivateTargetedRolloutDeploymentTask *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TRIActivateTargetedRolloutDeploymentTask;
    if (-[TRIBaseTask isEqual:](&v8, sel_isEqual_, v4)
      && -[TRIActivateTargetedRolloutDeploymentTask isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      if (-[TRIRolloutDeployment isEqualToDeployment:](self->_deployment, "isEqualToDeployment:", v5->_deployment)&& -[TRIFactorPackSetId isEqualToString:](self->_factorPackSetId, "isEqualToString:", v5->_factorPackSetId))
      {
        v6 = -[TRITaskAttributing isEqual:](self->_taskAttribution, "isEqual:", v5->_taskAttribution);
      }
      else
      {
        v6 = 0;
      }

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
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TRIActivateTargetedRolloutDeploymentTask;
  v3 = -[TRIBaseTask hash](&v7, sel_hash);
  v4 = -[TRIRolloutDeployment hash](self->_deployment, "hash") + 37 * v3;
  v5 = -[TRIFactorPackSetId hash](self->_factorPackSetId, "hash") + 37 * v4;
  return -[TRITaskAttributing hash](self->_taskAttribution, "hash") + 37 * v5;
}

- (id)metrics
{
  return -[TRIRolloutTaskSupport metrics](self->_support, "metrics");
}

- (id)dimensions
{
  return -[TRIRolloutTaskSupport dimensions](self->_support, "dimensions");
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
  void *v6;

  v3 = (void *)objc_opt_new();
  -[TRIRolloutDeployment rolloutId](self->_deployment, "rolloutId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRolloutId:", v4);

  objc_msgSend(v3, "setDeploymentId:", -[TRIRolloutDeployment deploymentId](self->_deployment, "deploymentId"));
  objc_msgSend(v3, "setFactorPackSetId:", self->_factorPackSetId);
  -[TRITaskAttributing asPersistedTaskAttribution](self->_taskAttribution, "asPersistedTaskAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskAttribution:", v5);

  -[TRITaskCapabilityModifier asPersistedModifier](self->_capabilityModifier, "asPersistedModifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCapabilityModifier:", v6);

  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIActivateTargetedRolloutDeploymentTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedRolloutDeploymentTask.m"), 511, CFSTR("Unexpected failure to serialize %@"), v9);

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
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  TRITaskCapabilityModifier *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  TRITaskCapabilityModifier *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  const char *v22;
  objc_class *v23;
  objc_class *v24;
  objc_class *v25;
  objc_class *v26;
  void *v27;
  objc_class *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  +[TRIPBMessage parseFromData:error:](TRIActivateTargetedRolloutDeploymentPersistedTask, "parseFromData:error:", a3, &v31);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v31;
  if (!v3)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v4;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIActivateTargetedRolloutDeploymentPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_26;
  }
  if ((objc_msgSend(v3, "hasRolloutId") & 1) == 0)
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v33 = v30;
      _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: rolloutId", buf, 0xCu);

    }
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v21;
    v22 = "Cannot decode message of type %@ with missing field: rolloutId";
    goto LABEL_25;
  }
  objc_msgSend(v3, "rolloutId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v21;
    v22 = "Cannot decode message of type %@ with field of length 0: rolloutId";
LABEL_25:
    _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);

    goto LABEL_26;
  }
  if ((objc_msgSend(v3, "hasDeploymentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v21;
    v22 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_25;
  }
  if ((objc_msgSend(v3, "hasFactorPackSetId") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v21;
    v22 = "Cannot decode message of type %@ with missing field: factorPackSetId";
    goto LABEL_25;
  }
  if ((objc_msgSend(v3, "hasTaskAttribution") & 1) != 0)
  {
    objc_msgSend(v3, "taskAttribution");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:](TRITaskAttributionInternalInsecure, "taskAttributionFromPersistedTask:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v3, "factorPackSetId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      TRIValidateFactorPackSetId();
      v10 = objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = objc_alloc(MEMORY[0x1E0DC0B60]);
        objc_msgSend(v3, "rolloutId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithRolloutId:deploymentId:", v12, objc_msgSend(v3, "deploymentId"));

        if ((objc_msgSend(v3, "hasCapabilityModifier") & 1) != 0)
        {
          v14 = [TRITaskCapabilityModifier alloc];
          objc_msgSend(v3, "capabilityModifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "add");
          objc_msgSend(v3, "capabilityModifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[TRITaskCapabilityModifier initWithAdd:remove:](v14, "initWithAdd:remove:", v16, objc_msgSend(v17, "remove"));

        }
        else
        {
          v18 = (TRITaskCapabilityModifier *)objc_opt_new();
        }
        objc_msgSend((id)objc_opt_class(), "taskWithDeployment:factorPackSetId:taskAttribution:capabilityModifier:", v13, v10, v8, v18);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_33;
      }
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
    }
    v27 = 0;
LABEL_33:

    goto LABEL_27;
  }
  TRILogCategory_Server();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v21;
    v22 = "Cannot decode message of type %@ with missing field: taskAttribution";
    goto LABEL_25;
  }
LABEL_26:
  v27 = 0;
LABEL_27:

  return v27;
}

- (unint64_t)requiredCapabilities
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIActivateTargetedRolloutDeploymentTask;
  return -[TRIBaseTask requiredCapabilities](&v3, sel_requiredCapabilities);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  TRIFactorPackSetId *factorPackSetId;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TRIRolloutDeployment shortDesc](self->_deployment, "shortDesc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  factorPackSetId = self->_factorPackSetId;
  -[TRITaskAttributing applicationBundleIdentifier](self->_taskAttribution, "applicationBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@,%@,%@>"), v4, v5, factorPackSetId, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIActivateTargetedRolloutDeploymentTask)initWithCoder:(id)a3
{
  id v4;
  TRIActivateTargetedRolloutDeploymentTask *v5;
  void *v6;
  TRIActivateTargetedRolloutDeploymentTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIActivateTargetedRolloutDeploymentTask;
  v5 = -[TRIActivateTargetedRolloutDeploymentTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIActivateTargetedRolloutDeploymentTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedRolloutDeploymentTask.m"), 563, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIActivateTargetedRolloutDeploymentTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (TRIRolloutDeployment)deployment
{
  return self->_deployment;
}

- (TRIFactorPackSetId)factorPackSetId
{
  return self->_factorPackSetId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
  objc_storeStrong((id *)&self->_capabilityModifier, 0);
  objc_storeStrong((id *)&self->_support, 0);
  objc_storeStrong((id *)&self->_taskAttribution, 0);
}

@end
