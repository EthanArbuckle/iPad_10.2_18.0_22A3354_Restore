@implementation TRIBMLTTargeter

- (TRIBMLTTargeter)initWithDatabase:(id)a3 systemCovariateProvider:(id)a4 userCovariateProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  TRIBMLTTargeter *v12;
  TRIBMLTTargeter *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TRIBMLTTargeter;
  v12 = -[TRIBMLTTargeter init](&v15, sel_init);
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
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIBMLTTargeter.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("errorType != nil"));

  }
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13 = v12;
  if (v9)
  {
    objc_msgSend(v9, "shortDesc");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("Targeting error for BMLT %@: %@"), v14, v10);

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
    objc_msgSend(v9, "backgroundMLTaskId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("taskId"));

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

- ($A5A652246548B43F8BC05201A1C72A70)targetBMLT:(id)a3 factorPackSetId:(id *)a4 error:(id *)a5
{
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  $A5A652246548B43F8BC05201A1C72A70 v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[2];
  _QWORD v48[2];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (v9)
  {
    if (a4)
      goto LABEL_3;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargeter.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId"));

    if (a5)
      goto LABEL_4;
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargeter.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIBMLTTargeter.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmlt"));

  if (!a4)
    goto LABEL_27;
LABEL_3:
  if (!a5)
    goto LABEL_28;
LABEL_4:
  v10 = *a4;
  *a4 = 0;

  v11 = (void *)MEMORY[0x1D8232A5C]();
  if (objc_msgSend(v9, "hasTaskId") && (objc_msgSend(v9, "hasDeploymentId") & 1) != 0)
  {
    if (!objc_msgSend(v9, "hasEndDate"))
      goto LABEL_8;
    objc_msgSend(v9, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    v15 = objc_msgSend(v13, "compare:", v14);

    if (v15 != -1)
    {
LABEL_8:
      v16 = objc_alloc(MEMORY[0x1E0DC09A8]);
      objc_msgSend(v9, "taskId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v16, "initWithBackgroundMLTaskId:deploymentId:", v17, objc_msgSend(v9, "deploymentId"));

      if ((objc_msgSend(v9, "hasAssignment") & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "targetingErrorWithDeployment:errorType:", v46, CFSTR("missing BMLT assignment"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = *a5;
        *a5 = v37;

        v34.var0 = 0;
LABEL_21:

        goto LABEL_22;
      }
      v47[0] = CFSTR("SystemCovariates");
      -[TRIBMLTTargeter systemCovariateProvider](self, "systemCovariateProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = CFSTR("TempValues");
      v48[0] = v18;
      v19 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      v48[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "mutableCopy");

      -[TRIBMLTTargeter userCovariateProvider](self, "userCovariateProvider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("UserCovariates"));
      objc_msgSend(v9, "assignment");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "nsexpressionLanguage");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "hasSchemaVersion") & 1) != 0)
      {
        objc_msgSend(v23, "nsexpressionLanguage");
        v45 = v23;
        v25 = v22;
        v26 = v21;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "schemaVersion");

        v21 = v26;
        v22 = v25;
        v23 = v45;

        if (v28 >= 6)
        {
          TRILogCategory_Server();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v50) = v28;
            _os_log_impl(&dword_1D207F000, v29, OS_LOG_TYPE_DEFAULT, "Assigning to default treatment because assignment language schema version %u is incompatible.", buf, 8u);
          }

          v30 = (void *)objc_opt_class();
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Incompatible assignment language schema version %u"), v28);
          objc_msgSend(v30, "targetingErrorWithDeployment:errorType:", v46, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = *a5;
          *a5 = v32;

          v34.var0 = 2;
          goto LABEL_20;
        }
      }
      else
      {

      }
      v34.var0 = -[TRIBMLTTargeter _evaluateExpressionForDeployment:context:assignment:fpsId:error:](self, "_evaluateExpressionForDeployment:context:assignment:fpsId:error:", v46, v21, v23, a4, a5);
LABEL_20:

      goto LABEL_21;
    }
    TRILogCategory_Server();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "taskId");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v41;
      v51 = 1024;
      v52 = objc_msgSend(v9, "deploymentId");
      _os_log_impl(&dword_1D207F000, v40, OS_LOG_TYPE_INFO, "BMLT %{public}@.%u has end date in the past", buf, 0x12u);

    }
    v34.var0 = 2;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "targetingErrorWithDeployment:errorType:", 0, CFSTR("BMLT identifiers missing in task definition"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *a5;
    *a5 = v35;

    v34.var0 = 0;
  }
LABEL_22:
  objc_autoreleasePoolPop(v11);

  return v34;
}

- ($A5A652246548B43F8BC05201A1C72A70)_evaluateExpressionForDeployment:(id)a3 context:(id)a4 assignment:(id)a5 fpsId:(id *)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  id v32;
  $A5A652246548B43F8BC05201A1C72A70 v33;
  void *v34;
  id v35;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  TRIRuleQualifiedFactorPackSetId *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  TRIRuleQualifiedFactorPackSetId *v52;
  TRIRuleQualifiedFactorPackSetId *v53;
  id v54;
  id v55;
  __CFString *v56;
  void *v57;
  void *v58;
  __CFString *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v61 = a4;
  v13 = a5;
  objc_msgSend(v13, "nsexpressionLanguage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "hasAssignmentExpression") & 1) == 0)
  {

    goto LABEL_16;
  }
  objc_msgSend(v13, "nsexpressionLanguage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "assignmentExpression");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (!v17)
  {
LABEL_16:
    objc_msgSend((id)objc_opt_class(), "targetingErrorWithDeployment:errorType:", v12, CFSTR("assignment string is missing or empty"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *a7;
    *a7 = v34;

    v21 = 0;
    v19 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v13, "nsexpressionLanguage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "assignmentExpression");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v20);
  v22 = (void *)objc_opt_new();
  v23 = objc_msgSend(v22, "validateExpression:outError:", v21, a7);

  if (v23)
  {
    TRILogCategory_Backtrace();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      -[TRIBMLTTargeter systemCovariateProvider](self, "systemCovariateProvider");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "dictionary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v64 = (uint64_t)v26;
      _os_log_impl(&dword_1D207F000, v24, OS_LOG_TYPE_DEFAULT, "Using the following covariates for targeting: %@", buf, 0xCu);

    }
    v27 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v21, "expressionValueWithObject:context:", v61, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v27);
    if (!v28)
    {
      objc_msgSend((id)objc_opt_class(), "targetingErrorWithDeployment:errorType:", v12, CFSTR("assignment expression evaluated to nil"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = *a7;
      *a7 = v40;

      TRILogCategory_Server();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v64 = (uint64_t)v21;
        _os_log_error_impl(&dword_1D207F000, v37, OS_LOG_TYPE_ERROR, "assignment expression evaluated to nil: %@", buf, 0xCu);
      }
      v33.var0 = 0;
      goto LABEL_45;
    }
    if (objc_msgSend(v28, "caseInsensitiveCompare:", CFSTR("no-op"))
      && objc_msgSend(v28, "caseInsensitiveCompare:", CFSTR("default")))
    {
      if (!objc_msgSend(v28, "caseInsensitiveCompare:", CFSTR("empty")))
      {
        TRILogCategory_Server();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "shortDesc");
          v43 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v64 = v43;
          v65 = 2114;
          v66 = CFSTR("empty");
          v44 = (void *)v43;
          _os_log_impl(&dword_1D207F000, v42, OS_LOG_TYPE_DEFAULT, "BMLT %{public}@ is targeted to \"%{public}@\" (enroll with an empty factor pack set).", buf, 0x16u);

        }
        v45 = -[TRIRuleQualifiedFactorPackSetId initWithIdent:targetingRuleIndex:]([TRIRuleQualifiedFactorPackSetId alloc], "initWithIdent:targetingRuleIndex:", CFSTR("empty-fp-set"), 0xFFFFFFFFLL);
        v46 = *a6;
        *a6 = v45;
        v37 = v46;
        v33.var0 = 1;
        goto LABEL_45;
      }
      if (objc_msgSend(v28, "caseInsensitiveCompare:", CFSTR("disenroll")))
      {
        v62 = -1;
        v59 = v28;
        -[__CFString componentsSeparatedByString:](v59, "componentsSeparatedByString:", CFSTR(":"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v60, "count") > 2)
        {
LABEL_12:
          TRILogCategory_Server();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "shortDesc");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v64 = (uint64_t)v58;
            v65 = 2114;
            v66 = v59;
            _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "Assignment for %{public}@ evaluates to ill-formatted factor pack set id: %{public}@", buf, 0x16u);

          }
          v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("assignment evaluates to ill-formatted factor pack set id: %@"), v59);
          objc_msgSend((id)objc_opt_class(), "_targetingErrorWithDeployment:errorType:details:", v12, v30, 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = *a7;
          *a7 = v31;

          v33.var0 = 0;
LABEL_44:

          v37 = v59;
          goto LABEL_45;
        }
        if (objc_msgSend(v60, "count") == 2)
        {
          v48 = (void *)MEMORY[0x1E0DC0AD0];
          objc_msgSend(v60, "objectAtIndexedSubscript:", 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v48) = objc_msgSend(v48, "convertFromString:usingBase:toI64:", v49, 10, &v62);

          if (!(_DWORD)v48 || v62 < 0 || v62 > 0x7FFFFFFF)
            goto LABEL_12;
          objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
          v50 = v59;
          v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          TRILogCategory_Server();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "shortDesc");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v64 = (uint64_t)v51;
            v65 = 2114;
            v66 = v59;
            _os_log_impl(&dword_1D207F000, v50, OS_LOG_TYPE_DEFAULT, "Assignment for %{public}@ evaluates to legacy-format factor pack set id: %{public}@", buf, 0x16u);

          }
        }

        TRIValidateFactorPackSetId();
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (v60)
        {
          v52 = [TRIRuleQualifiedFactorPackSetId alloc];
          v53 = -[TRIRuleQualifiedFactorPackSetId initWithIdent:targetingRuleIndex:](v52, "initWithIdent:targetingRuleIndex:", v60, v62);
          v54 = *a6;
          *a6 = v53;

          TRILogCategory_Server();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v55 = *a6;
            objc_msgSend(v12, "shortDesc");
            v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v64 = (uint64_t)v55;
            v65 = 2114;
            v66 = v56;
            v67 = 2114;
            v68 = v19;
            _os_log_impl(&dword_1D207F000, v30, OS_LOG_TYPE_DEFAULT, "Targeting factor pack set id %{public}@ for BMLT %{public}@ with assignment %{public}@.", buf, 0x20u);

          }
          v33.var0 = 1;
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "targetingErrorWithDeployment:errorType:", v12, CFSTR("targeted factor pack set id is not a suitable identifier"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = 0;
          v33.var0 = 0;
          v30 = *a7;
          *a7 = v57;
        }
        goto LABEL_44;
      }
      TRILogCategory_Server();
      v37 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v33.var0 = 3;
        goto LABEL_45;
      }
      objc_msgSend(v12, "shortDesc");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v64 = (uint64_t)v47;
      v65 = 2114;
      v66 = CFSTR("disenroll");
      v39 = v37;
      _os_log_impl(&dword_1D207F000, v37, OS_LOG_TYPE_DEFAULT, "BMLT %{public}@ is targeted to \"%{public}@\" (emergency disenroll!!!).", buf, 0x16u);

      v33.var0 = 3;
    }
    else
    {
      TRILogCategory_Server();
      v37 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v33.var0 = 2;
        goto LABEL_45;
      }
      objc_msgSend(v12, "shortDesc");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v64 = (uint64_t)v38;
      v65 = 2114;
      v66 = CFSTR("no-op");
      v39 = v37;
      _os_log_impl(&dword_1D207F000, v37, OS_LOG_TYPE_DEFAULT, "BMLT %{public}@ is targeted to \"%{public}@\" (ignoring the deployment).", buf, 0x16u);

      v33.var0 = 2;
    }
    v37 = v39;
LABEL_45:

    goto LABEL_18;
  }
LABEL_17:
  v33.var0 = 0;
LABEL_18:

  return v33;
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
