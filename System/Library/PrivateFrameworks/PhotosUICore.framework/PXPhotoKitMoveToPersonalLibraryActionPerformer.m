@implementation PXPhotoKitMoveToPersonalLibraryActionPerformer

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isAnyItemSelected"))
  {
    objc_msgSend(v8, "allItemsEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PXSharedLibraryFetchAnySharedAssetFromAssets(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "photoLibrary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "exiting");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = 0;
      }
      else
      {
        v18.receiver = a1;
        v18.super_class = (Class)&OBJC_METACLASS___PXPhotoKitMoveToPersonalLibraryActionPerformer;
        v16 = objc_msgSendSuper2(&v18, sel_canPerformWithSelectionSnapshot_person_socialGroup_, v8, v9, v10);
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t CanMoveAssetsToPersonalLibrary;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(a4, "px_allowsMoveToPersonalLibrary"))
  {
    objc_msgSend(v7, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "exiting");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      LOBYTE(CanMoveAssetsToPersonalLibrary) = 0;
    }
    else
    {
      v14[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CanMoveAssetsToPersonalLibrary = PXSharedLibraryCanMoveAssetsToPersonalLibrary(v12);

    }
  }
  else
  {
    LOBYTE(CanMoveAssetsToPersonalLibrary) = 0;
  }

  return CanMoveAssetsToPersonalLibrary;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0DC3428];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __93__PXPhotoKitMoveToPersonalLibraryActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke;
  v12[3] = &unk_1E513A608;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", a3, a4, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

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
  _PXSharedLibraryFetchAssetsFromAssets(v10, 0, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  if (v12)
  {
    PXLocalizedSharedLibraryAssetCountForUsage(v12, 0, 0, 16);
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
  return PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_Action_MoveToPersonalLibrary"));
}

+ (id)systemImageNameForActionManager:(id)a3
{
  __CFString *v3;

  v3 = CFSTR("person");
  return CFSTR("person");
}

uint64_t __93__PXPhotoKitMoveToPersonalLibraryActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)shouldExitSelectModeForState:(unint64_t)a3
{
  return a3 == 20;
}

- (BOOL)shouldShowConfirmation
{
  return 1;
}

- (id)_multiContributorConfirmationAlertControllerForAssets:(id)a3 contributorName:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  v9 = &stru_1E5149688;
  if (v8 > 1)
    v9 = CFSTR("S");
  v10 = v9;
  v11 = objc_msgSend(v7, "length");
  v12 = objc_msgSend(v6, "count");
  if (v11)
  {
    v33 = 0;
    v31 = 0;
    v32 = 0;
    +[PXPhotoKitDeletePhotosActionController assetTypeCountsForAssets:photosCount:videosCount:othersCount:](PXPhotoKitDeletePhotosActionController, "assetTypeCountsForAssets:photosCount:videosCount:othersCount:", v6, &v33, &v32, &v31);
    if (v33 == v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_For_Contributor_%%@_Photo%@"), v10, v10);
    }
    else if (v32 == v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_For_Contributor_%%@_Video%@"), v10, v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_For_Contributor_%%@_Item%@"), v10, v10);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedSharedLibraryString(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v7;
    PXLocalizedStringWithValidatedFormat(v14, CFSTR("%@"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = 0;
    v31 = 0;
    v32 = 0;
    +[PXPhotoKitDeletePhotosActionController assetTypeCountsForAssets:photosCount:videosCount:othersCount:](PXPhotoKitDeletePhotosActionController, "assetTypeCountsForAssets:photosCount:videosCount:othersCount:", v6, &v33, &v32, &v31);
    if (v33 == v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_Photo%@"), v10, v10);
    }
    else if (v32 == v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_Video%@"), v10, v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXSharedLibrary_MoveToPersonalLibrary_MC_ConfirmationMessage_Item%@"), v10, v10);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedSharedLibraryString(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v15, 0, v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_Action_MoveToPersonalLibrary"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __120__PXPhotoKitMoveToPersonalLibraryActionPerformer__multiContributorConfirmationAlertControllerForAssets_contributorName___block_invoke;
  v29[3] = &unk_1E51458F8;
  v29[4] = self;
  v30 = v6;
  v20 = v6;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, v29);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v21);

  v22 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __120__PXPhotoKitMoveToPersonalLibraryActionPerformer__multiContributorConfirmationAlertControllerForAssets_contributorName___block_invoke_2;
  v28[3] = &unk_1E5144530;
  v28[4] = self;
  objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 1, v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v24);

  return v16;
}

