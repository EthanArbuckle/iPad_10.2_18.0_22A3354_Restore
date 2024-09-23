@implementation PLBackgroundJobSharedAssetContainerUpdateWorker

+ (id)_memoriesContainingAssetIds:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C97B48];
  +[PLMemory entityName](PLMemory, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchBatchSize:", 100);
  v19[0] = CFSTR("sharingComposition");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPropertiesToFetch:", v12);

  objc_msgSend(v11, "setResultType:", 0);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K IN %@ OR ANY %K IN %@"), CFSTR("extendedCuratedAssets"), v7, CFSTR("userCuratedAssets"), v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v13);

  }
  v18 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v11, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v18;
  v16 = v15;
  if (!v14 && a5)
    *a5 = objc_retainAutorelease(v15);

  return v14;
}

+ (BOOL)_updateSharingCompositionForMemoriesContainingAssetIDs:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  id v19;
  BOOL v20;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  PLBackgroundJobServiceGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromClass((Class)a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v11;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating sharingComposition for Memories...", buf, 0xCu);

  }
  v23 = 0;
  objc_msgSend((id)objc_opt_class(), "_memoriesContainingAssetIds:inContext:error:", v9, v8, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v23;
  v14 = v13;
  if (v12)
  {
    +[PLMemory predicateForPrivateOnlyCollectionsWithinSubset:](PLMemory, "predicateForPrivateOnlyCollectionsWithinSubset:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLMemory predicateForSharedOnlyCollectionsWithinSubset:](PLMemory, "predicateForSharedOnlyCollectionsWithinSubset:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v14;
    v17 = PLUpdateSharingCompositionForSharedAssetContainers(v12, &v22, v15, v16);
    v18 = v22;

    v19 = v18;
    if (v17)
    {
      v20 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    v19 = v13;
  }
  if (a5)
  {
    v19 = objc_retainAutorelease(v19);
    v20 = 0;
    *a5 = v19;
  }
  else
  {
    v20 = 0;
  }
LABEL_10:

  return v20;
}

+ (id)_suggestionsContainingAssetIds:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C97B48];
  +[PLSuggestion entityName](PLSuggestion, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFetchBatchSize:", 100);
  v19[0] = CFSTR("sharingComposition");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPropertiesToFetch:", v12);

  objc_msgSend(v11, "setResultType:", 0);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %K IN %@ OR ANY %K IN %@"), CFSTR("keyAssets"), v7, CFSTR("representativeAssets"), v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v13);

  }
  v18 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v11, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v18;
  v16 = v15;
  if (!v14 && a5)
    *a5 = objc_retainAutorelease(v15);

  return v14;
}

+ (BOOL)_updateSharingCompositionForSuggestionsContainingAssetIDs:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  id v19;
  BOOL v20;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  PLBackgroundJobServiceGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromClass((Class)a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v11;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating sharingComposition for Suggestions...", buf, 0xCu);

  }
  v23 = 0;
  objc_msgSend((id)objc_opt_class(), "_suggestionsContainingAssetIds:inContext:error:", v9, v8, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v23;
  v14 = v13;
  if (v12)
  {
    +[PLSuggestion predicateForPrivateOnlyCollectionsWithinSubset:](PLSuggestion, "predicateForPrivateOnlyCollectionsWithinSubset:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSuggestion predicateForSharedOnlyCollectionsWithinSubset:](PLSuggestion, "predicateForSharedOnlyCollectionsWithinSubset:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v14;
    v17 = PLUpdateSharingCompositionForSharedAssetContainers(v12, &v22, v15, v16);
    v18 = v22;

    v19 = v18;
    if (v17)
    {
      v20 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    v19 = v13;
  }
  if (a5)
  {
    v19 = objc_retainAutorelease(v19);
    v20 = 0;
    *a5 = v19;
  }
  else
  {
    v20 = 0;
  }
LABEL_10:

  return v20;
}

+ (BOOL)_isTokenInvalidError:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  char v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "code");
  v6 = v5 == 134501 || v5 == 134301;
  if (v6
    && (objc_msgSend(v4, "domain"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB28A8]),
        v7,
        (v8 & 1) != 0))
  {
    v9 = 1;
  }
  else
  {
    if (v4)
    {
      PLBackgroundJobServiceGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass((Class)a1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v11;
        v15 = 2112;
        v16 = v4;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Persistent history transaction iterator error was unrecognized: %@", (uint8_t *)&v13, 0x16u);

      }
    }
    v9 = 0;
  }

  return v9;
}

