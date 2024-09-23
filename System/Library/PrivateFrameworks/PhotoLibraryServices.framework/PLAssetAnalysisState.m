@implementation PLAssetAnalysisState

+ (id)entityName
{
  return CFSTR("AssetAnalysisState");
}

- (id)debugLogDescription
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  -[PLAssetAnalysisState ignoreUntilDate](self, "ignoreUntilDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLAssetAnalysisState workerType](self, "workerType");
  v8 = CFSTR("unknown");
  if (!v7)
    v8 = CFSTR("graph");
  if (v7 == 4)
    v8 = CFSTR("face");
  v9 = v8;
  PLShortDescriptionForAnalysisState(-[PLAssetAnalysisState analysisState](self, "analysisState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetAnalysisState lastIgnoredDate](self, "lastIgnoredDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p> - type: %@, state: %@, last-ignored: %@, ignore-until: %@"), v6, self, v9, v10, v11, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "timeIntervalSinceNow");
    objc_msgSend(v12, "appendFormat:", CFSTR(" (%.2f seconds from now)"), v13);
  }

  return v12;
}

- (id)mutableKeyPathDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetAnalysisState assetUUID](self, "assetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLAssetAnalysisState assetUUID](self, "assetUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("assetUUID"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PLAssetAnalysisState workerType](self, "workerType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("workerType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLAssetAnalysisState analysisState](self, "analysisState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("analysisState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLAssetAnalysisState workerFlags](self, "workerFlags"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("workerFlags"));

  -[PLAssetAnalysisState ignoreUntilDate](self, "ignoreUntilDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PLAssetAnalysisState ignoreUntilDate](self, "ignoreUntilDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("ignoreUntilDate"));

  }
  -[PLAssetAnalysisState lastIgnoredDate](self, "lastIgnoredDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PLAssetAnalysisState lastIgnoredDate](self, "lastIgnoredDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("lastIgnoredDate"));

  }
  return v3;
}

- (void)unionWorkerFlags:(int)a3
{
  -[PLAssetAnalysisState setWorkerFlags:](self, "setWorkerFlags:", -[PLAssetAnalysisState workerFlags](self, "workerFlags") | a3);
}

+ (id)_batchOperationQueue
{
  if (_batchOperationQueue_onceToken != -1)
    dispatch_once(&_batchOperationQueue_onceToken, &__block_literal_global_2425);
  return (id)_batchOperationQueue_queue;
}

+ (id)_countOfAnalysisStatesByWorkerTypeWithPredicate:(id)a3 analysisState:(int)a4 forDeletedAssets:(BOOL)a5 inContext:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAssetAnalysisState.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  +[PLAssetAnalysisState entityName](PLAssetAnalysisState, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  PLSafeEntityForNameInManagedObjectContext((uint64_t)v13, (uint64_t)v12, &v55);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v55;
  v16 = v15;
  if (v14)
  {
    v48 = v15;
    objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v13);
    v49 = a7;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("analysisState"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB35D0];
    v52 = (void *)v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "expressionForFunction:arguments:", CFSTR("count:"), v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v22, "setName:", CFSTR("count"));
    v51 = (void *)v21;
    objc_msgSend(v22, "setExpression:", v21);
    objc_msgSend(v22, "setExpressionResultType:", 200);
    objc_msgSend(v14, "attributesByName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("workerType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v24, v22, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPropertiesToFetch:", v25);

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPropertiesToGroupBy:", v26);

    objc_msgSend(v17, "setResultType:", 2);
    objc_msgSend(v17, "setPredicate:", v11);
    v53 = v17;
    v54 = 0;
    objc_msgSend(v12, "executeFetchRequest:error:", v17, &v54);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v54;
    if (v49 && v28)
    {
      v29 = v28;
      v30 = 0;
      *v49 = objc_retainAutorelease(v28);
      v16 = v48;
    }
    else
    {
      v42 = v28;
      v43 = v27;
      v44 = v24;
      v45 = v14;
      v46 = v13;
      v47 = v12;
      v50 = v11;
      v31 = v27;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v32 = v31;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v57 != v35)
              objc_enumerationMutation(v32);
            v37 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("count"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("workerType"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v38, v39);

          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
        }
        while (v34);
      }

      v16 = v48;
      v11 = v50;
      v13 = v46;
      v12 = v47;
      v24 = v44;
      v14 = v45;
      v29 = v42;
      v27 = v43;
    }

  }
  else
  {
    v30 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v15);
  }

  return v30;
}

