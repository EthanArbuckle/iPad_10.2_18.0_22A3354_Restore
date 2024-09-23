@implementation TRITargetingTask

- (int)taskType
{
  return 6;
}

+ (id)taskWithExperiment:(id)a3 taskAttribution:(id)a4
{
  return (id)objc_msgSend(a1, "taskWithExperiment:includeDependencies:taskAttribution:", a3, 1, a4);
}

+ (id)taskWithExperiment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  TRITargetingTask *v9;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  v9 = -[TRITargetingTask initWithExperiment:includeDependencies:taskAttribution:]([TRITargetingTask alloc], "initWithExperiment:includeDependencies:taskAttribution:", v8, v5, v7);

  return v9;
}

- (TRITargetingTask)initWithExperiment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5
{
  id v9;
  id v10;
  TRITargetingTask *v11;
  TRIExperimentTaskSupport *v12;
  TRIExperimentTaskSupport *support;
  void *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITargetingTask.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experiment"));

  }
  if ((objc_msgSend(v9, "hasDeploymentId") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITargetingTask.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experiment.hasDeploymentId"));

  }
  v18.receiver = self;
  v18.super_class = (Class)TRITargetingTask;
  v11 = -[TRITargetingTask init](&v18, sel_init);
  if (v11)
  {
    v12 = -[TRIExperimentTaskSupport initWithExperimentDeployment:]([TRIExperimentTaskSupport alloc], "initWithExperimentDeployment:", v9);
    support = v11->_support;
    v11->_support = v12;

    v11->_includeDependencies = a4;
    objc_storeStrong((id *)&v11->_taskAttributing, a5);
    +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:](TRITelemetryFactory, "containerOriginTelemetryForTaskAttribution:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIExperimentTaskSupport mergeTelemetry:](v11->_support, "mergeTelemetry:", v14);

  }
  return v11;
}

- (TRIExperimentDeployment)experiment
{
  return -[TRIExperimentTaskSupport experimentDeployment](self->_support, "experimentDeployment");
}

- (NSArray)tags
{
  return (NSArray *)-[TRIExperimentTaskSupport tags](self->_support, "tags");
}

- (NSArray)dependencies
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!self->_includeDependencies)
    return (NSArray *)0;
  -[TRITargetingTask experiment](self, "experiment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIFetchExperimentTask taskWithExperimentDeployment:taskAttributing:](TRIFetchExperimentTask, "taskWithExperimentDeployment:taskAttributing:", v3, self->_taskAttributing);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)runEnqueueHandlerUsingContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[TRITargetingTask experiment](self, "experiment");
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
  -[TRITargetingTask experiment](self, "experiment");
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
      -[TRITargetingTask experiment](self, "experiment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDesc");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for experiment %{public}@", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (id)systemCovariatesWithPaths:(id)a3
{
  id v3;
  TRISystemCovariates *v4;

  v3 = a3;
  v4 = -[TRISystemCovariates initWithPaths:]([TRISystemCovariates alloc], "initWithPaths:", v3);

  return v4;
}

- (id)_targetingErrorWithExperiment:(id)a3 errorType:(id)a4 details:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[4];
  _QWORD v36[4];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITargetingTask.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("errorType != nil"));

  }
  if (!v9 || (objc_msgSend(v9, "experimentId"), (v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Targeting error: %@"), v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_9;
    goto LABEL_8;
  }
  v13 = (void *)v12;
  v14 = objc_msgSend(v9, "hasDeploymentId");
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "experimentId");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if ((v14 & 1) != 0)
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Targeting error for experiment %@.%u: %@"), v16, objc_msgSend(v9, "deploymentId"), v10);
  else
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Targeting error for experiment %@: %@"), v16, v10, v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ -- %@"), v18, v11);
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
LABEL_9:
  v34 = v11;
  TRILogCategory_Server();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v38 = v18;
    _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  v21 = (void *)MEMORY[0x1E0CB35C8];
  v35[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", v18, &stru_1E9336E60, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v23;
  v35[1] = CFSTR("experimentId");
  objc_msgSend(v9, "experimentId");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (const __CFString *)v24;
  else
    v26 = &stru_1E9336E60;
  v36[1] = v26;
  v35[2] = CFSTR("deploymentId");
  v27 = objc_msgSend(v9, "hasDeploymentId");
  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "deploymentId"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = &unk_1E93639D8;
  }
  v35[3] = CFSTR("logMessage");
  v36[2] = v28;
  v36[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("triald"), 1, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  return v30;
}

- (id)_targetingErrorWithExperiment:(id)a3 errorType:(id)a4
{
  return -[TRITargetingTask _targetingErrorWithExperiment:errorType:details:](self, "_targetingErrorWithExperiment:errorType:details:", a3, a4, 0);
}

- (BOOL)validateSystemCovariates:(id)a3 experiment:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "tri_contextValueWithName:", CFSTR("OSBuild"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_8;
  objc_msgSend(v8, "tri_contextValueWithName:", CFSTR("DeviceModelCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_7;
  objc_msgSend(v8, "tri_contextValueWithName:", CFSTR("DeviceClass"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v8, "tri_contextValueWithName:", CFSTR("DeviceId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = 1;
    goto LABEL_11;
  }
LABEL_8:
  -[TRITargetingTask _targetingErrorWithExperiment:errorType:](self, "_targetingErrorWithExperiment:errorType:", v9, CFSTR("Unable to retrieve context -- no results from mobile gestalt"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    objc_storeStrong(a5, v15);

  v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)getTreatment:(id *)a3 forExperiment:(id)a4 isServerSideExperiment:(BOOL)a5 experimentCovariates:(id)a6 paths:(id)a7 experimentEndDate:(id)a8 error:(id *)a9
{
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  BOOL v21;
  void *v23;
  void *v24;

  v12 = a5;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITargetingTask.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentId != nil"));

  }
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITargetingTask.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experiment != nil"));

  }
  -[TRITargetingTask systemCovariatesWithPaths:](self, "systemCovariatesWithPaths:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[TRITargetingTask getTreatment:forExperiment:isServerSideExperiment:systemCovariates:userCovariates:experimentCovariates:experimentEndDate:error:](self, "getTreatment:forExperiment:isServerSideExperiment:systemCovariates:userCovariates:experimentCovariates:experimentEndDate:error:", a3, v16, v12, v20, 0, v17, v19, a9);

  return v21;
}

- (BOOL)getTreatment:(id *)a3 forExperiment:(id)a4 isServerSideExperiment:(BOOL)a5 systemCovariates:(id)a6 userCovariates:(id)a7 experimentCovariates:(id)a8 experimentEndDate:(id)a9 error:(id *)a10
{
  _BOOL4 v13;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  int v46;
  NSObject *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  NSObject *v55;
  id v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _BOOL4 v72;
  void *v73;
  void *v74;
  void *v75;
  void *context;
  id v77;
  id v78;
  uint8_t buf[4];
  id v80;
  __int16 v81;
  void *v82;
  _QWORD v83[2];
  _QWORD v84[4];

  v13 = a5;
  v84[2] = *MEMORY[0x1E0C80C00];
  v17 = a4;
  v18 = a6;
  v77 = a7;
  v19 = a8;
  v78 = a9;
  if (a3)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITargetingTask.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentId != nil"));

    if (v17)
    {
LABEL_3:
      if (v18)
        goto LABEL_4;
LABEL_62:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITargetingTask.m"), 237, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("systemCovariates != nil"));

      if (v19)
        goto LABEL_5;
      goto LABEL_63;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITargetingTask.m"), 236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experiment != nil"));

  if (!v18)
    goto LABEL_62;
LABEL_4:
  if (v19)
    goto LABEL_5;
LABEL_63:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITargetingTask.m"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentCovariates != nil"));

LABEL_5:
  context = (void *)MEMORY[0x1D8232A5C]();
  if ((objc_msgSend(v17, "hasExperimentId") & 1) != 0)
  {
    v20 = objc_alloc(MEMORY[0x1E0DC0A30]);
    objc_msgSend(v17, "experimentId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (void *)objc_msgSend(v20, "initWithExperimentId:deploymentId:", v21, objc_msgSend(v17, "deploymentId"));

    v22 = *a3;
    *a3 = 0;

    if (v78)
    {
      v23 = (void *)objc_opt_new();
      v24 = objc_msgSend(v78, "compare:", v23);

      if (v24 == -1)
      {
        TRILogCategory_Server();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v17, "experimentId");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v80 = v38;
          _os_log_impl(&dword_1D207F000, v37, OS_LOG_TYPE_INFO, "experiment with id %{public}@ has end date in the past", buf, 0xCu);

        }
        v35 = 1;
        goto LABEL_58;
      }
    }
    if ((objc_msgSend(v17, "hasAssignment") & 1) != 0)
    {
      if (-[TRITargetingTask validateSystemCovariates:experiment:error:](self, "validateSystemCovariates:experiment:error:", v18, v75, a10))
      {
        v84[0] = v18;
        v83[0] = CFSTR("SystemCovariates");
        v83[1] = CFSTR("TempValues");
        v25 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
        v84[1] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = (void *)objc_msgSend(v26, "mutableCopy");

        if (v77)
          objc_msgSend(v73, "setObject:forKeyedSubscript:", v77, CFSTR("UserCovariates"));
        objc_msgSend(v73, "setObject:forKeyedSubscript:", v19, CFSTR("ExperimentCovariates"));
        objc_msgSend(v17, "assignment");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "nsexpressionLanguage");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v27, "hasSchemaVersion") & 1) != 0)
        {
          objc_msgSend(v74, "nsexpressionLanguage");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "schemaVersion");

          if (v29 >= 8)
          {
            TRILogCategory_Server();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v80) = v29;
              _os_log_impl(&dword_1D207F000, v30, OS_LOG_TYPE_DEFAULT, "Assigning to default treatment because assignment language schema version %u is incompatible.", buf, 8u);
            }

            if (!a10)
            {
              v35 = 1;
LABEL_57:

              goto LABEL_58;
            }
            v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Incompatible assignment language schema version %u"), v29);
            -[TRITargetingTask _targetingErrorWithExperiment:errorType:](self, "_targetingErrorWithExperiment:errorType:", v75, v71);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = *a10;
            *a10 = v31;
