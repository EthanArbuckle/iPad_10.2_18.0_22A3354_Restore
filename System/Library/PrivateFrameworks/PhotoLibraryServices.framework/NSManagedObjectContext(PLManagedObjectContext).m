@implementation NSManagedObjectContext(PLManagedObjectContext)

- (void)pl_refresh
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
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
  objc_msgSend(a1, "registeredObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isDeleted") & 1) == 0)
          objc_msgSend(a1, "refreshObject:mergeChanges:", v7, objc_msgSend(v7, "hasChanges"));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (uint64_t)isUserInterfaceContext
{
  return 0;
}

- (uint64_t)photoLibrary
{
  return 0;
}

- (void)pl_performBlockAndWait:()PLManagedObjectContext
{
  uint64_t v4;
  void (**v5)(void);

  v5 = a3;
  v4 = objc_msgSend(a1, "concurrencyType");
  if (!v4 || *MEMORY[0x1E0C97C38] == v4)
    v5[2]();
  else
    objc_msgSend(a1, "performBlockAndWait:", v5);

}

- (id)pathManager
{
  void *v4;
  id v5;
  void *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__15981;
  v13 = __Block_byref_object_dispose__15982;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__NSManagedObjectContext_PLManagedObjectContext__pathManager__block_invoke;
  v8[3] = &unk_1E3677C68;
  v8[4] = a1;
  v8[5] = &v9;
  objc_msgSend(a1, "pl_performBlockAndWait:", v8);
  v4 = (void *)v10[5];
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLManagedObjectContext.m"), 1825, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("manager"));

    v4 = (void *)v10[5];
  }
  v5 = v4;
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (id)pl_graphCache
{
  id v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__15981;
  v8 = __Block_byref_object_dispose__15982;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__NSManagedObjectContext_PLManagedObjectContext__pl_graphCache__block_invoke;
  v3[3] = &unk_1E3677C68;
  v3[4] = a1;
  v3[5] = &v4;
  objc_msgSend(a1, "pl_performBlockAndWait:", v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (id)enumerateObjectsFromFetchRequest:()PLManagedObjectContext count:batchSize:usingBlock:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v10 = a3;
  v11 = a6;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __110__NSManagedObjectContext_PLManagedObjectContext__enumerateObjectsFromFetchRequest_count_batchSize_usingBlock___block_invoke;
  v15[3] = &unk_1E3664320;
  v17 = &v18;
  v12 = v11;
  v16 = v12;
  objc_msgSend(a1, "enumerateObjectsFromFetchRequest:batchSize:usingBlock:", v10, a5, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    *a4 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v13;
}

- (id)enumerateObjectsFromFetchRequest:()PLManagedObjectContext batchSize:usingBlock:
{
  id v8;
  void (**v9)(id, void *, uint64_t, uint64_t, char *);
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v29;
  void *v30;
  id v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v8, "setFetchBatchSize:", a4);
  v37 = 0;
  objc_msgSend(a1, "executeFetchRequest:error:", v8, &v37);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v37;
  v13 = objc_msgSend(v11, "count");
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    v15 = v13;
    v29 = v11;
    v30 = v10;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v16 = v11;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v34;
      v31 = v8;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x19AEC1554]();
          v32 = 0;
          if (objc_msgSend(v8, "resultType") || (objc_msgSend(v22, "isDeleted") & 1) == 0)
          {
            v9[2](v9, v22, v19, v15, &v32);
            if (v32)
            {
              objc_autoreleasePoolPop(v23);
              goto LABEL_19;
            }
            ++v19;
          }
          else
          {
            v24 = v15;
            v25 = v16;
            PLBackendGetLog();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v22, "objectID");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v39 = v27;
              _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEBUG, "Skipping deleted object on enum: %@", buf, 0xCu);

            }
            v16 = v25;
            v15 = v24;
            v8 = v31;
          }
          objc_autoreleasePoolPop(v23);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
        if (v18)
          continue;
        break;
      }
    }
LABEL_19:

    v14 = 0;
    v11 = v29;
    v10 = v30;
    v12 = 0;
  }

  objc_autoreleasePoolPop(v10);
  return v14;
}

- (uint64_t)enumerateObjectsFromFetchRequest:()PLManagedObjectContext count:usingDefaultBatchSizeWithBlock:
{
  return objc_msgSend(a1, "enumerateObjectsFromFetchRequest:count:batchSize:usingBlock:", a3, a4, 100, a5);
}

- (uint64_t)enumerateObjectsFromFetchRequest:()PLManagedObjectContext usingDefaultBatchSizeWithBlock:
{
  return objc_msgSend(a1, "enumerateObjectsFromFetchRequest:batchSize:usingBlock:", a3, 100, a4);
}

- (id)enumerateWithIncrementalSaveUsingObjects:()PLManagedObjectContext shouldRefreshAfterSave:withBlock:
{
  id v6;
  void (**v7)(id, void *, uint64_t, char *);
  void (**v8)(_QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  void *context;
  id obj;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  int buf;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__15981;
  v35 = __Block_byref_object_dispose__15982;
  v36 = 0;
  context = (void *)MEMORY[0x19AEC1554]();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __124__NSManagedObjectContext_PLManagedObjectContext__enumerateWithIncrementalSaveUsingObjects_shouldRefreshAfterSave_withBlock___block_invoke;
  v30[3] = &unk_1E3677C68;
  v30[4] = a1;
  v30[5] = &v31;
  v8 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v30);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
  if (v9)
  {
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x19AEC1554]();
        v25 = 0;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v14, "isDeleted") & 1) != 0)
        {
          PLBackendGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v14, "objectID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            buf = 138412290;
            v38 = v17;
            _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "Skipping deleted object on incremental save: %@", (uint8_t *)&buf, 0xCu);

          }
        }
        else
        {
          v7[2](v7, v14, v10++, &v25);
          if (v25)
          {
            v18 = 0;
            goto LABEL_18;
          }
        }
        if ((unint64_t)++v11 >= 0x65)
        {
          v8[2](v8);
          if (a4)
            objc_msgSend(a1, "refreshAllObjects");
          v11 = 0;
        }
        v18 = 1;