+ (unint64_t)_countOfAssetsAllowedForProcessingInLibrary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C97B48];
    +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("allowedForAnalysis = YES"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPredicate:", v9);

    objc_msgSend(v5, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v11 = objc_msgSend(v10, "countForFetchRequest:error:", v8, &v17);
    v12 = v17;
    v13 = v12;
    if (a4 && v12)
      *a4 = objc_retainAutorelease(v12);

  }
  else
  {
    if (!a4)
    {
      v11 = 0;
      goto LABEL_9;
    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D74498];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("_countOfAssetsAllowedForProcessingInLibrary: null");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 41012, v8);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
  return v11;
}

+ (BOOL)_bulkUpdateAnalysisStatesTo:(int)a3 predicate:(id)a4 library:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  int v16;
  BOOL v17;
  void *v19;
  _QWORD block[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  id *v25;
  int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v11 = a4;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAssetAnalysisState.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate"));

  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__2352;
  v31 = __Block_byref_object_dispose__2353;
  v32 = 0;
  objc_msgSend(a1, "_batchOperationQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PLAssetAnalysisState__bulkUpdateAnalysisStatesTo_predicate_library_error___block_invoke;
  block[3] = &unk_1E36605F0;
  v14 = v12;
  v21 = v14;
  v15 = v11;
  v26 = a3;
  v22 = v15;
  v23 = &v33;
  v24 = &v27;
  v25 = a6;
  dispatch_sync(v13, block);

  v16 = *((unsigned __int8 *)v34 + 24);
  if (a6 && !*((_BYTE *)v34 + 24))
  {
    *a6 = objc_retainAutorelease((id)v28[5]);
    v16 = *((unsigned __int8 *)v34 + 24);
  }
  v17 = v16 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

+ (id)_managedObjectContextForStateChangesWithPersistentStoreCoordinator:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0C97B88];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithConcurrencyType:", 1);
  objc_msgSend(v5, "setPersistentStoreCoordinator:", v4);

  objc_msgSend(v5, "setName:", CFSTR("com.apple.assetAnalysisState.managedObjectContext"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97BA8]), "initWithMergeType:", 0);
  objc_msgSend(v5, "setMergePolicy:", v6);

  return v5;
}

+ (id)_managedObjectContextForStateChangesWithLibraryURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lookupOrCreateBundleForLibraryURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "persistentContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharedPersistentStoreCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_managedObjectContextForStateChangesWithPersistentStoreCoordinator:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_subArrayOfChanges:(id)a3 toRetryWithConflicts:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  BOOL v26;
  id v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v12, "sourceObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v12, "sourceObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v15, "workerType"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v16);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v29 = v5;
  v17 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v29);
        v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("analysisState"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "integerValue");

        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("workerType"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v7, "containsObject:", v24);

        if (v25)
          v26 = v23 >= 0;
        else
          v26 = 0;
        if (!v26)
          objc_msgSend(v28, "addObject:", v21);
      }
      v18 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v18);
  }

  return v28;
}

+ (id)_sanitizeChanges:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(v10, "mutableCopy", (_QWORD)v17);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("analysisState"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "integerValue");

        if (v13 == 20)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("lastIgnoredDate"));

          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("ignoreUntilDate"));

          objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E375D350, CFSTR("workerFlags"));
        }
        objc_msgSend(v4, "addObject:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)keyPathDictionaryWithWorkerType:(signed __int16)a3 workerFlags:(int)a4 analysisState:(int)a5 lastIgnoredDate:(id)a6 ignoreUntilDate:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = *(_QWORD *)&a5;
  v9 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a6;
  v12 = a7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("workerType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("analysisState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("workerFlags"));

  if (v12)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("ignoreUntilDate"));
  if (v11)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("lastIgnoredDate"));

  return v13;
}

+ (id)workerTypesPersistingAnalysisState
{
  return &unk_1E37631E8;
}

+ (BOOL)isUnitTestWorker:(signed __int16)a3
{
  return a3 == -1000;
}

+ (void)requestAnalysisCountsInLibrary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__PLAssetAnalysisState_requestAnalysisCountsInLibrary_completion___block_invoke;
    v13[3] = &unk_1E3674C40;
    v14 = v6;
    v16 = a1;
    v15 = v8;
    objc_msgSend(v14, "performBlock:withPriority:", v13, 0);

    v9 = v14;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D74498];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("requestAnalysisCountsInLibrary: null");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 41012, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v12);

    goto LABEL_5;
  }
LABEL_6:

}