LABEL_46:
            v35 = 1;
LABEL_56:

            goto LABEL_57;
          }
        }
        else
        {

        }
        objc_msgSend(v74, "nsexpressionLanguage");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v39, "hasAssignmentExpression") & 1) != 0)
        {
          objc_msgSend(v74, "nsexpressionLanguage");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "assignmentExpression");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v41, "length") == 0;

          if (!v72)
          {
            objc_msgSend(v74, "nsexpressionLanguage");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "assignmentExpression");
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            v43 = (void *)MEMORY[0x1D8232A5C]();
            objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", v71);
            v44 = objc_claimAutoreleasedReturnValue();
            objc_autoreleasePoolPop(v43);
            v70 = (void *)v44;
            v45 = (void *)objc_opt_new();
            v46 = objc_msgSend(v45, "validateExpression:outError:", v44, a10);

            if (v46)
            {
              TRILogCategory_Backtrace();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("SystemCovariates"));
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "dictionary");
                v49 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("ExperimentCovariates"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "dictionary");
                v69 = v48;
                *(_DWORD *)buf = 138412546;
                v80 = v49;
                v81 = 2112;
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v82 = v51;
                _os_log_impl(&dword_1D207F000, v47, OS_LOG_TYPE_DEFAULT, "Using the following covariates for targeting. SystemCovariate: %@ ExperimentCovariates: %@", buf, 0x16u);

              }
              v52 = (void *)MEMORY[0x1D8232A5C]();
              objc_msgSend(v70, "expressionValueWithObject:context:", v73, 0);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_autoreleasePoolPop(v52);
              v54 = *a3;
              *a3 = v53;

              TRILogCategory_Server();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                v56 = *a3;
                objc_msgSend(v17, "experimentId");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v80 = v56;
                v81 = 2114;
                v82 = v57;
                _os_log_impl(&dword_1D207F000, v55, OS_LOG_TYPE_DEFAULT, "Targeting treatment %@ for experiment %{public}@.", buf, 0x16u);

              }
              if (!objc_msgSend(*a3, "compare:options:", CFSTR("default"), 1))
              {
                v58 = *a3;
                *a3 = 0;

              }
              if (!*a3 || (objc_msgSend(*a3, "triIsValidTreatmentId") & 1) != 0)
              {
                v35 = 1;
LABEL_55:
                v32 = v70;
                goto LABEL_56;
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid treatment id \"%@\"), *a3);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              -[TRITargetingTask _targetingErrorWithExperiment:errorType:](self, "_targetingErrorWithExperiment:errorType:", v75, v61);
              v62 = (void *)objc_claimAutoreleasedReturnValue();

              if (a10)
                objc_storeStrong(a10, v62);
              v63 = *a3;
              *a3 = 0;

            }
            v35 = 0;
            goto LABEL_55;
          }
        }
        else
        {

        }
        if (!v13)
        {
          -[TRITargetingTask _targetingErrorWithExperiment:errorType:](self, "_targetingErrorWithExperiment:errorType:", v75, CFSTR("assignment string is missing or empty"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (a10)
            objc_storeStrong(a10, v60);

          v32 = 0;
          v71 = 0;
          v35 = 0;
          goto LABEL_56;
        }
        TRILogCategory_Server();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D207F000, v59, OS_LOG_TYPE_DEFAULT, "Assigning to default treatment because this server-side experiment is not using device-side allocation.", buf, 2u);
        }

        v32 = 0;
        v71 = 0;
        goto LABEL_46;
      }
    }
    else
    {
      -[TRITargetingTask _targetingErrorWithExperiment:errorType:](self, "_targetingErrorWithExperiment:errorType:", v75, CFSTR("missing treatment assignment"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (a10)
        objc_storeStrong(a10, v36);

    }
    v35 = 0;
LABEL_58:

    goto LABEL_59;
  }
  -[TRITargetingTask experiment](self, "experiment");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITargetingTask _targetingErrorWithExperiment:errorType:](self, "_targetingErrorWithExperiment:errorType:", v33, CFSTR("experiment id is missing in experiment definition"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (a10)
    objc_storeStrong(a10, v34);

  v35 = 0;
LABEL_59:
  objc_autoreleasePoolPop(context);

  return v35;
}

- (BOOL)getFactorPackSetId:(id *)a3 forExperiment:(id)a4 treatmentId:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  _BYTE v43[14];
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  if (a3)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITargetingTask.m"), 379, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITargetingTask.m"), 380, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experiment != nil"));

LABEL_3:
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (v12 && objc_msgSend(v11, "factorPackSetMapping_Count"))
    {
      objc_msgSend(v11, "factorPackSetMapping");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        TRIValidateFactorPackSetId();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        TRILogCategory_Server();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v15)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "experimentId");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v41 = v18;
            v42 = 1024;
            *(_DWORD *)v43 = objc_msgSend(v11, "deploymentId");
            *(_WORD *)&v43[4] = 2112;
            *(_QWORD *)&v43[6] = v12;
            v44 = 2112;
            v45 = v15;
            _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "Experiment %{public}@.%u, treatment %@ successfully resolved to factor pack set: %@", buf, 0x26u);

          }
          v19 = v15;
          v20 = *a3;
          *a3 = v19;
          v21 = 1;
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v11, "experimentId");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v41 = v14;
            v42 = 2114;
            *(_QWORD *)v43 = v37;
            *(_WORD *)&v43[8] = 1024;
            *(_DWORD *)&v43[10] = objc_msgSend(v11, "deploymentId");
            v44 = 2112;
            v45 = v12;
            _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Invalid fpsId %@ found for experiment %{public}@.%u, treatment %@.", buf, 0x26u);

          }
          v31 = objc_alloc(MEMORY[0x1E0DC0A30]);
          objc_msgSend(v11, "experimentId");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (id)objc_msgSend(v31, "initWithExperimentId:deploymentId:", v32, objc_msgSend(v11, "deploymentId"));

          v33 = *a3;
          *a3 = 0;

          if (a6)
          {
            -[TRITargetingTask _targetingErrorWithExperiment:errorType:](self, "_targetingErrorWithExperiment:errorType:", v20, CFSTR("Invalid fpsId found for experiment."));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = *a6;
            *a6 = v34;

          }
          v19 = 0;
          v21 = 0;
        }
      }
      else
      {
        TRILogCategory_Server();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v11, "experimentId");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v41 = v36;
          v42 = 1024;
          *(_DWORD *)v43 = objc_msgSend(v11, "deploymentId");
          *(_WORD *)&v43[4] = 2112;
          *(_QWORD *)&v43[6] = v12;
          _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "Could not find fpsId in experiment factor pack set map for experiment %{public}@.%u, treatment %@.", buf, 0x1Cu);

        }
        v27 = objc_alloc(MEMORY[0x1E0DC0A30]);
        objc_msgSend(v11, "experimentId");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (id)objc_msgSend(v27, "initWithExperimentId:deploymentId:", v28, objc_msgSend(v11, "deploymentId"));

        v29 = *a3;
        *a3 = 0;

        if (!a6)
        {
          v21 = 0;
          goto LABEL_26;
        }
        -[TRITargetingTask _targetingErrorWithExperiment:errorType:](self, "_targetingErrorWithExperiment:errorType:", v19, CFSTR("Could not find fpsId in experiment factor pack set map."));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        v20 = *a6;
        *a6 = v30;
      }

