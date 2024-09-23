@implementation PLBackgroundJobDeferredRenderDerivativesBaseWorker

+ (id)_criteriaToUse
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 != 3;
}

+ (BOOL)allowWorkerToRunDuringCPLInitialSync
{
  return 1;
}

- (NSSet)deferredProcessingStatesHandled
{
  PLBackgroundJobDeferredRenderDerivativesBaseWorker *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)_predicateToFetchDeferredAssets
{
  PLBackgroundJobDeferredRenderDerivativesBaseWorker *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)imageConversionClient
{
  PAImageConversionServiceClient *imageConversionClient;
  PAImageConversionServiceClient *v4;
  PAImageConversionServiceClient *v5;

  imageConversionClient = self->_imageConversionClient;
  if (!imageConversionClient)
  {
    v4 = (PAImageConversionServiceClient *)objc_alloc_init(MEMORY[0x1E0D47BE8]);
    v5 = self->_imageConversionClient;
    self->_imageConversionClient = v4;

    imageConversionClient = self->_imageConversionClient;
  }
  return imageConversionClient;
}

- (id)videoConversionClient
{
  PAVideoConversionServiceClient *videoConversionClient;
  PAVideoConversionServiceClient *v4;
  PAVideoConversionServiceClient *v5;

  videoConversionClient = self->_videoConversionClient;
  if (!videoConversionClient)
  {
    v4 = (PAVideoConversionServiceClient *)objc_alloc_init(MEMORY[0x1E0D47C30]);
    v5 = self->_videoConversionClient;
    self->_videoConversionClient = v4;

    videoConversionClient = self->_videoConversionClient;
  }
  return videoConversionClient;
}

- (id)taskIdentifier
{
  PLBackgroundJobDeferredRenderDerivativesBaseWorker *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
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
  objc_msgSend((id)objc_opt_class(), "_criteriaToUse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__9618;
  v17 = __Block_byref_object_dispose__9619;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__PLBackgroundJobDeferredRenderDerivativesBaseWorker_workItemsNeedingProcessingInLibrary___block_invoke;
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
  PLBackgroundJobDeferredRenderDerivativesBaseWorker *v22;
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
  v26[3] = __Block_byref_object_copy__9618;
  v26[4] = __Block_byref_object_dispose__9619;
  v27 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __93__PLBackgroundJobDeferredRenderDerivativesBaseWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v19[3] = &unk_1E36708F8;
  v12 = v8;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  v22 = self;
  v24 = v28;
  v25 = v26;
  v23 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __93__PLBackgroundJobDeferredRenderDerivativesBaseWorker_performWorkOnItem_inLibrary_completion___block_invoke_53;
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
  return 1;
}

- (void)stopWorkingOnItem:(id)a3
{
  -[NSProgress cancel](self->_progressForCurrentAsset, "cancel", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoConversionClient, 0);
  objc_storeStrong((id *)&self->_imageConversionClient, 0);
  objc_storeStrong((id *)&self->_progressForCurrentAsset, 0);
}

void __93__PLBackgroundJobDeferredRenderDerivativesBaseWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v3, "existingObjectWithID:error:", v2, &v27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v27;
  v6 = v27;

  if (v4)
  {
    v7 = v4;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 48), "taskIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D47CB8]);

    objc_msgSend(*(id *)(a1 + 48), "imageConversionClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "videoConversionClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __93__PLBackgroundJobDeferredRenderDerivativesBaseWorker_performWorkOnItem_inLibrary_completion___block_invoke_50;
    v21[3] = &unk_1E36624A8;
    v12 = v7;
    v26 = *(_QWORD *)(a1 + 72);
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(void **)(a1 + 56);
    v22 = v12;
    v23 = v13;
    v25 = v14;
    v24 = *(id *)(a1 + 40);
    +[PLResourceGenerator generateAndStoreMissingExpectedLocalResourcesForAsset:versions:imageConversionClient:videoConversionClient:conversionServiceOptions:reason:completion:](PLResourceGenerator, "generateAndStoreMissingExpectedLocalResourcesForAsset:versions:imageConversionClient:videoConversionClient:conversionServiceOptions:reason:completion:", v12, &unk_1E3763338, v10, v11, v8, CFSTR("Background job deferred render derivatives"), v21);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(void **)(v16 + 104);
    *(_QWORD *)(v16 + 104) = v15;

    v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 104), "completedUnitCount");
    if (v18 == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 104), "totalUnitCount"))
    {
      v19 = *(_QWORD *)(a1 + 48);
      v20 = *(void **)(v19 + 104);
      *(_QWORD *)(v19 + 104) = 0;

    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v5);
    PLBackgroundJobServiceGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v2;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch existingObjectWithID: %@ %@", buf, 0x16u);
    }
  }

}

