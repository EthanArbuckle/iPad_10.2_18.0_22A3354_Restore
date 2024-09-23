@implementation PLBackgroundJobSearchIndexingWorker

- (PLBackgroundJobSearchIndexingWorker)initWithLibraryBundle:(id)a3
{
  PLBackgroundJobSearchIndexingWorker *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLBackgroundJobSearchIndexingWorker;
  result = -[PLBackgroundJobWorker initWithLibraryBundle:](&v4, sel_initWithLibraryBundle_, a3);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  PLBackgroundJobWorkerPendingWorkItems *v9;
  void *v10;
  void *v11;
  void *v12;
  PLBackgroundJobWorkerPendingWorkItems *v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  PLBackgroundJobSearchIndexingWorker *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundJobSearchIndexingWorker.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (-[PLBackgroundJobSearchIndexingWorker _supportsIndexRebuild](self, "_supportsIndexRebuild")
      && (objc_msgSend(v5, "libraryServicesManager"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "searchIndexingEngine"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "hasRebuildWorkToDoForLibrary:", v5),
          v7,
          v6,
          v8))
    {
      v9 = [PLBackgroundJobWorkerPendingWorkItems alloc];
      +[PLBackgroundJobCriteria criteriaForLowPrioritySearchWorker](PLBackgroundJobCriteria, "criteriaForLowPrioritySearchWorker");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLSearchIndexPendingWorkItem rebuildInProgressPendingWorkItem](PLSearchIndexPendingWorkItem, "rebuildInProgressPendingWorkItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v9, "initWithCriteria:workItemsNeedingProcessing:", v10, v12);

    }
    else
    {
      if (-[PLBackgroundJobSearchIndexingWorker _supportsIndexRebuild](self, "_supportsIndexRebuild"))
        +[PLSpotlightReindexing drainSpotlightReindexIdentifiersIfNeededForLibrary:](PLSpotlightReindexing, "drainSpotlightReindexIdentifiersIfNeededForLibrary:", v5);
      v20 = 0;
      v21 = &v20;
      v22 = 0x3032000000;
      v23 = __Block_byref_object_copy__30431;
      v24 = __Block_byref_object_dispose__30432;
      v25 = 0;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __75__PLBackgroundJobSearchIndexingWorker_workItemsNeedingProcessingInLibrary___block_invoke;
      v16[3] = &unk_1E3676EA0;
      v17 = v5;
      v18 = self;
      v19 = &v20;
      objc_msgSend(v17, "performBlockAndWait:", v16);
      v13 = (PLBackgroundJobWorkerPendingWorkItems *)(id)v21[5];

      _Block_object_dispose(&v20, 8);
    }
  }
  else
  {
    v13 = -[PLBackgroundJobWorkerPendingWorkItems initWithZeroWorkItems]([PLBackgroundJobWorkerPendingWorkItems alloc], "initWithZeroWorkItems");
  }

  return v13;
}

