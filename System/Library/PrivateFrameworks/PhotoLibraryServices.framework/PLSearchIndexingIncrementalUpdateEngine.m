@implementation PLSearchIndexingIncrementalUpdateEngine

- (PLSearchIndexingIncrementalUpdateEngine)initWithDelegate:(id)a3
{
  id v4;
  PLSearchIndexingIncrementalUpdateEngine *v5;
  PLSearchIndexingIncrementalUpdateEngine *v6;
  objc_class *v7;
  void *v8;
  id v9;
  const char *v10;
  qos_class_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  dispatch_group_t v15;
  OS_dispatch_group *lock_group;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PLSearchIndexingIncrementalUpdateEngine;
  v5 = -[PLSearchIndexingIncrementalUpdateEngine init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR(".searchIndexIncrementalUpdate"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    v11 = qos_class_self();
    dispatch_queue_attr_make_with_qos_class(0, v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v10, v12);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    v6->_lock._os_unfair_lock_opaque = 0;
    v15 = dispatch_group_create();
    lock_group = v6->_lock_group;
    v6->_lock_group = (OS_dispatch_group *)v15;

  }
  return v6;
}

- (void)fetchRemainingWorkWithLibrary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PLSearchIndexingIncrementalUpdateEngine *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__PLSearchIndexingIncrementalUpdateEngine_fetchRemainingWorkWithLibrary_completion___block_invoke;
  v10[3] = &unk_1E3676290;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v9, "performBlock:", v10);

}

- (void)processJobObjectIDs:(id)a3 entity:(unint64_t)a4 library:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  PLSearchIndexingIncrementalUpdateEngine *v18;
  id v19;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__PLSearchIndexingIncrementalUpdateEngine_processJobObjectIDs_entity_library_completion___block_invoke;
  v15[3] = &unk_1E3671878;
  v16 = v9;
  v17 = v10;
  v18 = self;
  v19 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  objc_msgSend(v13, "performBlock:", v15);

}

- (void)processBatchOfJobsWithType:(signed __int16)a3 flags:(int64_t)a4 library:(id)a5 progress:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  int64_t v22;
  signed __int16 v23;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __104__PLSearchIndexingIncrementalUpdateEngine_processBatchOfJobsWithType_flags_library_progress_completion___block_invoke;
  v18[3] = &unk_1E366B050;
  v23 = a3;
  v21 = v14;
  v22 = a4;
  v18[4] = self;
  v19 = v12;
  v20 = v13;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  objc_msgSend(v17, "performBlock:", v18);

}

- (void)resumeWithLibrary:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  v5 = v8;
  v6 = v7;
  PLSafeRunWithUnfairLock();

}

- (void)pause
{
  PLSafeRunWithUnfairLock();
}

- (void)_processIncrementalUpdatesWithLibrary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  OS_dispatch_queue *queue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  PLSearchIndexingIncrementalUpdateEngine *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__PLSearchIndexingIncrementalUpdateEngine__processIncrementalUpdatesWithLibrary_completion___block_invoke;
  v12[3] = &unk_1E3676290;
  v14 = self;
  v15 = v7;
  v13 = v6;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "dispatchAsync:block:", queue, v12);

}