LABEL_18:
        objc_autoreleasePoolPop(v15);
        if (!v18)
          goto LABEL_21;
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
    }
    while (v9);
  }
LABEL_21:

  v8[2](v8);
  objc_autoreleasePoolPop(context);
  v19 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v19;
}

- (uint64_t)enumerateWithIncrementalSaveUsingObjects:()PLManagedObjectContext withBlock:
{
  return objc_msgSend(a1, "enumerateWithIncrementalSaveUsingObjects:shouldRefreshAfterSave:withBlock:", a3, 0, a4);
}

- (id)deleteObjectsWithIncrementalSave:()PLManagedObjectContext
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__NSManagedObjectContext_PLManagedObjectContext__deleteObjectsWithIncrementalSave___block_invoke;
  v4[3] = &unk_1E36775E8;
  v4[4] = a1;
  objc_msgSend(a1, "enumerateWithIncrementalSaveUsingObjects:withBlock:", a3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)pl_resultWithError:()PLManagedObjectContext block:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__15981;
  v20 = __Block_byref_object_dispose__15982;
  v21 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __75__NSManagedObjectContext_PLManagedObjectContext__pl_resultWithError_block___block_invoke;
  v13 = &unk_1E36714A8;
  v15 = &v16;
  v7 = v6;
  v14 = v7;
  objc_msgSend(a1, "performBlockAndWait:", &v10);
  objc_msgSend((id)v17[5], "resultWithError:", a3, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (BOOL)pl_executeBatchUpdateRequest:()PLManagedObjectContext withBatchSize:error:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  unint64_t v32;
  double v33;
  double v34;
  NSObject *v35;
  void *v36;
  _BOOL8 v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
  _QWORD *v42;
  id v43;
  void *v44;
  void *v45;
  void *v47;
  void *context;
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  unint64_t v58;
  __int16 v59;
  double v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(v7, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "predicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  v47 = v7;
  objc_msgSend(v10, "setIncludesSubentities:", objc_msgSend(v7, "includesSubentities"));
  objc_msgSend(v10, "setIncludesPropertyValues:", 0);
  objc_msgSend(v10, "setIncludesPendingChanges:", 0);
  objc_msgSend(v10, "setResultType:", 1);
  v50 = 0;
  v45 = a1;
  objc_msgSend(a1, "executeFetchRequest:error:", v10, &v50);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v50;
  v14 = v13;
  if (!v12)
  {
    v25 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v13);
    goto LABEL_24;
  }
  v42 = a5;
  v43 = v13;
  v44 = v10;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v16 = v15;
  PLBackendGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "propertiesToUpdate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v12, "count");
    objc_msgSend(v7, "predicate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v52 = v18;
    v53 = 2048;
    v54 = v19;
    v55 = 2112;
    v56 = v20;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "Performing batch update of %@ on %ld records matching %@", buf, 0x20u);

  }
  v21 = 0;
  v22 = 0;
  v23 = 0;
  do
  {
    v24 = objc_msgSend(v12, "count");
    v25 = v23 >= v24;
    if (v23 >= v24)
    {
      v14 = v43;
      v10 = v44;
LABEL_16:
      v32 = 0x1E0C99000;
      goto LABEL_21;
    }
    context = (void *)MEMORY[0x19AEC1554]();
    if (objc_msgSend(v12, "count") + v21 < a4)
      v26 = 1;
    else
      v26 = a4;
    objc_msgSend(v12, "subarrayWithRange:", v23, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF in %@"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v47, "copy");
    objc_msgSend(v29, "setPredicate:", v28);
    objc_msgSend(v29, "setResultType:", 0);
    v49 = v22;
    objc_msgSend(v45, "executeRequest:error:", v47, &v49);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v49;

    objc_autoreleasePoolPop(context);
    v23 += a4;
    v21 -= a4;
    v22 = v31;
  }
  while (v30);
  if (!v42)
  {
    v22 = v31;
    v14 = v43;
    v10 = v44;
    v25 = 0;
    goto LABEL_16;
  }
  v32 = 0x1E0C99000uLL;
  if (v31)
  {
    v22 = objc_retainAutorelease(v31);
    *v42 = v22;
  }
  else
  {
    v22 = 0;
  }
  v14 = v43;
  v10 = v44;
  v25 = 0;
LABEL_21:
  objc_msgSend(*(id *)(v32 + 3432), "timeIntervalSinceReferenceDate");
  v34 = v33;
  PLBackendGetLog();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v47, "propertiesToUpdate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v25;
    v38 = objc_msgSend(v12, "count");
    objc_msgSend(v47, "predicate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 138413314;
    v52 = v36;
    v53 = 2048;
    v54 = v38;
    v25 = v37;
    v55 = 2112;
    v56 = v39;
    v57 = 2048;
    v58 = v40 / a4;
    v59 = 2048;
    v60 = v34 - v16;
    _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_DEBUG, "Completed batch update of %@ on %ld records matching %@ in %ld batches, %3.3f sec", buf, 0x34u);

  }
LABEL_24:

  return v25;
}

+ (uint64_t)shouldHavePhotoLibrary
{
  return 0;
}

@end