- (void)_performWorkOnItem:(id)a3 completion:(id)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  id v9;
  const char *v10;
  qos_class_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  PLBackgroundJobSearchIndexingWorker *v36;
  id v37;
  _QWORD v38[4];
  _QWORD v39[2];
  _QWORD v40[4];
  _QWORD v41[7];
  _QWORD v42[5];
  id v43;

  v6 = a3;
  v27 = a4;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__30431;
  v42[4] = __Block_byref_object_dispose__30432;
  v43 = 0;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR(".donateCompletion"));
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const char *)objc_msgSend(v9, "UTF8String");
  v11 = qos_class_self();
  dispatch_queue_attr_make_with_qos_class(0, v11, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_queue_create(v10, v12);

  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  v15 = MEMORY[0x1E0C809B0];
  v41[2] = MEMORY[0x1E0C809B0];
  v41[3] = 3221225472;
  v41[4] = __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke;
  v41[5] = &unk_1E3670AD8;
  v41[6] = self;
  PLSafeResultWithUnfairLock();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "rebuildInProgress"))
  {
    objc_msgSend(v16, "libraryServicesManager", v27);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "searchIndexingEngine");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v15;
    v40[1] = 3221225472;
    v40[2] = __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_2;
    v40[3] = &unk_1E3667F98;
    v41[1] = v42;
    v41[0] = v14;
    objc_msgSend(v18, "resumeSearchIndexRebuildIfNeededForLibrary:calledBy:completion:", v16, CFSTR("Background Job"), v40);
    v19 = (id *)v41;

  }
  else
  {
    objc_msgSend(v16, "libraryServicesManager", v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "searchIndexingEngine");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v6, "jobType");
    v23 = objc_msgSend(v6, "jobFlags");
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_3;
    v38[3] = &unk_1E3667FC0;
    v39[1] = v42;
    v39[0] = v14;
    objc_msgSend(v21, "processBatchOfJobsWithType:flags:library:completion:", v22, v23, v16, v38);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_4;
    v35 = &unk_1E3677C18;
    v36 = self;
    v17 = v24;
    v37 = v17;
    PLSafeRunWithUnfairLock();
    v19 = (id *)v39;

    v15 = MEMORY[0x1E0C809B0];
  }

  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_5;
  v29[3] = &unk_1E3676F20;
  v29[4] = self;
  v26 = v28;
  v30 = v26;
  v31 = v42;
  objc_msgSend(v25, "groupNotify:queue:block:", v14, v13, v29);

  _Block_object_dispose(v42, 8);
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
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  PLBackgroundJobSearchIndexingWorker *v25;
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundJobSearchIndexingWorker.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_item"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundJobSearchIndexingWorker.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundJobSearchIndexingWorker.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_item isKindOfClass:[PLSearchIndexPendingWorkItem class]]"));

  }
  v12 = MEMORY[0x1E0C809B0];
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __78__PLBackgroundJobSearchIndexingWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v24 = &unk_1E3677C18;
  v25 = self;
  v26 = v10;
  v13 = v10;
  v14 = v9;
  PLSafeRunWithUnfairLock();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __78__PLBackgroundJobSearchIndexingWorker_performWorkOnItem_inLibrary_completion___block_invoke_2;
  v19[3] = &unk_1E3674E40;
  v19[4] = self;
  v20 = v11;
  v15 = v11;
  -[PLBackgroundJobSearchIndexingWorker _performWorkOnItem:completion:](self, "_performWorkOnItem:completion:", v14, v19);

}

- (BOOL)isInterruptible
{
  return 1;
}

- (void)stopWorkingOnItem:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PLBackgroundJobSearchIndexingWorker *v11;
  uint64_t v12;
  PLBackgroundJobSearchIndexingWorker *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLSearchBackendIndexStatusGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "Request received to stop work item: %@", buf, 0xCu);
  }

  v6 = MEMORY[0x1E0C809B0];
  v12 = MEMORY[0x1E0C809B0];
  v13 = self;
  PLSafeResultWithUnfairLock();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchIndexingEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pauseSearchIndexRebuildWithSourceName:", CFSTR("Background Job"));

  v11 = self;
  PLSafeResultWithUnfairLock();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancel", v6, 3221225472, __57__PLBackgroundJobSearchIndexingWorker_stopWorkingOnItem___block_invoke_2, &unk_1E3670AD8, v11, v12, 3221225472, __57__PLBackgroundJobSearchIndexingWorker_stopWorkingOnItem___block_invoke, &unk_1E3670AD8, v13);

}

- (BOOL)_supportsIndexRebuild
{
  return 0;
}

- (signed)_jobType
{
  PLBackgroundJobSearchIndexingWorker *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_incrementalUpdateProgress, 0);
  objc_storeStrong((id *)&self->_lock_library, 0);
}

id __57__PLBackgroundJobSearchIndexingWorker_stopWorkingOnItem___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 112);
}

id __57__PLBackgroundJobSearchIndexingWorker_stopWorkingOnItem___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 120);
}

void __78__PLBackgroundJobSearchIndexingWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(a1 + 40));
}

void __78__PLBackgroundJobSearchIndexingWorker_performWorkOnItem_inLibrary_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  PLSafeRunWithUnfairLock();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __78__PLBackgroundJobSearchIndexingWorker_performWorkOnItem_inLibrary_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 112);
  *(_QWORD *)(v1 + 112) = 0;

}

id __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 112);
}

void __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), *(id *)(a1 + 40));
}

void __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  PLSafeRunWithUnfairLock();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

void __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 120);
  *(_QWORD *)(v1 + 120) = 0;

}

