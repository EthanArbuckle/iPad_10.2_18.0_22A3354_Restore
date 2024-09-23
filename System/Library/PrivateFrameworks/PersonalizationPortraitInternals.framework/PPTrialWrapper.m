@implementation PPTrialWrapper

void __66__PPTrialWrapper_filepathForFactorName_namespaceName_isDirectory___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id *v11;

  v3 = a2;
  if (*(_BYTE *)(a1[4] + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
  else
  {
    v11 = v3;
    objc_msgSend(v3[3], "objectForKeyedSubscript:", a1[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v11;
    if (v4)
    {
      objc_msgSend(v11[3], "objectForKeyedSubscript:", a1[5]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", a1[6]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v11;
      if (v6)
      {
        objc_msgSend(v11[3], "objectForKeyedSubscript:", a1[5]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", a1[6]);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1[8] + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        v3 = v11;
      }
    }
  }

}

void __44__PPTrialWrapper_concatenatedTreatmentNames__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 40));
}

void __37__PPTrialWrapper_lastTreatmentUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(a2 + 32));
}

- (id)_loadMLModelForModelName:(id)a3 namespaceName:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[PPTrialWrapper mlModelPathForModelName:namespaceName:error:](self, "mlModelPathForModelName:namespaceName:error:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setComputeUnits:", 0);
    objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", v9, v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    pp_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "PPTrialWrapper: unable to resolve compiled URL for model %@", (uint8_t *)&v14, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

+ (PPTrialWrapper)sharedInstance
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  PPTrialWrapper *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  pthread_mutex_lock(&sharedInstance_lock_21414);
  if (sharedInstance_instance_21415)
  {
LABEL_2:
    v2 = 1;
    goto LABEL_20;
  }
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[PPSQLDatabase sharedInstance](PPSQLDatabase, "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[PPTrialWrapper sharedTrialClient](PPTrialWrapper, "sharedTrialClient");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = -[PPTrialWrapper initWithSettings:database:trialClient:]([PPTrialWrapper alloc], "initWithSettings:database:trialClient:", v3, v4, v5);
        v7 = (void *)sharedInstance_instance_21415;
        sharedInstance_instance_21415 = (uint64_t)v6;

        if (!sharedInstance_instance_21415)
        {
          pp_default_log_handle();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v13 = 0;
            _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_INFO, "PPTrialWrapper sharedInstance did not initialize, will try again later. Device may be Class C locked.", v13, 2u);
          }

        }
        goto LABEL_2;
      }
      pp_default_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_INFO, "PPTrialWrapper sharedInstance failed to creare Trial client.", v14, 2u);
      }

    }
    else
    {
      pp_default_log_handle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_INFO, "PPTrialWrapper sharedInstance failed to get database singleton.", v15, 2u);
      }
    }

  }
  else
  {
    pp_default_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_INFO, "PPTrialWrapper sharedInstance failed to get settings singleton.", buf, 2u);
    }
  }

  v2 = 0;
LABEL_20:
  v10 = (id)sharedInstance_instance_21415;
  pthread_mutex_unlock(&sharedInstance_lock_21414);
  if (v2)
    v11 = v10;
  else
    v11 = 0;

  return (PPTrialWrapper *)v11;
}

- (id)mlModelPathForModelName:(id)a3 namespaceName:(id)a4 error:(id *)a5
{
  void *v5;
  void *v6;

  -[PPTrialWrapper directoryForFactorName:namespaceName:](self, "directoryForFactorName:namespaceName:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v5);
  else
    v6 = 0;

  return v6;
}

- (id)plistForFactorName:(id)a3 namespaceName:(id)a4
{
  void *v6;
  void *v7;
  void *v9;

  -[PPTrialWrapper filepathForFactor:namespaceName:](self, "filepathForFactor:namespaceName:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPTrialWrapper.m"), 393, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configPath.length > 0"));

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v6);

  return v7;
}

- (id)filepathForFactorName:(id)a3 namespaceName:(id)a4 isDirectory:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  _PASLock *lock;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v5 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__21335;
  v35 = __Block_byref_object_dispose__21336;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  lock = self->_lock;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __66__PPTrialWrapper_filepathForFactorName_namespaceName_isDirectory___block_invoke;
  v22[3] = &unk_1E7E1EFC8;
  v22[4] = self;
  v25 = &v27;
  v11 = v9;
  v23 = v11;
  v12 = v8;
  v24 = v12;
  v26 = &v31;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v22);
  if (v32[5])
  {
    pp_default_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v12;
      v39 = 2112;
      v40 = v11;
      _os_log_debug_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEBUG, "PPTrialWrapper: obeying override for factor %@ in namespace %@", buf, 0x16u);
    }

    v14 = (id)v32[5];