+ (id)_transactionIteratorSinceTokenIfValid:(id)a3 library:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  id v15;

  v7 = a3;
  objc_msgSend(a4, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  +[PLPersistentHistoryTransactionIterator iteratorSinceToken:withManagedObjectObjectContext:error:](PLPersistentHistoryTransactionIterator, "iteratorSinceToken:withManagedObjectObjectContext:error:", v7, v8, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v15;
  v11 = v10;
  v12 = v11;
  if (v9)
    v13 = 1;
  else
    v13 = a5 == 0;
  if (!v13)
    *a5 = objc_retainAutorelease(v11);

  return v9;
}

+ (id)_lastProcessingTokenFromLibrary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "globalValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastSharedAssetContainerProcessingToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)_setLastProcessingToken:(id)a3 library:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a4, "globalValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLastSharedAssetContainerProcessingToken:", v5);

}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 == 1;
}

+ (BOOL)performWorkOnAllItemsInContext:(id)a3 withError:(id *)a4
{
  id v7;
  char v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  PLGlobalValues *v14;
  id v15;
  BOOL v16;
  NSObject *v17;
  id v18;
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLBackgroundJobSharedAssetContainerUpdateWorker.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v22 = 0;
  v8 = objc_msgSend((id)objc_opt_class(), "_updateSharingCompositionForMemoriesContainingAssetIDs:inContext:error:", 0, v7, &v22);
  v9 = v22;
  if ((v8 & 1) == 0)
  {
    PLBackgroundJobServiceGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Failed to update sharing composition for all Memories with error: %@, not advancing token.", buf, 0xCu);
    }
    goto LABEL_13;
  }
  v21 = v9;
  v10 = objc_msgSend((id)objc_opt_class(), "_updateSharingCompositionForSuggestionsContainingAssetIDs:inContext:error:", 0, v7, &v21);
  v11 = v21;

  if ((v10 & 1) == 0)
  {
    PLBackgroundJobServiceGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v11;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Failed to update sharing composition for all Suggestions with error: %@, not advancing token.", buf, 0xCu);
    }
    v9 = v11;
LABEL_13:

    v18 = v9;
    v15 = v18;
    if (a4)
    {
      v15 = objc_retainAutorelease(v18);
      v16 = 0;
      *a4 = v15;
    }
    else
    {
      v16 = 0;
    }
    goto LABEL_16;
  }
  objc_msgSend(v7, "persistentStoreCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentPersistentHistoryTokenFromStores:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = -[PLGlobalValues initWithManagedObjectContext:]([PLGlobalValues alloc], "initWithManagedObjectContext:", v7);
    -[PLGlobalValues setLastSharedAssetContainerProcessingToken:](v14, "setLastSharedAssetContainerProcessingToken:", v13);

  }
  v15 = v11;
  v16 = 1;