+ (id)assetUUIDsFromAssetObjectIDs:(id)a3 library:(id)a4 whereAllWorkerTypes:(id)a5 matchState:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t *v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    *(_QWORD *)buf = 0;
    v23 = buf;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__2352;
    v26 = __Block_byref_object_dispose__2353;
    v27 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __92__PLAssetAnalysisState_assetUUIDsFromAssetObjectIDs_library_whereAllWorkerTypes_matchState___block_invoke;
    v16[3] = &unk_1E3677970;
    v17 = v10;
    v18 = v12;
    v19 = v9;
    v20 = v11;
    v21 = buf;
    objc_msgSend(v17, "performBlockAndWait:", v16);
    v13 = *((id *)v23 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    PLAssetAnalysisGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "assetUUIDsFromAssetObjectIDs: library is null", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)analysisCountsForWorkerType:(signed __int16)a3 library:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  uint8_t *v13;
  id v14;
  signed __int16 v15;
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    *(_QWORD *)buf = 0;
    v17 = buf;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__2352;
    v20 = __Block_byref_object_dispose__2353;
    v21 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PLAssetAnalysisState_analysisCountsForWorkerType_library___block_invoke;
    v11[3] = &unk_1E366A810;
    v13 = buf;
    v14 = a1;
    v15 = a3;
    v12 = v6;
    objc_msgSend(v12, "performBlockAndWait:", v11);
    v8 = *((id *)v17 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    PLAssetAnalysisGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "analysisCountsForWorkerType: library is null", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

+ (void)requestCountOfAnalysisRecordsForDeletedAssetsInLibrary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __90__PLAssetAnalysisState_requestCountOfAnalysisRecordsForDeletedAssetsInLibrary_completion___block_invoke;
    v13[3] = &unk_1E3674C40;
    v14 = v6;
    v16 = a1;
    v15 = v8;
    objc_msgSend(v14, "performBlock:withPriority:", v13, 0);

    v9 = v14;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D74498];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("requestCountOfAnalysisRecordsForDeletedAssetsInLibrary: null");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 41012, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v12);

    goto LABEL_5;
  }
LABEL_6:

}

+ (id)deletedAssetUUIDsForAnalysisByWorkerType:(signed __int16)a3 fetchLimit:(unint64_t)a4 inLibrary:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  __CFString *v16;
  uint64_t *v17;
  uint64_t *v18;
  unint64_t v19;
  signed __int16 v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v9 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__2352;
  v31 = __Block_byref_object_dispose__2353;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2352;
  v25 = __Block_byref_object_dispose__2353;
  v26 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __92__PLAssetAnalysisState_deletedAssetUUIDsForAnalysisByWorkerType_fetchLimit_inLibrary_error___block_invoke;
  v14[3] = &unk_1E3660640;
  v10 = v9;
  v15 = v10;
  v16 = CFSTR("assetUUID");
  v18 = &v27;
  v19 = a4;
  v20 = a3;
  v17 = &v21;
  objc_msgSend(v10, "performBlockAndWait:completionHandler:", v14, 0);
  if (a6)
  {
    v11 = (void *)v22[5];
    if (v11)
      *a6 = objc_retainAutorelease(v11);
  }
  v12 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v12;
}

+ (BOOL)resetPendingStatesInLibraryAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  BOOL v12;
  _QWORD v14[4];
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("analysisState = %d"), 10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2352;
  v26 = __Block_byref_object_dispose__2353;
  v27 = 0;
  objc_msgSend(a1, "_managedObjectContextForStateChangesWithLibraryURL:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[2] = __63__PLAssetAnalysisState_resetPendingStatesInLibraryAtURL_error___block_invoke;
  v14[3] = &unk_1E3660668;
  v14[1] = 3221225472;
  v15 = CFSTR("lastIgnoredDate");
  v16 = CFSTR("ignoreUntilDate");
  v17 = CFSTR("analysisState");
  v9 = v7;
  v18 = v9;
  v10 = v8;
  v19 = v10;
  v20 = &v22;
  v21 = &v28;
  objc_msgSend(v10, "performBlockAndWait:", v14);
  v11 = *((unsigned __int8 *)v29 + 24);
  if (a4 && !*((_BYTE *)v29 + 24))
  {
    *a4 = objc_retainAutorelease((id)v23[5]);
    v11 = *((unsigned __int8 *)v29 + 24);
  }
  v12 = v11 != 0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

+ (BOOL)markStatesProcessedForWorkerType:(signed __int16)a3 library:(id)a4 error:(id *)a5
{
  int v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = a4;
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("workerType = %d"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend((id)objc_opt_class(), "_bulkUpdateAnalysisStatesTo:predicate:library:error:", 20, v9, v8, a5);

  return (char)a5;
}

+ (BOOL)cleanupInvalidIgnoreUntilDatesInLibraryAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  BOOL v21;
  uint8_t buf[16];
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  id *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  const __CFString *v43;
  const __CFString *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2352;
  v36 = __Block_byref_object_dispose__2353;
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 604800.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ignoreUntilDate > %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0C97AB0]);
  +[PLAssetAnalysisState entityName](PLAssetAnalysisState, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithEntityName:", v10);

  objc_msgSend(v11, "setPredicate:", v8);
  v44 = CFSTR("ignoreUntilDate");
  v45[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPropertiesToUpdate:", v12);

  objc_msgSend(v11, "setResultType:", 2);
  if (v6)
  {
    objc_msgSend(a1, "_managedObjectContextForStateChangesWithLibraryURL:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_batchOperationQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__PLAssetAnalysisState_cleanupInvalidIgnoreUntilDatesInLibraryAtURL_error___block_invoke;
    block[3] = &unk_1E3660690;
    v25 = v13;
    v29 = &v38;
    v26 = v11;
    v30 = &v32;
    v31 = a4;
    v27 = v8;
    v28 = v7;
    v15 = v13;
    dispatch_sync(v14, block);

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0CB2D68];
    v43 = CFSTR("libraryURL is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41008, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v33[5];
    v33[5] = v18;

    PLAssetAnalysisGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Unable to cleanup invalid ignoreUntilDates because libraryURL is nil", buf, 2u);
    }
  }

  v20 = *((unsigned __int8 *)v39 + 24);
  if (a4 && !*((_BYTE *)v39 + 24))
  {
    *a4 = objc_retainAutorelease((id)v33[5]);
    v20 = *((unsigned __int8 *)v39 + 24);
  }
  v21 = v20 != 0;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v21;
}

+ (BOOL)clearIgnoreUntilDatesInLibraryAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  int v12;
  BOOL v13;
  _QWORD block[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  id *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2352;
  v25 = __Block_byref_object_dispose__2353;
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ignoreUntilDate != nil or lastIgnoredDate != nil"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_managedObjectContextForStateChangesWithLibraryURL:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_batchOperationQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PLAssetAnalysisState_clearIgnoreUntilDatesInLibraryAtURL_error___block_invoke;
  block[3] = &unk_1E366C010;
  v10 = v8;
  v16 = v10;
  v11 = v7;
  v17 = v11;
  v18 = &v27;
  v19 = &v21;
  v20 = a4;
  dispatch_sync(v9, block);

  v12 = *((unsigned __int8 *)v28 + 24);
  if (a4 && !*((_BYTE *)v28 + 24))
  {
    *a4 = objc_retainAutorelease((id)v22[5]);
    v12 = *((unsigned __int8 *)v28 + 24);
  }
  v13 = v12 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

+ (BOOL)resetFaceCropAnalysisStateInLibraryAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  int v10;
  BOOL v11;
  _QWORD block[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2352;
  v21 = __Block_byref_object_dispose__2353;
  v22 = 0;
  objc_msgSend(a1, "_managedObjectContextForStateChangesWithLibraryURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_batchOperationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PLAssetAnalysisState_resetFaceCropAnalysisStateInLibraryAtURL_error___block_invoke;
  block[3] = &unk_1E3677830;
  v14 = v7;
  v15 = &v23;
  v16 = &v17;
  v9 = v7;
  dispatch_sync(v8, block);

  v10 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((_BYTE *)v24 + 24))
  {
    *a4 = objc_retainAutorelease((id)v18[5]);
    v10 = *((unsigned __int8 *)v24 + 24);
  }
  v11 = v10 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

+ (void)_removeAnalysisRecordsWithPredicate:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_batchOperationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PLAssetAnalysisState__removeAnalysisRecordsWithPredicate_library___block_invoke;
  block[3] = &unk_1E3677C18;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, block);

}

+ (void)removeAnalysisRecordsForDeletedAssetUUIDs:(id)a3 forWorkerType:(signed __int16)a4 library:(id)a5
{
  int v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v14 = a3;
  v9 = a5;
  v10 = v14;
  v11 = v9;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAssetAnalysisState.m"), 796, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetUUIDs"));

    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("workerType = %d AND asset = NULL AND (assetUUID IN %@)"), v6, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_removeAnalysisRecordsWithPredicate:library:", v12, v11);

}