LABEL_9:
    v16 = v14;
    goto LABEL_10;
  }
  if (*((_BYTE *)v28 + 24))
  {
    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v12;
      v39 = 2112;
      v40 = v11;
      _os_log_debug_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEBUG, "PPTrialWrapper: using default file for factor %@ in namespace %@", buf, 0x16u);
    }

    -[PPTrialWrapper defaultFilepathForFactor:namespaceName:](self, "defaultFilepathForFactor:namespaceName:", v12, v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[PPTrialWrapper levelForFactor:namespaceName:](self, "levelForFactor:namespaceName:", v12, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if (v5)
      objc_msgSend(v18, "directoryValue");
    else
      objc_msgSend(v18, "fileValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    pp_default_log_handle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v12;
      v39 = 2112;
      v40 = v11;
      _os_log_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEFAULT, "PPTrialWrapper: Received nil factor from Trial for factor %@ in namespace %@, falling back to default", buf, 0x16u);
    }

    -[PPTrialWrapper defaultFilepathForFactor:namespaceName:](self, "defaultFilepathForFactor:namespaceName:", v12, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

- (id)levelForFactor:(id)a3 namespaceName:(id)a4
{
  return (id)-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", a3, a4);
}

- (id)filepathForFactor:(id)a3 namespaceName:(id)a4
{
  return -[PPTrialWrapper filepathForFactorName:namespaceName:isDirectory:](self, "filepathForFactorName:namespaceName:isDirectory:", a3, a4, 0);
}

- (id)directoryForFactorName:(id)a3 namespaceName:(id)a4
{
  return -[PPTrialWrapper filepathForFactorName:namespaceName:isDirectory:](self, "filepathForFactorName:namespaceName:isDirectory:", a3, a4, 1);
}

- (NSString)concatenatedTreatmentNames
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
  v9 = __Block_byref_object_copy__21335;
  v10 = __Block_byref_object_dispose__21336;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PPTrialWrapper_concatenatedTreatmentNames__block_invoke;
  v5[3] = &unk_1E7E1EF28;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (id)lastTreatmentUpdate
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
  v9 = __Block_byref_object_copy__21335;
  v10 = __Block_byref_object_dispose__21336;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__PPTrialWrapper_lastTreatmentUpdate__block_invoke;
  v5[3] = &unk_1E7E1EF28;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (PPTrialWrapper)initWithSettings:(id)a3 database:(id)a4 trialClient:(id)a5
{
  id v8;
  id v9;
  id v10;
  PPTrialWrapper *v11;
  PPTrialWrapper *v12;
  NSDictionary *namespaceNamesIdsDict;
  id v14;
  void *v15;
  uint64_t v16;
  _PASLock *lock;
  _PASLock *v18;
  PPTrialWrapper *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  PPTrialWrapper *v26;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PPTrialWrapper;
  v11 = -[PPTrialWrapper init](&v27, sel_init);
  v12 = v11;
  if (v11)
  {
    namespaceNamesIdsDict = v11->_namespaceNamesIdsDict;
    v11->_namespaceNamesIdsDict = (NSDictionary *)&unk_1E7E5C008;

    v14 = objc_alloc(MEMORY[0x1E0D815F0]);
    v15 = (void *)objc_opt_new();
    v16 = objc_msgSend(v14, "initWithGuardedData:", v15);
    lock = v12->_lock;
    v12->_lock = (_PASLock *)v16;

    v12->_useDefaultFiles = objc_msgSend(v8, "trialUseDefaultFiles");
    objc_storeStrong((id *)&v12->_db, a4);
    objc_storeStrong((id *)&v12->_trialClient, a5);
    v18 = v12->_lock;
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __56__PPTrialWrapper_initWithSettings_database_trialClient___block_invoke;
    v24 = &unk_1E7E1EE60;
    v25 = v8;
    v19 = v12;
    v26 = v19;
    -[_PASLock runWithLockAcquired:](v18, "runWithLockAcquired:", &v21);
    -[PPTrialWrapper _updateConcatenatedTreatmentNamesAndHash](v19, "_updateConcatenatedTreatmentNamesAndHash", v21, v22, v23, v24);

  }
  return v12;
}

- (void)dealloc
{
  _PASLock *lock;
  objc_super v4;
  _QWORD v5[5];

  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__PPTrialWrapper_dealloc__block_invoke;
  v5[3] = &unk_1E7E1EE88;
  v5[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v4.receiver = self;
  v4.super_class = (Class)PPTrialWrapper;
  -[PPTrialWrapper dealloc](&v4, sel_dealloc);
}

- (void)_addDefaultUpdateHandlersForAllNamespacesWithGuardedData:(id)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  TRIClient *trialClient;
  void *v10;
  NSDictionary *obj;
  _QWORD v12[4];
  id *v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id location;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  location = 0;
  objc_initWeak(&location, self);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = self->_namespaceNamesIdsDict;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
        trialClient = self->_trialClient;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __75__PPTrialWrapper__addDefaultUpdateHandlersForAllNamespacesWithGuardedData___block_invoke;
        v12[3] = &unk_1E7E1EED8;
        objc_copyWeak(&v15, &location);
        v13 = v4;
        v14 = v8;
        -[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](trialClient, "addUpdateHandlerForNamespaceName:usingBlock:", v8, v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4[2], "addObject:", v10);

        objc_destroyWeak(&v15);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v5);
  }

  objc_destroyWeak(&location);
}