LABEL_26:
      goto LABEL_15;
    }
    TRILogCategory_Server();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "experimentId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v23;
      v42 = 1024;
      *(_DWORD *)v43 = objc_msgSend(v11, "deploymentId");
      *(_WORD *)&v43[4] = 2112;
      *(_QWORD *)&v43[6] = v12;
      _os_log_impl(&dword_1D207F000, v22, OS_LOG_TYPE_DEFAULT, "Experiment %{public}@.%u, treatment %@ will not consider using factor pack sets.", buf, 0x1Cu);

    }
  }
  v24 = *a3;
  *a3 = 0;

  v21 = 1;
LABEL_15:

  return v21;
}

- (BOOL)_isRolloutV1For1PWithExperimentRecord:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "type") == 3)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v5, "namespaces", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v6, "namespaceDatabase");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "dynamicNamespaceRecordWithNamespaceName:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)runTaskUsingContext:(id)a3 withTaskQueue:(id)a4 systemCovariates:(id)a5 userCovariates:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  char v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  _BOOL8 v57;
  TRIExperimentDependentSystemCovariates *v58;
  void *v59;
  void *v60;
  void *v61;
  BOOL v62;
  BOOL v63;
  NSObject *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  NSObject *v72;
  void *v73;
  int v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  __CFString *v79;
  void *v80;
  __CFString *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  __CFString *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  int v102;
  void *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  __CFString *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  id v113;
  const __CFString *v114;
  const __CFString *v115;
  uint64_t v116;
  NSObject *v117;
  void *v118;
  NSObject *v119;
  const __CFString *v120;
  NSObject *v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  id v126;
  void *v127;
  id v128;
  void *v129;
  id v130;
  void *v131;
  void *v132;
  NSObject *v133;
  void *v134;
  id v135;
  const __CFString *v136;
  NSObject *v137;
  void *v138;
  NSObject *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  void *v150;
  NSObject *v151;
  __CFString *v152;
  void *v153;
  __CFString *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  void *v163;
  void *v164;
  NSObject *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  id v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  __CFString *v179;
  id v180;
  TRITaskAttributing *taskAttributing;
  _BOOL8 v182;
  void *v183;
  void *v184;
  int v185;
  void *v186;
  int v187;
  __CFString *v188;
  TRITaskAttributing *v189;
  _BOOL8 v190;
  void *v191;
  void *v192;
  NSObject *v193;
  void *v194;
  NSObject *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  id v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  int v212;
  void *v213;
  TRIExperimentDependentSystemCovariates *v214;
  TRIExperimentCovariates *v215;
  void *v216;
  void *v217;
  id v218;
  void *v219;
  void *v220;
  void (**v221)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v222;
  _QWORD v223[4];
  id v224;
  TRITargetingTask *v225;
  __CFString *v226;
  _BYTE *v227;
  _QWORD v228[4];
  id v229;
  TRITargetingTask *v230;
  __CFString *v231;
  id v232;
  id v233;
  uint64_t *v234;
  _QWORD v235[6];
  _QWORD v236[4];
  id v237;
  TRITargetingTask *v238;
  uint64_t *v239;
  _QWORD v240[4];
  id v241;
  _BYTE *v242;
  id v243;
  uint64_t v244;
  uint64_t *v245;
  uint64_t v246;
  BOOL v247;
  __CFString *v248;
  _QWORD v249[5];
  id v250;
  SEL v251;
  _QWORD v252[5];
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  uint8_t v259[4];
  void *v260;
  TRITargetingTask *v261;
  _BYTE v262[24];
  __CFString *v263;
  _BYTE buf[32];
  void (*v265)(uint64_t);
  id v266;
  uint64_t v267;

  v267 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v218 = a4;
  v14 = a5;
  v15 = a6;
  if (a7)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    v126 = v15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITargetingTask.m"), 455, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

    v15 = v126;
    if (v13)
      goto LABEL_3;
  }
  v128 = v15;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITargetingTask.m"), 456, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context != nil"));

  v15 = v128;
LABEL_3:
  v219 = v14;
  if (!v14)
  {
    v130 = v15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITargetingTask.m"), 457, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("systemCovariates != nil"));

    v15 = v130;
  }
  v220 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITargetingTask.m"), 458, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userCovariates != nil"));

  }
  v16 = MEMORY[0x1E0C809B0];
  v252[0] = MEMORY[0x1E0C809B0];
  v252[1] = 3221225472;
  v252[2] = __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke;
  v252[3] = &unk_1E9330228;
  v252[4] = self;
  v221 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v252);
  v249[0] = v16;
  v249[1] = 3221225472;
  v249[2] = __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_2;
  v249[3] = &unk_1E9330250;
  v251 = a2;
  v249[4] = self;
  v17 = v13;
  v250 = v17;
  v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v249);
  -[TRITargetingTask experiment](self, "experiment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hasDeploymentId");

  if ((v20 & 1) != 0)
  {
    objc_msgSend(v17, "experimentDatabase");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRITargetingTask experiment](self, "experiment");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "experimentRecordWithExperimentDeployment:", v22);
    v222 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v222)
      goto LABEL_21;
    if (objc_msgSend(v222, "type") == 3)
      -[TRIExperimentTaskSupport setIdentifyTelemetryAsV1Rollout:](self->_support, "setIdentifyTelemetryAsV1Rollout:", 1);
    objc_msgSend(v222, "artifact");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v217 = v23;
    if (!v23)
    {
LABEL_21:
      -[TRITargetingTask experiment](self, "experiment");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRITargetingTask _targetingErrorWithExperiment:errorType:](self, "_targetingErrorWithExperiment:errorType:", v39, CFSTR("experiment record not found"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = *a7;
      *a7 = v40;

      ((void (**)(_QWORD, const __CFString *, const __CFString *, void *))v18)[2](v18, CFSTR("experiment-not-found"), CFSTR("unspecified-or-default-treatment"), v222);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

      goto LABEL_28;
    }
    objc_msgSend(v23, "experiment");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v216 = v24;
    if (v24)
    {
      objc_msgSend(v24, "experimentId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRITargetingTask experiment](self, "experiment");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "experimentId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v25, "isEqualToString:", v27) & 1) != 0)
      {
        v28 = objc_msgSend(v216, "deploymentId");
        -[TRITargetingTask experiment](self, "experiment");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v28) = v28 == objc_msgSend(v29, "deploymentId");

        if ((v28 & 1) != 0)
        {
          objc_msgSend(v17, "experimentDatabase");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v217, "hasNamespacesAvailableForExperimentWithDatabase:", v30);

          if ((v31 & 1) == 0)
          {
            TRILogCategory_Server();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              TRICloudKitSupport_NotificationType_EnumDescriptor();
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "textFormatNameForValue:", objc_msgSend(v217, "experimentType"));
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v217, "experimentDeployment");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "shortDesc");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v51;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v53;
              _os_log_impl(&dword_1D207F000, v49, OS_LOG_TYPE_DEFAULT, "No namespace available for %@ with id %{public}@.", buf, 0x16u);

            }
            objc_msgSend(v17, "experimentDatabase");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[TRITargetingTask experiment](self, "experiment");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v54, "setStatus:forExperimentDeployment:usingTransaction:", 4, v55, 0);

            if (v56)
            {
              ((void (**)(_QWORD, uint64_t, _QWORD, uint64_t, void *))v221)[2](v221, 2, 0, 1, v222);
            }
            else
            {
              -[TRITargetingTask experiment](self, "experiment");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              -[TRITargetingTask _targetingErrorWithExperiment:errorType:](self, "_targetingErrorWithExperiment:errorType:", v67, CFSTR("failed to update experiment database"));
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = *a7;
              *a7 = v68;

              ((void (**)(_QWORD, uint64_t, _QWORD, uint64_t, void *))v221)[2](v221, 1, 0, 1, v222);
            }
            v34 = objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          }
          if (-[TRITargetingTask _isRolloutV1For1PWithExperimentRecord:context:](self, "_isRolloutV1For1PWithExperimentRecord:context:", v222, v17))
          {
            TRILogCategory_Server();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              -[TRITargetingTask experiment](self, "experiment");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v33;
              _os_log_impl(&dword_1D207F000, v32, OS_LOG_TYPE_DEFAULT, "1P v1 rollout %{public}@ is not supported in this release", buf, 0xCu);

            }
            ((void (**)(_QWORD, uint64_t, _QWORD, uint64_t, void *))v221)[2](v221, 2, 0, 1, v222);
            v34 = objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          }
          v57 = objc_msgSend(v217, "deploymentEnvironment") != 0;
          v215 = -[TRIExperimentCovariates initWithExperimentRecord:]([TRIExperimentCovariates alloc], "initWithExperimentRecord:", v222);
          v58 = [TRIExperimentDependentSystemCovariates alloc];
          objc_msgSend(v17, "paths");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v222, "endDate");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v214 = -[TRIExperimentDependentSystemCovariates initWithPaths:baseSystemCovariates:clientExperiment:experimentEndDate:](v58, "initWithPaths:baseSystemCovariates:clientExperiment:experimentEndDate:", v59, v219, v216, v60);

          v248 = 0;
          v244 = 0;
          v245 = &v244;
          v246 = 0x2020000000;
          v247 = 0;
          objc_msgSend(v222, "endDate");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = -[TRITargetingTask getTreatment:forExperiment:isServerSideExperiment:systemCovariates:userCovariates:experimentCovariates:experimentEndDate:error:](self, "getTreatment:forExperiment:isServerSideExperiment:systemCovariates:userCovariates:experimentCovariates:experimentEndDate:error:", &v248, v216, v57, v214, v220, v215, v61, a7);

          v247 = v62;
          if (!*((_BYTE *)v245 + 24))
          {
            if (*a7)
            {
              v70 = *a7;
              v71 = *a7;
              *a7 = v70;
            }
            else
            {
              -[TRITargetingTask experiment](self, "experiment");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              -[TRITargetingTask _targetingErrorWithExperiment:errorType:](self, "_targetingErrorWithExperiment:errorType:", v71, CFSTR("unknown targeting error"));
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              v113 = *a7;
              *a7 = v112;

            }
            if (v248)
              v114 = v248;
            else
              v114 = CFSTR("unspecified-or-default-treatment");
            ((void (**)(_QWORD, const __CFString *, const __CFString *, void *))v18)[2](v18, CFSTR("unknown-targeting-error"), v114, v222);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_145;
          }
          v243 = 0;
          v63 = -[TRITargetingTask getFactorPackSetId:forExperiment:treatmentId:error:](self, "getFactorPackSetId:forExperiment:treatmentId:error:", &v243, v216, v248, a7);
          *((_BYTE *)v245 + 24) = v63;
          if (!v63)
          {
            if (_os_feature_enabled_impl())
            {
              TRILogCategory_Server();
              v64 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v216, "experimentId");
                v184 = (void *)objc_claimAutoreleasedReturnValue();
                v185 = objc_msgSend(v216, "deploymentId");
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v184;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v185;
                *(_WORD *)&buf[18] = 2112;
                *(_QWORD *)&buf[20] = v248;
                _os_log_error_impl(&dword_1D207F000, v64, OS_LOG_TYPE_ERROR, "Failed to find the factor pack set corresponding to the experiment %@.%u, treatment %@.", buf, 0x1Cu);

              }
              if (*a7)
              {
                v65 = *a7;
                v66 = *a7;
                *a7 = v65;
              }
              else
              {
                -[TRITargetingTask experiment](self, "experiment");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                -[TRITargetingTask _targetingErrorWithExperiment:errorType:](self, "_targetingErrorWithExperiment:errorType:", v66, CFSTR("unknown error with FPS map"));
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                v135 = *a7;
                *a7 = v134;

              }
              if (v248)
                v136 = v248;
              else
                v136 = CFSTR("unspecified-or-default-treatment");
              ((void (**)(_QWORD, const __CFString *, const __CFString *, void *))v18)[2](v18, CFSTR("unknown-fps-map-error"), v136, v222);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_144:

