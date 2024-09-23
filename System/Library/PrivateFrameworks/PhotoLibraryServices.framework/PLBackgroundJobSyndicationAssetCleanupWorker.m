@implementation PLBackgroundJobSyndicationAssetCleanupWorker

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 == 3;
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  PLBackgroundJobWorkerPendingWorkItems *v11;
  PLBackgroundJobWorkerPendingWorkItems *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  PLBackgroundJobSyndicationAssetCleanupWorker *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLBackgroundJobCriteria criteriaForHubbleWorker](PLBackgroundJobCriteria, "criteriaForHubbleWorker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__46026;
  v23 = __Block_byref_object_dispose__46027;
  v24 = 0;
  objc_msgSend(v4, "globalValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastFullIndexSyndicationSyncStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    PLSyndicationGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[PLBackgroundJobWorker workerName](self, "workerName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      *(_DWORD *)buf = 138543874;
      v26 = v9;
      v27 = 2112;
      v28 = v7;
      v29 = 2048;
      v30 = v10;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "[sync.worker] %{public}@ searching for assets that have not been updated since last full index on date: %@ (%f)", buf, 0x20u);

    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __84__PLBackgroundJobSyndicationAssetCleanupWorker_workItemsNeedingProcessingInLibrary___block_invoke;
    v14[3] = &unk_1E3676EC8;
    v15 = v7;
    v18 = &v19;
    v16 = v4;
    v17 = self;
    objc_msgSend(v16, "performBlockAndWait:", v14);

  }
  v11 = [PLBackgroundJobWorkerPendingWorkItems alloc];
  v12 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v11, "initWithCriteria:workItemsNeedingProcessing:", v5, v20[5]);

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  PLBackgroundJobSyndicationAssetCleanupWorker *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__46026;
  v22 = __Block_byref_object_dispose__46027;
  v23 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__PLBackgroundJobSyndicationAssetCleanupWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v13[3] = &unk_1E3676EC8;
  v11 = v9;
  v14 = v11;
  v12 = v8;
  v16 = self;
  v17 = &v18;
  v15 = v12;
  objc_msgSend(v11, "performTransactionAndWait:", v13);
  v10[2](v10, v19[5]);

  _Block_object_dispose(&v18, 8);
}

- (BOOL)isInterruptible
{
  return 0;
}

void __87__PLBackgroundJobSyndicationAssetCleanupWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);

  if (v5)
  {
    PLSyndicationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "workerName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "additionalAttributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "syndicationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v7;
      v18 = 2114;
      v19 = v8;
      v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "[sync.worker] %{public}@ deleting asset not found in last full index, uuid: %{public}@, syndicationID: %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject deleteObject:](v11, "deleteObject:", v5);
  }
  else
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      goto LABEL_6;
    PLSyndicationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "workerName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 40);
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "[sync.worker] %{public}@ failed to fetch asset for object ID: %{public}@ with error: %@", buf, 0x20u);

    }
  }

LABEL_6:
}

void __84__PLBackgroundJobSyndicationAssetCleanupWorker_workItemsNeedingProcessingInLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K < %@"), CFSTR("additionalAttributes"), CFSTR("lastUploadAttemptDate"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setResultType:", 1);
  objc_msgSend(v4, "setFetchLimit:", 100);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v13);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    PLSyndicationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "workerName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "[sync.worker] %{public}@ failed to fetch work items with error: %@", buf, 0x16u);

    }
  }

}

@end
