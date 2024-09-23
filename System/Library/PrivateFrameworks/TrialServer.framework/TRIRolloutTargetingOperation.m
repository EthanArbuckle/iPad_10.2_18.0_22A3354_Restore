@implementation TRIRolloutTargetingOperation

- (TRIRolloutTargetingOperation)initWithRolloutTargeter:(id)a3 rolloutDatabase:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  TRIRolloutTargetingOperation *v12;
  TRIRolloutTargetingOperation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TRIRolloutTargetingOperation;
  v12 = -[TRIRolloutTargetingOperation init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_targeter, a3);
    objc_storeStrong((id *)&v13->_rolloutDatabase, a4);
    objc_storeStrong((id *)&v13->_context, a5);
  }

  return v13;
}

- (BOOL)targetRolloutDeployment:(id)a3 appendingTelemetryToSupport:(id)a4 reportTelemetryToServer:(BOOL *)a5 factorPackSetIdToActivate:(id *)a6 shouldDisenroll:(BOOL *)a7 error:(id *)a8
{
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;

  v14 = a3;
  v15 = a4;
  v16 = (void *)MEMORY[0x1D8232A5C]();
  v17 = -[TRIRolloutTargetingOperation _targetRolloutDeployment:appendingTelemetryToSupport:reportTelemetryToServer:factorPackSetIdToActivate:shouldDisenroll:error:](self, "_targetRolloutDeployment:appendingTelemetryToSupport:reportTelemetryToServer:factorPackSetIdToActivate:shouldDisenroll:error:", v14, v15, a5, a6, a7, a8);
  if (*a8)
  {
    objc_msgSend(*a8, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("logMessage"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v21 = CFSTR("unknown");
    if (v19)
      v21 = (__CFString *)v19;
    v22 = v21;

    objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:categoricalValue:", CFSTR("targeting_error"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "addMetric:", v23);
  }
  objc_autoreleasePoolPop(v16);

  return v17;
}

- (BOOL)_targetRolloutDeployment:(id)a3 appendingTelemetryToSupport:(id)a4 reportTelemetryToServer:(BOOL *)a5 factorPackSetIdToActivate:(id *)a6 shouldDisenroll:(BOOL *)a7 error:(id *)a8
{
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  SEL v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  BOOL v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  NSObject *v40;
  __CFString *v41;
  __CFString *v42;
  const char *v43;
  NSObject *v44;
  uint32_t v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  NSObject *v50;
  _BOOL4 v51;
  const char *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  _BOOL4 v59;
  __CFString *v60;
  const char *v61;
  const __CFString *v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  __CFString *v67;
  id v68;
  char v69;
  void *v70;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  TRIRolloutTargetingOperation *v79;
  void *v80;
  void *v81;
  _QWORD v82[5];
  __CFString *v83;
  uint8_t buf[4];
  const __CFString *v85;
  __int16 v86;
  __CFString *v87;
  __int16 v88;
  __CFString *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = v16;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
LABEL_61:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutTargetingOperation.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("support != nil"));

    if (a5)
      goto LABEL_4;
    goto LABEL_62;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutTargetingOperation.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deployment != nil"));

  if (!v17)
    goto LABEL_61;
LABEL_3:
  if (a5)
    goto LABEL_4;
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutTargetingOperation.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reportTelemetryToServer != nil"));

LABEL_4:
  *a5 = 1;
  if (!a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutTargetingOperation.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetIdToActivate != nil"));

  }
  v18 = *a6;
  *a6 = 0;

  if (!a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutTargetingOperation.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shouldDisenroll != NULL"));

  }
  *a7 = 0;
  if (!a8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutTargetingOperation.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

  }
  -[TRIRolloutTargetingOperation rolloutDatabase](self, "rolloutDatabase");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "recordWithDeployment:usingTransaction:", v15, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v81 = v17;
    v21 = a2;
    objc_msgSend(v20, "artifact");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "rollout");
    v23 = objc_claimAutoreleasedReturnValue();

    v83 = 0;
    v79 = self;
    -[TRIRolloutTargetingOperation targeter](self, "targeter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)v23;
    v25 = objc_msgSend(v24, "targetRollout:factorPackSetId:relatedRampDeployment:error:", v23, &v83, 0, a8);

    v26 = 0;
    switch(v25)
    {
      case 0:
        goto LABEL_58;
      case 1:
        if (!v83)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", v21, v79, CFSTR("TRIRolloutTargetingOperation.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assignedFactorPackSetId"));

        }
        v28 = (void *)objc_opt_new();
        -[__CFString ident](v83, "ident");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        loggableFactorPackSetIdFromFactorPackSetId(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "ensureRolloutFields");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setClientFactorPackSetId:", v33);

        if ((-[__CFString targetingRuleIndex](v83, "targetingRuleIndex") & 0x80000000) == 0)
        {
          v35 = -[__CFString targetingRuleIndex](v83, "targetingRuleIndex");
          objc_msgSend(v28, "ensureRolloutFields");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setClientTargetingRuleGroupOrdinal:", v35);
          goto LABEL_18;
        }
        v36 = v81;
        goto LABEL_19;
      case 2:
      case 3:
        v27 = v83;
        v83 = 0;

        v28 = (void *)objc_opt_new();
        objc_msgSend(v28, "ensureRolloutFields");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setClientFactorPackSetId:", CFSTR("no-op"));
LABEL_18:
        v36 = v81;

LABEL_19:
        objc_msgSend(v36, "mergeTelemetry:", v28);

        goto LABEL_20;
      case 4:
        v26 = 1;
        *a7 = 1;
        v53 = (void *)objc_opt_new();
        objc_msgSend(v53, "ensureRolloutFields");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setClientFactorPackSetId:", CFSTR("disenroll"));

        objc_msgSend(v81, "mergeTelemetry:", v53);
        goto LABEL_57;
      default:
LABEL_20:
        objc_msgSend(v20, "activeFactorPackSetId");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {

LABEL_23:
          v39 = CFSTR("(Retargeting) ");
          goto LABEL_24;
        }
        objc_msgSend(v20, "targetedFactorPackSetId");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
          goto LABEL_23;
        v39 = &stru_1E9336E60;
LABEL_24:
        if (v83)
        {
          TRILogCategory_Server();
          v40 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            goto LABEL_30;
          v41 = v83;
          objc_msgSend(v15, "shortDesc");
          v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v85 = v39;
          v86 = 2114;
          v87 = v41;
          v88 = 2114;
          v89 = v42;
          v43 = "%{public}@Enrolling in factor pack set id %{public}@ for rollout %{public}@";
          v44 = v40;
          v45 = 32;
        }
        else
        {
          *a5 = 0;
          TRILogCategory_Server();
          v40 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            goto LABEL_30;
          objc_msgSend(v15, "shortDesc");
          v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v85 = v39;
          v86 = 2114;
          v87 = v42;
          v43 = "%{public}@Targeting resulted in the default treatment (non-enrollment) for rollout %{public}@";
          v44 = v40;
          v45 = 22;
        }
        _os_log_impl(&dword_1D207F000, v44, OS_LOG_TYPE_DEFAULT, v43, buf, v45);

LABEL_30:
        if (!v83)
        {
          v26 = 1;
          goto LABEL_58;
        }
        objc_msgSend(v20, "targetedFactorPackSetId");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          -[__CFString ident](v83, "ident");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "targetedFactorPackSetId");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v47, "isEqualToString:", v48);

          TRILogCategory_Server();
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
          if (v49)
          {
            if (v51)
            {
              *(_WORD *)buf = 0;
              v52 = "Retargeting resulted in no change to the targetedFactorPackSetId.";
LABEL_41:
              _os_log_impl(&dword_1D207F000, v50, OS_LOG_TYPE_DEFAULT, v52, buf, 2u);
              goto LABEL_42;
            }
            goto LABEL_42;
          }
          if (v51)
          {
            objc_msgSend(v20, "targetedFactorPackSetId");
            v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v85 = v60;
            v86 = 2114;
            v87 = v83;
            v61 = "Retargeting resulted in targetedFactorPackSetId change: %{public}@ --> %{public}@";
LABEL_49:
            _os_log_impl(&dword_1D207F000, v50, OS_LOG_TYPE_DEFAULT, v61, buf, 0x16u);

          }
        }
        else
        {
          objc_msgSend(v20, "activeFactorPackSetId");
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v55)
            goto LABEL_51;
          -[__CFString ident](v83, "ident");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "activeFactorPackSetId");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v56, "isEqualToString:", v57);

          TRILogCategory_Server();
          v50 = objc_claimAutoreleasedReturnValue();
          v59 = os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
          if (v58)
          {
            if (v59)
            {
              *(_WORD *)buf = 0;
              v52 = "Retargeting resulted in no change to the activeFactorPackSetId. Still attempting activation";
              goto LABEL_41;
            }
LABEL_42:

            *a5 = 0;
            goto LABEL_51;
          }
          if (v59)
          {
            v62 = v83;
            objc_msgSend(v20, "activeFactorPackSetId");
            v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v85 = v62;
            v86 = 2114;
            v87 = v60;
            v61 = "Retargeting result: targeted %{public}@, previously active: %{public}@";
            goto LABEL_49;
          }
        }

