@implementation PXPhotoKitHideAssetsActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return +[PXHideAssetsAction canPerformOnAsset:inAssetCollection:](PXHideAssetsAction, "canPerformOnAsset:inAssetCollection:", a3, a4, a5, a6);
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  void *v4;
  __CFString *v5;
  void *v6;

  +[PXPhotoKitAssetActionManager selectedAssetForActionManager:](PXPhotoKitAssetActionManager, "selectedAssetForActionManager:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isHidden"))
    v5 = CFSTR("UNHIDE_ASSET_SHORTCUT");
  else
    v5 = CFSTR("HIDE_ASSET_SHORTCUT");
  PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  void *v3;
  __CFString *v4;
  __CFString *v5;

  +[PXPhotoKitAssetActionManager selectedAssetForActionManager:](PXPhotoKitAssetActionManager, "selectedAssetForActionManager:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isHidden"))
    v4 = CFSTR("eye");
  else
    v4 = CFSTR("eye.slash");
  v5 = v4;

  return v5;
}

- (void)_setupActionWithAssets:(id)a3
{
  id v4;
  PXHideAssetsAction *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];
  _QWORD v10[4];
  id v11;
  PXPhotoKitHideAssetsActionPerformer *v12;

  v4 = a3;
  v5 = -[PXHideAssetsAction initWithAssets:]([PXHideAssetsAction alloc], "initWithAssets:", v4);
  -[PXPhotoKitHideAssetsActionPerformer set_action:](self, "set_action:", v5);
  if (-[PXHideAssetsAction isHidden](v5, "isHidden"))
  {
    -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__PXPhotoKitHideAssetsActionPerformer__setupActionWithAssets___block_invoke;
    v10[3] = &unk_1E5142AB0;
    v11 = v4;
    v12 = self;
    objc_msgSend(v6, "presentAlertWithConfigurationHandler:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      PXAssertGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Failed to present the hide assets confirmation alert", v9, 2u);
      }

      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
    }

  }
  else
  {
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }

}

- (void)performUserInteractionTask
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
  v5[2] = __65__PXPhotoKitHideAssetsActionPerformer_performUserInteractionTask__block_invoke;
  v5[3] = &unk_1E5142AD8;
  objc_copyWeak(&v6, &location);
  PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)performBackgroundTask
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[PXPhotoKitAssetActionPerformer instantlyExcludeAssetsFromDataSource](self, "instantlyExcludeAssetsFromDataSource");
  -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 1, 0);
  -[PXPhotoKitHideAssetsActionPerformer _action](self, "_action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer undoManager](self, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PXPhotoKitHideAssetsActionPerformer_performBackgroundTask__block_invoke;
  v5[3] = &unk_1E5148B78;
  v5[4] = self;
  objc_msgSend(v3, "executeWithUndoManager:completionHandler:", v4, v5);

}

- (PXHideAssetsAction)_action
{
  return self->__action;
}

- (void)set_action:(id)a3
{
  objc_storeStrong((id *)&self->__action, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__action, 0);
}

uint64_t __60__PXPhotoKitHideAssetsActionPerformer_performBackgroundTask__block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "stopExcludingAssetsFromDataSource");
  return result;
}

void __65__PXPhotoKitHideAssetsActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
    objc_msgSend(WeakRetained, "_setupActionWithAssets:", v10);
  else
    objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", 0, v6);

}

void __62__PXPhotoKitHideAssetsActionPerformer__setupActionWithAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v3 = a2;
  PLSuffixForItems();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "count");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXPhotoKitHideAssetsActionConfirmationMessage_%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v6, CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringWithValidatedFormat(v7, CFSTR("%lu"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXPhotoKitHideAssetsActionConfirmationActionTitle_%@"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v9, CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  PXLocalizedStringWithValidatedFormat(v10, CFSTR("%lu"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedStringFromTable(CFSTR("PXPhotoKitHideAssetsActionConfirmationActionTitle_Cancel"), CFSTR("PhotosUICore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v8, v14);
  objc_msgSend(v3, "setStyle:", 0);
  v13 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__PXPhotoKitHideAssetsActionPerformer__setupActionWithAssets___block_invoke_2;
  v16[3] = &unk_1E5149198;
  v16[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "addActionWithTitle:style:action:", v11, 2, v16);
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __62__PXPhotoKitHideAssetsActionPerformer__setupActionWithAssets___block_invoke_3;
  v15[3] = &unk_1E5149198;
  v15[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "addActionWithTitle:style:action:", v12, 1, v15);

}

uint64_t __62__PXPhotoKitHideAssetsActionPerformer__setupActionWithAssets___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

uint64_t __62__PXPhotoKitHideAssetsActionPerformer__setupActionWithAssets___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

@end