LABEL_145:
              _Block_object_dispose(&v244, 8);

              goto LABEL_26;
            }
            TRILogCategory_Server();
            v72 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v216, "experimentId");
              v186 = (void *)objc_claimAutoreleasedReturnValue();
              v187 = objc_msgSend(v216, "deploymentId");
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v186;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v187;
              *(_WORD *)&buf[18] = 2112;
              *(_QWORD *)&buf[20] = v248;
              _os_log_fault_impl(&dword_1D207F000, v72, OS_LOG_TYPE_FAULT, "Failed to find the factor pack set corresponding to the experiment %@.%u, treatment %@. (This will not fail experiment targeting).", buf, 0x1Cu);

            }
          }
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          *(_QWORD *)&buf[24] = __Block_byref_object_copy__4;
          v265 = __Block_byref_object_dispose__4;
          v266 = (id)objc_opt_new();
          -[TRITaskAttributing networkOptions](self->_taskAttributing, "networkOptions");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v73, "allowsCellularAccess");

          if (v74)
          {
            v75 = (void *)MEMORY[0x1D8232A5C]();
            objc_msgSend(v222, "artifact");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "namespaces");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v240[0] = v16;
            v240[1] = 3221225472;
            v240[2] = __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_167;
            v240[3] = &unk_1E9330278;
            v241 = v17;
            v242 = buf;
            objc_msgSend(v77, "enumerateObjectsUsingBlock:", v240);

            objc_autoreleasePoolPop(v75);
          }
          switch(objc_msgSend(v222, "status"))
          {
            case 0:
            case 4:
              goto LABEL_50;
            case 1:
            case 2:
              v102 = objc_msgSend(v217, "experimentType");
              if ((v102 & 0xFFFFFFFD) == 1)
              {
                objc_msgSend(v222, "treatmentId");
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                v210 = v103;
                if (v248)
                {
                  if (objc_msgSend(v103, "isEqualToString:"))
                  {
                    TRILogCategory_Server();
                    v104 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                    {
                      -[TRITargetingTask experiment](self, "experiment");
                      v105 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v105, "shortDesc");
                      v106 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v262 = 138543362;
                      *(_QWORD *)&v262[4] = v106;
                      _os_log_impl(&dword_1D207F000, v104, OS_LOG_TYPE_DEFAULT, "re-targeting for experiment %{public}@ resulted in no changes", v262, 0xCu);

                    }
                    v213 = (void *)objc_opt_new();
                    v107 = v248;
                    objc_msgSend(v213, "ensureExperimentFields");
                    v108 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v108, "setClientTreatmentId:", v107);

                    TRIDeploymentEnvironment_EnumDescriptor();
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v109, "textFormatNameForValue:", objc_msgSend(v217, "deploymentEnvironment"));
                    v110 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v110)
                      v110 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), (int)objc_msgSend(v217, "deploymentEnvironment"));
                    objc_msgSend(v213, "setClientDeploymentEnv:", v110);
                    -[TRIExperimentTaskSupport mergeTelemetry:](self->_support, "mergeTelemetry:", v213);
                    ((void (**)(_QWORD, uint64_t, _QWORD, _QWORD, void *))v221)[2](v221, 2, 0, 0, v222);
                    v111 = objc_claimAutoreleasedReturnValue();
                  }
                  else if (v102 == 1)
                  {
                    TRILogCategory_Server();
                    v151 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
                    {
                      v152 = v248;
                      -[TRITargetingTask experiment](self, "experiment");
                      v153 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v153, "shortDesc");
                      v154 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v262 = 138412802;
                      *(_QWORD *)&v262[4] = v210;
                      *(_WORD *)&v262[12] = 2112;
                      *(_QWORD *)&v262[14] = v152;
                      *(_WORD *)&v262[22] = 2114;
                      v263 = v154;
                      _os_log_impl(&dword_1D207F000, v151, OS_LOG_TYPE_DEFAULT, "re-targeting with current treatment %@ resulted in treatment %@ which will be treated as a deactivation for %{public}@", v262, 0x20u);

                    }
                    -[TRITargetingTask experiment](self, "experiment");
                    v155 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v155, "experimentId");
                    v156 = (void *)objc_claimAutoreleasedReturnValue();
                    -[TRITargetingTask experiment](self, "experiment");
                    v157 = (void *)objc_claimAutoreleasedReturnValue();
                    +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v156, objc_msgSend(v157, "deploymentId"), 1, 6, self->_taskAttributing);
                    v213 = (void *)objc_claimAutoreleasedReturnValue();

                    -[TRITargetingTask experiment](self, "experiment");
                    v158 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v158, "taskTag");
                    v159 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v218, "cancelTasksWithTag:", v159);

                    v254 = v213;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v254, 1);
                    v110 = (void *)objc_claimAutoreleasedReturnValue();
                    ((void (**)(_QWORD, uint64_t, void *, uint64_t, void *))v221)[2](v221, 2, v110, 1, v222);
                    v111 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    TRILogCategory_Server();
                    v165 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
                    {
                      -[TRITargetingTask experiment](self, "experiment");
                      v166 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v166, "shortDesc");
                      v167 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v262 = 138543874;
                      *(_QWORD *)&v262[4] = v167;
                      *(_WORD *)&v262[12] = 2112;
                      *(_QWORD *)&v262[14] = v210;
                      *(_WORD *)&v262[22] = 2112;
                      v263 = v248;
                      _os_log_impl(&dword_1D207F000, v165, OS_LOG_TYPE_DEFAULT, "re-targeting ROLLOUT experiment %{public}@ with treatment %@ resulted in treatment %@", v262, 0x20u);

                    }
                    objc_msgSend(v222, "namespaces");
                    v168 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v168, "firstObject");
                    v213 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v213)
                    {
                      TRILogCategory_Server();
                      v193 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR))
                      {
                        -[TRITargetingTask experiment](self, "experiment");
                        v197 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v197, "shortDesc");
                        v198 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v262 = 138543362;
                        *(_QWORD *)&v262[4] = v198;
                        _os_log_error_impl(&dword_1D207F000, v193, OS_LOG_TYPE_ERROR, "Cannot retarget experiment %{public}@ because the experiment has no namespaces.", v262, 0xCu);

                      }
                      ((void (**)(_QWORD, uint64_t, _QWORD, uint64_t, void *))v221)[2](v221, 3, 0, 1, v222);
                      v38 = (void *)objc_claimAutoreleasedReturnValue();

                      goto LABEL_126;
                    }
                    objc_msgSend(v17, "namespaceDatabase");
                    v169 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v213, "name");
                    v170 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v169, "dynamicNamespaceRecordWithNamespaceName:", v170);
                    v110 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v110)
                    {
                      -[TRITaskAttributing applicationBundleIdentifier](self->_taskAttributing, "applicationBundleIdentifier");
                      v208 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0DC0FB0], "dimensionWithName:value:", CFSTR("client_app_bundle_id"), v208);
                      v206 = (void *)objc_claimAutoreleasedReturnValue();
                      -[TRIExperimentTaskSupport addDimension:](self->_support, "addDimension:", v206);
                      objc_msgSend(v220, "tri_shortVersionStringForBundleId:", v208);
                      v204 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0DC0FB0], "dimensionWithName:value:", CFSTR("client_app_version"), v204);
                      v203 = (void *)objc_claimAutoreleasedReturnValue();
                      -[TRIExperimentTaskSupport addDimension:](self->_support, "addDimension:", v203);
                      *(_QWORD *)v262 = 0;
                      *(_QWORD *)&v262[8] = v262;
                      *(_QWORD *)&v262[16] = 0x2020000000;
                      LOBYTE(v263) = 0;
                      objc_msgSend(v17, "experimentDatabase");
                      v171 = (void *)objc_claimAutoreleasedReturnValue();
                      v223[0] = v16;
                      v223[1] = 3221225472;
                      v223[2] = __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_185;
                      v223[3] = &unk_1E932F240;
                      v172 = v17;
                      v224 = v172;
                      v225 = self;
                      v226 = v248;
                      v227 = v262;
                      objc_msgSend(v171, "writeTransactionWithFailableBlock:", v223);

                      if (*(_BYTE *)(*(_QWORD *)&v262[8] + 24))
                      {
                        -[TRITargetingTask experiment](self, "experiment");
                        v173 = (void *)objc_claimAutoreleasedReturnValue();
                        +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:](TRIContentTracker, "contentIdentifierForExperimentArtifactWithDeployment:", v173);
                        v174 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v172, "contentTracker");
                        v175 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v175, "dropRefWithContentIdentifier:", v174);

                        -[TRITargetingTask experiment](self, "experiment");
                        v176 = (void *)objc_claimAutoreleasedReturnValue();
                        +[TRIMakeDefaultTask taskWithExperiment:treatmentId:taskAttributing:capabilityModifier:](TRIMakeDefaultTask, "taskWithExperiment:treatmentId:taskAttributing:capabilityModifier:", v176, v248, self->_taskAttributing, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
                        v177 = (void *)objc_claimAutoreleasedReturnValue();
                        v253 = v177;
                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v253, 1);
                        v178 = (void *)objc_claimAutoreleasedReturnValue();

                        ((void (**)(_QWORD, uint64_t, void *, uint64_t, void *))v221)[2](v221, 2, v178, 1, v222);
                        v38 = (void *)objc_claimAutoreleasedReturnValue();

                      }
                      else
                      {
                        ((void (**)(_QWORD, uint64_t, _QWORD, uint64_t, void *))v221)[2](v221, 3, 0, 1, v222);
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                      }

                      _Block_object_dispose(v262, 8);
                      goto LABEL_125;
                    }
                    TRILogCategory_Server();
                    v195 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
                    {
                      -[TRITargetingTask experiment](self, "experiment");
                      v199 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v199, "shortDesc");
                      v200 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v213, "name");
                      v201 = (void *)objc_claimAutoreleasedReturnValue();
                      TRILoggedNamespaceName(v201);
                      v202 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v262 = 138543618;
                      *(_QWORD *)&v262[4] = v200;
                      *(_WORD *)&v262[12] = 2114;
                      *(_QWORD *)&v262[14] = v202;
                      _os_log_error_impl(&dword_1D207F000, v195, OS_LOG_TYPE_ERROR, "Cannot retarget ROLLOUT experiment %{public}@ because associated namespace %{public}@ is not dynamic.", v262, 0x16u);

                    }
                    ((void (**)(_QWORD, uint64_t, _QWORD, uint64_t, void *))v221)[2](v221, 3, 0, 1, v222);
                    v111 = objc_claimAutoreleasedReturnValue();
                  }
                }
                else
                {
                  TRILogCategory_Server();
                  v139 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
                  {
                    -[TRITargetingTask experiment](self, "experiment");
                    v140 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v140, "shortDesc");
                    v141 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v262 = 138543362;
                    *(_QWORD *)&v262[4] = v141;
                    _os_log_impl(&dword_1D207F000, v139, OS_LOG_TYPE_DEFAULT, "re-targeting of active experiment resulted in default treatment - scheduling deactivation of experiment %{public}@", v262, 0xCu);

                  }
                  -[TRITargetingTask experiment](self, "experiment");
                  v142 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v142, "taskTag");
                  v143 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v218, "cancelTasksWithTag:", v143);

                  -[TRITargetingTask experiment](self, "experiment");
                  v144 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v144, "experimentId");
                  v145 = (void *)objc_claimAutoreleasedReturnValue();
                  -[TRITargetingTask experiment](self, "experiment");
                  v146 = (void *)objc_claimAutoreleasedReturnValue();
                  +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v145, objc_msgSend(v146, "deploymentId"), 1, 7, self->_taskAttributing);
                  v213 = (void *)objc_claimAutoreleasedReturnValue();

                  v255 = v213;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v255, 1);
                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                  ((void (**)(_QWORD, uint64_t, void *, uint64_t, void *))v221)[2](v221, 2, v110, 1, v222);
                  v111 = objc_claimAutoreleasedReturnValue();
                }
                v38 = (void *)v111;
