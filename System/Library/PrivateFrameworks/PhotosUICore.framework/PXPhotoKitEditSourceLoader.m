@implementation PXPhotoKitEditSourceLoader

- (PXPhotoKitEditSourceLoader)initWithAsset:(id)a3
{
  id v5;
  PXPhotoKitEditSourceLoader *v6;
  PXPhotoKitEditSourceLoader *v7;
  uint64_t v8;
  NSProgress *progress;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *loadingQueue;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXPhotoKitEditSourceLoader;
  v6 = -[PXPhotoKitEditSourceLoader init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    progress = v7->_progress;
    v7->_progress = (NSProgress *)v8;

    objc_initWeak(&location, v7);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __44__PXPhotoKitEditSourceLoader_initWithAsset___block_invoke;
    v14[3] = &unk_1E5148D30;
    objc_copyWeak(&v15, &location);
    -[NSProgress setCancellationHandler:](v7->_progress, "setCancellationHandler:", v14);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.PXEditSourceLoader", v10);
    loadingQueue = v7->_loadingQueue;
    v7->_loadingQueue = (OS_dispatch_queue *)v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (NSString)contentIdentifier
{
  void *v2;
  void *v3;

  -[PXPhotoKitEditSourceLoader asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)beginLoading
{
  void *v3;
  NSDate *v4;
  NSDate *mainQueue_loadingStartDate;
  NSObject *loadingQueue;
  _QWORD v7[5];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 50);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSProgress px_appendChild:withPendingUnitCount:](self->_progress, "px_appendChild:withPendingUnitCount:", v3, 50);
  objc_storeStrong((id *)&self->_editSourceCreationProgress, v3);
  if (!self->_mainQueue_loadingStartDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    mainQueue_loadingStartDate = self->_mainQueue_loadingStartDate;
    self->_mainQueue_loadingStartDate = v4;

    loadingQueue = self->_loadingQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__PXPhotoKitEditSourceLoader_beginLoading__block_invoke;
    v7[3] = &unk_1E5148D08;
    v7[4] = self;
    v8 = v3;
    dispatch_async(loadingQueue, v7);

  }
}

- (void)_handleCancellation
{
  uint64_t v3;
  NSObject *loadingQueue;
  _QWORD block[4];
  id v6[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v6[1] = (id)MEMORY[0x1E0C809B0];
  v6[2] = (id)3221225472;
  v6[3] = __49__PXPhotoKitEditSourceLoader__handleCancellation__block_invoke;
  v6[4] = &unk_1E5148D30;
  objc_copyWeak(&v7, &location);
  px_dispatch_on_main_queue();
  loadingQueue = self->_loadingQueue;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __49__PXPhotoKitEditSourceLoader__handleCancellation__block_invoke_2;
  block[3] = &unk_1E5148D30;
  objc_copyWeak(v6, &location);
  dispatch_async(loadingQueue, block);
  objc_destroyWeak(v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_resetProgress
{
  NSProgress *v3;
  NSProgress *progress;
  _QWORD v5[4];
  id v6;
  id location;

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 0);
  v3 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  progress = self->_progress;
  self->_progress = v3;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PXPhotoKitEditSourceLoader__resetProgress__block_invoke;
  v5[3] = &unk_1E5148D30;
  objc_copyWeak(&v6, &location);
  -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_cancelContentInputRequest
{
  id v3;

  -[PXPhotoKitEditSourceLoader asset](self, "asset");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelContentEditingInputRequest:", self->_loadingQueue_imageRequestID);

}

- (void)_handleContentEditingInputRequestCompletion:(id)a3 info:(id)a4 asset:(id)a5
{
  id v8;
  id v9;
  NSObject *loadingQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;

  v8 = a3;
  v9 = a4;
  loadingQueue = self->_loadingQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__PXPhotoKitEditSourceLoader__handleContentEditingInputRequestCompletion_info_asset___block_invoke;
  v13[3] = &unk_1E5146098;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a2;
  v11 = v9;
  v12 = v8;
  dispatch_async(loadingQueue, v13);

}

- (void)_mainQueue_handleEditSource:(id)a3 compositionController:(id)a4 originalCompositionController:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSNumber *v17;
  NSNumber *loadDuration;
  NSObject *v19;
  PLEditSource *editSource;
  PICompositionController *compositionController;
  int v22;
  PLEditSource *v23;
  __int16 v24;
  PICompositionController *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_storeStrong((id *)&self->_editSource, a3);
  objc_storeStrong((id *)&self->_compositionController, a4);
  objc_storeStrong((id *)&self->_originalCompositionController, a5);
  -[NSProgress setCompletedUnitCount:](self->_editSourceCreationProgress, "setCompletedUnitCount:", -[NSProgress totalUnitCount](self->_editSourceCreationProgress, "totalUnitCount"));
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceDate:", self->_mainQueue_loadingStartDate);
  objc_msgSend(v15, "numberWithDouble:");
  v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  loadDuration = self->_loadDuration;
  self->_loadDuration = v17;

  objc_storeStrong((id *)&self->_error, a6);
  PLUIGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    editSource = self->_editSource;
    compositionController = self->_compositionController;
    v22 = 138412546;
    v23 = editSource;
    v24 = 2112;
    v25 = compositionController;
    _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEFAULT, "_handleContentEditingInputRequestCompletion - editSource: %@\ncomposition:%@", (uint8_t *)&v22, 0x16u);
  }

}

- (PLEditSource)editSource
{
  return self->_editSource;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (PICompositionController)originalCompositionController
{
  return self->_originalCompositionController;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)baseVersion
{
  return self->_baseVersion;
}

- (NSNumber)loadDuration
{
  return self->_loadDuration;
}

- (NSString)livePhotoPairingIdentifier
{
  return self->_livePhotoPairingIdentifier;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_livePhotoPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_loadDuration, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_originalCompositionController, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_storeStrong((id *)&self->_editSourceCreationProgress, 0);
  objc_storeStrong((id *)&self->_mainQueue_loadingStartDate, 0);
}

void __85__PXPhotoKitEditSourceLoader__handleContentEditingInputRequestCompletion_info_asset___block_invoke(id *a1)
{
  void (**v2)(void *, id);
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id location;
  id v21;
  id v22;
  id v23;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PXPhotoKitEditSourceLoader__handleContentEditingInputRequestCompletion_info_asset___block_invoke_2;
  aBlock[3] = &unk_1E5148600;
  aBlock[4] = a1[4];
  v2 = (void (**)(void *, id))_Block_copy(aBlock);
  objc_msgSend(a1[5], "fullSizeImageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = a1[5];
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0D7CB38], "editSourceForContentEditingInput:useEmbeddedPreview:error:", v4, 0, &v23);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v23;
    if (v5)
    {
      v7 = a1[5];
      v22 = 0;
      objc_msgSend(MEMORY[0x1E0D7CB38], "compositionControllerForContentEditingInput:asShot:source:error:", v7, 0, v5, &v22);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v22;
      if (v8)
      {
        v10 = a1[5];
        v21 = 0;
        objc_msgSend(MEMORY[0x1E0D7CB38], "compositionControllerForContentEditingInput:asShot:source:error:", v10, 1, v5, &v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v21;
        if (v11)
        {
          objc_initWeak(&location, a1[4]);
          objc_copyWeak(&v19, &location);
          v16 = v5;
          v17 = v8;
          v18 = v11;
          px_dispatch_on_main_queue();

          objc_destroyWeak(&v19);
          objc_destroyWeak(&location);
        }
        else
        {
          v2[2](v2, v12);
        }

      }
      else
      {
        v2[2](v2, v9);
      }

    }
    else
    {
      v2[2](v2, v6);
    }
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Failed to load image URL."), *MEMORY[0x1E0CB2D50]);
    v13 = *MEMORY[0x1E0CD1BE8];
    objc_msgSend(a1[6], "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(a1[6], "objectForKeyedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CB3388]);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PXEditSourceLoaderErrorDomain"), 0, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2[2](v2, v5);
  }

}