- (void)_lock_runSingleLoopOfProcessingIncrementalUpdatesWithLibrary:(id)a3
{
  id v4;
  PLTimedDispatchGroup *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PLSearchIndexingIncrementalUpdateEngine *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = -[PLTimedDispatchGroup initWithQueue:name:]([PLTimedDispatchGroup alloc], "initWithQueue:name:", self->_queue, CFSTR("Incrmeental donation"));
  -[PLTimedDispatchGroup enterWithName:](v5, "enterWithName:", CFSTR("Rebuild donation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_lock_donationInFlightDispatchGroupSession, v6);
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __104__PLSearchIndexingIncrementalUpdateEngine__lock_runSingleLoopOfProcessingIncrementalUpdatesWithLibrary___block_invoke;
  v15[3] = &unk_1E366B0A0;
  v8 = v6;
  v16 = v8;
  -[PLSearchIndexingIncrementalUpdateEngine _processIncrementalUpdatesWithLibrary:completion:](self, "_processIncrementalUpdatesWithLibrary:completion:", v4, v15);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __104__PLSearchIndexingIncrementalUpdateEngine__lock_runSingleLoopOfProcessingIncrementalUpdatesWithLibrary___block_invoke_2;
  v11[3] = &unk_1E3677530;
  v12 = v8;
  v13 = self;
  v14 = v4;
  v9 = v4;
  v10 = v8;
  -[PLTimedDispatchGroup notify:](v5, "notify:", v11);

}

- (void)_handleDonationCompleteWithResult:(id)a3 batch:(id)a4 library:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v7, "isFailure"))
    goto LABEL_8;
  objc_msgSend(v7, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(v7, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "code");

  if (v13 != 3072)
  {
LABEL_8:
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __91__PLSearchIndexingIncrementalUpdateEngine__handleDonationCompleteWithResult_batch_library___block_invoke;
    v15[3] = &unk_1E3677530;
    v16 = v7;
    v17 = v8;
    v18 = v9;
    objc_msgSend(v18, "performTransactionAndWait:", v15);

    goto LABEL_9;
  }
  PLSearchBackendIndexWorkerGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "Search indexing was cancelled", buf, 2u);
  }

LABEL_9:
}

- (id)_inPerformBlock_batchFromType:(signed __int16)a3 flags:(int64_t)a4 library:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  PLSearchIndexingIncrementalUpdateBatch *v14;
  void *v15;
  PLSearchIndexingIncrementalUpdateBatch *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a5;
  PLBackgroundJobSearchIndexingEntitiesFromJobFlags(a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") && objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    if ((unint64_t)(v10 - 6) < 3)
      v11 = 1;
    else
      v11 = 100;
  }
  else
  {
    v11 = 100;
  }

  objc_msgSend(v7, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLBackgroundJobWorkItem searchIndexWorkItemsForIncrementalUpdatesInManagedObjectContext:jobType:jobFlags:fetchLimit:](PLBackgroundJobWorkItem, "searchIndexWorkItemsForIncrementalUpdatesInManagedObjectContext:jobType:jobFlags:fetchLimit:", v12, v6, a4, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "isSuccess"))
  {
    v14 = [PLSearchIndexingIncrementalUpdateBatch alloc];
    objc_msgSend(v13, "result");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PLSearchIndexingIncrementalUpdateBatch initWithWorkItems:flags:](v14, "initWithWorkItems:flags:", v15, a4);

    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v16);
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(v13, "error");
    v16 = (PLSearchIndexingIncrementalUpdateBatch *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "failureWithError:", v16);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)_donateBatch:(id)a3 library:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id WeakRetained;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  PLSearchIndexingIncrementalUpdateEngine *v41;
  id v42;
  void *v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "inPerformBlock_prepareDonationsWithLibrary:", v9);
  if (objc_msgSend(v8, "hasDonations"))
  {
    objc_msgSend(v8, "ineligibleIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v10;
    if (objc_msgSend(v8, "targetEntity") == 7)
    {

      v43 = &unk_1E375E820;
      objc_msgSend(v8, "ineligibleIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v28 = 0;
    }
    else
    {
      v13 = 0;
      v28 = v11;
    }
    v18 = (void *)MEMORY[0x1E0CB38A8];
    objc_msgSend(v8, "eligibleManagedObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "discreteProgressWithTotalUnitCount:", objc_msgSend(v19, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = __75__PLSearchIndexingIncrementalUpdateEngine__donateBatch_library_completion___block_invoke;
    v40 = &unk_1E3677C18;
    v41 = self;
    v42 = v20;
    v21 = v20;
    PLSafeRunWithUnfairLock();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "eligibleManagedObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "partialUpdateMasks");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v8, "targetEntity");
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __75__PLSearchIndexingIncrementalUpdateEngine__donateBatch_library_completion___block_invoke_2;
    v33[3] = &unk_1E3668D78;
    v33[4] = self;
    v34 = v8;
    v35 = v9;
    v10 = v29;
    v36 = v29;
    v26 = v9;
    v27 = v8;
    objc_msgSend(WeakRetained, "inLibraryPerform_donateForIncrementalUpdateEngine:managedObjects:partialUpdateMasks:entity:deleteIdentifiers:identifiersRequiringAdditionalWorkByEntity:library:progress:completion:", self, v23, v24, v25, v28, v13, v26, v21, v33);

    v14 = v28;
  }
  else
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __75__PLSearchIndexingIncrementalUpdateEngine__donateBatch_library_completion___block_invoke_44;
    v30[3] = &unk_1E3677C18;
    v31 = v8;
    v32 = v9;
    v13 = v9;
    v14 = v8;
    objc_msgSend(v13, "performTransactionAndWait:", v30);
    v15 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "successWithResult:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *))v10 + 2))(v10, v17);
  }

}

- (PLSearchIndexingIncrementalUpdateEngineDelegate)delegate
{
  return (PLSearchIndexingIncrementalUpdateEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_donationProgress, 0);
  objc_storeStrong((id *)&self->_lock_donationInFlightDispatchGroupSession, 0);
  objc_storeStrong((id *)&self->_lock_result, 0);
  objc_storeStrong((id *)&self->_lock_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __75__PLSearchIndexingIncrementalUpdateEngine__donateBatch_library_completion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

void __75__PLSearchIndexingIncrementalUpdateEngine__donateBatch_library_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isFailure"))
  {
    PLSearchBackendIndexingEngineGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Donation failed with error: %@", (uint8_t *)&v7, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_handleDonationCompleteWithResult:batch:library:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

uint64_t __75__PLSearchIndexingIncrementalUpdateEngine__donateBatch_library_completion___block_invoke_44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "inPerformTransaction_cleanUpWithSuccess:library:", 1, *(_QWORD *)(a1 + 40));
}

uint64_t __91__PLSearchIndexingIncrementalUpdateEngine__handleDonationCompleteWithResult_batch_library___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isFailure"))
  {
    PLSearchBackendIndexWorkerGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "error");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "Donation failed with error: %@", (uint8_t *)&v5, 0xCu);

    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "inPerformTransaction_cleanUpWithSuccess:library:", objc_msgSend(*(id *)(a1 + 32), "isSuccess"), *(_QWORD *)(a1 + 48));
}

