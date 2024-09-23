@implementation TRIActivateTargetedBMLTDeploymentTask

- (TRIActivateTargetedBMLTDeploymentTask)initWithTaskDeployment:(id)a3 factorPackSetId:(id)a4 taskAttribution:(id)a5 bmltBatchNotificationIdentifier:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  TRIActivateTargetedBMLTDeploymentTask *v16;
  TRIActivateTargetedBMLTDeploymentTask *v17;
  TRIBMLTTaskSupport *v18;
  TRIBMLTTaskSupport *support;
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
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedBMLTDeploymentTask.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedBMLTDeploymentTask.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment"));

  if (!v13)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedBMLTDeploymentTask.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskAttribution"));

LABEL_4:
  v32.receiver = self;
  v32.super_class = (Class)TRIActivateTargetedBMLTDeploymentTask;
  v16 = -[TRIActivateTargetedBMLTDeploymentTask init](&v32, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_deployment, a3);
    objc_storeStrong((id *)&v17->_factorPackSetId, a4);
    objc_storeStrong((id *)&v17->_taskAttribution, a5);
    objc_storeStrong((id *)&v17->_bmltBatchNotificationIdentifier, a6);
    v18 = -[TRIBMLTTaskSupport initWithBMLTDeployment:]([TRIBMLTTaskSupport alloc], "initWithBMLTDeployment:", v17->_deployment);
    support = v17->_support;
    v17->_support = v18;

    v20 = (void *)objc_opt_new();
    objc_msgSend(v12, "backgroundMLTaskId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ensureBMLTFields");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setClientBmltId:", v21);

    loggableFactorPackSetIdFromFactorPackSetId(v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ensureBMLTFields");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setClientBmltFactorPackSetId:", v23);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "deploymentId"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setClientDeploymentId:", v26);

    +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:](TRITelemetryFactory, "containerOriginTelemetryForTaskAttribution:", v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIBMLTTaskSupport mergeTelemetry:](v17->_support, "mergeTelemetry:", v20);
    -[TRIBMLTTaskSupport mergeTelemetry:](v17->_support, "mergeTelemetry:", v27);

  }
  return v17;
}

+ (id)taskWithBMLTDeployment:(id)a3 factorPackSetId:(id)a4 taskAttribution:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc((Class)a1);
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.triald.BMLTNotification.%@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "initWithTaskDeployment:factorPackSetId:taskAttribution:bmltBatchNotificationIdentifier:", v10, v9, v8, v15);

  return v16;
}

+ (id)taskWithBMLTDeployment:(id)a3 factorPackSetId:(id)a4 taskAttribution:(id)a5 bmltBatchNotificationIdentifier:(id)a6
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
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTaskDeployment:factorPackSetId:taskAttribution:bmltBatchNotificationIdentifier:", v13, v12, v11, v10);

  return v14;
}

- (int)taskType
{
  return 31;
}

- (NSArray)tags
{
  return (NSArray *)-[TRIBMLTTaskSupport tags](self->_support, "tags");
}

