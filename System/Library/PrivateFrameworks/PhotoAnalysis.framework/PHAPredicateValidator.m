@implementation PHAPredicateValidator

- (BOOL)validatePredicate:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v6, "subpredicates", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          if (!-[PHAPredicateValidator validatePredicate:error:](self, "validatePredicate:error:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), a4))
          {
            v12 = 0;
            goto LABEL_19;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
    v12 = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v7, "leftExpression");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PHAPredicateValidator validateExpression:error:](self, "validateExpression:error:", v13, a4))
    {
      objc_msgSend(v7, "rightExpression");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PHAPredicateValidator validateExpression:error:](self, "validateExpression:error:", v14, a4);

    }
    else
    {
      v12 = 0;
    }

LABEL_19:
    goto LABEL_20;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 11);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_20:

  return v12;
}

- (BOOL)validateExpression:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = objc_msgSend(v6, "expressionType");
  if (v7 != 3)
  {
    if (v7)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 11);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(v6, "constantValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PHAPredicateValidator validateValue:error:](self, "validateValue:error:", v8, a4);

      if (v9)
      {
        v10 = 1;
        goto LABEL_12;
      }
    }
    v10 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v6, "keyPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[PHAPredicateValidator allowedKeyPaths](self, "allowedKeyPaths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "containsObject:", v13);

  }
  else
  {
    v10 = 0;
  }

LABEL_12:
  return v10;
}

- (BOOL)validateValue:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v7);
          if (!-[PHAPredicateValidator validateValue:error:](self, "validateValue:error:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), a4))
          {
            v11 = 0;
            goto LABEL_16;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v8)
          continue;
        break;
      }
    }
    v11 = 1;
LABEL_16:

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v23 = 1;
      v14 = 0;
      v15 = &v14;
      v16 = 0x3032000000;
      v17 = __Block_byref_object_copy__1166;
      v18 = __Block_byref_object_dispose__1167;
      v19 = 0;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __45__PHAPredicateValidator_validateValue_error___block_invoke;
      v13[3] = &unk_1E851F850;
      v13[4] = self;
      v13[5] = &v20;
      v13[6] = &v14;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);
      if (a4)
        *a4 = objc_retainAutorelease((id)v15[5]);
      v11 = *((_BYTE *)v21 + 24) != 0;
      _Block_object_dispose(&v14, 8);

      _Block_object_dispose(&v20, 8);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v11 = 1;
      }
      else if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 11);
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
    }
  }

  return v11;
}

- (NSSet)allowedKeyPaths
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAllowedKeyPaths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedKeyPaths, 0);
}

void __45__PHAPredicateValidator_validateValue_error___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = (void *)a1[4];
  v16 = 0;
  v9 = objc_msgSend(v8, "validateValue:error:", a2, &v16);
  v10 = v16;
  if (v9)
  {
    v11 = (void *)a1[4];
    v15 = v10;
    LOBYTE(v9) = objc_msgSend(v11, "validateValue:error:", v7, &v15);
    v12 = v15;

    v10 = v12;
  }
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v9;
  *a4 = *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) ^ 1;
  v13 = *(_QWORD *)(a1[6] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v10;

}

@end