uint64_t __104__PLSearchIndexingIncrementalUpdateEngine__lock_runSingleLoopOfProcessingIncrementalUpdatesWithLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "leaveWithResult:", a2);
}

void __104__PLSearchIndexingIncrementalUpdateEngine__lock_runSingleLoopOfProcessingIncrementalUpdatesWithLibrary___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = (id *)&v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__35327;
  v16 = __Block_byref_object_dispose__35328;
  v17 = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "wasCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "result");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isFailure"))
    {
      objc_storeStrong(v13 + 5, v2);
      PLSearchBackendIndexingEngineGetLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v2, "error");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v4;
        _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "Search indexing incremental updates failed with error: %@", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v2, "result");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "unsignedIntegerValue") == 0;

      if (!v6)
      {
LABEL_10:

        goto LABEL_11;
      }
      PLSearchBackendIndexingEngineGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Search indexing incremental updates completed", buf, 2u);
      }

      v8 = (void *)MEMORY[0x1E0D732B8];
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "successWithResult:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v3 = v13[5];
      v13[5] = (id)v10;
    }

    goto LABEL_10;
  }
LABEL_11:
  v11 = *(id *)(a1 + 48);
  PLSafeRunWithUnfairLock();

  _Block_object_dispose(&v12, 8);
}