- (NSArray)dependencies
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  +[TRIFetchBMLTNotificationsTask taskWithDeployment:taskAttribution:bmltBatchNotificationIdentifier:](TRIFetchBMLTNotificationsTask, "taskWithDeployment:taskAttribution:bmltBatchNotificationIdentifier:", self->_deployment, self->_taskAttribution, self->_bmltBatchNotificationIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  +[TRIFetchFactorPackSetTask taskWithFactorPackSetId:taskAttribution:bmltDeployment:](TRIFetchFactorPackSetTask, "taskWithFactorPackSetId:taskAttribution:bmltDeployment:", self->_factorPackSetId, self->_taskAttribution, self->_deployment);
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

  +[TRIContentTracker contentIdentifierForBMLTArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForBMLTArtifactWithDeployment:", self->_deployment);
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

  +[TRIContentTracker contentIdentifierForBMLTArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForBMLTArtifactWithDeployment:", self->_deployment);
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
      -[TRIBMLTDeployment shortDesc](self->_deployment, "shortDesc");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for BMLT %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }

}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v7;
  TRISystemCovariates *v8;
  void *v9;
  TRISystemCovariates *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  TRIFactorPackSetId *factorPackSetId;
  void *v37;
  void *v38;
  BOOL v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  TRITaskRunResult *v46;
  NSObject *v47;
  TRITaskRunResult *v48;
  void *v49;
  int v50;
  NSObject *v51;
  void *v52;
  TRIFactorPackSetId *v53;
  TRINamespaceResolverStorage *v55;
  void *v56;
  TRINamespaceResolverStorage *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  TRIBMLTDeployment *deployment;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  BOOL v73;
  void *v74;
  BOOL v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void (**v80)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  __CFString *v86;
  void *v87;
  _QWORD v88[5];
  id v89;
  id v90;
  id v91;
  id v92;
  __CFString *v93;
  id v94;
  id v95;
  id v96;
  TRINamespaceResolverStorage *v97;
  _BYTE *v98;
  BOOL v99;
  BOOL v100;
  _QWORD v101[5];
  _BYTE buf[24];
  char v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v79 = a4;
  v101[0] = MEMORY[0x1E0C809B0];
  v101[1] = 3221225472;
  v101[2] = __71__TRIActivateTargetedBMLTDeploymentTask_runUsingContext_withTaskQueue___block_invoke;
  v101[3] = &unk_1E9336508;
  v101[4] = self;
  v80 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v101);
  v8 = [TRISystemCovariates alloc];
  objc_msgSend(v7, "paths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TRISystemCovariates initWithPaths:](v8, "initWithPaths:", v9);

  -[TRISystemCovariates dictionary](v10, "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", CFSTR("OSBuild"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRISystemCovariates dictionary](v10, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForKey:", CFSTR("UserSettingsLanguageCode"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRISystemCovariates dictionary](v10, "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForKey:", CFSTR("UserSettingsRegionCode"));
  v86 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[TRISystemCovariates dictionary](v10, "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueForKey:", CFSTR("BCP47DeviceLocale"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
  {
    objc_msgSend(v85, "componentsSeparatedByString:", CFSTR("-"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v85, "componentsSeparatedByString:", CFSTR("-"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastObject");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v19 = &stru_1E9336E60;
    if (v18)
      v19 = v18;
    v86 = v19;

    v87 = (void *)v16;
  }
  -[TRISystemCovariates dictionary](v10, "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "valueForKey:", CFSTR("CarrierBundleIdentifier"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRISystemCovariates dictionary](v10, "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "valueForKey:", CFSTR("CarrierCountryIsoCode"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  -[TRISystemCovariates dictionary](v10, "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "valueForKey:", CFSTR("DiagnosticsUsageEnabled"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v23 != 0;

  -[TRISystemCovariates dictionary](v10, "dictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "valueForKey:", CFSTR("HasANE"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v25 != 0;

  -[TRISystemCovariates dictionary](v10, "dictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "valueForKey:", CFSTR("ANEVersion"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v84)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedBMLTDeploymentTask.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("osBuild"));

  }
  if (!v87)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedBMLTDeploymentTask.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("languageCode"));

  }
  if (!v86)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedBMLTDeploymentTask.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regionCode"));

  }
  if (!v83)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedBMLTDeploymentTask.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("carrierBundleId"));

  }
  if (!v82)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedBMLTDeploymentTask.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("carrierCountryCode"));

  }
  if (!v81)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedBMLTDeploymentTask.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aneVersion"));

  }
  objc_msgSend(v7, "bmltDatabase");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "taskRecordWithTaskDeployment:", self->_deployment);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v7, "namespaceDatabase");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paths");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "namespaceDescriptorsDefaultDir");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:](TRINamespaceDescriptorProvider, "providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v29, v31);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "artifact");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "backgroundTask");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[TRIActivateTargetedBMLTDeploymentTask _hasValidNCVForBMLT:namespaceDescriptorProvider:](self, "_hasValidNCVForBMLT:namespaceDescriptorProvider:", v33, v78);

    if (!v34)
    {
      TRILogCategory_Server();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        deployment = self->_deployment;
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = deployment;
        _os_log_error_impl(&dword_1D207F000, v47, OS_LOG_TYPE_ERROR, "BMLT deployment %{public}@ does not match the device NCVs. Completing task without activating deployment.", buf, 0xCu);
      }

      v48 = [TRITaskRunResult alloc];
      v46 = -[TRITaskRunResult initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](v48, "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 2, 0, MEMORY[0x1E0C9AA60], 0);
      goto LABEL_39;
    }
    v35 = (void *)objc_opt_new();
    factorPackSetId = self->_factorPackSetId;
    objc_msgSend(v28, "targetedFactorPackSetId");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TRIFactorPackSetId isEqual:](factorPackSetId, "isEqual:", v37))
    {
      objc_msgSend(v28, "targetedTargetingRuleIndex");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38 == 0;

      if (v39)
        goto LABEL_23;
      objc_msgSend(v28, "targetedTargetingRuleIndex");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v37, "intValue");
      objc_msgSend(v35, "ensureBMLTFields");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setClientBmltTargetingRuleGroupOrdinal:", v40);

    }