- (id)lastTreatmentUpdateForNamespaceName:(id)a3
{
  id v4;
  PPSQLDatabase *db;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__21335;
  v21 = __Block_byref_object_dispose__21336;
  v22 = 0;
  db = self->_db;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __54__PPTrialWrapper_lastTreatmentUpdateForNamespaceName___block_invoke;
  v14 = &unk_1E7E1EF00;
  v16 = &v17;
  v6 = v4;
  v15 = v6;
  -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 6, &v11);
  if (v18[5])
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend((id)v18[5], "doubleValue", v11, v12, v13, v14);
    v8 = (void *)objc_msgSend(v7, "initWithTimeIntervalSince1970:");
  }
  else
  {
    pp_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v6;
      _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPTrialWrapper: namespace %@ has never been updated.", buf, 0xCu);
    }

    v8 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (void)removeUpdateHandlerForToken:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    -[TRIClient removeUpdateHandlerForToken:](self->_trialClient, "removeUpdateHandlerForToken:", v4);
    lock = self->_lock;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__PPTrialWrapper_removeUpdateHandlerForToken___block_invoke;
    v7[3] = &unk_1E7E1EE88;
    v8 = v6;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

    v4 = v6;
  }

}

- (id)addUpdateHandlerForNamespaceName:(id)a3 block:(id)a4
{
  id v6;
  TRIClient *trialClient;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  _PASLock *lock;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  trialClient = self->_trialClient;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__PPTrialWrapper_addUpdateHandlerForNamespaceName_block___block_invoke;
  v16[3] = &unk_1E7E1EF50;
  v9 = v6;
  v17 = v9;
  -[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](trialClient, "addUpdateHandlerForNamespaceName:usingBlock:", a3, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    lock = self->_lock;
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __57__PPTrialWrapper_addUpdateHandlerForNamespaceName_block___block_invoke_2;
    v14[3] = &unk_1E7E1EE88;
    v15 = v10;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v14);

  }
  return v11;
}

- (id)treatmentNameForNamespaceName:(id)a3
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("treatment_name"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = CFSTR("unknown-treatment");
  v6 = v4;

  return v6;
}

- (BOOL)hasFactor:(id)a3 namespaceName:(id)a4
{
  id v6;
  id v7;
  _PASLock *lock;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  PPTrialWrapper *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  lock = self->_lock;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__PPTrialWrapper_hasFactor_namespaceName___block_invoke;
  v12[3] = &unk_1E7E1EF78;
  v9 = v7;
  v13 = v9;
  v10 = v6;
  v14 = v10;
  v15 = self;
  v16 = &v17;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v12);
  LOBYTE(self) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)self;
}

