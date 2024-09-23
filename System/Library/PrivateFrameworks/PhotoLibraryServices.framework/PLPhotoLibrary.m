@implementation PLPhotoLibrary

id __38__PLPhotoLibrary_managedObjectContext__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 88);
}

- (void)performTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrary options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v7, 0, 1, objc_msgSend(v6, "refreshesAfterSave"), v4, 0);

}

- (PLManagedObjectContext)managedObjectContext
{
  void *v2;
  NSObject *v3;
  id v5;
  uint8_t v6[8];
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  PLPhotoLibrary *v11;

  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __38__PLPhotoLibrary_managedObjectContext__block_invoke;
  v10 = &unk_1E3670AD8;
  v11 = self;
  PLResultWithUnfairLock();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    PLBackendGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "managedObjectContext is only accessible after successfully loading photo library database", v6, 2u);
    }

    if (MEMORY[0x19AEC04BC]())
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0CB2FA8], CFSTR("managedObjectContext is only accessible after successfully loading photo library database"), 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v5);
    }
  }
  return (PLManagedObjectContext *)v2;
}

+ (void)_withDispatchGroup:(id)a3 onContext:(id)a4 synchronously:(BOOL)a5 shouldSave:(BOOL)a6 refreshAfterSave:(BOOL)a7 performTransaction:(id)a8 completionHandler:(id)a9
{
  NSObject *v12;
  id v13;
  uint64_t v14;
  qos_class_t v15;
  char *v16;
  __uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void (**v35)(_QWORD);
  uint64_t v36;
  char v37;
  id v38;
  id v40;
  NSObject *v42;
  _BOOL4 v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  NSObject *v56;
  id v57;
  id v58;
  id v59;
  char *v60;
  __uint64_t v61;
  id v62;
  BOOL v63;
  BOOL v64;
  _QWORD block[6];

  v43 = a5;
  v12 = a3;
  v13 = a4;
  v38 = a8;
  v40 = a9;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler__s_onceToken != -1)
    dispatch_once(&_withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler__s_onceToken, block);
  if (qos_class_self() == QOS_CLASS_BACKGROUND)
  {
    v14 = 0;
  }
  else
  {
    v15 = qos_class_self();
    v14 = 1;
    if (v15 != QOS_CLASS_UTILITY)
      v14 = 2;
  }
  v16 = (char *)&s_megamocStatsPerQOS + 32 * v14;
  v17 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v18 = (unint64_t *)(v16 + 8);
  do
    v19 = __ldaxr(v18);
  while (__stlxr(v19 + 1, v18));
  objc_msgSend(v13, "photoLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = PLIsAssetsd();
  if (!v21)
  {
    v22 = 0;
    if (!v12)
      goto LABEL_14;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "+[PLPhotoLibrary(MegaMocAdditions) _withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:]", v38);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
LABEL_13:
    dispatch_group_enter(v12);
LABEL_14:
  v23 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_2;
  v53[3] = &unk_1E36674E8;
  v63 = a6;
  v24 = v20;
  v54 = v24;
  v25 = v38;
  v58 = v25;
  v60 = v16;
  v61 = v17;
  v26 = v13;
  v55 = v26;
  v62 = a1;
  v27 = v40;
  v59 = v27;
  v64 = a7;
  v28 = v12;
  v56 = v28;
  v29 = v22;
  v57 = v29;
  v30 = (void *)MEMORY[0x19AEC174C](v53);
  if (v21)
  {
    v42 = v28;
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v23;
    v46[1] = 3221225472;
    v46[2] = __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_3;
    v46[3] = &unk_1E3667510;
    v47 = v26;
    v50 = v30;
    v51 = v27;
    v32 = v31;
    v48 = v32;
    v33 = v25;
    v52 = v33;
    v34 = v24;
    v49 = v34;
    v35 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v46);
    if (v43)
    {
      if (+[PLManagedObjectContext _pl_megamoc_isInPLMocPerform](PLManagedObjectContext, "_pl_megamoc_isInPLMocPerform"))
      {
        v35[2](v35);
      }
      else
      {
        objc_msgSend(v32, "sync:identifyingBlock:library:", v35, v33, v34);
      }
    }
    else
    {
      objc_msgSend(v32, "async:identifyingBlock:library:", v35, v33, v34);
    }
    v28 = v42;

  }
  else
  {
    if (v43)
      v36 = 0;
    else
      v36 = 5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = v26;
      v37 = objc_msgSend(v32, "pl_performWithOptions:andBlock:", v36, v30);
      if (v27 && (v37 & 1) == 0)
        objc_msgSend(v32, "performWithOptions:andBlock:", v36, v27);
    }
    else
    {
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_6;
      v44[3] = &unk_1E3676CD8;
      v45 = v30;
      objc_msgSend(v26, "performWithOptions:andBlock:", v36, v44);
      v32 = v45;
    }
  }

}

- (PLThumbnailManager)thumbnailManager
{
  return (PLThumbnailManager *)PLThumbnailManagerForPathManager();
}

uint64_t __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  __uint64_t v6;
  unint64_t *v7;
  __uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t *v12;
  unint64_t *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v1 = a1;
  v40 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 104))
    a1 = objc_msgSend(*(id *)(a1 + 32), "setPendingTransactions:", objc_msgSend(*(id *)(a1 + 32), "pendingTransactions") + 1);
  if (*(_QWORD *)(v1 + 64))
  {
    v2 = (void *)MEMORY[0x19AEC1554](a1);
    if ((unint64_t)objc_msgSend(*(id *)(v1 + 32), "pendingTransactions") >= 2 && *(_BYTE *)(v1 + 104))
    {
      do
        v3 = __ldaxr(&s_nestedWriteTransactionCount);
      while (__stlxr(v3 + 1, &s_nestedWriteTransactionCount));
    }
    v4 = (unint64_t *)(*(_QWORD *)(v1 + 80) + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    v6 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    v7 = *(unint64_t **)(v1 + 80);
    v8 = v6 - *(_QWORD *)(v1 + 88);
    do
      v9 = __ldaxr(v7);
    while (__stlxr(v9 + v8, v7));
    (*(void (**)(void))(*(_QWORD *)(v1 + 64) + 16))();
    v10 = *(_QWORD *)(v1 + 80);
    v11 = (unint64_t *)(v10 + 24);
    v12 = (unint64_t *)(v10 + 16);
    if (*(_BYTE *)(v1 + 104))
      v13 = v12;
    else
      v13 = v11;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 + 1, v13));
    objc_autoreleasePoolPop(v2);
  }
  if (*(_BYTE *)(v1 + 104))
  {
    objc_msgSend(*(id *)(v1 + 32), "setPendingTransactions:", objc_msgSend(*(id *)(v1 + 32), "pendingTransactions") - 1);
    if (!objc_msgSend(*(id *)(v1 + 40), "hasChanges"))
      goto LABEL_24;
    v15 = (void *)MEMORY[0x19AEC1554]();
    v16 = *(void **)(v1 + 40);
    v38 = 0;
    v17 = objc_msgSend(v16, "save:", &v38);
    v18 = v38;
    if ((v17 & 1) == 0)
      objc_msgSend((id)objc_opt_class(), "_context:saveFailedWithError:", *(_QWORD *)(v1 + 40), v18);

  }
  else
  {
    if (!objc_msgSend(*(id *)(v1 + 40), "isUserInterfaceContext"))
      goto LABEL_24;
    v15 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(*(id *)(v1 + 40), "processPendingChanges");
  }
  objc_autoreleasePoolPop(v15);
LABEL_24:
  if (*(_QWORD *)(v1 + 72))
  {
    v19 = (void *)MEMORY[0x19AEC1554]();
    (*(void (**)(void))(*(_QWORD *)(v1 + 72) + 16))();
    objc_autoreleasePoolPop(v19);
  }
  if (*(_BYTE *)(v1 + 104))
  {
    v20 = *(void **)(v1 + 32);
    if (v20)
    {
      objc_msgSend(v20, "transactionCompletionHandlers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v21, "copy");

      objc_msgSend(*(id *)(v1 + 32), "clearTransactionCompletionHandlers");
    }
    else
    {
      v22 = 0;
    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v35;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v35 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v27);
          v29 = (void *)MEMORY[0x19AEC1554](v24);
          (*(void (**)(uint64_t))(v28 + 16))(v28);
          objc_autoreleasePoolPop(v29);
          ++v27;
        }
        while (v25 != v27);
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        v25 = v24;
      }
      while (v24);
    }

    v31 = (void *)MEMORY[0x19AEC1554](v30);
    if (*(_BYTE *)(v1 + 105))
      objc_msgSend(*(id *)(v1 + 40), "refreshAllObjects", (_QWORD)v34);
    objc_autoreleasePoolPop(v31);

  }
  v32 = *(NSObject **)(v1 + 48);
  if (v32)
    dispatch_group_leave(v32);
  return objc_msgSend(*(id *)(v1 + 56), "stillAlive", (_QWORD)v34);
}

- (unint64_t)pendingTransactions
{
  return self->_pendingTransactions;
}

- (void)setPendingTransactions:(unint64_t)a3
{
  self->_pendingTransactions = a3;
}

- (id)transactionCompletionHandlers
{
  return self->_transactionCompletionHandlers;
}

- (void)clearTransactionCompletionHandlers
{
  NSMutableArray *transactionCompletionHandlers;

  transactionCompletionHandlers = self->_transactionCompletionHandlers;
  self->_transactionCompletionHandlers = 0;

}

- (id)_loadServerDatabaseContextWithOptions:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v36;
  id v37;
  uint64_t v38;
  const __CFString *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 1896, CFSTR("Can only be called in assetsd"));

  }
  v8 = (void *)MEMORY[0x19AEC1554]();
  -[PLPhotoLibrary options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PLPhotoLibrary options](self, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "requiredState");

    if (v11)
    {
      -[PLPhotoLibrary options](self, "options");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "requiredState");

    }
    else
    {
      v13 = 7;
    }
    -[PLPhotoLibrary options](self, "options");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "preventsWaitingForRequiredState");

    v14 = v16 ^ 1;
  }
  else
  {
    v14 = 1;
    v13 = 7;
  }
  -[PLPhotoLibrary pathManager](self, "pathManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "libraryURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLLibraryServicesManager libraryServicesManagerForLibraryURL:](PLLibraryServicesManager, "libraryServicesManagerForLibraryURL:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "state") >= v13)
  {
    v23 = 0;
  }
  else
  {
    if (!v14)
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0D74498];
      v40[0] = CFSTR("requiredState");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
      v29 = objc_claimAutoreleasedReturnValue();
      v40[1] = CFSTR("libraryState");
      v41[0] = v29;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v19, "state"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, 43002, v34);
      v22 = objc_claimAutoreleasedReturnValue();

      goto LABEL_21;
    }
    v37 = 0;
    v20 = objc_msgSend(v19, "awaitLibraryState:error:", v13, &v37);
    v21 = v37;
    v22 = (uint64_t)v21;
    if ((v20 & 1) == 0)
    {
      PLBackendGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v22;
        v30 = "awaitLibraryState failed: %@";
        goto LABEL_20;
      }
LABEL_21:

      v25 = 0;
      v23 = (void *)v22;
      goto LABEL_22;
    }
    v23 = v21;
  }
  -[PLPhotoLibrary options](self, "options");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedObjectContext contextForUninitializedPhotoLibrary:automaticallyMerges:automaticallyPinToFirstFetch:](PLManagedObjectContext, "contextForUninitializedPhotoLibrary:automaticallyMerges:automaticallyPinToFirstFetch:", self, objc_msgSend(v24, "automaticallyMergesContext"), objc_msgSend(v7, "automaticallyPinToFirstFetch"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0D74498];
    v38 = *MEMORY[0x1E0CB2938];
    v39 = CFSTR("Load server database context: contextForPhotoLibrary returned nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 45001, v28);
    v22 = objc_claimAutoreleasedReturnValue();

    PLBackendGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v22;
      v30 = "Failed to load library (_loadServerDatabaseContextWithOptions:error:) %@";
LABEL_20:
      _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, v30, buf, 0xCu);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
LABEL_22:

  objc_autoreleasePoolPop(v8);
  if (a4 && !v25)
    *a4 = objc_retainAutorelease(v23);

  return v25;
}

- (id)_loadClientDatabaseContextFastPath
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PLPhotoLibrary libraryBundle](self, "libraryBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PLPhotoLibrary shouldTryFastPathWithLibraryBundle:](PLPhotoLibrary, "shouldTryFastPathWithLibraryBundle:", v3);

  if (!v4)
  {
LABEL_6:
    v8 = 0;
    return v8;
  }
  -[PLPhotoLibrary options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "automaticallyMergesContext");
  -[PLPhotoLibrary options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedObjectContext contextForUninitializedPhotoLibrary:automaticallyMerges:automaticallyPinToFirstFetch:](PLManagedObjectContext, "contextForUninitializedPhotoLibrary:automaticallyMerges:automaticallyPinToFirstFetch:", self, v6, objc_msgSend(v7, "automaticallyPinToFirstFetch"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[PLPhotoLibrary pathManager](self, "pathManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "PLPhotoLibrary %@ fast path loading context failed, falling back to slow path.", (uint8_t *)&v12, 0xCu);

    }
    goto LABEL_6;
  }
  return v8;
}

- (PLPhotoLibraryOptions)options
{
  return self->_options;
}

- (NSString)name
{
  return self->_name;
}

+ (BOOL)shouldTryFastPathWithLibraryBundle:(id)a3
{
  id v3;
  unsigned int v4;
  void *v6;
  void *v7;

  v3 = a3;
  if (shouldTryFastPathWithLibraryBundle__onceToken != -1)
    dispatch_once(&shouldTryFastPathWithLibraryBundle__onceToken, &__block_literal_global_497);
  if (shouldTryFastPathWithLibraryBundle__cameraOrPhotosApp == 1
    && (objc_msgSend(v3, "sqliteErrorIndicatorFileExists") & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0D73280];
    objc_msgSend(v3, "libraryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isSystemPhotoLibraryURL:", v7);

    if (v4)
      v4 = PLIsRunningInStoreDemoMode() ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (PLPhotoLibraryBundle)libraryBundle
{
  return (PLPhotoLibraryBundle *)objc_getProperty(self, a2, 72, 1);
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (PLPhotoLibrary)initWithName:(const char *)a3 libraryBundle:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  void *v11;
  PLPhotoLibrary *v12;
  PLPhotoLibrary *v13;
  void *v14;
  uint64_t v15;
  NSString *name;
  NSObject *v17;
  void *v18;
  int v20;
  PLPhotoLibrary *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "pathManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PLPhotoLibrary _initWithPathManager:](self, "_initWithPathManager:", v11);
  v13 = v12;
  if (v12)
  {
    v12->_managedObjectContextLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_libraryBundle, a4);
    objc_msgSend(v9, "libraryServicesManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v13->_libraryServicesManager, v14);

    objc_storeStrong((id *)&v13->_options, a5);
    if (a3)
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3);
      name = v13->_name;
      v13->_name = (NSString *)v15;

    }
    if (!-[PLPhotoLibraryBundle registerPLPhotoLibrary:](v13->_libraryBundle, "registerPLPhotoLibrary:", v13))
    {

      v13 = 0;
    }
    +[PLPhotoLibrary reportLibraryDidInit:](PLPhotoLibrary, "reportLibraryDidInit:", v13);
    PLPhotosObjectLifecycleGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[PLPhotoLibrary name](v13, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 134218242;
      v21 = v13;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "PLPhotoLibrary %p initWithName %@", (uint8_t *)&v20, 0x16u);

    }
  }

  return v13;
}

- (id)_initWithPathManager:(id)a3
{
  id v5;
  PLPhotoLibrary *v6;
  PLPhotoLibrary *v7;
  PLPhotoLibrary *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLPhotoLibrary;
  v6 = -[PLPhotoLibrary init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pathManager, a3);
    v8 = v7;
  }

  return v7;
}

+ (void)reportLibraryDidInit:(id)a3
{
  unint64_t v3;
  unint64_t v4;

  do
    v3 = __ldaxr(&s_currentLibraryCount);
  while (__stlxr(v3 + 1, &s_currentLibraryCount));
  do
    v4 = __ldaxr(&s_totalLibraryCount);
  while (__stlxr(v4 + 1, &s_totalLibraryCount));
}

+ (id)newPhotoLibraryWithName:(const char *)a3 loadedFromBundle:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v22;
  const __CFString *v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  PLPhotoLibraryGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 136315138;
    v25 = a3;
    _os_signpost_emit_with_name_impl(&dword_199541000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "newPhotoLibraryWithName", "name: %s", buf, 0xCu);
  }

  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:libraryBundle:options:", a3, v11, v10);
  if (v16)
  {
    if ((objc_msgSend(v16, "loadDatabaseWithOptions:error:", v10, a6) & 1) != 0)
      goto LABEL_11;
    goto LABEL_9;
  }
  if (a6)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0D74498];
    v22 = *MEMORY[0x1E0CB2938];
    v23 = CFSTR("PLPhotoLibrary initWithName:libraryBundle:options: returned nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 45001, v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

  }
  v16 = 0;
LABEL_11:
  v19 = v15;
  v20 = v19;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 134217984;
    v25 = (const char *)v16;
    _os_signpost_emit_with_name_impl(&dword_199541000, v20, OS_SIGNPOST_INTERVAL_END, v13, "newPhotoLibraryWithName", "instance: %p", buf, 0xCu);
  }

  return v16;
}

- (BOOL)loadDatabaseWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  os_unfair_lock_s *p_managedObjectContextLock;
  char v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
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
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  uint64_t v37;
  const __CFString *v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  p_managedObjectContextLock = &self->_managedObjectContextLock;
  os_unfair_lock_lock(&self->_managedObjectContextLock);
  if (self->_managedObjectContext)
  {
    v8 = 1;
    v9 = 1;
    goto LABEL_23;
  }
  if ((PLIsAssetsd() & 1) != 0)
  {
LABEL_14:
    -[PLPhotoLibrary _loadDatabaseContextWithOptions:error:](self, "_loadDatabaseContextWithOptions:error:", v6, a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!v21)
    {
      v9 = 0;
LABEL_22:

      v8 = 1;
      goto LABEL_23;
    }
    objc_msgSend(v21, "persistentStoreCoordinator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "persistentStores");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v25 != 0;
    if (v25)
    {
      objc_storeWeak((id *)&self->_loadedPersistentStore, v25);
      objc_storeStrong((id *)&self->_managedObjectContext, v22);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObserver:selector:name:object:", self, sel_handlePersistentStoreRemoval_, *MEMORY[0x1E0C97930], v23);
    }
    else
    {
      if (!a4)
      {
LABEL_21:

        goto LABEL_22;
      }
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0CB2938];
      v38 = CFSTR("Persistent store is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 45001, v26);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "photosAccessAllowedWithScope:", 7);

  PLBackendGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v40 = v11;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "PLPhotosAccessAllowedResult result is %td", buf, 0xCu);
  }

  if ((PLPhotosAccessAllowed() & 1) != 0)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0D73298], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "checkPhotosAccessAllowedWithScope:", 7);

  PLBackendGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v40 = v14;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "PLPhotosAccessAllowedResult updatedResult is %td", buf, 0xCu);
  }

  if ((PLPhotosAccessAllowed() & 1) != 0)
  {
LABEL_10:
    if (!+[PLPhotoLibrary systemPhotoLibraryIsObtainable](PLPhotoLibrary, "systemPhotoLibraryIsObtainable"))
    {
      PLBackendGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = (uint64_t)v32;
        _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "*** Attempting access to the photo library before it is obtainable. %@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Access to the photo library is not allowed until the photo library is obtainable."), 0);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v33);
    }
    if (PLIsSystemLibraryAccessProhibited())
    {
      -[PLPhotoLibrary pathManager](self, "pathManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "libraryURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URLByStandardizingPath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D73208], "realSystemPhotoLibraryPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = objc_msgSend(v19, "isEqualToString:", v20);

      if ((_DWORD)v17)
      {
        PLBackendGetLog();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v40 = (uint64_t)v35;
          _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "*** Attempting access to the system photo library is prohibited. %@", buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Access to the system photo library is prohibited."), 0);
        v36 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v36);
      }

    }
    goto LABEL_14;
  }
  PLBackendGetLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = (uint64_t)v30;
    _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "*** This application is not allowed to access Photo data. %@", buf, 0xCu);

  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 45002, 0);
    v8 = 0;
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
LABEL_23:
  os_unfair_lock_unlock(p_managedObjectContextLock);

  return v8 & v9;
}

- (id)_loadDatabaseContextWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  if (PLIsAssetsd())
  {
    -[PLPhotoLibrary _loadServerDatabaseContextWithOptions:error:](self, "_loadServerDatabaseContextWithOptions:error:", v6, a4);
  }
  else
  {
    v7 = +[PLPhotoLibraryForceExitObserver sharedInstance](PLPhotoLibraryForceExitObserver, "sharedInstance");
    -[PLPhotoLibrary _loadClientDatabaseContextWithOptions:error:](self, "_loadClientDatabaseContextWithOptions:error:", v6, a4);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_loadClientDatabaseContextWithOptions:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (PLIsAssetsd())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 1857, CFSTR("Can not be called in assetsd"));

  }
  v8 = (void *)MEMORY[0x19AEC1554]();
  -[PLPhotoLibrary _loadClientDatabaseContextFastPath](self, "_loadClientDatabaseContextFastPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[PLPhotoLibrary assetsdClient](self, "assetsdClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "libraryClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v13 = objc_msgSend(v12, "openPhotoLibraryDatabaseWithoutProgressIfNeededWithOptions:error:", v7, &v25);
    v14 = v25;

    if (v13)
    {
      if (objc_msgSend(v7, "automaticallyPinToFirstFetch")
        && ((objc_msgSend(v7, "automaticallyMergesContext") & 1) != 0
         || objc_msgSend(v7, "refreshesAfterSave")))
      {
        PLBackendGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_FAULT, "automaticallyMergesContext/refreshesAfterSave cannot be set with automaticallyPinToFirstFetch on PLPhotoLibaryOptions, disabling automaticallyPinToFirstFetch...", buf, 2u);
        }

        objc_msgSend(v7, "setAutomaticallyPinToFirstFetch:", 0);
      }
      +[PLManagedObjectContext contextForUninitializedPhotoLibrary:automaticallyMerges:automaticallyPinToFirstFetch:](PLManagedObjectContext, "contextForUninitializedPhotoLibrary:automaticallyMerges:automaticallyPinToFirstFetch:", self, objc_msgSend(v7, "automaticallyMergesContext"), objc_msgSend(v7, "automaticallyPinToFirstFetch"));
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        objc_autoreleasePoolPop(v8);
LABEL_20:
        v10 = v17;

        goto LABEL_21;
      }
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0D74498];
      v28 = *MEMORY[0x1E0CB2938];
      v29[0] = CFSTR("contextForPhotoLibrary returned nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 45001, v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      PLBackendGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v19;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Failed to load library (_loadClientDatabaseContext:) %@", buf, 0xCu);
      }
    }
    else
    {
      PLBackendGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v14;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Failed to load library: %@", buf, 0xCu);
      }
      v19 = v14;
    }

    objc_autoreleasePoolPop(v8);
    if (a4)
    {
      v14 = objc_retainAutorelease(v19);
      v17 = 0;
      *a4 = v14;
    }
    else
    {
      v17 = 0;
      v14 = v19;
    }
    goto LABEL_20;
  }
  v10 = v9;
  objc_autoreleasePoolPop(v8);
LABEL_21:

  return v10;
}

+ (BOOL)systemPhotoLibraryIsObtainable
{
  id v4;
  char v5;
  void *v7;

  if (PLIsAssetsd())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoLibrary.m"), 1438, CFSTR("Only called by assetsd clients"));

  }
  v4 = a1;
  objc_sync_enter(v4);
  if (!systemPhotoLibraryIsObtainable_obtainable)
  {
    if (PLIsPTPD())
      v5 = !+[PLIndicatorFileCoordinator systemLibraryAvailableIndicatorState](PLIndicatorFileCoordinator, "systemLibraryAvailableIndicatorState");
    else
      v5 = 0;
    systemPhotoLibraryIsObtainable_obtainable = (MKBDeviceUnlockedSinceBoot() == 1) & ~v5;
  }
  objc_sync_exit(v4);

  return systemPhotoLibraryIsObtainable_obtainable;
}

void __53__PLPhotoLibrary_shouldTryFastPathWithLibraryBundle___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v1, "isEqual:", CFSTR("com.apple.camera")) & 1) != 0
    || objc_msgSend(v1, "isEqual:", CFSTR("com.apple.mobileslideshow")))
  {
    shouldTryFastPathWithLibraryBundle__cameraOrPhotosApp = 1;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_libraryServicesManager);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_videoConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_imageConversionServiceClient, 0);
  objc_destroyWeak((id *)&self->_loadedPersistentStore);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_libraryBundle, 0);
  objc_storeStrong((id *)&self->_extraVideoExtensions, 0);
  objc_storeStrong((id *)&self->_audioFileExtensions, 0);
  objc_storeStrong((id *)&self->_rawImageFileExtensions, 0);
  objc_storeStrong((id *)&self->_imageFileExtensions, 0);
  objc_storeStrong((id *)&self->_lastImportedPhotosAlbum, 0);
  objc_storeStrong((id *)&self->_allImportedPhotosAlbum, 0);
  objc_storeStrong((id *)&self->_transactionCompletionHandlers, 0);
}

+ (id)_internalSystemPhotoLibrary
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (PLIsForegroundApplication())
  {
    +[PLMainQueuePhotoLibrary systemMainQueuePhotoLibrary](PLMainQueuePhotoLibrary, "systemMainQueuePhotoLibrary");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v4 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "+[PLPhotoLibrary _internalSystemPhotoLibrary]", v3, 0, &v7);
    v5 = v7;
    if (!v4)
    {
      PLBackendGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v9 = "+[PLPhotoLibrary _internalSystemPhotoLibrary]";
        v10 = 2112;
        v11 = v3;
        v12 = 2112;
        v13 = v5;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);
      }

    }
    return v4;
  }
}

- (void)dealloc
{
  NSObject *v3;
  NSString *name;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  PLPhotoLibrary *v8;
  __int16 v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    name = self->_name;
    *(_DWORD *)buf = 134218242;
    v8 = self;
    v9 = 2112;
    v10 = name;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "PLPhotoLibrary %p dealloc %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[PAVideoConversionServiceClient invalidateAfterPendingRequestCompletion](self->_videoConversionServiceClient, "invalidateAfterPendingRequestCompletion");
  +[PLPhotoLibrary reportLibraryDidDealloc:](PLPhotoLibrary, "reportLibraryDidDealloc:", self);
  v6.receiver = self;
  v6.super_class = (Class)PLPhotoLibrary;
  -[PLPhotoLibrary dealloc](&v6, sel_dealloc);
}

+ (void)reportLibraryDidDealloc:(id)a3
{
  unint64_t v3;

  do
    v3 = __ldaxr(&s_currentLibraryCount);
  while (__stlxr(v3 - 1, &s_currentLibraryCount));
}

+ (id)newPhotoLibraryWithName:(const char *)a3 loadedFromURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lookupOrCreateBundleForLibraryURL:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(a1, "newPhotoLibraryWithName:loadedFromBundle:options:error:", a3, v13, v10, a6);
  return v14;
}

void __43__PLPhotoLibrary_disableOpportunisticTasks__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = sOpportunisticTasksDisabled;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Disable opportunistic tasks invoked (was %d)", (uint8_t *)v4, 8u);
  }

  v3 = sOpportunisticTasksDisabled;
  if (!sOpportunisticTasksDisabled)
  {
    objc_msgSend(*(id *)(a1 + 32), "_reallyDisableOpportunisticTasks");
    v3 = sOpportunisticTasksDisabled;
  }
  sOpportunisticTasksDisabled = v3 + 1;
}

- (void)_reallyDisableOpportunisticTasks
{
  NSObject *v3;

  objc_msgSend((id)objc_opt_class(), "opportunisticTaskIsolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PLPhotoLibrary _pauseSearchIndexing](self, "_pauseSearchIndexing");
  -[PLPhotoLibrary _pauseChangeHandlingNotifications](self, "_pauseChangeHandlingNotifications");
}

- (void)disableOpportunisticTasks
{
  NSObject *v4;
  void *v5;
  _QWORD block[5];

  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 510, CFSTR("disableOpportunisticTasks can only be called from assetsd"));

  }
  objc_msgSend((id)objc_opt_class(), "opportunisticTaskIsolationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PLPhotoLibrary_disableOpportunisticTasks__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(v4, block);

}

+ (id)opportunisticTaskIsolationQueue
{
  if (opportunisticTaskIsolationQueue_opportunisticTaskIsolationToken != -1)
    dispatch_once(&opportunisticTaskIsolationQueue_opportunisticTaskIsolationToken, &__block_literal_global_2894);
  return (id)sOpportunisticTaskIsolationQueue;
}

- (void)_pauseSearchIndexing
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (PLPlatformSearchSupported())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    objc_msgSend(WeakRetained, "searchIndexManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    PLSearchBackendIndexManagerGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134349056;
      v7 = v4;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Opportunistic Tasks: [Disabled]. Pause search indexing. SearchIndexManager: %{public}p", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(v4, "pauseIndexingWithReason:", CFSTR("PLSearchIndexPauseReasonOpportunisticTasks"));
  }
}

- (void)_pauseChangeHandlingNotifications
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "changeHandlingContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pauseLaunchEventNotifications");

}

uint64_t __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke()
{
  uint64_t result;

  result = PLIsAssetsd();
  if ((_DWORD)result)
    return objc_msgSend((id)objc_opt_class(), "_registerStateHandler");
  return result;
}

- (PLLibraryServicesManager)libraryServicesManager
{
  return (PLLibraryServicesManager *)objc_loadWeakRetained((id *)&self->_libraryServicesManager);
}