LABEL_23:
    -[TRIBMLTTaskSupport mergeTelemetry:](self->_support, "mergeTelemetry:", v35);

    objc_msgSend(v28, "artifact");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "earliestStartDateForActivationIfInFuture");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (v77)
    {
      TRILogCategory_Server();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        -[TRIBMLTDeployment shortDesc](self->_deployment, "shortDesc");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v66;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v77;
        _os_log_error_impl(&dword_1D207F000, v43, OS_LOG_TYPE_ERROR, "Cannot activate BMLT deployment %{public}@: start time %@ is in the future", buf, 0x16u);

      }
      +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 1, 1, MEMORY[0x1E0C9AA60], v77);
      v44 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v28, "activeFactorPackSetId");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "isEqualToString:", self->_factorPackSetId);

      if (!v50)
      {
        v55 = [TRINamespaceResolverStorage alloc];
        objc_msgSend(v7, "paths");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = -[TRINamespaceResolverStorage initWithPaths:](v55, "initWithPaths:", v56);

        if (-[TRINamespaceResolverStorage rewriteBMLTDeployment:targetedFactorPackSetId:](v57, "rewriteBMLTDeployment:targetedFactorPackSetId:", self->_deployment, self->_factorPackSetId))
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v103 = 0;
          v88[0] = MEMORY[0x1E0C809B0];
          v88[1] = 3221225472;
          v88[2] = __71__TRIActivateTargetedBMLTDeploymentTask_runUsingContext_withTaskQueue___block_invoke_56;
          v88[3] = &unk_1E9336530;
          v88[4] = self;
          v58 = v28;
          v89 = v58;
          v98 = buf;
          v59 = v7;
          v90 = v59;
          v91 = v84;
          v92 = v87;
          v93 = v86;
          v94 = v83;
          v95 = v82;
          v99 = v75;
          v100 = v73;
          v96 = v81;
          v97 = v57;
          v76 = (void *)MEMORY[0x1D8232C48](v88);
          objc_msgSend(v59, "bmltDatabase");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "writeTransactionWithFailableBlock:", v76);

          if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
          {
            objc_msgSend(v58, "artifact");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "backgroundTask");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "selectedNamespace");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "name");
            v74 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0DC0B20], "notifyUpdateForNamespaceName:", v74);
            -[TRIActivateTargetedBMLTDeploymentTask _activationTelemetryWithSuccess:bmltRecord:serverContext:](self, "_activationTelemetryWithSuccess:bmltRecord:serverContext:", 1, v58, v59);
            v80[2](v80, 2, 1, MEMORY[0x1E0C9AA60], 0);
            v46 = (TRITaskRunResult *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            -[TRIActivateTargetedBMLTDeploymentTask _activationTelemetryWithSuccess:bmltRecord:serverContext:](self, "_activationTelemetryWithSuccess:bmltRecord:serverContext:", 0, v58, v59);
            v80[2](v80, 3, 1, MEMORY[0x1E0C9AA60], 0);
            v46 = (TRITaskRunResult *)objc_claimAutoreleasedReturnValue();
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          -[TRIActivateTargetedBMLTDeploymentTask _activationTelemetryWithSuccess:bmltRecord:serverContext:](self, "_activationTelemetryWithSuccess:bmltRecord:serverContext:", 0, v28, v7);
          v80[2](v80, 3, 1, MEMORY[0x1E0C9AA60], 0);
          v46 = (TRITaskRunResult *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_38;
      }
      TRILogCategory_Server();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        -[TRIBMLTDeployment shortDesc](self->_deployment, "shortDesc");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = self->_factorPackSetId;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v52;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v53;
        _os_log_impl(&dword_1D207F000, v51, OS_LOG_TYPE_DEFAULT, "BMLT deployment %{public}@ has already activated factor pack set %{public}@. Completing task without activating deployment again.", buf, 0x16u);

      }
      v80[2](v80, 2, 0, MEMORY[0x1E0C9AA60], 0);
      v44 = objc_claimAutoreleasedReturnValue();
    }
    v46 = (TRITaskRunResult *)v44;