_QWORD *__93__PLBackgroundJobDeferredRenderDerivativesBaseWorker_performWorkOnItem_inLibrary_completion___block_invoke_53(_QWORD *result)
{
  if (!*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD))(result[4] + 16))(result[4], *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40));
  return result;
}

void __93__PLBackgroundJobDeferredRenderDerivativesBaseWorker_performWorkOnItem_inLibrary_completion___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  unsigned int v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  __CFString *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  id v49;
  __int16 v50;
  __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v7 = objc_claimAutoreleasedReturnValue();
  PLBackgroundJobServiceGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v49 = v9;
    v50 = 2114;
    v51 = v10;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Deferred render derivatives ran on asset uuid: %{public}@, produced recipes: %{public}@", buf, 0x16u);

  }
  if (objc_msgSend(v5, "count"))
  {
    PLBackgroundJobServiceGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v49 = v5;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Deferred render derivatives encountered errors: %{public}@", buf, 0xCu);
    }

  }
  v41 = (void *)v7;
  v12 = v6;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v44;
    v17 = (void *)*MEMORY[0x1E0D74498];
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v44 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v19, "domain", v41);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 == v17)
        {
          v21 = objc_msgSend(v19, "code");

          if (v21 == 47002)
          {
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v19);

            goto LABEL_20;
          }
        }
        else
        {

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v15)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "deferredProcessingStatesHandled");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 32), "deferredProcessingNeeded"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "containsObject:", v23);

  if (v24)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDeferredProcessingNeeded:", 0);
LABEL_20:
    v25 = v12;
    v26 = v41;
  }
  else
  {
    PLBackgroundJobServiceGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v25 = v12;
    v26 = v41;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(*(id *)(a1 + 32), "deferredProcessingNeeded");
      if (v29 > 0xB)
        v30 = 0;
      else
        v30 = off_1E3663E30[v29];
      v31 = v30;
      *(_DWORD *)buf = 138543618;
      v49 = v28;
      v50 = 2112;
      v51 = v31;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "Deferred render derivatives finished on asset uuid: %{public}@, but cannot overwrite deferred processing needed '%@'", buf, 0x16u);

    }
  }
  if (objc_msgSend(v26, "hasChanges", v41))
  {
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "managedObjectContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v34 = objc_msgSend(v33, "save:", &v42);
    v35 = v42;
    v36 = (__CFString *)v42;

    if ((v34 & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v35);
      PLBackgroundJobServiceGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "uuid");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v38;
        v50 = 2112;
        v51 = v36;
        _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, "Deferred render derivatives failed to save changes on asset uuid: %{public}@:, error: %@", buf, 0x16u);

      }
    }

  }
  v39 = *(_QWORD *)(a1 + 40);
  v40 = *(void **)(v39 + 104);
  *(_QWORD *)(v39 + 104) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __90__PLBackgroundJobDeferredRenderDerivativesBaseWorker_workItemsNeedingProcessingInLibrary___block_invoke(uint64_t a1)
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

  objc_msgSend(*(id *)(a1 + 32), "_predicateToFetchDeferredAssets");
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
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch deferredProcessingNeeded assets: %@", buf, 0xCu);
    }
  }

}

@end
