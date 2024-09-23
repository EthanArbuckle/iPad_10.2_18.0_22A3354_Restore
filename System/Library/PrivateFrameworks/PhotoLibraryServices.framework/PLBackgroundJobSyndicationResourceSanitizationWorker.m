@implementation PLBackgroundJobSyndicationResourceSanitizationWorker

- (BOOL)isNetworkAccessAllowed
{
  return 0;
}

- (unint64_t)batchSize
{
  return 1;
}

- (id)resourceIDsForPrefetchWithLibrary:(id)a3
{
  PLSyndicationResourcePrefetchEngine *prefetchManager;
  void *v4;
  void *v5;

  prefetchManager = self->_prefetchManager;
  objc_msgSend(a3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSyndicationResourcePrefetchEngine highPriorityResourcesForPrefetchWithManagedObjectContext:](prefetchManager, "highPriorityResourcesForPrefetchWithManagedObjectContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PLBackgroundJobSyndicationResourceSanitizationWorker)initWithLibraryBundle:(id)a3
{
  PLBackgroundJobSyndicationResourceSanitizationWorker *v3;
  PLSyndicationResourcePrefetchEngine *v4;
  PLSyndicationResourcePrefetchEngine *prefetchManager;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLBackgroundJobSyndicationResourceSanitizationWorker;
  v3 = -[PLBackgroundJobWorker initWithLibraryBundle:](&v7, sel_initWithLibraryBundle_, a3);
  if (v3)
  {
    v4 = -[PLSyndicationResourcePrefetchEngine initWithDelegate:]([PLSyndicationResourcePrefetchEngine alloc], "initWithDelegate:", v3);
    prefetchManager = v3->_prefetchManager;
    v3->_prefetchManager = v4;

  }
  return v3;
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  PLBackgroundJobWorkerPendingWorkItems *v9;
  PLBackgroundJobWorkerPendingWorkItems *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  PLBackgroundJobWorkerPendingWorkItems *v22;
  void *v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[PLBackgroundJobSyndicationResourceSanitizationWorker batchSize](self, "batchSize"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundJobSyndicationResourceSanitizationWorker.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.batchSize > 0"));

  }
  objc_msgSend((id)objc_opt_class(), "syndicationWorkerCriteria");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__48558;
  v38 = __Block_byref_object_dispose__48559;
  v39 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __92__PLBackgroundJobSyndicationResourceSanitizationWorker_workItemsNeedingProcessingInLibrary___block_invoke;
  v31[3] = &unk_1E3676EA0;
  v33 = &v34;
  v31[4] = self;
  v6 = v5;
  v32 = v6;
  objc_msgSend(v6, "performBlockAndWait:", v31);
  if (-[PLBackgroundJobSyndicationResourceSanitizationWorker batchSize](self, "batchSize") == 1)
  {
    PLBackgroundJobServiceGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend((id)v35[5], "count");
      *(_DWORD *)buf = 134217984;
      v41 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "[resource.sync]: %tu work items need processing", buf, 0xCu);
    }

    v9 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    v10 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v9, "initWithCriteria:workItemsNeedingProcessing:", v26, v35[5]);
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v11, "addObject:", v12);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = (id)v35[5];
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v44, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v28;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(v12, "addObject:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v16));
          v17 = objc_msgSend(v12, "count");
          if (v17 == -[PLBackgroundJobSyndicationResourceSanitizationWorker batchSize](self, "batchSize"))
          {
            v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

            objc_msgSend(v11, "addObject:", v18);
            v12 = v18;
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v44, 16);
      }
      while (v14);
    }

    if (!objc_msgSend(v12, "count"))
      objc_msgSend(v11, "removeLastObject");
    PLBackgroundJobServiceGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend(v11, "count");
      v21 = objc_msgSend((id)v35[5], "count");
      *(_DWORD *)buf = 134218240;
      v41 = v20;
      v42 = 2048;
      v43 = v21;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "[resource.sync]: %tu / %tu work items need processing", buf, 0x16u);
    }

    v22 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    v23 = (void *)objc_msgSend(v11, "copy");
    v10 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v22, "initWithCriteria:workItemsNeedingProcessing:", v26, v23);

  }
  _Block_object_dispose(&v34, 8);

  return v10;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  PLSyndicationResourcePrefetchEngine *prefetchManager;
  id v13;
  NSObject *v14;
  void *v15;
  PLSyndicationResourcePrefetchEngine *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!-[PLBackgroundJobSyndicationResourceSanitizationWorker batchSize](self, "batchSize"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLBackgroundJobSyndicationResourceSanitizationWorker.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.batchSize > 0"));

  }
  if (-[PLBackgroundJobWorker hasEnoughDiskSpaceToContinue:](self, "hasEnoughDiskSpaceToContinue:", v11))
  {
    objc_storeStrong((id *)&self->_currentLibrary, a4);
    if (-[PLBackgroundJobSyndicationResourceSanitizationWorker batchSize](self, "batchSize") == 1)
    {
      prefetchManager = self->_prefetchManager;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __95__PLBackgroundJobSyndicationResourceSanitizationWorker_performWorkOnItem_inLibrary_completion___block_invoke;
      v20[3] = &unk_1E3674E40;
      v20[4] = self;
      v21 = v11;
      -[PLSyndicationResourcePrefetchEngine prefetchResourceWithObjectID:completion:](prefetchManager, "prefetchResourceWithObjectID:completion:", v9, v20);

    }
    else
    {
      v13 = v9;
      PLSyndicationGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[PLBackgroundJobWorker workerName](self, "workerName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v15;
        v24 = 2048;
        v25 = objc_msgSend(v13, "count");
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "[resource.sync] %@ prefetching %lu items", buf, 0x16u);

      }
      v16 = self->_prefetchManager;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __95__PLBackgroundJobSyndicationResourceSanitizationWorker_performWorkOnItem_inLibrary_completion___block_invoke_29;
      v18[3] = &unk_1E3674E40;
      v18[4] = self;
      v19 = v11;
      -[PLSyndicationResourcePrefetchEngine prefetchResourceWithObjectIDs:completion:](v16, "prefetchResourceWithObjectIDs:completion:", v13, v18);

    }
  }

}