void __75__PLBackgroundJobSearchIndexingWorker_workItemsNeedingProcessingInLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  PLBackgroundJobWorkerPendingWorkItems *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  PLBackgroundJobWorkerPendingWorkItems *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  PLBackgroundJobWorkerPendingWorkItems *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  PLBackgroundJobWorkerPendingWorkItems *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  PLBackgroundJobWorkerPendingWorkItems *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLBackgroundJobWorkItem nextSearchIndexWorkItemJobFlagsInManagedObjectContext:jobType:](PLBackgroundJobWorkItem, "nextSearchIndexWorkItemJobFlagsInManagedObjectContext:jobType:", v2, objc_msgSend(*(id *)(a1 + 40), "_jobType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isFailure"))
  {
    PLSearchBackendIndexWorkerGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "workerName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v5;
      v51 = 2112;
      v52 = v6;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "%{public}@ unable to fetch work items needing processing, error: %@", buf, 0x16u);

    }
    v7 = -[PLBackgroundJobWorkerPendingWorkItems initWithZeroWorkItems]([PLBackgroundJobWorkerPendingWorkItems alloc], "initWithZeroWorkItems");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(v3, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    if (v11)
    {
      objc_msgSend(v3, "result");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PLSearchBackendIndexWorkerGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "workerName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        PLBackgroundJobWorkerSearchJobFlagsDescription(objc_msgSend(v12, "integerValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v14;
        v51 = 2114;
        v52 = v15;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ found search jobs needing processing with flags %{public}@", buf, 0x16u);

      }
      v16 = [PLBackgroundJobWorkerPendingWorkItems alloc];
      objc_msgSend((id)objc_opt_class(), "_criteriaToUse");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLSearchIndexPendingWorkItem pendingWorkItemWithType:flags:](PLSearchIndexPendingWorkItem, "pendingWorkItemWithType:flags:", objc_msgSend(*(id *)(a1 + 40), "_jobType"), objc_msgSend(v12, "integerValue"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v16, "initWithCriteria:workItemsNeedingProcessing:", v17, v19);
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

    }
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    || !objc_msgSend(*(id *)(a1 + 40), "_supportsIndexRebuild"))
  {
    v24 = v3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLBackgroundJobWorkItem nextSearchIndexWorkItemJobFlagsInManagedObjectContext:jobType:](PLBackgroundJobWorkItem, "nextSearchIndexWorkItemJobFlagsInManagedObjectContext:jobType:", v23, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v24, "isFailure"))
    {
      PLSearchBackendIndexWorkerGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "workerName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "error");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v26;
        v51 = 2112;
        v52 = v27;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "%{public}@ unable to fetch search repair failure work items needing processing, error: %@", buf, 0x16u);

      }
      v28 = -[PLBackgroundJobWorkerPendingWorkItems initWithZeroWorkItems]([PLBackgroundJobWorkerPendingWorkItems alloc], "initWithZeroWorkItems");
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v30 = *(void **)(v29 + 40);
      *(_QWORD *)(v29 + 40) = v28;

    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(v24, "result");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "unsignedIntegerValue");

      if (v32)
      {
        objc_msgSend(v24, "result");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        PLSearchBackendIndexWorkerGetLog();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "workerName");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          PLBackgroundJobWorkerSearchJobFlagsDescription(objc_msgSend(v33, "integerValue"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v50 = v35;
          v51 = 2114;
          v52 = v36;
          _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ found search repair failure jobs needing processing with flags %{public}@", buf, 0x16u);

        }
        v37 = [PLBackgroundJobWorkerPendingWorkItems alloc];
        objc_msgSend((id)objc_opt_class(), "_criteriaToUse");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLSearchIndexPendingWorkItem pendingWorkItemWithType:flags:](PLSearchIndexPendingWorkItem, "pendingWorkItemWithType:flags:", 3, objc_msgSend(v33, "integerValue"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v39;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v37, "initWithCriteria:workItemsNeedingProcessing:", v38, v40);
        v42 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v43 = *(void **)(v42 + 40);
        *(_QWORD *)(v42 + 40) = v41;

      }
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v44 = -[PLBackgroundJobWorkerPendingWorkItems initWithZeroWorkItems]([PLBackgroundJobWorkerPendingWorkItems alloc], "initWithZeroWorkItems");
    v45 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v46 = *(void **)(v45 + 40);
    *(_QWORD *)(v45 + 40) = v44;

  }
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  int v4;

  v4 = _os_feature_enabled_impl();
  if (v4)
  {
    if (a3)
    {
      LOBYTE(v4) = a3 == 3 || a3 == 1;
    }
    else
    {
      +[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:](PLSpotlightDonationUtilities, "shouldUseSpotlightPrivateIndexForLibraryIdentifier:", 0);
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

+ (id)_criteriaToUse
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end