- (id)albumListForContentMode:(int)a3
{
  void *v4;

  v4 = 0;
  switch(a3)
  {
    case 1:
      +[PLManagedAlbumList allStreamedAlbumsListInPhotoLibrary:](PLManagedAlbumList, "allStreamedAlbumsListInPhotoLibrary:", self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      goto LABEL_4;
    case 3:
      +[PLManagedAlbumList importListInPhotoLibrary:](PLManagedAlbumList, "importListInPhotoLibrary:", self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
    case 5:
    case 6:
    case 7:
      return v4;
    case 8:
      +[PLManagedAlbumList eventListInPhotoLibrary:](PLManagedAlbumList, "eventListInPhotoLibrary:", self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      if (a3 == 13)
      {
LABEL_4:
        +[PLManagedAlbumList albumListInPhotoLibrary:](PLManagedAlbumList, "albumListInPhotoLibrary:", self);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  return v4;
}

- (id)shortLivedLibraryCopyByAppendingName:(const char *)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;

  if ((PLIsAssetsd() & 1) == 0 && (MEMORY[0x19AEC0720]() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 326, CFSTR("Should only be called within assetsd"));

  }
  -[PLPhotoLibrary name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" %s"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoLibrary libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "databaseContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_retainAutorelease(v7);
  v11 = (void *)objc_msgSend(v9, "newShortLivedLibraryWithName:", objc_msgSend(v10, "UTF8String"));

  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "changeSource");
  objc_msgSend(v11, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setChangeSource:", v13);

  return v11;
}

- (id)libraryID
{
  return (id)PLLibraryIDFromPathManager();
}

- (unint64_t)role
{
  void *v2;
  unint64_t v3;

  -[PLPhotoLibrary options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "libraryRole");

  return v3;
}

- (PLThumbnailIndexes)thumbnailIndexes
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 363, CFSTR("PLThumbnailIndexes only available in assetsd"));

  }
  PLLibraryIDFromPathManager();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLDataStoreForClassIDAndLibraryID(1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "thumbnailIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLThumbnailIndexes *)v6;
}

- (PAImageConversionServiceClient)imageConversionServiceClient
{
  PAImageConversionServiceClient *imageConversionServiceClient;
  PAImageConversionServiceClient *v4;
  PAImageConversionServiceClient *v5;

  imageConversionServiceClient = self->_imageConversionServiceClient;
  if (!imageConversionServiceClient)
  {
    v4 = (PAImageConversionServiceClient *)objc_alloc_init(MEMORY[0x1E0D47BE8]);
    v5 = self->_imageConversionServiceClient;
    self->_imageConversionServiceClient = v4;

    imageConversionServiceClient = self->_imageConversionServiceClient;
  }
  return imageConversionServiceClient;
}

- (PAVideoConversionServiceClient)videoConversionServiceClient
{
  PAVideoConversionServiceClient *videoConversionServiceClient;
  PAVideoConversionServiceClient *v4;
  PAVideoConversionServiceClient *v5;

  videoConversionServiceClient = self->_videoConversionServiceClient;
  if (!videoConversionServiceClient)
  {
    v4 = (PAVideoConversionServiceClient *)objc_alloc_init(MEMORY[0x1E0D47C30]);
    v5 = self->_videoConversionServiceClient;
    self->_videoConversionServiceClient = v4;

    videoConversionServiceClient = self->_videoConversionServiceClient;
  }
  return videoConversionServiceClient;
}

- (void)handlePossibleCoreDataError:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C979C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "intValue");
    if (v6 == 769)
    {
      objc_msgSend((id)objc_opt_class(), "contextExecuteFailedWithSQLiteResultCode:", 769);
    }
    else if (v6 == 26 || v6 == 11)
    {
      -[PLPhotoLibrary _markForRebuildAndAbortWithReason:error:](self, "_markForRebuildAndAbortWithReason:error:", 8, v8);
    }
  }
  if (-[PLPhotoLibrary _isUnknownAssetColumnError:](self, "_isUnknownAssetColumnError:", v8))
    -[PLPhotoLibrary _markForRebuildAndAbortWithReason:error:](self, "_markForRebuildAndAbortWithReason:error:", 21, v8);

}

- (void)_markForRebuildAndAbortWithReason:(int64_t)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PLBackendGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    PLRebuildReasonToShortString(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_FAULT, "Corrupt Database Detected: reason: %{public}@, error: %@", (uint8_t *)&v11, 0x16u);

  }
  -[PLPhotoLibrary pathManager](self, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSqliteErrorForRebuildReason:allowsExit:", a3, 1);

  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "shutdownLibraryWithDescription:", CFSTR("CoreData error"));

}

- (BOOL)_isUnknownAssetColumnError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C979C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "intValue");
    objc_msgSend(v3, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("NSSQLiteDatabaseErrorMessageKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "containsString:", CFSTR("no such column: ZASSET"));
    if (v6 == 1)
      v10 = v9;
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PLPhotoLibraryPathManager libraryURL](self->_pathManager, "libraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p libraryURL=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enableOpportunisticTasks
{
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 462, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_libraryServicesManager"));

  }
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 463, CFSTR("enableOpportunisticTasks: can only be called from assetsd"));

  }
  objc_msgSend((id)objc_opt_class(), "opportunisticTaskIsolationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PLPhotoLibrary_enableOpportunisticTasks__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(v5, block);

}

- (void)_reallyEnableOpportunisticTasks
{
  NSObject *v3;

  objc_msgSend((id)objc_opt_class(), "opportunisticTaskIsolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PLPhotoLibrary _resumeSearchIndexing](self, "_resumeSearchIndexing");
  -[PLPhotoLibrary _resumeChangeHandlingNotifications](self, "_resumeChangeHandlingNotifications");
  -[PLPhotoLibrary _cancelAllDeferredPrewarming](self, "_cancelAllDeferredPrewarming");
}

- (void)_resumeSearchIndexing
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (PLPlatformSearchSupported())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    objc_msgSend(WeakRetained, "searchIndexManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    PLSearchBackendIndexManagerGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134349056;
      v7 = v4;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Opportunistic Tasks: [Enabled]. Unpause search indexing. SearchIndexManager: %{public}p", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(v4, "unpauseIndexingWithReason:", CFSTR("PLSearchIndexPauseReasonOpportunisticTasks"));
  }
}

- (void)_resumeChangeHandlingNotifications
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "changeHandlingContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unpauseLaunchEventNotifications");

}

- (void)_cancelAllDeferredPrewarming
{
  NSObject *v2;
  PLCaptureDeferredPhotoProcessor *v3;
  uint8_t v4[16];

  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Deferred processing: cancel all prewarming due to enabling opportunistic tasks", v4, 2u);
  }

  v3 = objc_alloc_init(PLCaptureDeferredPhotoProcessor);
  -[PLCaptureDeferredPhotoProcessor cancelAllPrewarmingWithCompletionHandler:](v3, "cancelAllPrewarmingWithCompletionHandler:", &__block_literal_global_96);

}

- (PLPhotoLibrary)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("You just got singlestacked"), CFSTR("Must use an initializer that takes a library path"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)_setManagedObjectContext:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLRunWithUnfairLock();

}

- (BOOL)unloadDatabase:(id *)a3
{
  PLRunWithUnfairLock();
  return 1;
}

- (void)handlePersistentStoreRemoval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C979B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2562;
  v16 = __Block_byref_object_dispose__2563;
  v17 = 0;
  v11[1] = (id)MEMORY[0x1E0C809B0];
  v11[2] = (id)3221225472;
  v11[3] = __47__PLPhotoLibrary_handlePersistentStoreRemoval___block_invoke;
  v11[4] = &unk_1E3677C68;
  v11[5] = self;
  v11[6] = &v12;
  PLRunWithUnfairLock();
  if (objc_msgSend(v6, "indexOfObject:", v13[5]) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11[0] = 0;
    v7 = -[PLPhotoLibrary unloadDatabase:](self, "unloadDatabase:", v11);
    v8 = v11[0];
    if (v7)
    {
      PLBackendGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        -[PLPhotoLibrary name](self, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v10;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Unloaded database %@", buf, 0xCu);

      }
    }
    else
    {
      PLBackendGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v8;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to unload database %@", buf, 0xCu);
      }
    }

  }
  _Block_object_dispose(&v12, 8);

}

- (void)clientApplicationWillEnterForeground
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (PLIsAssetsd())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 790, CFSTR("cannot be called by assetsd"));

  }
  -[PLPhotoLibrary libraryBundle](self, "libraryBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indicatorFileCoordinator");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (__photoLibraryClient == 1
    && objc_msgSend(v8, "needsRecoveryAfterCrashOptionallyRemoveAllIndicatorFiles:", 0))
  {
    -[PLPhotoLibrary assetsdClient](self, "assetsdClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "libraryClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recoverFromCrashIfNeeded");

  }
}

- (id)photoAnalysisClient
{
  void *v3;
  char v4;
  void *v5;

  -[PLPhotoLibrary globalValues](self, "globalValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "libraryCreateOptions");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[PLPhotoLibraryBundle photoAnalysisServiceClient](self->_libraryBundle, "photoAnalysisServiceClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)constraintsDirector
{
  return -[PLPhotoLibraryBundle constraintsDirector](self->_libraryBundle, "constraintsDirector");
}

- (void)_photoLibraryCorruptNotification
{
  NSObject *v2;
  uint8_t v3[16];

  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "Exiting because another process detected a corrupt database.", v3, 2u);
  }

  exit(0);
}

- (void)_photoLibraryForceClientExitNotification
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  if (!PLIsSpringboard() || !PLIsRunningInStoreDemoMode())
  {
    PLBackendGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "Exiting because another process requested a FORCE CLIENT EXIT.  Everything is behaving as it should and you don't need to file a radar about this.\n\nThis is usually initiated by: plphotosctl rebuilddb.", v4, 2u);
    }

    exit(0);
  }
  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "Ignoring simulated FORCE CLIENT EXIT for SpringBoard in Store Demo Mode to avoid a possible crash loop.", buf, 2u);
  }

}

- (BOOL)_hasIncompleteAsset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("complete == 0"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);
  objc_msgSend(v5, "setFetchLimit:", 1);
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "countForFetchRequest:error:", v5, &v12);
  v9 = v12;

  if (v9 || v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Error attempting to count incomplete assets: %@", buf, 0xCu);
    }

    v8 = 0;
  }

  return v8 != 0;
}

- (BOOL)hasITunesSyncedContent
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__PLPhotoLibrary_hasITunesSyncedContent__block_invoke;
  v4[3] = &unk_1E3677C68;
  v4[4] = self;
  v4[5] = &v5;
  -[PLPhotoLibrary performBlockAndWait:](self, "performBlockAndWait:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)iTunesSyncedContentInfo
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2562;
  v9 = __Block_byref_object_dispose__2563;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__PLPhotoLibrary_iTunesSyncedContentInfo__block_invoke;
  v4[3] = &unk_1E3677C68;
  v4[4] = self;
  v4[5] = &v5;
  -[PLPhotoLibrary performBlockAndWait:](self, "performBlockAndWait:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)deleteITunesSyncedContentForEnablingiCPL
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__PLPhotoLibrary_deleteITunesSyncedContentForEnablingiCPL__block_invoke;
  v2[3] = &unk_1E3677AA0;
  v2[4] = self;
  -[PLPhotoLibrary performTransactionAndWait:](self, "performTransactionAndWait:", v2);
}

- (void)addCompletionHandlerToCurrentTransaction:(id)a3
{
  id v5;
  NSMutableArray *v6;
  NSMutableArray *transactionCompletionHandlers;
  void *v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v12 = v5;
  if (!self->_pendingTransactions)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 937, CFSTR("Can only schedule completion handlers when there is an ongoing transaction."));

    v5 = v12;
  }
  if (!self->_transactionCompletionHandlers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    transactionCompletionHandlers = self->_transactionCompletionHandlers;
    self->_transactionCompletionHandlers = v6;

    v5 = v12;
  }
  v8 = (void *)objc_msgSend(v5, "copy");
  v9 = self->_transactionCompletionHandlers;
  v10 = (void *)MEMORY[0x19AEC174C]();
  -[NSMutableArray addObject:](v9, "addObject:", v10);

}

- (id)eventWithName:(id)a3 andImportSessionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum eventsWithName:andImportSessionIdentifier:inManagedObjectContext:](PLGenericAlbum, "eventsWithName:andImportSessionIdentifier:inManagedObjectContext:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)albumWithUuid:(id)a3
{
  return +[PLGenericAlbum albumWithUUID:inLibrary:](PLGenericAlbum, "albumWithUUID:inLibrary:", a3, self);
}

- (void)_userDeleteAlbums:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v10, "isCloudSharedAlbum")
          && objc_msgSend(v10, "conformsToProtocol:", &unk_1EE3B1010))
        {
          if (!v7)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v7, "addObject:", v10);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  -[PLPhotoLibrary libraryBundle](self, "libraryBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isSystemPhotoLibrary");

  if (v12)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          +[PLPhotoSharingHelper deleteCloudSharedAlbumFromServer:](PLPhotoSharingHelper, "deleteCloudSharedAlbumFromServer:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v15);
    }

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = v4;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * k);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v23, "delete", (_QWORD)v24);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v20);
  }

}

- (void)_filterAlbums:(id)a3 toTrashableAlbums:(id *)a4 deletableAlbums:(id *)a5 otherAlbums:(id *)a6
{
  id v9;
  id *v10;
  id *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char v18;
  id *v19;
  id *v20;
  id *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v20 = a4;
  if (a4)
    a4 = (id *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a5)
    v10 = (id *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v10 = 0;
  v21 = a5;
  if (a6)
    v11 = (id *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v11 = 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) == 0
          || (v18 = objc_msgSend(v17, "canMoveToTrash"), v19 = a4, (v18 & 1) == 0))
        {
          if (objc_msgSend(v17, "canPerformEditOperation:", 32))
            v19 = v10;
          else
            v19 = v11;
        }
        objc_msgSend(v19, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  if (v20)
    *v20 = objc_retainAutorelease(a4);
  if (v21)
    *v21 = objc_retainAutorelease(v10);
  if (a6)
    *a6 = objc_retainAutorelease(v11);

}

- (void)_userApplyTrashedState:(signed __int16)a3 toAlbums:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  id v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = 0;
  -[PLPhotoLibrary _filterAlbums:toTrashableAlbums:deletableAlbums:otherAlbums:](self, "_filterAlbums:toTrashableAlbums:deletableAlbums:otherAlbums:", a4, &v18, &v17, 0);
  v6 = v18;
  v7 = v17;
  if ((_DWORD)v4 == 1)
    -[PLPhotoLibrary _userDeleteAlbums:](self, "_userDeleteAlbums:", v7);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "applyTrashedState:cascade:", v4, 1, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v10);
  }

}

- (void)userTrashAlbums:(id)a3
{
  -[PLPhotoLibrary _userApplyTrashedState:toAlbums:](self, "_userApplyTrashedState:toAlbums:", 1, a3);
}

- (void)userUntrashAlbums:(id)a3
{
  -[PLPhotoLibrary _userApplyTrashedState:toAlbums:](self, "_userApplyTrashedState:toAlbums:", 0, a3);
}

- (void)userExpungeAlbums:(id)a3
{
  -[PLPhotoLibrary _userApplyTrashedState:toAlbums:](self, "_userApplyTrashedState:toAlbums:", 2, a3);
}

- (id)albumListForAlbumOfKind:(int)a3
{
  void *v3;

  switch(a3)
  {
    case 4003:
      +[PLManagedAlbumList importListInPhotoLibrary:](PLManagedAlbumList, "importListInPhotoLibrary:", self);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4002:
      +[PLManagedAlbumList eventListInPhotoLibrary:](PLManagedAlbumList, "eventListInPhotoLibrary:", self);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4001:
      +[PLManagedAlbumList facesAlbumListInPhotoLibrary:](PLManagedAlbumList, "facesAlbumListInPhotoLibrary:", self);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (NSArray)photoStreamAlbums
{
  void *v2;
  void *v3;

  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum albumsWithKind:inManagedObjectContext:](PLGenericAlbum, "albumsWithKind:inManagedObjectContext:", 1500, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)photoStreamAlbumsForPreferences
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PLPhotoLibrary photoStreamAlbums](self, "photoStreamAlbums");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isOwnPhotoStreamAlbum", (_QWORD)v11))
          objc_msgSend(v3, "insertObject:atIndex:", v9, 0);
        else
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)eventAlbumContainingPhoto:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("(kind == %d) ||(kind == %d) ||(kind == %d)"), 12, 1000, 1500);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "albums");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "filteredSetUsingPredicate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)countOfLocalAlbumsContainingAssets:(id)a3 assetsInSomeAlbumCount:(int64_t *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "albums", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectsPassingTest:", &__block_literal_global_449);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count"))
        {
          objc_msgSend(v6, "unionSet:", v14);
          ++v10;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  v15 = objc_msgSend(v6, "count");
  if (a4)
    *a4 = v10;

  return v15;
}

- (id)objectWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectWithID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)assetWithUUID:(id)a3
{
  return -[PLPhotoLibrary assetWithUUID:inContainer:](self, "assetWithUUID:inContainer:", a3, 0);
}

- (id)assetWithUUID:(id)a3 inContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAsset assetWithUUID:inManagedObjectContext:](PLManagedAsset, "assetWithUUID:inManagedObjectContext:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (!v7)
      {
        v13 = v9;
LABEL_21:

        goto LABEL_22;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v7;
        objc_msgSend(v9, "albums");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v10);

        if (!v12)
        {
          v13 = 0;
          goto LABEL_20;
        }
LABEL_6:
        v13 = v9;
LABEL_20:

        goto LABEL_21;
      }
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v7, "assets", 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v20;
LABEL_11:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v10);
          if (*(void **)(*((_QWORD *)&v19 + 1) + 8 * v17) == v9)
            goto LABEL_6;
          if (v15 == ++v17)
          {
            v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            if (v15)
              goto LABEL_11;
            break;
          }
        }
      }

    }
    v13 = 0;
    goto LABEL_21;
  }
  v13 = 0;
LABEL_22:

  return v13;
}

- (void)_userDeleteAssets:(id)a3 withReason:(id)a4 localOnlyDelete:(BOOL)a5
{
  uint64_t v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  id v40;
  unsigned int v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v5 = a5;
  v57 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  v41 = v5;
  v40 = v7;
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v51 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        if (objc_msgSend(v14, "isCloudSharedAsset"))
        {
          if (!v11)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v14, "cloudShareAlbum");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "cloudGUID");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v15)
            v18 = v16 == 0;
          else
            v18 = 1;
          if (!v18)
          {
            objc_msgSend(v11, "objectForKey:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKey:", CFSTR("albumAssets"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKey:", v15, CFSTR("album"));
              objc_msgSend(v21, "setObject:forKey:", v20, CFSTR("albumAssets"));
              objc_msgSend(v11, "setObject:forKey:", v21, v17);

            }
            objc_msgSend(v20, "addObject:", v14);

            v5 = v41;
            v7 = v40;
          }

        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }
  -[PLPhotoLibrary libraryBundle](self, "libraryBundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isSystemPhotoLibrary");

  if (v23 && v11)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v24 = v11;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v47 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(v24, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          if (v29)
          {
            objc_msgSend(v29, "objectForKey:", CFSTR("albumAssets"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKey:", CFSTR("album"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLPhotoSharingHelper deleteCloudSharedAssetsFromServer:inSharedAlbum:](PLPhotoSharingHelper, "deleteCloudSharedAssetsFromServer:inSharedAlbum:", v31, v32);

          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      }
      while (v26);
    }

    v5 = v41;
    v7 = v40;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v33 = v7;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v43 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * k);
        objc_msgSend(v38, "setLocalOnlyDelete:", v5);
        objc_msgSend(v38, "deleteWithReason:", v8);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v35);
  }

}

- (void)_filterAssets:(id)a3 toTrashableAssets:(id *)a4 deletableAssets:(id *)a5 otherAssets:(id *)a6
{
  id v9;
  id *v10;
  id *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char v18;
  id *v19;
  id *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (a4)
  {
    v10 = (id *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a5)
    {
LABEL_3:
      v11 = (id *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      goto LABEL_6;
    }
  }
  else
  {
    v10 = 0;
    if (a5)
      goto LABEL_3;
  }
  v11 = 0;
LABEL_6:
  v20 = a6;
  if (a6)
    a6 = (id *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "canMoveToTrash");
        v19 = v10;
        if ((v18 & 1) == 0)
        {
          if (objc_msgSend(v17, "canPerformEditOperation:", 4))
            v19 = v11;
          else
            v19 = a6;
        }
        objc_msgSend(v19, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v10);
  if (a5)
    *a5 = objc_retainAutorelease(v11);
  if (v20)
    *v20 = objc_retainAutorelease(a6);

}

- (void)_userApplyTrashedState:(signed __int16)a3 toAssets:(id)a4 localOnlyDelete:(BOOL)a5 trashedReason:(unsigned __int16)a6 expungeReasonFromClient:(id)a7
{
  uint64_t v8;
  _BOOL8 v9;
  unsigned int v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _BOOL8 v32;
  uint64_t v33;
  PLAvalanche *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  PLAvalanche *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  PLAvalanche *v42;
  void *v43;
  void *v44;
  PLAvalanche *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  PLAvalanche *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  unsigned int v67;
  id v68;
  void *v69;
  id obj;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  id v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v8 = a6;
  v9 = a5;
  v10 = a3;
  v93 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v66 = a7;
  v87 = 0;
  v88 = 0;
  v64 = v12;
  -[PLPhotoLibrary _filterAssets:toTrashableAssets:deletableAssets:otherAssets:](self, "_filterAssets:toTrashableAssets:deletableAssets:otherAssets:", v12, &v88, &v87, 0);
  v13 = v88;
  v14 = v87;
  v67 = v10;
  if ((unsigned __int16)(v10 - 1) <= 1u)
  {
    +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", CFSTR("[_userApplyTrashedState]Directly deleting assets whose state is either trashed or expunged, and types that never make it to the trash bin."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibrary _userDeleteAssets:withReason:localOnlyDelete:](self, "_userDeleteAssets:withReason:localOnlyDelete:", v14, v15, v9);

  }
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v16 = v13;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
  v63 = v14;
  if (!v17)
  {
    v19 = 0;
    v20 = 0;
    goto LABEL_21;
  }
  v18 = v17;
  v19 = 0;
  v20 = 0;
  v21 = *(_QWORD *)v84;
  do
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v84 != v21)
        objc_enumerationMutation(v16);
      v23 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
      if (objc_msgSend(v23, "isAvalancheStackPhoto"))
      {
        if (v20)
        {
          v24 = v20;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v24;
        }
      }
      else
      {
        if (!objc_msgSend(v23, "isAvalanchePhoto"))
          continue;
        if (v19)
        {
          v24 = v19;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v24;
        }
      }
      objc_msgSend(v24, "addObject:", v23);
    }
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
  }
  while (v18);
LABEL_21:
  v69 = v19;

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v16;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
  v26 = v66;
  v27 = v67;
  if (!v25)
    goto LABEL_38;
  v28 = v25;
  v29 = *(_QWORD *)v80;
  v65 = v20;
  while (2)
  {
    v30 = 0;
    while (2)
    {
      if (*(_QWORD *)v80 != v29)
        objc_enumerationMutation(obj);
      v31 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v30);
      objc_msgSend(v31, "setLocalOnlyDelete:", v9);
      if (!objc_msgSend(v31, "isPartOfBurst") || !objc_msgSend(v69, "containsObject:", v31))
      {
        if (objc_msgSend(v31, "isPartOfBurst") && objc_msgSend(v20, "containsObject:", v31))
        {
          v42 = [PLAvalanche alloc];
          objc_msgSend(v31, "avalancheUUID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "photoLibrary");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = -[PLAvalanche initWithUUID:photoLibrary:](v42, "initWithUUID:photoLibrary:", v43, v44);

          v27 = v67;
          -[PLAvalanche applyTrashedState:withTrashedReason:](v45, "applyTrashedState:withTrashedReason:", v67, v8);

          goto LABEL_36;
        }
        goto LABEL_35;
      }
      if ((objc_msgSend(v31, "avalanchePickType") & 8) == 0)
      {
LABEL_35:
        objc_msgSend(v31, "applyTrashedState:withTrashedReason:expungeReasonFromClient:", v27, v8, v26);
        goto LABEL_36;
      }
      v32 = v9;
      v33 = v8;
      v34 = [PLAvalanche alloc];
      objc_msgSend(v31, "avalancheUUID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "photoLibrary");
      v36 = v27;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[PLAvalanche initWithUUID:photoLibrary:](v34, "initWithUUID:photoLibrary:", v35, v37);

      -[PLAvalanche stackAsset](v38, "stackAsset");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (v39)
        v36 = objc_msgSend(v39, "trashedState");
      v41 = v36;
      v8 = v33;
      objc_msgSend(v31, "applyTrashedState:withTrashedReason:expungeReasonFromClient:", v41, v33, v66);

      v26 = v66;
      v27 = v67;
      v9 = v32;
      v20 = v65;
LABEL_36:
      if (v28 != ++v30)
        continue;
      break;
    }
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
    if (v28)
      continue;
    break;
  }
LABEL_38:

  if ((_DWORD)v27 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v47 = v69;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v75, v90, 16);
    if (v48)
    {
      v49 = v48;
      v50 = 0;
      v51 = *(_QWORD *)v76;
      do
      {
        for (j = 0; j != v49; ++j)
        {
          if (*(_QWORD *)v76 != v51)
            objc_enumerationMutation(v47);
          v53 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
          +[PLAvalanche removeFavoriteStatus:](PLAvalanche, "removeFavoriteStatus:", v53);
          if (objc_msgSend(v53, "isPartOfBurst"))
          {
            objc_msgSend(v53, "avalancheUUID");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "addObject:", v54);

            if (!v50)
            {
              objc_msgSend(v53, "photoLibrary");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v75, v90, 16);
      }
      while (v49);
    }
    else
    {
      v50 = 0;
    }

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v68 = v46;
    v55 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v71, v89, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v72;
      do
      {
        for (k = 0; k != v56; ++k)
        {
          if (*(_QWORD *)v72 != v57)
            objc_enumerationMutation(v68);
          v59 = -[PLAvalanche initWithUUID:photoLibrary:]([PLAvalanche alloc], "initWithUUID:photoLibrary:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * k), v50);
          -[PLAvalanche assets](v59, "assets");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "array");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = +[PLAvalanche revalidateAvalancheAssets:inLibrary:deleteNonPicks:allowDissolve:](PLAvalanche, "revalidateAvalancheAssets:inLibrary:deleteNonPicks:allowDissolve:", v61, v50, 0, 1);

        }
        v56 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v71, v89, 16);
      }
      while (v56);
    }

    v26 = v66;
  }

}

- (void)userTrashAssets:(id)a3 withTrashedReason:(unsigned __int16)a4
{
  -[PLPhotoLibrary _userApplyTrashedState:toAssets:localOnlyDelete:trashedReason:expungeReasonFromClient:](self, "_userApplyTrashedState:toAssets:localOnlyDelete:trashedReason:expungeReasonFromClient:", 1, a3, 0, a4, 0);
}

- (void)userUntrashAssets:(id)a3
{
  -[PLPhotoLibrary _userApplyTrashedState:toAssets:localOnlyDelete:trashedReason:expungeReasonFromClient:](self, "_userApplyTrashedState:toAssets:localOnlyDelete:trashedReason:expungeReasonFromClient:", 0, a3, 0, 0, 0);
}

- (void)userExpungeAssets:(id)a3 localOnlyDelete:(BOOL)a4 expungeReasonFromClient:(id)a5
{
  id v6;

  -[PLPhotoLibrary _userApplyTrashedState:toAssets:localOnlyDelete:trashedReason:expungeReasonFromClient:](self, "_userApplyTrashedState:toAssets:localOnlyDelete:trashedReason:expungeReasonFromClient:", 2, a3, a4, 0, a5);
  -[PLPhotoLibrary libraryBundle](self, "libraryBundle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "touch");

}

- (void)_inq_createPhotoStreamAlbumStreamID:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  PLPhotoLibrary *v7;

  v4 = a3;
  if (PLIsAssetsd())
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__PLPhotoLibrary__inq_createPhotoStreamAlbumStreamID___block_invoke;
    v5[3] = &unk_1E3677C18;
    v6 = v4;
    v7 = self;
    -[PLPhotoLibrary performTransactionAndWait:](self, "performTransactionAndWait:", v5);

  }
}

- (void)createPhotoStreamAlbumWithStreamID:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 1395, CFSTR("Only Assetsd should be creating the photostream album!"));

  }
  -[PLPhotoLibrary _inq_createPhotoStreamAlbumStreamID:](self, "_inq_createPhotoStreamAlbumStreamID:", v6);

}

- (id)assetURLForPhoto:(id)a3 extension:(id)a4
{
  return (id)objc_msgSend(a3, "assetURLWithExtension:", a4);
}

- (id)assetURLForPhoto:(id)a3
{
  return (id)objc_msgSend(a3, "assetURL");
}

- (id)photoFromAssetURL:(id)a3
{
  return +[PLManagedAsset photoFromAssetURL:photoLibrary:](PLManagedAsset, "photoFromAssetURL:photoLibrary:", a3, self);
}

- (id)albumFromGroupURL:(id)a3
{
  return +[PLGenericAlbum albumFromGroupURL:photoLibrary:](PLGenericAlbum, "albumFromGroupURL:photoLibrary:", a3, self);
}

- (PLGlobalValues)globalValues
{
  PLGlobalValues *v3;
  void *v4;
  PLGlobalValues *v5;

  v3 = [PLGlobalValues alloc];
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLGlobalValues initWithManagedObjectContext:](v3, "initWithManagedObjectContext:", v4);

  return v5;
}

- (BOOL)deleteAllDiagnosticFiles:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char v18;
  id v19;
  BOOL v20;
  void *v22;
  id *v23;
  id v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFetchBatchSize:", 100);
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v7, &v30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v30;

  if (!v9)
  {
    v20 = 0;
    if (!a3)
      goto LABEL_22;
    goto LABEL_21;
  }
  v11 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v13)
  {
    v14 = v13;
    v22 = v7;
    v23 = a3;
    v15 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "pathForDiagnosticFile", v22, v23);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        if (v17 && objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v17, &v25))
        {
          if (v25)
          {
            v19 = v10;
LABEL_18:

            v20 = 0;
            v10 = v19;
            goto LABEL_19;
          }
          v24 = v10;
          v18 = objc_msgSend(v11, "removeItemAtPath:error:", v17, &v24);
          v19 = v24;

          v10 = v19;
          if ((v18 & 1) == 0)
            goto LABEL_18;
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v14)
        continue;
      break;
    }
    v20 = 1;
LABEL_19:
    v7 = v22;
    a3 = v23;
  }
  else
  {
    v20 = 1;
  }

  if (a3)
LABEL_21:
    *a3 = objc_retainAutorelease(v10);
LABEL_22:

  return v20;
}

