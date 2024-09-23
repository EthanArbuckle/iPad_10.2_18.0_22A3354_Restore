@implementation PXPhotoKitMoveToSharedLibraryActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  if (+[PXSharingConfidentialityController confidentialityCheckRequired](PXSharingConfidentialityController, "confidentialityCheckRequired")&& (-[PXPhotoKitAssetActionPerformer assets](self, "assets"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v4 = +[PXSharingConfidentialityController confidentialWarningRequiredForAssets:](PXSharingConfidentialityController, "confidentialWarningRequiredForAssets:", v3), v3, v4))
  {
    v7[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__PXPhotoKitMoveToSharedLibraryActionPerformer_performUserInteractionTask__block_invoke;
    v8[3] = &unk_1E5144530;
    v8[4] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74__PXPhotoKitMoveToSharedLibraryActionPerformer_performUserInteractionTask__block_invoke_2;
    v7[3] = &unk_1E5144530;
    +[PXSharingConfidentialityController confidentialityAlertWithConfirmAction:abortAction:](PXSharingConfidentialityController, "confidentialityAlertWithConfirmAction:abortAction:", v8, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v5))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present confidentiality alert"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v6);

    }
  }
  else
  {
    -[PXPhotoKitMoveToSharedLibraryActionPerformer _performAdditionalUserInteractionTasks](self, "_performAdditionalUserInteractionTasks");
  }
}

- (void)performBackgroundTask
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __69__PXPhotoKitMoveToSharedLibraryActionPerformer_performBackgroundTask__block_invoke;
  v2[3] = &unk_1E5148B78;
  v2[4] = self;
  -[PXPhotoKitMoveToSharedLibraryActionPerformer _moveAssetsToSharedLibraryWithCompletionHandler:](self, "_moveAssetsToSharedLibraryWithCompletionHandler:", v2);
}

- (BOOL)canPresentAlertInBackgroudState
{
  return 1;
}

- (void)_checkMoveToSharedLibraryConfirmationForAssets:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint8_t v17[16];
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  id v21;

  v5 = a3;
  if (PXSharedLibraryShouldDisplayMoveToSharedLibraryConfirmation())
  {
    v21 = 0;
    PXSharedLibraryGetMoveToSharedLibraryConfirmationTitleAndMessage(v5, 0, &v21);
    v6 = v21;
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_Action_MoveToSharedLibrary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __95__PXPhotoKitMoveToSharedLibraryActionPerformer__checkMoveToSharedLibraryConfirmationForAssets___block_invoke;
    v19[3] = &unk_1E51458F8;
    v19[4] = self;
    v20 = v5;
    objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v11);

    v12 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __95__PXPhotoKitMoveToSharedLibraryActionPerformer__checkMoveToSharedLibraryConfirmationForAssets___block_invoke_2;
    v18[3] = &unk_1E5144530;
    v18[4] = self;
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v14);

    if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v7))
    {
      PLSharedLibraryGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Failed to present confirmation. User must confirm to perform move.", v17, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present confirmation dialog."));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v16);

    }
  }
  else
  {
    objc_storeStrong((id *)&self->_assetsToProcess, a3);
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }

}

- (void)_performAdditionalUserInteractionTasks
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__PXPhotoKitMoveToSharedLibraryActionPerformer__performAdditionalUserInteractionTasks__block_invoke;
  v5[3] = &unk_1E5142AD8;
  objc_copyWeak(&v6, &location);
  PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_moveAssetsToSharedLibraryWithCompletionHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSArray *v7;
  void *v8;
  void *v9;
  void *v10;
  PXMoveAssetsToSharedLibraryAction *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  PXPhotoKitMoveToSharedLibraryActionPerformer *v19;
  id v20;
  uint8_t buf[16];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitMoveToSharedLibraryActionPerformer.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  PLSharedLibraryGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to move assets to shared library. Calling PXSharedLibraryMoveAssetsToSharedLibrary()", buf, 2u);
  }

  v7 = self->_assetsToProcess;
  if (!-[NSArray count](v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitMoveToSharedLibraryActionPerformer.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assets.count"));

  }
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryMoveToSharedLibraryToastTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedAssetCountForUsage(-[NSArray count](v7, "count"), 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "createIndeterminateProgressToastForActionPerformer:title:description:", self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "willStartProgress");
  v11 = -[PXMoveAssetsToSharedLibraryAction initWithAssets:]([PXMoveAssetsToSharedLibraryAction alloc], "initWithAssets:", v7);
  -[PXActionPerformer undoManager](self, "undoManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __96__PXPhotoKitMoveToSharedLibraryActionPerformer__moveAssetsToSharedLibraryWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E5146918;
  v19 = self;
  v20 = v5;
  v18 = v10;
  v13 = v5;
  v14 = v10;
  -[PXAction executeWithUndoManager:completionHandler:](v11, "executeWithUndoManager:completionHandler:", v12, v17);

}

- (void)_presentFailureWithError:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[16];
  _QWORD v16[5];
  id v17;

  v5 = a3;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryMoveToSharedLibraryFailureAlertTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryGenericFailureAlertMessage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC3448];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__PXPhotoKitMoveToSharedLibraryActionPerformer__presentFailureWithError_completionHandler___block_invoke;
  v16[3] = &unk_1E51458F8;
  v16[4] = self;
  v11 = v5;
  v17 = v11;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v8, 0, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v12);

  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v9))
  {
    PLSharedLibraryGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Failed to present failure alert", v15, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Failed to present failure alert"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 0, v14);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsToProcess, 0);
}