LABEL_125:

LABEL_126:
                v150 = v210;
                goto LABEL_142;
              }
              TRILogCategory_Server();
              v119 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
              {
                -[TRITargetingTask experiment](self, "experiment");
                v191 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v191, "shortDesc");
                v192 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v262 = 138543618;
                *(_QWORD *)&v262[4] = v192;
                *(_WORD *)&v262[12] = 1024;
                *(_DWORD *)&v262[14] = v102;
                _os_log_error_impl(&dword_1D207F000, v119, OS_LOG_TYPE_ERROR, "re-targeting for already active experiment %{public}@ with unexpected type %u", v262, 0x12u);

              }
              if (v248)
                v120 = v248;
              else
                v120 = CFSTR("unspecified-or-default-treatment");
              goto LABEL_94;
            case 3:
              if (objc_msgSend(v222, "type") == 3)
              {
                TRILogCategory_Server();
                v117 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
                {
                  -[TRITargetingTask experiment](self, "experiment");
                  v118 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v262 = 138543362;
                  *(_QWORD *)&v262[4] = v118;
                  _os_log_impl(&dword_1D207F000, v117, OS_LOG_TYPE_DEFAULT, "Rollout v1 experiment %{public}@ was previously finished, still attempting re-targeting", v262, 0xCu);

                }
LABEL_50:
                v212 = objc_msgSend(v217, "experimentType");
                if (!v248)
                {
                  TRILogCategory_Server();
                  v121 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
                  {
                    -[TRITargetingTask experiment](self, "experiment");
                    v122 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v216, "description");
                    v123 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v262 = 138543618;
                    *(_QWORD *)&v262[4] = v122;
                    *(_WORD *)&v262[12] = 2114;
                    *(_QWORD *)&v262[14] = v123;
                    _os_log_impl(&dword_1D207F000, v121, OS_LOG_TYPE_DEFAULT, "targeting resulted in default treatment for experiment %{public}@ (%{public}@)", v262, 0x16u);

                  }
                  *((_BYTE *)v245 + 24) = 0;
                  objc_msgSend(v17, "experimentDatabase");
                  v124 = (void *)objc_claimAutoreleasedReturnValue();
                  v236[0] = v16;
                  v236[1] = 3221225472;
                  v236[2] = __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_170;
                  v236[3] = &unk_1E932F650;
                  v237 = v17;
                  v238 = self;
                  v239 = &v244;
                  objc_msgSend(v124, "writeTransactionWithFailableBlock:", v236);

                  if (*((_BYTE *)v245 + 24))
                  {
                    v125 = 2;
                  }
                  else
                  {
                    -[TRITargetingTask experiment](self, "experiment");
                    v147 = (void *)objc_claimAutoreleasedReturnValue();
                    -[TRITargetingTask _targetingErrorWithExperiment:errorType:](self, "_targetingErrorWithExperiment:errorType:", v147, CFSTR("failed to update experiment database"));
                    v148 = (void *)objc_claimAutoreleasedReturnValue();
                    v149 = *a7;
                    *a7 = v148;

                    v125 = 1;
                  }
                  ((void (**)(_QWORD, uint64_t, _QWORD, uint64_t, void *))v221)[2](v221, v125, 0, 1, v222);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v150 = v237;
                  goto LABEL_142;
                }
                if ((v212 & 0xFFFFFFFD) == 1)
                {
                  TRILogCategory_Server();
                  v78 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                  {
                    v79 = v248;
                    -[TRITargetingTask experiment](self, "experiment");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v216, "description");
                    v81 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v262 = 138412802;
                    *(_QWORD *)&v262[4] = v79;
                    *(_WORD *)&v262[12] = 2114;
                    *(_QWORD *)&v262[14] = v80;
                    *(_WORD *)&v262[22] = 2114;
                    v263 = v81;
                    _os_log_impl(&dword_1D207F000, v78, OS_LOG_TYPE_DEFAULT, "enrolling in treatment %@ of experiment %{public}@ (%{public}@)", v262, 0x20u);

                  }
                  if (v212 == 1)
                  {
                    *(_QWORD *)v262 = 0;
                    *(_QWORD *)&v262[8] = v262;
                    *(_QWORD *)&v262[16] = 0x2020000000;
                    LODWORD(v263) = -1;
                    objc_msgSend(v17, "experimentDatabase");
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    -[TRITargetingTask experiment](self, "experiment");
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v83, "experimentId");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    v235[0] = v16;
                    v235[1] = 3221225472;
                    v235[2] = __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_172;
                    v235[3] = &unk_1E93302A0;
                    v235[4] = self;
                    v235[5] = v262;
                    objc_msgSend(v82, "enumerateExperimentRecordsMatchingExperimentId:block:", v84, v235);

                    if (*(_DWORD *)(*(_QWORD *)&v262[8] + 24) != -1)
                    {
                      -[TRITargetingTask experiment](self, "experiment");
                      v85 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v85, "experimentId");
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                      v261 = self;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v261, 1);
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v218, "cancelTasksWithTag:excludingTasks:", v86, v87);

                      -[TRITargetingTask experiment](self, "experiment");
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v88, "experimentId");
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                      +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v89, *(unsigned int *)(*(_QWORD *)&v262[8] + 24), 0, 11, self->_taskAttributing);
                      v90 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v90, "runUsingContext:withTaskQueue:", v17, v218);
                      v91 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v91, "runStatus") != 2)
                      {
                        TRILogCategory_Server();
                        v92 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
                        {
                          -[TRITargetingTask experiment](self, "experiment");
                          v211 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v211, "shortDesc");
                          v196 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)v259 = 138543362;
                          v260 = v196;
                          _os_log_error_impl(&dword_1D207F000, v92, OS_LOG_TYPE_ERROR, "Failed to deactivate one or more prior deployment(s) of experiment %{public}@, but forging boldly onward", v259, 0xCu);

                        }
                      }

                    }
                    _Block_object_dispose(v262, 8);
                  }
                  *((_BYTE *)v245 + 24) = 0;
                  objc_msgSend(v17, "experimentDatabase");
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  v228[0] = v16;
                  v228[1] = 3221225472;
                  v228[2] = __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_175;
                  v228[3] = &unk_1E93302C8;
                  v229 = v17;
                  v230 = self;
                  v231 = v248;
                  v232 = v243;
                  v207 = v222;
                  v233 = v207;
                  v234 = &v244;
                  objc_msgSend(v93, "writeTransactionWithFailableBlock:", v228);

                  if (*((_BYTE *)v245 + 24))
                  {
                    v209 = (void *)objc_opt_new();
                    v94 = v248;
                    objc_msgSend(v209, "ensureExperimentFields");
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v95, "setClientTreatmentId:", v94);

                    TRIDeploymentEnvironment_EnumDescriptor();
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v96, "textFormatNameForValue:", objc_msgSend(v217, "deploymentEnvironment"));
                    v97 = objc_claimAutoreleasedReturnValue();

                    v98 = v217;
                    v99 = v97;
                    if (!v97)
                      v99 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), (int)objc_msgSend(v217, "deploymentEnvironment"));
                    objc_msgSend(v209, "setClientDeploymentEnv:", v99);
                    v205 = (void *)v99;
                    if (v212 == 1)
                    {
                      if (objc_msgSend(v216, "hasStartDate"))
                      {
                        objc_msgSend(v216, "startDate");
                        v100 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v100, "date");
                        v101 = (void *)objc_claimAutoreleasedReturnValue();

                        v98 = v217;
                      }
                      else
                      {
                        v101 = 0;
                      }
                      if (v243)
                      {
                        -[TRITargetingTask experiment](self, "experiment");
                        v163 = (void *)objc_claimAutoreleasedReturnValue();
                        v179 = v248;
                        v180 = v243;
                        taskAttributing = self->_taskAttributing;
                        v182 = objc_msgSend(v98, "deploymentEnvironment") == 0;
                        +[TRIActivateTreatmentTask taskWithExperiment:treatmentId:factorPackSetId:taskAttributing:requiresTreatmentInstallation:capabilityModifier:startTime:taskOptions:](TRIActivateTreatmentTask, "taskWithExperiment:treatmentId:factorPackSetId:taskAttributing:requiresTreatmentInstallation:capabilityModifier:startTime:taskOptions:", v163, v179, v180, taskAttributing, v182, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v101, 0);
                        v183 = (void *)objc_claimAutoreleasedReturnValue();
                        v258 = v183;
                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v258, 1);
                      }
                      else
                      {
                        -[TRITargetingTask experiment](self, "experiment");
                        v163 = (void *)objc_claimAutoreleasedReturnValue();
                        v188 = v248;
                        v189 = self->_taskAttributing;
                        v190 = objc_msgSend(v98, "deploymentEnvironment") == 0;
                        +[TRIActivateTreatmentTask taskWithExperiment:treatmentId:taskAttributing:requiresTreatmentInstallation:capabilityModifier:startTime:taskOptions:](TRIActivateTreatmentTask, "taskWithExperiment:treatmentId:taskAttributing:requiresTreatmentInstallation:capabilityModifier:startTime:taskOptions:", v163, v188, v189, v190, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v101, 0);
                        v183 = (void *)objc_claimAutoreleasedReturnValue();
                        v257 = v183;
                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v257, 1);
                      }
                      v164 = (void *)objc_claimAutoreleasedReturnValue();

                    }
                    else
                    {
                      -[TRITargetingTask experiment](self, "experiment");
                      v101 = (void *)objc_claimAutoreleasedReturnValue();
                      +[TRIMakeDefaultTask taskWithExperiment:treatmentId:taskAttributing:capabilityModifier:](TRIMakeDefaultTask, "taskWithExperiment:treatmentId:taskAttributing:capabilityModifier:", v101, v248, self->_taskAttributing, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
                      v163 = (void *)objc_claimAutoreleasedReturnValue();
                      v256 = v163;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v256, 1);
                      v164 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    -[TRIExperimentTaskSupport mergeTelemetry:](self->_support, "mergeTelemetry:", v209);
                    ((void (**)(_QWORD, uint64_t, void *, uint64_t, id))v221)[2](v221, 2, v164, 1, v207);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    -[TRITargetingTask experiment](self, "experiment");
                    v160 = (void *)objc_claimAutoreleasedReturnValue();
                    -[TRITargetingTask _targetingErrorWithExperiment:errorType:](self, "_targetingErrorWithExperiment:errorType:", v160, CFSTR("failed update database"));
                    v161 = (void *)objc_claimAutoreleasedReturnValue();
                    v162 = *a7;
                    *a7 = v161;

                    ((void (**)(_QWORD, uint64_t, _QWORD, uint64_t, id))v221)[2](v221, 1, 0, 1, v207);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                  }

                  v150 = v229;