- (void)_deleteObsoleteMetadataFiles
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  int v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id obj;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  id v40;
  PLPhotoLibrary *v41;
  uint8_t buf[4];
  int v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrary thumbnailManager](self, "thumbnailManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObsoleteMetadata");

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __46__PLPhotoLibrary__deleteObsoleteMetadataFiles__block_invoke;
  v38[3] = &unk_1E3660798;
  v10 = v5;
  v39 = v10;
  v11 = v3;
  v40 = v11;
  v41 = self;
  v25 = (void *)v8;
  v12 = (id)objc_msgSend(v9, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v8, 0, v38);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v28 = v10;
  objc_msgSend(v10, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
  v13 = 0;
  if (v29)
  {
    v27 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v28, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contentsOfDirectoryAtPath:error:", v15, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v31;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v31 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
              if ((objc_msgSend(v16, "containsObject:", v22) & 1) == 0)
              {
                objc_msgSend(v15, "stringByAppendingPathComponent:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                ++v13;
                objc_msgSend(v11, "removeItemAtPath:error:", v23, 0);

              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
          }
          while (v19);
        }

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    }
    while (v29);
  }

  PLMigrationGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v43 = v13;
    _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "Removed %d obsolete metadata files", buf, 8u);
  }

}

- (void)cleanupAfterImportAllDCIMAssets
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (!-[PLPhotoLibrary isCloudPhotoLibraryEnabled](self, "isCloudPhotoLibraryEnabled"))
  {
    PLMigrationGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Removing obsolete metadata files", v5, 2u);
    }

    -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLInternalResource deleteObsoleteResourcesInManagedObjectContext:error:](PLInternalResource, "deleteObsoleteResourcesInManagedObjectContext:error:", v4, 0);

    -[PLPhotoLibrary _deleteObsoleteMetadataFiles](self, "_deleteObsoleteMetadataFiles");
  }
}

- (void)_safeSave:(id)a3
{
  -[PLPhotoLibrary safeSave:error:](self, "safeSave:error:", a3, 0);
}

- (BOOL)safeSave:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = 0;
  v6 = objc_msgSend(v5, "save:", &v11);
  v7 = v11;
  if ((v6 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Save failed. We might lose data. Rolling back any changes. (%{public}@)", buf, 0xCu);
    }

    objc_msgSend(v5, "rollback");
    if (a4)
    {
      v7 = objc_retainAutorelease(v7);
      v8 = 0;
      *a4 = v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)batchDeleteAssets:(id)a3 withReason:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibrary batchDeleteAssetsWithPredicate:reason:error:](self, "batchDeleteAssetsWithPredicate:reason:error:", v7, v6, 0);

  }
}

- (id)_fetchedObjectsForDeleteWithEntity:(id)a3 predicate:(id)a4 batchSize:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a4;
  v11 = a3;
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(v13, "setEntity:", v11);
  objc_msgSend(v13, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v13, "setFetchBatchSize:", a5);
  objc_msgSend(v11, "relationshipsByName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRelationshipKeyPathsForPrefetching:", v15);

  objc_msgSend(v13, "setPredicate:", v10);
  objc_msgSend(v12, "executeFetchRequest:error:", v13, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)batchDeleteAssetsWithPredicate:(id)a3 reason:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  _BOOL4 v23;
  id v24;
  char v25;
  NSObject *v26;
  void *v28;
  id v29;
  void *v30;
  id *v31;
  id v32;
  PLPhotoLibrary *v33;
  void *v34;
  void *context;
  id v36;
  id v37;
  uint8_t buf[4];
  unint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 1625, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetsPredicate"));

  }
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedObject entityInManagedObjectContext:](PLManagedAsset, "entityInManagedObjectContext:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  -[PLPhotoLibrary _fetchedObjectsForDeleteWithEntity:predicate:batchSize:error:](self, "_fetchedObjectsForDeleteWithEntity:predicate:batchSize:error:", v11, v9, 100, &v37);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v37;
  if (v12)
  {
    v14 = objc_msgSend(v12, "count");
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "reason");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v39 = v14;
      v40 = 2114;
      v41 = v16;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Batch deleting %ld assets: %{public}@", buf, 0x16u);

    }
    if (v14)
    {
      v32 = v9;
      v33 = self;
      v29 = v13;
      v30 = v11;
      v31 = a5;
      v17 = 0;
      v18 = 0;
      do
      {
        context = (void *)MEMORY[0x19AEC1554]();
        v19 = 0;
        do
        {
          objc_msgSend(v12, "objectAtIndex:", v18 + v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "deleteWithReason:", v10);

          v21 = v19 + 1;
          v22 = v18 + v19 + 1;
          if (v19 > 0x62)
            break;
          ++v19;
        }
        while (v22 < v14);
        v36 = v17;
        v23 = -[PLPhotoLibrary safeSave:error:](v33, "safeSave:error:", v34, &v36);
        v24 = v36;

        objc_autoreleasePoolPop(context);
        if (!v23)
          break;
        v18 += v21;
        v17 = v24;
      }
      while (v22 < v14);
      v9 = v32;
      if (v31)
        v25 = v23;
      else
        v25 = 1;
      if ((v25 & 1) == 0)
      {
        v24 = objc_retainAutorelease(v24);
        LOBYTE(v23) = 0;
        *v31 = v24;
      }
      v13 = v29;
      v11 = v30;
    }
    else
    {
      v24 = 0;
      LOBYTE(v23) = 1;
    }

  }
  else
  {
    PLBackendGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = (unint64_t)v13;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "could not batch fault in to-be-deleted assets: %@", buf, 0xCu);
    }

    LOBYTE(v23) = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v13);
  }

  return v23;
}

- (BOOL)batchDeleteObjectsWithEntity:(id)a3 predicate:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  _BOOL4 v23;
  id v24;
  char v25;
  NSObject *v26;
  void *v28;
  id v29;
  id *v30;
  id v31;
  id v32;
  PLPhotoLibrary *v33;
  void *context;
  id v35;
  id v36;
  uint8_t buf[4];
  unint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 1664, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate"));

  }
  v36 = 0;
  -[PLPhotoLibrary _fetchedObjectsForDeleteWithEntity:predicate:batchSize:error:](self, "_fetchedObjectsForDeleteWithEntity:predicate:batchSize:error:", v9, v10, 100, &v36);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v36;
  if (v11)
  {
    v13 = objc_msgSend(v11, "count");
    if ((PLIsSuppressingLogsForUnitTesting() & 1) == 0)
    {
      PLBackendGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v38 = v13;
        v39 = 2114;
        v40 = v15;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Batch deleting %ld %{public}@", buf, 0x16u);

      }
    }
    -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v32 = v9;
      v33 = self;
      v29 = v12;
      v30 = a5;
      v31 = v10;
      v17 = 0;
      v18 = 0;
      do
      {
        context = (void *)MEMORY[0x19AEC1554]();
        v19 = 0;
        do
        {
          objc_msgSend(v11, "objectAtIndex:", v18 + v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "deleteObject:", v20);

          v21 = v19 + 1;
          v22 = v18 + v19 + 1;
          if (v19 > 0x62)
            break;
          ++v19;
        }
        while (v22 < v13);
        v35 = v17;
        v23 = -[PLPhotoLibrary safeSave:error:](v33, "safeSave:error:", v16, &v35);
        v24 = v35;

        objc_autoreleasePoolPop(context);
        if (!v23)
          break;
        v18 += v21;
        v17 = v24;
      }
      while (v22 < v13);
      if (v30)
        v25 = v23;
      else
        v25 = 1;
      v9 = v32;
      if ((v25 & 1) == 0)
      {
        v24 = objc_retainAutorelease(v24);
        LOBYTE(v23) = 0;
        *v30 = v24;
      }
      v10 = v31;
      v12 = v29;
    }
    else
    {
      v24 = 0;
      LOBYTE(v23) = 1;
    }

  }
  else
  {
    PLBackendGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v38 = (unint64_t)v12;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Failed to fetch objects to be deleted: %{public}@", buf, 0xCu);
    }

    LOBYTE(v23) = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }

  return v23;
}

- (id)_fetchCompleteAssetIDsWithValidatedSavedAssetTypeMask:(unsigned __int16)a3 context:(id)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  id v22;
  _QWORD v23[3];

  v4 = a3;
  v23[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C97B48];
  v6 = a4;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != 0"), CFSTR("complete"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", v4, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPredicate:", v13);
  objc_msgSend(v8, "setResultType:", 1);
  objc_msgSend(v8, "setIncludesPropertyValues:", 0);
  v18 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v8, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v18;
  if (!v14)
  {
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v20 = v4;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to get complete assets with type mask 0x%x: %@", buf, 0x12u);
    }

  }
  return v14;
}

- (void)dataMigratorSupportCleanupModelForDataMigrationPurgeMissingSynced
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  PLPhotoLibrary *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PLPhotoLibrary pathManager](self, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iTunesSyncedAssetsDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLMigrationGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v16 = "-[PLPhotoLibrary dataMigratorSupportCleanupModelForDataMigrationPurgeMissingSynced]";
    v17 = 2048;
    v18 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: %lu synced", buf, 0x16u);
  }

  if (!objc_msgSend(v6, "count"))
  {
    -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83__PLPhotoLibrary_dataMigratorSupportCleanupModelForDataMigrationPurgeMissingSynced__block_invoke;
    v11[3] = &unk_1E3677530;
    v12 = v6;
    v13 = self;
    v14 = v8;
    v9 = v8;
    -[PLPhotoLibrary performBlockAndWait:](self, "performBlockAndWait:", v11);

  }
  PLMigrationGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v16 = "-[PLPhotoLibrary dataMigratorSupportCleanupModelForDataMigrationPurgeMissingSynced]";
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s finished", buf, 0xCu);
  }

}

- (void)cleanupIncompleteAssetsAfterOTARestore
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  PLPhotoLibrary *v30;
  char v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  PLMigrationGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Cleanup incomplete assets after OTA restore", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLPhotoLibrary cleanupIncompleteAssetsAfterOTARestore]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x19AEC1554]();
  v8 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setFetchBatchSize:", 100);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("complete == 0"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  v37[0] = CFSTR("master");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRelationshipKeyPathsForPrefetching:", v12);

  v32 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v10, &v32);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v32;
  if (!v13)
  {
    PLMigrationGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v16;
      v35 = 2114;
      v36 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch incomplete assets %{public}@", buf, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v7);
  v17 = objc_msgSend(v13, "count");
  v18 = MEMORY[0x1E0C809B0];
  if (v17)
  {
    PLMigrationGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v34) = v20;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Found %d incomplete assets", buf, 8u);
    }

    -[PLPhotoLibrary libraryServicesManager](self, "libraryServicesManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "modelMigrator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "deviceRestoreMigrationSupport");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isRestoreFromBackupSourceMegaBackup");

    v28[0] = v18;
    v28[1] = 3221225472;
    v28[2] = __56__PLPhotoLibrary_cleanupIncompleteAssetsAfterOTARestore__block_invoke;
    v28[3] = &unk_1E36607C0;
    v31 = v24;
    v29 = v26;
    v30 = self;
    v25 = (id)objc_msgSend(v6, "enumerateWithIncrementalSaveUsingObjects:shouldRefreshAfterSave:withBlock:", v13, 1, v28);

  }
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __56__PLPhotoLibrary_cleanupIncompleteAssetsAfterOTARestore__block_invoke_496;
  v27[3] = &unk_1E3677AA0;
  v27[4] = self;
  -[PLPhotoLibrary performTransactionAndWait:](self, "performTransactionAndWait:", v27);
  objc_msgSend(v5, "stillAlive");

}

- (void)repairSingletonObjects
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((PLIsAssetsd() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    objc_msgSend(WeakRetained, "modelMigrator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "repairSingletonObjectsInDatabase");

  }
  else
  {
    -[PLPhotoLibrary assetsdClient](self, "assetsdClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "libraryClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v6 = objc_msgSend(v5, "synchronouslyRepairSingletonObjectsWithError:", &v10);
    v7 = v10;

    if ((v6 & 1) == 0)
    {
      PLBackendGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Error asking assetsd to repair singleton objects: %@", buf, 0xCu);
      }

    }
  }
}

- (id)managedObjectContextStoreUUID
{
  void *v2;
  void *v3;

  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)invalidateWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateWithReason:", v4);

}

- (BOOL)isUnitTesting
{
  return 0;
}

- (void)recreateAlbumsAndPersonsFromMetadata
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
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E98];
  -[PLPhotoLibrary pathManager](self, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateDirectoryWithSubType:createIfNeeded:error:", 4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E98];
  -[PLPhotoLibrary pathManager](self, "pathManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "privateDirectoryWithSubType:createIfNeeded:error:", 5, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:isDirectory:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v6;
  v12[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrary _recreateItemsFromMetadataAtDirectoryURLs:includeAlbums:](self, "_recreateItemsFromMetadataAtDirectoryURLs:includeAlbums:", v11, 1);

}

- (void)recreateMemoriesAndPersonsFromMetadata
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
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E98];
  -[PLPhotoLibrary pathManager](self, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateDirectoryWithSubType:createIfNeeded:error:", 4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E98];
  -[PLPhotoLibrary pathManager](self, "pathManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "privateDirectoryWithSubType:createIfNeeded:error:", 5, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:isDirectory:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v6;
  v12[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrary _recreateItemsFromMetadataAtDirectoryURLs:includeAlbums:](self, "_recreateItemsFromMetadataAtDirectoryURLs:includeAlbums:", v11, 0);

}

- (void)recreatePersonsFromMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E98];
  -[PLPhotoLibrary pathManager](self, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateDirectoryWithSubType:createIfNeeded:error:", 5, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoLibrary _recreateItemsFromMetadataAtDirectoryURLs:includeAlbums:](self, "_recreateItemsFromMetadataAtDirectoryURLs:includeAlbums:", v7, 0);
}

- (void)_deleteEmptyImportAlbumsWithAddedAlbums:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Album"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E3763218, "arrayByAddingObject:", &unk_1E375D3E0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(kind in %@) AND (assets.@count = 0)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v6);

  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v4, &v33);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v33;

  if (v8)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v10 = v8;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v11)
    {
      v12 = v11;
      v24 = v9;
      v25 = v8;
      v26 = v5;
      v27 = v4;
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v15, "kind");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(&unk_1E3763218, "containsObject:", v17);

          if (!v18
            || objc_msgSend(v28, "containsObject:", v15)
            && (objc_msgSend(v15, "assets"),
                v19 = (void *)objc_claimAutoreleasedReturnValue(),
                v20 = objc_msgSend(v19, "count"),
                v19,
                !v20))
          {
            PLMigrationGetLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v15, "uuid");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "kind");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v35 = v22;
              v36 = 2112;
              v37 = v23;
              _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Deleting empty album %@ of kind %@", buf, 0x16u);

            }
            objc_msgSend(v15, "delete");
          }
          objc_autoreleasePoolPop(v16);
        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v12);
      v5 = v26;
      v4 = v27;
      v9 = v24;
      v8 = v25;
    }
  }
  else
  {
    PLMigrationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Error fetching empty albums for cleanup %@", buf, 0xCu);
    }
  }

}

- (void)_recreateItemsFromMetadataAtDirectoryURLs:(id)a3 includeAlbums:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  _UNKNOWN **v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  PLPersistedAlbumMetadata *v20;
  PLPersistedAlbumMetadata *v21;
  void *v22;
  uint64_t v23;
  char v24;
  int v25;
  int v26;
  NSObject *v27;
  PLPersistedPersonMetadata *v28;
  void *v29;
  NSObject *v30;
  const __CFString *v31;
  void *v32;
  NSObject *v33;
  PLPersistedPersonMetadata *v34;
  void *v35;
  int v36;
  int v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  const __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  PLPersistedFolderMetadata *v53;
  PLPersistedFolderMetadata *v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  PLPersistedPersonMetadata *v63;
  NSObject *v64;
  os_log_type_t v65;
  const char *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  char v70;
  NSObject *v71;
  PLPersistedPersonMetadata *v72;
  PLPersistedAlbumMetadata *v73;
  NSObject *v74;
  const char *v75;
  void *v76;
  BOOL v77;
  NSObject *v78;
  PLPersistedPersonMetadata *v79;
  void *v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t i;
  PLPersistedPersonMetadata *v88;
  NSObject *v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t j;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t k;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t m;
  uint64_t v111;
  void *v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t n;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  char v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t ii;
  void *v128;
  void *v129;
  PLPersistedMemoryMetadata *v130;
  PLPersistedMemoryMetadata *v131;
  void *v132;
  void *v133;
  _BOOL4 v134;
  void *v135;
  NSObject *v136;
  PLPersistedPersonMetadata *v137;
  NSObject *v138;
  NSObject *v139;
  NSObject *v140;
  NSObject *v141;
  char v142;
  PLPersistedAlbumMetadata *v143;
  NSObject *v144;
  PLPersistedPersonMetadata *v145;
  PLPhotoLibrary *v146;
  void *v147;
  void *v148;
  NSObject *v149;
  void *v150;
  uint64_t v151;
  PLPersistedPersonMetadata *v152;
  void *v153;
  NSObject *v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  void *v161;
  PLPersistedPersonMetadata *v162;
  PLPersistedPersonMetadata *v163;
  void *v164;
  NSObject *v165;
  PLPersistedPersonMetadata *v166;
  NSObject *v167;
  os_log_type_t v168;
  const char *v169;
  uint32_t v170;
  NSObject *v171;
  PLPersistedPersonMetadata *v172;
  NSObject *v173;
  uint64_t v174;
  NSObject *v175;
  _BOOL4 v176;
  NSObject *v177;
  unint64_t v178;
  unint64_t v179;
  uint64_t v180;
  NSObject *v181;
  char v182;
  PLPersistedAlbumMetadata *v183;
  NSObject *v184;
  PLPersistedPersonMetadata *v185;
  uint64_t v186;
  PLPersistedPersonMetadata *v187;
  char v188;
  NSObject *v189;
  NSObject *v190;
  NSObject *v191;
  int v192;
  void *v193;
  id v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t jj;
  uint64_t v199;
  NSObject *v200;
  id v201;
  void *v202;
  void *v203;
  void *v204;
  id v205;
  id v206;
  void *v207;
  void *v208;
  PLPersistedPersonMetadata *v209;
  unint64_t v210;
  PLPersistedFolderMetadata *v211;
  id v212;
  id v213;
  char v214;
  PLPersistedFolderMetadata *v215;
  void *v216;
  unsigned int v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  id v223;
  id v224;
  id v225;
  id v226;
  id v227;
  id obj;
  id v229;
  _BOOL4 v230;
  PLPhotoLibrary *v231;
  void *v232;
  void *v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  id v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  id v243;
  id v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  id v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  _QWORD v278[4];
  id v279;
  id v280;
  id v281;
  id v282;
  id v283;
  BOOL v284;
  _BYTE v285[128];
  _BYTE v286[128];
  _BYTE v287[128];
  _BYTE v288[128];
  _BYTE v289[128];
  _BYTE v290[128];
  _BYTE v291[128];
  _BYTE v292[128];
  uint8_t v293[128];
  uint8_t buf[4];
  PLPersistedPersonMetadata *v295;
  __int16 v296;
  PLPersistedAlbumMetadata *v297;
  _BYTE v298[128];
  uint64_t v299;

  v299 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v230 = -[PLPhotoLibrary isCloudPhotoLibraryEnabled](self, "isCloudPhotoLibraryEnabled");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = objc_msgSend(v232, "hasChanges");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v225 = (id)objc_claimAutoreleasedReturnValue();
  v278[0] = MEMORY[0x1E0C809B0];
  v278[1] = 3221225472;
  v278[2] = __74__PLPhotoLibrary__recreateItemsFromMetadataAtDirectoryURLs_includeAlbums___block_invoke;
  v278[3] = &unk_1E36607E8;
  v284 = a4;
  v12 = v8;
  v279 = v12;
  v223 = v9;
  v280 = v223;
  v213 = v7;
  v281 = v213;
  v212 = v10;
  v282 = v212;
  v206 = v11;
  v283 = v206;
  v231 = self;
  v204 = v6;
  -[PLPhotoLibrary _enumerateFilesAtURLs:withBlock:](self, "_enumerateFilesAtURLs:withBlock:", v6, v278);
  objc_msgSend(v12, "sortUsingComparator:", &__block_literal_global_538);
  v276 = 0u;
  v277 = 0u;
  v274 = 0u;
  v275 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v274, v298, 16);
  v14 = &off_1E3659000;
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v275;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v275 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v274 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x19AEC1554]();
        v20 = -[PLPersistedAlbumMetadata initWithPersistedDataAtURL:]([PLPersistedAlbumMetadata alloc], "initWithPersistedDataAtURL:", v18);
        v21 = v20;
        if (!v20)
        {
          PLMigrationGetLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v18, "path");
            v28 = (PLPersistedPersonMetadata *)(id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v295 = v28;
            _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Failed to read invalid or missing metadata, will skip and delete %@", buf, 0xCu);

          }
LABEL_11:

LABEL_26:
          objc_msgSend(v18, "path");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v233, "addObject:", v32);
          goto LABEL_27;
        }
        -[PLPersistedAlbumMetadata kind](v20, "kind");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "integerValue");

        v24 = objc_msgSend(v14[381], "isUserCreatedForKind:", v23);
        v25 = objc_msgSend(v14[381], "isSmartAlbumForKind:", v23);
        if (v230)
          v26 = objc_msgSend(v14[381], "is1WaySyncKind:", v23);
        else
          v26 = 0;
        if ((_DWORD)v23 == 1508)
        {
          -[PLPersistedAlbumMetadata projectDocumentType](v21, "projectDocumentType");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v24 & 1) == 0 && ((v25 | v26) & 1) != 0)
            goto LABEL_21;
          if (!v29)
          {
            PLMigrationGetLog();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v295 = (PLPersistedPersonMetadata *)v21;
              _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Found invalid project album metadata will skip and delete %@", buf, 0xCu);
            }
            goto LABEL_11;
          }
        }
        else if ((v24 & 1) == 0 && v25 | v26)
        {
LABEL_21:
          PLMigrationGetLog();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v31 = CFSTR("orphaned iTunes sync album");
            if (v25)
              v31 = CFSTR("smart album");
            v295 = (PLPersistedPersonMetadata *)v31;
            v296 = 2112;
            v297 = v21;
            _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "Found metadata for a invalid album kind: %@, will skip and delete %@", buf, 0x16u);
          }

          goto LABEL_26;
        }
        PLMigrationGetLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v18, "path");
          v34 = (PLPersistedPersonMetadata *)(id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v295 = v34;
          _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEBUG, "Processing album metadata from %@", buf, 0xCu);

        }
        -[PLPersistedAlbumMetadata uuid](v21, "uuid");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLGenericAlbum albumWithUUID:inLibrary:](PLGenericAlbum, "albumWithUUID:inLibrary:", v35, v231);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = objc_msgSend(v32, "isSmartAlbum");
        if (!v32)
        {
          v37 = v36;
          -[PLPersistedAlbumMetadata cloudGUID](v21, "cloudGUID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLGenericAlbum albumWithCloudGUID:inLibrary:](PLGenericAlbum, "albumWithCloudGUID:inLibrary:", v38, v231);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          -[PLPersistedAlbumMetadata cloudGUID](v21, "cloudGUID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          PLMigrationGetLog();
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = v40;
          if (v39 && v32)
          {
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v295 = (PLPersistedPersonMetadata *)v21;
              _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_ERROR, "Found album with the same cloudGUID will skip and delete %@", buf, 0xCu);
            }

            objc_msgSend(v18, "path");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v233, "addObject:", v42);

          }
          else
          {
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v43 = &stru_1E36789C0;
              if (v37)
                v43 = CFSTR(" smart");
              v295 = (PLPersistedPersonMetadata *)v43;
              v296 = 2112;
              v297 = v21;
              _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_DEFAULT, "Creating new%@ album from metadata %@", buf, 0x16u);
            }

            -[PLPersistedAlbumMetadata insertAlbumFromDataInManagedObjectContext:](v21, "insertAlbumFromDataInManagedObjectContext:", v232);
            v44 = objc_claimAutoreleasedReturnValue();

            if (v44)
            {
              objc_msgSend(v219, "addObject:", v44);
              if ((v37 & 1) == 0)
                -[PLPersistedAlbumMetadata updateChildrenOrderingInAlbum:includePendingAssetChanges:](v21, "updateChildrenOrderingInAlbum:includePendingAssetChanges:", v44, v217);
              v32 = (void *)v44;
            }
            else
            {
              v32 = 0;
            }
          }
        }
LABEL_27:

        objc_autoreleasePoolPop(v19);
        ++v17;
        v14 = &off_1E3659000;
      }
      while (v15 != v17);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v274, v298, 16);
      v15 = v45;
    }
    while (v45);
  }

  +[PLGenericAlbum rootFolderInLibrary:](PLManagedFolder, "rootFolderInLibrary:", v231);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum projectAlbumRootFolderInLibrary:](PLManagedFolder, "projectAlbumRootFolderInLibrary:", v231);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v270 = 0u;
  v271 = 0u;
  v272 = 0u;
  v273 = 0u;
  v227 = v223;
  v46 = objc_msgSend(v227, "countByEnumeratingWithState:objects:count:", &v270, v293, 16);
  if (!v46)
  {
    v211 = 0;
    v215 = 0;
    v49 = v225;
    goto LABEL_97;
  }
  v47 = v46;
  v211 = 0;
  v215 = 0;
  v48 = *(_QWORD *)v271;
  v49 = v225;
  do
  {
    v50 = 0;
    do
    {
      if (*(_QWORD *)v271 != v48)
        objc_enumerationMutation(v227);
      v51 = *(void **)(*((_QWORD *)&v270 + 1) + 8 * v50);
      v52 = (void *)MEMORY[0x19AEC1554]();
      v53 = -[PLPersistedFolderMetadata initWithPersistedDataAtURL:]([PLPersistedFolderMetadata alloc], "initWithPersistedDataAtURL:", v51);
      v54 = v53;
      if (!v53)
      {
        PLMigrationGetLog();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v51, "path");
          v63 = (PLPersistedPersonMetadata *)(id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v295 = v63;
          v64 = v57;
          v65 = OS_LOG_TYPE_ERROR;
          v66 = "Failed to read invalid or missing metadata, will skip and delete %@";
          goto LABEL_64;
        }
LABEL_65:

        objc_msgSend(v51, "path");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v233, "addObject:", v62);
        goto LABEL_82;
      }
      -[PLPersistedFolderMetadata kind](v53, "kind");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "integerValue");

      if (v230 && +[PLGenericAlbum is1WaySyncKind:](PLGenericAlbum, "is1WaySyncKind:", v56))
      {
        PLMigrationGetLog();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v295 = (PLPersistedPersonMetadata *)v54;
          _os_log_impl(&dword_199541000, v57, OS_LOG_TYPE_ERROR, "Found metadata for a invalid folder kind: orphaned iTunes sync folder, will skip and delete %@", buf, 0xCu);
        }
        goto LABEL_65;
      }
      if (-[PLPersistedFolderMetadata isRootFolder](v54, "isRootFolder"))
      {
        PLMigrationGetLog();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v295 = (PLPersistedPersonMetadata *)v54;
          _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_DEBUG, "Found root folder metadata %@", buf, 0xCu);
        }

        objc_msgSend(v49, "addObject:", v54);
        -[PLPersistedFolderMetadata uuid](v54, "uuid");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v220, "uuid");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v59, "isEqualToString:", v60);

        if ((v61 & 1) != 0)
        {
          v62 = v215;
          v215 = v54;
LABEL_81:
          v49 = v225;
          goto LABEL_82;
        }
        PLMigrationGetLog();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          -[PLPersistedFolderMetadata uuid](v54, "uuid");
          v72 = (PLPersistedPersonMetadata *)(id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v220, "uuid");
          v73 = (PLPersistedAlbumMetadata *)(id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v295 = v72;
          v296 = 2112;
          v297 = v73;
          v74 = v71;
          v75 = "Root folder metadata uuid %@ doesn't match current root folder %@, will delete";
          goto LABEL_79;
        }
        goto LABEL_80;
      }
      if (-[PLPersistedFolderMetadata isProjectAlbumRootFolder](v54, "isProjectAlbumRootFolder"))
      {
        PLMigrationGetLog();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v295 = (PLPersistedPersonMetadata *)v54;
          _os_log_impl(&dword_199541000, v67, OS_LOG_TYPE_DEBUG, "Found project root folder metadata %@", buf, 0xCu);
        }

        objc_msgSend(v49, "addObject:", v54);
        -[PLPersistedFolderMetadata uuid](v54, "uuid");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v216, "uuid");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v68, "isEqualToString:", v69);

        if ((v70 & 1) != 0)
        {
          v62 = v211;
          v211 = v54;
          goto LABEL_81;
        }
        PLMigrationGetLog();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          -[PLPersistedFolderMetadata uuid](v54, "uuid");
          v72 = (PLPersistedPersonMetadata *)(id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v216, "uuid");
          v73 = (PLPersistedAlbumMetadata *)(id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v295 = v72;
          v296 = 2112;
          v297 = v73;
          v74 = v71;
          v75 = "Project Root folder metadata uuid %@ doesn't match current project root folder %@, will delete";
LABEL_79:
          _os_log_impl(&dword_199541000, v74, OS_LOG_TYPE_DEFAULT, v75, buf, 0x16u);

        }
LABEL_80:

        objc_msgSend(v51, "path");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v233, "addObject:", v62);
        goto LABEL_81;
      }
      -[PLPersistedFolderMetadata cloudGUID](v54, "cloudGUID");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v76, "isEqualToString:", CFSTR("----Project-Root-Folder----")))
      {
        v77 = -[PLPersistedFolderMetadata isProjectAlbumRootFolder](v54, "isProjectAlbumRootFolder");

        if (!v77)
        {
          PLMigrationGetLog();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            -[PLPersistedFolderMetadata uuid](v54, "uuid");
            v63 = (PLPersistedPersonMetadata *)(id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v295 = v63;
            v64 = v57;
            v65 = OS_LOG_TYPE_DEFAULT;
            v66 = "found project root album folderMetadata (uuid: %@) with incorrect folder type, will delete";
LABEL_64:
            _os_log_impl(&dword_199541000, v64, v65, v66, buf, 0xCu);

          }
          goto LABEL_65;
        }
      }
      else
      {

      }
      PLMigrationGetLog();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v51, "path");
        v79 = (PLPersistedPersonMetadata *)(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v295 = v79;
        _os_log_impl(&dword_199541000, v78, OS_LOG_TYPE_DEBUG, "Processing folder metadata from %@", buf, 0xCu);

      }
      -[PLPersistedFolderMetadata uuid](v54, "uuid");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLGenericAlbum albumWithUUID:inLibrary:](PLGenericAlbum, "albumWithUUID:inLibrary:", v80, v231);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (v62)
        goto LABEL_93;
      PLMigrationGetLog();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v295 = (PLPersistedPersonMetadata *)v54;
        _os_log_impl(&dword_199541000, v81, OS_LOG_TYPE_DEFAULT, "Creating new folder from metadata %@", buf, 0xCu);
      }

      -[PLPersistedFolderMetadata insertFolderFromDataInManagedObjectContext:](v54, "insertFolderFromDataInManagedObjectContext:", v232);
      v82 = objc_claimAutoreleasedReturnValue();
      if (v82)
      {
        v62 = (void *)v82;
        objc_msgSend(v219, "addObject:", v82);
LABEL_93:
        objc_msgSend(v221, "setObject:forKey:", v54, v62);
LABEL_82:

      }
      objc_autoreleasePoolPop(v52);
      ++v50;
    }
    while (v47 != v50);
    v83 = objc_msgSend(v227, "countByEnumeratingWithState:objects:count:", &v270, v293, 16);
    v47 = v83;
  }
  while (v83);
