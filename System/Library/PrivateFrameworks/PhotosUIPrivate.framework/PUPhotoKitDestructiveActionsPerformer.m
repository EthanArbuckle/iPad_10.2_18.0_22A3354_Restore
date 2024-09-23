@implementation PUPhotoKitDestructiveActionsPerformer

- (int64_t)destructivePhotosAction
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetActionManager.m"), 825, CFSTR("Concrete subclass must implement %@"), v5);

  return 0;
}

- (BOOL)shouldConfirmDestructiveAction
{
  return 1;
}

- (void)performUserInteractionTask
{
  int64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  int64_t v12;
  _QWORD v13[6];
  _QWORD v14[3];
  char v15;

  v3 = -[PUPhotoKitDestructiveActionsPerformer destructivePhotosAction](self, "destructivePhotosAction");
  -[PUAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D7B718]);
  -[PUAssetActionPerformer undoManager](self, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithAction:assets:undoManager:delegate:", v3, v4, v6, self);

  objc_msgSend(v7, "setShouldSkipDeleteConfirmation:", -[PUPhotoKitDestructiveActionsPerformer shouldConfirmDestructiveAction](self, "shouldConfirmDestructiveAction") ^ 1);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__PUPhotoKitDestructiveActionsPerformer_performUserInteractionTask__block_invoke;
  v13[3] = &unk_1E58AAE48;
  v13[4] = self;
  v13[5] = v14;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__PUPhotoKitDestructiveActionsPerformer_performUserInteractionTask__block_invoke_2;
  v9[3] = &unk_1E58A51F8;
  v11 = v14;
  v9[4] = self;
  v8 = v4;
  v10 = v8;
  v12 = v3;
  objc_msgSend(v7, "performWithWillDeleteHandler:completionHandler:", v13, v9);

  _Block_object_dispose(v14, 8);
}

- (void)deletePhotosActionController:(id)a3 presentConfirmationViewController:(id)a4
{
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  if (!-[PUAssetActionPerformer presentViewController:](self, "presentViewController:", a4))
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "Failed to present delete confirmation. User must confirm to perform removal.", v7, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present delete confirmation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v6);

  }
}

- (void)deletePhotosActionController:(id)a3 dismissConfirmationViewController:(id)a4
{
  -[PUAssetActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", a4, 0);
}

uint64_t __67__PUPhotoKitDestructiveActionsPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (result == 10)
  {
    objc_msgSend(*(id *)(a1 + 32), "instantlyExcludeAssetsFromDataSource");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }
  return result;
}

void __67__PUPhotoKitDestructiveActionsPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "stopExcludingAssetsFromDataSource");
  v4 = objc_msgSend(*(id *)(a1 + 32), "state");
  v5 = *(void **)(a1 + 32);
  if (v4 == 10)
  {
    objc_msgSend(v5, "completeUserInteractionTaskWithSuccess:error:", a2, 0);
  }
  else if (objc_msgSend(v5, "state") == 20)
  {
    objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, 0);
  }
  if ((_DWORD)a2 && objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    PXCPAnalyticsEventNameForDeletePhotosAction();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0D09910];
      v11[0] = *MEMORY[0x1E0D09830];
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1] = *MEMORY[0x1E0D09828];
      v12[0] = v9;
      v12[1] = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sendEvent:withPayload:", v6, v10);

    }
  }
}

@end