LABEL_38:

LABEL_39:
    goto LABEL_40;
  }
  TRILogCategory_Server();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    -[TRIBMLTDeployment shortDesc](self->_deployment, "shortDesc");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v64;
    _os_log_error_impl(&dword_1D207F000, v45, OS_LOG_TYPE_ERROR, "Unexpected failure to lookup BMLT record for deployment %{public}@.", buf, 0xCu);

  }
  -[TRIActivateTargetedBMLTDeploymentTask _activationTelemetryWithSuccess:bmltRecord:serverContext:](self, "_activationTelemetryWithSuccess:bmltRecord:serverContext:", 0, 0, v7);
  v80[2](v80, 3, 1, MEMORY[0x1E0C9AA60], 0);
  v46 = (TRITaskRunResult *)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return v46;
}

id __71__TRIActivateTargetedBMLTDeploymentTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;

  v7 = a4;
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (v8)
    notify_post((const char *)objc_msgSend(v8, "UTF8String"));
  if (v7)
    v9 = v7;
  else
    v9 = (id)MEMORY[0x1E0C9AA60];
  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", a2, a3, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __71__TRIActivateTargetedBMLTDeploymentTask_runUsingContext_withTaskQueue___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  unsigned __int8 *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  objc_class *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  uint64_t v36;
  int v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  _WORD v42[17];

  *(_QWORD *)&v42[13] = *MEMORY[0x1E0C80C00];
  v3 = a2;
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

  objc_msgSend(*(id *)(a1 + 48), "bmltDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = objc_msgSend(v7, "activateDeployment:withFactorPackSetId:targetingRuleIndex:usingTransaction:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), v6, v3);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 48), "activationEventDatabase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "backgroundMLTaskId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(v10 + 56);
    v12 = objc_msgSend(*(id *)(v10 + 48), "deploymentId");
    if (*(_QWORD *)(a1 + 72))
      v13 = *(const __CFString **)(a1 + 72);
    else
      v13 = &stru_1E9336E60;
    LOWORD(v36) = *(_WORD *)(a1 + 120);
    v14 = objc_msgSend(v8, "addRecordWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleId:carrierCountryCode:diagnosticsUsageEnabled:hasAne:aneVersion:transaction:", v9, v11, v12, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v13, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), v36, *(_QWORD *)(a1 + 96), v3);

    if (!v14)
    {
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v28 = *(_QWORD *)(a1 + 32);
        v29 = *(void **)(v28 + 56);
        v30 = *(_QWORD *)(v28 + 48);
        *(_DWORD *)buf = 138412546;
        v40 = v29;
        v41 = 2114;
        *(_QWORD *)v42 = v30;
        _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "error during activation of factorPackSetId {public}%@ for BMLT %{public}@: failed to update activation event database", buf, 0x16u);
      }

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = objc_msgSend(*(id *)(a1 + 104), "overwriteActiveFactorProvidersUsingTransaction:fromContext:", v3, *(_QWORD *)(a1 + 48));
    v16 = (unsigned __int8 *)MEMORY[0x1E0D81680];
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
    {
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        *(_DWORD *)buf = 138543362;
        v40 = v18;
        _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "Activated BMLT deployment: %{public}@", buf, 0xCu);
      }

      +[TRIContentTracker contentIdentifierForBMLTArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForBMLTArtifactWithDeployment:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "contentTracker");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "addRefWithContentIdentifier:", v19);

      if ((v21 & 1) == 0)
      {
        TRILogCategory_Server();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "backgroundMLTaskId");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "deploymentId");
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v40 = v38;
          v41 = 1024;
          *(_DWORD *)v42 = v37;
          v42[2] = 2114;
          *(_QWORD *)&v42[3] = v32;
          _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "Unable to increment ref for BMLT deployment: (r: %{public}@, d: %d) in %{public}@", buf, 0x1Cu);

        }
      }
      +[TRIContentTracker contentIdentifierForFactorPackSetWithId:](TRIContentTracker, "contentIdentifierForFactorPackSetWithId:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
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
          v33 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
          v34 = (objc_class *)objc_opt_class();
          NSStringFromClass(v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = v33;
          v41 = 2114;
          *(_QWORD *)v42 = v35;
          _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "Unable to increment ref for factor pack set: %{public}@ in %{public}@", buf, 0x16u);

        }
      }

      notify_post("com.apple.trial.shadow-evaluation.mlruntime.status-change");
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
        v16 = (unsigned __int8 *)MEMORY[0x1E0D81678];
    }
  }
  else
  {
    v16 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  }

  return *v16;
}