LABEL_142:

                  goto LABEL_143;
                }
                TRILogCategory_Server();
                v133 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                {
                  -[TRITargetingTask experiment](self, "experiment");
                  v194 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v262 = 138543362;
                  *(_QWORD *)&v262[4] = v194;
                  _os_log_error_impl(&dword_1D207F000, v133, OS_LOG_TYPE_ERROR, "unexpected experimentType for experiment %{public}@", v262, 0xCu);

                }
                if (v248)
                  v120 = v248;
                else
                  v120 = CFSTR("unspecified-or-default-treatment");
LABEL_94:
                ((void (**)(_QWORD, const __CFString *, const __CFString *, void *))v18)[2](v18, CFSTR("invalid-notification-type"), v120, v222);
                v116 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                TRILogCategory_Server();
                v137 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
                {
                  -[TRITargetingTask experiment](self, "experiment");
                  v138 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v262 = 138543362;
                  *(_QWORD *)&v262[4] = v138;
                  _os_log_impl(&dword_1D207F000, v137, OS_LOG_TYPE_DEFAULT, "experiment %{public}@ already finished, not running re-targeting", v262, 0xCu);

                }
                ((void (**)(_QWORD, uint64_t, _QWORD, uint64_t, void *))v221)[2](v221, 2, 0, 1, v222);
                v116 = objc_claimAutoreleasedReturnValue();
              }
