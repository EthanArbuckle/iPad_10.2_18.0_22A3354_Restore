@implementation PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer

- (BOOL)_doesUserActionRequireDisambiguation:(id)a3 outResolvedAction:(id *)a4 outAlertActionsForDisambiguation:(id *)a5 alertActionHandler:(id)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  id v20;
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v21[0] = CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureTimeDate");
  v21[1] = CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureTimeDateInterval");
  v21[2] = CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureHoliday");
  v21[3] = CFSTR("PXAssetCollectionActionTypeBlockMemoryFeaturePlace");
  v21[4] = CFSTR("PXAssetCollectionActionTypeBlockMemoryFeaturePerson");
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = a3;
  objc_msgSend(v11, "arrayWithObjects:count:", v21, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v13, "containsObject:", v12);

  if ((v11 & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_blockableFeatureActions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    v14 = v17 > 1;
    if (v17 < 2)
    {
      objc_msgSend(v16, "lastObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "actionType");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = v10;
      PXMap();
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v18 = v20;
    }

  }
  return v14;
}

- (void)performUserInteractionTask
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(void *, id);
  _BOOL4 v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD aBlock[6];

  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer_performUserInteractionTask__block_invoke;
  aBlock[3] = &unk_1E5149198;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  -[PXActionPerformer actionType](self, "actionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __85__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer_performUserInteractionTask__block_invoke_2;
  v22[3] = &unk_1E511F508;
  v22[4] = self;
  v7 = v3;
  v23 = v7;
  v8 = v6;
  v24 = v8;
  v9 = v5;
  v25 = v9;
  v10 = (void (**)(void *, id))_Block_copy(v22);
  v20 = 0;
  v21 = 0;
  v11 = -[PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer _doesUserActionRequireDisambiguation:outResolvedAction:outAlertActionsForDisambiguation:alertActionHandler:](self, "_doesUserActionRequireDisambiguation:outResolvedAction:outAlertActionsForDisambiguation:alertActionHandler:", v8, &v21, &v20, v10);
  v12 = v21;
  v13 = v20;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setActions:", v13);
    v15 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedStringFromTable(CFSTR("PXBlockConfirmationDialogButtonTitle_Cancel"), CFSTR("PhotosUICore"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __85__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer_performUserInteractionTask__block_invoke_3;
    v18[3] = &unk_1E5142658;
    v19 = v9;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v17);

    -[PXActionPerformer presentViewController:](self, "presentViewController:", v14);
  }
  else
  {
    v10[2](v10, v12);
  }

}

- (BOOL)_didUserConfirmDeleteOfMemory
{
  void *v2;
  char v3;

  -[PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer userResponse](self, "userResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemory"));

  return v3;
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
  id v20;
  _QWORD v21[4];
  id v22;
  PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer *v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  __CFString *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!-[PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer _didUserConfirmDeleteOfMemory](self, "_didUserConfirmDeleteOfMemory"))
  {
    if (-[PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer isBlockingMemoryFeature](self, "isBlockingMemoryFeature"))
    {
      -[PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer userResponse](self, "userResponse");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      -[PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer applyBlacklistFeatureWithActionType:](self, "applyBlacklistFeatureWithActionType:");

    }
    else
    {
      -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 0, 0);
    }
    return;
  }
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1435, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetCollection"), v17);
LABEL_21:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1435, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetCollection"), v17, v19);

    goto LABEL_21;
  }
LABEL_4:
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
    v27 = v9;
    v28 = 2112;
    v29 = v4;
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
    v25 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PXMemoriesAction initWithMemories:](v10, "initWithMemories:", v11);

    -[PXDeleteCollectionsAction setRejectReason:](v12, "setRejectReason:", 1);
  }
  -[PXActionPerformer undoManager](self, "undoManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __80__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer_performBackgroundTask__block_invoke;
  v21[3] = &unk_1E51376D8;
  v22 = v4;
  v23 = self;
  v24 = v6;
  v14 = v4;
  -[PXAction executeWithUndoManager:completionHandler:](v12, "executeWithUndoManager:completionHandler:", v13, v21);

}