+ (void)removeAnalysisRecordsWithNoAssetOrUUIDUseMaintenanceMode:(BOOL)a3 library:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD block[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_msgSend(a1, "_batchOperationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PLAssetAnalysisState_removeAnalysisRecordsWithNoAssetOrUUIDUseMaintenanceMode_library___block_invoke;
  block[3] = &unk_1E3677830;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  v14 = &v19;
  dispatch_sync(v7, block);

  if (*((_BYTE *)v16 + 24) && v4 && (unint64_t)v20[3] > 0xF4240)
  {
    PLAssetAnalysisGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = v20[3];
      *(_DWORD *)buf = 134218240;
      v24 = v10;
      v25 = 2048;
      v26 = 1000000;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Too many orphaned asset analysis state records (%ld > %ld)", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

}

+ (int)defaultWorkerFlagsForWorkerType:(signed __int16)a3
{
  return a3 == 4;
}

void __89__PLAssetAnalysisState_removeAnalysisRecordsWithNoAssetOrUUIDUseMaintenanceMode_library___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  __int128 v6;

  v2 = (void *)MEMORY[0x19AEC1554]();
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __89__PLAssetAnalysisState_removeAnalysisRecordsWithNoAssetOrUUIDUseMaintenanceMode_library___block_invoke_2;
  v4[3] = &unk_1E3677830;
  v5 = v3;
  v6 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v5, "performBlockAndWait:", v4);

  objc_autoreleasePoolPop(v2);
}

void __89__PLAssetAnalysisState_removeAnalysisRecordsWithNoAssetOrUUIDUseMaintenanceMode_library___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  const char *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint8_t buf[4];
  _DWORD v26[7];

  *(_QWORD *)&v26[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C97B48]);
  +[PLAssetAnalysisState entityName](PLAssetAnalysisState, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithEntityName:", v4);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("assetUUID == NULL OR asset == NULL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);
  objc_msgSend(v5, "setFetchLimit:", 10000);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v5);
  objc_msgSend(v7, "setResultType:", 2);
  objc_msgSend(v7, "setShouldPerformSecureOperation:", 1);
  v24 = 0;
  objc_msgSend(v2, "executeRequest:error:", v7, &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;
  if (v8)
  {
    objc_msgSend(v8, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    if (v11 < 1)
    {
      PLAssetAnalysisGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "No analysis states deleted", buf, 2u);
      }

    }
    else
    {
      if ((unint64_t)v11 >> 4 < 0x271)
      {
        v12 = CFSTR("done");
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        v12 = CFSTR("deleted full batch");
      }
      PLAssetAnalysisGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        v26[0] = v11;
        LOWORD(v26[1]) = 2114;
        *(_QWORD *)((char *)&v26[1] + 2) = v12;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "deleted %d analysis states, %{public}@", buf, 0x12u);
      }

    }
  }
  else
  {
    PLAssetAnalysisGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v26 = v9;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "error deleting orphaned states: %@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(v5, "setFetchLimit:", 0);
    v23 = v9;
    v16 = objc_msgSend(v2, "countForFetchRequest:error:", v5, &v23);
    v17 = v23;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v16;
    v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    PLAssetAnalysisGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v20)
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v26 = v17;
        v21 = "Failed to fetch count of orphaned analysis state records %@";
LABEL_22:
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
      }
    }
    else if (v20)
    {
      v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v26 = v22;
      v21 = "Found %tu orphaned analysis state records";
      goto LABEL_22;
    }

    goto LABEL_24;
  }
  v17 = v9;
LABEL_24:

}

void __68__PLAssetAnalysisState__removeAnalysisRecordsWithPredicate_library___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__PLAssetAnalysisState__removeAnalysisRecordsWithPredicate_library___block_invoke_2;
  v3[3] = &unk_1E3677C18;
  v4 = v2;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v4, "performBlockAndWait:", v3);

}

void __68__PLAssetAnalysisState__removeAnalysisRecordsWithPredicate_library___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C97B48]);
  +[PLAssetAnalysisState entityName](PLAssetAnalysisState, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithEntityName:", v4);

  objc_msgSend(v5, "setPredicate:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v5);
  v14 = 0;
  objc_msgSend(v2, "executeRequest:error:", v6, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  PLAssetAnalysisGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      v11 = "error deleting orphaned states: %@";
      v12 = v10;
      v13 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_199541000, v12, v13, v11, buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    v11 = "deleted orphaned states: %@";
    v12 = v10;
    v13 = OS_LOG_TYPE_DEBUG;
    goto LABEL_6;
  }

}

void __71__PLAssetAnalysisState_resetFaceCropAnalysisStateInLibraryAtURL_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  uint64_t v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97AB0];
  +[PLFaceCrop entityName](PLFaceCrop, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "batchUpdateRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = CFSTR("state");
  v18[0] = &unk_1E375D380;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToUpdate:", v5);
  v6 = (void *)a1[4];
  v12 = 0;
  objc_msgSend(v6, "executeRequest:error:", v4, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (!v7)
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    PLAssetAnalysisGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
        v10 = CFSTR("success");
      else
        v10 = CFSTR("failure");
      v11 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Reset of face crop analysis state resulted in %{public}@. (error: %@)", buf, 0x16u);
    }

  }
}

