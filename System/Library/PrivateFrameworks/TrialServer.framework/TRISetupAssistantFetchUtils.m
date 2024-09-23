@implementation TRISetupAssistantFetchUtils

+ (BOOL)stopSetupAssistantFetchWithServerContext:(id)a3 namespaceNames:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v9);
  }
  else
  {
    objc_msgSend(v8, "paths");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "getNamespaceNamesWithFetchDuringSetupAssistantEnabledWithTRIPaths:", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11 || !objc_msgSend(v11, "count"))
    {
      TRILogCategory_Server();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "setup-assistant-fetch is not needed, no descriptors found with enableFetchDuringSetupAssistant flag enabled", (uint8_t *)&v24, 2u);
      }
      goto LABEL_22;
    }
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v11);

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v10);
  if ((objc_msgSend(a1, "removeNamespaceNamesWithRolloutForServerContext:namespaceNames:", v8, v11) & 1) == 0)
  {
    TRILogCategory_Server();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "The rollout database query failed.", (uint8_t *)&v24, 2u);
    }

    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v28 = *MEMORY[0x1E0CB2D50];
    v29[0] = CFSTR("Unable to retrieve records for active rollouts");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v17);

    if (a5)
      *a5 = objc_retainAutorelease(v18);

    goto LABEL_13;
  }
  if (!objc_msgSend(v11, "count"))
  {
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject allObjects](v10, "allObjects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v22;
      _os_log_impl(&dword_1D207F000, v21, OS_LOG_TYPE_DEFAULT, "setup-assistant-fetch is not needed, ncv-compatible rollout v2 are present for namespaces names: %{public}@", (uint8_t *)&v24, 0xCu);

    }
LABEL_22:
    v19 = 1;
    goto LABEL_23;
  }
  -[NSObject minusSet:](v10, "minusSet:", v11);
  TRILogCategory_Server();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject allObjects](v10, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412546;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "setup-assistant-fetch is needed, ncv-compatible rollout v2 are not present for namespace names: %@ and are present for namespace names: {public}%@", (uint8_t *)&v24, 0x16u);

  }
LABEL_13:
  v19 = 0;
LABEL_23:

  return v19;
}

+ (id)getNamespaceNamesWithFetchDuringSetupAssistantEnabledWithTRIPaths:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0DC0AD8];
  objc_msgSend(a3, "namespaceDescriptorsDefaultDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptorsForDirectory:filterBlock:", v4, &__block_literal_global_19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __97__TRISetupAssistantFetchUtils_getNamespaceNamesWithFetchDuringSetupAssistantEnabledWithTRIPaths___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enableFetchDuringSetupAssistant");
}

uint64_t __97__TRISetupAssistantFetchUtils_getNamespaceNamesWithFetchDuringSetupAssistantEnabledWithTRIPaths___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "namespaceName");
}

+ (BOOL)removeNamespaceNamesWithRolloutForServerContext:(id)a3 namespaceNames:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "namespaceDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "namespaceDescriptorsDefaultDir");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:](TRINamespaceDescriptorProvider, "providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "rolloutDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __94__TRISetupAssistantFetchUtils_removeNamespaceNamesWithRolloutForServerContext_namespaceNames___block_invoke;
  v16[3] = &unk_1E9333E68;
  v18 = v6;
  v19 = a1;
  v17 = v11;
  v13 = v6;
  v14 = v11;
  LOBYTE(v11) = objc_msgSend(v12, "enumerateActiveRecordsWithVisibility:usingTransaction:block:", 1, 0, v16);

  return (char)v11;
}

