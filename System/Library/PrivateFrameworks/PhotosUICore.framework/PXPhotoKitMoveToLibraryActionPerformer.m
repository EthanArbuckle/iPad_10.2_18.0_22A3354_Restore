@implementation PXPhotoKitMoveToLibraryActionPerformer

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return a3 != 0;
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
  v12[2] = __85__PXPhotoKitMoveToLibraryActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke;
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
  uint64_t v11;
  void *v12;
  PXActionManagerTapGestureRecognizer *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v7 = (PXActionManagerTapGestureRecognizer *)a3;
  objc_msgSend(a5, "selectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectedIndexPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "itemCount");

  if (v11)
  {
    PXLocalizedSharedLibraryAssetCountForUsage(v11, 0, 0, 15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PXActionManagerTapGestureRecognizer initWithTarget:action:]([PXActionManagerTapGestureRecognizer alloc], "initWithTarget:action:", v7, a4);

    PXPhotosBarsCreateSelectModeCaptionLabel();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(MEMORY[0x1E0DC1350], "labelFontSize");
    objc_msgSend(v15, "systemFontOfSize:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v16);

    objc_msgSend(v14, "setText:", v12);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v17);

    objc_msgSend(v14, "setUserInteractionEnabled:", 1);
    objc_msgSend(v14, "addGestureRecognizer:", v13);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v14);
    -[PXActionManagerTapGestureRecognizer setBarButtonItem:](v13, "setBarButtonItem:", v18);

    v7 = v13;
  }
  else
  {
    v19 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PXLocalizedStringFromTable(CFSTR("PXSelectItems"), CFSTR("PhotosUICore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v19, "initWithTitle:style:target:action:", v12, 0, v7, a4);
  }

  return v18;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_Action_MoveToLibrary"));
}

uint64_t __85__PXPhotoKitMoveToLibraryActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)shouldExitSelectModeForState:(unint64_t)a3
{
  return a3 == 20;
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint8_t buf[8];
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD aBlock[6];

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_Action_MoveToLibrary_Message"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_Action_MoveToPersonalLibrary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _PXSharedLibraryFetchAssetsFromAssets(v5, 0, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v6;
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    PXLocalizedSharedLibraryAssetCountForUsage(v7, 0, 0, 16);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_Action_MoveToSharedLibrary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _PXSharedLibraryFetchAssetsFromAssets(v10, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  if (v12)
  {
    PXLocalizedSharedLibraryAssetCountForUsage(v12, 0, 0, 17);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke;
  aBlock[3] = &unk_1E5118738;
  aBlock[4] = self;
  v15 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v3, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0DC3448];
  v33[0] = v14;
  v33[1] = 3221225472;
  v33[2] = __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_2;
  v33[3] = &unk_1E5138AE0;
  v33[4] = self;
  v18 = v15;
  v34 = v18;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v4, 0, v33);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v19);

  v20 = (void *)MEMORY[0x1E0DC3448];
  v31[0] = v14;
  v31[1] = 3221225472;
  v31[2] = __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_4;
  v31[3] = &unk_1E5138AE0;
  v31[4] = self;
  v21 = v18;
  v32 = v21;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v9, 0, v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v22);

  v23 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v14;
  v30[1] = 3221225472;
  v30[2] = __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_6;
  v30[3] = &unk_1E5144530;
  v30[4] = self;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 1, v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v25);

  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v16))
  {
    PLUIGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_ERROR, "Failed to present move to library action dialog", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present move to library dialog."));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v27);

  }
}

id __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "assets");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPhotoKitAssetsDataSource dataSourceWithAssets:](PXPhotoKitAssetsDataSource, "dataSourceWithAssets:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(v2, "numberOfItemsInSection:", 0));
  objc_msgSend(off_1E50B3180, "indexPathSetWithItemIndexes:dataSourceIdentifier:section:", v3, objc_msgSend(v2, "identifier"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4A80), "initWithDataSource:selectedIndexPaths:", v2, v4);

  return v5;
}

void __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "createPerformerWithClass:actionType:", objc_opt_class(), CFSTR("PXAssetActionTypeMoveToPersonalLibrary"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSelectionSnapshot:", v3);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDelegate:", v4);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_3;
    v7[3] = &unk_1E5148B78;
    v7[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v2, "performActionWithCompletionHandler:", v7);
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Move to Personal Library failed."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "completeUserInteractionTaskWithSuccess:error:", 0, v6);

  }
}

void __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "createPerformerWithClass:actionType:", objc_opt_class(), CFSTR("PXAssetActionTypeMoveToSharedLibrary"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSelectionSnapshot:", v3);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDelegate:", v4);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_5;
    v7[3] = &unk_1E5148B78;
    v7[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v2, "performActionWithCompletionHandler:", v7);
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Move to Shared Library failed."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "completeUserInteractionTaskWithSuccess:error:", 0, v6);

  }
}

void __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_6(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Move to Library canceled."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "completeUserInteractionTaskWithSuccess:error:", 0, v2);

}

uint64_t __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, a3);
}

uint64_t __68__PXPhotoKitMoveToLibraryActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, a3);
}

@end
