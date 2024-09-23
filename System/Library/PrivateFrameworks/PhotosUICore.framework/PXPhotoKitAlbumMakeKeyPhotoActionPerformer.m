@implementation PXPhotoKitAlbumMakeKeyPhotoActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  void *v8;
  BOOL v9;
  BOOL v11;

  if (!a3)
    return 0;
  objc_msgSend(a4, "px_fetchAncestorThatSupportsCustomKeyAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    v9 = 1;
  else
    v9 = v8 == 0;
  v11 = !v9 && a6 == 0;

  return v11;
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
  v12[2] = __89__PXPhotoKitAlbumMakeKeyPhotoActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke;
  v12[3] = &unk_1E513A608;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", a3, a4, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotoKitAssetActionManagerActionTitle_AlbumMakeKeyPhoto"), CFSTR("PhotosUICore"));
}

uint64_t __89__PXPhotoKitAlbumMakeKeyPhotoActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performBackgroundTask
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PXMakeKeyAssetAction *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  -[PXPhotoKitAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "px_fetchAncestorThatSupportsCustomKeyAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v7)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAlbumMakeKeyPhotoActionPerformer.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("editableAssetCollection"));

    if (v10)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAlbumMakeKeyPhotoActionPerformer.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAlbumMakeKeyPhotoActionPerformer.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollection"));

  if (!v7)
    goto LABEL_6;
LABEL_3:
  if (!v10)
    goto LABEL_7;
LABEL_4:
  v11 = -[PXMakeKeyAssetAction initWithAssetCollection:keyAsset:]([PXMakeKeyAssetAction alloc], "initWithAssetCollection:keyAsset:", v7, v10);
  -[PXActionPerformer undoManager](self, "undoManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__PXPhotoKitAlbumMakeKeyPhotoActionPerformer_performBackgroundTask__block_invoke;
  v16[3] = &unk_1E5148B78;
  v16[4] = self;
  -[PXAction executeWithUndoManager:completionHandler:](v11, "executeWithUndoManager:completionHandler:", v12, v16);

}

uint64_t __67__PXPhotoKitAlbumMakeKeyPhotoActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, a3);
}

@end