void __94__TRISetupAssistantFetchUtils_removeNamespaceNamesWithRolloutForServerContext_namespaceNames___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "artifact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rollout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "getIncompatibleNamespaceNamesForTriClientRollout:namespaceDescriptorProvider:", v5, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "namespaces", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v12)
          && (objc_msgSend(v6, "containsObject:", v12) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "removeObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

+ (id)getIncompatibleNamespaceNamesForTriClientRollout:(id)a3 namespaceDescriptorProvider:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  char v26;
  id obj;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _BYTE *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE buf[28];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v24 = (id)objc_opt_new();
  v25 = v5;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v5, "selectedNamespaceArray");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v7)
  {
    v26 = 0;
    v8 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1D8232A5C]();
        objc_msgSend(v10, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "descriptorWithNamespaceName:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          buf[24] = 0;
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "compatibilityVersionArray_Count"));
          objc_msgSend(v10, "compatibilityVersionArray");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __108__TRISetupAssistantFetchUtils_getIncompatibleNamespaceNamesForTriClientRollout_namespaceDescriptorProvider___block_invoke;
          v30[3] = &unk_1E9333E90;
          v31 = v13;
          v33 = buf;
          v16 = v14;
          v32 = v16;
          objc_msgSend(v15, "enumerateValuesWithBlock:", v30);

          if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
          {
            v26 = 1;
          }
          else
          {
            objc_msgSend(v10, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v21);

          }
          _Block_object_dispose(buf, 8);
        }
        else
        {
          TRILogCategory_Server();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v25, "rolloutId");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v25, "deploymentId");
            objc_msgSend(v10, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v18;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v19;
            *(_WORD *)&buf[18] = 2114;
            *(_QWORD *)&buf[20] = v20;
            _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "Note: Rollout %{public}@.%u involves namespace %{public}@ but it is not registered with Trial. Factor packs for this namespace shall not be downloaded.", buf, 0x1Cu);

          }
        }

        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v7);
  }
  else
  {
    v26 = 0;
  }

  if (!((objc_msgSend(v24, "count") != 0) | v26 & 1))
  {
    objc_msgSend(v25, "selectedNamespaceArray");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __108__TRISetupAssistantFetchUtils_getIncompatibleNamespaceNamesForTriClientRollout_namespaceDescriptorProvider___block_invoke_2;
    v28[3] = &unk_1E9333EB8;
    v29 = v24;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v28);

  }
  return v24;
}

void __108__TRISetupAssistantFetchUtils_getIncompatibleNamespaceNamesForTriClientRollout_namespaceDescriptorProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "downloadNCV") == (_DWORD)a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v4 = *(void **)(a1 + 40);
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%u"), a2);
  objc_msgSend(v4, "addObject:", v5);

}

void __108__TRISetupAssistantFetchUtils_getIncompatibleNamespaceNamesForTriClientRollout_namespaceDescriptorProvider___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (BOOL)setValueInKeyValueStore:(id)a3 key:(id)a4 value:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v18;
  id v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRISetupAssistantFetchUtils.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value != nil"));

  }
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v19;
  v16 = v15;
  if (v14)
  {
    objc_msgSend(v11, "setBlob:forKey:usingTransaction:", v14, v12, 0);
  }
  else if (a6)
  {
    *a6 = objc_retainAutorelease(v15);
  }

  return v14 != 0;
}

+ (id)getValueInKeyValueStore:(id)a3 key:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v12;

  objc_msgSend(a3, "blobForKey:usingTransaction:", a4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    v9 = v8;
    if (v7)
    {
      v10 = v7;
    }
    else if (a5)
    {
      *a5 = objc_retainAutorelease(v8);
    }

  }
  else
  {
    v7 = 0;
    if (a5)
      *a5 = 0;
  }

  return v7;
}

+ (id)registerFinalizeBlockForDownloadLatencyTelemetryWithServerContext:(id)a3
{
  id v3;
  TRILatencyMetricTelemetryValidator *v4;
  void *v5;
  void *v6;
  TRILatencyMetricTelemetryValidator *v7;
  TRIDownloadLatencyTaskResultTelemetryBuilder *v8;
  TRIDownloadLatencyTaskResultTelemetryBuilder *v9;
  void *v10;
  void *v11;
  TRIDownloadLatencyTaskResultTelemetryBuilder *v12;
  _QWORD v14[4];
  TRIDownloadLatencyTaskResultTelemetryBuilder *v15;

  v3 = a3;
  v4 = [TRILatencyMetricTelemetryValidator alloc];
  objc_msgSend(v3, "rolloutDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TRILatencyMetricTelemetryValidator initWithRolloutDatabase:paths:](v4, "initWithRolloutDatabase:paths:", v5, v6);

  v8 = -[TRIDownloadLatencyTaskResultTelemetryBuilder initWithTelemetryValidator:]([TRIDownloadLatencyTaskResultTelemetryBuilder alloc], "initWithTelemetryValidator:", v7);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__TRISetupAssistantFetchUtils_registerFinalizeBlockForDownloadLatencyTelemetryWithServerContext___block_invoke;
  v14[3] = &unk_1E9333EE0;
  v9 = v8;
  v15 = v9;
  v10 = (void *)MEMORY[0x1D8232C48](v14);
  objc_msgSend(v3, "taskQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "registerFinalizeBlock:", v10);
  v12 = v9;

  return v12;
}

void __97__TRISetupAssistantFetchUtils_registerFinalizeBlockForDownloadLatencyTelemetryWithServerContext___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(*(id *)(a1 + 32), "updateWithTask:runResult:", v11, v8);
  objc_autoreleasePoolPop(v10);

}

@end