LABEL_16:

  return v16;
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PLBackgroundJobWorkerPendingWorkItems *v7;
  void *v8;
  PLBackgroundJobWorkerPendingWorkItems *v9;
  PLBackgroundJobWorkerPendingWorkItems *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PLBackgroundJobCriteria criteriaForDiscretionaryResourceWorker](PLBackgroundJobCriteria, "criteriaForDiscretionaryResourceWorker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_lastProcessingTokenFromLibrary:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_transactionIteratorSinceTokenIfValid:library:error:", v5, v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
  if (!objc_msgSend(v6, "count"))
  {
    v9 = -[PLBackgroundJobWorkerPendingWorkItems initWithZeroWorkItems]([PLBackgroundJobWorkerPendingWorkItems alloc], "initWithZeroWorkItems");
    if (v9)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (!v5
    || (v7 = [PLBackgroundJobWorkerPendingWorkItems alloc],
        v15[0] = v5,
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v7, "initWithCriteria:workItemsNeedingProcessing:", v4, v8), v8, !v9))
  {
LABEL_5:
    v10 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v10, "initWithCriteria:workItemsNeedingProcessing:", v4, v12);

  }
LABEL_6:

  return v9;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  PLBackgroundJobSharedAssetContainerUpdateWorker *v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundJobSharedAssetContainerUpdateWorker.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__45066;
  v25[4] = __Block_byref_object_dispose__45067;
  v26 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__PLBackgroundJobSharedAssetContainerUpdateWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v20[3] = &unk_1E3676EC8;
  v13 = v10;
  v21 = v13;
  v14 = v9;
  v22 = v14;
  v23 = self;
  v24 = v25;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __90__PLBackgroundJobSharedAssetContainerUpdateWorker_performWorkOnItem_inLibrary_completion___block_invoke_56;
  v17[3] = &unk_1E36714A8;
  v15 = v11;
  v18 = v15;
  v19 = v25;
  objc_msgSend(v13, "performTransaction:completionHandler:", v20, v17);

  _Block_object_dispose(v25, 8);
}

void __90__PLBackgroundJobSharedAssetContainerUpdateWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  uint64_t v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  char v39;
  void *v40;
  uint64_t v41;
  int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  objc_class *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  objc_class *v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  _QWORD v59[4];
  NSObject *v60;
  id v61;
  id v62;
  id v63;
  id obj;
  id v65;
  uint64_t v66;
  const __CFString *v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 0;
    goto LABEL_8;
  }
  v4 = *(id *)(a1 + 40);
  v5 = (void *)objc_opt_class();
  v6 = *(_QWORD *)(a1 + 32);
  v65 = 0;
  objc_msgSend(v5, "_transactionIteratorSinceTokenIfValid:library:error:", v4, v6, &v65);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v65;
  if (v3 && !objc_msgSend((id)objc_opt_class(), "_isTokenInvalidError:", v7))
  {

    v27 = (void *)MEMORY[0x1E0C97B20];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "entityForName:inManagedObjectContext:", v28, v29);
    v17 = objc_claimAutoreleasedReturnValue();

    -[NSObject relationshipsByName](v17, "relationshipsByName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("libraryScope"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v43 = (void *)MEMORY[0x1E0CB35C8];
      v44 = *MEMORY[0x1E0D74498];
      v66 = *MEMORY[0x1E0CB2938];
      v67 = CFSTR("Unable to find libraryScope property on Asset entity.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "errorWithDomain:code:userInfo:", v44, 41003, v45);
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v48 = *(void **)(v47 + 40);
      *(_QWORD *)(v47 + 40) = v46;

      PLBackgroundJobServiceGetLog();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = (objc_class *)objc_opt_class();
        NSStringFromClass(v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v69 = v51;
        v70 = 2112;
        v71 = v52;
        _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_ERROR, "%{public}@: Unable to read asset entity or libraryScope property from schema in library: %@", buf, 0x16u);

      }
      v19 = 0;
      goto LABEL_34;
    }
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __90__PLBackgroundJobSharedAssetContainerUpdateWorker_performWorkOnItem_inLibrary_completion___block_invoke_49;
    v59[3] = &unk_1E3674DA8;
    v60 = v17;
    v61 = v18;
    v32 = v31;
    v62 = v32;
    objc_msgSend(v3, "enumerateRemainingTransactionsWithBlock:", v59);
    if (!objc_msgSend(v32, "count"))
      goto LABEL_25;
    PLBackgroundJobServiceGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v32, "count");
      *(_DWORD *)buf = 138543618;
      v69 = v35;
      v70 = 2048;
      v71 = v36;
      _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: updating shared asset container properties from changes (%tu)...", buf, 0x16u);

    }
    v37 = (void *)objc_opt_class();
    v38 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v58 = *(id *)(v38 + 40);
    v39 = objc_msgSend(v37, "_updateSharingCompositionForMemoriesContainingAssetIDs:inContext:error:", v32, v2, &v58);
    objc_storeStrong((id *)(v38 + 40), v58);
    if ((v39 & 1) != 0)
    {
      v40 = (void *)objc_opt_class();
      v41 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v57 = *(id *)(v41 + 40);
      v42 = objc_msgSend(v40, "_updateSharingCompositionForSuggestionsContainingAssetIDs:inContext:error:", v32, v2, &v57);
      objc_storeStrong((id *)(v41 + 40), v57);
      if (v42)
      {
LABEL_25:
        objc_msgSend(v3, "lastIteratedToken");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:

        v49 = v60;
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {
      PLBackgroundJobServiceGetLog();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v54 = (objc_class *)objc_opt_class();
        NSStringFromClass(v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v69 = v55;
        v70 = 2112;
        v71 = v56;
        _os_log_impl(&dword_199541000, v53, OS_LOG_TYPE_ERROR, "%{public}@: failed to update sharing composition for Suggestions with error: %@, not advancing token.", buf, 0x16u);

      }
    }
    v19 = 0;
    goto LABEL_33;
  }
  PLBackgroundJobServiceGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v69 = v10;
    v70 = 2112;
    v71 = (uint64_t)v7;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "%{public}@: unable to build valid transaction iterator, reprocessing entire library (error: %@)", buf, 0x16u);

  }