void __104__PLSearchIndexingIncrementalUpdateEngine__lock_runSingleLoopOfProcessingIncrementalUpdatesWithLibrary___block_invoke_39(_QWORD *a1)
{
  _BYTE *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];

  v2 = (_BYTE *)a1[4];
  if (v2[21] && !*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    PLSearchBackendIndexingEngineGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Paused unbounded incremental update indexing", v9, 2u);
    }

    v4 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failureWithError:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v2 = (_BYTE *)a1[4];
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v2[20] = 0;
    objc_storeStrong((id *)(a1[4] + 32), *(id *)(*(_QWORD *)(a1[6] + 8) + 40));
    dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 24));
  }
  else
  {
    objc_msgSend(v2, "_lock_runSingleLoopOfProcessingIncrementalUpdatesWithLibrary:", a1[5]);
  }
}

void __92__PLSearchIndexingIncrementalUpdateEngine__processIncrementalUpdatesWithLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__35327;
  v28 = __Block_byref_object_dispose__35328;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __92__PLSearchIndexingIncrementalUpdateEngine__processIncrementalUpdatesWithLibrary_completion___block_invoke_32;
  v16[3] = &unk_1E3677830;
  v18 = &v24;
  v17 = v3;
  v19 = &v20;
  objc_msgSend(v17, "performBlockAndWait:", v16);
  if ((objc_msgSend((id)v25[5], "isFailure") & 1) != 0
    || (objc_msgSend((id)v25[5], "result"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "unsignedIntegerValue") == 0,
        v4,
        v5))
  {
    if (objc_msgSend((id)v25[5], "isFailure"))
    {
      PLSearchBackendIndexingEngineGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v25[5], "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v12;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch incremental update work items with error: %@", buf, 0xCu);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend((id)v25[5], "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    v8 = *((_WORD *)v21 + 12);
    v9 = objc_msgSend(v6, "integerValue");
    v10 = *(_QWORD *)(a1 + 32);
    v13[0] = v2;
    v13[1] = 3221225472;
    v13[2] = __92__PLSearchIndexingIncrementalUpdateEngine__processIncrementalUpdatesWithLibrary_completion___block_invoke_33;
    v13[3] = &unk_1E3668D50;
    v14 = *(id *)(a1 + 48);
    v15 = &v24;
    objc_msgSend(v7, "processBatchOfJobsWithType:flags:library:progress:completion:", v8, v9, v10, 0, v13);

  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

void __92__PLSearchIndexingIncrementalUpdateEngine__processIncrementalUpdatesWithLibrary_completion___block_invoke_32(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLBackgroundJobWorkItem nextSearchIndexWorkItemJobFlagsInManagedObjectContext:jobType:](PLBackgroundJobWorkItem, "nextSearchIndexWorkItemJobFlagsInManagedObjectContext:jobType:", v2, *(__int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (!v7)
  {
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 2;
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    +[PLBackgroundJobWorkItem nextSearchIndexWorkItemJobFlagsInManagedObjectContext:jobType:](PLBackgroundJobWorkItem, "nextSearchIndexWorkItemJobFlagsInManagedObjectContext:jobType:", v11, *(__int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

void __92__PLSearchIndexingIncrementalUpdateEngine__processIncrementalUpdatesWithLibrary_completion___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "isSuccess");
  PLSearchBackendIndexingEngineGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Finished processing batch of incremental updates", (uint8_t *)&v8, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Failed to process batch of incremental updates with error: %@", (uint8_t *)&v8, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __48__PLSearchIndexingIncrementalUpdateEngine_pause__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 20))
  {
    PLSearchBackendIndexingEngineGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Pausing unbounded incremental update indexing", v7, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 21) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "cancel");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "cancel");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = 0;

  }
}

void __72__PLSearchIndexingIncrementalUpdateEngine_resumeWithLibrary_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 21) = 0;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 20))
  {
    PLSearchBackendIndexingEngineGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Resuming unbounded incremental update indexing", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20) = 1;
    dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(*(id *)(a1 + 32), "_lock_runSingleLoopOfProcessingIncrementalUpdatesWithLibrary:", *(_QWORD *)(a1 + 40));
  }
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 24);
  v6 = *(_QWORD *)(v4 + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__PLSearchIndexingIncrementalUpdateEngine_resumeWithLibrary_completion___block_invoke_30;
  v7[3] = &unk_1E3675C58;
  v7[4] = v4;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v3, "groupNotify:queue:block:", v5, v6, v7);

}

