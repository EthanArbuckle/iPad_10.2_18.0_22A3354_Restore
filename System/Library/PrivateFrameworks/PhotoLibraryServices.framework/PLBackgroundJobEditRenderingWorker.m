@implementation PLBackgroundJobEditRenderingWorker

+ (id)workerWithLibrary:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a1;
  PLAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 != 3;
}

+ (BOOL)allowWorkerToRunDuringCPLInitialSync
{
  return 1;
}

- (id)_predicateToFetchDeferredAdjustmentNeededAssets
{
  PLBackgroundJobEditRenderingWorker *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)dealloc
{
  objc_super v3;

  -[PAVideoConversionServiceClient invalidateAfterPendingRequestCompletion](self->_videoConversionServiceClient, "invalidateAfterPendingRequestCompletion");
  v3.receiver = self;
  v3.super_class = (Class)PLBackgroundJobEditRenderingWorker;
  -[PLBackgroundJobEditRenderingWorker dealloc](&v3, sel_dealloc);
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  PLBackgroundJobWorkerPendingWorkItems *v7;
  PLBackgroundJobWorkerPendingWorkItems *v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  +[PLBackgroundJobCriteria criteriaForDiscretionaryResourceWorker](PLBackgroundJobCriteria, "criteriaForDiscretionaryResourceWorker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__71866;
  v17 = __Block_byref_object_dispose__71867;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__PLBackgroundJobEditRenderingWorker_workItemsNeedingProcessingInLibrary___block_invoke;
  v10[3] = &unk_1E3676EA0;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  v12 = &v13;
  objc_msgSend(v6, "performBlockAndWait:", v10);
  v7 = [PLBackgroundJobWorkerPendingWorkItems alloc];
  v8 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v7, "initWithCriteria:workItemsNeedingProcessing:", v5, v14[5]);

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  PLBackgroundJobEditRenderingWorker *v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[3];
  char v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__71866;
  v26[4] = __Block_byref_object_dispose__71867;
  v27 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__PLBackgroundJobEditRenderingWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v19[3] = &unk_1E36708F8;
  v12 = v8;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  v22 = self;
  v24 = v28;
  v23 = v10;
  v25 = v26;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __77__PLBackgroundJobEditRenderingWorker_performWorkOnItem_inLibrary_completion___block_invoke_36;
  v15[3] = &unk_1E3674CE0;
  v17 = v28;
  v14 = v23;
  v16 = v14;
  v18 = v26;
  objc_msgSend(v13, "performTransaction:completionHandler:", v19, v15);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);

}

- (BOOL)isInterruptible
{
  NSProgress *progressForCurrentAsset;
  NSObject *v3;
  uint8_t v5[16];

  progressForCurrentAsset = self->_progressForCurrentAsset;
  if (!progressForCurrentAsset)
  {
    PLBackgroundJobServiceGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Returning NO from isInterruptible because there is no current progress instance", v5, 2u);
    }

  }
  return progressForCurrentAsset != 0;
}

- (void)stopWorkingOnItem:(id)a3
{
  -[NSProgress cancel](self->_progressForCurrentAsset, "cancel", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressForCurrentAsset, 0);
  objc_storeStrong((id *)&self->_videoConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_imageConversionServiceClient, 0);
}

void __77__PLBackgroundJobEditRenderingWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v3, "existingObjectWithID:error:", v2, &v32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v32;
  v6 = v32;

  if (!v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v5);
    PLBackgroundJobServiceGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_DWORD *)buf = 138412546;
    v34 = v2;
    v35 = 2112;
    v36 = v6;
    v26 = "Failed to find existingObjectWithID: %@ %@";
    v27 = v18;
    v28 = 22;
LABEL_12:
    _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 48), "_predicateToFetchDeferredAdjustmentNeededAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "evaluateWithObject:", v4);

  if (!v8)
  {
    PLBackgroundJobServiceGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    *(_DWORD *)buf = 138412290;
    v34 = v2;
    v26 = "Skipped edit processing for objectID %@, predicate no longer matches";
    v27 = v18;
    v28 = 12;
    goto LABEL_12;
  }
  v9 = *(_QWORD *)(a1 + 48);
  if (!*(_QWORD *)(v9 + 104))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D47BE8]);
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(void **)(v11 + 104);
    *(_QWORD *)(v11 + 104) = v10;

    v9 = *(_QWORD *)(a1 + 48);
  }
  if (!*(_QWORD *)(v9 + 112))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0D47C30]);
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(void **)(v14 + 112);
    *(_QWORD *)(v14 + 112) = v13;

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  v16 = (void *)MEMORY[0x1E0CB3940];
  v17 = v4;
  objc_msgSend(v16, "stringWithFormat:", CFSTR("Background deferred adjustment generation for object ID %@"), v2);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(a1 + 48);
  v20 = *(void **)(a1 + 56);
  v21 = *(_QWORD *)(v19 + 104);
  v22 = *(_QWORD *)(v19 + 112);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[2] = __77__PLBackgroundJobEditRenderingWorker_performWorkOnItem_inLibrary_completion___block_invoke_2;
  v29[3] = &unk_1E36779C0;
  v29[1] = 3221225472;
  v29[4] = v19;
  v31 = v20;
  v30 = *(id *)(a1 + 40);
  objc_msgSend(v17, "generateDeferredAdjustmentWithImageConversionClient:videoConversionClient:reason:allowCancellationByService:completion:", v21, v22, v18, 0, v29);
  v23 = objc_claimAutoreleasedReturnValue();

  v24 = *(_QWORD *)(a1 + 48);
  v25 = *(void **)(v24 + 120);
  *(_QWORD *)(v24 + 120) = v23;

LABEL_13:
}

_QWORD *__77__PLBackgroundJobEditRenderingWorker_performWorkOnItem_inLibrary_completion___block_invoke_36(_QWORD *result)
{
  if (!*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD))(result[4] + 16))(result[4], *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40));
  return result;
}

void __77__PLBackgroundJobEditRenderingWorker_performWorkOnItem_inLibrary_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 120);
  *(_QWORD *)(v4 + 120) = 0;
  v6 = a3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __74__PLBackgroundJobEditRenderingWorker_workItemsNeedingProcessingInLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_predicateToFetchDeferredAdjustmentNeededAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setFetchBatchSize:", 100);
  objc_msgSend(v4, "setResultType:", 1);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  if (v7)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = v7;
    v11 = *(NSObject **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }
  else
  {
    PLBackgroundJobServiceGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch deferred adjustment processing needed: %@", buf, 0xCu);
    }
  }

}

@end
