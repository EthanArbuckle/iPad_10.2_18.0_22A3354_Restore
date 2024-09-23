@implementation PLBackgroundJobResourceAvailabilityWorker

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

- (id)deferredPhotoFinalizer
{
  PLDeferredPhotoFinalizer *deferredPhotoFinalizer;
  PLDeferredPhotoFinalizer *v4;
  PLDeferredPhotoFinalizer *v5;

  deferredPhotoFinalizer = self->_deferredPhotoFinalizer;
  if (!deferredPhotoFinalizer)
  {
    v4 = -[PLDeferredPhotoFinalizer initForUseCase:]([PLDeferredPhotoFinalizer alloc], "initForUseCase:", 1);
    v5 = self->_deferredPhotoFinalizer;
    self->_deferredPhotoFinalizer = v4;

    deferredPhotoFinalizer = self->_deferredPhotoFinalizer;
  }
  return deferredPhotoFinalizer;
}

- (PLBackgroundJobResourceAvailabilityWorker)initWithLibraryBundle:(id)a3
{
  PLBackgroundJobResourceAvailabilityWorker *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLBackgroundJobResourceAvailabilityWorker;
  result = -[PLBackgroundJobWorker initWithLibraryBundle:](&v4, sel_initWithLibraryBundle_, a3);
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_countOfDeferredPhotosProcessed = 0;
  }
  return result;
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  PLBackgroundJobWorkerPendingWorkItems *v6;
  PLBackgroundJobWorkerPendingWorkItems *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a3;
  +[PLBackgroundJobCriteria criteriaForUrgentResourceWorker](PLBackgroundJobCriteria, "criteriaForUrgentResourceWorker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9040;
  v19 = __Block_byref_object_dispose__9041;
  v20 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __81__PLBackgroundJobResourceAvailabilityWorker_workItemsNeedingProcessingInLibrary___block_invoke;
  v12 = &unk_1E3677C68;
  v5 = v3;
  v13 = v5;
  v14 = &v15;
  objc_msgSend(v5, "performBlockAndWait:", &v9);
  v6 = [PLBackgroundJobWorkerPendingWorkItems alloc];
  v7 = -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](v6, "initWithCriteria:workItemsNeedingProcessing:", v4, v16[5], v9, v10, v11, v12);

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  os_signpost_id_t v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  PLBackendGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);
  v13 = v8;
  v14 = v11;
  v15 = v14;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v13;
    _os_signpost_emit_with_name_impl(&dword_199541000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v12, "backgroundResourceAvailabilityWorkItem", "item:%{public}@", buf, 0xCu);
  }

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__PLBackgroundJobResourceAvailabilityWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v18[3] = &unk_1E366F000;
  v19 = v15;
  v20 = v9;
  v21 = v12;
  v16 = v15;
  v17 = v9;
  -[PLBackgroundJobResourceAvailabilityWorker _performWorkOnItem:inLibrary:completion:](self, "_performWorkOnItem:inLibrary:completion:", v13, v10, v18);

}

- (void)_performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  PLBackgroundJobResourceAvailabilityWorker *v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  objc_msgSend(v9, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke;
  v16[3] = &unk_1E3662440;
  v12 = v8;
  v17 = v12;
  v13 = v11;
  v18 = v13;
  v14 = v10;
  v21 = v14;
  v15 = v9;
  v22 = v23;
  v19 = v15;
  v20 = self;
  objc_msgSend(v15, "performBlockAndWait:", v16);

  _Block_object_dispose(v23, 8);
}

- (void)workerDidFinishWithDatabaseContext:(id)a3
{
  void *v3;
  id v4;

  if (self->_countOfDeferredPhotosProcessed >= 1)
  {
    -[PLBackgroundJobWorker libraryBundle](self, "libraryBundle", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintsDirector");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "informAssetsFinishedDeferredProcessing");

  }
}

- (BOOL)isInterruptible
{
  PLBackgroundJobResourceAvailabilityWorker *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_progressForCurrentAsset != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)stopWorkingOnItem:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSProgress *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_progressForCurrentAsset;
  os_unfair_lock_unlock(p_lock);
  -[NSProgress cancel](v5, "cancel");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredPhotoFinalizer, 0);
  objc_storeStrong((id *)&self->_videoConversionClient, 0);
  objc_storeStrong((id *)&self->_imageConversionClient, 0);
  objc_storeStrong((id *)&self->_progressForCurrentAsset, 0);
}

