@implementation PXPhotoKitPersonMakeKeyPhotoActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  BOOL v6;

  if (a3)
    v6 = a5 == 0;
  else
    v6 = 1;
  return !v6;
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
  v12[2] = __90__PXPhotoKitPersonMakeKeyPhotoActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke;
  v12[3] = &unk_1E513A608;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", a3, a4, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedStringFromTable(CFSTR("PXPeopleMakeKeyPhoto"), CFSTR("PhotosUICore"));
}

uint64_t __90__PXPhotoKitPersonMakeKeyPhotoActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performBackgroundTask
{
  PXChangePersonKeyFaceAction *v3;
  void *v4;
  void *v5;
  void *v6;
  PXChangePersonKeyFaceAction *v7;
  void *v8;
  _QWORD v9[5];

  v3 = [PXChangePersonKeyFaceAction alloc];
  -[PXPhotoKitAssetActionPerformer person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXChangePersonKeyFaceAction initWithPerson:asset:](v3, "initWithPerson:asset:", v4, v6);

  -[PXActionPerformer undoManager](self, "undoManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__PXPhotoKitPersonMakeKeyPhotoActionPerformer_performBackgroundTask__block_invoke;
  v9[3] = &unk_1E5148B78;
  v9[4] = self;
  -[PXAction executeWithUndoManager:completionHandler:](v7, "executeWithUndoManager:completionHandler:", v8, v9);

}

void __68__PXPhotoKitPersonMakeKeyPhotoActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  objc_class *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((_DWORD)a2)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v8;
      v9 = "[%@] Make Key Photo succeeded.";
      v10 = v6;
      v11 = OS_LOG_TYPE_INFO;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v10, v11, v9, (uint8_t *)&v14, v12);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "stopExcludingAssetsFromDataSource");
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v5;
      v9 = "[%@] Make Key Photo failed: %@.";
      v10 = v6;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
      goto LABEL_6;
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, v5);
}

@end