- (void)performUserInteractionTask
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint8_t buf[8];
  _QWORD v24[5];
  _QWORD v25[4];
  void (**v26)(_QWORD);
  id v27;
  _QWORD aBlock[4];
  id v29;
  PXPhotoKitMoveToPersonalLibraryActionPerformer *v30;
  SEL v31;

  -[PXPhotoKitAssetActionPerformer assetsFetchResult](self, "assetsFetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _PXSharedLibraryFetchAssetsFromAssets(v4, 0, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke;
  aBlock[3] = &unk_1E5145560;
  v7 = v5;
  v30 = self;
  v31 = a2;
  v29 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PXPhotoKitAssetActionPerformer assetsFetchResult](self, "assetsFetchResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXPhotoKitMoveToPersonalLibraryActionPerformer shouldShowConfirmation](self, "shouldShowConfirmation")
    && PXSharedLibraryShouldDisplayMoveToPersonalLibraryConfirmation(objc_msgSend(v11, "hasPreview")))
  {
    v22 = v4;
    v27 = 0;
    PXSharedLibraryGetMoveToPersonalLibraryConfirmationTitleAndMessage(v7, 0, &v27);
    v12 = v27;
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_Action_MoveToPersonalLibrary"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v6;
    v25[1] = 3221225472;
    v25[2] = __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke_188;
    v25[3] = &unk_1E5142658;
    v26 = v8;
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v16);

    v17 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke_2_189;
    v24[3] = &unk_1E5144530;
    v24[4] = self;
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v19);

    if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v13))
    {
      PLUIGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "Failed to present first time move confirmation. User must confirm to perform move.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present confirmation dialog."));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v21);

    }
    v4 = v22;
  }
  else
  {
    v8[2](v8);
  }

}

- (void)performBackgroundTask
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __71__PXPhotoKitMoveToPersonalLibraryActionPerformer_performBackgroundTask__block_invoke;
  v2[3] = &unk_1E5148B78;
  v2[4] = self;
  -[PXPhotoKitMoveToPersonalLibraryActionPerformer _moveAssetsToPersonalLibraryWithCompletionHandler:](self, "_moveAssetsToPersonalLibraryWithCompletionHandler:", v2);
}

- (BOOL)canPresentAlertInBackgroudState
{
  return 1;
}

- (void)_moveAssetsToPersonalLibraryWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  PXMoveAssetsToPersonalLibraryAction *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  PXPhotoKitMoveToPersonalLibraryActionPerformer *v19;
  id v20;
  uint8_t buf[16];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitMoveToPersonalLibraryActionPerformer.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[PXPhotoKitMoveToPersonalLibraryActionPerformer assetsToMove](self, "assetsToMove");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitMoveToPersonalLibraryActionPerformer.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetsToMove.count"));

  }
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryMoveToPersonalLibraryToastTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedAssetCountForUsage(objc_msgSend(v6, "count"), 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "createIndeterminateProgressToastForActionPerformer:title:description:", self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "willStartProgress");
  PLUIGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_INFO, "Attempting to move assets to personal library. Calling PXSharedLibraryMoveAssetsToPersonalLibrary()", buf, 2u);
  }

  v11 = -[PXAssetsAction initWithAssets:]([PXMoveAssetsToPersonalLibraryAction alloc], "initWithAssets:", v6);
  -[PXActionPerformer undoManager](self, "undoManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __100__PXPhotoKitMoveToPersonalLibraryActionPerformer__moveAssetsToPersonalLibraryWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E5146918;
  v19 = self;
  v20 = v5;
  v18 = v9;
  v13 = v5;
  v14 = v9;
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
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryMoveToPersonalLibraryFailureAlertTitle"));
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
  v16[2] = __93__PXPhotoKitMoveToPersonalLibraryActionPerformer__presentFailureWithError_completionHandler___block_invoke;
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

- (PXFastEnumeration)assetsToMove
{
  return self->_assetsToMove;
}

- (void)setAssetsToMove:(id)a3
{
  objc_storeStrong((id *)&self->_assetsToMove, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsToMove, 0);
}

uint64_t __93__PXPhotoKitMoveToPersonalLibraryActionPerformer__presentFailureWithError_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, *(_QWORD *)(a1 + 40));
}

void __100__PXPhotoKitMoveToPersonalLibraryActionPerformer__moveAssetsToPersonalLibraryWithCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
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

uint64_t __71__PXPhotoKitMoveToPersonalLibraryActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, a3);
}

