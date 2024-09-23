@implementation PXPhotoKitRemoveAssetActionPerformer

- (id)actionType
{
  __CFString *v2;

  v2 = CFSTR("PXAssetActionTypeRemove");
  return CFSTR("PXAssetActionTypeRemove");
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  _QWORD v9[4];
  id v10;
  PXPhotoKitRemoveAssetActionPerformer *v11;

  if (-[PXPhotoKitAssetActionPerformer shouldSkipUserConfirmation](self, "shouldSkipUserConfirmation"))
  {
    -[PXPhotoKitRemoveAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }
  else
  {
    -[PXPhotoKitAssetActionPerformer assets](self, "assets");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__PXPhotoKitRemoveAssetActionPerformer_performUserInteractionTask__block_invoke;
    v9[3] = &unk_1E5142AB0;
    v10 = v3;
    v11 = self;
    v5 = v3;
    objc_msgSend(v4, "presentAlertWithConfigurationHandler:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      PLUIGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Failed to present remove confirmation. User must confirm to perform removal.", v8, 2u);
      }

      -[PXPhotoKitRemoveAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
    }

  }
}

- (void)performBackgroundTask
{
  PXRemoveAssetsFromAssetCollectionAction *v3;
  void *v4;
  PXRemoveAssetsFromAssetCollectionAction *v5;
  void *v6;
  _QWORD v7[5];

  -[PXPhotoKitAssetActionPerformer instantlyExcludeAssetsFromDataSource](self, "instantlyExcludeAssetsFromDataSource");
  v3 = [PXRemoveAssetsFromAssetCollectionAction alloc];
  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXAssetsSelectionAction initWithSelectionSnapshot:](v3, "initWithSelectionSnapshot:", v4);

  -[PXActionPerformer undoManager](self, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__PXPhotoKitRemoveAssetActionPerformer_performBackgroundTask__block_invoke;
  v7[3] = &unk_1E5148B78;
  v7[4] = self;
  -[PXAction executeWithUndoManager:completionHandler:](v5, "executeWithUndoManager:completionHandler:", v6, v7);

}

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a3;
  v6 = a4;
  if (-[PXActionPerformer state](self, "state") == 10)
  {
    v7.receiver = self;
    v7.super_class = (Class)PXPhotoKitRemoveAssetActionPerformer;
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](&v7, sel_completeUserInteractionTaskWithSuccess_error_, v4, v6);
  }

}

void __61__PXPhotoKitRemoveAssetActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  char v9;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PXPhotoKitRemoveAssetActionPerformer_performBackgroundTask__block_invoke_2;
  block[3] = &unk_1E51473C0;
  v9 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __61__PXPhotoKitRemoveAssetActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1)
{
  _BOOL8 v2;

  if (*(_BYTE *)(a1 + 48))
  {
    v2 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "stopExcludingAssetsFromDataSource");
    v2 = *(_BYTE *)(a1 + 48) != 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", v2, *(_QWORD *)(a1 + 40));
}

void __66__PXPhotoKitRemoveAssetActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = a2;
  PLLocalizedStringForAction();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);
  objc_msgSend(v3, "setStyle:", 0);
  PXLocalizedStringFromTable(CFSTR("PXPhotoKitRemoveAssetActionPerformer_CancelButtonTitle"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__PXPhotoKitRemoveAssetActionPerformer_performUserInteractionTask__block_invoke_2;
  v9[3] = &unk_1E5149198;
  v9[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "addActionWithTitle:style:action:", v5, 1, v9);
  PXLocalizedStringFromTable(CFSTR("PXPhotoKitRemoveAssetActionPerformer_RemoveButtonTitle"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __66__PXPhotoKitRemoveAssetActionPerformer_performUserInteractionTask__block_invoke_3;
  v8[3] = &unk_1E5149198;
  v8[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "addActionWithTitle:style:action:", v7, 0, v8);

}

uint64_t __66__PXPhotoKitRemoveAssetActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

uint64_t __66__PXPhotoKitRemoveAssetActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return objc_msgSend(a4, "canPerformEditOperation:", 2);
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  if (a3 > 2)
    v5 = 0;
  else
    v5 = off_1E5124918[a3];
  v6 = v5;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PXPhotoKitAssetActionManager%@Title_Remove"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedStringFromTable(v7, CFSTR("PhotosUICore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("trash");
}

@end