void __66__PLAssetAnalysisState_clearIgnoreUntilDatesInLibraryAtURL_error___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  __int128 v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__PLAssetAnalysisState_clearIgnoreUntilDatesInLibraryAtURL_error___block_invoke_2;
  v3[3] = &unk_1E366C010;
  v4 = v2;
  v5 = *(id *)(a1 + 40);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v4, "performBlockAndWait:", v3);

}

void __66__PLAssetAnalysisState_clearIgnoreUntilDatesInLibraryAtURL_error___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  uint64_t v15;
  id obj;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "refreshAllObjects");
  v2 = objc_alloc(MEMORY[0x1E0C97AB0]);
  +[PLAssetAnalysisState entityName](PLAssetAnalysisState, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithEntityName:", v3);

  objc_msgSend(v4, "setPredicate:", *(_QWORD *)(a1 + 40));
  v21[0] = CFSTR("ignoreUntilDate");
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = CFSTR("lastIgnoredDate");
  v22[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToUpdate:", v7);

  objc_msgSend(v4, "setResultType:", 2);
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v9 + 40);
  LOBYTE(v6) = objc_msgSend(v8, "pl_executeBatchUpdateRequest:withBatchSize:error:", v4, 1000, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_BYTE)v6;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && *(_QWORD *)(a1 + 64))
  {
    +[PLManagedObjectContext sanitizedErrorFromError:](PLManagedObjectContext, "sanitizedErrorFromError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  PLAssetAnalysisGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v14 = CFSTR("success");
    else
      v14 = CFSTR("failure");
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v18 = v14;
    v19 = 2112;
    v20 = v15;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "Bulk clear of ignore-until resulted in %{public}@. (error: %@)", buf, 0x16u);
  }

}

void __75__PLAssetAnalysisState_cleanupInvalidIgnoreUntilDatesInLibraryAtURL_error___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__PLAssetAnalysisState_cleanupInvalidIgnoreUntilDatesInLibraryAtURL_error___block_invoke_2;
  v3[3] = &unk_1E3660690;
  v8 = *(_QWORD *)(a1 + 64);
  v4 = v2;
  v5 = *(id *)(a1 + 40);
  v9 = *(_OWORD *)(a1 + 72);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "performBlockAndWait:", v3);

}

void __75__PLAssetAnalysisState_cleanupInvalidIgnoreUntilDatesInLibraryAtURL_error___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  id obj;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[9] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "pl_executeBatchUpdateRequest:withBatchSize:error:", v3, 1000, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v5;
  if (!*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) && a1[10])
  {
    +[PLManagedObjectContext sanitizedErrorFromError:](PLManagedObjectContext, "sanitizedErrorFromError:", *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[9] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  PLAssetAnalysisGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = a1[6];
    v11 = a1[7];
    if (*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
      v12 = CFSTR("success");
    else
      v12 = CFSTR("failure");
    v13 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40);
    *(_DWORD *)buf = 138544130;
    v16 = v10;
    v17 = 2114;
    v18 = v11;
    v19 = 2114;
    v20 = v12;
    v21 = 2114;
    v22 = v13;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Cleanup invalid ignore dates analysis states matching: %{public}@ to value: %{public}@ resulted in %{public}@. (error: %{public}@)", buf, 0x2Au);
  }

}

