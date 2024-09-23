@implementation TRIRolloutTargeter

- (TRIRolloutTargeter)initWithDatabase:(id)a3 systemCovariateProvider:(id)a4 userCovariateProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  TRIRolloutTargeter *v12;
  TRIRolloutTargeter *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TRIRolloutTargeter;
  v12 = -[TRIRolloutTargeter init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_db, a3);
    objc_storeStrong((id *)&v13->_systemCovariateProvider, a4);
    objc_storeStrong((id *)&v13->_userCovariateProvider, a5);
  }

  return v13;
}

+ (id)_targetingErrorWithDeployment:(id)a3 errorType:(id)a4 details:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIRolloutTargeter.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("errorType != nil"));

  }
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13 = v12;
  if (v9)
  {
    objc_msgSend(v9, "shortDesc");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("Targeting error for rollout %@: %@"), v14, v10);

    if (!v11)
      goto LABEL_6;
    goto LABEL_5;
  }
  v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("Targeting error: %@"), v10);
  if (v11)
  {
LABEL_5:
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ -- %@"), v15, v11);

    v15 = (void *)v16;
  }
LABEL_6:
  TRILogCategory_Server();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v30 = v15;
    _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  v27[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", v15, &stru_1E9336E60, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = CFSTR("logMessage");
  v28[0] = v19;
  v28[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  if (v9)
  {
    objc_msgSend(v9, "rolloutId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("rolloutId"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "deploymentId"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("deploymentId"));

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("triald"), 1, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)targetingErrorWithDeployment:(id)a3 errorType:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_targetingErrorWithDeployment:errorType:details:", v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_activeRecordForRolloutId:(id)a3
{
  id v4;
  TRIRolloutDatabase *db;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__47;
  v14 = __Block_byref_object_dispose__47;
  v15 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__TRIRolloutTargeter__activeRecordForRolloutId___block_invoke;
  v9[3] = &unk_1E93339D8;
  v9[4] = &v10;
  if (-[TRIRolloutDatabase enumerateRecordsWithRolloutId:usingTransaction:block:](db, "enumerateRecordsWithRolloutId:usingTransaction:block:", v4, 0, v9))
  {
    v6 = (void *)v11[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __48__TRIRolloutTargeter__activeRecordForRolloutId___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "activeFactorPackSetId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- ($A5A652246548B43F8BC05201A1C72A70)targetRollout:(id)a3 factorPackSetId:(id *)a4 relatedRampDeployment:(id *)a5 error:(id *)a6
{
  return ($A5A652246548B43F8BC05201A1C72A70)-[TRIRolloutTargeter _targetRollout:factorPackSetId:relatedRampDeployment:recurseOnRamp:error:](self, "_targetRollout:factorPackSetId:relatedRampDeployment:recurseOnRamp:error:", a3, a4, a5, 1, a6);
}

- ($A5A652246548B43F8BC05201A1C72A70)_targetRollout:(id)a3 factorPackSetId:(id *)a4 relatedRampDeployment:(id *)a5 recurseOnRamp:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  $A5A652246548B43F8BC05201A1C72A70 v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  TRIRuleQualifiedFactorPackSetId *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  char v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  __CFString *v82;
  void *v83;
  void *v84;
  $A5A652246548B43F8BC05201A1C72A70 v85;
  void *v86;
  id v87;
  uint64_t v88;
  TRIRuleQualifiedFactorPackSetId *v89;
  TRIRuleQualifiedFactorPackSetId *v90;
  id v91;
  NSObject *v92;
  id v93;
  __CFString *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  __CFString *v101;
  int v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *context;
  id obj;
  id v113;
  uint64_t v114;
  uint8_t buf[4];
  uint64_t v116;
  __int16 v117;
  const __CFString *v118;
  __int16 v119;
  void *v120;
  _QWORD v121[2];
  _QWORD v122[4];

  v8 = a6;
  v122[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  if (v13)
  {
    if (a4)
      goto LABEL_3;
LABEL_53:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutTargeter.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

    if (a7)
      goto LABEL_4;
    goto LABEL_54;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutTargeter.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rollout"));

  if (!a4)
    goto LABEL_53;
LABEL_3:
  if (a7)
    goto LABEL_4;
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIRolloutTargeter.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

LABEL_4:
  v14 = *a4;
  *a4 = 0;

  if (a5)
  {
    v15 = *a5;
    *a5 = 0;

  }
  context = (void *)MEMORY[0x1D8232A5C]();
  if (objc_msgSend(v13, "hasRolloutId") && (objc_msgSend(v13, "hasDeploymentId") & 1) != 0)
  {
    v16 = objc_alloc(MEMORY[0x1E0DC0B60]);
    objc_msgSend(v13, "rolloutId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithRolloutId:deploymentId:", v17, objc_msgSend(v13, "deploymentId"));

    v109 = (void *)v18;
    if ((objc_msgSend(v13, "hasAssignment") & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "targetingErrorWithDeployment:errorType:", v18, CFSTR("missing rollout assignment"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *a7;
      *a7 = v32;

      v29.var0 = 0;
LABEL_95:

      goto LABEL_96;
    }
    v121[0] = CFSTR("SystemCovariates");
    -[TRIRolloutTargeter systemCovariateProvider](self, "systemCovariateProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v121[1] = CFSTR("TempValues");
    v122[0] = v19;
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    v122[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, v121, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = (void *)objc_msgSend(v21, "mutableCopy");

    -[TRIRolloutTargeter userCovariateProvider](self, "userCovariateProvider");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (v108)
      objc_msgSend(v107, "setObject:forKeyedSubscript:", v108, CFSTR("UserCovariates"));
    objc_msgSend(v13, "assignment");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "nsexpressionLanguage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "hasSchemaVersion") & 1) != 0)
    {
      objc_msgSend(v110, "nsexpressionLanguage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "schemaVersion");

      if (v24 >= 8)
      {
        TRILogCategory_Server();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v116) = v24;
          _os_log_impl(&dword_1D207F000, v25, OS_LOG_TYPE_DEFAULT, "Assigning to default treatment because assignment language schema version %u is incompatible.", buf, 8u);
        }

        v26 = (void *)objc_opt_class();
        v106 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Incompatible assignment language schema version %u"), v24);
        objc_msgSend(v26, "targetingErrorWithDeployment:errorType:", v18, v106);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *a7;
        *a7 = v27;
        v29.var0 = 2;
        goto LABEL_94;
      }
    }
    else
    {

    }
    objc_msgSend(v110, "nsexpressionLanguage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v34, "hasAssignmentExpression") & 1) != 0)
    {
      objc_msgSend(v110, "nsexpressionLanguage");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "assignmentExpression");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "length") == 0;

      if (!v37)
      {
        objc_msgSend(v110, "nsexpressionLanguage");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "assignmentExpression");
        v106 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = (void *)MEMORY[0x1D8232A5C]();
        objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", v106);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v39);
        v105 = v40;
        v41 = (void *)objc_opt_new();
        v42 = objc_msgSend(v41, "validateExpression:outError:", v40, a7);

        if (!v42)
        {
          v29.var0 = 0;
          goto LABEL_93;
        }
        TRILogCategory_Backtrace();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          -[TRIRolloutTargeter systemCovariateProvider](self, "systemCovariateProvider");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "dictionary");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v116 = (uint64_t)v45;
          _os_log_impl(&dword_1D207F000, v43, OS_LOG_TYPE_DEFAULT, "Using the following covariates for targeting: %@", buf, 0xCu);

        }
        v46 = (void *)MEMORY[0x1D8232A5C]();
        objc_msgSend(v40, "expressionValueWithObject:context:", v107, 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v46);
        v48 = v47;
        if (!v47)
        {
          objc_msgSend((id)objc_opt_class(), "targetingErrorWithDeployment:errorType:", v109, CFSTR("assignment expression evaluated to nil"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = *a7;
          *a7 = v58;

          TRILogCategory_Server();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v116 = (uint64_t)v105;
            v49 = (__CFString *)v60;
            _os_log_error_impl(&dword_1D207F000, v60, OS_LOG_TYPE_ERROR, "assignment expression evaluated to nil: %@", buf, 0xCu);
          }
          else
          {
            v49 = (__CFString *)v60;
          }
          v29.var0 = 0;
          goto LABEL_84;
        }
        if (!objc_msgSend(v47, "caseInsensitiveCompare:", CFSTR("no-op"))
          || !objc_msgSend(v47, "caseInsensitiveCompare:", CFSTR("default")))
        {
          TRILogCategory_Server();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v109, "shortDesc");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v116 = (uint64_t)v57;
            v117 = 2114;
            v118 = CFSTR("no-op");
            v49 = (__CFString *)v56;
            _os_log_impl(&dword_1D207F000, v56, OS_LOG_TYPE_DEFAULT, "Rollout %{public}@ is targeted to \"%{public}@\" (ignoring the deployment).", buf, 0x16u);

          }
          else
          {
            v49 = (__CFString *)v56;
          }
          v29.var0 = 2;
          goto LABEL_84;
        }
        if (!objc_msgSend(v47, "caseInsensitiveCompare:", CFSTR("empty")))
        {
          TRILogCategory_Server();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v109, "shortDesc");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v116 = (uint64_t)v62;
            v117 = 2114;
            v118 = CFSTR("empty");
            _os_log_impl(&dword_1D207F000, v61, OS_LOG_TYPE_DEFAULT, "Rollout %{public}@ is targeted to \"%{public}@\" (enroll with an empty factor pack set).", buf, 0x16u);

          }
          v63 = -[TRIRuleQualifiedFactorPackSetId initWithIdent:targetingRuleIndex:]([TRIRuleQualifiedFactorPackSetId alloc], "initWithIdent:targetingRuleIndex:", CFSTR("empty-fp-set"), 0xFFFFFFFFLL);
          v49 = (__CFString *)*a4;
          *a4 = v63;
          v29.var0 = 1;
          goto LABEL_84;
        }
        if (!objc_msgSend(v47, "caseInsensitiveCompare:", CFSTR("disenroll")))
        {
          TRILogCategory_Server();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v109, "shortDesc");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v116 = (uint64_t)v65;
            v117 = 2114;
            v118 = CFSTR("disenroll");
            v49 = (__CFString *)v64;
            _os_log_impl(&dword_1D207F000, v64, OS_LOG_TYPE_DEFAULT, "Rollout %{public}@ is targeted to \"%{public}@\" (emergency disenroll!!!).", buf, 0x16u);

          }
          else
          {
            v49 = (__CFString *)v64;
          }
          v29.var0 = 4;
          goto LABEL_84;
        }
        v114 = -1;
        v49 = v47;
        -[__CFString componentsSeparatedByString:](v49, "componentsSeparatedByString:", CFSTR(":"));
        v104 = (id)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v104, "count") > 2)
          goto LABEL_30;
        if (objc_msgSend(v104, "count") == 2)
        {
          v66 = (void *)MEMORY[0x1E0DC0AD0];
          objc_msgSend(v104, "objectAtIndexedSubscript:", 1);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v66) = objc_msgSend(v66, "convertFromString:usingBase:toI64:", v67, 10, &v114);

          if (!(_DWORD)v66 || v114 < 0 || v114 > 0x7FFFFFFF)
          {
LABEL_30:
            TRILogCategory_Server();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v109, "shortDesc");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v116 = (uint64_t)v96;
              v117 = 2114;
              v118 = v49;
              _os_log_error_impl(&dword_1D207F000, v50, OS_LOG_TYPE_ERROR, "Assignment for %{public}@ evaluates to ill-formatted factor pack set id: %{public}@", buf, 0x16u);

            }
            v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("assignment evaluates to ill-formatted factor pack set id: %@"), v49);
            objc_msgSend((id)objc_opt_class(), "_targetingErrorWithDeployment:errorType:details:", v109, v51, 0);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = *a7;
            *a7 = v52;

            v29.var0 = 0;
LABEL_83:

LABEL_84:
LABEL_93:
            v28 = v105;
            goto LABEL_94;
          }
          objc_msgSend(v104, "objectAtIndexedSubscript:", 0);
          v68 = v49;
          v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          TRILogCategory_Server();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v109, "shortDesc");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v116 = (uint64_t)v72;
            v117 = 2114;
            v118 = v49;
            _os_log_impl(&dword_1D207F000, v68, OS_LOG_TYPE_DEFAULT, "Assignment for %{public}@ evaluates to legacy-format factor pack set id: %{public}@", buf, 0x16u);

          }
        }

        if (!v8)
        {
LABEL_77:
          TRIValidateFactorPackSetId();
          v88 = objc_claimAutoreleasedReturnValue();
          v104 = (id)v88;
          if (v88)
          {
            v89 = [TRIRuleQualifiedFactorPackSetId alloc];
            v90 = -[TRIRuleQualifiedFactorPackSetId initWithIdent:targetingRuleIndex:](v89, "initWithIdent:targetingRuleIndex:", v88, v114);
            v91 = *a4;
            *a4 = v90;

            TRILogCategory_Server();
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
            {
              v93 = *a4;
              objc_msgSend(v109, "shortDesc");
              v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v116 = (uint64_t)v93;
              v117 = 2114;
              v118 = v94;
              v119 = 2114;
              v120 = v106;
              _os_log_impl(&dword_1D207F000, v92, OS_LOG_TYPE_DEFAULT, "Targeting factor pack set id %{public}@ for rollout %{public}@ with assignment %{public}@.", buf, 0x20u);

            }
            v29.var0 = 1;
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "targetingErrorWithDeployment:errorType:", v109, CFSTR("targeted factor pack set id is not a suitable identifier"));
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v29.var0 = 0;
            v92 = *a7;
            *a7 = v95;
          }

          goto LABEL_83;
        }
        objc_msgSend(v13, "rolloutId");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIRolloutTargeter _activeRecordForRolloutId:](self, "_activeRecordForRolloutId:", v73);
        v104 = (id)objc_claimAutoreleasedReturnValue();

        v74 = v104;
        if (v104)
        {
          objc_msgSend(v104, "deployment");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v75, "isEqualToDeployment:", v109);

          v74 = v104;
          if ((v76 & 1) == 0)
          {
            objc_msgSend(v104, "rampId");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v77 || !objc_msgSend(v13, "hasRampId"))
            {

LABEL_75:
              v74 = v104;
              goto LABEL_76;
            }
            objc_msgSend(v104, "rampId");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "rampId");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = objc_msgSend(v78, "isEqualToString:", v79);

            v74 = v104;
            if (v103)
            {
              TRILogCategory_Server();
              v80 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v109, "shortDesc");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "rampId");
                v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v116 = (uint64_t)v81;
                v117 = 2114;
                v118 = v82;
                _os_log_impl(&dword_1D207F000, v80, OS_LOG_TYPE_DEFAULT, "Rollout %{public}@ targeted successfully, but has the same rampId (%{public}@) as the current active deployment. Retargeting the active deployment.", buf, 0x16u);

              }
              obj = 0;
              v113 = 0;
              objc_msgSend(v104, "artifact");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "rollout");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v85.var0 = -[TRIRolloutTargeter _targetRollout:factorPackSetId:relatedRampDeployment:recurseOnRamp:error:](self, "_targetRollout:factorPackSetId:relatedRampDeployment:recurseOnRamp:error:", v84, &obj, 0, 0, &v113);

              if (v85.var0 - 2 >= 3 && v85.var0)
              {
                if (v85.var0 == 1)
                {
                  objc_storeStrong(a4, obj);
                  if (a5)
                  {
                    objc_msgSend(v104, "deployment");
                    v86 = (void *)objc_claimAutoreleasedReturnValue();
                    v87 = *a5;
                    *a5 = v86;

                  }
                  v29.var0 = 3;
                  goto LABEL_83;
                }
              }
              else
              {
                TRILogCategory_Server();
                v97 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v104, "deployment");
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v98, "shortDesc");
                  v99 = objc_claimAutoreleasedReturnValue();
                  v100 = (void *)v99;
                  if (v85.var0 > 4u)
                    v101 = 0;
                  else
                    v101 = off_1E9335E40[(char)v85.var0];
                  *(_DWORD *)buf = 138543618;
                  v116 = v99;
                  v117 = 2114;
                  v118 = v101;
                  _os_log_impl(&dword_1D207F000, v97, OS_LOG_TYPE_DEFAULT, "Retargeting of prior ramp deployment %{public}@ resulted in %{public}@; taking the new deployment instead.",
                    buf,
                    0x16u);

                }
              }

              goto LABEL_75;
            }
          }
        }
LABEL_76:

        goto LABEL_77;
      }
    }
    else
    {

    }
    objc_msgSend((id)objc_opt_class(), "targetingErrorWithDeployment:errorType:", v109, CFSTR("assignment string is missing or empty"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = *a7;
    *a7 = v54;

    v28 = 0;
    v106 = 0;
    v29.var0 = 0;
LABEL_94:

    goto LABEL_95;
  }
  objc_msgSend((id)objc_opt_class(), "targetingErrorWithDeployment:errorType:", 0, CFSTR("rollout identifiers missing in rollout definition"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *a7;
  *a7 = v30;

  v29.var0 = 0;
LABEL_96:
  objc_autoreleasePoolPop(context);

  return v29;
}

- (TRISystemCovariateProviding)systemCovariateProvider
{
  return self->_systemCovariateProvider;
}

- (TRIUserCovariateProviding)userCovariateProvider
{
  return self->_userCovariateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userCovariateProvider, 0);
  objc_storeStrong((id *)&self->_systemCovariateProvider, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end