void __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint32_t v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  NSObject *v64;
  id v65;
  uint64_t v66;
  void *v67;
  uint8_t buf[4];
  id v69;
  __int16 v70;
  id v71;
  uint64_t v72;
  _QWORD v73[4];

  v73[1] = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v65 = 0;
  objc_msgSend(v3, "existingObjectWithID:error:", v2, &v65);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v65;
  objc_msgSend(v4, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateCreated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceNow");
  v10 = v9;

  if (v10 <= -30.0)
  {
    if (v4)
    {
      +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", objc_msgSend(v4, "recipeID"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "supportedVersionsForLocalResourceGeneration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v4, "isLocallyAvailable");
      v51 = v16;
      v52 = v7;
      if (v14 && (v17 & 1) == 0 && (int)objc_msgSend(v4, "localAvailabilityTarget") > 0)
      {
        if (objc_msgSend(v16, "count") == 1)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
          objc_msgSend(*(id *)(a1 + 56), "deferredPhotoFinalizer");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "supportedVersionsForLocalResourceGeneration");
          v19 = v7;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v21, "integerValue");

          objc_msgSend(*(id *)(a1 + 56), "imageConversionClient");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "videoConversionClient");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = 0;
          v53[0] = MEMORY[0x1E0C809B0];
          v53[1] = 3221225472;
          v53[2] = __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke_2;
          v53[3] = &unk_1E3662418;
          v54 = *(id *)(a1 + 48);
          v23 = v4;
          v24 = *(_QWORD *)(a1 + 56);
          v55 = v23;
          v56 = v24;
          v57 = v14;
          v58 = v19;
          v59 = *(id *)(a1 + 64);
          objc_msgSend(v57, "generateAndStoreForAsset:version:imageConversionClient:videoConversionClient:conversionServiceOptions:deferredPhotoFinalizer:progress:reason:completion:", v6, v50, v49, v22, 0, v18, &v60, CFSTR("Background job resource availability"), v53);
          v25 = v60;

          os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 56) + 104));
          v26 = *(_QWORD *)(a1 + 56);
          v27 = *(void **)(v26 + 112);
          *(_QWORD *)(v26 + 112) = v25;
          v28 = v25;

          os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 56) + 104));
        }
        else
        {
          PLBackgroundJobServiceGetLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v6, "uuid");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v69 = v14;
            v70 = 2114;
            v71 = v39;
            _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_ERROR, "Availability worker: resource %{public}@ with asset uuid %{public}@ is not supported for local generation, lowering availability... ", buf, 0x16u);

          }
          v40 = *(void **)(a1 + 48);
          v61[0] = MEMORY[0x1E0C809B0];
          v61[1] = 3221225472;
          v61[2] = __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke_41;
          v61[3] = &unk_1E3677AA0;
          v62 = v4;
          objc_msgSend(v40, "performTransactionAndWait:", v61);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 47005, 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

          v18 = v62;
        }
        goto LABEL_35;
      }
      if (objc_msgSend(v4, "isLocallyAvailable"))
      {
        PLBackgroundJobServiceGetLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "uuid");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v69 = v14;
          v70 = 2114;
          v71 = v30;
          _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEFAULT, "Availability worker: resource %{public}@ with asset uuid %{public}@ has already been made available, skipping", buf, 0x16u);

        }
        if (v14)
          goto LABEL_34;
      }
      else
      {
        if (v14)
        {
          if ((int)objc_msgSend(v4, "localAvailabilityTarget") <= 0)
          {
            PLBackgroundJobServiceGetLog();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v6, "uuid");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v69 = v14;
              v70 = 2114;
              v71 = v37;
              _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEFAULT, "Availability worker: resource %{public}@ with asset uuid %{public}@ availability target has changed, skipping", buf, 0x16u);

            }
            goto LABEL_33;
          }
LABEL_34:
          v45 = (void *)MEMORY[0x1E0CB35C8];
          v46 = *MEMORY[0x1E0D74498];
          v66 = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No work needed for object"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v47;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "errorWithDomain:code:userInfo:", v46, 50002, v48);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_35:

          v7 = v52;
          goto LABEL_36;
        }
        PLBackgroundJobServiceGetLog();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "uuid");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v69 = 0;
          v70 = 2114;
          v71 = v43;
          _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_DEFAULT, "Availability worker: resource %{public}@ with asset uuid %{public}@ has no resource recipe, skipping", buf, 0x16u);

        }
      }
      if ((int)objc_msgSend(v4, "localAvailabilityTarget") >= 1)
      {
        v44 = *(void **)(a1 + 48);
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke_37;
        v63[3] = &unk_1E3677AA0;
        v64 = v4;
        objc_msgSend(v44, "performTransactionAndWait:", v63);
        v36 = v64;
LABEL_33:

        goto LABEL_34;
      }
      goto LABEL_34;
    }
    if (v5)
    {
      v14 = v5;
      PLBackgroundJobServiceGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v69 = v2;
        v70 = 2112;
        v71 = v14;
        v32 = "Failed to fetch existingObjectWithID: %@ %@";
        v33 = v31;
        v34 = OS_LOG_TYPE_ERROR;
        v35 = 22;
LABEL_23:
        _os_log_impl(&dword_199541000, v33, v34, v32, buf, v35);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 47017, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      PLBackgroundJobServiceGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v69 = v2;
        v32 = "Resource no longer available for objectID: %@";
        v33 = v31;
        v34 = OS_LOG_TYPE_DEFAULT;
        v35 = 12;
        goto LABEL_23;
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_36;
  }
  v11 = *(_QWORD *)(a1 + 64);
  v12 = (void *)MEMORY[0x1E0CB35C8];
  v13 = *MEMORY[0x1E0D74498];
  v72 = *MEMORY[0x1E0CB2938];
  v73[0] = CFSTR("stopping due to asset being too new to background process");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 50004, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v15);