LABEL_97:

  v268 = 0u;
  v269 = 0u;
  v266 = 0u;
  v267 = 0u;
  v226 = v213;
  v84 = objc_msgSend(v226, "countByEnumeratingWithState:objects:count:", &v266, v292, 16);
  if (v84)
  {
    v85 = v84;
    v86 = *(_QWORD *)v267;
    do
    {
      for (i = 0; i != v85; ++i)
      {
        if (*(_QWORD *)v267 != v86)
          objc_enumerationMutation(v226);
        objc_msgSend(*(id *)(*((_QWORD *)&v266 + 1) + 8 * i), "path");
        v88 = (PLPersistedPersonMetadata *)objc_claimAutoreleasedReturnValue();
        PLMigrationGetLog();
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v295 = v88;
          _os_log_impl(&dword_199541000, v89, OS_LOG_TYPE_DEFAULT, "Processing metadata for albumlist %@", buf, 0xCu);
        }

        if (!+[PLManagedAlbumList restoreAlbumListFromPersistedDataAtPath:library:](PLManagedAlbumList, "restoreAlbumListFromPersistedDataAtPath:library:", v88, v231))
        {
          PLMigrationGetLog();
          v90 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v295 = v88;
            _os_log_impl(&dword_199541000, v90, OS_LOG_TYPE_ERROR, "Found metadata for a invalid album list kind, will skip and delete %@", buf, 0xCu);
          }

          objc_msgSend(v233, "addObject:", v88);
        }

      }
      v85 = objc_msgSend(v226, "countByEnumeratingWithState:objects:count:", &v266, v292, 16);
    }
    while (v85);
  }

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (v215)
  {
    -[PLPersistedFolderMetadata childUUIDs](v215, "childUUIDs");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "unionOrderedSet:", v93);

    objc_msgSend(v49, "removeObject:", v215);
  }
  if (v211)
  {
    -[PLPersistedFolderMetadata childUUIDs](v211, "childUUIDs");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "unionOrderedSet:", v94);

    objc_msgSend(v49, "removeObject:", v211);
  }
  v207 = v92;
  v264 = 0u;
  v265 = 0u;
  v262 = 0u;
  v263 = 0u;
  v229 = v49;
  v95 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v262, v291, 16);
  v96 = v232;
  if (v95)
  {
    v97 = v95;
    v98 = *(_QWORD *)v263;
    do
    {
      for (j = 0; j != v97; ++j)
      {
        if (*(_QWORD *)v263 != v98)
          objc_enumerationMutation(v229);
        v100 = *(void **)(*((_QWORD *)&v262 + 1) + 8 * j);
        v258 = 0u;
        v259 = 0u;
        v260 = 0u;
        v261 = 0u;
        objc_msgSend(v100, "childUUIDs");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v258, v290, 16);
        if (v102)
        {
          v103 = v102;
          v104 = *(_QWORD *)v259;
          do
          {
            for (k = 0; k != v103; ++k)
            {
              if (*(_QWORD *)v259 != v104)
                objc_enumerationMutation(v101);
              objc_msgSend(v91, "addObject:", *(_QWORD *)(*((_QWORD *)&v258 + 1) + 8 * k));
            }
            v103 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v258, v290, 16);
          }
          while (v103);
        }

      }
      v97 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v262, v291, 16);
    }
    while (v97);
  }

  if (objc_msgSend(v91, "count"))
    +[PLPersistedFolderMetadata updateChildrenOrderingInFolder:usingChildUUIDs:sourceDescription:includePendingChanges:](PLPersistedFolderMetadata, "updateChildrenOrderingInFolder:usingChildUUIDs:sourceDescription:includePendingChanges:", v220, v91, 0, 1);
  if (objc_msgSend(v207, "count"))
    +[PLPersistedFolderMetadata updateChildrenOrderingInFolder:usingChildUUIDs:sourceDescription:includePendingChanges:](PLPersistedFolderMetadata, "updateChildrenOrderingInFolder:usingChildUUIDs:sourceDescription:includePendingChanges:", v216, v207, 0, 1);
  v256 = 0u;
  v257 = 0u;
  v254 = 0u;
  v255 = 0u;
  v106 = v221;
  v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v254, v289, 16);
  if (v107)
  {
    v108 = v107;
    v109 = *(_QWORD *)v255;
    do
    {
      for (m = 0; m != v108; ++m)
      {
        if (*(_QWORD *)v255 != v109)
          objc_enumerationMutation(v106);
        v111 = *(_QWORD *)(*((_QWORD *)&v254 + 1) + 8 * m);
        objc_msgSend(v106, "objectForKey:", v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "updateChildrenOrderingInFolder:includePendingChanges:", v111, 1);

      }
      v108 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v254, v289, 16);
    }
    while (v108);
  }

  -[PLPhotoLibrary _deleteEmptyImportAlbumsWithAddedAlbums:](v231, "_deleteEmptyImportAlbumsWithAddedAlbums:", v219);
  v252 = 0u;
  v253 = 0u;
  v250 = 0u;
  v251 = 0u;
  v113 = v219;
  v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v250, v288, 16);
  if (v114)
  {
    v115 = v114;
    v116 = *(_QWORD *)v251;
    do
    {
      for (n = 0; n != v115; ++n)
      {
        if (*(_QWORD *)v251 != v116)
          objc_enumerationMutation(v113);
        v118 = *(void **)(*((_QWORD *)&v250 + 1) + 8 * n);
        if ((objc_msgSend(v118, "isRegularRootFolder") & 1) == 0
          && (objc_msgSend(v118, "isProjectAlbumRootFolder") & 1) == 0)
        {
          objc_msgSend(v118, "parentFolder");
          v119 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v119)
          {
            if (objc_msgSend(v118, "isProjectAlbum"))
              v120 = v216;
            else
              v120 = v220;
            objc_msgSend(v120, "albums");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "addObject:", v118);

          }
        }
      }
      v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v250, v288, 16);
    }
    while (v115);
  }

  if (objc_msgSend(v232, "hasChanges"))
  {
    v249 = 0;
    v122 = objc_msgSend(v232, "save:", &v249);
    v123 = v249;
    if ((v122 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("recreateAlbumsFromMetadta failed to save context %@: %@"), v232, v123);
      v199 = objc_claimAutoreleasedReturnValue();
      PLMigrationGetLog();
      v200 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v200, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v295 = (PLPersistedPersonMetadata *)v199;
        _os_log_impl(&dword_199541000, v200, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v199, 0);
      v201 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v201);
    }

  }
  v203 = v113;
  v205 = v106;
  v247 = 0u;
  v248 = 0u;
  v245 = 0u;
  v246 = 0u;
  v224 = v212;
  v124 = objc_msgSend(v224, "countByEnumeratingWithState:objects:count:", &v245, v287, 16);
  if (v124)
  {
    v125 = v124;
    v126 = *(_QWORD *)v246;
    do
    {
      for (ii = 0; ii != v125; ++ii)
      {
        if (*(_QWORD *)v246 != v126)
          objc_enumerationMutation(v224);
        v128 = *(void **)(*((_QWORD *)&v245 + 1) + 8 * ii);
        v129 = (void *)MEMORY[0x19AEC1554]();
        v130 = -[PLPersistedMemoryMetadata initWithPersistedDataAtURL:]([PLPersistedMemoryMetadata alloc], "initWithPersistedDataAtURL:", v128);
        v131 = v130;
        if (v130)
        {
          -[PLPersistedMemoryMetadata uuid](v130, "uuid");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLMemory memoryWithUUID:inPhotoLibrary:](PLMemory, "memoryWithUUID:inPhotoLibrary:", v132, v231);
          v133 = (void *)objc_claimAutoreleasedReturnValue();

          if (v133)
            goto LABEL_183;
          v134 = -[PLPersistedMemoryMetadata isObsolete](v131, "isObsolete");
          if (!v230 || v134)
          {
            v135 = v232;
            if (v134)
              goto LABEL_180;
          }
          else
          {
            v135 = v232;
            if (!-[PLPersistedMemoryMetadata hasAllAssetsAvailableInManagedObjectContext:includePendingAssetChanges:](v131, "hasAllAssetsAvailableInManagedObjectContext:includePendingAssetChanges:", v232, v217))
            {
              PLMigrationGetLog();
              v140 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v295 = (PLPersistedPersonMetadata *)v131;
                _os_log_impl(&dword_199541000, v140, OS_LOG_TYPE_DEFAULT, "Skipping restore for memory with references to unavailable assets, will restore %@ from iCloud Photo Library", buf, 0xCu);
              }

LABEL_180:
              PLMigrationGetLog();
              v141 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v295 = (PLPersistedPersonMetadata *)v131;
                _os_log_impl(&dword_199541000, v141, OS_LOG_TYPE_DEFAULT, "Removing persisted data for %@", buf, 0xCu);
              }

              -[PLPersistedMemoryMetadata removePersistedData](v131, "removePersistedData");
              v133 = 0;
              goto LABEL_183;
            }
          }
          PLMigrationGetLog();
          v138 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v295 = (PLPersistedPersonMetadata *)v131;
            _os_log_impl(&dword_199541000, v138, OS_LOG_TYPE_DEFAULT, "Creating new memory from metadata %@", buf, 0xCu);
          }

          -[PLPersistedMemoryMetadata insertMemoryFromDataInManagedObjectContext:](v131, "insertMemoryFromDataInManagedObjectContext:", v135);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          if (v133
            && !-[PLPersistedMemoryMetadata updateAssetsInMemory:includePendingAssetChanges:](v131, "updateAssetsInMemory:includePendingAssetChanges:", v133, v217))
          {
            PLMigrationGetLog();
            v139 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v295 = (PLPersistedPersonMetadata *)v131;
              _os_log_impl(&dword_199541000, v139, OS_LOG_TYPE_ERROR, "Incomplete restore of assets for memory %@", buf, 0xCu);
            }

          }
        }
        else
        {
          PLMigrationGetLog();
          v136 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v128, "path");
            v137 = (PLPersistedPersonMetadata *)(id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v295 = v137;
            _os_log_impl(&dword_199541000, v136, OS_LOG_TYPE_ERROR, "Failed to read invalid or missing metadata, will skip and delete %@", buf, 0xCu);

          }
          objc_msgSend(v128, "path");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v233, "addObject:", v133);
        }
LABEL_183:

        v96 = v232;
        if (objc_msgSend(v232, "hasChanges"))
        {
          v244 = 0;
          v142 = objc_msgSend(v232, "save:", &v244);
          v143 = (PLPersistedAlbumMetadata *)v244;
          if ((v142 & 1) == 0)
          {
            PLMigrationGetLog();
            v144 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v128, "path");
              v145 = (PLPersistedPersonMetadata *)(id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v295 = v145;
              v296 = 2112;
              v297 = v143;
              _os_log_impl(&dword_199541000, v144, OS_LOG_TYPE_ERROR, "recreateAlbumsFromMetadata failed to rebuild memory from %@: %@", buf, 0x16u);

            }
            objc_msgSend(v232, "rollback");
          }

          v96 = v232;
        }

        objc_autoreleasePoolPop(v129);
      }
      v125 = objc_msgSend(v224, "countByEnumeratingWithState:objects:count:", &v245, v287, 16);
    }
    while (v125);
  }

  v146 = v231;
  -[PLPhotoLibrary libraryBundle](v231, "libraryBundle");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "indicatorFileCoordinator");
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v148, "isRebuildingPersons"))
  {
    +[PLPerson fetchRequest](PLPerson, "fetchRequest");
    v149 = objc_claimAutoreleasedReturnValue();
    v243 = 0;
    v151 = objc_msgSend(v96, "countForFetchRequest:error:", v149, &v243);
    v152 = (PLPersistedPersonMetadata *)v243;
    v150 = v205;
    if (v151)
    {
      v153 = v148;
      if (v151 != 0x7FFFFFFFFFFFFFFFLL)
      {
        PLMigrationGetLog();
        v190 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v190, OS_LOG_TYPE_DEFAULT, "Found existing persons in library, skipping filesystem person rebuild", buf, 2u);
        }

        -[PLPhotoLibrary _rebuildSocialGroups](v231, "_rebuildSocialGroups");
        v148 = v153;
        goto LABEL_260;
      }
      PLMigrationGetLog();
      v154 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v295 = v152;
        _os_log_impl(&dword_199541000, v154, OS_LOG_TYPE_ERROR, "Error fetching count of persons in library, will proceed with person rebuild: %@", buf, 0xCu);
      }

      v148 = v153;
    }

    goto LABEL_200;
  }
  PLMigrationGetLog();
  v149 = objc_claimAutoreleasedReturnValue();
  v150 = v205;
  if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v149, OS_LOG_TYPE_ERROR, "Encountered the person rebuild indicator file, this probably indicates a crash during person rebuild, will resume rebuilding persons", buf, 2u);
  }
LABEL_200:

  objc_msgSend(v148, "setIsRebuildingPersons:", 1);
  +[PLPersistedPersonMetadata personUUIDsToDedupeWithMetadataURLs:cplEnabled:](PLPersistedPersonMetadata, "personUUIDsToDedupeWithMetadataURLs:cplEnabled:", v206, -[PLPhotoLibrary isCloudPhotoLibraryEnabled](v231, "isCloudPhotoLibraryEnabled"));
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v208 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v206, "count"));
  v239 = 0u;
  v240 = 0u;
  v241 = 0u;
  v242 = 0u;
  v155 = v206;
  v156 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v239, v286, 16);
  if (!v156)
  {

    v187 = 0;
    v188 = 1;
    goto LABEL_253;
  }
  v157 = v156;
  v222 = v155;
  v202 = v148;
  v209 = 0;
  v210 = 0;
  v214 = 1;
  v158 = *(_QWORD *)v240;
  while (2)
  {
    v159 = 0;
    while (2)
    {
      if (*(_QWORD *)v240 != v158)
        objc_enumerationMutation(v222);
      v160 = *(void **)(*((_QWORD *)&v239 + 1) + 8 * v159);
      v161 = (void *)MEMORY[0x19AEC1554]();
      v162 = -[PLPersistedPersonMetadata initWithPersistedDataAtURL:deferUnarchiving:cplEnabled:]([PLPersistedPersonMetadata alloc], "initWithPersistedDataAtURL:deferUnarchiving:cplEnabled:", v160, 1, -[PLPhotoLibrary isCloudPhotoLibraryEnabled](v231, "isCloudPhotoLibraryEnabled"));
      v163 = v162;
      if (!v162)
      {
        PLMigrationGetLog();
        v171 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v160, "path");
          v172 = (PLPersistedPersonMetadata *)(id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v295 = v172;
          _os_log_impl(&dword_199541000, v171, OS_LOG_TYPE_ERROR, "Failed to read invalid or missing metadata, will skip and delete %@", buf, 0xCu);

        }
        objc_msgSend(v160, "path");
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v233, "addObject:", v164);
        goto LABEL_236;
      }
      -[PLPersistedPersonMetadata personUUID](v162, "personUUID");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v164)
      {
        PLMigrationGetLog();
        v165 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
          goto LABEL_217;
        objc_msgSend(v160, "path");
        v166 = (PLPersistedPersonMetadata *)(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v295 = v166;
        v167 = v165;
        v168 = OS_LOG_TYPE_ERROR;
        v169 = "Invalid person metadata missing person UUID, will skip and delete %@";
        goto LABEL_215;
      }
      if (objc_msgSend(v218, "containsObject:", v164))
      {
        PLMigrationGetLog();
        v165 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v160, "path");
          v166 = (PLPersistedPersonMetadata *)(id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v295 = v163;
          v296 = 2112;
          v297 = (PLPersistedAlbumMetadata *)v166;
          v167 = v165;
          v168 = OS_LOG_TYPE_DEFAULT;
          v169 = "Person from metadata %@ will be deduped, will skip and delete %@";
          v170 = 22;
          goto LABEL_216;
        }
        goto LABEL_217;
      }
      +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v164, v96);
      v174 = objc_claimAutoreleasedReturnValue();
      if (v174)
      {
        v173 = v174;
        PLMigrationGetLog();
        v175 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v295 = v163;
          _os_log_impl(&dword_199541000, v175, OS_LOG_TYPE_DEFAULT, "Person for metadata already exists: %@", buf, 0xCu);
        }
        goto LABEL_234;
      }
      v176 = -[PLPersistedPersonMetadata readMetadata](v163, "readMetadata");
      PLMigrationGetLog();
      v177 = objc_claimAutoreleasedReturnValue();
      v165 = v177;
      if (!v176)
      {
        if (!os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
          goto LABEL_217;
        objc_msgSend(v160, "path");
        v166 = (PLPersistedPersonMetadata *)(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v295 = v166;
        v167 = v165;
        v168 = OS_LOG_TYPE_ERROR;
        v169 = "Failed to read invalid or missing metadata, will skip and delete %@";
LABEL_215:
        v170 = 12;
LABEL_216:
        _os_log_impl(&dword_199541000, v167, v168, v169, buf, v170);

LABEL_217:
        objc_msgSend(v160, "path");
        v173 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v233, "addObject:", v173);
        goto LABEL_235;
      }
      if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v295 = v163;
        _os_log_impl(&dword_199541000, v165, OS_LOG_TYPE_DEFAULT, "Creating new person from metadata %@", buf, 0xCu);
      }

      v178 = -[PLPersistedPersonMetadata fromVersion](v163, "fromVersion");
      v179 = v210;
      if (v178 > v210)
        v179 = v178;
      v210 = v179;
      -[PLPersistedPersonMetadata insertPersonFromDataInManagedObjectContext:](v163, "insertPersonFromDataInManagedObjectContext:", v232);
      v180 = objc_claimAutoreleasedReturnValue();
      if (v180)
      {
        v173 = v180;
        if (!-[PLPersistedPersonMetadata updateFacesInPerson:fromDataInManagedObjectContext:deferUnmatched:](v163, "updateFacesInPerson:fromDataInManagedObjectContext:deferUnmatched:", v180, v232, v230))
        {
          PLMigrationGetLog();
          v181 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v295 = v163;
            _os_log_impl(&dword_199541000, v181, OS_LOG_TYPE_ERROR, "Incomplete restore of faces for person %@", buf, 0xCu);
          }

        }
        -[PLPersistedPersonMetadata mergeTargetPersonUUID](v163, "mergeTargetPersonUUID");
        v175 = objc_claimAutoreleasedReturnValue();
        if (v175)
          objc_msgSend(v208, "setObject:forKey:", v175, v164);
        v209 = (PLPersistedPersonMetadata *)((char *)v209 + 1);
LABEL_234:

      }
      else
      {
        PLMigrationGetLog();
        v173 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v295 = v163;
          _os_log_impl(&dword_199541000, v173, OS_LOG_TYPE_ERROR, "Failed to create new person from metadata %@", buf, 0xCu);
        }
      }
LABEL_235:

      v96 = v232;
LABEL_236:

      if (objc_msgSend(v96, "hasChanges"))
      {
        v238 = 0;
        v182 = objc_msgSend(v96, "save:", &v238);
        v183 = (PLPersistedAlbumMetadata *)v238;
        if ((v182 & 1) == 0)
        {
          PLMigrationGetLog();
          v184 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v160, "path");
            v185 = (PLPersistedPersonMetadata *)(id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v295 = v185;
            v296 = 2112;
            v297 = v183;
            _os_log_impl(&dword_199541000, v184, OS_LOG_TYPE_ERROR, "recreateAlbumsFromMetadata failed to rebuild person from %@: %@", buf, 0x16u);

          }
          v96 = v232;
          objc_msgSend(v232, "rollback");
          v214 = 0;
        }

      }
      objc_autoreleasePoolPop(v161);
      if (v157 != ++v159)
        continue;
      break;
    }
    v186 = objc_msgSend(v222, "countByEnumeratingWithState:objects:count:", &v239, v286, 16);
    v157 = v186;
    if (v186)
      continue;
    break;
  }

  v187 = v209;
  if (v209)
  {
    +[PLPersistedPersonMetadata updateMergeTargetPersonWithPersonUUIDMapping:fromDataInManagedObjectContext:](PLPersistedPersonMetadata, "updateMergeTargetPersonWithPersonUUIDMapping:fromDataInManagedObjectContext:", v208, v96);
    +[PLPersistedPersonMetadata performPostImportMigrationFromVersion:fromDataInManagedObjectContext:](PLPersistedPersonMetadata, "performPostImportMigrationFromVersion:fromDataInManagedObjectContext:", v210, v96);
  }
  v146 = v231;
  v150 = v205;
  v148 = v202;
  v188 = v214;
LABEL_253:
  PLMigrationGetLog();
  v189 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v295 = v187;
    _os_log_impl(&dword_199541000, v189, OS_LOG_TYPE_DEFAULT, "Created %lu persons from filesystem rebuild", buf, 0xCu);
  }

  -[PLPhotoLibrary _rebuildSocialGroups](v146, "_rebuildSocialGroups");
  if ((v188 & 1) != 0)
LABEL_260:
    -[PLPhotoLibrary _removeOldFaceMetadataAsync](v146, "_removeOldFaceMetadataAsync");
  objc_msgSend(v148, "setIsRebuildingPersons:", 0);
  if (objc_msgSend(v233, "count"))
  {
    PLMigrationGetLog();
    v191 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
    {
      v192 = objc_msgSend(v233, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v295) = v192;
      _os_log_impl(&dword_199541000, v191, OS_LOG_TYPE_DEFAULT, "Removing %d stale 1-way sync album metadata files", buf, 8u);
    }

    objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v234 = 0u;
    v235 = 0u;
    v236 = 0u;
    v237 = 0u;
    v194 = v233;
    v195 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v234, v285, 16);
    if (v195)
    {
      v196 = v195;
      v197 = *(_QWORD *)v235;
      do
      {
        for (jj = 0; jj != v196; ++jj)
        {
          if (*(_QWORD *)v235 != v197)
            objc_enumerationMutation(v194);
          objc_msgSend(v193, "removeItemAtPath:error:", *(_QWORD *)(*((_QWORD *)&v234 + 1) + 8 * jj), 0);
        }
        v196 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v234, v285, 16);
      }
      while (v196);
    }

  }
}

- (void)_rebuildSocialGroups
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  PLDirectoryJournal *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PLPhotoLibrary libraryBundle](self, "libraryBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indicatorFileCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isRebuildingSocialGroups"))
  {
    PLMigrationGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Encountered the social groups rebuild indicator file, this probably indicates a crash during social group rebuild, will resume rebuilding social groups", buf, 2u);
    }
    goto LABEL_10;
  }
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphNode entityName](PLGraphNode, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v5 = objc_claimAutoreleasedReturnValue();

  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSocialGroup predicateForAllVerifiedSocialGroupsInContext:](PLSocialGroup, "predicateForAllVerifiedSocialGroupsInContext:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setPredicate:](v5, "setPredicate:", v9);

  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v11 = objc_msgSend(v10, "countForFetchRequest:error:", v5, &v23);
  v12 = v23;

  if (!v11)
  {
LABEL_9:

LABEL_10:
    if (-[PLPhotoLibrary isCloudPhotoLibraryEnabled](self, "isCloudPhotoLibraryEnabled")
      && (-[PLPhotoLibrary cplStatus](self, "cplStatus"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "initialSyncDate"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          v15))
    {
      PLMigrationGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "iCloud Photo Library is enabled. Skipping filesystem social group rebuild.", buf, 2u);
      }
    }
    else
    {
      v16 = [PLDirectoryJournal alloc];
      -[PLPhotoLibrary pathManager](self, "pathManager");
      v17 = objc_claimAutoreleasedReturnValue();
      v5 = -[PLDirectoryJournal initWithPathManager:payloadClass:](v16, "initWithPathManager:payloadClass:", v17, objc_opt_class());

      v21 = 0;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __38__PLPhotoLibrary__rebuildSocialGroups__block_invoke;
      v22[3] = &unk_1E3660830;
      v22[4] = self;
      LOBYTE(v17) = -[NSObject enumeratePayloadsUsingBlock:error:](v5, "enumeratePayloadsUsingBlock:error:", v22, &v21);
      v18 = v21;
      if ((v17 & 1) == 0)
      {
        PLMigrationGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v18;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Failed to insert graph nodes for social groups: %@", buf, 0xCu);
        }

      }
    }
    goto LABEL_22;
  }
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLMigrationGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v12;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Error fetching count of social groups in library, will proceed with social group rebuild: %@", buf, 0xCu);
    }

    goto LABEL_9;
  }
  PLMigrationGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Found existing social groups in library, skipping filesystem social group rebuild", buf, 2u);
  }

LABEL_22:
}

- (void)_enumerateFilesAtURLs:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v6);
        -[PLPhotoLibrary _enumerateFilesAtURL:withBlock:](self, "_enumerateFilesAtURL:withBlock:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v7);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_enumerateFilesAtURL:(id)a3 withBlock:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = *MEMORY[0x1E0C99A90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v8, 0, &__block_literal_global_561);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)_removeOldFaceMetadataAsync
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__PLPhotoLibrary__removeOldFaceMetadataAsync__block_invoke;
  v2[3] = &unk_1E3677AA0;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0D73200], "performBlockOnWriterQueue:", v2);
}

- (id)allImportedPhotosAlbum
{
  return -[PLPhotoLibrary allImportedPhotosAlbumCreateIfNeeded:](self, "allImportedPhotosAlbumCreateIfNeeded:", 1);
}

- (id)allImportedPhotosAlbumCreateIfNeeded:(BOOL)a3
{
  PLGenericAlbum *allImportedPhotosAlbum;
  _BOOL4 v5;
  void *v6;
  PLGenericAlbum *v7;
  PLGenericAlbum *v8;
  PLGenericAlbum *v9;
  PLGenericAlbum *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  allImportedPhotosAlbum = self->_allImportedPhotosAlbum;
  if (!allImportedPhotosAlbum)
  {
    v5 = a3;
    -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLGenericAlbum, "albumWithKind:inManagedObjectContext:", 1604, v6);
    v7 = (PLGenericAlbum *)objc_claimAutoreleasedReturnValue();
    v8 = self->_allImportedPhotosAlbum;
    self->_allImportedPhotosAlbum = v7;

    allImportedPhotosAlbum = self->_allImportedPhotosAlbum;
    if (!allImportedPhotosAlbum && v5)
    {
      +[PLGenericAlbum insertNewAlbumWithKind:title:intoLibrary:](PLGenericAlbum, "insertNewAlbumWithKind:title:intoLibrary:", 1604, 0, self);
      v9 = (PLGenericAlbum *)objc_claimAutoreleasedReturnValue();
      v10 = self->_allImportedPhotosAlbum;
      self->_allImportedPhotosAlbum = v9;

      -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v12 = objc_msgSend(v11, "save:", &v16);
      v13 = v16;

      if ((v12 & 1) == 0)
      {
        PLBackendGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v13;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to save after creating the allImportedPhotosAlbum: %@", buf, 0xCu);
        }

      }
      allImportedPhotosAlbum = self->_allImportedPhotosAlbum;
    }
  }
  return allImportedPhotosAlbum;
}

- (id)lastImportedPhotosAlbum
{
  return -[PLPhotoLibrary lastImportedPhotosAlbumCreateIfNeeded:](self, "lastImportedPhotosAlbumCreateIfNeeded:", 1);
}

- (id)lastImportedPhotosAlbumCreateIfNeeded:(BOOL)a3
{
  PLGenericAlbum *lastImportedPhotosAlbum;
  _BOOL4 v5;
  void *v6;
  PLGenericAlbum *v7;
  PLGenericAlbum *v8;
  PLGenericAlbum *v9;
  PLGenericAlbum *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  lastImportedPhotosAlbum = self->_lastImportedPhotosAlbum;
  if (!lastImportedPhotosAlbum)
  {
    v5 = a3;
    -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLGenericAlbum, "albumWithKind:inManagedObjectContext:", 1603, v6);
    v7 = (PLGenericAlbum *)objc_claimAutoreleasedReturnValue();
    v8 = self->_lastImportedPhotosAlbum;
    self->_lastImportedPhotosAlbum = v7;

    lastImportedPhotosAlbum = self->_lastImportedPhotosAlbum;
    if (!lastImportedPhotosAlbum && v5)
    {
      +[PLGenericAlbum insertNewAlbumWithKind:title:intoLibrary:](PLGenericAlbum, "insertNewAlbumWithKind:title:intoLibrary:", 1603, 0, self);
      v9 = (PLGenericAlbum *)objc_claimAutoreleasedReturnValue();
      v10 = self->_lastImportedPhotosAlbum;
      self->_lastImportedPhotosAlbum = v9;

      -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v12 = objc_msgSend(v11, "save:", &v16);
      v13 = v16;

      if ((v12 & 1) == 0)
      {
        PLBackendGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v13;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to save after creating the lastImportedPhotosAlbum: %@", buf, 0xCu);
        }

      }
      lastImportedPhotosAlbum = self->_lastImportedPhotosAlbum;
    }
  }
  return lastImportedPhotosAlbum;
}

- (void)resetCachedImportAlbumsIfNeededForAlbum:(id)a3
{
  PLGenericAlbum *v4;
  PLGenericAlbum **p_lastImportedPhotosAlbum;
  PLGenericAlbum **p_allImportedPhotosAlbum;
  PLGenericAlbum *allImportedPhotosAlbum;
  PLGenericAlbum *v8;

  v4 = (PLGenericAlbum *)a3;
  p_lastImportedPhotosAlbum = &self->_lastImportedPhotosAlbum;
  if (self->_lastImportedPhotosAlbum == v4)
    goto LABEL_4;
  allImportedPhotosAlbum = self->_allImportedPhotosAlbum;
  p_allImportedPhotosAlbum = &self->_allImportedPhotosAlbum;
  if (allImportedPhotosAlbum == v4)
  {
    p_lastImportedPhotosAlbum = p_allImportedPhotosAlbum;
LABEL_4:
    *p_lastImportedPhotosAlbum = 0;
    v8 = v4;

    v4 = v8;
  }

}

