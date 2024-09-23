@implementation TRIExpressionValidator

- (id)_validationErrorWithDetails:(id)a3
{
  id v3;
  __CFString *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = CFSTR("Expression validation error");
  if (v3)
    v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ -- %@"), CFSTR("Expression validation error"), v3);
  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v4;
    _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  v12 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v4, &stru_1E9336E60, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("triald"), 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_validSystemCovariateFunction:(id)a3
{
  return objc_msgSend(&unk_1E93636F0, "containsObject:", a3);
}

- (BOOL)_validUserCovariateFunction:(id)a3
{
  return objc_msgSend(&unk_1E9363708, "containsObject:", a3);
}

- (BOOL)validateExpression:(id)a3 outError:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExpressionValidator.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("expression != nil"));

  }
  v8 = objc_msgSend(v7, "expressionType");
  if (!v8)
    goto LABEL_34;
  if (v8 == 20)
  {
    objc_msgSend(v7, "predicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[TRIExpressionValidator validatePredicate:outError:](self, "validatePredicate:outError:", v12, a4))
      goto LABEL_41;
    objc_msgSend(v7, "trueExpression");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[TRIExpressionValidator validateExpression:outError:](self, "validateExpression:outError:", v15, a4))
    {
LABEL_40:

      goto LABEL_41;
    }
    objc_msgSend(v7, "falseExpression");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(a4) = -[TRIExpressionValidator validateExpression:outError:](self, "validateExpression:outError:", v16, a4);

    if (!(_DWORD)a4)
      goto LABEL_43;
LABEL_34:
    LOBYTE(a4) = 1;
    goto LABEL_43;
  }
  if (v8 != 4)
    goto LABEL_34;
  objc_msgSend(v7, "function");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("castObject:toType:"));

  if (!v10)
  {
    objc_msgSend(v7, "operand");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("SystemCovariates"));

    if (v19)
    {
      objc_msgSend(v7, "function");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[TRIExpressionValidator _validSystemCovariateFunction:](self, "_validSystemCovariateFunction:", v12))
      {
        TRILogCategory_Server();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v44 = v12;
          v45 = 2112;
          v46 = v7;
          v21 = "%@ in expression %@ is not an allowed function for SystemCovariates";
LABEL_37:
          _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0x16u);
          goto LABEL_38;
        }
        goto LABEL_38;
      }
    }
    else
    {
      objc_msgSend(v7, "operand");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("UserCovariates"));

      if (!v24)
        goto LABEL_22;
      objc_msgSend(v7, "function");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[TRIExpressionValidator _validUserCovariateFunction:](self, "_validUserCovariateFunction:", v12))
      {
        TRILogCategory_Server();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v44 = v12;
          v45 = 2112;
          v46 = v7;
          v21 = "%@ in expression %@ is not an allowed function for UserCovariates";
          goto LABEL_37;
        }
LABEL_38:

        if (!a4)
          goto LABEL_41;
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Function \"%@\" in expression \"%@\" is not allowed"), v12, v7);
        -[TRIExpressionValidator _validationErrorWithDetails:](self, "_validationErrorWithDetails:", v15);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *a4;
        *a4 = v34;

        goto LABEL_40;
      }
    }

LABEL_22:
    objc_msgSend(v7, "operand");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "expressionType");

    if ((v26 & 0xFFFFFFFFFFFFFFEFLL) == 4)
    {
      objc_msgSend(v7, "operand");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[TRIExpressionValidator validateExpression:outError:](self, "validateExpression:outError:", v27, a4);

      if (!v28)
        goto LABEL_42;
    }
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v7, "arguments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v39;
LABEL_26:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v39 != v31)
          objc_enumerationMutation(v12);
        v33 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v32);
        if ((objc_msgSend(v33, "expressionType") & 0xFFFFFFFFFFFFFFEFLL) == 4
          && !-[TRIExpressionValidator validateExpression:outError:](self, "validateExpression:outError:", v33, a4))
        {
          goto LABEL_41;
        }
        if (v30 == ++v32)
        {
          v30 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          if (v30)
            goto LABEL_26;
          break;
        }
      }
    }

    goto LABEL_34;
  }
  TRILogCategory_Server();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v7;
    _os_log_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEFAULT, "cast expression %@ is not an allowed expression", buf, 0xCu);
  }

  if (a4)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("cast is not allowed in expression \"%@\" "), v7);
    -[TRIExpressionValidator _validationErrorWithDetails:](self, "_validationErrorWithDetails:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *a4;
    *a4 = v13;

LABEL_41:
LABEL_42:
    LOBYTE(a4) = 0;
  }
LABEL_43:

  return (char)a4;
}

- (BOOL)validatePredicate:(id)a3 outError:(id *)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIExpressionValidator.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate != nil"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v7, "subpredicates");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
LABEL_6:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        if (!-[TRIExpressionValidator validatePredicate:outError:](self, "validatePredicate:outError:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12), a4))goto LABEL_18;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v10)
            goto LABEL_6;
          break;
        }
      }
    }

LABEL_16:
    LOBYTE(v15) = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  v8 = v7;
  objc_msgSend(v8, "leftExpression");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[TRIExpressionValidator validateExpression:outError:](self, "validateExpression:outError:", v13, a4))
  {

LABEL_18:
    LOBYTE(v15) = 0;
    goto LABEL_19;
  }
  objc_msgSend(v8, "rightExpression");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[TRIExpressionValidator validateExpression:outError:](self, "validateExpression:outError:", v14, a4);

  if (v15)
    goto LABEL_16;
LABEL_19:

  return v15;
}

@end