LABEL_36:
}

uint64_t __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke_37(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLocalAvailabilityTarget:", 0);
}

uint64_t __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke_41(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLocalAvailability:", 4294934528);
}

void __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id *v17;
  id v18;
  id v19;
  char v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  id *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v35 = 0;
  v36 = (id *)&v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__9040;
  v39 = __Block_byref_object_dispose__9041;
  v40 = 0;
  if (v12)
  {
    if (+[PLDeferredPhotoFinalizer errorIsRecoverable:](PLDeferredPhotoFinalizer, "errorIsRecoverable:", v12))
    {
      PLBackgroundJobServiceGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v12;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Availability worker: encountered recoverable deferred photo finalizer error %@, will try again later", buf, 0xCu);
      }

      v17 = v36;
      v18 = v12;
      v19 = v17[5];
      v17[5] = v18;
    }
    else
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke_44;
      v29[3] = &unk_1E3677970;
      v23 = *(void **)(a1 + 32);
      v24 = *(id *)(a1 + 40);
      v25 = *(_QWORD *)(a1 + 48);
      v26 = *(void **)(a1 + 56);
      v30 = v24;
      v31 = v25;
      v32 = v26;
      v33 = *(id *)(a1 + 64);
      v34 = &v35;
      objc_msgSend(v23, "performTransactionAndWait:", v29);

      v19 = v30;
    }
LABEL_12:

    goto LABEL_13;
  }
  ++*(_DWORD *)(*(_QWORD *)(a1 + 48) + 136);
  if (objc_msgSend(v11, "hasChanges"))
  {
    v28 = 0;
    v20 = objc_msgSend(v11, "save:", &v28);
    v21 = v28;
    v19 = v28;
    if ((v20 & 1) == 0)
    {
      PLBackgroundJobServiceGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v19;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Availability worker failed to save changes for moc with error: %@", buf, 0xCu);
      }

      objc_storeStrong(v36 + 5, v21);
    }
    goto LABEL_12;
  }
LABEL_13:
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 104));
  v27 = *(void **)(*(_QWORD *)(a1 + 48) + 112);
  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 112) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 104));
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  _Block_object_dispose(&v35, 8);

}

void __85__PLBackgroundJobResourceAvailabilityWorker__performWorkOnItem_inLibrary_completion___block_invoke_44(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isLocallyAvailable");
  PLBackgroundJobServiceGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(a1 + 32), "isLocallyAvailable"))
        v6 = CFSTR("Y");
      else
        v6 = CFSTR("N");
      objc_msgSend(*(id *)(a1 + 40), "workerName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v5;
      v20 = 2114;
      v21 = v6;
      v22 = 2114;
      v23 = v7;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Resource %{public}@ (locally available: %{public}@) is no longer valid for worker %{public}@", buf, 0x20u);

    }
  }
  else
  {
    if (v4)
    {
      v8 = *(void **)(a1 + 48);
      v9 = *(const __CFString **)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Availability worker: unable to make recipe: %{public}@ available for asset uuid: %{public}@, lowering availability...", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setLocalAvailability:", 4294934528);
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D74498];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Resource was not made available"), *MEMORY[0x1E0CB2938]);
    v3 = objc_claimAutoreleasedReturnValue();
    v17 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 47001, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

void __84__PLBackgroundJobResourceAvailabilityWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v3, OS_SIGNPOST_INTERVAL_END, v4, "backgroundResourceAvailabilityWorkItem", ", v5, 2u);
  }

}

void __81__PLBackgroundJobResourceAvailabilityWorker_workItemsNeedingProcessingInLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLManagedAsset predicateToFetchResourcesAwaitingLocalAvailabilityChange](PLManagedAsset, "predicateToFetchResourcesAwaitingLocalAvailabilityChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setResultType:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("recipeID"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v18[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v8);

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v4, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  if (v10)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = v10;
    v14 = *(NSObject **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v13;
  }
  else
  {
    PLBackgroundJobServiceGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to fetch deferredProcessingNeeded assets: %@", buf, 0xCu);
    }
  }

}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 != 3;
}

+ (BOOL)avoidCheckingOtherWorkersIfThisWorkerHasPendingWork
{
  return 1;
}

+ (BOOL)allowWorkerToRunDuringCPLInitialSync
{
  return 1;
}

@end
