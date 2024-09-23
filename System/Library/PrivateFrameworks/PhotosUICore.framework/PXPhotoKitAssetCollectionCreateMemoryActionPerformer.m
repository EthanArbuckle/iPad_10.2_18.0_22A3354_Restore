@implementation PXPhotoKitAssetCollectionCreateMemoryActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didCreateMemoryViaAddToMemories");

  v4 = (void *)MEMORY[0x1E0D09910];
  v9[0] = *MEMORY[0x1E0D09818];
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v9[1] = *MEMORY[0x1E0D09830];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.memoryCreatedViaAddToMemories"), v8);

  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

- (void)performBackgroundTask
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[6];
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[3];
  char v20;

  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "addToTabSimulate");

  if (v4)
  {
    -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 1, 0);
  }
  else
  {
    -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetCollectionActionPerformer displayTitleInfo](self, "displayTitleInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetCollectionActionPerformer people](self, "people");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v20 = 0;
    objc_msgSend(v5, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77__PXPhotoKitAssetCollectionCreateMemoryActionPerformer_performBackgroundTask__block_invoke;
    v14[3] = &unk_1E513D0D8;
    v10 = v5;
    v15 = v10;
    v11 = v6;
    v16 = v11;
    v12 = v7;
    v17 = v12;
    v18 = v19;
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __77__PXPhotoKitAssetCollectionCreateMemoryActionPerformer_performBackgroundTask__block_invoke_2;
    v13[3] = &unk_1E511CB88;
    v13[4] = self;
    v13[5] = v19;
    objc_msgSend(v8, "performChanges:completionHandler:", v14, v13);

    _Block_object_dispose(v19, 8);
  }
}

void __77__PXPhotoKitAssetCollectionCreateMemoryActionPerformer_performBackgroundTask__block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD1640], "px_creationRequestForAssetCollection:displayTitleInfo:people:", a1[4], a1[5], a1[6]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserCreated:", 1);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v2 != 0;

}

void __77__PXPhotoKitAssetCollectionCreateMemoryActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  px_dispatch_on_main_queue();

}

uint64_t __77__PXPhotoKitAssetCollectionCreateMemoryActionPerformer_performBackgroundTask__block_invoke_3(uint64_t a1)
{
  _BOOL8 v1;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    v1 = *(_BYTE *)(a1 + 56) != 0;
  else
    v1 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", v1, *(_QWORD *)(a1 + 40));
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v6;
  char v7;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;

  objc_msgSend(a3, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "px_descriptionForAssertionMessage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1481, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v14, v15);

    }
    if (objc_msgSend(v6, "assetCollectionType") != 7)
    {
      objc_opt_class();
      v7 = objc_opt_isKindOfClass() ^ 1;
      goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1481, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v11);

  }
  v7 = 0;
LABEL_7:

  return v7 & 1;
}

+ (id)createBarButtonItemForAssetCollectionReference:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  objc_class *v6;
  id v7;
  void *v8;

  v6 = (objc_class *)MEMORY[0x1E0DC34F0];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithBarButtonSystemItem:target:action:", 4, v7, a5);

  return v8;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeCreateMemory"), a5);
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a5;
  if (a3 > 2)
  {
    v9 = 0;
  }
  else
  {
    PXLocalizedStringFromTable(off_1E511CBC8[a3], CFSTR("PhotosUICore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("memories.badge.plus");
}

@end