- (id)readableTreatmentsMapping
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
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
  void *v34;
  void *context;
  _QWORD v36[12];

  v36[10] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1C3BD6630](self, a2);
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPTrialWrapper treatmentNameForNamespaceName:](self, "treatmentNameForNamespaceName:", CFSTR("PERSONALIZATION_PORTRAIT_GLOBAL"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Global: %@"), v34);
  v36[0] = v33;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPTrialWrapper treatmentNameForNamespaceName:](self, "treatmentNameForNamespaceName:", CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("Topics: %@"), v32);
  v36[1] = v31;
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPTrialWrapper treatmentNameForNamespaceName:](self, "treatmentNameForNamespaceName:", CFSTR("PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("Named Entities: %@"), v30);
  v36[2] = v29;
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPTrialWrapper treatmentNameForNamespaceName:](self, "treatmentNameForNamespaceName:", CFSTR("PERSONALIZATION_PORTRAIT_LOCATIONS"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("Locations: %@"), v28);
  v36[3] = v27;
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPTrialWrapper treatmentNameForNamespaceName:](self, "treatmentNameForNamespaceName:", CFSTR("PERSONALIZATION_PORTRAIT_CONTACTS"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("Contacts: %@"), v26);
  v36[4] = v25;
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPTrialWrapper treatmentNameForNamespaceName:](self, "treatmentNameForNamespaceName:", CFSTR("PERSONALIZATION_PORTRAIT_EVENTS"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("Events: %@"), v24);
  v36[5] = v9;
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPTrialWrapper treatmentNameForNamespaceName:](self, "treatmentNameForNamespaceName:", CFSTR("PERSONALIZATION_PORTRAIT_CONNECTIONS"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("Connections: %@"), v11);
  v36[6] = v12;
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPTrialWrapper treatmentNameForNamespaceName:](self, "treatmentNameForNamespaceName:", CFSTR("PERSONALIZATION_PORTRAIT_QUICKTYPE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("Quicktype: %@"), v14);
  v36[7] = v15;
  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPTrialWrapper treatmentNameForNamespaceName:](self, "treatmentNameForNamespaceName:", CFSTR("PERSONALIZATION_PORTRAIT_SOCIAL_HIGHLIGHT"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("Social Highlights: %@"), v17);
  v36[8] = v18;
  v19 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPTrialWrapper treatmentNameForNamespaceName:](self, "treatmentNameForNamespaceName:", CFSTR("PERSONALIZATION_PORTRAIT_UNIVERSAL_SEARCH"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("Universal Search: %@"), v20);
  v36[9] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v22;
}

- (void)_updateConcatenatedTreatmentNamesAndHash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  NSObject *v18;
  _PASLock *lock;
  id v20;
  _QWORD v21[4];
  id v22;
  int v23;
  uint8_t buf[16];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = objc_msgSend(&unk_1E7E5BDA0, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(&unk_1E7E5BDA0);
        v8 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1C3BD6630]();
        -[PPTrialWrapper treatmentNameForNamespaceName:](self, "treatmentNameForNamespaceName:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_namespaceNamesIdsDict, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "intValue");

        objc_msgSend(v3, "appendFormat:", CFSTR(",%d:%@"), v12, v10);
        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(&unk_1E7E5BDA0, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }
  v13 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(","));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v13);
  v16 = objc_retainAutorelease(v15);
  if (objc_msgSend(v16, "UTF8String"))
  {
    v17 = _PASMurmur3_x86_32();
  }
  else
  {
    pp_default_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1C392E000, v18, OS_LOG_TYPE_FAULT, "PPTrialWrapper: unable to compute treatment hash", buf, 2u);
    }

    v17 = -1;
  }
  lock = self->_lock;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __58__PPTrialWrapper__updateConcatenatedTreatmentNamesAndHash__block_invoke;
  v21[3] = &unk_1E7E1EFA0;
  v22 = v16;
  v23 = v17;
  v20 = v16;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v21);

}

- (unsigned)treatmentsHash
{
  _PASLock *lock;
  unsigned int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__PPTrialWrapper_treatmentsHash__block_invoke;
  v5[3] = &unk_1E7E1EF28;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)defaultFilepathForFactor:(id)a3 namespaceName:(id)a4
{
  NSDictionary *namespaceNamesIdsDict;
  id v6;
  void *v7;
  void *v8;

  namespaceNamesIdsDict = self->_namespaceNamesIdsDict;
  v6 = a3;
  -[NSDictionary objectForKeyedSubscript:](namespaceNamesIdsDict, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPPaths defaultAssetPathForNamespaceId:factorName:](PPPaths, "defaultAssetPathForNamespaceId:factorName:", objc_msgSend(v7, "intValue"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)lazyPlistForFactorName:(id)a3 namespaceName:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v11;

  -[PPTrialWrapper filepathForFactor:namespaceName:](self, "filepathForFactor:namespaceName:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPTrialWrapper.m"), 402, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configPath.length > 0"));

  }
  objc_msgSend(MEMORY[0x1E0D815D0], "dictionaryWithPath:error:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setUseDefaultFiles:(BOOL)a3
{
  self->_useDefaultFiles = a3;
}

- (void)overrideFilepathForFileFactor:(id)a3 namespaceName:(id)a4 path:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _PASLock *lock;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  pp_default_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_INFO, "Overriden filepath for file factor %@ in namespace %@ to %@", buf, 0x20u);
  }

  lock = self->_lock;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__PPTrialWrapper_overrideFilepathForFileFactor_namespaceName_path___block_invoke;
  v16[3] = &unk_1E7E1EFF0;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v16);
  -[PPTrialWrapper callRegisteredUpdateHandlersForNamespaceName:](self, "callRegisteredUpdateHandlersForNamespaceName:", v15);

}