void __72__PLSearchIndexingIncrementalUpdateEngine_resumeWithLibrary_completion___block_invoke_30(uint64_t a1)
{
  void *v2;

  PLSafeResultWithUnfairLock();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __72__PLSearchIndexingIncrementalUpdateEngine_resumeWithLibrary_completion___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

void __104__PLSearchIndexingIncrementalUpdateEngine_processBatchOfJobsWithType_flags_library_progress_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_inPerformBlock_batchFromType:flags:library:", *(__int16 *)(a1 + 72), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isSuccess"))
  {
    objc_msgSend(v2, "result");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __104__PLSearchIndexingIncrementalUpdateEngine_processBatchOfJobsWithType_flags_library_progress_completion___block_invoke_2;
    v6[3] = &unk_1E366B078;
    v7 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    objc_msgSend(v4, "_donateBatch:library:completion:", v3, v5, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __104__PLSearchIndexingIncrementalUpdateEngine_processBatchOfJobsWithType_flags_library_progress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setCompletedUnitCount:", objc_msgSend(v3, "completedUnitCount") + 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __89__PLSearchIndexingIncrementalUpdateEngine_processJobObjectIDs_entity_library_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  PLSearchIndexingIncrementalUpdateBatch *v9;
  void *v10;
  PLSearchIndexingIncrementalUpdateBatch *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLBackgroundJobWorkItem entityName](PLBackgroundJobWorkItem, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;

  if (v7)
  {
    v9 = [PLSearchIndexingIncrementalUpdateBatch alloc];
    objc_msgSend(v7, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PLSearchIndexingIncrementalUpdateBatch initWithWorkItems:flags:](v9, "initWithWorkItems:flags:", v7, objc_msgSend(v10, "jobFlags"));

    v13 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __89__PLSearchIndexingIncrementalUpdateEngine_processJobObjectIDs_entity_library_completion___block_invoke_2;
    v15[3] = &unk_1E366F590;
    v16 = *(id *)(a1 + 56);
    objc_msgSend(v12, "_donateBatch:library:completion:", v11, v13, v15);

  }
  else
  {
    v14 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v8);
    v11 = (PLSearchIndexingIncrementalUpdateBatch *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, PLSearchIndexingIncrementalUpdateBatch *))(v14 + 16))(v14, v11);
  }

}

uint64_t __89__PLSearchIndexingIncrementalUpdateEngine_processJobObjectIDs_entity_library_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__PLSearchIndexingIncrementalUpdateEngine_fetchRemainingWorkWithLibrary_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLBackgroundJobWorkItem countOfSearchIndexWorkItemsInManagedObjectContext:](PLBackgroundJobWorkItem, "countOfSearchIndexWorkItemsInManagedObjectContext:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(v5 + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__PLSearchIndexingIncrementalUpdateEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_2;
  v9[3] = &unk_1E3676290;
  v10 = v3;
  v11 = v5;
  v12 = v6;
  v8 = v3;
  objc_msgSend(v4, "dispatchAsync:block:", v7, v9);

}

uint64_t __84__PLSearchIndexingIncrementalUpdateEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isSuccess"))
  {
    objc_msgSend(*(id *)(a1 + 32), "result");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "unsignedIntegerValue");

  }
  else
  {
    PLSearchBackendIndexingEngineGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v7 = v4;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "Error counting search background job work items: %@", buf, 0xCu);

    }
  }
  PLBoolResultWithUnfairLock();
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 48) + 16))(0.0);
}

BOOL __84__PLSearchIndexingIncrementalUpdateEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_20(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  return !*(_BYTE *)(v1 + 20) || *(_BYTE *)(v1 + 21) != 0;
}

@end