- (id)downloadThrottlingDateForPrefetchManager:(id)a3
{
  void *v3;
  void *v4;

  -[PLPhotoLibrary globalValues](self->_currentLibrary, "globalValues", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syndicationPrefetchDownloadThrottlingDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)prefetchManager:(id)a3 receivedNewDownloadThrottlingDate:(id)a4 managedObjectContext:(id)a5
{
  +[PLGlobalValues setSyndicationPrefetchDownloadThrottlingDate:managedObjectContext:](PLGlobalValues, "setSyndicationPrefetchDownloadThrottlingDate:managedObjectContext:", a4, a5);
}

- (void)performTransactionForPrefetchManager:(id)a3 synchronous:(BOOL)a4 block:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  PLPhotoLibrary *currentLibrary;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v5 = a4;
  v7 = a5;
  v8 = v7;
  currentLibrary = self->_currentLibrary;
  if (v5)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __111__PLBackgroundJobSyndicationResourceSanitizationWorker_performTransactionForPrefetchManager_synchronous_block___block_invoke;
    v13[3] = &unk_1E3675C58;
    v13[4] = self;
    v14 = v7;
    -[PLPhotoLibrary performTransactionAndWait:](currentLibrary, "performTransactionAndWait:", v13);
    v10 = v14;
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __111__PLBackgroundJobSyndicationResourceSanitizationWorker_performTransactionForPrefetchManager_synchronous_block___block_invoke_2;
    v11[3] = &unk_1E3675C58;
    v11[4] = self;
    v12 = v7;
    -[PLPhotoLibrary performTransaction:](currentLibrary, "performTransaction:", v11);
    v10 = v12;
  }

}

- (id)requestLocalAvailabilityChangeForPrefetchManager:(id)a3 resource:(id)a4 options:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v10, "dataStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestLocalAvailabilityChange:forResource:options:completion:", 1, v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)batchRequestResourcesForPrefetchManager:(id)a3 itemIdentifiersWithBundleIDs:(id)a4 destURLs:(id)a5 options:(id)a6 resultHandler:(id)a7 completionHandler:(id)a8
{
  +[PLSyndicationResourceDataStore provideFileURLAndUnwrapLivePhotoIfNeededForItemIdentifiersWithBundleIDs:destURLs:options:resultHandler:completionHandler:](PLSyndicationResourceDataStore, "provideFileURLAndUnwrapLivePhotoIfNeededForItemIdentifiersWithBundleIDs:destURLs:options:resultHandler:completionHandler:", a4, a5, a6, a7, a8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLibrary, 0);
  objc_storeStrong((id *)&self->_prefetchManager, 0);
}

void __111__PLBackgroundJobSyndicationResourceSanitizationWorker_performTransactionForPrefetchManager_synchronous_block___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "managedObjectContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __111__PLBackgroundJobSyndicationResourceSanitizationWorker_performTransactionForPrefetchManager_synchronous_block___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "managedObjectContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __95__PLBackgroundJobSyndicationResourceSanitizationWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 112);
  *(_QWORD *)(v3 + 112) = 0;
  v5 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __95__PLBackgroundJobSyndicationResourceSanitizationWorker_performWorkOnItem_inLibrary_completion___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLSyndicationGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "workerName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v6;
      v15 = 2112;
      v16 = v3;
      v7 = "[resource.sync] %{public}@ prefetch failed with error: %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 22;
LABEL_6:
      _os_log_impl(&dword_199541000, v8, v9, v7, (uint8_t *)&v13, v10);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "workerName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v6;
    v7 = "[resource.sync] %{public}@ prefetch batch finished";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 12;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, v11, v12);
}

void __92__PLBackgroundJobSyndicationResourceSanitizationWorker_workItemsNeedingProcessingInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "resourceIDsForPrefetchWithLibrary:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)syndicationWorkerCriteria
{
  return +[PLBackgroundJobCriteria criteriaForHubbleWorker](PLBackgroundJobCriteria, "criteriaForHubbleWorker");
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 == 3;
}

@end
