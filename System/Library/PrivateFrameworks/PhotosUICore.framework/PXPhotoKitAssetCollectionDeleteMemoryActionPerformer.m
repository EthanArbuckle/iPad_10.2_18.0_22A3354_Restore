@implementation PXPhotoKitAssetCollectionDeleteMemoryActionPerformer

- (void)_promptDeleteMemoryConfirmationWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1096, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetCollection"), v11);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1096, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetCollection"), v11, v13);

    goto LABEL_6;
  }
LABEL_3:
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXMemoriesDeleteConfirmationAlertShow(v7, v8, v5);

}

- (void)performUserInteractionTask
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __82__PXPhotoKitAssetCollectionDeleteMemoryActionPerformer_performUserInteractionTask__block_invoke;
  v2[3] = &unk_1E5147360;
  v2[4] = self;
  -[PXPhotoKitAssetCollectionDeleteMemoryActionPerformer _promptDeleteMemoryConfirmationWithCompletionHandler:](self, "_promptDeleteMemoryConfirmationWithCompletionHandler:", v2);
}

- (void)performBackgroundTask
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  PXRejectMemoriesAction *v10;
  void *v11;
  PXDeleteCollectionsAction *v12;
  void *v13;
  id v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  PXPhotoKitAssetCollectionDeleteMemoryActionPerformer *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  __CFString *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1117, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetCollection"), v17, v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1117, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetCollection"), v17);
  }

LABEL_3:
  +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deleteBehavior");

  PLMemoriesGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("delete");
    if (v6 != 1)
      v8 = 0;
    if (!v6)
      v8 = CFSTR("reject");
    v9 = v8;
    *(_DWORD *)buf = 138412546;
    v26 = v9;
    v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Will %@ memory: %@", buf, 0x16u);

  }
  if (v6 == 1)
  {
    v12 = -[PXDeleteCollectionsAction initWithCollection:]([PXDeleteCollectionsAction alloc], "initWithCollection:", v4);
  }
  else if (v6)
  {
    v12 = 0;
  }
  else
  {
    v10 = [PXRejectMemoriesAction alloc];
    v24 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PXMemoriesAction initWithMemories:](v10, "initWithMemories:", v11);

  }
  -[PXActionPerformer undoManager](self, "undoManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __77__PXPhotoKitAssetCollectionDeleteMemoryActionPerformer_performBackgroundTask__block_invoke;
  v20[3] = &unk_1E51376D8;
  v22 = self;
  v23 = v6;
  v21 = v4;
  v14 = v4;
  -[PXAction executeWithUndoManager:completionHandler:](v12, "executeWithUndoManager:completionHandler:", v13, v20);

}

void __77__PXPhotoKitAssetCollectionDeleteMemoryActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  const __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  int v21;
  __CFString *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLMemoriesGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = CFSTR("delete");
      if (v8 != 1)
        v9 = 0;
      if (v8)
        v10 = (__CFString *)v9;
      else
        v10 = CFSTR("reject");
      v11 = v10;
      v12 = *(_QWORD *)(a1 + 32);
      v21 = 138412546;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      v13 = "Did %@ memory: %@";
      v14 = v7;
      v15 = OS_LOG_TYPE_DEFAULT;
      v16 = 22;
LABEL_16:
      _os_log_impl(&dword_1A6789000, v14, v15, v13, (uint8_t *)&v21, v16);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v17 = *(_QWORD *)(a1 + 48);
    v18 = CFSTR("delete");
    if (v17 != 1)
      v18 = 0;
    if (v17)
      v19 = (__CFString *)v18;
    else
      v19 = CFSTR("reject");
    v11 = v19;
    v20 = *(_QWORD *)(a1 + 32);
    v21 = 138412802;
    v22 = v11;
    v23 = 2112;
    v24 = v20;
    v25 = 2112;
    v26 = v5;
    v13 = "Failed to %@ memory: %@, error: %@";
    v14 = v7;
    v15 = OS_LOG_TYPE_ERROR;
    v16 = 32;
    goto LABEL_16;
  }

  objc_msgSend(*(id *)(a1 + 40), "completeBackgroundTaskWithSuccess:error:", a2, v5);
}

uint64_t __82__PXPhotoKitAssetCollectionDeleteMemoryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (!a2)
    return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didConfirmDeleteOfMemory");

  v4 = (void *)MEMORY[0x1E0D09910];
  v10[0] = *MEMORY[0x1E0D09818];
  objc_msgSend(*(id *)(a1 + 32), "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = *MEMORY[0x1E0D09830];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.assetCollectionDeleted"), v8);

  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v4;
  char isKindOfClass;

  objc_msgSend(a3, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(CFSTR("InteractiveMemoryCardActionMenuItemDelete"), CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("trash");
}

+ (BOOL)isActionDestructive
{
  return 1;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeDeleteMemory"), a5);
}

@end