- (BOOL)hasOverrideForFileFactor:(id)a3 namespaceName:(id)a4
{
  id v6;
  id v7;
  _PASLock *lock;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__21335;
  v22 = __Block_byref_object_dispose__21336;
  v23 = 0;
  lock = self->_lock;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__PPTrialWrapper_hasOverrideForFileFactor_namespaceName___block_invoke;
  v14[3] = &unk_1E7E1F018;
  v17 = &v18;
  v9 = v7;
  v15 = v9;
  v10 = v6;
  v16 = v10;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v14);
  v11 = v16;
  v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v12 != 0;
}

- (void)clearOverrideFilepathForFileFactor:(id)a3 namespaceName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _PASLock *lock;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  pp_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_INFO, "Cleared filepath override for file factor %@ in namespace %@", buf, 0x16u);
  }

  lock = self->_lock;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __67__PPTrialWrapper_clearOverrideFilepathForFileFactor_namespaceName___block_invoke;
  v15 = &unk_1E7E1EE60;
  v16 = v7;
  v17 = v6;
  v10 = v6;
  v11 = v7;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", &v12);
  -[PPTrialWrapper callRegisteredUpdateHandlersForNamespaceName:](self, "callRegisteredUpdateHandlersForNamespaceName:", v11, v12, v13, v14, v15);

}

- (void)callRegisteredUpdateHandlersForNamespaceName:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("com.apple.trial.NamespaceUpdate.%@"), v4);

  v6 = objc_retainAutorelease(v5);
  notify_post((const char *)objc_msgSend(v6, "UTF8String"));

}

- (void)callRegisteredUpdateHandlers
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(&unk_1E7E5BDB8, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(&unk_1E7E5BDB8);
        -[PPTrialWrapper callRegisteredUpdateHandlersForNamespaceName:](self, "callRegisteredUpdateHandlersForNamespaceName:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(&unk_1E7E5BDB8, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (id)trieForFactorName:(id)a3 namespaceName:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PPTrialWrapper filepathForFactor:namespaceName:](self, "filepathForFactor:namespaceName:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  pp_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_INFO, "Loading trie from \"%@\".", (uint8_t *)&v12, 0xCu);
  }

  if (v7)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81548]), "initWithPath:", v7);
  }
  else
  {
    pp_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_error_impl(&dword_1C392E000, v10, OS_LOG_TYPE_ERROR, "Failed to read path for trie %@.", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_namespaceNamesIdsDict, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __67__PPTrialWrapper_clearOverrideFilepathForFileFactor_namespaceName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id *v6;

  v6 = a2;
  objc_msgSend(v6[3], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v6[3], "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(v6[3], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

}

void __57__PPTrialWrapper_hasOverrideForFileFactor_namespaceName___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a2 + 24), "objectForKeyedSubscript:", a1[4]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", a1[5]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __67__PPTrialWrapper_overrideFilepathForFileFactor_namespaceName_path___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id *v7;

  v7 = a2;
  objc_msgSend(v7[3], "objectForKeyedSubscript:", a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v7[3], "setObject:forKeyedSubscript:", v4, a1[4]);

  }
  v5 = a1[6];
  objc_msgSend(v7[3], "objectForKeyedSubscript:", a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, a1[5]);

}

uint64_t __32__PPTrialWrapper_treatmentsHash__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 48);
  return result;
}

void __58__PPTrialWrapper__updateConcatenatedTreatmentNamesAndHash__block_invoke(uint64_t a1, id *a2)
{
  id *v4;

  objc_storeStrong(a2 + 5, *(id *)(a1 + 32));
  v4 = a2;
  *((_DWORD *)v4 + 12) = *(_DWORD *)(a1 + 40);

}