void __80__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  const __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint32_t v26;
  uint64_t v27;
  const __CFString *v28;
  __CFString *v29;
  uint64_t v30;
  int v31;
  __CFString *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((_DWORD)a2)
  {
    v6 = (void *)MEMORY[0x1E0D09910];
    v7 = *MEMORY[0x1E0D09818];
    v40[0] = *(_QWORD *)(a1 + 32);
    v8 = *MEMORY[0x1E0D09830];
    v39[0] = v7;
    v39[1] = v8;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.assetCollectionBlocked"), v11);

    v12 = (void *)MEMORY[0x1E0D09910];
    v13 = *(_QWORD *)(a1 + 32);
    v37[1] = v8;
    v38[0] = v13;
    v37[0] = v7;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.userFeedback.negative.memoryFeature.none"), v16);

    PLMemoriesGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 48);
      v19 = CFSTR("delete");
      if (v18 != 1)
        v19 = 0;
      if (v18)
        v20 = (__CFString *)v19;
      else
        v20 = CFSTR("reject");
      v21 = v20;
      v22 = *(_QWORD *)(a1 + 32);
      v31 = 138412546;
      v32 = v21;
      v33 = 2112;
      v34 = v22;
      v23 = "Did %@ memory: %@";
      v24 = v17;
      v25 = OS_LOG_TYPE_DEFAULT;
      v26 = 22;
LABEL_16:
      _os_log_impl(&dword_1A6789000, v24, v25, v23, (uint8_t *)&v31, v26);

    }
  }
  else
  {
    PLMemoriesGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v27 = *(_QWORD *)(a1 + 48);
      v28 = CFSTR("delete");
      if (v27 != 1)
        v28 = 0;
      if (v27)
        v29 = (__CFString *)v28;
      else
        v29 = CFSTR("reject");
      v21 = v29;
      v30 = *(_QWORD *)(a1 + 32);
      v31 = 138412802;
      v32 = v21;
      v33 = 2112;
      v34 = v30;
      v35 = 2112;
      v36 = v5;
      v23 = "Failed to %@ memory: %@, error: %@";
      v24 = v17;
      v25 = OS_LOG_TYPE_ERROR;
      v26 = 32;
      goto LABEL_16;
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "completeBackgroundTaskWithSuccess:error:", a2, v5);
}

uint64_t __85__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

void __85__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_memoryFeatureFromMemory:forActionType:", *(_QWORD *)(a1 + 40), v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeaturePerson")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsBlockingMemoryFeature:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setUserResponse:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "suggestLessPeopleInMemory:", *(_QWORD *)(a1 + 40));
  }
  else if (v5)
  {
    +[PXMemoriesBlacklistUtilities accessoryUIViewSpecForBlacklistedFeature:](PXMemoriesBlacklistUtilities, "accessoryUIViewSpecForBlacklistedFeature:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "confirmBlacklistingUserAction:viewSpec:", v5, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __85__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __166__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer__doesUserActionRequireDisambiguation_outResolvedAction_outAlertActionsForDisambiguation_alertActionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v3, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __166__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer__doesUserActionRequireDisambiguation_outResolvedAction_outAlertActionsForDisambiguation_alertActionHandler___block_invoke_2;
  v10[3] = &unk_1E5138AE0;
  v6 = *(id *)(a1 + 32);
  v11 = v3;
  v12 = v6;
  v7 = v3;
  objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 0, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __166__PXPhotoKitAssetCollectionBlacklistMemoryActionPerformer__doesUserActionRequireDisambiguation_outResolvedAction_outAlertActionsForDisambiguation_alertActionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "actionType");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v6;
  id v7;
  char v8;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;

  objc_msgSend(a3, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "px_isMemory"))
  {
    v8 = 0;
    goto LABEL_6;
  }
  v7 = v6;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1329, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollection"), v12);
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1329, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollection"), v12, v14);

    goto LABEL_9;
  }
LABEL_4:
  v8 = objc_msgSend(v7, "px_canPerformFeatureLessAction");

LABEL_6:
  return v8;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(CFSTR("InteractiveMemoryCardActionMenuItemFeatureLess"), CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("memories.badge.minus");
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeBlockMemory"), a5);
}

+ (BOOL)isActionDestructive
{
  return 0;
}

@end
