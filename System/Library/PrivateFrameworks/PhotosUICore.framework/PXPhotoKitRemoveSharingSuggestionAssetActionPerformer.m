@implementation PXPhotoKitRemoveSharingSuggestionAssetActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v6;
  char v7;

  v6 = a4;
  if ((objc_msgSend(v6, "px_isSharedLibrarySharingSuggestionsSmartAlbum") & 1) != 0)
    v7 = 1;
  else
    v7 = objc_msgSend(v6, "px_isSharedLibrarySharingSuggestion");

  return v7;
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
  v12[2] = __100__PXPhotoKitRemoveSharingSuggestionAssetActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke;
  v12[3] = &unk_1E513A608;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", a3, a4, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributes:", 2);

  return v10;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_Action_RemoveFromSharedLibrarySuggestions"));
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("minus.circle");
}

uint64_t __100__PXPhotoKitRemoveSharingSuggestionAssetActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)shouldPreventTargetedDismissalAnimation
{
  return 1;
}

- (void)performBackgroundTask
{
  NSObject *v3;
  PXRemoveLibrarySharingSuggestionAction *v4;
  void *v5;
  PXRemoveLibrarySharingSuggestionAction *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  PLUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_INFO, "Attempting remove sharing suggestions. Calling PXRemoveLibrarySharingSuggestionAction", buf, 2u);
  }

  v4 = [PXRemoveLibrarySharingSuggestionAction alloc];
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXAssetsAction initWithAssets:](v4, "initWithAssets:", v5);

  -[PXActionPerformer undoManager](self, "undoManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__PXPhotoKitRemoveSharingSuggestionAssetActionPerformer_performBackgroundTask__block_invoke;
  v8[3] = &unk_1E5148B78;
  v8[4] = self;
  -[PXAction executeWithUndoManager:completionHandler:](v6, "executeWithUndoManager:completionHandler:", v7, v8);

}

- (id)actionType
{
  __CFString *v2;

  v2 = CFSTR("PXAssetActionTypeRemoveSharingSuggestion");
  return CFSTR("PXAssetActionTypeRemoveSharingSuggestion");
}

uint64_t __78__PXPhotoKitRemoveSharingSuggestionAssetActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, a3);
}

@end