void __63__PLAssetAnalysisState_resetPendingStatesInLibraryAtURL_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id obj;
  _BYTE v36[128];
  __int128 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLAssetAnalysisState entityName](PLAssetAnalysisState, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = *(_OWORD *)(a1 + 32);
  v38 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v5);

  objc_msgSend(v4, "setPredicate:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setFetchBatchSize:", 100);
  v6 = *(void **)(a1 + 64);
  v28 = v4;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v29 = v8;
  v10 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v29);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v14, "lastIgnoredDate");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (!v16)
          v16 = v9;
        objc_msgSend(v9, "timeIntervalSinceDate:", v16);
        v18 = v17 * 10.0;
        v19 = v17 < 6.0;
        v20 = 60.0;
        if (!v19)
          v20 = v18;
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setIgnoreUntilDate:", v21);
        objc_msgSend(v14, "setLastIgnoredDate:", v9);
        objc_msgSend(v14, "setAnalysisState:", 4294967286);

        objc_autoreleasePoolPop(v15);
      }
      v11 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v11);
  }

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    goto LABEL_17;
  if (objc_msgSend(v29, "count"))
  {
    v22 = *(void **)(a1 + 64);
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v30 = *(id *)(v23 + 40);
    v24 = objc_msgSend(v22, "save:", &v30);
    objc_storeStrong((id *)(v23 + 40), v30);
  }
  else
  {
    v24 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v24;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
LABEL_17:
    +[PLManagedObjectContext sanitizedErrorFromError:](PLManagedObjectContext, "sanitizedErrorFromError:");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

  }
}

void __92__PLAssetAnalysisState_deletedAssetUUIDsForAnalysisByWorkerType_fetchLimit_inLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  void *v20;
  uint8_t buf[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id obj;
  _BYTE v27[128];
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLAssetAnalysisState entityName](PLAssetAnalysisState, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPropertiesToFetch:", v6);

  objc_msgSend(v5, "setFetchLimit:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v5, "setFetchBatchSize:", 100);
  objc_msgSend(v5, "setResultType:", 2);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex(workerType) = %d AND asset = NULL"), *(__int16 *)(a1 + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v7);

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  v20 = v2;
  objc_msgSend(v2, "executeFetchRequest:error:", v5, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v18);
        }
        else
        {
          PLBackendGetLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Found orphaned analysis state record with no asset UUID", buf, 2u);
          }

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v15);
  }

}

void __90__PLAssetAnalysisState_requestCountOfAnalysisRecordsForDeletedAssetsInLibrary_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("asset == NULL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v3, "_countOfAnalysisStatesByWorkerTypeWithPredicate:analysisState:forDeletedAssets:inContext:error:", v4, 0, 1, v2, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v5, v6);

}

void __60__PLAssetAnalysisState_analysisCountsForWorkerType_library___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_class();
  v4 = *(_QWORD *)(a1 + 32);
  v31 = 0;
  v5 = objc_msgSend(v3, "_countOfAssetsAllowedForProcessingInLibrary:error:", v4, &v31);
  v6 = v31;
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v10 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("analysisState = %d AND asset != NULL AND workerType = %d"), 20, *(__int16 *)(a1 + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v10, "_countOfAnalysisStatesByWorkerTypeWithPredicate:analysisState:forDeletedAssets:inContext:error:", v11, 20, 0, v2, &v30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v30;

  if (v7)
  {
    v8 = 0;
    goto LABEL_5;
  }
  v13 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("analysisState = %d AND asset != NULL AND workerType = %d"), 4294967266, *(__int16 *)(a1 + 56));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v13, "_countOfAnalysisStatesByWorkerTypeWithPredicate:analysisState:forDeletedAssets:inContext:error:", v14, 4294967266, 0, v2, &v29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v29;

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v15 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("analysisState = %d AND asset != NULL AND workerType = %d"), 4294967256, *(__int16 *)(a1 + 56));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v15, "_countOfAnalysisStatesByWorkerTypeWithPredicate:analysisState:forDeletedAssets:inContext:error:", v16, 4294967256, 0, v2, &v28);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v28;

    if (!v7)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *(__int16 *)(a1 + 56));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v9, "objectForKeyedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("processed"));

      }
      objc_msgSend(v12, "objectForKeyedSubscript:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("failed-no-resources"));

      }
      if (v8)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, CFSTR("failed"));

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, CFSTR("total-allowed"));

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v21, v20);
      v7 = 0;
    }
  }
LABEL_6:

}

void __92__PLAssetAnalysisState_assetUUIDsFromAssetObjectIDs_library_whereAllWorkerTypes_matchState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("analysisState == %@ AND asset IN %@ AND workerType IN %@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C97B48];
  +[PLAssetAnalysisState entityName](PLAssetAnalysisState, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)v4;
  objc_msgSend(v7, "setPredicate:", v4);
  v40[0] = CFSTR("assetUUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPropertiesToFetch:", v8);

  objc_msgSend(v7, "setResultType:", 2);
  v37 = 0;
  v28 = v2;
  objc_msgSend(v2, "executeFetchRequest:error:", v7, &v37);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v37;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("assetUUID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v3, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v12);
  }

  v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = v3;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
        v23 = objc_msgSend(v17, "countForObject:", v22);
        if (v23 >= objc_msgSend(*(id *)(a1 + 56), "count"))
          objc_msgSend(v16, "addObject:", v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v19);
  }

  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v16;

}