void __42__PPTrialWrapper_hasFactor_namespaceName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;

  v13 = a2;
  objc_msgSend(v13[3], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v13;
  if (!v4)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "defaultFilepathForFactor:namespaceName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "fileExistsAtPath:", v7))
      {

      }
      else
      {
        objc_msgSend(v13[3], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
LABEL_10:
          v5 = v13;
          goto LABEL_11;
        }
      }
    }
    if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 24)
      || (objc_msgSend(v13[3], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "levelForFactor:withNamespaceName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v12 != 0;

    }
    goto LABEL_10;
  }
LABEL_11:

}

uint64_t __57__PPTrialWrapper_addUpdateHandlerForNamespaceName_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__PPTrialWrapper_addUpdateHandlerForNamespaceName_block___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 16), "addObject:", *(_QWORD *)(a1 + 32));
}

uint64_t __46__PPTrialWrapper_removeUpdateHandlerForToken___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 16), "removeObject:", *(_QWORD *)(a1 + 32));
}

void __54__PPTrialWrapper_lastTreatmentUpdateForNamespaceName___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v8 = (id)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("trial_update_%@"), *(_QWORD *)(a1 + 32));
  +[PPSQLKVStore numberForKey:transaction:](PPSQLKVStore, "numberForKey:transaction:", v8, v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __75__PPTrialWrapper__addDefaultUpdateHandlersForAllNamespacesWithGuardedData___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  uint8_t buf[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    pp_default_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEFAULT, "PPTrialWrapper: invoking refresh", buf, 2u);
    }

    v4 = objc_opt_new();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

    objc_msgSend(WeakRetained[5], "refresh");
    objc_msgSend(WeakRetained, "_updateConcatenatedTreatmentNamesAndHash");
    v7 = WeakRetained[4];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __75__PPTrialWrapper__addDefaultUpdateHandlersForAllNamespacesWithGuardedData___block_invoke_62;
    v8[3] = &unk_1E7E1EEB0;
    v8[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "writeTransactionWithClient:block:", 6, v8);
  }

}

void __75__PPTrialWrapper__addDefaultUpdateHandlersForAllNamespacesWithGuardedData___block_invoke_62(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v3, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("trial_update_%@"), *(_QWORD *)(a1 + 32));
  +[PPSQLKVStore setNumber:forKey:transaction:](PPSQLKVStore, "setNumber:forKey:transaction:", v5, v6, v4);

}

void __25__PPTrialWrapper_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(a2 + 16);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeUpdateHandlerForToken:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __56__PPTrialWrapper_initWithSettings_database_trialClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_opt_new();
  v5 = (void *)*((_QWORD *)v3 + 2);
  *((_QWORD *)v3 + 2) = v4;

  objc_msgSend(*(id *)(a1 + 32), "trialPathOverrides");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_new();
  v8 = (void *)*((_QWORD *)v3 + 3);
  *((_QWORD *)v3 + 3) = v7;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "mutableCopy");
        objc_msgSend(*((id *)v3 + 3), "setObject:forKeyedSubscript:", v16, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v11);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = objc_msgSend(&unk_1E7E5BD88, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(&unk_1E7E5BD88);
        objc_msgSend(*(id *)(a1 + 40), "lastTreatmentUpdateForNamespaceName:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (!v19 || objc_msgSend(v22, "compare:", v19) == 1)
        {
          v24 = v23;

          v19 = v24;
        }

      }
      v18 = objc_msgSend(&unk_1E7E5BD88, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }
  v25 = (void *)*((_QWORD *)v3 + 4);
  *((_QWORD *)v3 + 4) = v19;
  v26 = v19;

  objc_msgSend(*(id *)(a1 + 40), "_addDefaultUpdateHandlersForAllNamespacesWithGuardedData:", v3);
}

+ (id)sharedTrialClient
{
  uint64_t v2;
  void *v3;
  id v4;

  pthread_mutex_lock(&sharedTrialClient_lock);
  if (!sharedTrialClient_client)
  {
    objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 100);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)sharedTrialClient_client;
    sharedTrialClient_client = v2;

    objc_msgSend((id)sharedTrialClient_client, "refresh");
  }
  v4 = (id)sharedTrialClient_client;
  pthread_mutex_unlock(&sharedTrialClient_lock);
  return v4;
}

@end