- (NSArray)syncedAlbums
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

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum albumsWithKind:inManagedObjectContext:](PLManagedAlbum, "albumsWithKind:inManagedObjectContext:", 1603, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum albumsWithKind:inManagedObjectContext:](PLManagedAlbum, "albumsWithKind:inManagedObjectContext:", 1604, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum albumsWithKind:inManagedObjectContext:](PLManagedAlbum, "albumsWithKind:inManagedObjectContext:", 2, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum albumsWithKind:inManagedObjectContext:](PLManagedAlbum, "albumsWithKind:inManagedObjectContext:", 1550, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  return (NSArray *)v3;
}

- (PLAlbumProtocol)syncProgressAlbum
{
  return (PLAlbumProtocol *)+[PLGenericAlbum syncProgressAlbumInLibrary:](PLGenericAlbum, "syncProgressAlbumInLibrary:", self);
}

- (PLAlbumProtocol)otaRestoreProgressAlbum
{
  return (PLAlbumProtocol *)+[PLGenericAlbum otaRestoreProgressAlbumInLibrary:](PLGenericAlbum, "otaRestoreProgressAlbumInLibrary:", self);
}

- (PLAlbumProtocol)filesystemImportProgressAlbum
{
  return (PLAlbumProtocol *)+[PLGenericAlbum filesystemImportProgressAlbumInLibrary:](PLGenericAlbum, "filesystemImportProgressAlbumInLibrary:", self);
}

- (id)photoOutboundSharingTmpDirectoryURL
{
  void *v2;
  void *v3;

  -[PLPhotoLibraryPathManager privateDirectoryWithSubType:createIfNeeded:error:](self->_pathManager, "privateDirectoryWithSubType:createIfNeeded:error:", 2, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)modifyDCIMEntryForPhoto:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  PLPhotoLibrary *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "pathForOriginalFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v4, "isPhoto"))
  {
    objc_msgSend(v4, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__PLPhotoLibrary_modifyDCIMEntryForPhoto___block_invoke;
    v7[3] = &unk_1E3677530;
    v8 = v5;
    v9 = self;
    v10 = v4;
    objc_msgSend(v6, "performTransaction:completionHandler:", v7, 0);

  }
}

- (id)addDCIMEntryAtFileURL:(id)a3 mainFileMetadata:(id)a4 previewImage:(id)a5 thumbnailImage:(id)a6 savedAssetType:(signed __int16)a7 replacementUUID:(id)a8 publicGlobalUUID:(id)a9 extendedInfo:(id)a10 withUUID:(id)a11 isPlaceholder:(BOOL)a12 placeholderFileURL:(id)a13 forFinalCameraImage:(BOOL)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  id v42;
  id v43;
  id v45;
  id v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[5];
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint64_t *v60;
  signed __int16 v61;
  BOOL v62;
  BOOL v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;

  v42 = a3;
  v19 = a4;
  v45 = a5;
  v46 = a6;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a13;
  if (v20 && v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 2684, CFSTR("Cannot specify both replacementUUID and newUUID"));

  }
  if (!self->_pendingTransactions)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 2685, CFSTR("Can only call %@ from within a transaction."), v39);

  }
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__2562;
  v68 = __Block_byref_object_dispose__2563;
  v69 = 0;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __208__PLPhotoLibrary_addDCIMEntryAtFileURL_mainFileMetadata_previewImage_thumbnailImage_savedAssetType_replacementUUID_publicGlobalUUID_extendedInfo_withUUID_isPlaceholder_placeholderFileURL_forFinalCameraImage___block_invoke;
  v50[3] = &unk_1E36608A0;
  v60 = &v64;
  v50[4] = self;
  v43 = v42;
  v51 = v43;
  v41 = v19;
  v52 = v41;
  v61 = a7;
  v25 = v23;
  v53 = v25;
  v26 = v20;
  v54 = v26;
  v62 = a12;
  v27 = v24;
  v55 = v27;
  v28 = v22;
  v56 = v28;
  v29 = v21;
  v57 = v29;
  v30 = v45;
  v58 = v30;
  v31 = v46;
  v59 = v31;
  v63 = a14;
  v32 = (void *)MEMORY[0x19AEC174C](v50);
  -[PLPhotoLibrary libraryServicesManager](self, "libraryServicesManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v33)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 2801, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryServicesManager"));

  }
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __208__PLPhotoLibrary_addDCIMEntryAtFileURL_mainFileMetadata_previewImage_thumbnailImage_savedAssetType_replacementUUID_publicGlobalUUID_extendedInfo_withUUID_isPlaceholder_placeholderFileURL_forFinalCameraImage___block_invoke_2;
  v48[3] = &unk_1E3676CD8;
  v34 = v32;
  v49 = v34;
  objc_msgSend(v33, "performBlockWithImportMutex:", v48);
  v35 = (id)v65[5];

  _Block_object_dispose(&v64, 8);
  return v35;
}

- (void)_processPhotoIrisSidecarIfNecessary:(id)a3 forAsset:(id)a4 mainFileMetadata:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  __int128 v22;
  uint64_t v23;
  uint8_t v24[16];
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint8_t buf[16];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kPTPFilename"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("MOV")))
    goto LABEL_18;
  v12 = objc_msgSend(v8, "isPhoto");

  if (v12)
  {
    PLCameraConnectionKitGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "Processing Iris video from sidecar %@", buf, 0xCu);
    }

    objc_msgSend(v8, "pathForOriginalFile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByDeletingLastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("kPTPFilename"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v17, "fileExistsAtPath:", v16);

    if (!(_DWORD)v15)
    {
      PLCameraConnectionKitGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v16;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Unable to find Iris video at %@", buf, 0xCu);
      }
      goto LABEL_17;
    }
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75318]), "initWithPathToVideo:pathToImage:", v16, v11);
    -[NSObject pairingIdentifier](v18, "pairingIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    memset(buf, 0, sizeof(buf));
    v29 = 0;
    if (v18)
    {
      -[NSObject imageDisplayTime](v18, "imageDisplayTime");
      v26 = 0uLL;
      v27 = 0;
      -[NSObject originalVideoDuration](v18, "originalVideoDuration");
      if (!v20)
        goto LABEL_13;
    }
    else
    {
      v26 = 0uLL;
      v27 = 0;
      if (!v19)
        goto LABEL_13;
    }
    if ((BYTE12(v26) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v16, 0);
      v21 = objc_claimAutoreleasedReturnValue();
      *(_OWORD *)v24 = v26;
      v25 = v27;
      v22 = *(_OWORD *)buf;
      v23 = v29;
      objc_msgSend(v8, "becomePhotoIrisWithMediaGroupUUID:mainFileMetadata:videoURL:videoDuration:stillDisplayTime:options:", v20, v9, v21, v24, &v22, 0);
LABEL_16:

LABEL_17:
LABEL_18:

      goto LABEL_19;
    }
LABEL_13:
    PLCameraConnectionKitGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to extract Iris properties", v24, 2u);
    }
    goto LABEL_16;
  }
LABEL_19:

}

- (id)assetsdClient
{
  return -[PLPhotoLibraryBundle assetsdClient](self->_libraryBundle, "assetsdClient");
}

- (PLKeywordManager)keywordManager
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "keywordManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLKeywordManager *)v3;
}

- (BOOL)getPhotoCount:(unint64_t *)a3 videoCount:(unint64_t *)a4 excludeTrashed:(BOOL)a5 excludeInvisible:(BOOL)a6 excludeCloudShared:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v13;
  _BOOL8 v14;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PLPhotoLibrary isCloudPhotoLibraryEnabled](self, "isCloudPhotoLibraryEnabled");
  *a3 = +[PLManagedAsset countUsedAssetsWithKind:excludeTrashed:excludeInvisible:excludeCloudShared:excludePhotoStream:inManagedObjectContext:](PLManagedAsset, "countUsedAssetsWithKind:excludeTrashed:excludeInvisible:excludeCloudShared:excludePhotoStream:inManagedObjectContext:", 0, v9, v8, v7, v14, v13);
  *a4 = +[PLManagedAsset countUsedAssetsWithKind:excludeTrashed:excludeInvisible:excludeCloudShared:excludePhotoStream:inManagedObjectContext:](PLManagedAsset, "countUsedAssetsWithKind:excludeTrashed:excludeInvisible:excludeCloudShared:excludePhotoStream:inManagedObjectContext:", 1, v9, v8, v7, v14, v13);

  return 1;
}

- (BOOL)getPhotoCount:(unint64_t *)a3 videoCount:(unint64_t *)a4
{
  return -[PLPhotoLibrary getPhotoCount:videoCount:excludeTrashed:excludeInvisible:excludeCloudShared:](self, "getPhotoCount:videoCount:excludeTrashed:excludeInvisible:excludeCloudShared:", a3, a4, 0, 0, 0);
}

- (void)countOfReferencedMediaWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C97B48];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("fileSystemBookmark != nil"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__PLPhotoLibrary_countOfReferencedMediaWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E3676290;
    v13 = v9;
    v14 = v7;
    v15 = v4;
    -[PLPhotoLibrary performBlock:](self, "performBlock:", v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41003, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, 0x7FFFFFFFFFFFFFFFLL, v11);

  }
}

- (id)librarySizesFromDB
{
  return -[PLPhotoLibrary librarySizesFromDBForLibraryKindMask:](self, "librarySizesFromDBForLibraryKindMask:", 112);
}

- (id)librarySizesFromDBForLibraryKindMask:(unint64_t)a3
{
  char v3;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  PLManagedObjectContext *managedObjectContext;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int64_t v25;
  int64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  _QWORD v39[3];
  _QWORD v40[3];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  id v45;
  _QWORD v46[5];

  v3 = a3;
  v46[3] = *MEMORY[0x1E0C80C00];
  if ((a3 & 0x20) == 0)
  {
    v5 = 0;
    goto LABEL_12;
  }
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setResultType:", 2);
  v10 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("localAvailability"), &unk_1E375D3F8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("!((%K & %@) == %@)"), CFSTR("recipeID"), &unk_1E375D410, &unk_1E375D410);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v12;
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:keyPathPrefix:", objc_msgSend(MEMORY[0x1E0D73310], "maskForCloudPhotoLibrarySizesFromDBExclusions"), 1, CFSTR("asset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v15);

  v16 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v16, "setName:", CFSTR("totalFileSize"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("sum:(%K)"), CFSTR("dataLength"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setExpression:", v17);

  objc_msgSend(v16, "setExpressionResultType:", 300);
  v45 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToFetch:", v18);

  managedObjectContext = self->_managedObjectContext;
  v38 = 0;
  -[PLManagedObjectContext executeFetchRequest:error:](managedObjectContext, "executeFetchRequest:error:", v9, &v38);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v38;
  if (v20)
  {
    if (objc_msgSend(v20, "count") != 1)
    {
      v5 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v22 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("totalFileSize"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v23, "longLongValue");

  }
  else
  {
    PLBackendGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v42 = v24;
      v43 = 2112;
      v44 = v21;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "%@ failed to calculate size %@", buf, 0x16u);

    }
    v5 = 0;
  }

LABEL_11:
LABEL_12:
  if (-[PLPhotoLibrary isCloudPhotoLibraryEnabled](self, "isCloudPhotoLibraryEnabled"))
  {
    if ((v3 & 0x10) != 0)
      v25 = +[PLManagedAsset totalPurgeableSizeOnDiskInLibrary:urgency:sizeOption:](PLManagedAsset, "totalPurgeableSizeOnDiskInLibrary:urgency:sizeOption:", self, 1, 1);
    else
      v25 = 0;
    -[PLPhotoLibrary libraryBundle](self, "libraryBundle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCPLSettings settingsWithLibraryBundle:](PLCPLSettings, "settingsWithLibraryBundle:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_msgSend(v28, "isKeepOriginalsEnabled");
    v26 = 0;
    if ((v3 & 0x40) != 0 && (v29 & 1) == 0)
    {
      v26 = +[PLManagedAsset totalPurgeableSizeOnDiskInLibrary:urgency:sizeOption:](PLManagedAsset, "totalPurgeableSizeOnDiskInLibrary:urgency:sizeOption:", self, 1, 2);
      v25 += v26;
    }

  }
  else
  {
    v26 = 0;
    v25 = 0;
  }
  objc_msgSend(&unk_1E375D428, "stringValue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v30;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v31;
  objc_msgSend(&unk_1E375D440, "stringValue");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v32;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v25);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v33;
  objc_msgSend(&unk_1E375D458, "stringValue");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v34;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v26);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (unint64_t)_fileSizeAtPath:(id)a3
{
  id v3;
  int *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  off_t st_size;
  stat v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  char *v20;
  char __strerrbuf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  memset(&v14, 0, sizeof(v14));
  v3 = objc_retainAutorelease(a3);
  if (stat((const char *)objc_msgSend(v3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v14))
  {
    v4 = __error();
    v5 = *v4;
    if (*v4 == 2)
    {
      PLBackendGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__strerrbuf = 138412290;
        v22 = v3;
        v7 = "Can't get size for %@, no such file or directory";
        v8 = (uint8_t *)__strerrbuf;
        v9 = v6;
        v10 = OS_LOG_TYPE_DEBUG;
        v11 = 12;
LABEL_8:
        _os_log_impl(&dword_199541000, v9, v10, v7, v8, v11);
      }
    }
    else
    {
      strerror_r(*v4, __strerrbuf, 0x100uLL);
      PLBackendGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v16 = v3;
        v17 = 1024;
        v18 = v5;
        v19 = 2082;
        v20 = __strerrbuf;
        v7 = "Can't get size for %@ (%d: %{public}s)";
        v8 = buf;
        v9 = v6;
        v10 = OS_LOG_TYPE_ERROR;
        v11 = 28;
        goto LABEL_8;
      }
    }

    st_size = 0;
    goto LABEL_10;
  }
  st_size = v14.st_size;
LABEL_10:

  return st_size;
}

- (unint64_t)_dbFileSizes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PLPhotoLibrary pathManager](self, "pathManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "knownDBPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = -[PLPhotoLibrary _fileSizeAtPath:](self, "_fileSizeAtPath:", v9) + v6;
        objc_msgSend(v9, "stringByAppendingString:", CFSTR("-shm"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v10 + -[PLPhotoLibrary _fileSizeAtPath:](self, "_fileSizeAtPath:", v11);
        objc_msgSend(v9, "stringByAppendingString:", CFSTR("-wal"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v12 + -[PLPhotoLibrary _fileSizeAtPath:](self, "_fileSizeAtPath:", v13);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)estimatedLibrarySizes
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *context;
  void *contexta;
  uint64_t v80;
  void *v81;
  _QWORD v82[6];
  _QWORD v83[6];
  _QWORD v84[3];

  v84[1] = *MEMORY[0x1E0C80C00];
  -[PLPhotoLibrary pathManager](self, "pathManager");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x19AEC1554]();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoLibrary _resourcesInfoFromMoc:](PLPhotoLibrary, "_resourcesInfoFromMoc:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLSavedPhotosSize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLInternalSizeOriginals"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLSavedPhotosSize"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLInternalSizeDerivative"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLSavedPhotosSize"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLInternalSizeFileBackedThumbnail"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLReferenceMediaSize"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLInternalSizeDerivative"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v12, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLReferenceMediaSize"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PLInternalSizeFileBackedThumbnail"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v14, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLFinderSyncSize"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PLInternalSizeOriginals"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v16, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLFinderSyncSize"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PLInternalSizeDerivative"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v18, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLFinderSyncSize"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("PLInternalSizeFileBackedThumbnail"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v20, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLFinderSyncSize"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PLInternalSizeTableThumbnail"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v22, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLPhotoStreamSize"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("PLInternalSizeOriginals"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v24, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLPhotoStreamSize"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("PLInternalSizeDerivative"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v26, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLPhotoStreamSize"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("PLInternalSizeFileBackedThumbnail"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v28, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLPhotoStreamSize"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("PLInternalSizeTableThumbnail"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v30, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLSharedStreamSize"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("PLInternalSizeOriginals"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLSharedStreamSize"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("PLInternalSizeDerivative"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLSharedStreamSize"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("PLInternalSizeFileBackedThumbnail"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLSharedStreamSize"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("PLInternalSizeTableThumbnail"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "unsignedIntegerValue");

  v63 = +[PLManagedAsset totalPurgeableSizeOnDiskInLibrary:urgency:](PLManagedAsset, "totalPurgeableSizeOnDiskInLibrary:urgency:", self, 1);
  -[PLPhotoLibrary thumbnailManager](self, "thumbnailManager");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "_diskFootprintOfTableThumbnailTables");

  objc_autoreleasePoolPop(context);
  objc_msgSend(v81, "photoDirectoryWithType:", 6);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = _sizeOfDirectories(v46);

  v48 = -[PLPhotoLibrary _dbFileSizes](self, "_dbFileSizes");
  v49 = v36 + v33 + v39 + v42;
  v50 = +[PLDiskSpaceManagement performCloudSharingSpaceManagementWithBytesToPurge:shouldFreeSpace:shouldKeepRecentlyViewedAssets:fromPhotoLibrary:](PLDiskSpaceManagement, "performCloudSharingSpaceManagementWithBytesToPurge:shouldFreeSpace:shouldKeepRecentlyViewedAssets:fromPhotoLibrary:", 0, 0, 0, self);
  if (v49 >= v50)
    v51 = v49 - v50;
  else
    v51 = 0;
  objc_msgSend(&unk_1E375D470, "stringValue");
  contexta = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = contexta;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v76 + v80 + v74 + v73 + v72 + v44 + v47 + v48);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v77;
  objc_msgSend(&unk_1E375D488, "stringValue");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v75;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v66 + v67 + v65 + v64);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v52;
  objc_msgSend(&unk_1E375D4A0, "stringValue");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v53;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v51);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v83[2] = v54;
  objc_msgSend(&unk_1E375D4B8, "stringValue");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v55;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v70 + v71 + v69 + v68);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v83[3] = v56;
  objc_msgSend(&unk_1E375D440, "stringValue");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v82[4] = v57;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v63);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v83[4] = v58;
  objc_msgSend(&unk_1E375D428, "stringValue");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v82[5] = v59;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v80);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v83[5] = v60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 6);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  return v61;
}

- (id)librarySizes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  void *v78;
  void *v79;
  _QWORD v80[4];
  id v81;
  PLPhotoLibrary *v82;
  id v83;
  _QWORD v84[6];
  _QWORD v85[6];
  _QWORD v86[2];
  void *v87;
  _QWORD v88[3];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  id v92;
  _QWORD v93[3];

  v93[1] = *MEMORY[0x1E0C80C00];
  -[PLPhotoLibrary pathManager](self, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v3;
  v77 = objc_msgSend(v3, "isUBF");
  if (v77)
  {
    v4 = (void *)MEMORY[0x1E0C97B48];
    +[PLInternalResource entityName](PLInternalResource, "entityName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchRequestWithEntityName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("dataLength"));
    v72 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB35D0];
    v93[0] = v72;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "expressionForFunction:arguments:", CFSTR("sum:"), v8);
    v66 = objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v9, "setName:", CFSTR("sum"));
    objc_msgSend(v9, "setExpression:", v66);
    objc_msgSend(v9, "setExpressionResultType:", 300);
    v92 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPropertiesToFetch:", v10);

    objc_msgSend(v6, "setResultType:", 2);
    objc_msgSend(v6, "setReturnsObjectsAsFaults:", 0);
    -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __30__PLPhotoLibrary_librarySizes__block_invoke;
    v80[3] = &unk_1E3660930;
    v81 = v6;
    v82 = self;
    v83 = v11;
    v69 = v11;
    v67 = v6;
    v12 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v80);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("localAvailability"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("cloudLocalState"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3528];
    v91[0] = v13;
    +[PLManagedAsset predicateFilteringForNonDerivativeRecipeIDs](PLManagedAsset, "predicateFilteringForNonDerivativeRecipeIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "andPredicateWithSubpredicates:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v76 = ((uint64_t (**)(_QWORD, void *))v12)[2](v12, v18);
    v19 = (void *)MEMORY[0x1E0CB3528];
    v90[0] = v13;
    v90[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "andPredicateWithSubpredicates:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = ((uint64_t (**)(_QWORD, void *))v12)[2](v12, v21);

    v22 = (void *)v66;
    v23 = ((uint64_t (**)(_QWORD, void *))v12)[2](v12, v13);

    v24 = (void *)v72;
    v25 = v79;

    v26 = -1;
  }
  else
  {
    objc_msgSend(v3, "photoDirectoryWithType:", 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photoDirectoryWithType:", 28);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photoDirectoryWithType:", 29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photoMetadataDirectoryForMediaInMainDirectory:", v27);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photoMetadataDirectoryForMediaInMainDirectory:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photoDirectoryWithType:", 9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "stringByAppendingPathComponent:", CFSTR("CPL"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v27;
    v89[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = _sizeOfDirectories(v32);

    v88[0] = v70;
    v88[1] = v29;
    v88[2] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = _sizeOfDirectories(v34);

    v87 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = _sizeOfDirectories(v36);

    v76 = v33;
    v38 = v35 + v33;
    v23 = v35 + v33 + v37 + -[PLPhotoLibrary _dbFileSizes](self, "_dbFileSizes");
    if (-[PLPhotoLibrary isCloudPhotoLibraryEnabled](self, "isCloudPhotoLibraryEnabled"))
      v39 = v38;
    else
      v39 = 0;
    v75 = v39;

    v25 = v79;
    objc_msgSend(v79, "pathsForFinderSyncFilesystemSizeCalculation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = _sizeOfDirectories(v22);
  }

  v40 = -[PLPhotoLibrary sharedStreamsSize](self, "sharedStreamsSize");
  v41 = +[PLDiskSpaceManagement performCloudSharingSpaceManagementWithBytesToPurge:shouldFreeSpace:shouldKeepRecentlyViewedAssets:fromPhotoLibrary:](PLDiskSpaceManagement, "performCloudSharingSpaceManagementWithBytesToPurge:shouldFreeSpace:shouldKeepRecentlyViewedAssets:fromPhotoLibrary:", 0, 0, 0, self);
  if (v40 >= v41)
    v42 = v40 - v41;
  else
    v42 = 0;
  objc_msgSend(v25, "photoDirectoryWithType:", 14);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v77)
    objc_msgSend(v25, "photoDirectoryWithType:", 23);
  else
    objc_msgSend(v25, "photoMetadataDirectoryForMediaInMainDirectory:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v43;
  v86[1] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = _sizeOfDirectories(v45);

  v47 = v23 + v46 + (v26 & ~(v26 >> 63)) + v42;
  v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v25, "photoDirectoryWithType:", 11);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v49);

  if (v77)
  {
    objc_msgSend(v25, "photoDirectoryWithType:", 12);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObject:", v50);

  }
  v78 = v48;
  v51 = _sizeOfDirectories(v48);
  if (v47)
  {
    v52 = (unint64_t)((double)v23 / (double)(unint64_t)v47 * (double)(unint64_t)v51);
    v53 = (unint64_t)((double)v46 / (double)(unint64_t)v47 * (double)(unint64_t)v51);
    v54 = (unint64_t)((double)v42 / (double)(unint64_t)v47 * (double)(unint64_t)v51);
    v47 = (unint64_t)((double)v26 / (double)(unint64_t)v47 * (double)(unint64_t)v51);
  }
  else
  {
    v52 = 0;
    v53 = 0;
    v54 = 0;
  }
  objc_msgSend(&unk_1E375D470, "stringValue");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v74;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v52 + v23);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v71;
  objc_msgSend(&unk_1E375D488, "stringValue");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v68;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v53 + v46);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v55;
  objc_msgSend(&unk_1E375D4A0, "stringValue");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v84[2] = v56;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v54 + v42);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v85[2] = v57;
  objc_msgSend(&unk_1E375D4B8, "stringValue");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v84[3] = v58;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v47 + v26);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v85[3] = v59;
  objc_msgSend(&unk_1E375D440, "stringValue");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v84[4] = v60;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v75);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v85[4] = v61;
  objc_msgSend(&unk_1E375D428, "stringValue");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v84[5] = v62;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v76);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v85[5] = v63;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 6);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  return v64;
}

- (id)syncProgressAlbumsIgnoreiTunes:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    -[PLPhotoLibrary syncProgressAlbum](self, "syncProgressAlbum");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v5, "addObject:", v6);

    }
  }
  -[PLPhotoLibrary otaRestoreProgressAlbum](self, "otaRestoreProgressAlbum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v5, "addObject:", v8);
  -[PLPhotoLibrary filesystemImportProgressAlbum](self, "filesystemImportProgressAlbum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v5, "addObject:", v9);

  return v5;
}

- (BOOL)hasPendingAssetsIgnoreiTunes:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  int v13;
  BOOL v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 3557, CFSTR("%s Must be called from assetsd directly!"), "-[PLPhotoLibrary hasPendingAssetsIgnoreiTunes:]");

  }
  -[PLPhotoLibrary syncProgressAlbumsIgnoreiTunes:](self, "syncProgressAlbumsIgnoreiTunes:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[PLPhotoLibrary _hasIncompleteAsset](self, "_hasIncompleteAsset"))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v8);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "pendingItemsCount");
          v13 = objc_msgSend(v11, "pendingItemsType");
          if (v12)
            v14 = v13 == 1;
          else
            v14 = 1;
          if (!v14)
          {
            LOBYTE(v7) = 1;
            goto LABEL_18;
          }
        }
        v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }
LABEL_18:

  }
  return v7;
}

- (BOOL)hasCompletedRestorePostProcessing
{
  int v4;
  BOOL v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  void *v13;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 3583, CFSTR("%s Must be called from assetsd directly!"), "-[PLPhotoLibrary hasCompletedRestorePostProcessing]");

  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v4 = -[PLPhotoLibraryPathManager isDeviceRestoreSupported](self->_pathManager, "isDeviceRestoreSupported") ^ 1;
  if (hasCompletedRestorePostProcessing__hasCompletedRestorePostProcessing)
    LOBYTE(v4) = 1;
  v24 = v4;
  if (*((_BYTE *)v22 + 24))
  {
    v5 = 1;
  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__2562;
    v19 = __Block_byref_object_dispose__2563;
    v20 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__PLPhotoLibrary_hasCompletedRestorePostProcessing__block_invoke;
    v14[3] = &unk_1E3677830;
    v14[4] = self;
    v14[5] = &v21;
    v14[6] = &v15;
    -[PLPhotoLibrary performBlockAndWait:completionHandler:](self, "performBlockAndWait:completionHandler:", v14, 0);
    if (!*((_BYTE *)v22 + 24))
      goto LABEL_11;
    -[PLPhotoLibrary thumbnailManager](self, "thumbnailManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasRebuildThumbnailsRequest");
    *((_BYTE *)v22 + 24) = v7 ^ 1;

    if (*((_BYTE *)v22 + 24)
      || (v8 = (void *)v16[5], v16[5] = (uint64_t)CFSTR("rebuild thumbnails"), v8, *((_BYTE *)v22 + 24)))
    {
      v9 = 1;
    }
    else
    {
LABEL_11:
      PLBackendGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v16[5];
        *(_DWORD *)buf = 138543362;
        v26 = v11;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Restore post processing incomplete: %{public}@", buf, 0xCu);
      }

      v9 = *((_BYTE *)v22 + 24);
    }
    hasCompletedRestorePostProcessing__hasCompletedRestorePostProcessing = v9;
    _Block_object_dispose(&v15, 8);

    v5 = *((_BYTE *)v22 + 24) != 0;
  }
  _Block_object_dispose(&v21, 8);
  return v5;
}

- (BOOL)isReadyForCloudPhotoLibrary
{
  id WeakRetained;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v10;

  if ((PLIsAssetsd() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);

    if (!WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 3618, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_libraryServicesManager"));

    }
    v5 = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    objc_msgSend(v5, "cplReadiness");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isReadyForCloudPhotoLibraryWithStatus:", 0);
  }
  else
  {
    -[PLPhotoLibrary assetsdClient](self, "assetsdClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cloudInternalClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isReadyForCloudPhotoLibrary");
  }
  v8 = v7;

  return v8;
}

- (void)reportLibrarySizeToDAS
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__PLPhotoLibrary_reportLibrarySizeToDAS__block_invoke;
  v2[3] = &unk_1E3677AA0;
  v2[4] = self;
  -[PLPhotoLibrary performBlockAndWait:](self, "performBlockAndWait:", v2);
}

- (id)incompleteRestoreProcesses
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  PLPhotoLibrary *v14;
  id v15;

  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 3636, CFSTR("Only Assetsd should be creating the photostream album!"));

  }
  if (PLIsAssetsd())
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __44__PLPhotoLibrary_incompleteRestoreProcesses__block_invoke;
    v13 = &unk_1E3677C18;
    v14 = self;
    v5 = v4;
    v15 = v5;
    -[PLPhotoLibrary performBlockAndWait:](self, "performBlockAndWait:", &v10);
    -[PLPhotoLibrary thumbnailManager](self, "thumbnailManager", v10, v11, v12, v13, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasRebuildThumbnailsRequest");

    if (v7)
      objc_msgSend(v5, "addObject:", CFSTR("thumbnailsRebuild"));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)hasCompletedMomentAnalysis
{
  BOOL v4;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibrary.m"), 3656, CFSTR("%s Must be called from assetsd directly!"), "-[PLPhotoLibrary hasCompletedMomentAnalysis]");

  }
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v11 = PLPlatformMomentAnalysisSupported() ^ 1;
  if (*((_BYTE *)v9 + 24))
  {
    v4 = 1;
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__PLPhotoLibrary_hasCompletedMomentAnalysis__block_invoke;
    v7[3] = &unk_1E3677C68;
    v7[4] = self;
    v7[5] = &v8;
    -[PLPhotoLibrary performBlockAndWait:](self, "performBlockAndWait:", v7);
    v4 = *((_BYTE *)v9 + 24) != 0;
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (id)syncedAlbumSubtitleStringFormat
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  int v10;

  -[PLPhotoLibraryPathManager syncInfoPath](self->_pathManager, "syncInfoPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "fileExistsAtPath:", v2))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("userAgent"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("libraryKind"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      v8 = objc_msgSend(v5, "rangeOfString:", CFSTR("Macintosh"));

      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_12;
      goto LABEL_11;
    }
    if (v6)
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("iPhoto")))
      {

LABEL_11:
        v9 = CFSTR("X_FROM_MY_MAC");
        goto LABEL_13;
      }
      v10 = objc_msgSend(v7, "isEqualToString:", CFSTR("Aperture"));

      if (v10)
        goto LABEL_11;
    }
    else
    {

    }
LABEL_12:
    v9 = CFSTR("X_FROM_MY_COMPUTER");
    goto LABEL_13;
  }
  v9 = 0;