void __66__PLAssetAnalysisState_requestAnalysisCountsInLibrary_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_class();
  v4 = *(_QWORD *)(a1 + 32);
  v31 = 0;
  v5 = objc_msgSend(v3, "_countOfAssetsAllowedForProcessingInLibrary:error:", v4, &v31);
  v6 = v31;
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
LABEL_5:
    v12 = 0;
LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }
  v10 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("analysisState = %d AND asset != NULL"), 20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v10, "_countOfAnalysisStatesByWorkerTypeWithPredicate:analysisState:forDeletedAssets:inContext:error:", v11, 20, 0, v2, &v30);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v30;

  if (v7)
  {
    v8 = 0;
    goto LABEL_5;
  }
  v15 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("analysisState = %d AND asset != NULL"), 4294967266);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v15, "_countOfAnalysisStatesByWorkerTypeWithPredicate:analysisState:forDeletedAssets:inContext:error:", v16, 4294967266, 0, v2, &v29);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v29;

  if (v7)
  {
    v8 = 0;
    goto LABEL_6;
  }
  v17 = *(void **)(a1 + 48);
  v18 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "predicateWithFormat:", CFSTR("(analysisState = %d OR ignoreUntilDate > %@) AND (asset != NULL)"), 10, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v17, "_countOfAnalysisStatesByWorkerTypeWithPredicate:analysisState:forDeletedAssets:inContext:error:", v20, 10, 0, v2, &v28);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v28;

  if (v7)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __66__PLAssetAnalysisState_requestAnalysisCountsInLibrary_completion___block_invoke_2;
  v22[3] = &unk_1E3660618;
  v8 = v8;
  v23 = v8;
  v9 = v9;
  v24 = v9;
  v12 = v12;
  v25 = v12;
  v27 = v5;
  v13 = v21;
  v26 = v13;
  PLEnumerateAnalysisWorkerType(0, v22);

  v7 = 0;
LABEL_7:
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v13, v7);

}

void __66__PLAssetAnalysisState_requestAnalysisCountsInLibrary_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("unavailable"));

  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("processed"));

  }
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("failed-no-resources"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("total-allowed"));

  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v3, v11);
}

void __76__PLAssetAnalysisState__bulkUpdateAnalysisStatesTo_predicate_library_error___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  int v8;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__PLAssetAnalysisState__bulkUpdateAnalysisStatesTo_predicate_library_error___block_invoke_2;
  v3[3] = &unk_1E36605F0;
  v4 = v2;
  v5 = *(id *)(a1 + 40);
  v8 = *(_DWORD *)(a1 + 72);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v4, "performBlockAndWait:", v3);

}

void __76__PLAssetAnalysisState__bulkUpdateAnalysisStatesTo_predicate_library_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  id obj;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  uint64_t v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C97AB0]);
  +[PLAssetAnalysisState entityName](PLAssetAnalysisState, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithEntityName:", v4);

  objc_msgSend(v5, "setPredicate:", *(_QWORD *)(a1 + 40));
  v26 = CFSTR("analysisState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 72));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPropertiesToUpdate:", v7);

  objc_msgSend(v5, "setResultType:", 2);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v8 + 40);
  LOBYTE(v7) = objc_msgSend(v2, "pl_executeBatchUpdateRequest:withBatchSize:error:", v5, 1000, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_BYTE)v7;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && *(_QWORD *)(a1 + 64))
  {
    +[PLManagedObjectContext sanitizedErrorFromError:](PLManagedObjectContext, "sanitizedErrorFromError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  PLAssetAnalysisGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = *(int *)(a1 + 72);
    v14 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v15 = CFSTR("success");
    else
      v15 = CFSTR("failure");
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138544130;
    v19 = v14;
    v20 = 2048;
    v21 = v13;
    v22 = 2114;
    v23 = v15;
    v24 = 2114;
    v25 = v16;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "Bulk updated analysis states matching: %{public}@ to value: %ld resulted in %{public}@. (error: %{public}@)", buf, 0x2Au);
  }

}

void __44__PLAssetAnalysisState__batchOperationQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.AssetAnalysisBatchOperationQueue", 0);
  v1 = (void *)_batchOperationQueue_queue;
  _batchOperationQueue_queue = (uint64_t)v0;

}

@end
