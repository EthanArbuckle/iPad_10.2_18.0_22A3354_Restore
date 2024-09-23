@implementation TRILogTreatmentProvider

+ (id)providerWithProjectId:(int)a3 paths:(id)a4
{
  uint64_t v4;
  id v5;
  int IsValidValue;
  TRILogTreatmentProvider *v7;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  IsValidValue = TRIProject_ProjectId_IsValidValue();
  v7 = 0;
  if ((_DWORD)v4 && IsValidValue)
    v7 = -[TRILogTreatmentReader initWithProjectId:paths:]([TRILogTreatmentProvider alloc], "initWithProjectId:paths:", v4, v5);

  return v7;
}

+ (BOOL)deleteFileAtPath:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "fileExistsAtPath:", v3)
    || ((v12 = 0, v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v12), v6 = v12, v5)
      ? (v7 = v6 == 0)
      : (v7 = 0),
        v7))
  {
    v10 = 1;
  }
  else
  {
    v8 = v6;
    TRILogCategory_ClientFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v3;
      v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "failed to remove file %{public}@ -- %{public}@", buf, 0x16u);
    }

    v10 = 0;
  }

  return v10;
}

- (BOOL)saveTreatments:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRILogTreatmentReader path](self, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v6, "triCreateDirectoryForPath:isDirectory:error:", v5, 0, &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20;

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 0;
  if (v9)
  {
    if (!objc_msgSend(v4, "count"))
    {
      v11 = +[TRILogTreatmentProvider deleteFileAtPath:](TRILogTreatmentProvider, "deleteFileAtPath:", v5);
      goto LABEL_20;
    }
    v12 = objc_alloc_init(MEMORY[0x1E0DC0EB0]);
    objc_msgSend(v12, "setTreatments:", v4);
    objc_msgSend(v12, "setMetrics:", 0);
    objc_msgSend(v12, "setSubject:", 0);
    objc_msgSend(v12, "setSystemDimensions:", 0);
    objc_msgSend(v12, "setUserDimensions:", 0);
    objc_msgSend(v12, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      v19 = 0;
      v11 = 1;
      v14 = objc_msgSend(v13, "writeToFile:options:error:", v5, 1, &v19);
      v15 = v19;
      v16 = v15;
      if (v14 && !v15)
        goto LABEL_19;
      TRILogCategory_ClientFramework();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v22 = v5;
        v23 = 2114;
        v24 = v16;
        _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "failed to write treatments to file %{public}@ -- %{public}@", buf, 0x16u);
      }

    }
    else
    {
      TRILogCategory_ClientFramework();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v22 = 0;
        _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "failed to serialize treatments -- %{public}@", buf, 0xCu);
      }
    }

    v11 = 0;
LABEL_19:

    goto LABEL_20;
  }
  TRILogCategory_ClientFramework();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v22 = v5;
    v23 = 2114;
    v24 = v8;
    _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "failed to create directory for file %{public}@ -- %{public}@", buf, 0x16u);
  }

  v11 = 0;
LABEL_20:

  return v11;
}

- (BOOL)addTreatment:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  TRILogTreatmentProvider *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = self;
  -[TRILogTreatmentReader treatments](self, "treatments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      v11 = 0;
      v12 = v8 + v9;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "treatmentId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "treatmentId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if ((v15 & 1) != 0)
        {
          v12 = v9 + v11;
          goto LABEL_14;
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v9 = v12;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_14:

  if (v12 >= objc_msgSend(v6, "count"))
    objc_msgSend(v6, "addObject:", v4);
  else
    objc_msgSend(v6, "setObject:atIndexedSubscript:", v4, v12);
  v16 = -[TRILogTreatmentProvider saveTreatments:](v18, "saveTreatments:", v6);

  return v16;
}

- (void)removeTreatment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  char v15;
  NSObject *v16;
  TRILogTreatmentProvider *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRILogTreatmentReader treatments](self, "treatments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v17 = self;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        v12 = 0;
        v13 = v9 + v10;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "treatmentId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v4);

          if ((v15 & 1) != 0)
          {
            v13 = v10 + v12;
            goto LABEL_16;
          }
          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v10 = v13;
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      v13 = 0;
    }
LABEL_16:

    if (v13 < objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "removeObjectAtIndex:", v13);
      -[TRILogTreatmentProvider saveTreatments:](v17, "saveTreatments:", v7);
    }
  }
  else
  {
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v4;
      _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "asked to remove treatment %@ from logging but no existing treatments", buf, 0xCu);
    }

  }
}

- (void)updatePersistedLogNamespace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRILogTreatmentReader fetchRolloutLogNamespaces](self, "fetchRolloutLogNamespaces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "name", (_QWORD)v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if ((v14 & 1) == 0)
          objc_msgSend(v6, "addNamespace:", v4);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "addNamespace:", v4);
  objc_msgSend(v6, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRILogTreatmentReader namespaceLoggingTreatmentPath](self, "namespaceLoggingTreatmentPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "writeToFile:atomically:", v16, 1);

  if ((v17 & 1) == 0)
  {
    TRILogCategory_Server();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[TRILogTreatmentReader namespaceLoggingTreatmentPath](self, "namespaceLoggingTreatmentPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "failed writing rolloutcounts to %@", buf, 0xCu);

    }
  }

}

@end