void __85__PXPhotoKitEditSourceLoader__handleContentEditingInputRequestCompletion_info_asset___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_copyWeak(&v5, &location);
  v4 = v3;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

void __85__PXPhotoKitEditSourceLoader__handleContentEditingInputRequestCompletion_info_asset___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_mainQueue_handleEditSource:compositionController:originalCompositionController:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

}

void __85__PXPhotoKitEditSourceLoader__handleContentEditingInputRequestCompletion_info_asset___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_mainQueue_handleEditSource:compositionController:originalCompositionController:error:", 0, 0, 0, *(_QWORD *)(a1 + 32));

}

void __44__PXPhotoKitEditSourceLoader__resetProgress__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleCancellation");

}

void __49__PXPhotoKitEditSourceLoader__handleCancellation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetProgress");

}

void __49__PXPhotoKitEditSourceLoader__handleCancellation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cancelContentInputRequest");

}

void __42__PXPhotoKitEditSourceLoader_beginLoading__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CD1500]);
  objc_msgSend(v3, "setForceReturnFullLivePhoto:", 1);
  objc_msgSend(v3, "setDontAllowRAW:", 1);
  objc_msgSend(v3, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v3, "setCanHandleAdjustmentData:", &__block_literal_global_54146);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__PXPhotoKitEditSourceLoader_beginLoading__block_invoke_3;
  v9[3] = &unk_1E511E0E0;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v3, "setProgressHandler:", v9);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __42__PXPhotoKitEditSourceLoader_beginLoading__block_invoke_243;
  v6[3] = &unk_1E511E108;
  objc_copyWeak(&v8, &location);
  v5 = v2;
  v7 = v5;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(v5, "requestContentEditingInputWithOptions:completionHandler:", v3, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __42__PXPhotoKitEditSourceLoader_beginLoading__block_invoke_3(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  px_dispatch_on_main_queue();

}

void __42__PXPhotoKitEditSourceLoader_beginLoading__block_invoke_243(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "PXPhotoKitEditSourceLoader content complete: %@", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleContentEditingInputRequestCompletion:info:asset:", v6, v5, *(_QWORD *)(a1 + 32));

}

void __42__PXPhotoKitEditSourceLoader_beginLoading__block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", (uint64_t)(*(double *)(a1 + 40) * (double)objc_msgSend(*(id *)(a1 + 32), "totalUnitCount")) - 1);
  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "PXPhotoKitEditSourceLoader download progress: %f", (uint8_t *)&v4, 0xCu);
  }

}

BOOL __42__PXPhotoKitEditSourceLoader_beginLoading__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v2 = (objc_class *)MEMORY[0x1E0D71988];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  objc_msgSend(v4, "loadCompositionFrom:formatIdentifier:formatVersion:sidecarData:error:", v5, v6, v7, 0, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

void __44__PXPhotoKitEditSourceLoader_initWithAsset___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleCancellation");

}

@end