uint64_t __91__PXPhotoKitMoveToSharedLibraryActionPerformer__presentFailureWithError_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", 0, *(_QWORD *)(a1 + 40));
}

void __96__PXPhotoKitMoveToSharedLibraryActionPerformer__moveAssetsToSharedLibraryWithCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "finishProgressMarkingAsComplete:", 0);
  if (a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 40), "_presentFailureWithError:completionHandler:", v6, *(_QWORD *)(a1 + 48));

}

void __86__PXPhotoKitMoveToSharedLibraryActionPerformer__performAdditionalUserInteractionTasks__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = objc_msgSend(v10, "count");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (v7)
    objc_msgSend(WeakRetained, "_checkMoveToSharedLibraryConfirmationForAssets:", v10);
  else
    objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", 0, v6);

}

uint64_t __95__PXPhotoKitMoveToSharedLibraryActionPerformer__checkMoveToSharedLibraryConfirmationForAssets___block_invoke(uint64_t a1)
{
  PXSharedLibrarySetDidConfirmMoveToSharedLibrary(1);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 192), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

void __95__PXPhotoKitMoveToSharedLibraryActionPerformer__checkMoveToSharedLibraryConfirmationForAssets___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Move to Shared Library canceled."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "completeUserInteractionTaskWithSuccess:error:", 0, v2);

}

uint64_t __69__PXPhotoKitMoveToSharedLibraryActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, a3);
}

uint64_t __74__PXPhotoKitMoveToSharedLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performAdditionalUserInteractionTasks");
}

void __74__PXPhotoKitMoveToSharedLibraryActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("User cancelled because of confidentiality alert"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "completeUserInteractionTaskWithSuccess:error:", 0, v2);

}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)_canPerformWithHasSharedLibraryOrPreview:(BOOL)a3 isExitingSharedLibrary:(BOOL)a4 collectionAllowsMoveToSharedLibrary:(BOOL)a5 isUnsavedSyndicatedAsset:(BOOL)a6 canMoveAssetsToSharedLibrary:(BOOL)a7
{
  BOOL v7;

  v7 = (a6 || a7) && a5;
  if (a4)
    v7 = 0;
  return a3 && v7;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t CanMoveAssetsToSharedLibrary;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "hasSharedLibraryOrPreview");
  objc_msgSend(v10, "exiting");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 != 0;

  v14 = objc_msgSend(v7, "px_allowsMoveToSharedLibrary");
  v15 = objc_msgSend(v8, "px_isUnsavedSyndicatedAsset");
  v19[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CanMoveAssetsToSharedLibrary = PXSharedLibraryCanMoveAssetsToSharedLibrary(v16);

  LOBYTE(v15) = +[PXPhotoKitMoveToSharedLibraryActionPerformer _canPerformWithHasSharedLibraryOrPreview:isExitingSharedLibrary:collectionAllowsMoveToSharedLibrary:isUnsavedSyndicatedAsset:canMoveAssetsToSharedLibrary:](PXPhotoKitMoveToSharedLibraryActionPerformer, "_canPerformWithHasSharedLibraryOrPreview:isExitingSharedLibrary:collectionAllowsMoveToSharedLibrary:isUnsavedSyndicatedAsset:canMoveAssetsToSharedLibrary:", v11, v13, v14, v15, CanMoveAssetsToSharedLibrary);
  return v15;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0DC3428];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__PXPhotoKitMoveToSharedLibraryActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke;
  v14[3] = &unk_1E513A608;
  v9 = v7;
  v15 = v9;
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", a3, a4, 0, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "hasPreview"))
    PXSharedLibraryUpdateActionTitleForPreview(v10);

  return v10;
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  PXActionManagerTapGestureRecognizer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  PXActionManagerTapGestureRecognizer *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v7 = (PXActionManagerTapGestureRecognizer *)a3;
  objc_msgSend(a5, "selectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allItemsEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _PXSharedLibraryFetchAssetsFromAssets(v10, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  if (v12)
  {
    PXLocalizedSharedLibraryAssetCountForUsage(v12, 0, 0, 17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PXActionManagerTapGestureRecognizer initWithTarget:action:]([PXActionManagerTapGestureRecognizer alloc], "initWithTarget:action:", v7, a4);

    PXPhotosBarsCreateSelectModeCaptionLabel();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(MEMORY[0x1E0DC1350], "labelFontSize");
    objc_msgSend(v16, "systemFontOfSize:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v17);

    objc_msgSend(v15, "setText:", v13);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v18);

    objc_msgSend(v15, "setUserInteractionEnabled:", 1);
    objc_msgSend(v15, "addGestureRecognizer:", v14);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v15);
    -[PXActionManagerTapGestureRecognizer setBarButtonItem:](v14, "setBarButtonItem:", v19);

    v7 = v14;
  }
  else
  {
    v20 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PXLocalizedStringFromTable(CFSTR("PXSelectItems"), CFSTR("PhotosUICore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v20, "initWithTitle:style:target:action:", v13, 0, v7, a4);
  }

  return v19;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_Action_MoveToSharedLibrary"));
}

+ (id)systemImageNameForActionManager:(id)a3
{
  __CFString *v3;

  v3 = CFSTR("person.2");
  return CFSTR("person.2");
}

uint64_t __91__PXPhotoKitMoveToSharedLibraryActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