- (BOOL)_hasValidNCVForBMLT:(id)a3 namespaceDescriptorProvider:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  void *v25;
  int v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "hasSelectedNamespace") & 1) != 0)
  {
    objc_msgSend(v5, "selectedNamespace");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject name](v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "descriptorWithNamespaceName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x2020000000;
      v35 = 0;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSObject compatibilityVersionArray_Count](v7, "compatibilityVersionArray_Count"));
      -[NSObject compatibilityVersionArray](v7, "compatibilityVersionArray");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __89__TRIActivateTargetedBMLTDeploymentTask__hasValidNCVForBMLT_namespaceDescriptorProvider___block_invoke;
      v28[3] = &unk_1E9333E90;
      v12 = v9;
      v29 = v12;
      v31 = &v32;
      v13 = v10;
      v30 = v13;
      objc_msgSend(v11, "enumerateValuesWithBlock:", v28);

      if (*((_BYTE *)v33 + 24))
      {
        v14 = 1;
      }
      else
      {
        TRILogCategory_Server();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "taskId");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v5, "deploymentId");
          objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
          v20 = (id)objc_claimAutoreleasedReturnValue();
          -[NSObject name](v7, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v12, "downloadNCV");
          objc_msgSend(v5, "taskId");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v37 = v27;
          v38 = 1024;
          v39 = v26;
          v40 = 2114;
          v41 = v20;
          v42 = 2114;
          v43 = v21;
          v44 = 1024;
          v45 = v22;
          v46 = 2114;
          v47 = v23;
          _os_log_impl(&dword_1D207F000, v19, OS_LOG_TYPE_DEFAULT, "BMLT %{public}@.%u supports namespace compatibility versions {%{public}@} for namespace \"%{public}@\", but the namespace descriptor declares download compatibility with version %u. (This is unlikely to be an issue, unless you're REALLY sure rollout %{public}@ should be available on this device.)", buf, 0x36u);

        }
        v14 = *((_BYTE *)v33 + 24) != 0;
      }

      _Block_object_dispose(&v32, 8);
    }
    else
    {
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "taskId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v5, "deploymentId");
        -[NSObject name](v7, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v37 = v16;
        v38 = 1024;
        v39 = v17;
        v40 = 2114;
        v41 = v18;
        _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "Note: BMLT %{public}@.%u involves namespace %{public}@ but it is not registered with Trial. Factor packs for this namespace shall not be downloaded.", buf, 0x1Cu);

      }
      v14 = 0;
    }

  }
  else
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "taskId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v25;
      v38 = 1024;
      v39 = objc_msgSend(v5, "deploymentId");
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Note: BMLT %{public}@.%u is missing a selected namespace.", buf, 0x12u);

    }
    v14 = 0;
  }

  return v14;
}