LABEL_114:
              v38 = (void *)v116;
LABEL_143:
              _Block_object_dispose(buf, 8);

              goto LABEL_144;
            default:
              if (v248)
                v115 = v248;
              else
                v115 = CFSTR("unspecified-or-default-treatment");
              ((void (**)(_QWORD, const __CFString *, const __CFString *, void *))v18)[2](v18, CFSTR("invalid-experiment-status"), v115, v222);
              v116 = objc_claimAutoreleasedReturnValue();
              goto LABEL_114;
          }
        }
      }
      else
      {

      }
      -[TRITargetingTask experiment](self, "experiment");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRITargetingTask _targetingErrorWithExperiment:errorType:](self, "_targetingErrorWithExperiment:errorType:", v45, CFSTR("loaded artifact with wrong experiment deployment"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = *a7;
      *a7 = v46;

      ((void (**)(_QWORD, const __CFString *, const __CFString *, void *))v18)[2](v18, CFSTR("encoded-experiment-mismatches-record"), CFSTR("unspecified-or-default-treatment"), v222);
      v34 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[TRITargetingTask experiment](self, "experiment");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRITargetingTask _targetingErrorWithExperiment:errorType:](self, "_targetingErrorWithExperiment:errorType:", v42, CFSTR("decoded experiment definition is nil"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = *a7;
      *a7 = v43;

      ((void (**)(_QWORD, const __CFString *, const __CFString *, void *))v18)[2](v18, CFSTR("decoded-experiment-is-nil"), CFSTR("unspecified-or-default-treatment"), v222);
      v34 = objc_claimAutoreleasedReturnValue();
    }
LABEL_25:
    v38 = (void *)v34;
LABEL_26:

    goto LABEL_27;
  }
  -[TRITargetingTask experiment](self, "experiment");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITargetingTask _targetingErrorWithExperiment:errorType:](self, "_targetingErrorWithExperiment:errorType:", v35, CFSTR("deployment id is missing"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = *a7;
  *a7 = v36;

  ((void (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v18)[2](v18, CFSTR("missing-deployment-id"), CFSTR("unspecified-or-default-treatment"), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v38;
}

id __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  int v31;
  id v32;
  void *v33;
  int v35;
  void *v36;
  uint64_t v37;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if ((_DWORD)a2 == 1)
    goto LABEL_12;
  if (!v10)
    goto LABEL_12;
  if (!(_DWORD)a4)
    goto LABEL_12;
  objc_msgSend(v10, "artifact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "experiment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasShadowEvaluation");

  if (!v14)
    goto LABEL_12;
  objc_msgSend(v11, "artifact");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "experiment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shadowEvaluation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "hasClientBackgroundMlTask") & 1) != 0)
  {
    objc_msgSend(v11, "artifact");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "experiment");
    v37 = a1;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "shadowEvaluation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "clientBackgroundMlTask");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v20, "hasTaskId");

    a1 = v37;
    if (v35)
    {
      objc_msgSend(v11, "artifact");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "experiment");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "shadowEvaluation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "clientBackgroundMlTask");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "taskId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v37 + 32), "experiment");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRILighthouseBitacoraHandler emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:", v25, objc_msgSend(v26, "deploymentId"), 0, (_DWORD)a2 == 2);

      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(v11, "artifact");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "experiment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "shadowEvaluation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "mlRuntime");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "hasEvaluationId");

  if (!v31)
    goto LABEL_12;
  objc_msgSend(v11, "artifact");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "experiment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "experimentId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "experiment");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRILighthouseBitacoraHandler emitShadowEvaluationEventWithExperimentId:deploymentId:treatmentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitShadowEvaluationEventWithExperimentId:deploymentId:treatmentId:eventType:succeeded:", v23, objc_msgSend(v24, "deploymentId"), 0, 0, (_DWORD)a2 == 2);
LABEL_11:

LABEL_12:
  if (v9)
    v32 = v9;
  else
    v32 = (id)MEMORY[0x1E0C9AA60];
  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", a2, a4, v32, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

id __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  id v43;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRITargetingTask.m"), 488, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("failureReason"));

    if (v8)
    {
LABEL_3:
      if (!v9)
        goto LABEL_12;
LABEL_4:
      objc_msgSend(v9, "artifact");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "experiment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasShadowEvaluation");

      if (!v12)
        goto LABEL_12;
      objc_msgSend(v9, "artifact");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "experiment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shadowEvaluation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "hasClientBackgroundMlTask") & 1) != 0)
      {
        objc_msgSend(v9, "artifact");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "experiment");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "shadowEvaluation");
        v43 = v7;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "clientBackgroundMlTask");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v19, "hasTaskId");

        v7 = v43;
        if (v42)
        {
          objc_msgSend(v9, "artifact");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "experiment");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "shadowEvaluation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "clientBackgroundMlTask");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "taskId");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "experiment");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[TRILighthouseBitacoraHandler emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitBMLTEventWithBMLTId:deploymentId:eventType:succeeded:", v24, objc_msgSend(v25, "deploymentId"), 0, 0);

          v7 = v43;
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {

      }
      objc_msgSend(v9, "artifact");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "experiment");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "shadowEvaluation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "mlRuntime");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "hasEvaluationId");

      if (!v30)
        goto LABEL_12;
      objc_msgSend(v9, "artifact");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "experiment");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "experimentId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "experiment");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRILighthouseBitacoraHandler emitShadowEvaluationEventWithExperimentId:deploymentId:treatmentId:eventType:succeeded:](TRILighthouseBitacoraHandler, "emitShadowEvaluationEventWithExperimentId:deploymentId:treatmentId:eventType:succeeded:", v22, objc_msgSend(v23, "deploymentId"), 0, 0, 0);
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRITargetingTask.m"), 489, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assignedTreatment"));

  if (v9)
    goto LABEL_4;