void __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  objc_class *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  objc_class *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  _QWORD v43[5];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[16];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  _PXSharedLibraryFetchAssetsFromAssets(*(void **)(a1 + 32), 1, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v3 == objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = *(_QWORD *)(a1 + 40);
      v37 = *(_QWORD *)(a1 + 48);
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_descriptionForAssertionMessage");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", v37, v38, CFSTR("PXPhotoKitMoveToPersonalLibraryActionPerformer.m"), 177, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("myAssets.firstObject"), v36, v40);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = *(_QWORD *)(a1 + 40);
      v33 = *(_QWORD *)(a1 + 48);
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", v33, v34, CFSTR("PXPhotoKitMoveToPersonalLibraryActionPerformer.m"), 177, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("myAssets.firstObject"), v36);
    }

LABEL_4:
    objc_msgSend(v4, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD17A8], "fetchContributorsForAssets:options:", v2, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v7, "fetchedObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v10, "count") < 3)
    {
      if (objc_msgSend(v10, "count") != 2)
      {
        objc_msgSend(*(id *)(a1 + 40), "setAssetsToMove:", *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 40), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
LABEL_33:

        goto LABEL_34;
      }
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v25 = v10;
      v11 = (void *)objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v11)
      {
        v41 = v7;
        v26 = *(_QWORD *)v46;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v46 != v26)
              objc_enumerationMutation(v25);
            v28 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
            if ((objc_msgSend(v28, "isCurrentUser") & 1) == 0)
            {
              PXSharedLibraryShortNameForParticipant(v28);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_26;
            }
          }
          v11 = (void *)objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          if (v11)
            continue;
          break;
        }
LABEL_26:
        v7 = v41;
      }

      objc_msgSend(*(id *)(a1 + 40), "_multiContributorConfirmationAlertControllerForAssets:contributorName:", v2, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(*(id *)(a1 + 40), "presentViewController:", v14) & 1) == 0)
      {
        PLUIGetLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_ERROR, "Failed to present 'move' dialog.", buf, 2u);
        }

        v30 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present 'move' dialog."));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "completeUserInteractionTaskWithSuccess:error:", 0, v31);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_multiContributorConfirmationAlertControllerForAssets:contributorName:", v2, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(*(id *)(a1 + 40), "presentViewController:", v11) & 1) != 0)
      {
LABEL_32:

        goto LABEL_33;
      }
      PLUIGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Failed to present 'move' dialog.", buf, 2u);
      }

      v13 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present 'move' dialog."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "completeUserInteractionTaskWithSuccess:error:", 0, v14);
    }

    goto LABEL_32;
  }
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_MoveSomeUnownedToPersonalLibraryConfirmationMessage_Message"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_MoveMineToPersonalLibrary_Button_Title"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke_184;
  v43[3] = &unk_1E51458F8;
  v43[4] = *(_QWORD *)(a1 + 40);
  v44 = v2;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v43);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v18);

  v19 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v17;
  v42[1] = 3221225472;
  v42[2] = __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke_2;
  v42[3] = &unk_1E5144530;
  v42[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 1, v42);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v21);

  if ((objc_msgSend(*(id *)(a1 + 40), "presentViewController:", v6) & 1) == 0)
  {
    PLUIGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_ERROR, "Failed to present 'move mine only' dialog.", buf, 2u);
    }

    v23 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present 'move mine only' dialog."));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "completeUserInteractionTaskWithSuccess:error:", 0, v24);

  }
LABEL_34:

}

uint64_t __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke_188(uint64_t a1)
{
  PXSharedLibrarySetDidConfirmMoveToPersonalLibrary(1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke_2_189(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Move to Personal Library canceled."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "completeUserInteractionTaskWithSuccess:error:", 0, v2);

}

uint64_t __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke_184(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAssetsToMove:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

void __76__PXPhotoKitMoveToPersonalLibraryActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Move to Personal Library canceled."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "completeUserInteractionTaskWithSuccess:error:", 0, v2);

}

uint64_t __120__PXPhotoKitMoveToPersonalLibraryActionPerformer__multiContributorConfirmationAlertControllerForAssets_contributorName___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAssetsToMove:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

void __120__PXPhotoKitMoveToPersonalLibraryActionPerformer__multiContributorConfirmationAlertControllerForAssets_contributorName___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Move to Personal Library canceled."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "completeUserInteractionTaskWithSuccess:error:", 0, v2);

}

@end