void __89__TRIActivateTargetedBMLTDeploymentTask__hasValidNCVForBMLT_namespaceDescriptorProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "downloadNCV") == (_DWORD)a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v4 = *(void **)(a1 + 40);
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%u"), a2);
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)_activationTelemetryWithSuccess:(BOOL)a3 bmltRecord:(id)a4 serverContext:(id)a5
{
  _BOOL8 v6;
  TRIBMLTDeployment *deployment;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v6 = a3;
  deployment = self->_deployment;
  v9 = a5;
  v10 = a4;
  -[TRIBMLTDeployment backgroundMLTaskId](deployment, "backgroundMLTaskId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRILighthouseBitacoraHandler emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:", v11, -[TRIBMLTDeployment deploymentId](self->_deployment, "deploymentId"), 1, v6);

  -[TRIBMLTDeployment backgroundMLTaskId](self->_deployment, "backgroundMLTaskId");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v12 = -[TRIBMLTDeployment deploymentId](self->_deployment, "deploymentId");
  if (v6)
    v13 = 8;
  else
    v13 = 7;
  +[TRITaskUtils updateBMLTHistoryDatabaseWithAllocationStatus:forBMLT:deployment:fps:bmltRecord:context:](TRITaskUtils, "updateBMLTHistoryDatabaseWithAllocationStatus:forBMLT:deployment:fps:bmltRecord:context:", v13, v14, v12, self->_factorPackSetId, v10, v9);

}