LABEL_12:
  +[TRIExperimentPostLaunchRecorder recorderFromContext:](TRIExperimentPostLaunchRecorder, "recorderFromContext:", *(_QWORD *)(a1 + 40));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "experiment");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "experimentId");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "experiment");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIExperimentDeploymentTreatment treatmentTripleWithExperimentId:deploymentId:treatmentId:](TRIExperimentDeploymentTreatment, "treatmentTripleWithExperimentId:deploymentId:treatmentId:", v33, objc_msgSend(v34, "deploymentId"), v8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  +[TRIExperimentPostLaunchEvent failureEventWithEventType:treatmentTriple:failureReason:](TRIExperimentPostLaunchEvent, "failureEventWithEventType:treatmentTriple:failureReason:", 6, v35, v7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRITargetingTask.m"), 522, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[TRIExperimentPostLaunchEvent failureEventWithEventType:TRIInternalExperimentAllocationStatusTypeAllocationFailure treatmentTriple:triple failureReason:failureReason]"));

  }
  objc_msgSend(v31, "recordEvent:", v36);
  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 3, 1, MEMORY[0x1E0C9AA60], 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

void __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_167(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  TRITaskCapabilityModifier *v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = (void *)MEMORY[0x1E0DC0AD8];
  objc_msgSend(*(id *)(a1 + 32), "paths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "namespaceDescriptorsDefaultDir");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadWithNamespaceName:fromDirectory:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "expensiveNetworkingAllowed") & 1) == 0)
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEFAULT, "Changing TRIFetchTreatmentTask to require inexpensive networking since %@ does not support expensive networking", (uint8_t *)&v15, 0xCu);
    }

    v12 = -[TRITaskCapabilityModifier initWithAdd:remove:]([TRITaskCapabilityModifier alloc], "initWithAdd:remove:", 1, 2);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *a4 = 1;
  }

}

uint64_t __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_170(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  unsigned __int8 *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "experimentDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "experiment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "setStatus:forExperimentDeployment:usingTransaction:", 4, v6, v4);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;
  v8 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  if (!v7)
    v8 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  return *v8;
}

void __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_172(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "experimentDeployment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasDeploymentId") & 1) == 0)
    goto LABEL_4;
  objc_msgSend(v12, "experimentDeployment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deploymentId");
  objc_msgSend(*(id *)(a1 + 32), "experiment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == objc_msgSend(v8, "deploymentId"))
  {

LABEL_4:
    return;
  }
  if (objc_msgSend(v12, "status") == 2)
  {

LABEL_8:
    objc_msgSend(v12, "experimentDeployment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v11, "deploymentId");

    v10 = v12;
    *a3 = 1;
    goto LABEL_9;
  }
  v9 = objc_msgSend(v12, "status");

  v10 = v12;
  if (v9 == 1)
    goto LABEL_8;
LABEL_9:

}

uint64_t __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_175(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  __CFString *v12;
  unsigned __int8 *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "experimentDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "setStatus:forExperimentDeployment:usingTransaction:", 2, v5, v3);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "experimentDatabase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "experiment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "setTreatmentId:factorPackSetId:forExperimentDeployment:usingTransaction:", v9, v8, v10, v3);

  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 64), "status") == 4)
    v12 = CFSTR("retargeting_by_dynamic_enrollment");
  else
    v12 = 0;
  v13 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "experiment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "experimentId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "experiment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:categoricalMetric:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:categoricalMetric:context:", 1, v15, v16, objc_msgSend(v17, "deploymentId"), *(_QWORD *)(a1 + 64), 0, v12, *(_QWORD *)(a1 + 32));

    if (v11)
      v13 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v11;

  return *v13;
}

uint64_t __92__TRITargetingTask_runTaskUsingContext_withTaskQueue_systemCovariates_userCovariates_error___block_invoke_185(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 *v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "experimentDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "experiment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "setStatus:forExperimentDeployment:usingTransaction:", 2, v6, v4);

  objc_msgSend(*(id *)(a1 + 32), "experimentDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "experiment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v8, "setTreatmentId:forExperimentDeployment:usingTransaction:", v9, v10, v4);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7 & v9;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    v11 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  else
    v11 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  return *v11;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  TRIUserCovariates *v10;
  void *v11;
  int v12;
  id v13;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  TRIExperimentTaskSupport *support;
  void *v21;
  id v23;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "paths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITargetingTask systemCovariatesWithPaths:](self, "systemCovariatesWithPaths:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[TRIUserCovariates initWithContext:]([TRIUserCovariates alloc], "initWithContext:", v7);
  v23 = 0;
  -[TRITargetingTask runTaskUsingContext:withTaskQueue:systemCovariates:userCovariates:error:](self, "runTaskUsingContext:withTaskQueue:systemCovariates:userCovariates:error:", v7, v6, v9, v10, &v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "runStatus");
  v13 = 0;
  if (v12 != 2 || v23 != 0)
  {
    v15 = CFSTR("unknown");
    if (v23)
    {
      objc_msgSend(v23, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("logMessage"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v17)
        v19 = (__CFString *)v17;
      else
        v19 = CFSTR("unknown");
      v15 = v19;

    }
    support = self->_support;
    objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:categoricalValue:", CFSTR("targeting_error"), v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIExperimentTaskSupport addMetric:](support, "addMetric:", v21);

    v13 = v23;
  }

  return v11;
}

- (id)metrics
{
  return -[TRIExperimentTaskSupport metrics](self->_support, "metrics");
}

- (id)dimensions
{
  return -[TRIExperimentTaskSupport dimensions](self->_support, "dimensions");
}

- (id)trialSystemTelemetry
{
  return -[TRIExperimentTaskSupport trialSystemTelemetry](self->_support, "trialSystemTelemetry");
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[TRITargetingTask experiment](self, "experiment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExperimentId:", v5);

  -[TRITargetingTask experiment](self, "experiment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeploymentId:", objc_msgSend(v6, "deploymentId"));

  objc_msgSend(v3, "setIncludeDependencies:", self->_includeDependencies);
  -[TRITaskAttributing asPersistedTaskAttribution](self->_taskAttributing, "asPersistedTaskAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskAttribution:", v7);

  objc_msgSend(v3, "setRetryCount:", -[TRITargetingTask retryCount](self, "retryCount"));
  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRITargetingTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITargetingTask.m"), 969, CFSTR("Unexpected failure to serialize %@"), v9);

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
  NSObject *v14;
  objc_class *v15;
  void *v16;
  const char *v17;
  objc_class *v18;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  objc_class *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  +[TRIPBMessage parseFromData:error:](TRITargetingPersistedTask, "parseFromData:error:", a3, &v25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v25;
  if (!v3)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v4;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRITargetingPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_25;
  }
  if ((objc_msgSend(v3, "hasExperimentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v24;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);

    }
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v16;
    v17 = "Cannot decode message of type %@ with missing field: experimentId";
    goto LABEL_24;
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
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v16;
    v17 = "Cannot decode message of type %@ with field of length 0: experimentId";
LABEL_24:
    _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);

    goto LABEL_25;
  }
  if ((objc_msgSend(v3, "hasDeploymentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v16;
    v17 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_24;
  }
  if ((objc_msgSend(v3, "hasIncludeDependencies") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v16;
    v17 = "Cannot decode message of type %@ with missing field: includeDependencies";
    goto LABEL_24;
  }
  if ((objc_msgSend(v3, "hasTaskAttribution") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v16;
      v17 = "Cannot decode message of type %@ with missing field: taskAttribution";
      goto LABEL_24;
    }
LABEL_25:
    v12 = 0;
    goto LABEL_26;
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

    objc_msgSend((id)objc_opt_class(), "taskWithExperiment:includeDependencies:taskAttribution:", v11, objc_msgSend(v3, "includeDependencies"), v8);
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

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TRITargetingTask;
  if (-[TRIBaseTask isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    -[TRITargetingTask experiment](self, "experiment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "experiment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToDeployment:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TRITargetingTask;
  v3 = -[TRIBaseTask hash](&v13, sel_hash);
  -[TRITargetingTask experiment](self, "experiment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TRITargetingTask experiment](self, "experiment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "experimentId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hash");

  }
  else
  {
    v8 = 0;
  }

  -[TRITargetingTask experiment](self, "experiment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hasDeploymentId"))
  {
    -[TRITargetingTask experiment](self, "experiment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (int)objc_msgSend(v10, "deploymentId");

  }
  else
  {
    v11 = -2;
  }

  return v11 + 37 * (v8 + 37 * v3);
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
  -[TRITargetingTask experiment](self, "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortDesc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@,r:%d>"), v4, v6, -[TRITargetingTask retryCount](self, "retryCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRITargetingTask)initWithCoder:(id)a3
{
  id v4;
  TRITargetingTask *v5;
  void *v6;
  TRITargetingTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRITargetingTask;
  v5 = -[TRITargetingTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRITargetingTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRITargetingTask.m"), 1032, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRITargetingTask serialize](self, "serialize");
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
  objc_storeStrong((id *)&self->_taskAttributing, 0);
  objc_storeStrong((id *)&self->_support, 0);
}

@end