LABEL_51:
        v53 = (void *)objc_opt_new();
        -[TRIRolloutTargetingOperation rolloutDatabase](v79, "rolloutDatabase");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString ident](v83, "ident");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[__CFString targetingRuleIndex](v83, "targetingRuleIndex") & 0x80000000) != 0)
        {
          v69 = objc_msgSend(v63, "targetDeployment:toFactorPackSetId:targetingRuleIndex:deallocatedDeployments:usingTransaction:", v15, v64, 0, v53, 0);

          if ((v69 & 1) != 0)
            goto LABEL_53;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[__CFString targetingRuleIndex](v83, "targetingRuleIndex"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v63, "targetDeployment:toFactorPackSetId:targetingRuleIndex:deallocatedDeployments:usingTransaction:", v15, v64, v65, v53, 0);

          if ((v66 & 1) != 0)
          {
LABEL_53:
            v82[0] = MEMORY[0x1E0C809B0];
            v82[1] = 3221225472;
            v82[2] = __157__TRIRolloutTargetingOperation__targetRolloutDeployment_appendingTelemetryToSupport_reportTelemetryToServer_factorPackSetIdToActivate_shouldDisenroll_error___block_invoke;
            v82[3] = &unk_1E9335348;
            v82[4] = v79;
            objc_msgSend(v53, "enumerateObjectsUsingBlock:", v82);
            v67 = v83;
            v68 = *a6;
            *a6 = v67;
            v26 = 1;
            goto LABEL_56;
          }
        }
        +[TRIRolloutTargeter targetingErrorWithDeployment:errorType:](TRIRolloutTargeter, "targetingErrorWithDeployment:errorType:", v15, CFSTR("failed update database"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        v68 = *a8;
        *a8 = v70;
LABEL_56:

LABEL_57:
LABEL_58:

        v17 = v81;
        break;
    }
  }
  else
  {
    +[TRIRolloutTargeter targetingErrorWithDeployment:errorType:](TRIRolloutTargeter, "targetingErrorWithDeployment:errorType:", v15, CFSTR("rollout artifact not found"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *a8;
    *a8 = v30;

    v26 = 0;
  }

  return v26;
}

void __157__TRIRolloutTargetingOperation__targetRolloutDeployment_appendingTelemetryToSupport_reportTelemetryToServer_factorPackSetIdToActivate_shouldDisenroll_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "deployment");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rolloutId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rampId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deployment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deploymentId");
  objc_msgSend(v3, "targetedFactorPackSetId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "namespaces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = 1;
  +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 4, v4, v5, v7, v8, v9, 0, 0, v10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

}

- (TRIRolloutTargeting)targeter
{
  return self->_targeter;
}

- (TRIRolloutDatabase)rolloutDatabase
{
  return self->_rolloutDatabase;
}

- (TRIServerContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_rolloutDatabase, 0);
  objc_storeStrong((id *)&self->_targeter, 0);
}

@end