LABEL_13:

  return (id)v9;
}

- (BOOL)isAlbumSynced:(id)a3
{
  return objc_msgSend(a3, "kindValue") - 1550 < 3;
}

- (void)old_refreshCachedCountsOnAllAssetContainersInContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFArray *v15;
  CFIndex i;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  const void *ValueAtIndex;
  const void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[4];
  __CFString *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setRelationshipKeyPathsForPrefetching:", &unk_1E3763230);
  objc_msgSend(v6, "setResultType:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("trashedState = %d"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);

  objc_msgSend(v6, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __71__PLPhotoLibrary_old_refreshCachedCountsOnAllAssetContainersInContext___block_invoke_2;
  v39[3] = &unk_1E3660A10;
  v10 = v8;
  v40 = v10;
  v36[0] = v9;
  v36[1] = 3221225472;
  v36[2] = __71__PLPhotoLibrary_old_refreshCachedCountsOnAllAssetContainersInContext___block_invoke_3;
  v36[3] = &unk_1E3660A38;
  v28 = (id)MEMORY[0x19AEC174C](v39);
  v29 = v3;
  v37 = v28;
  v38 = &__block_literal_global_706;
  v25 = v6;
  v11 = (id)objc_msgSend(v3, "enumerateObjectsFromFetchRequest:count:batchSize:usingBlock:", v6, 0, 500, v36);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v10;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
  if (v30)
  {
    v27 = *(_QWORD *)v33;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(obj);
        v31 = v12;
        v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v12);
        objc_msgSend(v29, "objectWithID:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (const __CFArray *)(*((uint64_t (**)(id, uint64_t))v28 + 2))(v28, v13);
        for (i = 0; i != 3; ++i)
        {
          v17 = old_refreshCachedCountsOnAllAssetContainersInContext__cachedKeys[i];
          objc_msgSend(v14, "valueForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "integerValue");

          ValueAtIndex = CFArrayGetValueAtIndex(v15, i);
          if ((const void *)v19 != ValueAtIndex)
          {
            v21 = ValueAtIndex;
            PLBackendGetLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v14, "objectID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v42 = v17;
              v43 = 2112;
              v44 = v23;
              v45 = 2048;
              v46 = v19;
              v47 = 2048;
              v48 = v21;
              _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Resetting %@ for %@ (%ld -> %ld)", buf, 0x2Au);

            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setValue:forKey:", v24, v17);

          }
        }

        v12 = v31 + 1;
      }
      while (v31 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
    }
    while (v30);
  }

}

- (void)updateAssetPlayShareViewCountsInContext:(id)a3
{
  id v4;

  v4 = a3;
  -[PLPhotoLibrary _updateAssetCountKeyPath:withPendingCountKeyPath:inContext:](self, "_updateAssetCountKeyPath:withPendingCountKeyPath:inContext:", CFSTR("playCount"), CFSTR("pendingPlayCount"), v4);
  -[PLPhotoLibrary _updateAssetCountKeyPath:withPendingCountKeyPath:inContext:](self, "_updateAssetCountKeyPath:withPendingCountKeyPath:inContext:", CFSTR("shareCount"), CFSTR("pendingShareCount"), v4);
  -[PLPhotoLibrary _updateAssetCountKeyPath:withPendingCountKeyPath:inContext:](self, "_updateAssetCountKeyPath:withPendingCountKeyPath:inContext:", CFSTR("viewCount"), CFSTR("pendingViewCount"), v4);

}

- (void)_updateAssetCountKeyPath:(id)a3 withPendingCountKeyPath:(id)a4 inContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C97B48];
  +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRequestWithEntityName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > 0"), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPredicate:", v14);
  objc_msgSend(v13, "setFetchBatchSize:", 100);
  v29[0] = v9;
  v29[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPropertiesToFetch:", v15);

  v24 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v13, &v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v24;
  if (!v16)
    goto LABEL_3;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__PLPhotoLibrary__updateAssetCountKeyPath_withPendingCountKeyPath_inContext___block_invoke;
  v21[3] = &unk_1E3660A88;
  v22 = v9;
  v23 = v8;
  objc_msgSend(v10, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v16, v21);
  v18 = objc_claimAutoreleasedReturnValue();

  v17 = (id)v18;
  if (v18)
  {
LABEL_3:
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v20;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "%@ failed with error: %@", buf, 0x16u);

    }
  }

}

- (void)updateMemoryPlayShareViewCountsInContext:(id)a3
{
  id v4;

  v4 = a3;
  -[PLPhotoLibrary _updateMemoryCountKeyPath:withPendingCountKeyPath:inContext:](self, "_updateMemoryCountKeyPath:withPendingCountKeyPath:inContext:", CFSTR("playCount"), CFSTR("pendingPlayCount"), v4);
  -[PLPhotoLibrary _updateMemoryCountKeyPath:withPendingCountKeyPath:inContext:](self, "_updateMemoryCountKeyPath:withPendingCountKeyPath:inContext:", CFSTR("shareCount"), CFSTR("pendingShareCount"), v4);
  -[PLPhotoLibrary _updateMemoryCountKeyPath:withPendingCountKeyPath:inContext:](self, "_updateMemoryCountKeyPath:withPendingCountKeyPath:inContext:", CFSTR("viewCount"), CFSTR("pendingViewCount"), v4);

}

- (void)_updateMemoryCountKeyPath:(id)a3 withPendingCountKeyPath:(id)a4 inContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C97B48];
  +[PLMemory entityName](PLMemory, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRequestWithEntityName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > 0"), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPredicate:", v14);
  objc_msgSend(v13, "setFetchBatchSize:", 100);
  v29[0] = v9;
  v29[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPropertiesToFetch:", v15);

  v24 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v13, &v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v24;
  if (!v16)
    goto LABEL_3;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __78__PLPhotoLibrary__updateMemoryCountKeyPath_withPendingCountKeyPath_inContext___block_invoke;
  v21[3] = &unk_1E3660AB0;
  v22 = v9;
  v23 = v8;
  objc_msgSend(v10, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v16, v21);
  v18 = objc_claimAutoreleasedReturnValue();

  v17 = (id)v18;
  if (v18)
  {
LABEL_3:
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v20;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "%@ failed with error: %@", buf, 0x16u);

    }
  }

}

- (void)updateKeyAssetsInAlbums:(id)a3
{
  +[PLGenericAlbum updateKeyAssetsInAlbums:photoLibrary:](PLGenericAlbum, "updateKeyAssetsInAlbums:photoLibrary:", a3, self);
}

- (void)deleteExpiredTrashedResources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("(trashedState = %d OR trashedState = %d) AND trashedDate < %@"), 1, 2, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v9);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__PLPhotoLibrary_deleteExpiredTrashedResources__block_invoke;
  v10[3] = &unk_1E3677C18;
  v10[4] = self;
  v11 = v5;
  v8 = v5;
  -[PLPhotoLibrary performTransactionAndWait:](self, "performTransactionAndWait:", v10);

}

- (void)deleteExpiredTrashedAssetsAndAlbums
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
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[4];

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2592000.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("(trashedState = %d OR trashedState = %d) AND trashedDate < %@ AND (complete != 0)"), 1, 2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v8);
  v9 = (void *)MEMORY[0x1E0C97B48];
  +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2592000.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithFormat:", CFSTR("(trashedState = %d OR trashedState = %d) AND trashedDate < %@"), 1, 2, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPredicate:", v14);
  v15 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __53__PLPhotoLibrary_deleteExpiredTrashedAssetsAndAlbums__block_invoke;
  v19[3] = &unk_1E3676EC8;
  v19[4] = self;
  v16 = v5;
  v20 = v16;
  v22 = v23;
  v17 = v11;
  v21 = v17;
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __53__PLPhotoLibrary_deleteExpiredTrashedAssetsAndAlbums__block_invoke_760;
  v18[3] = &unk_1E3677580;
  v18[4] = v23;
  -[PLPhotoLibrary performTransaction:completionHandler:](self, "performTransaction:completionHandler:", v19, v18);

  _Block_object_dispose(v23, 8);
}

- (void)deleteUnknownDeferredIntermediatesWithCompletionHandler:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v13 = a3;
  -[PLPhotoLibrary libraryBundle](self, "libraryBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSystemPhotoLibrary");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB3880];
    +[PLManagedAsset listOfStatesWithOutstandingDeferredPhotoProcessingWork](PLManagedAsset, "listOfStatesWithOutstandingDeferredPhotoProcessingWork");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateWithFormat:", CFSTR("deferredProcessingNeeded IN %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setPredicate:", v11);
    objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", &unk_1E3763248);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__PLPhotoLibrary_deleteUnknownDeferredIntermediatesWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E3676290;
    v14[4] = self;
    v15 = v8;
    v16 = v13;
    v12 = v8;
    -[PLPhotoLibrary performBlockAndWait:](self, "performBlockAndWait:", v14);

  }
}

- (void)deleteUnusedCameraMetadataPaths
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
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3880];
  +[PLManagedAsset listOfStatesWithOutstandingDeferredPhotoProcessingWork](PLManagedAsset, "listOfStatesWithOutstandingDeferredPhotoProcessingWork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("deferredProcessingNeeded IN %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v8);
  -[PLPhotoLibrary pathManager](self, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "privateDirectoryWithSubType:createIfNeeded:error:", 9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E20];
  v22 = 0;
  objc_msgSend(v11, "contentsOfDirectoryAtPath:error:", v10, &v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v22;
  objc_msgSend(v12, "setWithArray:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __49__PLPhotoLibrary_deleteUnusedCameraMetadataPaths__block_invoke;
    v17[3] = &unk_1E3670C40;
    v17[4] = self;
    v18 = v5;
    v19 = v11;
    v20 = v15;
    v21 = v10;
    -[PLPhotoLibrary performBlockAndWait:](self, "performBlockAndWait:", v17);

  }
  else
  {
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v14;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Error getting contents of camera metadata path: %@", buf, 0xCu);
    }

  }
}

- (void)deleteTTRDeferredIntermediates
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManager photoDirectoryWithType:](self->_pathManager, "photoDirectoryWithType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("/Deferred/tmpCaptureContainers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "fileExistsAtPath:", v5))
  {
    v9 = 0;
    v6 = objc_msgSend(v3, "removeItemAtPath:error:", v5, &v9);
    v7 = v9;
    if ((v6 & 1) == 0)
    {
      PLBackendGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v11 = v5;
        v12 = 2112;
        v13 = v7;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Failed to remove temporary capture containers for TTRs at path: %@ with error: %@", buf, 0x16u);
      }

    }
  }

}

- (unint64_t)sharedStreamsSize
{
  void *v3;
  void *v4;
  int v5;
  PLPhotoLibraryPathManager *pathManager;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[PLPhotoLibraryPathManager photoDirectoryWithType:](self->_pathManager, "photoDirectoryWithType:", 22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrary pathManager](self, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUBF");

  pathManager = self->_pathManager;
  if (v5)
    -[PLPhotoLibraryPathManager photoDirectoryWithType:](pathManager, "photoDirectoryWithType:", 14);
  else
    -[PLPhotoLibraryPathManager photoMetadataDirectoryForMediaInMainDirectory:](pathManager, "photoMetadataDirectoryForMediaInMainDirectory:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _sizeOfDirectories(v8);

  return v9;
}

- (BOOL)isCloudPhotoLibraryEnabled
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[PLPhotoLibrary libraryServicesManager](self, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isCloudPhotoLibraryEnabled");
  }
  else
  {
    -[PLPhotoLibrary pathManager](self, "pathManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "libraryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = PLIsCloudPhotoLibraryEnabledForPhotoLibraryURL(v7);

  }
  return v5;
}

- (id)mainScopeIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLPhotoLibrary libraryBundle](self, "libraryBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "libraryServicesManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "libraryServicesManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mainScopeIdentifier");
    }
    else
    {
      +[PLCPLSettings settingsWithLibraryBundle:](PLCPLSettings, "settingsWithLibraryBundle:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deriveMainScopeIdentifier");
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CPLPrimaryScopeIdentifierForCurrentUniverse();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (unint64_t)numberOfCPLSupportedAssetsOfKind:(signed __int16)a3 includingTrashedSinceDate:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  id v23;
  NSObject *v24;
  id v26;
  uint8_t buf[4];
  id v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v4 = a3;
  v30[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("kind == %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3528];
  v30[0] = v12;
  +[PLManagedAsset predicateForSupportedAssetTypesForUploadWithoutMomentSharesAndPlaceholders](PLManagedAsset, "predicateForSupportedAssetTypesForUploadWithoutMomentSharesAndPlaceholders");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("trashedDate >= %@ || trashedState == %d"), v6, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3528];
    v29[0] = v16;
    v29[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "andPredicateWithSubpredicates:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v20;
  }
  objc_msgSend(v9, "setPredicate:", v16);
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v22 = objc_msgSend(v21, "countForFetchRequest:error:", v9, &v26);
  v23 = v26;

  if (v22 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v23;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Could not fetch count of pushable assets: %@", buf, 0xCu);
      }

    }
    v22 = 0;
  }

  return v22;
}

- (unint64_t)numberOfUnpushedAssetsOfKind:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  id v24;
  _QWORD v25[3];

  v3 = a3;
  v25[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("noindex(kind) == %@ && noindex(cloudLocalState) == %@ && trashedState != %d"), v9, &unk_1E375D4E8, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3528];
  v25[0] = v10;
  +[PLManagedAsset predicateForSupportedAssetTypesForUploadWithoutMomentSharesAndPlaceholders](PLManagedAsset, "predicateForSupportedAssetTypesForUploadWithoutMomentSharesAndPlaceholders");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v14);
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v16 = objc_msgSend(v15, "countForFetchRequest:error:", v7, &v20);
  v17 = v20;

  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        v22 = v3;
        v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Could not fetch count of unpushed assets with type %d: %@", buf, 0x12u);
      }

    }
    v16 = 0;
  }

  return v16;
}

- (id)personInfoManager
{
  void *v2;
  void *v3;

  -[PLPhotoLibrary libraryBundle](self, "libraryBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personInfoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cplStatus
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PLPhotoLibrary pathManager](self, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSystemPhotoLibraryPathManager");

  if (v4)
  {
    if (PLIsAssetsd())
    {
      -[PLPhotoLibrary libraryServicesManager](self, "libraryServicesManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cloudPhotoLibraryManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cplStatus");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        -[PLPhotoLibrary pathManager](self, "pathManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        CPLStatusFromPathManager(v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      -[PLPhotoLibrary pathManager](self, "pathManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      CPLStatusFromPathManager(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)isWalrusEnabled
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = PLIsCloudPhotoLibraryEnabledForCurrentUser();
  if (v3)
  {
    -[PLPhotoLibrary cplStatus](self, "cplStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isWalrusEnabled");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)signalBackgroundProcessingNeeded
{
  void *v3;
  id v4;

  -[PLPhotoLibrary libraryServicesManager](self, "libraryServicesManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundJobService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signalBackgroundProcessingNeededOnLibrary:", self);

}

void __49__PLPhotoLibrary_deleteUnusedCameraMetadataPaths__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  __int128 v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __49__PLPhotoLibrary_deleteUnusedCameraMetadataPaths__block_invoke_2;
  v27[3] = &unk_1E3677A78;
  v3 = *(_QWORD *)(a1 + 40);
  v28 = *(id *)(a1 + 48);
  v29 = *(id *)(a1 + 56);
  v4 = (id)objc_msgSend(v2, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v3, 0, v27);

  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(*(id *)(a1 + 56), "count");
    v7 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 134218242;
    v32 = v6;
    v33 = 2112;
    v34 = v7;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Found %lu assets with orphaned camera metadata paths: %@", buf, 0x16u);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = *(id *)(a1 + 56);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v24;
    *(_QWORD *)&v10 = 138412290;
    v21 = v10;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(a1 + 64), "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13), v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(void **)(a1 + 48);
        v22 = 0;
        v16 = objc_msgSend(v15, "removeItemAtPath:error:", v14, &v22);
        v17 = v22;
        if ((v16 & 1) == 0)
        {
          PLBackendGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            v32 = (uint64_t)v17;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Failed to remove camera metadata at path: %@", buf, 0xCu);
          }

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v11);
  }

  PLBackendGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412290;
    v32 = v20;
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Deleted camera metadata paths: %@", buf, 0xCu);
  }

}

void __49__PLPhotoLibrary_deleteUnusedCameraMetadataPaths__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "pathForCameraMetadataFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "pathForCameraMetadataFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "fileExistsAtPath:", v6))
  {

    goto LABEL_5;
  }
  v7 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v9);

  v8 = v9;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v9);
LABEL_5:
    v8 = v9;
  }

}

void __74__PLPhotoLibrary_deleteUnknownDeferredIntermediatesWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v29 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v29);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v29;
  v6 = v5;
  if (v4)
  {
    v21 = v5;
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = v4;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "additionalAttributes", v21);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "deferredPhotoIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "length"))
          {
            objc_msgSend(v7, "addObject:", v15);
            +[PLPhotoLibrary requestIdentifierFromDeferredIdentifier:](PLPhotoLibrary, "requestIdentifierFromDeferredIdentifier:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v16);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v11);
    }

    PLDeferredProcessingGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134218242;
      v31 = v18;
      v32 = 2112;
      v33 = v7;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Found %tu assets with deferred identifiers %@", buf, 0x16u);
    }

    v19 = -[PLDeferredPhotoFinalizer initForUseCase:]([PLDeferredPhotoFinalizer alloc], "initForUseCase:", 2);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __74__PLPhotoLibrary_deleteUnknownDeferredIntermediatesWithCompletionHandler___block_invoke_768;
    v23[3] = &unk_1E3660B00;
    v24 = *(id *)(a1 + 48);
    objc_msgSend(v19, "deleteIntermediatesExcludingDeferredIdentifierRequestIdentifiers:withCompletionHandler:", v8, v23);

    v4 = v22;
    v6 = v21;
  }
  else
  {
    PLDeferredProcessingGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = (uint64_t)v6;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to fetch assets with outstanding deferred processing needed with error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __74__PLPhotoLibrary_deleteUnknownDeferredIntermediatesWithCompletionHandler___block_invoke_768(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLDeferredProcessingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a2;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Requested deletion of %zd intermediates from deferredmediad", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__PLPhotoLibrary_deleteExpiredTrashedAssetsAndAlbums__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deleting expired burst's non-favorite from trash"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deleting expired asset from trash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __53__PLPhotoLibrary_deleteExpiredTrashedAssetsAndAlbums__block_invoke_2;
  v21[3] = &unk_1E3660AD8;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 56);
  v21[4] = *(_QWORD *)(a1 + 32);
  v24 = v8;
  v9 = v4;
  v22 = v9;
  v10 = v6;
  v23 = v10;
  v11 = (id)objc_msgSend(v2, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v7, 0, v21);
  objc_msgSend(v2, "executeFetchRequest:error:", *(_QWORD *)(a1 + 48), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "delete");
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

void __53__PLPhotoLibrary_deleteExpiredTrashedAssetsAndAlbums__block_invoke_760()
{
  NSObject *v0;
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    NSLocalizedFileSizeDescription();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_199541000, v0, OS_LOG_TYPE_DEFAULT, "Deleted %@ of assets from the trash.", (uint8_t *)&v2, 0xCu);

  }
}

void __53__PLPhotoLibrary_deleteExpiredTrashedAssetsAndAlbums__block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  PLAvalanche *v4;
  void *v5;
  PLAvalanche *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isDeleted") & 1) == 0)
  {
    if (objc_msgSend(v3, "isAvalancheStackPhoto"))
    {
      v4 = [PLAvalanche alloc];
      objc_msgSend(v3, "avalancheUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PLAvalanche initWithUUID:photoLibrary:](v4, "initWithUUID:photoLibrary:", v5, a1[4]);

      -[PLAvalanche assets](v6, "assets");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");

      -[PLAvalanche userFavorites](v6, "userFavorites");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "minusOrderedSet:", v9);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += objc_msgSend(v15, "originalFilesize", (_QWORD)v19);
            objc_msgSend(v15, "deleteWithReason:", a1[5]);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        }
        while (v12);
      }

      objc_msgSend(v9, "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLAvalanche disolveBurstForAssets:permanently:](PLAvalanche, "disolveBurstForAssets:permanently:", v16, 1);

    }
    else if ((objc_msgSend(v3, "isAvalanchePhoto") & 1) == 0)
    {
      if (objc_msgSend(v3, "isAvalanchePhoto"))
      {
        PLBackendGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v3, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v24 = v18;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_FAULT, "Expected avalanche identifier is missing for asset: %{public}@", buf, 0xCu);

        }
      }
      *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += objc_msgSend(v3, "originalFilesize");
      objc_msgSend(v3, "deleteWithReason:", a1[6]);
    }
  }

}

void __47__PLPhotoLibrary_deleteExpiredTrashedResources__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v5)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Can't retrieve resources: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v2, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v4, &__block_literal_global_753);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Can't delete resources from the trash. Error: %@", buf, 0xCu);
    }

  }
}

void __47__PLPhotoLibrary_deleteExpiredTrashedResources__block_invoke_751(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLBackendGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "objectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Deleted resource from the trash: %@", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(v2, "applyTrashedState:", 2);

}

void __78__PLPhotoLibrary__updateMemoryCountKeyPath_withPendingCountKeyPath_inContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "valueForKeyPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longLongValue");

  objc_msgSend(v4, "setValue:forKeyPath:", &unk_1E375D4D0, *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "valueForKeyPath:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue") + v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", v9, *(_QWORD *)(a1 + 40));

}

void __77__PLPhotoLibrary__updateAssetCountKeyPath_withPendingCountKeyPath_inContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "valueForKeyPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "setValue:forKeyPath:", &unk_1E375D4D0, *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "valueForKeyPath:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue") + v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", v9, *(_QWORD *)(a1 + 40));

}

void *__71__PLPhotoLibrary_old_refreshCachedCountsOnAllAssetContainersInContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *Mutable;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  Mutable = (void *)objc_claimAutoreleasedReturnValue();

  if (!Mutable)
  {
    Mutable = CFArrayCreateMutable(0, 3, 0);
    CFArrayAppendValue((CFMutableArrayRef)Mutable, 0);
    CFArrayAppendValue((CFMutableArrayRef)Mutable, 0);
    CFArrayAppendValue((CFMutableArrayRef)Mutable, 0);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", Mutable, v3);
    CFRelease(Mutable);
  }

  return Mutable;
}

void __71__PLPhotoLibrary_old_refreshCachedCountsOnAllAssetContainersInContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "albums", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "objectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "moment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v3, "moment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __71__PLPhotoLibrary_old_refreshCachedCountsOnAllAssetContainersInContext___block_invoke(uint64_t a1, void *a2, const __CFArray *a3)
{
  int v4;
  CFIndex v5;
  char *ValueAtIndex;
  char *v7;

  v4 = objc_msgSend(a2, "kind");
  if (!v4)
  {
    v5 = 0;
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v5 = 1;
LABEL_5:
    ValueAtIndex = (char *)CFArrayGetValueAtIndex(a3, v5);
    CFArraySetValueAtIndex(a3, v5, ValueAtIndex + 1);
  }
  v7 = (char *)CFArrayGetValueAtIndex(a3, 2) + 1;
  CFArraySetValueAtIndex(a3, 2, v7);
}

void __44__PLPhotoLibrary_hasCompletedMomentAnalysis__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  +[PLMoment allMomentsRequiringAnalysisInManagedObjectContext:error:](PLMoment, "allMomentsRequiringAnalysisInManagedObjectContext:error:", v2, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;

  if (v3)
    v5 = objc_msgSend(v3, "count") == 0;
  else
    v5 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;

}

uint64_t __44__PLPhotoLibrary_incompleteRestoreProcesses__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "didImportFileSystemAssets");

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", CFSTR("importFileSystemAssets"));
  result = objc_msgSend(*(id *)(a1 + 32), "hasPendingAssetsIgnoreiTunes:", 0);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", CFSTR("pendingAssets"));
  return result;
}

uint64_t __40__PLPhotoLibrary_reportLibrarySizeToDAS__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = 0;
  v3 = 0;
  objc_msgSend(*(id *)(a1 + 32), "getPhotoCount:videoCount:", &v4, &v3);
  v2 = 0;
  return objc_msgSend(MEMORY[0x1E0D00E70], "reportSystemWorkload:ofCategory:error:", v3 + v4, 10, &v2);
}

void __51__PLPhotoLibrary_hasCompletedRestorePostProcessing__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;

  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "didImportFileSystemAssets");

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    v5 = CFSTR("import file system assets");
LABEL_6:
    *(_QWORD *)(v3 + 40) = v5;

    return;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "hasPendingAssetsIgnoreiTunes:", 0) ^ 1;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    v5 = CFSTR("pending assets");
    goto LABEL_6;
  }
}

uint64_t __30__PLPhotoLibrary_librarySizes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setPredicate:", v3);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__PLPhotoLibrary_librarySizes__block_invoke_2;
  v7[3] = &unk_1E3676EA0;
  v4 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 32);
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v5;
}

void __30__PLPhotoLibrary_librarySizes__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "executeFetchRequest:error:", *(_QWORD *)(a1 + 40), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sum"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "unsignedIntegerValue");

  }
}

void __62__PLPhotoLibrary_countOfReferencedMediaWithCompletionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v5 = 0;
  objc_msgSend(v2, "countForFetchRequest:error:", v3, &v5);
  v4 = v5;
  (*(void (**)(void))(a1[6] + 16))();

}

void __208__PLPhotoLibrary_addDCIMEntryAtFileURL_mainFileMetadata_previewImage_thumbnailImage_savedAssetType_replacementUUID_publicGlobalUUID_extendedInfo_withUUID_isPlaceholder_placeholderFileURL_forFinalCameraImage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unsigned int v22;
  __CFString ***v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;

  v34 = 0;
  v35 = 0;
  BYTE1(v30) = 1;
  LOBYTE(v30) = *(_BYTE *)(a1 + 122);
  +[PLManagedAsset insertAssetIntoPhotoLibrary:mainFileURL:mainFileMetadata:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:isPlaceholder:deleteFileOnFailure:](PLManagedAsset, "insertAssetIntoPhotoLibrary:mainFileURL:mainFileMetadata:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:isPlaceholder:deleteFileOnFailure:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(__int16 *)(a1 + 120), 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), &v35, &v34, v30);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v34;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v2;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
  if (v6)
  {
    if (*(_BYTE *)(a1 + 122))
    {
      objc_msgSend(v6, "setAttributesFromMainFileURL:mainFileMetadata:savedAssetType:bundleScope:isPlaceholder:placeholderFileURL:imageSource:imageData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(__int16 *)(a1 + 120), 0, 1, *(_QWORD *)(a1 + 72), 0, 0);
      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
    }
    v32 = 0;
    v33 = 0;
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLStringUUIDComponents(v7, &v33, &v32);

    kdebug_trace();
    objc_msgSend(*(id *)(a1 + 80), "objectForKey:", *MEMORY[0x1E0D74CC8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setImportedByBundleIdentifier:", v8);
    objc_msgSend(*(id *)(a1 + 80), "objectForKey:", *MEMORY[0x1E0D74CC0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[PLAdditionalAssetAttributes shouldPersistImportedByDisplayName:](PLAdditionalAssetAttributes, "shouldPersistImportedByDisplayName:", v9))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setImportedByDisplayName:", v9);
    }
    objc_msgSend(*(id *)(a1 + 80), "objectForKey:", *MEMORY[0x1E0D74E58]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", v10, *(_QWORD *)(a1 + 32));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setOriginalAsset:", v11);

    }
    objc_msgSend(*(id *)(a1 + 80), "objectForKey:", *MEMORY[0x1E0D74D48]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setMetadataFromCustomRenderedValue:", objc_msgSend(v12, "integerValue"));
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "hasAdjustments"))
    {

      v3 = 0;
      v35 = 0;
    }
    if (*(_QWORD *)(a1 + 88))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setDisableFileSystemPersistency:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setPublicGlobalUUID:", *(_QWORD *)(a1 + 88));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setDisableFileSystemPersistency:", 0);
    }
    BYTE1(v29) = 1;
    LOBYTE(v29) = *(_BYTE *)(a1 + 123);
    v31 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:metadata:forceSRGBConversion:forFinalCameraImage:saveCameraPreviewWellImage:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), v35, v3, 0, 0, v29);
    v14 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "isPhoto");
    objc_msgSend(*(id *)(a1 + 80), "objectForKey:", *MEMORY[0x1E0D74D18]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = objc_msgSend(v15, "BOOLValue");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "additionalAttributes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCameraCaptureDevice:", v17 ^ 1u);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "additionalAttributes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v17)
        v21 = 1;
      else
        v21 = 2;
      objc_msgSend(v19, "setImportedBy:", v21);

      if (v14)
      {
        v22 = +[PLManagedAsset imageHDRTypeFromCustomRenderedValue:](PLManagedAsset, "imageHDRTypeFromCustomRenderedValue:", objc_msgSend(v13, "shortValue"))- 2;
        if (v22 <= 2)
        {
          v23 = off_1E3660B38;
          if (!v17)
            v23 = off_1E3660B50;
          v24 = (uint64_t)*v23[v22];
          if (v24)
            PLSAggregateDictionaryAddValueForScalarKey(v24, 1);
        }
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 80), "objectForKey:", CFSTR("ImportedBy"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        v27 = objc_msgSend(v25, "intValue");
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "additionalAttributes");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setImportedBy:", v27);

      }
    }

    if (*(_BYTE *)(a1 + 122)
      && *(_QWORD *)(a1 + 72)
      && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "hasOriginalFile") & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "persistMetadataToFileURL:", *(_QWORD *)(a1 + 72));
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "persistMetadataToFilesystem");
    }
    v3 = v31;

  }
}

void __208__PLPhotoLibrary_addDCIMEntryAtFileURL_mainFileMetadata_previewImage_thumbnailImage_savedAssetType_replacementUUID_publicGlobalUUID_extendedInfo_withUUID_isPlaceholder_placeholderFileURL_forFinalCameraImage___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEC1554]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __42__PLPhotoLibrary_modifyDCIMEntryForPhoto___block_invoke(uint64_t a1)
{
  id v2;
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
  void *v13;
  void *v14;
  id v15;

  v2 = objc_alloc(MEMORY[0x1E0D75140]);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "libraryBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeZoneLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v2, "initWithMediaURL:timeZoneLookup:", v3, v5);

  v6 = *(void **)(a1 + 48);
  objc_msgSend(v15, "fileSystemProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOriginalFilesize:", objc_msgSend(v8, "unsignedIntegerValue"));

  v9 = *(void **)(a1 + 48);
  objc_msgSend(v15, "cgImageProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setThumbnailDataFromImageProperties:", v10);

  v11 = *(void **)(a1 + 48);
  objc_msgSend(v15, "gpsLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocation:", v12);

  v13 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setModificationDate:", v14);

}