- (BOOL)isEqual:(id)a3
{
  TRIActivateTargetedBMLTDeploymentTask *v4;
  TRIActivateTargetedBMLTDeploymentTask *v5;
  char v6;
  objc_super v8;

  v4 = (TRIActivateTargetedBMLTDeploymentTask *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TRIActivateTargetedBMLTDeploymentTask;
    if (-[TRIBaseTask isEqual:](&v8, sel_isEqual_, v4)
      && -[TRIActivateTargetedBMLTDeploymentTask isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      if (-[TRIBMLTDeployment isEqualToDeployment:](self->_deployment, "isEqualToDeployment:", v5->_deployment)&& -[TRIFactorPackSetId isEqualToString:](self->_factorPackSetId, "isEqualToString:", v5->_factorPackSetId))
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
  v7.super_class = (Class)TRIActivateTargetedBMLTDeploymentTask;
  v3 = -[TRIBaseTask hash](&v7, sel_hash);
  v4 = -[TRIBMLTDeployment hash](self->_deployment, "hash") + 37 * v3;
  v5 = -[TRIFactorPackSetId hash](self->_factorPackSetId, "hash") + 37 * v4;
  return -[TRITaskAttributing hash](self->_taskAttribution, "hash") + 37 * v5;
}

- (id)metrics
{
  return -[TRIBMLTTaskSupport metrics](self->_support, "metrics");
}

- (id)dimensions
{
  return -[TRIBMLTTaskSupport dimensions](self->_support, "dimensions");
}

- (id)trialSystemTelemetry
{
  return -[TRIBMLTTaskSupport trialSystemTelemetry](self->_support, "trialSystemTelemetry");
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[TRIBMLTDeployment backgroundMLTaskId](self->_deployment, "backgroundMLTaskId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundMlTaskId:", v4);

  objc_msgSend(v3, "setDeploymentId:", -[TRIBMLTDeployment deploymentId](self->_deployment, "deploymentId"));
  objc_msgSend(v3, "setFactorPackSetId:", self->_factorPackSetId);
  -[TRITaskAttributing asPersistedTaskAttribution](self->_taskAttribution, "asPersistedTaskAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskAttribution:", v5);

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

  -[TRIActivateTargetedBMLTDeploymentTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedBMLTDeploymentTask.m"), 422, CFSTR("Unexpected failure to serialize %@"), v9);

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
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  const char *v20;
  objc_class *v21;
  objc_class *v22;
  objc_class *v23;
  objc_class *v24;
  objc_class *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  +[TRIPBMessage parseFromData:error:](TRIActivateTargetedBMLTDeploymentPersistedTask, "parseFromData:error:", a3, &v28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v28;
  if (!v3)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v4;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIActivateTargetedBMLTDeploymentPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_26;
  }
  if ((objc_msgSend(v3, "hasBackgroundMlTaskId") & 1) == 0)
  {
    TRILogCategory_Server();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v27;
      _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: backgroundMlTaskId", buf, 0xCu);

    }
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v19;
    v20 = "Cannot decode message of type %@ with missing field: backgroundMlTaskId";
    goto LABEL_25;
  }
  objc_msgSend(v3, "backgroundMlTaskId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v19;
    v20 = "Cannot decode message of type %@ with field of length 0: backgroundMlTaskId";
LABEL_25:
    _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);

    goto LABEL_26;
  }
  if ((objc_msgSend(v3, "hasDeploymentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v19;
    v20 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_25;
  }
  if ((objc_msgSend(v3, "hasFactorPackSetId") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v19;
    v20 = "Cannot decode message of type %@ with missing field: factorPackSetId";
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
        v11 = objc_alloc(MEMORY[0x1E0DC09A8]);
        objc_msgSend(v3, "backgroundMlTaskId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithBackgroundMLTaskId:deploymentId:", v12, objc_msgSend(v3, "deploymentId"));

        v14 = (void *)objc_opt_class();
        if ((objc_msgSend(v3, "hasBmltBatchNotificationId") & 1) != 0)
        {
          objc_msgSend(v3, "bmltBatchNotificationId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "taskWithBMLTDeployment:factorPackSetId:taskAttribution:bmltBatchNotificationIdentifier:", v13, v10, v8, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v14, "taskWithBMLTDeployment:factorPackSetId:taskAttribution:bmltBatchNotificationIdentifier:", v13, v10, v8, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }

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
    v16 = 0;
LABEL_33:

    goto LABEL_27;
  }
  TRILogCategory_Server();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v19;
    v20 = "Cannot decode message of type %@ with missing field: taskAttribution";
    goto LABEL_25;
  }
LABEL_26:
  v16 = 0;
LABEL_27:

  return v16;
}

- (unint64_t)requiredCapabilities
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIActivateTargetedBMLTDeploymentTask;
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
  -[TRIBMLTDeployment shortDesc](self->_deployment, "shortDesc");
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

- (TRIActivateTargetedBMLTDeploymentTask)initWithCoder:(id)a3
{
  id v4;
  TRIActivateTargetedBMLTDeploymentTask *v5;
  void *v6;
  TRIActivateTargetedBMLTDeploymentTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIActivateTargetedBMLTDeploymentTask;
  v5 = -[TRIActivateTargetedBMLTDeploymentTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIActivateTargetedBMLTDeploymentTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActivateTargetedBMLTDeploymentTask.m"), 473, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIActivateTargetedBMLTDeploymentTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (TRIBMLTDeployment)deployment
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
  objc_storeStrong((id *)&self->_bmltBatchNotificationIdentifier, 0);
  objc_storeStrong((id *)&self->_support, 0);
  objc_storeStrong((id *)&self->_taskAttribution, 0);
}

@end