LABEL_8:
  v11 = (void *)objc_opt_class();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v12 + 40);
  v13 = objc_msgSend(v11, "_updateSharingCompositionForMemoriesContainingAssetIDs:inContext:error:", 0, v2, &obj);
  objc_storeStrong((id *)(v12 + 40), obj);
  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_opt_class();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v63 = *(id *)(v15 + 40);
    v16 = objc_msgSend(v14, "_updateSharingCompositionForSuggestionsContainingAssetIDs:inContext:error:", 0, v2, &v63);
    objc_storeStrong((id *)(v15 + 40), v63);
    if ((v16 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject persistentStoreCoordinator](v17, "persistentStoreCoordinator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "currentPersistentHistoryTokenFromStores:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:

      goto LABEL_36;
    }
  }
  else
  {
    PLBackgroundJobServiceGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v69 = v21;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to update sharing composition for all Memories with error: %@, not advancing token.", buf, 0xCu);
    }

  }
  PLBackgroundJobServiceGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    v69 = v23;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Failed to update sharing composition for all Suggestions with error: %@, not advancing token.", buf, 0xCu);
  }

  PLBackgroundJobServiceGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v69 = v25;
    v70 = 2112;
    v71 = v26;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "%{public}@: failed to update sharing composition for all memories with error: %@, not advancing token.", buf, 0x16u);

  }
  v19 = 0;
LABEL_36:

  objc_msgSend((id)objc_opt_class(), "_setLastProcessingToken:library:", v19, *(_QWORD *)(a1 + 32));
}

uint64_t __90__PLBackgroundJobSharedAssetContainerUpdateWorker_performWorkOnItem_inLibrary_completion___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __90__PLBackgroundJobSharedAssetContainerUpdateWorker_performWorkOnItem_inLibrary_completion___block_invoke_49(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  objc_msgSend(v16, "changes");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v9, "changedObjectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "entity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 32)) && objc_msgSend(v9, "changeType") == 1)
        {
          objc_msgSend(v9, "updatedProperties");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsObject:", *(_QWORD *)(a1 + 40));

          if (v14)
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
        }
        else
        {

        }
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") >= 0x3E8)
    *a3 = 1;

}

@end