void __45__PLPhotoLibrary__removeOldFaceMetadataAsync__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(*(id *)(a1 + 32), "pathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateDirectoryWithSubType:createIfNeeded:error:", 4, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  +[PLPhotoLibrary removeFaceMetadataAtURL:includingPeople:](PLPhotoLibrary, "removeFaceMetadataAtURL:includingPeople:", v4, 1);
}

uint64_t __49__PLPhotoLibrary__enumerateFilesAtURL_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  PLMigrationGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Unable to enumerate '%@': %@", (uint8_t *)&v9, 0x16u);

  }
  return 1;
}

void __38__PLPhotoLibrary__rebuildSocialGroups__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "payloadID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payloadIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphNode graphNodeWithUUID:inManagedObjectContext:](PLGraphNode, "graphNodeWithUUID:inManagedObjectContext:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v9, "insertSocialGroupInManagedObjectContext:", v7);

  }
}

void __74__PLPhotoLibrary__recreateItemsFromMetadataAtDirectoryURLs_includeAlbums___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0;
  v4 = *MEMORY[0x1E0C99A90];
  v10 = 0;
  v5 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v11, v4, &v10);
  v6 = v11;
  v7 = v10;
  if (v5 && objc_msgSend(v6, "length"))
  {
    if (+[PLPersistedAlbumMetadata isValidPath:](PLPersistedAlbumMetadata, "isValidPath:", v6)
      && *(_BYTE *)(a1 + 72))
    {
      v8 = *(void **)(a1 + 32);
LABEL_20:
      objc_msgSend(v8, "addObject:", v3);
      goto LABEL_21;
    }
    if (+[PLPersistedFolderMetadata isValidPath:](PLPersistedFolderMetadata, "isValidPath:", v6)
      && *(_BYTE *)(a1 + 72))
    {
      v8 = *(void **)(a1 + 40);
      goto LABEL_20;
    }
    if (+[PLManagedAlbumList isValidPathForPersistence:](PLManagedAlbumList, "isValidPathForPersistence:", v6)&& *(_BYTE *)(a1 + 72))
    {
      v8 = *(void **)(a1 + 48);
      goto LABEL_20;
    }
    if (+[PLPersistedMemoryMetadata isValidPath:](PLPersistedMemoryMetadata, "isValidPath:", v6))
    {
      v8 = *(void **)(a1 + 56);
      goto LABEL_20;
    }
    if (+[PLPersistedPersonMetadata isValidPath:](PLPersistedPersonMetadata, "isValidPath:", v6))
    {
      v8 = *(void **)(a1 + 64);
      goto LABEL_20;
    }
  }
  else if (v7)
  {
    PLMigrationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = v3;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to get file name for %@ (%@)", buf, 0x16u);
    }

  }
LABEL_21:

}

uint64_t __74__PLPhotoLibrary__recreateItemsFromMetadataAtDirectoryURLs_includeAlbums___block_invoke_536(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v9;
  id v10;

  v10 = 0;
  v4 = *MEMORY[0x1E0C998D8];
  v5 = a3;
  objc_msgSend(a2, "getResourceValue:forKey:error:", &v10, v4, 0);
  v9 = 0;
  v6 = v10;
  objc_msgSend(v5, "getResourceValue:forKey:error:", &v9, v4, 0);

  v7 = objc_msgSend(v9, "compare:", v6);
  return v7;
}

void __56__PLPhotoLibrary_cleanupIncompleteAssetsAfterOTARestore__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id WeakRetained;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 48)
    && (objc_msgSend(v3, "objectIDsForRelationshipNamed:", CFSTR("master")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    PLMigrationGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Mega-backup: Asset with UUID %{public}@ has a CloudMaster, setting complete", (uint8_t *)&v18, 0xCu);

    }
    objc_msgSend(v4, "setComplete:", 1);
  }
  else
  {
    objc_msgSend(v4, "mainFileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", v10) & 1) != 0)
    {
      PLMigrationGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(unsigned __int8 *)(a1 + 48);
        v18 = 138543874;
        v19 = v12;
        v20 = 2114;
        v21 = v10;
        v22 = 1024;
        v23 = v13;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Fixing incomplete asset (main file is present) after restore cancelled/completed: uuid:%{public}@ path:%{public}@ isMegaBackup:%d", (uint8_t *)&v18, 0x1Cu);

      }
      objc_msgSend(v4, "setComplete:", 1);
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 128));
      objc_msgSend(WeakRetained, "modelMigrator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "postProcessFixesAfterOTARestoreForCompleteAsset:fixAddedDate:isMegaBackup:", v4, 0, *(unsigned __int8 *)(a1 + 48));

    }
    else
    {
      PLMigrationGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v17;
        v20 = 2114;
        v21 = v10;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Deleting incomplete asset after restore cancelled/completed: uuid:%{public}@ path:%{public}@", (uint8_t *)&v18, 0x16u);

      }
      objc_msgSend(v4, "deleteFromDatabaseOnly");
    }

  }
}

void __56__PLPhotoLibrary_cleanupIncompleteAssetsAfterOTARestore__block_invoke_496(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(*(id *)(a1 + 32), "otaRestoreProgressAlbum");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "pendingItemsType") != 1 || objc_msgSend(v1, "pendingItemsCount"))
  {
    PLMigrationGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Marking OTA restore progress as complete", v3, 2u);
    }

    objc_msgSend(v1, "setPendingItemsType:", 1);
    objc_msgSend(v1, "setPendingItemsCount:", 0);
  }

}

void __83__PLPhotoLibrary_dataMigratorSupportCleanupModelForDataMigrationPurgeMissingSynced__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(*(id *)(a1 + 40), "_fetchCompleteAssetIDsWithValidatedSavedAssetTypeMask:context:", objc_msgSend(MEMORY[0x1E0D73310], "maskForFinderSyncedAsset"), *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGenericAlbum allSyncedAlbumsInManagedObjectContext:](PLManagedAlbum, "allSyncedAlbumsInManagedObjectContext:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "delete");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
    objc_msgSend(*(id *)(a1 + 40), "_safeSave:", *(_QWORD *)(a1 + 48));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%s] Data migration housekeeping after the backedup files have been restored. Deleting all synced assets and their albums from the database. The assets themselves are not backed up."), "-[PLPhotoLibrary dataMigratorSupportCleanupModelForDataMigrationPurgeMissingSynced]_block_invoke");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "batchDeleteAssets:withReason:", v3, v10);
    objc_autoreleasePoolPop(v2);
  }
}

void __46__PLPhotoLibrary__deleteObsoleteMetadataFiles__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "pathForMetadataDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "filename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v4);
      }
      if (objc_msgSend(v3, "isVideo"))
      {
        objc_msgSend(v3, "pathForVideoPreviewFile");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 40), "fileExistsAtPath:", v7))
        {
          objc_msgSend(v7, "lastPathComponent");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v8);

        }
        objc_msgSend(v3, "fileURLForThumbnailFile");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(*(id *)(a1 + 40), "fileExistsAtPath:", v10))
        {
          objc_msgSend(v10, "lastPathComponent");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v11);

        }
      }
      objc_msgSend(v3, "pathForNonAdjustedFullsizeImageFile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = a1;
      if (objc_msgSend(*(id *)(a1 + 40), "fileExistsAtPath:", v12))
      {
        objc_msgSend(v12, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v13);

      }
      objc_msgSend(v3, "modernResources", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v29 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v19, "dataStoreKey");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v19, "version"))
            {
              if (objc_msgSend(v19, "isDerivative"))
                v21 = v20 == 0;
              else
                v21 = 1;
              if (!v21)
              {
                objc_msgSend(v3, "assetID");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "fileURLForAssetID:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v23, "lastPathComponent");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "addObject:", v24);

              }
            }

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v16);
      }
      objc_msgSend(*(id *)(v27 + 48), "managedObjectContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "refreshObject:mergeChanges:", v3, objc_msgSend(v3, "hasChanges"));

    }
  }

}

void __54__PLPhotoLibrary__inq_createPhotoStreamAlbumStreamID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[PLPhotoStreamAlbum photoStreamAlbumWithStreamID:inPhotoLibrary:createIfNeeded:](PLPhotoStreamAlbum, "photoStreamAlbumWithStreamID:inPhotoLibrary:createIfNeeded:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = +[PLGenericAlbum insertNewAlbumWithKind:title:intoLibrary:](PLGenericAlbum, "insertNewAlbumWithKind:title:intoLibrary:", 1500, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v2 = 0;
  }

}

BOOL __76__PLPhotoLibrary_countOfLocalAlbumsContainingAssets_assetsInSomeAlbumCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "kindValue") == 2;
}

void __58__PLPhotoLibrary_deleteITunesSyncedContentForEnablingiCPL__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForFinderSyncedAsset"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchBatchSize:", 100);
  objc_msgSend(v5, "setPredicate:", v6);
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  v32 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v5, &v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v32;
  if (!v7)
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to get all assets for deletion: %@", buf, 0xCu);
    }

  }
  v23 = v8;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v15), "albums");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "unionSet:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v13);
  }

  +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", CFSTR("Deleting iTunes synced content to enable iCloud Photos."));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "batchDeleteAssets:withReason:", v11, v17);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = v10;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(v2, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v22++));
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v20);
  }

}

void __41__PLPhotoLibrary_iTunesSyncedContentInfo__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  _QWORD v33[3];
  _QWORD v34[3];
  uint8_t buf[4];
  id v36;
  _QWORD v37[2];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForFinderSyncedAsset"), 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB3528];
  v38[0] = v1;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3528];
  v29 = (void *)v1;
  v37[0] = v1;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0C97B48]);
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithEntityName:", v11);

  objc_msgSend(v12, "setPredicate:", v5);
  v13 = objc_alloc(MEMORY[0x1E0C97B48]);
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithEntityName:", v14);

  objc_msgSend(v15, "setPredicate:", v9);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v17 = objc_msgSend(v16, "countForFetchRequest:error:", v12, &v32);
  v18 = v32;
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v18;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Error getting count of iTunes synced photos: %@", buf, 0xCu);
    }

  }
  v31 = v18;
  v20 = objc_msgSend(v16, "countForFetchRequest:error:", v15, &v31);
  v21 = v31;

  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLBackendGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v21;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Error getting count of iTunes synced videos: %@", buf, 0xCu);
    }

  }
  v33[0] = CFSTR("PLITunesSyncedContentInfoPhotoCountKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v23;
  v33[1] = CFSTR("PLITunesSyncedContentInfoVideoCountKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v24;
  v33[2] = CFSTR("PLITunesSyncedContentInfoAssetCountKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20 + v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v28 = *(void **)(v27 + 40);
  *(_QWORD *)(v27 + 40) = v26;

}

void __40__PLPhotoLibrary_hasITunesSyncedContent__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForFinderSyncedAsset"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", v2);
  objc_msgSend(v5, "setResultType:", 2);
  objc_msgSend(v5, "setPropertiesToFetch:", &unk_1E3763200);
  objc_msgSend(v5, "setFetchLimit:", 1);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v5, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;

  if (v8)
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Error attempting to count iTunes synced assets: %@", buf, 0xCu);
    }

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "count") != 0;

}

void __47__PLPhotoLibrary_handlePersistentStoreRemoval___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

id __33__PLPhotoLibrary_unloadDatabase___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 88);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", *(_QWORD *)(a1 + 32));

    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 88);
  }
  *(_QWORD *)(v2 + 88) = 0;

  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 96), 0);
}

void __43__PLPhotoLibrary__setManagedObjectContext___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
}

void __42__PLPhotoLibrary_enableOpportunisticTasks__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = sOpportunisticTasksDisabled;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Enable opportunistic tasks invoked (was %d)", (uint8_t *)v5, 8u);
  }

  v3 = sOpportunisticTasksDisabled;
  if (sOpportunisticTasksDisabled < 1)
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v5[0]) = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Attempted to enable opportunistic tasks when not disabled", (uint8_t *)v5, 2u);
    }

  }
  else
  {
    if (sOpportunisticTasksDisabled == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_reallyEnableOpportunisticTasks");
      v3 = sOpportunisticTasksDisabled;
    }
    sOpportunisticTasksDisabled = v3 - 1;
  }
}

+ (id)systemMainQueuePhotoLibrary
{
  if (PLIsAssetsd())
  {
    PLSimulateCrash();
    objc_msgSend(a1, "_internalSystemPhotoLibrary");
  }
  else
  {
    +[PLMainQueuePhotoLibrary systemMainQueuePhotoLibrary](PLMainQueuePhotoLibrary, "systemMainQueuePhotoLibrary");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)stringFromLibraryRole:(unint64_t)a3
{
  if (a3 < 3)
    return off_1E3660B20[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".UnknownRole(%tu)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)areOpportunisticTasksDisabled
{
  NSObject *v4;
  void *v6;
  _QWORD block[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoLibrary.m"), 451, CFSTR("areOpportunisticTasksDisabled can only be called from assetsd"));

  }
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend(a1, "opportunisticTaskIsolationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PLPhotoLibrary_areOpportunisticTasksDisabled__block_invoke;
  block[3] = &unk_1E3677580;
  block[4] = &v8;
  dispatch_sync(v4, block);

  LOBYTE(v4) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

+ (void)setPhotoStreamEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  NSObject *v6;
  _BOOL4 v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  PLMyPhotoStreamGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (v3)
      v5 = CFSTR("YES");
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "+setPhotoStreamEnabled %@", (uint8_t *)&v9, 0xCu);
  }

  PLMyPhotoStreamGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "ignoring request to enable Photo Stream", (uint8_t *)&v9, 2u);
    }
  }
  else
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "calling assetsd to delete all streams", (uint8_t *)&v9, 2u);
    }

    +[PLAssetsSaver sharedAssetsSaver](PLAssetsSaver, "sharedAssetsSaver");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject deletePhotoStreamData](v6, "deletePhotoStreamData");
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.PreferenceChanged"), 0, 0, 1u);
}

+ (void)setCloudAlbumSharingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  PLMyPhotoStreamGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (v3)
      v5 = CFSTR("YES");
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "+setCloudAlbumSharingEnabled %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharingEnablingJob enableCloudSharing:withPathManager:](PLCloudSharingEnablingJob, "enableCloudSharing:withPathManager:", v3, v6);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.PreferenceChanged"), 0, 0, 1u);
}

+ (void)postGlobalPhotoLibraryAvailableIfNecessary
{
  id v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "+[PLPhotoLibrary postGlobalPhotoLibraryAvailableIfNecessary]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3;
  pl_dispatch_once();

}

+ (id)fileReservationForFileAtPath:(id)a3 exclusive:(BOOL)a4
{
  int v4;
  uint64_t v5;
  _PLPhotoLibraryFileReservation *v6;

  if (a4)
    v4 = 36;
  else
    v4 = 16;
  v5 = open((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"), v4, 438);
  if ((v5 & 0x80000000) != 0)
    v6 = 0;
  else
    v6 = -[_PLPhotoLibraryFileReservation initWithFileDescriptor:]([_PLPhotoLibraryFileReservation alloc], "initWithFileDescriptor:", v5);
  return v6;
}

+ (BOOL)removeFaceMetadataAtURL:(id)a3 includingPeople:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  char v22;
  id v23;
  NSObject *v24;
  BOOL v25;
  id v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _QWORD v50[4];

  v50[1] = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C99A90];
  v50[0] = *MEMORY[0x1E0C99A90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __58__PLPhotoLibrary_removeFaceMetadataAtURL_includingPeople___block_invoke;
  v39[3] = &unk_1E3660878;
  v39[4] = &v40;
  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v27, v7, 0, v39);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v36 = 0u;
  v37 = 0u;
  v35 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v34 = 0;
        v14 = objc_msgSend(v13, "getResourceValue:forKey:error:", &v34, v6, 0);
        v15 = v34;
        v16 = v15;
        if (v14
          && objc_msgSend(v15, "length")
          && a4
          && +[PLPersistedPersonMetadata isValidPath:](PLPersistedPersonMetadata, "isValidPath:", v16))
        {
          objc_msgSend(v28, "addObject:", v13);
        }

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    }
    while (v10);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = v28;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v48, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v17);
        v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
        v29 = 0;
        v22 = objc_msgSend(v5, "removeItemAtURL:error:", v21, &v29);
        v23 = v29;
        if ((v22 & 1) == 0)
        {
          PLMigrationGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v45 = v21;
            v46 = 2112;
            v47 = v23;
            _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Unable to remove metadata at URL: %@: %@", buf, 0x16u);
          }

          *((_BYTE *)v41 + 24) = 0;
        }

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v48, 16);
    }
    while (v18);
  }

  v25 = *((_BYTE *)v41 + 24) != 0;
  _Block_object_dispose(&v40, 8);

  return v25;
}

+ (id)photoOutboundSharingTmpDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateDirectoryWithSubType:createIfNeeded:error:", 2, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)masterURLFromSidecarURLs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObjectsFromArray:", v7);
  objc_msgSend(v6, "sortUsingFunction:context:", PrimaryURLSort, a1);
  objc_msgSend(v6, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)_loadFileExtensionInformation
{
  if (_loadFileExtensionInformation_onceToken != -1)
    dispatch_once(&_loadFileExtensionInformation_onceToken, &__block_literal_global_575);
}

+ (BOOL)isImageFileExtension:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_loadFileExtensionInformation");
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend((id)_imageFileExtensions, "containsObject:", v5);
  return (char)v4;
}

+ (BOOL)isRawImageFileExtension:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_loadFileExtensionInformation");
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend((id)_rawImageFileExtensions, "containsObject:", v5);
  return (char)v4;
}

+ (BOOL)isNonRawImageFileExtension:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  objc_msgSend(a1, "_loadFileExtensionInformation");
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)_imageFileExtensions, "containsObject:", v5))
    v6 = objc_msgSend((id)_rawImageFileExtensions, "containsObject:", v5) ^ 1;
  else
    LOBYTE(v6) = 0;

  return v6;
}

+ (BOOL)isVideoFileExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  char v11;

  v4 = a3;
  objc_msgSend(a1, "_loadFileExtensionInformation");
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8B3C0], "audiovisualMIMETypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39C0], "sharedMappings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MIMETypeForExtension:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "containsObject:", v8) & 1) != 0)
    v9 = 1;
  else
    v9 = objc_msgSend((id)_extraVideoExtensions, "containsObject:", v5);
  if ((objc_msgSend((id)_imageFileExtensions, "containsObject:", v5) & 1) != 0)
    LOBYTE(v10) = 0;
  else
    v10 = objc_msgSend((id)_audioFileExtensions, "containsObject:", v5) ^ 1;
  v11 = v9 & v10;

  return v11;
}

+ (BOOL)isAudioFileExtension:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_loadFileExtensionInformation");
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend((id)_audioFileExtensions, "containsObject:", v5);
  return (char)v4;
}

+ (BOOL)isAdjustmentEnvelopeExtension:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0D75A68], "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

+ (int)priorityForFileExtension:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLPhotoLibrary isNonRawImageFileExtension:](PLPhotoLibrary, "isNonRawImageFileExtension:", v3))
  {
    v4 = 1;
  }
  else if (+[PLPhotoLibrary isRawImageFileExtension:](PLPhotoLibrary, "isRawImageFileExtension:", v3))
  {
    v4 = 2;
  }
  else if (+[PLPhotoLibrary isVideoFileExtension:](PLPhotoLibrary, "isVideoFileExtension:", v3))
  {
    v4 = 3;
  }
  else if (+[PLPhotoLibrary isAudioFileExtension:](PLPhotoLibrary, "isAudioFileExtension:", v3))
  {
    v4 = 4;
  }
  else
  {
    v4 = 5;
  }

  return v4;
}

+ (void)_getResourceData:(id)a3 nonDerivativeSizeOut:(unint64_t *)a4 derivativesSizeOut:(unint64_t *)a5 fileBackedThumbnailsSizeOut:(unint64_t *)a6 tableThumbnailsSizeOut:(unint64_t *)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = a3;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    v27 = *(_QWORD *)v31;
    do
    {
      v14 = 0;
      v28 = v12;
      do
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v14);
        if ((int)objc_msgSend(v15, "localAvailability") >= 1)
        {
          v16 = objc_msgSend(v15, "recipeID");
          if (objc_msgSend(v15, "isDerivative"))
          {
            objc_msgSend(v15, "dataStore");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_opt_class();
            v19 = objc_opt_class();

            if (v18 == v19)
            {
              v25 = objc_msgSend(v15, "estimatedDataLength");
              v13 = v27;
              v12 = v28;
              do
                v26 = __ldaxr(a7);
              while (__stlxr(v26 + v25, a7));
            }
            else
            {
              v20 = objc_msgSend(v15, "estimatedDataLength");
              v13 = v27;
              v12 = v28;
              if ((v16 & 0xFFFF0000) == 0x40000)
              {
                do
                  v21 = __ldaxr(a6);
                while (__stlxr(v21 + v20, a6));
              }
              else
              {
                do
                  v22 = __ldaxr(a5);
                while (__stlxr(v22 + v20, a5));
              }
            }
          }
          else
          {
            v23 = objc_msgSend(v15, "estimatedDataLength");
            do
              v24 = __ldaxr(a4);
            while (__stlxr(v24 + v23, a4));
          }
        }
        ++v14;
      }
      while (v14 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v12);
  }

}

+ (id)savedPhotosOriginalsSizeWithSizeDataRef:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PLSavedPhotosSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLInternalSizeOriginals"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)savedPhotosReferenceMediaSizeWithSizeDataRef:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PLReferenceMediaSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLInternalSizeOriginals"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)configureEnumeratorForLibrarySizeInfo:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  SEL v17;
  id v18;
  void *v19;
  _QWORD v20[5];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoLibrary.m"), 3160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerator"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoLibrary.m"), 3161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = malloc_type_calloc(5uLL, 0x20uLL, 0x1000040E0EAB150uLL);
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __67__PLPhotoLibrary_configureEnumeratorForLibrarySizeInfo_completion___block_invoke;
  v20[3] = &__block_descriptor_40_e24_v16__0__PLManagedAsset_8l;
  v20[4] = v10;
  objc_msgSend(v7, "addAssetVisitor:", v20);
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __67__PLPhotoLibrary_configureEnumeratorForLibrarySizeInfo_completion___block_invoke_2;
  v15[3] = &unk_1E3660908;
  v18 = a1;
  v19 = v10;
  v16 = v9;
  v17 = a2;
  v12 = v9;
  objc_msgSend(v7, "addEndOfListVisitor:", v15);

}

+ (id)_resourcesInfoFromMoc:(id)a3
{
  id v4;
  PLLibraryContentsEnumerator *v5;
  id v6;
  id v7;
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2562;
  v15 = __Block_byref_object_dispose__2563;
  v16 = 0;
  v5 = -[PLLibraryContentsEnumerator initWithSourceManagedObjectContext:concurrent:]([PLLibraryContentsEnumerator alloc], "initWithSourceManagedObjectContext:concurrent:", v4, 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__PLPhotoLibrary__resourcesInfoFromMoc___block_invoke;
  v10[3] = &unk_1E3676BE0;
  v10[4] = &v11;
  objc_msgSend(a1, "configureEnumeratorForLibrarySizeInfo:completion:", v5, v10);
  v9 = 0;
  LODWORD(a1) = -[PLLibraryContentsEnumerator processObjectsWithError:](v5, "processObjectsWithError:", &v9);
  v6 = v9;
  if ((_DWORD)a1)
    v7 = (id)v12[5];
  else
    v7 = 0;

  _Block_object_dispose(&v11, 8);
  return v7;
}

+ (BOOL)canSaveVideoToLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v19 = *MEMORY[0x1E0C8ADA0];
    v20[0] = &unk_1E375D488;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if ((objc_msgSend(v6, "isCompatibleWithSavedPhotosAlbum") & 1) != 0)
      {
        v8 = 1;
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      PLBackendGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v3;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Video %@ cannot be saved to the photo library: reference to remote", buf, 0xCu);
      }

    }
    v14 = 0;
    v10 = objc_msgSend(v7, "statusOfValueForKey:error:", CFSTR("compatibleWithSavedPhotosAlbum"), &v14);
    v11 = v14;
    if (v10 != 2)
    {
      PLBackendGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v3;
        v17 = 2112;
        v18 = v11;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Video %@ cannot be saved to the photo library: %@", buf, 0x16u);
      }

    }
    v8 = 0;
    goto LABEL_14;
  }
  v8 = 0;
LABEL_15:

  return v8;
}

+ (void)refreshCachedCountsOnAllAssetContainersInContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  char v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PLPhotoLibrary refreshCachedCountsAndDates:onAssetsContainerClass:inContext:withPredicate:](PLPhotoLibrary, "refreshCachedCountsAndDates:onAssetsContainerClass:inContext:withPredicate:", 1, objc_opt_class(), v3, 0);
  if (objc_msgSend(v3, "hasChanges"))
  {
    objc_msgSend(v3, "updatedObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_pl_map:", &__block_literal_global_683);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Updating cached counts and dates on albums %{public}@", buf, 0xCu);
    }

    v24 = 0;
    v7 = objc_msgSend(v3, "save:", &v24);
    v8 = v24;
    if ((v7 & 1) == 0)
    {
      PLBackendGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v26 = v8;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to update cached counts on albums %{public}@", buf, 0xCu);
      }

    }
  }
  +[PLPhotoLibrary refreshCachedCountsAndDates:onAssetsContainerClass:inContext:withPredicate:](PLPhotoLibrary, "refreshCachedCountsAndDates:onAssetsContainerClass:inContext:withPredicate:", 0, objc_opt_class(), v3, 0);
  if (objc_msgSend(v3, "hasChanges"))
  {
    objc_msgSend(v3, "updatedObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_pl_map:", &__block_literal_global_686);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Updating cached counts and dates on moments %{public}@", buf, 0xCu);
    }

    v23 = 0;
    v13 = objc_msgSend(v3, "save:", &v23);
    v14 = v23;
    if ((v13 & 1) == 0)
    {
      PLBackendGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v26 = v14;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to update cached counts on moments %{public}@", buf, 0xCu);
      }

    }
  }
  +[PLPhotoLibrary refreshCachedCountsAndDates:onAssetsContainerClass:inContext:withPredicate:](PLPhotoLibrary, "refreshCachedCountsAndDates:onAssetsContainerClass:inContext:withPredicate:", 1, objc_opt_class(), v3, 0);
  if (objc_msgSend(v3, "hasChanges"))
  {
    objc_msgSend(v3, "updatedObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_pl_map:", &__block_literal_global_690);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    PLBackendGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v17;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Updating cached counts and dates on importSession %{public}@", buf, 0xCu);
    }

    v22 = 0;
    v19 = objc_msgSend(v3, "save:", &v22);
    v20 = v22;
    if ((v19 & 1) == 0)
    {
      PLBackendGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v26 = v20;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to update cached counts on importSession %{public}@", buf, 0xCu);
      }

    }
  }

}

+ (void)refreshCachedCountsAndDates:(BOOL)a3 onAssetsContainerClass:(Class)a4 inContext:(id)a5 withPredicate:(id)a6
{
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t i;
  __CFString *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  __CFString *v33;
  uint64_t v34;
  char v35;
  char v36;
  __CFString *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  __CFString *v41;
  __CFString *v42;
  __CFString *v43;
  void *v44;
  void *v45;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  __CFString *v60;
  NSObject *obj;
  _BOOL4 v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  uint8_t buf[4];
  __CFString *v74;
  __int16 v75;
  __CFString *v76;
  __int16 v77;
  id v78;
  __int16 v79;
  void *v80;
  _BYTE v81[128];
  _QWORD v82[5];
  _QWORD v83[9];

  v62 = a3;
  v83[7] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v51 = a6;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoLibrary.m"), 3869, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("class != nil"));

  }
  v63 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoLibrary.m"), 3870, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context != nil"));

  }
  v58 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v58, "setName:", CFSTR("objectID"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setExpression:", v10);

  objc_msgSend(v58, "setExpressionResultType:", 2000);
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("SUBQUERY(assets, $x, noindex:($x.hidden) = NO && noindex:($x.trashedState) = %d).@count"), 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v11, "setName:", CFSTR("cachedCount"));
  objc_msgSend(v11, "setExpression:", v57);
  v52 = v11;
  objc_msgSend(v11, "setExpressionResultType:", 200);
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("SUBQUERY(assets, $x, noindex:($x.kind) == %d && noindex:($x.hidden) = NO && noindex:($x.trashedState) = %d).@count"), 0, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v12, "setName:", CFSTR("cachedPhotosCount"));
  objc_msgSend(v12, "setExpression:", v56);
  v53 = v12;
  objc_msgSend(v12, "setExpressionResultType:", 200);
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("SUBQUERY(assets, $x, noindex:($x.kind) == %d && noindex:($x.hidden) = NO && noindex:($x.trashedState) = %d).@count"), 1, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v13, "setName:", CFSTR("cachedVideosCount"));
  objc_msgSend(v13, "setExpression:", v55);
  v54 = v13;
  objc_msgSend(v13, "setExpressionResultType:", 200);
  if (v62)
  {
    v14 = (void *)MEMORY[0x1E0CB35D0];
    if ((Class)objc_opt_class() == a4)
      v15 = CFSTR("addedDate");
    else
      v15 = CFSTR("dateCreated");
    objc_msgSend(v14, "expressionWithFormat:", CFSTR("SUBQUERY(assets, $x, noindex:($x.hidden) = NO && noindex:($x.trashedState) = %d).%K.@min"), 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v17, "setName:", CFSTR("startDate"));
    objc_msgSend(v17, "setExpression:", v16);
    v48 = v17;
    objc_msgSend(v17, "setExpressionResultType:", 900);
    v18 = (void *)MEMORY[0x1E0CB35D0];
    if ((Class)objc_opt_class() == a4)
      v19 = CFSTR("addedDate");
    else
      v19 = CFSTR("dateCreated");
    objc_msgSend(v18, "expressionWithFormat:", CFSTR("SUBQUERY(assets, $x, noindex:($x.hidden) = NO && noindex:($x.trashedState) = %d).%K.@max"), 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v21, "setName:", CFSTR("endDate"));
    objc_msgSend(v21, "setExpression:", v20);
    v49 = v21;
    objc_msgSend(v21, "setExpressionResultType:", 900);

  }
  else
  {
    v48 = 0;
    v49 = 0;
  }
  -[objc_class entityName](a4, "entityName");
  v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setResultType:", 2);
  if (v62)
  {
    v83[0] = CFSTR("uuid");
    v83[1] = v52;
    v83[2] = v53;
    v83[3] = v54;
    v83[4] = v48;
    v83[5] = v49;
    v83[6] = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 7);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v82[0] = CFSTR("uuid");
    v82[1] = v52;
    v82[2] = v53;
    v82[3] = v54;
    v82[4] = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 5);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v22;
  objc_msgSend(v59, "setPropertiesToFetch:", v22);

  objc_msgSend(v59, "setPredicate:", v51);
  v72 = 0;
  objc_msgSend(v63, "executeFetchRequest:error:", v59, &v72);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v72;
  if (v50)
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = v50;
    v65 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
    if (v65)
    {
      v64 = *(_QWORD *)v69;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v69 != v64)
          {
            v25 = v24;
            objc_enumerationMutation(obj);
            v24 = v25;
          }
          v66 = v24;
          v26 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v24);
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("objectID"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          if (v67)
          {
            objc_msgSend(v63, "objectWithID:");
            v27 = objc_claimAutoreleasedReturnValue();
            for (i = 0; i != 3; ++i)
            {
              v29 = refreshCachedCountsAndDates_onAssetsContainerClass_inContext_withPredicate__cachedCountKeys[i];
              objc_msgSend(v26, "objectForKey:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject valueForKey:](v27, "valueForKey:", v29);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if ((PLObjectIsEqual() & 1) == 0)
              {
                PLBackendGetLog();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  -[NSObject objectID](v27, "objectID");
                  v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413058;
                  v74 = v29;
                  v75 = 2112;
                  v76 = v33;
                  v77 = 2112;
                  v78 = v31;
                  v79 = 2112;
                  v80 = v30;
                  _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEFAULT, "Resetting %@ for %@ (%@ -> %@)", buf, 0x2Au);

                }
                -[NSObject setValue:forKey:](v27, "setValue:forKey:", v30, v29);
              }

            }
            if (v62)
            {
              v34 = 0;
              v35 = 1;
              do
              {
                v36 = v35;
                v37 = refreshCachedCountsAndDates_onAssetsContainerClass_inContext_withPredicate__dateKeys[v34];
                objc_msgSend(v26, "objectForKey:", v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject valueForKey:](v27, "valueForKey:", v37);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                if (!PLDateIsApproximatelyEqual(v39, v38, 2.22044605e-16))
                {
                  PLBackendGetLog();
                  v40 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                  {
                    -[NSObject objectID](v27, "objectID");
                    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413058;
                    v74 = v37;
                    v75 = 2112;
                    v76 = v41;
                    v77 = 2112;
                    v78 = v39;
                    v79 = 2112;
                    v80 = v38;
                    _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_DEFAULT, "Resetting %@ for %@ (%@ -> %@)", buf, 0x2Au);

                  }
                  -[NSObject setValue:forKey:](v27, "setValue:forKey:", v38, v37);
                }

                v35 = 0;
                v34 = 1;
              }
              while ((v36 & 1) != 0);
            }
          }
          else
          {
            PLBackendGetLog();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("uuid"));
              v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v74 = v60;
              v75 = 2112;
              v76 = v42;
              _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Recalc counts - unable to determine objectID for %@ with uuid: %@", buf, 0x16u);

            }
          }

          v24 = v66 + 1;
        }
        while (v66 + 1 != v65);
        v65 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
      }
      while (v65);
    }
  }
  else
  {
    PLBackendGetLog();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v74 = v43;
      v75 = 2112;
      v76 = v60;
      v77 = 2112;
      v78 = v47;
      _os_log_impl(&dword_199541000, obj, OS_LOG_TYPE_ERROR, "%@ failed to fetch counts for %@ %@", buf, 0x20u);

    }
  }

}

+ (id)requestIdentifierFromDeferredIdentifier:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)deferredPhotoPreviewDestinationURLForPrimaryAssetURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", *MEMORY[0x1E0D73E10]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathExtension:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)_assetsLibrary_disableSharedPhotoStreamsSupport
{
  _sharedPhotoStreamsSupportEnabled = 1;
}

+ (BOOL)_assetsLibrary_isSharedPhotoStreamsSupportEnabled
{
  return (_sharedPhotoStreamsSupportEnabled & 1) == 0 && _CFExecutableLinkedOnOrAfter() != 0;
}

+ (unint64_t)CloudPhotoLibrarySize
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoDirectoryWithType:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _sizeOfDirectories(v4);

  return v5;
}

uint64_t __67__PLPhotoLibrary_refreshCachedCountsOnAllAssetContainersInContext___block_invoke_688(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __67__PLPhotoLibrary_refreshCachedCountsOnAllAssetContainersInContext___block_invoke_684(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __67__PLPhotoLibrary_refreshCachedCountsOnAllAssetContainersInContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

void __40__PLPhotoLibrary__resourcesInfoFromMoc___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __67__PLPhotoLibrary_configureEnumeratorForLibrarySizeInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D73310];
  v4 = a2;
  v5 = *(_QWORD *)(a1 + 32)
     + 32
     * (__int16)objc_msgSend(v3, "mapSavedAssetType:unknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:unrecognized:", objc_msgSend(v4, "savedAssetType"), 4, 4, 1, 4, 0, 4, 4, 4, 4, 4, 3, 4, 4, 4,
                  4,
                  2,
                  4);
  objc_msgSend(v4, "resourcesSortedByQuality");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLPhotoLibrary _getResourceData:nonDerivativeSizeOut:derivativesSizeOut:fileBackedThumbnailsSizeOut:tableThumbnailsSizeOut:](PLPhotoLibrary, "_getResourceData:nonDerivativeSizeOut:derivativesSizeOut:fileBackedThumbnailsSizeOut:tableThumbnailsSizeOut:", v6, v5, v5 + 8, v5 + 16, v5 + 24);
}

void __67__PLPhotoLibrary_configureEnumeratorForLibrarySizeInfo_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __CFString **v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 20);
  v3 = 0;
  v4 = off_1E3660B68;
  do
  {
    v5 = (uint64_t)*v4++;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 56) + v3 + 8));
    objc_msgSend(v7, "numberWithUnsignedLongLong:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("PLInternalSizeDerivative"));

    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 56) + v3 + 16));
    objc_msgSend(v10, "numberWithUnsignedLongLong:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("PLInternalSizeFileBackedThumbnail"));

    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 56) + v3 + 24));
    objc_msgSend(v13, "numberWithUnsignedLongLong:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("PLInternalSizeTableThumbnail"));

    v16 = (void *)MEMORY[0x1E0CB37E8];
    v17 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 56) + v3));
    objc_msgSend(v16, "numberWithUnsignedLongLong:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("PLInternalSizeOriginals"));

    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, v5);
    v3 += 32;
  }
  while (v3 != 160);
  free(*(void **)(a1 + 56));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __47__PLPhotoLibrary__loadFileExtensionInformation__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = (void *)CGImageSourceCopyTypeExtensions();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)_imageFileExtensions;
  _imageFileExtensions = v2;

  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v5 = (void *)CGImageSourceCopyTypeExtensions();
  v6 = objc_msgSend(v4, "initWithArray:", v5);
  v7 = (void *)_rawImageFileExtensions;
  _rawImageFileExtensions = v6;

  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("wav"), CFSTR("mp3"), CFSTR("aac"), 0);
  v9 = (void *)_audioFileExtensions;
  _audioFileExtensions = v8;

  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("avi"), CFSTR("flv"), CFSTR("wmv"), 0);
  v11 = (void *)_extraVideoExtensions;
  _extraVideoExtensions = v10;

}

uint64_t __58__PLPhotoLibrary_removeFaceMetadataAtURL_includingPeople___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLMigrationGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Unable to enumerate '%@': %@", (uint8_t *)&v10, 0x16u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;

  return 1;
}

uint64_t __60__PLPhotoLibrary_postGlobalPhotoLibraryAvailableIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v5[16];

  result = +[PLIndicatorFileCoordinator systemLibraryAvailableIndicatorState](PLIndicatorFileCoordinator, "systemLibraryAvailableIndicatorState");
  if ((result & 1) == 0)
  {
    PLMigrationGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Posting library available notification (after data migrator checkpoint)", v5, 2u);
    }

    +[PLIndicatorFileCoordinator setSystemLibraryAvailableIndicatorState:](PLIndicatorFileCoordinator, "setSystemLibraryAvailableIndicatorState:", 1);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)PLGlobalPhotoLibraryAvailableNotification, 0, 0, 0);
    return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
  }
  return result;
}

uint64_t __47__PLPhotoLibrary_areOpportunisticTasksDisabled__block_invoke(uint64_t result)
{
  if (sOpportunisticTasksDisabled >= 1)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __49__PLPhotoLibrary_opportunisticTaskIsolationQueue__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  pl_dispatch_queue_create_with_fallback_qos();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sOpportunisticTaskIsolationQueue;
  sOpportunisticTaskIsolationQueue = v0;

}

- (void)performTransaction:(id)a3 withPriority:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrary options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v8, 0, 1, objc_msgSend(v7, "refreshesAfterSave"), v5, 0);

}

- (void)performTransactionAndWait:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrary options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v7, 1, 1, objc_msgSend(v6, "refreshesAfterSave"), v4, 0);

}

- (void)performTransaction:(id)a3 completionHandler:(id)a4 withPriority:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_class();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrary options](self, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v11, 0, 1, objc_msgSend(v10, "refreshesAfterSave"), v8, v7);

}

- (void)performTransaction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrary options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v10, 0, 1, objc_msgSend(v9, "refreshesAfterSave"), v7, v6);

}

- (void)performTransactionAndWait:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrary options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v10, 1, 1, objc_msgSend(v9, "refreshesAfterSave"), v7, v6);

}

- (void)performBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrary options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v7, 0, 0, objc_msgSend(v6, "refreshesAfterSave"), v4, 0);

}

- (void)performBlock:(id)a3 withPriority:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v7, 0, 0, 0, v5, 0);

}

- (void)performBlock:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v9, 0, 0, 0, v7, v6);

}

- (void)performBlock:(id)a3 completionHandler:(id)a4 withPriority:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_class();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v10, 0, 0, 0, v8, v7);

}

- (void)performBlockAndWait:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v6, 1, 0, 0, v4, 0);

}

- (void)performBlockAndWait:(id)a3 forceSave:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrary options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v9, 1, v4, objc_msgSend(v8, "refreshesAfterSave"), v6, 0);

}

- (void)performBlockAndWait:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", 0, v9, 1, 0, 0, v7, v6);

}

- (void)withDispatchGroup:(id)a3 performTransaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrary options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", v7, v10, 0, 1, objc_msgSend(v9, "refreshesAfterSave"), v6, 0);

}

- (void)withDispatchGroup:(id)a3 performTransaction:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_class();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrary options](self, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", v10, v13, 0, 1, objc_msgSend(v12, "refreshesAfterSave"), v9, v8);

}

- (void)withDispatchGroup:(id)a3 performBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  -[PLPhotoLibrary managedObjectContext](self, "managedObjectContext");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_withDispatchGroup:onContext:synchronously:shouldSave:refreshAfterSave:performTransaction:completionHandler:", v7, v9, 0, 0, 0, v6, 0);

}

+ (id)_stateDictionary
{
  id v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t i;
  unint64_t *v13;
  unint64_t v14;
  double v15;
  id v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  const __CFString *v35;
  const __CFString *v36;
  void *v37;
  void *v38;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = atomic_load(&s_currentLibraryCount);
  objc_msgSend(v3, "numberWithUnsignedLongLong:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("PLPhotoLibraryCount"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = atomic_load(&s_totalLibraryCount);
  objc_msgSend(v6, "numberWithUnsignedLongLong:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("PLPhotoLibraryTotalCount"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = atomic_load(&s_nestedWriteTransactionCount);
  objc_msgSend(v9, "numberWithUnsignedLongLong:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("NestedTransactionCount"));

  for (i = 0; i != 96; i += 32)
  {
    v13 = (unint64_t *)((char *)&s_megamocStatsPerQOS + i + 16);
    v14 = atomic_load((unint64_t *)((char *)&s_megamocStatsPerQOS + i));
    v15 = (double)(v14 / 0x3B9ACA00);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = (void *)MEMORY[0x1E0CB37E8];
    v18 = atomic_load((unint64_t *)((char *)&s_megamocStatsPerQOS + i + 24));
    objc_msgSend(v17, "numberWithUnsignedLongLong:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("ReadBlockCount"));

    v20 = (void *)MEMORY[0x1E0CB37E8];
    v21 = atomic_load(v13);
    objc_msgSend(v20, "numberWithUnsignedLongLong:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("WriteBlockCount"));

    v23 = (void *)MEMORY[0x1E0CB37E8];
    v24 = atomic_load((unint64_t *)((char *)&s_megamocStatsPerQOS + i + 24));
    v25 = atomic_load(v13);
    objc_msgSend(v23, "numberWithUnsignedLongLong:", v25 + v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v26, CFSTR("TotalBlockCount"));

    v27 = (void *)MEMORY[0x1E0CB37E8];
    v28 = atomic_load((unint64_t *)((char *)&s_megamocStatsPerQOS + i + 8));
    objc_msgSend(v27, "numberWithUnsignedLongLong:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v29, CFSTR("WaitingBlockCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v30, CFSTR("TotalWaitSeconds"));

    v31 = (void *)MEMORY[0x1E0CB37E8];
    v32 = atomic_load((unint64_t *)((char *)&s_megamocStatsPerQOS + i + 24));
    v33 = atomic_load(v13);
    objc_msgSend(v31, "numberWithDouble:", v15 / (double)(v33 + v32));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v34, CFSTR("AverageWaitSeconds"));

    v35 = CFSTR("IN");
    if (i == 32)
      v35 = CFSTR("UT");
    if (i)
      v36 = v35;
    else
      v36 = CFSTR("BG");
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, v36);

  }
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "debugDescription");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v38, CFSTR("ConcurrencyLimiter"));

  return v2;
}

+ (os_state_data_s)_stateDataWithHints:(os_state_hints_s *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unsigned int v9;
  uint64_t v10;
  size_t v11;
  os_state_data_s *v12;
  os_state_data_s *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3->var2 == 3)
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "Generating state data for MegaMoc...", buf, 2u);
    }

    v5 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(a1, "_stateDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v5, "dataWithPropertyList:format:options:error:", v6, 200, 0, &v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16;

    if (v7)
    {
      v9 = objc_msgSend(v7, "length");
      v10 = v9;
      v11 = v9 + 200;
      v12 = (os_state_data_s *)malloc_type_malloc(v11, 0xC03E452AuLL);
      v13 = v12;
      if (!v12)
      {
LABEL_12:

        return v13;
      }
      bzero(v12, v11);
      v13->var0 = 1;
      v13->var1.var1 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("State for MegaMoc: "));
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[NSObject UTF8String](v14, "UTF8String");
      __strlcpy_chk();
      objc_msgSend(v7, "getBytes:length:", v13->var4, v10);
    }
    else
    {
      PLBackendGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v8;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Unable to serialize state data for MegaMoc: %@", buf, 0xCu);
      }
      v13 = 0;
    }

    goto LABEL_12;
  }
  return 0;
}

+ (id)_debugStatisticsDescription
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t *v7;
  unint64_t *v8;
  unint64_t v9;
  double v10;
  const char *v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = atomic_load(&s_currentLibraryCount);
  v4 = atomic_load(&s_totalLibraryCount);
  v5 = atomic_load(&s_nestedWriteTransactionCount);
  objc_msgSend(v2, "appendFormat:", CFSTR("Library instances currently in memory: %lld, total created in the process: %lld, count of nested write transactions: %lld\n"), v3, v4, v5);
  for (i = 0; i != 96; i += 32)
  {
    v7 = (unint64_t *)((char *)&s_megamocStatsPerQOS + i);
    v8 = (unint64_t *)((char *)&s_megamocStatsPerQOS + i + 24);
    v9 = atomic_load((unint64_t *)((char *)&s_megamocStatsPerQOS + i));
    v10 = (double)(v9 / 0x3B9ACA00);
    if (i == 32)
      v11 = "UT";
    else
      v11 = "IN";
    if (!i)
      v11 = "BG";
    v12 = atomic_load(v8);
    v13 = v7 + 2;
    v14 = atomic_load(v7 + 2);
    v15 = v14 + v12;
    v16 = atomic_load(v8);
    v17 = atomic_load(v7 + 2);
    v18 = atomic_load(v7 + 1);
    v19 = atomic_load(v8);
    v20 = atomic_load(v13);
    objc_msgSend(v2, "appendFormat:", CFSTR("[%s: executed: %lld (read: %lld / write: %lld), count waiting: %lld, total wait: %g sec, average wait: %g sec]\n"), v11, v15, v16, v17, v18, *(_QWORD *)&v10, v10 / (double)(v20 + v19));
  }
  objc_msgSend(v2, "appendString:", CFSTR("\n"));
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "debugDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("%@\n"), v22);

  return v2;
}

+ (void)_activateStatusTimer
{
  pl_dispatch_once();
}

+ (void)_registerStateHandler
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PLPhotoLibrary_MegaMocAdditions___registerStateHandler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_registerStateHandler_s_onceToken != -1)
    dispatch_once(&_registerStateHandler_s_onceToken, block);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_ABORT_4_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_AUTH_23_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_BUSY_5_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_CANTOPEN_14_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_CONSTRAINT_19_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_CORRUPT_11_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_DONE_101_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_EMPTY_16_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_FORMAT_24_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_FULL_13_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_INTERNAL_2_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_INTERRUPT_9_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_IOERR_10_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_LOCKED_6_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_MISMATCH_20_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_MISUSE_21_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_NOLFS_22_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_NOMEM_7_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_NOTADB_26_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_NOTFOUND_12_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_NOTICE_27_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_PERM_3_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_PROTOCOL_15_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_RANGE_25_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_READONLY_8_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_ROW_100_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_SCHEMA_17_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_TOOBIG_18_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_WARNING_28_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_OTHER_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_ERROR_1_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_abortFromMocExecFail_NSMOC_SQLITE_ERROR_1_SQLITE_ERROR_SNAPSHOT_769_withCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;

  v3 = *(_QWORD *)&a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forcing crash after execute failure with sqlite result code: %d"), v3);
  objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)contextExecuteFailedWithSQLiteResultCode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  uint64_t v9;

  v3 = *(_QWORD *)&a3;
  v9 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109376;
    v6[1] = v3;
    v7 = 1024;
    v8 = (char)v3;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Execute failure sqlite result code: %d, primary result code: %d", (uint8_t *)v6, 0xEu);
  }

  switch((char)v3)
  {
    case 1:
      if ((_DWORD)v3 == 769)
        objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_ERROR_1_SQLITE_ERROR_SNAPSHOT_769_withCode:", 769);
      else
        objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_ERROR_1_withCode:", v3);
      break;
    case 2:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_INTERNAL_2_withCode:", v3);
      break;
    case 3:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_PERM_3_withCode:", v3);
      break;
    case 4:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_ABORT_4_withCode:", v3);
      break;
    case 5:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_BUSY_5_withCode:", v3);
      break;
    case 6:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_LOCKED_6_withCode:", v3);
      break;
    case 7:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_NOMEM_7_withCode:", v3);
      break;
    case 8:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_READONLY_8_withCode:", v3);
      break;
    case 9:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_INTERRUPT_9_withCode:", v3);
      break;
    case 10:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_IOERR_10_withCode:", v3);
      break;
    case 11:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_CORRUPT_11_withCode:", v3);
      break;
    case 12:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_NOTFOUND_12_withCode:", v3);
      break;
    case 13:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_FULL_13_withCode:", v3);
      break;
    case 14:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_CANTOPEN_14_withCode:", v3);
      break;
    case 15:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_PROTOCOL_15_withCode:", v3);
      break;
    case 16:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_EMPTY_16_withCode:", v3);
      break;
    case 17:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_SCHEMA_17_withCode:", v3);
      break;
    case 18:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_TOOBIG_18_withCode:", v3);
      break;
    case 19:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_CONSTRAINT_19_withCode:", v3);
      break;
    case 20:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_MISMATCH_20_withCode:", v3);
      break;
    case 21:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_MISUSE_21_withCode:", v3);
      break;
    case 22:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_NOLFS_22_withCode:", v3);
      break;
    case 23:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_AUTH_23_withCode:", v3);
      break;
    case 24:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_FORMAT_24_withCode:", v3);
      break;
    case 25:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_RANGE_25_withCode:", v3);
      break;
    case 26:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_NOTADB_26_withCode:", v3);
      break;
    case 27:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_NOTICE_27_withCode:", v3);
      break;
    case 28:
      objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_WARNING_28_withCode:", v3);
      break;
    default:
      if ((char)v3 == 100)
      {
        objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_ROW_100_withCode:", v3);
      }
      else if ((char)v3 == 101)
      {
        objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_DONE_101_withCode:", v3);
      }
      else
      {
        objc_msgSend(a1, "_abortFromMocExecFail_NSMOC_SQLITE_OTHER_withCode:", v3);
      }
      break;
  }
}

+ (void)_contextSaveFailedWithNSManagedObjectValidationError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSManagedObjectConstraintValidationError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSValidationMultipleErrorsError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSValidationMissingMandatoryPropertyError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSValidationRelationshipLacksMinimumCountError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSValidationRelationshipExceedsMaximumCountError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSValidationRelationshipDeniedDeleteError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSValidationNumberTooLargeError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSValidationNumberTooSmallError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSValidationDateTooLateError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSValidationDateTooSoonError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSValidationInvalidDateError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSValidationStringTooLongError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSValidationStringTooShortError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSValidationStringPatternMatchingError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSValidationInvalidURIError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSManagedObjectContextRecursiveSaveError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSPersistentStoreSaveError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNSPersistentStoreTimeoutError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithOtherCocoaError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithCocoaError:(id)a3 message:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = objc_msgSend(v11, "code");
  if (v7 > 1639)
  {
    if (v7 > 1689)
    {
      if (v7 <= 134029)
      {
        if (v7 == 1690)
        {
          objc_msgSend(a1, "_contextSaveFailedWithNSValidationInvalidURIError:", v6);
          goto LABEL_49;
        }
        if (v7 == 132001)
        {
          objc_msgSend(a1, "_contextSaveFailedWithNSManagedObjectContextRecursiveSaveError:", v6);
          goto LABEL_49;
        }
      }
      else
      {
        switch(v7)
        {
          case 134030:
            objc_msgSend(a1, "_contextSaveFailedWithNSPersistentStoreSaveError:", v6);
            goto LABEL_49;
          case 134090:
            objc_msgSend(a1, "_contextSaveFailedWithNSPersistentStoreTimeoutError:", v6);
            goto LABEL_49;
          case 134180:
            objc_msgSend(v11, "userInfo");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C979C8]);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "intValue");

            objc_msgSend(a1, "contextExecuteFailedWithSQLiteResultCode:", v10);
            goto LABEL_49;
        }
      }
    }
    else if (v7 <= 1659)
    {
      if (v7 == 1640)
      {
        objc_msgSend(a1, "_contextSaveFailedWithNSValidationDateTooSoonError:", v6);
        goto LABEL_49;
      }
      if (v7 == 1650)
      {
        objc_msgSend(a1, "_contextSaveFailedWithNSValidationInvalidDateError:", v6);
        goto LABEL_49;
      }
    }
    else
    {
      switch(v7)
      {
        case 1660:
          objc_msgSend(a1, "_contextSaveFailedWithNSValidationStringTooLongError:", v6);
          goto LABEL_49;
        case 1670:
          objc_msgSend(a1, "_contextSaveFailedWithNSValidationStringTooShortError:", v6);
          goto LABEL_49;
        case 1680:
          objc_msgSend(a1, "_contextSaveFailedWithNSValidationStringPatternMatchingError:", v6);
          goto LABEL_49;
      }
    }
LABEL_48:
    objc_msgSend(a1, "_contextSaveFailedWithOtherCocoaError:", v6);
    goto LABEL_49;
  }
  if (v7 > 1589)
  {
    if (v7 <= 1609)
    {
      if (v7 == 1590)
      {
        objc_msgSend(a1, "_contextSaveFailedWithNSValidationRelationshipExceedsMaximumCountError:", v6);
        goto LABEL_49;
      }
      if (v7 == 1600)
      {
        objc_msgSend(a1, "_contextSaveFailedWithNSValidationRelationshipDeniedDeleteError:", v6);
        goto LABEL_49;
      }
    }
    else
    {
      switch(v7)
      {
        case 1610:
          objc_msgSend(a1, "_contextSaveFailedWithNSValidationNumberTooLargeError:", v6);
          goto LABEL_49;
        case 1620:
          objc_msgSend(a1, "_contextSaveFailedWithNSValidationNumberTooSmallError:", v6);
          goto LABEL_49;
        case 1630:
          objc_msgSend(a1, "_contextSaveFailedWithNSValidationDateTooLateError:", v6);
          goto LABEL_49;
      }
    }
    goto LABEL_48;
  }
  if (v7 <= 1559)
  {
    if (v7 == 1550)
    {
      objc_msgSend(a1, "_contextSaveFailedWithNSManagedObjectValidationError:", v6);
      goto LABEL_49;
    }
    if (v7 == 1551)
    {
      objc_msgSend(a1, "_contextSaveFailedWithNSManagedObjectConstraintValidationError:", v6);
      goto LABEL_49;
    }
    goto LABEL_48;
  }
  if (v7 == 1560)
  {
    objc_msgSend(a1, "_contextSaveFailedWithNSValidationMultipleErrorsError:", v6);
    goto LABEL_49;
  }
  if (v7 == 1570)
  {
    objc_msgSend(a1, "_contextSaveFailedWithNSValidationMissingMandatoryPropertyError:", v6);
    goto LABEL_49;
  }
  if (v7 != 1580)
    goto LABEL_48;
  objc_msgSend(a1, "_contextSaveFailedWithNSValidationRelationshipLacksMinimumCountError:", v6);
LABEL_49:

}

+ (void)_contextSaveFailedWithTimeoutError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithError:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  _os_crash();
  __break(1u);
}

+ (void)_contextSaveFailedWithNoPersistentStores:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_FAULT, "Error attempting to save managed object context: %@", (uint8_t *)&v5, 0xCu);
  }

}

+ (void)_contextSaveFailedDueToChangingSPL:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_FAULT, "Error attempting to save managed object context (SPL change): %@", (uint8_t *)&v5, 0xCu);
  }

}

+ (void)_contextSaveFailedDueToClientRequestedShutdown:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_FAULT, "Error attempting to save managed object context (Client requested shutdown): %@", (uint8_t *)&v5, 0xCu);
  }

}

+ (void)_context:(id)a3 saveFailedWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to save context %@: %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLBackendGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    v18 = v6;
    v19 = 1024;
    v20 = objc_msgSend(v7, "code");
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to save context %{public}@ [%d] %@", buf, 0x1Cu);
  }

  objc_msgSend(v7, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D74498]);

  if (!v11)
  {
    objc_msgSend(v7, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C979C8]);

    if (v14)
    {
      objc_msgSend(a1, "contextExecuteFailedWithSQLiteResultCode:", objc_msgSend(v7, "code"));
      goto LABEL_16;
    }
    objc_msgSend(v7, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

    if (v16)
    {
      objc_msgSend(a1, "_contextSaveFailedWithCocoaError:message:", v7, v8);
      goto LABEL_16;
    }
LABEL_15:
    objc_msgSend(a1, "_contextSaveFailedWithError:", v8);
    goto LABEL_16;
  }
  v12 = objc_msgSend(v7, "code");
  if ((unint64_t)(v12 - 41019) > 6)
  {
LABEL_13:
    if (v12 == 46005)
    {
      objc_msgSend(a1, "_contextSaveFailedWithNoPersistentStores:", v7);
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (((1 << (v12 - 59)) & 0x66) == 0)
  {
    if (v12 == 41019)
    {
      objc_msgSend(a1, "_contextSaveFailedDueToChangingSPL:", v7);
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  objc_msgSend(a1, "_contextSaveFailedDueToClientRequestedShutdown:", v7);
LABEL_16:

}

+ (id)queueStatusDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(a1, "_debugStatisticsDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[megamoc] %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_3(uint64_t a1)
{
  char isKindOfClass;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    v5 = v3;
    if ((objc_msgSend(v5, "pl_performWithOptions:andBlock:", 4, *(_QWORD *)(a1 + 56)) & 1) == 0)
    {
      v4 = *(_QWORD *)(a1 + 64);
      if (v4)
        objc_msgSend(*(id *)(a1 + 40), "sync:identifyingBlock:library:", v4, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48));
    }

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_4;
    v6[3] = &unk_1E3676CD8;
    v7 = *(id *)(a1 + 56);
    objc_msgSend(v3, "performWithOptions:andBlock:", 4, v6);

  }
}

void __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_6(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_7;
  v1[3] = &unk_1E3676CD8;
  v2 = *(id *)(a1 + 32);
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:](PLManagedObjectContext, "_pl_megamoc_runWithPerformWarningsSuppressed:", v1);

}

uint64_t __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_4(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_5;
  v1[3] = &unk_1E3676CD8;
  v2 = *(id *)(a1 + 32);
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:](PLManagedObjectContext, "_pl_megamoc_runWithPerformWarningsSuppressed:", v1);

}

uint64_t __144__PLPhotoLibrary_MegaMocAdditions___withDispatchGroup_onContext_synchronously_shouldSave_refreshAfterSave_performTransaction_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__PLPhotoLibrary_MegaMocAdditions___registerStateHandler__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.photos.megamoc.stateHandleQueue", v0);
  v2 = (void *)_registerStateHandler_s_stateHandlerQueue;
  _registerStateHandler_s_stateHandlerQueue = (uint64_t)v1;

  return os_state_add_handler();
}

uint64_t __57__PLPhotoLibrary_MegaMocAdditions___registerStateHandler__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stateDataWithHints:", a2);
}

void __56__PLPhotoLibrary_MegaMocAdditions___activateStatusTimer__block_invoke()
{
  void *v0;
  NSObject *v1;
  dispatch_source_t v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;

  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sharedBackgroundQueue");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v1);
  v3 = (void *)_activateStatusTimer_timer;
  _activateStatusTimer_timer = (uint64_t)v2;

  v4 = _activateStatusTimer_timer;
  v5 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v4, v5, 0x6FC23AC00uLL, 0x5F5E100uLL);
  pl_dispatch_source_set_event_handler();
  dispatch_resume((dispatch_object_t)_activateStatusTimer_timer);
}

void __56__PLPhotoLibrary_MegaMocAdditions___activateStatusTimer__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "_debugStatisticsDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "[megamoc] %@", (uint8_t *)&v4, 0xCu);

  }
}

@end
